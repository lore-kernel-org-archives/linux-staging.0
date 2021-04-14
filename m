Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F6C271
	for <linux-staging@lists.linux.dev>; Wed, 14 Apr 2021 20:06:35 +0000 (UTC)
IronPort-SDR: 7/nb3RhSUs70WJmaossyBVPrTun1YTz+Lh2e5UnSLteQ/Ioq2OfN8YI9tKJDzBcd38c62mQKSW
 FEjJNGti7iig==
X-IronPort-AV: E=McAfee;i="6200,9189,9954"; a="258688942"
X-IronPort-AV: E=Sophos;i="5.82,223,1613462400"; 
   d="scan'208";a="258688942"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2021 13:06:34 -0700
IronPort-SDR: /F/n8F7lMm7e3GOVharWdu5rWXP8oSpLWbns0yEtrIrJZjMsOoYOhObCXE3k+ZJHuJvBwiCMCE
 GPLVAO67U3gg==
X-IronPort-AV: E=Sophos;i="5.82,223,1613462400"; 
   d="scan'208";a="532893966"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2021 13:06:32 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
	by paasikivi.fi.intel.com (Postfix) with ESMTP id 66643204F8;
	Wed, 14 Apr 2021 23:06:30 +0300 (EEST)
Date: Wed, 14 Apr 2021 23:06:30 +0300
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: ascordeiro <alinesantanacordeiro@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com
Subject: Re: [PATCH] staging: media: atomisp: pci: Format multi-line comments
 according to coding-style in file atomisp_cmd.c
Message-ID: <20210414200630.GE3@paasikivi.fi.intel.com>
References: <20210414182755.GA2799@focaruja>
 <20210414183325.GD3@paasikivi.fi.intel.com>
 <fae832b2555f1d971b45fcdfe34952aa03a42e4d.camel@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fae832b2555f1d971b45fcdfe34952aa03a42e4d.camel@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Wed, Apr 14, 2021 at 03:55:42PM -0300, ascordeiro wrote:
> Em qua, 2021-04-14 às 21:33 +0300, Sakari Ailus escreveu:
> > Hi Aline,
> > 
> > Thanks for the patch.
> > 
> > On Wed, Apr 14, 2021 at 03:27:55PM -0300, Aline Santana Cordeiro
> > wrote:
> > > Format multi-line comments according to the coding-style.
> > > Issue detected by checkpatch.pl.
> > > 
> > > Signed-off-by: Aline Santana Cordeiro <
> > > alinesantanacordeiro@gmail.com>
> > > ---
> > >  drivers/staging/media/atomisp/pci/atomisp_cmd.c | 109
> > > ++++++++++++++----------
> > >  1 file changed, 65 insertions(+), 44 deletions(-)
> > > 
> > > diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
> > > b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
> > > index 592ea99..6113785 100644
> > > --- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
> > > +++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
> > > @@ -67,7 +67,8 @@
> > >   * At 15fps this means 133ms. We set the timeout a bit longer.
> > >   * Each flash driver is supposed to set its own timeout, but
> > >   * just in case someone else changed the timeout, we set it
> > > - * here to make sure we don't damage the flash hardware. */
> > > + * here to make sure we don't damage the flash hardware.
> > > + */
> > >  #define FLASH_TIMEOUT 800 /* ms */
> > >  
> > >  union host {
> > > @@ -562,7 +563,8 @@ irqreturn_t atomisp_isr(int irq, void *dev)
> > >                          * and driver needs to keep old
> > > sequence_temp value.
> > >                          * NOTE: There is assumption here that ISP
> > > will not
> > >                          * start processing next frame from sensor
> > > before old
> > > -                        * one is completely done. */
> > > +                        * one is completely done.
> > > +                        */
> > >                         if (atomic_read(&asd->sequence) ==
> > > atomic_read(
> > >                                 &asd->sequence_temp))
> > >                                 atomic_set(&asd->sequence_temp,
> > > @@ -1247,7 +1249,8 @@ void atomisp_buf_done(struct
> > > atomisp_sub_device *asd, int error,
> > >  
> > >         if (IS_ISP2401) {
> > >                 /* If there are no buffers queued then
> > 
> > This should begin with:
> > 
> >                 /*
> >                  *
> > 
> > And the same for the rest. Apart from this the patch seems fine.
> > 
> Hi Sakari,
> 
> I'm going to send a v2 correcting all the multi-line comments that are
> not beginning like this.
> 
> Besides, there are single line comments with different styles, a few
> like this:
> 
> case 1:				/* comment */
> 
> and the other like this:
> 				/*
> case2:				 * comment
>  				 */
> 
> Should I standardize these ones to the first case?

The first one is preferred for multi-line comments. But please keep under
80 characters per line.

> 
> Thank you for yout attention,

You're welcome!

-- 
Kind regards,

Sakari Ailus
