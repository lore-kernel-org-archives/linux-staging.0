Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 108A326FD99
	for <linux-staging@lists.linux.dev>; Thu,  6 Mar 2025 20:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741291731; cv=none; b=snAKWrFcJdeOrfgGBPW4qIMUCxS6aUyW1hXZWFjzKm/t0MNAQHT7G0H+BPA6ppRBo6iRYyDMlZD3ydm90NV1LblSkBt6tzI+aBIOtJ7MmgQEgphdORkpm3hY/K0r9dkgAEluqHzNlmvxTvAWW2sn3BiADxGZeo61wM1mm9oRWlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741291731; c=relaxed/simple;
	bh=4ANQ6jxnMVqPUbO8KxS0IbrnE06KdtXQZKCpH/+k1M8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MD8HJVuZANL8oPU+hRiL8+mnpeMjIJf1ER/5FU6MOWxX/V6erNUzerOOPTtkp2g63uo/+zFofGPpucXaVvFCnc28d9DURTl++FNOvuhCP6G6NDuGoJdbx6A5pR5ZHS8oZU8lscWJHjHy6IULvHbdels6Q+aDmbPtmKx3grCaSpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=K7uJgtFp; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="K7uJgtFp"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43bdc607c16so8755845e9.1
        for <linux-staging@lists.linux.dev>; Thu, 06 Mar 2025 12:08:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741291728; x=1741896528; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vu6Nb3Ka+Nd4QHA4BCCuDDi+MFoZySYQiXMqKDLBjpo=;
        b=K7uJgtFpBd5rqelD8EKRy4YKM1TfgGl2KvDC0JpvFNC7G4jqCe/mbgaE2LsXJh6/18
         kHyujWQezzILSivWxYpEtuRLKoQ2vra/dTyDMxZoco4X4B1zbvfEUfyCoQraYdp4bA8B
         /en6srpNyiIwZTZfv/xQV/FeA6gLmvPP2QYahYPvgaPgtl8wgdtyQR0hznu6adTBC3Pi
         zKGvW6Eje51oyJb3+CzmJLyHHAT762rm0PaaxfiVfItt2Be5sUTYs5bAAFEsuBTJtFhK
         dlDw5LVfIPssGlfx5ZTPe8tpoVeMtS6IlRJ6a9tcvkr0HMlYLPElliRVUSxZ1Z32mUUK
         cstA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741291728; x=1741896528;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vu6Nb3Ka+Nd4QHA4BCCuDDi+MFoZySYQiXMqKDLBjpo=;
        b=sET+Htw6G1ROaYbYZ9m9P+SDxk5ZDPXA+geENuht1htBMZyzclAp/IJ2TIu+DB/d0v
         zMCgiAB5OJZqu0r967NvG0IYJuLS3vy0m83ssUupAWbe6/tYUYbVhwebSkPzXKQyen1K
         ow/RWlvyttKWDtek/WzscjSQussyyh5qgfrBntPsmAcII25G0mYdHYBauEDXbbAfMVY9
         pzuVmcX85WMoVCAKaiHUmpC0+MPEDCsK1DpUJmRgut62nsF7aRJMmCFppbUvHNLA4iKA
         iMPQu4vnRFK2/Tf0FbmPeznN5+yZlXgUBCsDterUOpLna4KBmfdKp8sYHhjGOUIHmztT
         SQ2Q==
X-Forwarded-Encrypted: i=1; AJvYcCWKQ/34/ZjOPGuOCs4Egt4TvbZwJhlgDRtW1kWnWll5UNbfWIpoij0LEphbUhFc+ynSqG4U1To3g7wBgsSq@lists.linux.dev
X-Gm-Message-State: AOJu0Yzd3RSor9EIW+hUUdKaY9RKVO45XZ9YaXwZL6JIXd729Ky33YjB
	8fxm0SYszfkBhpCgt67PFebrKwJJ9UD/0zqdUoWGr7OT4L92KE58jYj/LFC0aMU=
X-Gm-Gg: ASbGncsrMP2k6RLc5sasG23kFZXAyWufuw4ZSw/B8EVBMC8psEeDbWQPbW4dH8qIYso
	166+AH8QpcAykTnMido0x+rOLwhJ5Nj2byOnyaJbb/xAmFzZRBRDha07R6AbOMNgfA4/kbXLd+p
	i+bi9gJgdASXB+MDwFmm2WQ1snmj9HR0AtllFYGvvW075A07YwsMSoQzGVm0gDfIcl2kxb7Qkkx
	IK3muDDbiWE37KANS+FimRAD/t1LVCRIpuJNzr9Osi/2fBtj4/sJYWREWM3CQ7seuoolnUauF0M
	wqAxxivI7/KdgSFiBNPF95NZSYC+/rfnC/MIm8Jn1iYechLY0g==
