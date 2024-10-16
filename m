Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61C5F1DFF5
	for <linux-staging@lists.linux.dev>; Wed, 16 Oct 2024 12:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729082007; cv=none; b=eDQQaEuSXyFEz4SAGiO1HfoAzEJaAxncg5bxM6QMnzz/7NMNOSxDR6+bnWq/ncMtXOQKNXAO65v+BVGN9HLNvuYn8TPU0aU+iOETYpzaLq77YHNRe+O8yReE0kcK0Fnv/MLeVckg68uQXQ4WAknlH2qW5UEzZ/HaX9KtGpvNh6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729082007; c=relaxed/simple;
	bh=sfHRATR5XWxAwJthBwOYm3xrSgw2MrjYFu4ytWOCvc4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VnK3vEOH1Qj4aHe1LhHLekZtshRj6pFXe4NMG8FhMA6d9ZrQQyUuQJQvWuiKDe1ZSjOmEPGr2Y9fwdcK832paPGgC/5cvaXts3BQ0dujppgbn1+dUQH9+IIq6nDPYt9W8E6848A5okjFSyJV13Vj5yQFwLAjEnFP8JhZcFIN9Y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nHMEDL12; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nHMEDL12"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-430ee5c9570so77482795e9.3
        for <linux-staging@lists.linux.dev>; Wed, 16 Oct 2024 05:33:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729082004; x=1729686804; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=m3sgLqylv4jlXSeEXz4l18P3Jy/z7zhKQdM7ng6O/wA=;
        b=nHMEDL12Cuo+PeWAQiQwP475hsW9t2sjLjALrhDw5gfhYgCE/y7NOMKW1Pho9XavM/
         YrnF7Y2aNjpID6n9zyg/95WQJ5bDP69v3VGfmPIJXCubLC8Tmx7Q7W3fKt8iaUTx+1Z2
         59OHwikigzdOB+4IVVRHrbPMpZP+xbELRSAZICReCZKZ+mD4FI/V9ryxn030chWrpv91
         uPLIvN+c+i1eIXq+/qrg9KF7Vqi6br23sNmRwUfMxm/6JGaA3OzW6/EUgrP8fzPicOJn
         LbwRLd7Z1qXsZN+Hfyq2AFOZfMXCQ47H/GNJjD51VbHBIKrzNyzBjF3Sy+FHm0yK/Kox
         onCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729082004; x=1729686804;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m3sgLqylv4jlXSeEXz4l18P3Jy/z7zhKQdM7ng6O/wA=;
        b=CGduIKfIEKCPresUuLWoh9hZolpDdTG5J5VfHw0nTmlnNeSsJ0AwkRZAV0LRnS68hP
         2LbQtxWTcR6/6Fvo+cewg0QZIJgsfg+LXnguC6sd4gKc4cWx+LS29ZU0bh8xGDviHtbw
         3V6zWAXdLHceArjhKxzrtlbcEm53nxt4/MGa4CncYsG8t7e3WcDKWGG65HNwc2GSrKaE
         2BcpgslyjYSRmsziplZSbZfyJuofouLKM1vGwgR+ajXZdDuIHxFIE49csYGtcwxgxUzo
         PyoA0m9yuAYaBHwn6CHJbQiTKPKo2l3vvwEZ3ZDq5SenQ4PW/b1qsXZ3EUrRQIvKIQwR
         6rng==
X-Forwarded-Encrypted: i=1; AJvYcCU5XbByyHDl1DdjhSz18FR7Ypzb7sb6Bnaqh19wC872cC0zzZyxVxjsd1oIRkj+84jpOaK2v1XUXtiASjFA@lists.linux.dev
X-Gm-Message-State: AOJu0YyWyJi7Lf4fcuP5RryhaLYdcOW0EdZsMCxtIUh817VFzE++jN9S
	/HzvrTbMcCkbUQo6uj8af4zQJI1dE9FS7RsPzJfUFeQHArp6kLVI
X-Google-Smtp-Source: AGHT+IFBlflvx+T6DtkgPPX+bQm+ylgB9ORmTCtkNi7ueP5x2k7P3eWxySwUQDnwszRajxtQ137m7A==
X-Received: by 2002:a05:600c:5129:b0:426:5e1c:1ac2 with SMTP id 5b1f17b1804b1-431255da9a3mr162251585e9.8.1729082003312;
        Wed, 16 Oct 2024 05:33:23 -0700 (PDT)
Received: from egonzo (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43143c93ae5sm44631895e9.2.2024.10.16.05.33.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2024 05:33:22 -0700 (PDT)
Date: Wed, 16 Oct 2024 14:33:20 +0200
From: Dave Penkler <dpenkler@gmail.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 0/7] staging: gpib: randconfig build fixes
Message-ID: <Zw-ykGZlKNZJujAq@egonzo>
References: <20241016111521.1143191-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241016111521.1143191-1-arnd@kernel.org>

On Wed, Oct 16, 2024 at 11:15:14AM +0000, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The newly added drivers added a few build failures on my randconfig
> setup. Some of these only happen with extra warnings enabled, or with
> the pending series to allow CONFIG_HAS_IOPORT to be disabled.
> 
> 	Arnd
> 
> Arnd Bergmann (7):
>   staging: gpib: add module descriptions
>   staging: gpib: avoid unused const variables
>   staging: gpib: pc2: avoid calling undefined dma_free()
>   staging: gpib: make port I/O code conditional
>   staging: gpib: add bus specific Kconfig dependencies
>   staging: gpib: use proper format string in request_module
>   staging: gpib: cb7210: select NEC7210 library
> 
>  drivers/staging/gpib/Kconfig                  | 18 ++++++++-
>  .../gpib/agilent_82350b/agilent_82350b.c      |  1 +
>  .../gpib/agilent_82357a/agilent_82357a.c      |  1 +
>  drivers/staging/gpib/cb7210/cb7210.c          |  1 +
>  drivers/staging/gpib/cec/cec_gpib.c           |  1 +
>  drivers/staging/gpib/common/gpib_os.c         |  9 +++--
>  drivers/staging/gpib/eastwood/fluke_gpib.c    |  1 +
>  drivers/staging/gpib/eastwood/fluke_gpib.h    |  8 ++--
>  drivers/staging/gpib/gpio/gpib_bitbang.c      |  1 +
>  drivers/staging/gpib/hp_82335/hp82335.c       |  1 +
>  .../staging/gpib/include/nec7210_registers.h  |  6 +--
>  drivers/staging/gpib/include/tms9914.h        |  4 +-
>  .../staging/gpib/include/tnt4882_registers.h  |  4 +-
>  drivers/staging/gpib/ines/ines.h              |  3 --
>  drivers/staging/gpib/ines/ines_gpib.c         |  7 +++-
>  .../gpib/lpvo_usb_gpib/lpvo_usb_gpib.c        |  1 +
>  drivers/staging/gpib/nec7210/nec7210.c        | 39 ++++++++++---------
>  drivers/staging/gpib/ni_usb/ni_usb_gpib.c     |  1 +
>  drivers/staging/gpib/pc2/pc2_gpib.c           |  5 +++
>  drivers/staging/gpib/tms9914/tms9914.c        |  6 +--
>  drivers/staging/gpib/tnt4882/tnt4882_gpib.c   |  4 +-
>  drivers/staging/gpib/uapi/gpib_user.h         | 20 +++++-----
>  22 files changed, 93 insertions(+), 49 deletions(-)
> 
> -- 
> 2.39.5
> 
Hi Arnd,
Thanks for this. I will test the drivers for which I have hardware
and get back to you.
-Dave
