Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3784C2EF653
	for <linux-staging@lists.linux.dev>; Thu, 26 Jun 2025 20:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750968706; cv=none; b=aWA0iwlIz5+5ytCje86p6v7l6B7P+9ewnfpx3mrIXcfuyyUMBmy5niDp3/tj1Y+I9PIdQIb2ObeAvYRQQT2vUA3+jSMsEiZh0CXJGdz2lHvJVsGmUYUtJ5J/wlpibasnzj5uoHaozSsEsgfRGMXcfSPsmB5FDH7ifEiOhfiver8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750968706; c=relaxed/simple;
	bh=dv8i+ER5+NkYyx9vElx2GjhZMNV7mUmAid3ueyB2dW0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FX+o2QWLAAPLymfBgnCbrGtAWcCzdp98vYbmSw5F449Mp4i/affm7Ci4gsV25+Edqmy6K20oXMbuSUmGRfcHisguH8fJ/RGZiEtH+Fkz62BjUaULK6Dx9r60T3LsbRbY7JrxPfAlq/n+AKamOn/Tn4I2DHzcvZvob7EHYsSVWGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nQmX8r/5; arc=none smtp.client-ip=209.85.160.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nQmX8r/5"
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-2efa219b5bbso363743fac.0
        for <linux-staging@lists.linux.dev>; Thu, 26 Jun 2025 13:11:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750968702; x=1751573502; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DdbUq5FWdJghT4h/JjubAGfMLvpsjI7mA2zXcnSbP4g=;
        b=nQmX8r/5c0jBvGwj2PuttMjFJPu8iSGK6niFVvcLkEEvs24p1qR+jGTd4K4XpuO6zH
         APcpGvOOhZOVxbHjP1rRMKUif04VjkNwEja4LM2iOommt1GJAJisKKOekhYkbddmWnfP
         a/hFWxyKQi8R957Br/rpZBEuqvc3r4B/kaVkRvOx/jUxOM2bQKdPS0BO4NynESkhIzT2
         lJpAwZtoyzCnHlGDnoUp4cROPqtjk3y5jvoUFv81wWIHiyXroRWBCJJcSv48gSQsLY1d
         6PikHnRMWfMBExMYGSfLqX7VB3EbUQpnrgyvoUH4xfCjQ3dv1F1jd+Rl0SaWRoAzF4SI
         YUMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750968702; x=1751573502;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DdbUq5FWdJghT4h/JjubAGfMLvpsjI7mA2zXcnSbP4g=;
        b=suQMMA3RMhmx5xKwRwGw1KASOVaXOxpu4bc3TcPjZH2daTGBFc/Z5xwdMzQsfsfhEc
         VW9z55GxFev7yocn7CMKdG5A+SZ6WI10l30akl93B+5EaWzudDrRA6d/npRM2hgWdf7a
         zHJSZqVk7H5RYJwrXI8mCfNiqXhm/28O8tJDJN5IGbO3MrayO9CoBSawmv0zUDocR/+J
         DteL7YDY8MAN56679EMBZzHx+PYQzTp5IqblXjCLS3tNEzIly710LnLRQ7rDzfftBHA3
         bdPCrMs0y+oILpc6UImSzbVSmRBLCEE4fHC2Q7GU9tmr1hzqJpqdebXP8VwaOPV4DhG1
         J0fw==
X-Forwarded-Encrypted: i=1; AJvYcCX7n/X8nSyE7omo2LlnlZqllo7CRzfGqaccAtb4ebKc6lV/C3IE+Cic+8IzdCnDCZhXEG9HuEo3n7rMq8uR@lists.linux.dev
X-Gm-Message-State: AOJu0YyaJMDEOhTQuDOnIUZXosrW/LVyQEhTzNAm5VCSzOSCvBTq83EZ
	vy/iipCtwuabT5rzyTizQA9vXk85i5R475IcwA/9vQ6NECv5H90iKwIE2gI4qkuY51s=
X-Gm-Gg: ASbGncuDE8GZ//JP8H4251mBwNl5IF+A6UIZcJs1LcKWH0HRKhh2BU5X0w64C4bfZDD
	ABCRtI3mQ7ResHiUnBkWESPLd8KvDRcVLGplnoFUEwUgXhbtqmjrzGNpfwd4/DaGn2ePMKHWKIz
	Fe+7O7mBNV1YJGDVj4+WL5iZfsVUvzcHUPAYeoW32v9mYWvTv08E77ZWNYoToNDIVrGqN6qojJA
	fWZNAgsgBDXueV0FkX2txKW/TuSi9G4JdZ6K/lVaCL79d5XNpDmGXQM7EF1EgsOcV7UY7VfZvRL
	8b31N0TLu/uEe+dNRa/pr5of7aeMfelUZxURIi6+bMf8mBH8SuA0W5zEKsAIftNlxPxq
X-Google-Smtp-Source: AGHT+IFg2nQff2Lhmdlw/pyysFVbUjX9x2OsHwDegwLfzTwSuU9M/XoGhqdFda6acuF09hZL3XGMBg==
X-Received: by 2002:a05:6870:6193:b0:2d4:c4d8:a4d0 with SMTP id 586e51a60fabf-2efed79348fmr230128fac.33.1750968702141;
        Thu, 26 Jun 2025 13:11:42 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:154:5a01:d5a1:16d6])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2efd50fa38asm513196fac.40.2025.06.26.13.11.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 13:11:41 -0700 (PDT)
