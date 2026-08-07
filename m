Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A20F340B36E
	for <linux-staging@lists.linux.dev>; Fri,  7 Aug 2026 13:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786108127; cv=none; b=NoCUAjc35ORC41yD8+ZbyeTz371Q2bmnUsrQRStVSzNrD6ImSLjJ8xtQnpXyA2Eu7j0sXJtq9wTVJwRlVRBCJAWBisGYesjLCiAXXD/LIi27VTkhX8Wq5SUm891q6j+k1So53vkGxmqWgknpw3n/obe1LMtEM+j3CkB7TFzKjMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786108127; c=relaxed/simple;
	bh=r6tQKNJBJLBKkcU905VTnz7Q+CMwMCXgVwnHBoFckgg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kxo+wBjZ3LDvPJ2nNjuSKEaMOVHPVR9Ihmm5FNCI46UiHL1wrekBrvNqV7mmqFXnr3bfbK57zZ2QY7LMIlasNN5l/x52soUtuKU69mSGyKwiAW29ODF0ZhY7Hrtsibx9/BqMfI9F0mBGm//YQiucrbxrEpXapD2fAAwYycNsWZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oegHDLm7; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oegHDLm7"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-4798bea72f9so2084530f8f.1
        for <linux-staging@lists.linux.dev>; Fri, 07 Aug 2026 06:08:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786108110; x=1786712910; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XjfEMCqkZ88kBIhDMMBN1abXLKDzKlzUH+bF7MfZKwc=;
        b=oegHDLm7Z2TSvm0judFaAOk3eUPWOoOFdn1NZxZnXkh6S9lTxjgVMGq4v3i0Trm1pr
         HEvQemD54X8xmjWRDOGnjYpgpT+yc5yfWxWfJM1cGnHAGTOkLe5FPcNeWi10gRsBfxQi
         o1HPCcz+1mV9WeikR44RLRF73VOnR/wBOQNGDYehoUjjK+EGzHHm/Mw5VrUime+HYiV8
         8CAiH/HK2C3dHa+gOLnPdRey8ZEeOJMAAx944Hlm78W6RSdMnnlI1VISPCAgOQA5a7pJ
         J0Sf8hetjlSFyrQrzf9jE5qddDJiLMS1GTtUOl3jpYA2gp7y9yC/7MBYqJfau7Nsy7Mj
         gs+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786108110; x=1786712910;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XjfEMCqkZ88kBIhDMMBN1abXLKDzKlzUH+bF7MfZKwc=;
        b=ogozBalSwo856MYIXpUeLDa5zMNPQCRYtiVmihh0hqyFjrC/gTvOWFIofEgYgC7Ijp
         abaWBRkDRnwJFsG19kq5dohjcY2pUcrVetoocrdgVAskzadyxM+uHGxmvipEQspdEVyg
         hywTlLtlo1oZoacxQPTYKIKhejB5A41BLakWWFkK9GmDq+KVFcF2wg2jO3hCqkxMeBlf
         D136RlyNCp7SP0S3VB+qtIzVsGXsz5/594TQEDbJxeMPXLuF1I1b/BioQK9xke/sOzt/
         Kd2usAu6NU7aj0a2w1oU3mgGa0iSV8glSl/7b/nngbSuC2Pax/HUNX3F42fnkw3dldop
         aZRA==
X-Forwarded-Encrypted: i=1; AHgh+RqS/UTcxGxhHAeqbfw6+kjP9YMCm9Iz+V83A5UlytUOnvLJwYZ5xjOlICI0Fpxw13MpiqmwytL9qvPuP5tV@lists.linux.dev
X-Gm-Message-State: AOJu0YxLwmTFvaAFHM28AlNXiQEguhOBCtoTLW3lQpHETlXDRo1/PMzz
	KqSTXKhVIWh08CihM6sDdWNw2HppD7ITlxBU/B/ZPM8pa79MkkctdTBcXDpew+TG0+o=
