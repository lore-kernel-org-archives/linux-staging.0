Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43C7AED5;
	Fri,  1 Apr 2022 09:09:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A24CC2BBE4;
	Fri,  1 Apr 2022 09:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1648804143;
	bh=MOGtfJobPi0ZSab1gabpQOfmpSETqgpVKmTH8A1H2PQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q/KGEFkj9oWQynZ+Z20+nsb5t/AJ5qsXg1sK+TUpusQF3ymkYnD/WUq1ZDMqkFUSK
	 dc7I0WMpI26Dr3z/gqLcy0ll4A1LnWjY/4gbLcoTGnCGBnxP9KLI6EkmU9khutZZGl
	 zldgmY7TCprnpG7K7ez+Gy22oCfZ+VXmPSIyjFoE=
Date: Fri, 1 Apr 2022 11:09:00 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Cc: Nicolas Saenz Julienne <nsaenz@kernel.org>,
	bcm-kernel-feedback-list@broadcom.com,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, ira.weiny@intel.com,
	outreachy@lists.linux.dev
Subject: Re: [PATCH] staging: vc04_services: Convert kmap() to
 kmap_local_page()
Message-ID: <YkbBLCzkJCBamdKs@kroah.com>
References: <20220330191414.23141-1-fmdefrancesco@gmail.com>
 <3162339.aeNJFYEL58@leap>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3162339.aeNJFYEL58@leap>

On Fri, Apr 01, 2022 at 10:07:36AM +0200, Fabio M. De Francesco wrote:
> On mercoledì 30 marzo 2022 21:14:14 CEST Fabio M. De Francesco wrote:
> > The use of kmap() is being deprecated in favor of kmap_local_page()
> > where it is feasible. In file interface/vchiq_arm/vchiq_arm.c,
> > function free_pagelist() calls kmap() / kunmap() from two places.
> > 
> > With kmap_local_page(), the mapping is per thread, CPU local and not
> > globally visible. Therefore, free_pagelist() is a function where the
> > use of kmap_local_page() in place of kmap() is correctly suited.
> > 
> > Convert to kmap_local_page() but, instead of open coding it, use the
> > memcpy_to_page() helper.
> > 
> > Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
> > ---
> >  .../vc04_services/interface/vchiq_arm/vchiq_arm.c   | 13 +++++--------
> >  1 file changed, 5 insertions(+), 8 deletions(-)
> > 
> > diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> > index f0bfacfdea80..efb1383b5218 100644
> > --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> > +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> > @@ -431,21 +431,18 @@ free_pagelist(struct vchiq_pagelist_info *pagelistinfo,
> >  			if (head_bytes > actual)
> >  				head_bytes = actual;
> >  
> > -			memcpy((char *)kmap(pages[0]) +
> > +			memcpy_to_page(pages[0],
> >  				pagelist->offset,
> >  				fragments,
> >  				head_bytes);
> > -			kunmap(pages[0]);
> >  		}
> >  		if ((actual >= 0) && (head_bytes < actual) &&
> > -		    (tail_bytes != 0)) {
> > -			memcpy((char *)kmap(pages[num_pages - 1]) +
> > -				((pagelist->offset + actual) &
> > -				(PAGE_SIZE - 1) & ~(g_cache_line_size - 1)),
> > +		    (tail_bytes != 0))
> > +			memcpy_to_page(pages[num_pages - 1],
> > +				(pagelist->offset + actual) &
> > +				(PAGE_SIZE - 1) & ~(g_cache_line_size - 1),
> >  				fragments + g_cache_line_size,
> >  				tail_bytes);
> > -			kunmap(pages[num_pages - 1]);
> > -		}
> >  
> >  		down(&g_free_fragments_mutex);
> >  		*(char **)fragments = g_free_fragments;
> > -- 
> > 2.34.1
> > 
> Hi Greg,
> 
> I've just received a message from you that says that a patch that I sent
> on March 31 has been applied to staging testing. I know that you usually
> apply patches in first come first served fashion (FIFO), therefore I wonder
> why this patch has not yet been applied.
> 
> Please don't misunderstand me: I have no hurry. I'm asking only because 
> I suspect that this patch, sent on March 30th) could have been overlooked 
> since it has the very identical subject of another patch that I sent on 
> the same day (or the day before, I'm not sure about it now) and which has 
> already been applied. Therefore, they may appear to be the same patch,
> because the only difference is that the drivers are different.

I wanted to give others the chance to review this before applying it :)
