Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48D787C
	for <linux-staging@lists.linux.dev>; Mon, 28 Mar 2022 16:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1648483984; x=1680019984;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1K00Uy2bjZkVdoEOhcJO6s0f7diS2FE9HUV9VPPi8yw=;
  b=LYttew5cwb4WmOAZiqnywRsUE2edULY8E9pXVuVjVGG+KAogCTmfHcmd
   /t/bN5CEDLDijWXfxt60y8/GSQ9ksKADJiY+JO9OM76qAr8iR7mWm4qY1
   r+ORcH6mdl30sScLrQVL/HHMNY9D7Rj5VRsEbJWDVmGpWxopY+RUxF5sP
   nETz3fOxRW6t2fKBy74Dx1uY0bS20CYqTmFXIt250M7jMyuoxuz17v6hv
   fpamij6Q39iB1CZ/nchOFxgdM53h2CkUY88YsPawR8xUrzt9OMW69f4Ho
   nxfN68yiLqBT/NB0wL/tuZf3CjHJ7dEXK9tF60jweXRhVZVaRr+V8XiN9
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10300"; a="259009593"
X-IronPort-AV: E=Sophos;i="5.90,217,1643702400"; 
   d="scan'208";a="259009593"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2022 09:11:59 -0700
X-IronPort-AV: E=Sophos;i="5.90,217,1643702400"; 
   d="scan'208";a="521075979"
Received: from allenzho-mobl.amr.corp.intel.com (HELO localhost) ([10.212.109.43])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2022 09:11:57 -0700
Date: Mon, 28 Mar 2022 09:11:56 -0700
From: Ira Weiny <ira.weiny@intel.com>
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Benjamin Philip <benjamin.philip495@gmail.com>,
	Bart Van Assche <bvanassche@acm.org>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Charlie Sands <sandsch@northvilleschools.net>,
	Mitali Borkar <mitaliborkar810@gmail.com>,
	Colin Ian King <colin.king@intel.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	iweiny@gmail.com, ira.weiny@intel.com
Subject: Re: [PATCH] staging: rts5208: Convert kmap() to kmap_local_page()
Message-ID: <YkHeTCGdnGPjW0/9@iweiny-desk3>
References: <20220328112440.17756-1-fmdefrancesco@gmail.com>
 <YkHXQRmExRFioEBN@iweiny-desk3>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YkHXQRmExRFioEBN@iweiny-desk3>

On Mon, Mar 28, 2022 at 08:41:53AM -0700, Ira Weiny wrote:
> On Mon, Mar 28, 2022 at 01:24:40PM +0200, Fabio M. De Francesco wrote:
> > The use of kmap() is being deprecated and kmap_local_page() is faster.
> > Use kmap_local_page() in place of kmap().
> 
> Thanks for the patch!  I have just a couple of comments.
> 
> kmap_local_page() is not necessarily faster than kmap() but it is more correct
> in this case.  You should mention why.
> 
> Also to help with kmap_local_page() there are a number of helpers implemented
> in highmem.h for things like memcpy, memmove, etc.
> 
> Check out memcpy_page() for this use case.
> 
> Thank you!
> Ira
> 

Also I believe this is work toward the Outreachy program.  If so be sure to
follow the guidelines on this page:

https://kernelnewbies.org/Outreachyfirstpatch

In particular, it does not look like you cc'ed the Outreachy list.

Thanks!
Ira

> > 
> > Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
> > ---
> >  drivers/staging/rts5208/rtsx_transport.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/staging/rts5208/rtsx_transport.c b/drivers/staging/rts5208/rtsx_transport.c
> > index 805dc18fac0a..de690d7ee5e3 100644
> > --- a/drivers/staging/rts5208/rtsx_transport.c
> > +++ b/drivers/staging/rts5208/rtsx_transport.c
> > @@ -92,13 +92,13 @@ unsigned int rtsx_stor_access_xfer_buf(unsigned char *buffer,
> >  			while (sglen > 0) {
> >  				unsigned int plen = min(sglen, (unsigned int)
> >  						PAGE_SIZE - poff);
> > -				unsigned char *ptr = kmap(page);
> > +				unsigned char *ptr = kmap_local_page(page);
> >  
> >  				if (dir == TO_XFER_BUF)
> >  					memcpy(ptr + poff, buffer + cnt, plen);
> >  				else
> >  					memcpy(buffer + cnt, ptr + poff, plen);
> > -				kunmap(page);
> > +				kunmap_local(ptr);
> >  
> >  				/* Start at the beginning of the next page */
> >  				poff = 0;
> > -- 
> > 2.34.1
> > 