Date: Thu, 26 Jun 2025 23:11:39 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Abdun Nihaal <abdun.nihaal@gmail.com>, andy@kernel.org,
	gregkh@linuxfoundation.org, lorenzo.stoakes@oracle.com,
	tzimmermann@suse.de, riyandhiman14@gmail.com, willy@infradead.org,
	notro@tronnes.org, thomas.petazzoni@free-electrons.com,
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: fbtft: fix potential memory leak in
 fbtft_framebuffer_alloc()
Message-ID: <0327da98-8a7c-4db8-8bcd-4179b87a9486@suswa.mountain>
References: <20250626172412.18355-1-abdun.nihaal@gmail.com>
 <aF2Ic8BP0zWS6R19@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aF2Ic8BP0zWS6R19@smile.fi.intel.com>

On Thu, Jun 26, 2025 at 08:50:43PM +0300, Andy Shevchenko wrote:
> On Thu, Jun 26, 2025 at 10:54:10PM +0530, Abdun Nihaal wrote:
> > In the error paths after fb_info structure is successfully allocated,
> > the memory allocated in fb_deferred_io_init() for info->pagerefs is not
> > freed. Fix that by adding the cleanup function on the error path.
> 
> Thanks for the report and the fix! My comments below.
> 
> ...
> 
> >  release_framebuf:
> > +	fb_deferred_io_cleanup(info);
> >  	framebuffer_release(info);
> 
> While the fix sounds good, there are still problems in the driver in this area:
> 
> 1) managed resources allocation is mixed up with plain allocations
> (as you discovery hints);
> 
> 2) the order in fbtft_framebuffer_release() is asymmetrical to what
> we have in fbtft_framebuffer_alloc().
> 
> I would recommend to study this code a bit more and provide the following
> patches as a result:
> 
> 1) fixing the order in fbtft_framebuffer_release();
> 
> 2) moving vmem allocation closer to when it's needed, i.e. just after
> successful allocation of the info; at the same time move txbuf allocation
> from managed to unmanaged (drop devm, add respective kfree() calls where
> it's required);
> 


Symetrical in this sense means that the cleanup in
fbtft_framebuffer_release() and in fbtft_framebuffer_alloc() are
similar:

	fb_deferred_io_cleanup();
	vfree();
 	framebuffer_release();

I feel like number 1 and 2 are sort of opposite approaches to making the
order symmetrical.  #1 is changing fbtft_framebuffer_release() and #2 is
changing fbtft_framebuffer_alloc().  #2 is the less awkward approach.

> 3) this patch.
> 
> All three should have the respective Fixes tags and hence may be backported.

Changing the order isn't a bug fix so it wouldn't get a Fixes tag.
I agree with Andy that the code isn't beautiful.  But I think it's
easier to just fix the bug, and do the cleanup later as an optional
patch 2/2.  I would also have been fine with a larger patch that does
the cleanup and the bug fix in one patch but I think other people
won't like that.

Diff below.  Except, oops, this doesn't compile.  Change the other
goto alloc_fail places to "return NULL;"  I guess that means you
get authorship credit if you fix that.

So if you want you could resend your patch and you could send these
changes I've suggested as a patch 2/2 and then I think everyone will
be happy.

regards,
dan carpenter

diff --git a/drivers/staging/fbtft/fbtft-core.c b/drivers/staging/fbtft/fbtft-core.c
index da9c64152a60..abfd7b1157df 100644
--- a/drivers/staging/fbtft/fbtft-core.c
+++ b/drivers/staging/fbtft/fbtft-core.c
@@ -568,11 +568,6 @@ struct fb_info *fbtft_framebuffer_alloc(struct fbtft_display *display,
 		height = display->height;
 	}
 
-	vmem_size = display->width * display->height * bpp / 8;
-	vmem = vzalloc(vmem_size);
-	if (!vmem)
-		goto alloc_fail;
-
 	fbdefio = devm_kzalloc(dev, sizeof(struct fb_deferred_io), GFP_KERNEL);
 	if (!fbdefio)
 		goto alloc_fail;
@@ -595,6 +590,11 @@ struct fb_info *fbtft_framebuffer_alloc(struct fbtft_display *display,
 	if (!info)
 		goto alloc_fail;
 
+	vmem_size = display->width * display->height * bpp / 8;
+	vmem = vzalloc(vmem_size);
+	if (!vmem)
+		goto release_framebuf;
+
 	info->screen_buffer = vmem;
 	info->fbops = &fbtft_ops;
 	info->fbdefio = fbdefio;
@@ -652,7 +652,7 @@ struct fb_info *fbtft_framebuffer_alloc(struct fbtft_display *display,
 	if (par->gamma.curves && gamma) {
 		if (fbtft_gamma_parse_str(par, par->gamma.curves, gamma,
 					  strlen(gamma)))
-			goto release_framebuf;
+			goto cleanup_deferred;
 	}
 
 	/* Transmit buffer */
@@ -669,7 +669,7 @@ struct fb_info *fbtft_framebuffer_alloc(struct fbtft_display *display,
 	if (txbuflen > 0) {
 		txbuf = devm_kzalloc(par->info->device, txbuflen, GFP_KERNEL);
 		if (!txbuf)
-			goto release_framebuf;
+			goto cleanup_deferred;
 		par->txbuf.buf = txbuf;
 		par->txbuf.len = txbuflen;
 	}
@@ -691,12 +691,12 @@ struct fb_info *fbtft_framebuffer_alloc(struct fbtft_display *display,
 
 	return info;
 
+cleanup_deferred:
+	fb_deferred_io_cleanup(info);
+	vfree(info->screen_buffer);
 release_framebuf:
 	framebuffer_release(info);
 
-alloc_fail:
-	vfree(vmem);
-
 	return NULL;
 }
 EXPORT_SYMBOL(fbtft_framebuffer_alloc);

