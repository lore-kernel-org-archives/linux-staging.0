Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE3F87A143
	for <linux-staging@lists.linux.dev>; Wed, 13 Mar 2024 17:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710349902; cv=none; b=orSCMrRQWPNm9rNEexTlwAmxy+OD11aPRQaDGmsotZuEF9+3Y0PcaOoQEhEoS16RjoAyzCC5R3jh0n/nYf4OfUKjATPAnamuncLFLUFIJ0wYRt8YjoibgH99tj6We2blrtXIxtjhls/BzeoxJtolvKF97Od0uJhG8SgiS0DSJXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710349902; c=relaxed/simple;
	bh=/avyauc5PSAA6YqZTk10zgDYesk4c2DrAB2My5MLAgM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bY0JQiADq5j40v/JfxCHwboOYSFq/7Trk1SMM/Vz6jtaO0gMh1IQ/TPXjdXqhvmicDTlEo6Q9HfsSTXBL6nbr6i60n6SJfN0TwurfoeRhpvFze4HY6TiHok+g9UymcOBNCsSwegWUs70nX1OQIGAR2P73gEksMiLiQpjkMim7Ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cJI11/PP; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cJI11/PP"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a446b5a08f0so19574066b.1
        for <linux-staging@lists.linux.dev>; Wed, 13 Mar 2024 10:11:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710349899; x=1710954699; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Y4989NFoTQ07zq5PnHdZf2zLYVP+OOsZrZkI627DoQM=;
        b=cJI11/PPG+Z8tKl7D5mtuOzmqByhYPLdwoiXRW69c1d352SPZLAxEjn+GQO5X7Ac8K
         08NvxKn/syA2m0VZ23pbG1Jd1fkLEAmKdEwmrayBBmN5r4PU/asXsKCGCfrTS2k0Q8q+
         8qyLLatQ7f3EGasQF1IdDDMPdzqpiWDM07r8/9/Q4tvDXagSFYUymKbmhV4NHq8Y+mn7
         LzbPldeY16ynvDjTpX4igjpm1H1QAoMnQ42X9vrXevmGtcHo82cCTgChNkXWAt0jjP7/
         SH4htFPTCerz59rXSGc8ygRlOecrkAcaDWAYuIO5z/Sl33V9pzw1psIxnb5rrdc4qIlr
         baww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710349899; x=1710954699;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y4989NFoTQ07zq5PnHdZf2zLYVP+OOsZrZkI627DoQM=;
        b=KnoVO9OrWO9zEmjl+DM8gWAZ+jCfrhisDh9/qf7alsF4AHSvDiR0oxx1FjkIfvbkVs
         Fm1Oq3DWVPbz07vZZvyt8u6DDmPPqFU52A09r895NBMvNU1Y3AzJ03IdxSBVO6Jtv9tY
         +KStg1zX1tChP4vglGjwpd3pjIh9E0TpNeX1ikMTWytVJ/jqTTLCbrmhXvsjyUJcTjww
         kR4fP4IX7nd5sn9KtxnedbPcfyy0ag1HqbAbzVswtLbe1Yxen8Uu+jv67x/xwLhND2OZ
         CdFk+SkplSU+QvQBjI4Rf1onx+iLEZ3BxB/jF7YIkosNzITdk3Sax08YTxGv4DI8cfOA
         NjWg==
X-Forwarded-Encrypted: i=1; AJvYcCWUBUdRFtfZW4lLEgIVxmLB+mTxHI2ws3fTEMHuGjR+HziBs37et3qTIRiVdr0SdmnTtNKSn605D9L5Lb8j8Ht5P1xBTLXCNEpYmx63Yg==
X-Gm-Message-State: AOJu0YzQsNf4kXhqJGS41lPjSe4fg7Jt3kUPdI+e8G+Xi1g2aKa02/N0
	tZgy+iThJX2b+7RhwlojU/I7V3kLScXtJATuXtgR00MfBzdvvNR178Hs6f0jpbc=
X-Google-Smtp-Source: AGHT+IE+IqeM0K8AvqOGHDpdNt4JlH9jV1CrUlPPX5RdEaGIo5go5N8DZ6CKG209IIMOIcNXF7bviA==
X-Received: by 2002:a17:906:c7d0:b0:a46:1f91:7078 with SMTP id dc16-20020a170906c7d000b00a461f917078mr2730655ejb.20.1710349898986;
        Wed, 13 Mar 2024 10:11:38 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id kv20-20020a17090778d400b00a4600ca3098sm4809644ejc.43.2024.03.13.10.11.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Mar 2024 10:11:38 -0700 (PDT)
Date: Wed, 13 Mar 2024 20:11:34 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
	Andy Shevchenko <andy@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>, lee@kernel.org,
	daniel.thompson@linaro.org, jingoohan1@gmail.com, deller@gmx.de,
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Robin van der Gracht <robin@protonic.nl>,
	Miguel Ojeda <ojeda@kernel.org>
Subject: Re: [PATCH 1/6] auxdisplay/ht16k33: Replace use of fb_blank with
 backlight helper
Message-ID: <03ea1afa-e54b-4f31-bf07-03d9cdbacaea@moroto.mountain>
References: <20240313154857.12949-1-tzimmermann@suse.de>
 <20240313154857.12949-2-tzimmermann@suse.de>
 <CANiq72=5V_XChzDhaaWNC+B4LP7gqivPZj5Y10qqS4SkQTGB_A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiq72=5V_XChzDhaaWNC+B4LP7gqivPZj5Y10qqS4SkQTGB_A@mail.gmail.com>

On Wed, Mar 13, 2024 at 05:08:08PM +0100, Miguel Ojeda wrote:
> > -       int brightness = bl->props.brightness;
> > +       int brightness = backlight_get_brightness(bl);
> 
> This can be `const` now (or even removed and have the call embedded below).
> 

Is there an advantage to making this const?

regards,
dan carpenter

