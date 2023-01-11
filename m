Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3824F17EF
	for <linux-staging@lists.linux.dev>; Wed, 11 Jan 2023 09:25:54 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id y5so10946337pfe.2
        for <linux-staging@lists.linux.dev>; Wed, 11 Jan 2023 01:25:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=REWsaUl6PIGZxGjQDNsHgylq9u4efBb5hD+0H4Wo0bU=;
        b=DAi6i88V4NfTBA3ydSUaOJpxJJQcem5npBHw5b3086UW5fnXJ68u+Vs8pEQU8R9ROk
         r4xIwDOPH/fQH7p+0PvEm2d/7UvRk5OdWXb9NpoD9QqgIYsV1lIRRAU6rHWdWFhqSTI0
         FJY5DtdqTtZdv1E3rFIZ881IS7D8PxfXyvSVlSjAIguTioFkzKfQ72weJN4QjY2C5VHe
         SgufQFcQtn6K2pW/g2pe8zsO0WNcXsxgcUqY2YR1ewvZdk+FY6T4R8OFipAS0xSN3cZD
         vU/sMbVESwZooe5CzKStfzZ8p03aQcmCFonFUtpmsayHUkJypjBu3r9NEBbZ1EdhmPxG
         BeiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=REWsaUl6PIGZxGjQDNsHgylq9u4efBb5hD+0H4Wo0bU=;
        b=FUzb46OkN2tfGEc8OtSOYisdfbjZMrA5LHjXpbGAftwtBFfCjfHPHve0wAkeeFEFeU
         DGXJslQYr1uaOEuS3eU66DRZL1SBUqa+o2hqFVQOnhRLf8vS43FW2qcwRtee1fqf2B+W
         q0mxwEEkCRykzcJ8sIYjdWJpMBz2Kf/mFhjCZnc3OIL6ZrZGlkxnYDaeGd5trdOss8KN
         4B8wMxpGQViOKHQ29kBF1I8dTzPZ0OygwjoCbV/bsT5IhvoxI2IgNUk4lIChnzKHxBGZ
         /L6vLp+VBWQPL+9cU2OA+XJi4cfJT4wYJnOD0yCSMHRmrRYReKUF5AGmBhIH+ip/Pamp
         xc+w==
X-Gm-Message-State: AFqh2kqkd46kSl9hM8OPGHXOeqpXQ6vsbT7VTAUDFwc7dwLLal74SyOy
	z6Q9WWrkkGY/mVxTmMRHhnD27ti2Ly4/GCbM
X-Google-Smtp-Source: AMrXdXuM/Sv1/zsrNTggBgsMKA2XF1F6XVWod6lpFBepCUuB6CxuG01EPVUGvRxXxUeN1XUhuCgiXA==
X-Received: by 2002:a05:6a00:27a5:b0:583:63eb:581e with SMTP id bd37-20020a056a0027a500b0058363eb581emr17019609pfb.18.1673429153635;
        Wed, 11 Jan 2023 01:25:53 -0800 (PST)
Received: from gaurav-pc.bbrouter ([2402:e280:217b:6d8:bf67:b774:ee50:1dc5])
        by smtp.gmail.com with ESMTPSA id v67-20020a622f46000000b00581ad007a9fsm9488599pfv.153.2023.01.11.01.25.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jan 2023 01:25:53 -0800 (PST)
Date: Wed, 11 Jan 2023 14:55:29 +0530
From: Gaurav Pathak <gauravpathak129@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: f.fainelli@gmail.com, bcm-kernel-feedback-list@broadcom.com,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: vchiq_arm.c: Declare vchiq_platform_init as
 static
Message-ID: <Y76AiY2a02aSVp+r@gaurav-pc.bbrouter>
References: <20230111080124.32274-1-gauravpathak129@gmail.com>
 <Y756tY0wRxl/jamp@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y756tY0wRxl/jamp@kroah.com>


Hi Greg,

After submitting the patch, I realized this is the duplicate patch of https://www.spinics.net/lists/arm-kernel/msg976512.html
I am in the process of reproducing the issue reported by kernel test robot in the original patch submission. 
If I am successful, I will try to fix other warnings.

Best,
Gaurav

On Wed, Jan 11, 2023 at 10:00:37AM +0100, Greg KH wrote:
> On Wed, Jan 11, 2023 at 01:31:24PM +0530, Gaurav Pathak wrote:
> > Modified vchiq_platform_init() as static to fix sparse warning
> > > warning: symbol 'vchiq_platform_init' was not declared. Should it be
> > > static?
> 
> Put the warning line all on one line, no need to wrap that.
> 
> > Signed-off-by: Gaurav Pathak <gauravpathak129@gmail.com>
> > ---
> >  drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> > index dc33490ba7fb..ffa517077b80 100644
> > --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> > +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> > @@ -462,7 +462,7 @@ free_pagelist(struct vchiq_instance *instance, struct vchiq_pagelist_info *pagel
> >  	cleanup_pagelistinfo(instance, pagelistinfo);
> >  }
> >  
> > -int vchiq_platform_init(struct platform_device *pdev, struct vchiq_state *state)
> > +static int vchiq_platform_init(struct platform_device *pdev, struct vchiq_state *state)
> >  {
> >  	struct device *dev = &pdev->dev;
> >  	struct vchiq_drvdata *drvdata = platform_get_drvdata(pdev);
> > -- 
> > 2.39.0
> > 
> > 
> 
> What changed to enable this version of the patch to work properly
> compared to the previous submissions that broke the build?  Did you test
> this and it now works properly?
> 
> thanks,
> 
> greg k-h
