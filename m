Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7400A43CEF4
	for <linux-staging@lists.linux.dev>; Wed,  1 Apr 2026 13:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775051338; cv=pass; b=fCYADtXhKAdytdxWmIrw6xad+LsgYbk3E4Kud9Vkno8SmdIGY/ONAnjKw7l8qPAAH4wl+dMqcudFo29Fe7FGIuBjSG+s0AZ1I8YBvXBY4riclImrNuE0V/U8ljjMdI3LAJ6jZijrB56P0FsjL3p25d6Rbpfq1YPFrQpag7uLdGE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775051338; c=relaxed/simple;
	bh=kmCKyLr0H23BO9XFzCEJRaUbovJwHi8pKKGvqU89XDo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jDjHfkSnfha6qjIySkXqf3q+9XVaEpO1p8lpPLKx0PeK7kdMYy/G95idQF0S6Ur+kqV/ixu0289jzl890urWtQBYl1wylPShBUka/BFWAE7z0qvhYqW2tK467J+m2fYy18fc9DYEHhnty+gjILHfWdw7yPk/IsYfuVdeTRb+9Ss=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mH5CRiwo; arc=pass smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mH5CRiwo"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b97e6e48b24so1160907266b.2
        for <linux-staging@lists.linux.dev>; Wed, 01 Apr 2026 06:48:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775051336; cv=none;
        d=google.com; s=arc-20240605;
        b=GSx5kn+wTLx4ea9tjbv1yzBJH5FDxx0aafoSCZ+vF4xsCTO3g9QJ/TiAeDkvnj19kJ
         m+EecUuGYOOc6TJ1dooVA2Bby8hmWJXnikXVa1XqpcFFSZrpxvf5yfPcETXVbfKGUXzc
         sOORSIJBztyeB5Xoigm02bknWpJkjfaeO+cKBPzkmREpbnPwIxq0uSmJ81iZecz9k6i6
         8GTOzPvzzsQtnQqv9tVd4V8poMA9kmTtKEZvSTw1t3d3+rCkEZdDM80pJCBPeA33xIAE
         CZCvYsb7WHw+f1G63LgBLSLP9DpB1dHRH6ix5VSh+TAegAD0AfbtywJ1ezVdiDlI44SR
         PRsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kmCKyLr0H23BO9XFzCEJRaUbovJwHi8pKKGvqU89XDo=;
        fh=BrMO/exe8irvxI2CU7xuOFD7RzWFY5VSQnln9WxdlSc=;
        b=TOsLbXBsRxVMtDF+LV2TV50jP957/uiYNiyvrd3XpWXV6GV4LjKMulU61tX373oSWl
         ZKHCLTAX7o9xCDuTIMpsFzo7sTUzP8ODnMa8prjLHhBQ4sROVFa6hU5Le/RrxQH8RrnW
         uxBD0Ssmnh8nZuZFqNgB4Z7wYMdvNbHzKqPY4/SpGIr7knp94eVR2KDLJyenPaV2nJha
         61rxNMKEHalXKMP83AJlMDW3Ierw1FJVRj20B+vgolN2ngotLiH/22baLv8OWPEI2AV0
         eVbPp4te5V/AuEy9E2bh1zimxadswfG1bKSHpErbxQDbVU46qD80PTmYCB0OQ5dFtWYO
         nRfw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775051336; x=1775656136; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kmCKyLr0H23BO9XFzCEJRaUbovJwHi8pKKGvqU89XDo=;
        b=mH5CRiwoufdl1hGZqnofdI7l4xj/5u6wlsALYVrIt7+OalVdo8sPDB25Uozn53qQVI
         Dp+B0BI0W9CiH/wfk/D7M8SfjLN62h6m0D1YsfmIMS6KjGCych9D7WLqxtsz4ETljUhH
         HqNZOZZhmGEy9LCPz6PCxaXVMOLtvWpp6eFAA7KYwwSrIxRaUQIX1lduY2YZ9wIpmqrf
         L31CM3gjUIFdRW0w5HfvU+RO2K4xLltua0ti7DmsVGyGqpV3xKDS1Iy50EQrXNYBApgO
         3Sfpv853D1fv6sgD8hdXsIRbXAfVSMFpziUDVLwDjFngXL/pKnwQb8n+ar26CM+7FHdg
         uKyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775051336; x=1775656136;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kmCKyLr0H23BO9XFzCEJRaUbovJwHi8pKKGvqU89XDo=;
        b=NGRVFW8U/zuplBk6ROaMY3WtTrpwdkiCt2N9a5C6WKd28FSrhB3vDDGLPd3ROQYeU+
         rNDBn+ER9IvPQ6E6f6t/Wgrvipoon5GPyApcjpnLZTn4L6SJ/D2upYeEa6pSQ48EyfCc
         Ig7ARz5It9eqlOoHFUxP7PkK2Ww1Hd1aiuJ2DYC17eiuxpZcfUGWA7tVWByTz+TFm/SM
         tLGbUlK6I6lxkYK2Vyp1Ainjqepd83rTcKhqV5SDoaahgxdgTlVUtT9sGipEdL3ieqZX
         U6MW2T8qG/OUjoC2UNNgd0HC5s3ul1H2ztSddKVAgU92zNTFO15zqqURrPORTvemqRz6
         fpiw==
