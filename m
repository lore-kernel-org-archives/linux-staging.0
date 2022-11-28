Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7F3520E2
	for <linux-staging@lists.linux.dev>; Mon, 28 Nov 2022 07:53:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCB8BC433C1;
	Mon, 28 Nov 2022 07:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1669622013;
	bh=um03zoPpxKsSPE+M2zpAJXsHvH/peut6tDHzA78ZNoM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Jkdq03L2qV0u5uszScn4GnxkJ4wH4lW1f++a+IEgzYsJg5muigr6IoZU5+L2o4XUU
	 EbPVIDsb1DEBMWPOGkAU/p4KGA0byXjOTXP8C/yFqHTVUblSV4zr1LgMi4lXsQ86eZ
	 CXSB8knab1krmTsd5FbaPDmuVIU2Y1kjY/NjfNTk=
Date: Mon, 28 Nov 2022 08:53:28 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Deepak R Varma <drv@mailo.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	gustavoars@kernel.org
Subject: Re: [PATCH] staging: wlan-ng: Replace zero-length arrays with
 DECLARE_FLEX_ARRAY() helper
Message-ID: <Y4Ro+Ex+E1WemSrs@kroah.com>
References: <Y3YKhee8L+kAfHM4@qemulion>
 <Y3YvGdkyGm7azGg4@kroah.com>
 <Y3Y1N6AwWEXLpSrx@qemulion>
 <Y3Z3aatcaISvqURJ@kroah.com>
 <Y3jqUpNOygJ4+2jy@qemulion>
 <Y4RnJyiCDYavLAJq@qemulion>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y4RnJyiCDYavLAJq@qemulion>

On Mon, Nov 28, 2022 at 01:15:43PM +0530, Deepak R Varma wrote:
> On Sat, Nov 19, 2022 at 08:08:15PM +0530, Deepak R Varma wrote:
> > On Thu, Nov 17, 2022 at 07:03:21PM +0100, Greg Kroah-Hartman wrote:
> > > On Thu, Nov 17, 2022 at 06:50:55PM +0530, Deepak R Varma wrote:
> > > > On Thu, Nov 17, 2022 at 01:54:49PM +0100, Greg Kroah-Hartman wrote:
> > > > > On Thu, Nov 17, 2022 at 03:48:45PM +0530, Deepak R Varma wrote:
> > > > > >
> > > > > >  struct hfa384x_pdr_refdac_measurements {
> > > > > > -	u16 value[0];
> > > > > > +	DECLARE_FLEX_ARRAY(u16, value);
> > > > > >  } __packed;
> > > > >
> > > > > Why?  This structure is never used anywhere, right?  So why is this
> > > > > needed to be changed and not just removed entirely?  Same for the other
> > > > > structures in this patch.
> > > >
> > > > Hello Greg,
> > > > I am unable to confirm that these structures are truly not needed in the absence
> > > > if a real device based testing. I could only validate that using the compile
> > > > build and driver loading.
> > >
> > > Think this through, if no one is actually using this structure, and it
> > > is of 0 size, then do you think it is being used?
> >
> > Hello Greg,
> > I did not find any memory allocation for these zero length array structures.
> > Also, the union or its enclosing structure do not appear to access the members.
> > Hence I am leaning towards concluding that these zero length array structures do
> > not appear to be necessary.
> >
> > There are a few other structures that are part of the same union, however, they
> > too do not appear to be used for accessing the memory assigned to the union [or
> > its enclosing structure]. I think most of the members of these unions can be
> > replaced by one max size structure of this union [e.g. struct
> > hfa384x_pdr_mkk_measurements].
> >
> > Could you please comment if I am reading the code right?
> >
> > For your quick reference, the zero length structure declaration are online 963
> > whereas the union is on line number 1080 of the file drivers/staging/wlan-ng/hfa384x.h
> 
> Hello Greg,
> can you please suggest how should I approach this clean-up/correction?

Sorry, but I do not have the bandwidth to help out with this.  I will
gladly review changes submitted only.

greg k-h