X-Gm-Gg: AR+sD10moSpVicy+cqjaNU8Y+BeQEyeNkkTVIqynLX5SsGFEl+y3J7ZRANwGla1Tq5L
	206Aknya+ueYy9Jofa/G6W3JFdIvCvubhk7cdGn1bp+Tea9CE+PZq3Ro6NRDrYZ7M1zsKRH8hcA
	9ywpaGeI/mbxo7whSinu4w8G4AzdVc7IYWNdCGs+ZIZ4RDwrwx4u8znWSa2e+0EV+LaVO89aMjP
	HtFjVA1d7K4FT6su3v/EtlgmzJ4g5HAp22KJ0ueDqd4Ld4hBxm32Y18NNsWuZXGljaflAItDaCL
	IoWJfh/M4Iac+9XD2ejn4X2t1kGNHFEGh/ILcWKa2nuL2+YIEWMisme8YzfO9glQPQ0wrxFqng/
	7vj0W08+skRxvbEBx2tJ90Wk06wkt3g/tDeawUbh9uwpCoc37h911EINvfbTkwThPi1vWpfZ6+E
	tpYAOSSpu9gQS9p3IcCLVKz9nKyue/a18eVEO4/beH48YHy5ziWEvR7PBQ
X-Received: by 2002:a5d:50c2:0:b0:47f:8e50:9411 with SMTP id ffacd0b85a97d-47fec52acc2mr26764789f8f.20.1786108110319;
        Fri, 07 Aug 2026 06:08:30 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-480021501bcsm5754365f8f.9.2026.08.07.06.08.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 06:08:29 -0700 (PDT)
Date: Fri, 7 Aug 2026 16:08:26 +0300
From: Dan Carpenter <error27@gmail.com>
To: Nam Cao <namcao@linutronix.de>
Cc: sh_def@163.com, andy@kernel.org, gregkh@linuxfoundation.org,
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	thomas.petazzoni@free-electrons.com, notro@tronnes.org
Subject: Re: [PATCH] staging: fbtft: make dirty_lock IRQ-safe
Message-ID: <anXYynas7E3oarx2@stanley.mountain>
References: <20260804173712.176017-1-sh_def@163.com>
 <87pkzu852x.fsf@yellow.woof>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87pkzu852x.fsf@yellow.woof>

On Fri, Aug 07, 2026 at 02:53:26PM +0200, Nam Cao wrote:
> sh_def@163.com writes:
> > diff --git a/drivers/staging/fbtft/fbtft-core.c b/drivers/staging/fbtft/fbtft-core.c
> > index ca0c38221c16..193643d0329d 100644
> > --- a/drivers/staging/fbtft/fbtft-core.c
> > +++ b/drivers/staging/fbtft/fbtft-core.c
> > @@ -298,14 +298,20 @@ static void fbtft_mkdirty(struct fb_info *info, int y, int height)
> >  {
> >  	struct fbtft_par *par = info->par;
> >  	struct fb_deferred_io *fbdefio = info->fbdefio;
> > +	unsigned long flags;
> >  
> >  	/* Mark display lines/area as dirty */
> > -	spin_lock(&par->dirty_lock);
> > +	/*
> > +	 * fbcon takes dirty_lock while holding console_owner. Disable local
> > +	 * interrupts here so a printk hardirq cannot acquire console_owner
> > +	 * while dirty_lock is held and create the inverse lock ordering.
> > +	 */
> 
> Beside that reason, we also need spin_lock_irqsave() because
> fbtft_mkdirty() can be called in both task context and hardirq
> context. And this reason alone suffices and usually is why
> spin_lock_irqsave() is used, so I think a comment is not necessary.
> 
> But I am fine with it either way.

AI always adds comments.  If we keep alowing obvious comments, the kernel
will turn into reading the Terms and Conditions which are impossible to
read in a single human life time.

regards,
dan carpenter