X-Gm-Message-State: AOJu0YxuV4l4XQ8ZLhtodL1dhz1b9mXT3XgY3Y3I2WAoLVP/MlgNzbu5
	fhFhXWV5oCYpEzPeieGhS25pqMp5YrqjVIXVdjS3AFWDtGlkF7tN91mAmibQdg20GJqYQug+m4A
	HIsiEj29giAzx8OM6U5ULkjsSAfnC1R0=
X-Gm-Gg: ATEYQzzQgG4KNcCzajfJDzuhGFMiLNXv1h90TvQdzVHVbLzOdvb3uhEcUDBrXTN6bGX
	4hzEVGmT35LrXWKP+cOaZJ40B745/hUJRAFbX2tgozxUHQ3Mrd4kGGUEoP9YzOnrv00K1bgmkuV
	17ZpcduysfBfb15IWdeFUByKXsdRw4lhJaEe/+4hxxJfD20QS5XNAtD97AMXLQvFAoPiz0PxEsV
	UTuRWOZfxbRLrSnulcGG7seYN4MhSIZ2OZTLrAX8WN/3enWpbPAs4Bbx0i9uQu4ehLJ/j3/Fotk
	lx+57MUKwfDFnWDrc7rjfdS65XPpu0vXZVFtoRQLDEP6SDWMkIcNaIlLJGDZ3mr679QfCQwfUXc
	PVU9w/rA=
X-Received: by 2002:a17:907:d25:b0:b98:5547:3de4 with SMTP id
 a640c23a62f3a-b9c13b2b404mr270978766b.33.1775051335652; Wed, 01 Apr 2026
 06:48:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260331211649.421777-1-azpijr@gmail.com> <20260331211649.421777-3-azpijr@gmail.com>
In-Reply-To: <20260331211649.421777-3-azpijr@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 1 Apr 2026 16:48:18 +0300
X-Gm-Features: AQROBzAG-WBSGVfQqScgAjiGd43tATZcxwCSkuVpSFng6_AgmcxUpzTWauzHBtY
Message-ID: <CAHp75VeZwBcB+KgH0_vbs1DtDKJRdV635kV-Ws+3Zh-ijz8DXw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] staging: media: atomisp: remove redundant call to ia_css_output0_configure()
To: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
Cc: linux-staging@lists.linux.dev, Andy Shevchenko <andy@kernel.org>, 
	Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 1, 2026 at 12:17=E2=80=AFAM Jose A. Perez de Azpillaga
<azpijr@gmail.com> wrote:
>
> The function configure_isp_from_args() contained a duplicate call to
> ia_css_output0_configure() using the same output frame index. Remove the
> redundant call to simplify the configuration path.
>
> The ia_css_output0_configure() function acts as a configuration setter.
> It populates a struct ia_css_output0_configuration from the frame info
> and caches it in the binary parameters. Calling it twice with the same
> out_frame[0] pointer merely overwrites the exact same state with
> identical values. It has no cumulative state, either does its order

neither

> matter relative to ia_css_copy_output_configure().

With fixed subject and detail in the commit message above,
Reviewed-by: Andy Shevchenko <andy@kernel.org>

--=20
With Best Regards,
Andy Shevchenko