X-Google-Smtp-Source: AGHT+IEUEM1THRDjnKYSch5Ww+/6WcBAoHn7/OHeW6aQR2tMBEMKVdYUpqjgGMl6Rqo4PDPLKLMO6g==
X-Received: by 2002:a5d:6d8a:0:b0:391:1218:d5f7 with SMTP id ffacd0b85a97d-39132dacbd3mr295375f8f.40.1741291728288;
        Thu, 06 Mar 2025 12:08:48 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3912bfe0004sm2942613f8f.40.2025.03.06.12.08.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 12:08:47 -0800 (PST)
Date: Thu, 6 Mar 2025 23:08:43 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Gabriel Lima Luz <lima.gabriel.luz@gmail.com>
Cc: linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	~lkcamp/patches@lists.sr.ht
Subject: Re: [PATCH] staging: sm750fb: Fix CamelCase variable naming
Message-ID: <b500aadd-e273-4434-8219-6e5c04f7c8e9@stanley.mountain>
References: <20250228162359.14029-1-lima.gabriel.luz@gmail.com>
 <ba45d980-c6b1-482a-8bfd-457a92d3e24b@stanley.mountain>
 <635f849e14854b0db1f53a0d0bf329c3070e5859.camel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <635f849e14854b0db1f53a0d0bf329c3070e5859.camel@gmail.com>

On Thu, Mar 06, 2025 at 04:40:05PM -0300, Gabriel Lima Luz wrote:
> Em sex, 2025-02-28 às 20:40 +0300, Dan Carpenter escreveu:
> > On Fri, Feb 28, 2025 at 01:23:54PM -0300, Gabriel Lima Luz wrote:
> > > Adhere to Linux kernel coding style.
> > > 
> > > Reported by checkpatch:
> > > 
> > > CHECK: Avoid CamelCase
> > > 
> > > Signed-off-by: Gabriel Lima Luz <lima.gabriel.luz@gmail.com>
> > > ---
> > >  drivers/staging/sm750fb/ddk750_power.h | 8 ++++----
> > >  1 file changed, 4 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/drivers/staging/sm750fb/ddk750_power.h
> > > b/drivers/staging/sm750fb/ddk750_power.h
> > > index 63c9e8b6ffb3..33e852fe6949 100644
> > > --- a/drivers/staging/sm750fb/ddk750_power.h
> > > +++ b/drivers/staging/sm750fb/ddk750_power.h
> > > @@ -3,10 +3,10 @@
> > >  #define DDK750_POWER_H__
> > >  
> > >  enum dpms {
> > > -	crtDPMS_ON = 0x0,
> > > -	crtDPMS_STANDBY = 0x1,
> > > -	crtDPMS_SUSPEND = 0x2,
> > > -	crtDPMS_OFF = 0x3,
> > > +	crt_DPMS_ON = 0x0,
> > > +	crt_DPMS_STANDBY = 0x1,
> > > +	crt_DPMS_SUSPEND = 0x2,
> > > +	crt_DPMS_OFF = 0x3,
> > >  };
> > >  
> > 
> > It seems these are not used.  Just delete them.
> > 
> > regards,
> > dan carpenter
> > 
> The dpms enum is used in the definition of the 
> ddk750_set_dpms function in ddk750_power.h file and
> this function is called in ddk750_display.c on line 158.
> 
> If I were to delete it, what changes should I make to 
> the function mentioned above ? 
> 
> this is my first contribution, thanks for all the help.

Huh.  Using a enum for shifting isn't the right thing.  It should
be unsigned int.

The enum does serve as documentation.  Maybe just change it to
a comment or something next to the ddk750_set_dpms() function.

The ddk750_set_dpms() function does a weird thing:

	value = (value & ~SYSTEM_CTRL_DPMS_MASK) | state;

state is something in 0x3 but SYSTEM_CTRL_DPMS_MASK is
(0x3u << 30).  I bet it should match the on both sides of the
if statement:

	value = (value & ~SYSTEM_CTRL_DPMS_MASK) | (state << 30);

But I can't test it so who knows?

regards,
dan carpenter


