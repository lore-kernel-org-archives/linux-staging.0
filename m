Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C3F41DFE23
	for <linux-staging@lists.linux.dev>; Fri, 13 Dec 2024 13:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734095344; cv=none; b=jv7h/gMVJmTGnYqufYmLrFjiDHV8RPTaRvJSKXUvIfh2KUkxI03origkEAQ2qH/qcxCV+rXWnfja6nhKHcxxKbIB0Q6iVhJroLi15TGvsad6fKd5KvVVSozrB/l2CO+kBRs/kxYsueBdL0eO6ot+E1YsHnmRgt/HTEWKNmRkjYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734095344; c=relaxed/simple;
	bh=rqaTtvm5IEyKWS5ONUaBUZiybgpVMBEkcAqj9ZEe5vo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O+k4y4RYQtMiE99+fy5Vi+wcsSOW4DPiSSLANJQunvZDqYUA8uxjqwDQHvZ8RByHsPkPua54pyFLE3JKzrU/NXzE98zhvs3HC3FIkvzE0uKKo/AeggbFx5KwLPjKN9dAglO5YJKRcP6SmfKnyIvJrcZb+MRHt3qraIsT6pXzDno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AaUC9AKF; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AaUC9AKF"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43623f0c574so12025055e9.2
        for <linux-staging@lists.linux.dev>; Fri, 13 Dec 2024 05:09:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734095341; x=1734700141; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ti6eEstcDMekLF5cg8h/xv4zkeUEnh0EvJjkx52ON2A=;
        b=AaUC9AKFHQ0IgyUGGU8GZYphD3sjuRoGvq/qGfVySSROTNIdvkYfVDu3dbL4Vq8PTg
         Xnl9YYFEyt2IcdJr3QNDg/WDrOtuaGrwfIhmEcphB0JGycfkC5+PXTfiofjPOE+2EGNo
         r+p8tmQMSwi8boERYj8B4haxPSfcmIQwrfMXVvMfCMtY6rnvdUr8jG8Nw+mojXLlU7ia
         a90y1FTvmsUaMfb6q5uJLaYKIxboTej1/sxzOIGFier9Gae6UdJ9Ovsq6LyLepT0C3TG
         Anbratct+ooHeDtwlCQkTapm6LMW+QMvHO2+BGAvicJoVCWTSh0G1ZvKtnstZ1fyxHdL
         xIkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734095341; x=1734700141;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ti6eEstcDMekLF5cg8h/xv4zkeUEnh0EvJjkx52ON2A=;
        b=Sp4wUUh7/qmbBgxNP4Uwo82bNESqxRDRBRVarMVSVgndncpL+kCWaXr0Yk8+10x/a6
         HM9fSHjDpscooOjQAeM3Bx5lKr2Lb6lk91DTXwzm56xWKgYXcD0E46pv08PTn1+Qa8g5
         ZRKftE6zAZAcPy+h/USFKOSlxQCBmVpsbdrjq980AgNuk0C/Yh1Ts5tL7Z3ZYfzE/A31
         lhJGjKsFtq/y1I9JtmA5jTuP5rZcHkjbnqoOeinB5YXyLQQj0D5le5xNlt4vyaDVizLp
         txJdP5Z8xDrWdriRMtgmAYPnil9TctiDnOEhkjGbpdpczCnd7Mr41B244Qdfd9jAyMf5
         Qjfw==
X-Forwarded-Encrypted: i=1; AJvYcCUE1cR6FDDC10yADuZq3S5Pw/FeUCPKyUAiGDlzERrl/uHGh7CTYBr0HMjuodNQqMOGt/QYvhHjEEU+4Jbs@lists.linux.dev
X-Gm-Message-State: AOJu0Yz+cK4ZgI8yhrSkc8EAYXP+v9sr14n4k7cOe7rD9we2nGhVs2sM
	/76ux9ywogyRZdX4S/b/X/CST5PZCXXetNGu+bNlKmirQXEgHto8
X-Gm-Gg: ASbGncuNxDUbugUuD5YEGbasEVoW0NlMCluVPBLGKRTLfDrA61Wjftwiz/mJ6G6Qwgd
	e8AUkshZ/YVQPDbEmkUk87pquj7QYlI5uN11HPa5muYF+fBWfx2ifb9ovx06/wOZE8FYE4Kg6qj
	ev8VxFM/2lg+1rF4yWvYeWqOKy/zuxhIBvnIqLYtcMTA/p2jVY4nMLvKv8wBsnDZ34AEXYp1Unh
	JPgWjouYQGX/qKls9lXL68HzY1vySjvBRM5LEqe7TLW5Fbz91JnaXLslEzdKplGRrIQ0JpZ
X-Google-Smtp-Source: AGHT+IGwFfs8iXyzrUmAhIxlrYsb8xItJ9t24BgPCHxAf5Rmj6592z/EvjXbYKnSSg7OPilEoegBwQ==
X-Received: by 2002:a05:6000:4025:b0:385:f1f2:13f1 with SMTP id ffacd0b85a97d-3888dcd4796mr1824519f8f.22.1734095341001;
        Fri, 13 Dec 2024 05:09:01 -0800 (PST)
Received: from egonzo (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38782514ec8sm7196646f8f.75.2024.12.13.05.08.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2024 05:09:00 -0800 (PST)
Date: Fri, 13 Dec 2024 14:08:58 +0100
From: Dave Penkler <dpenkler@gmail.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Rohit Chavan <roheetchavan@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Prarit Bhargava <prarit@redhat.com>, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] staging: gpib: fix address space mixup
Message-ID: <Z1wx6pzVdh0y9w4d@egonzo>
References: <20241213064959.1045243-1-arnd@kernel.org>
 <20241213064959.1045243-3-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241213064959.1045243-3-arnd@kernel.org>

On Fri, Dec 13, 2024 at 07:49:51AM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Throughout the gpib drivers, a 'void *' struct member is used in place
> of either port numbers or __iomem pointers, which leads to lots of extra
> type casts, sparse warnings and less portable code.
> 
> Split the struct member in two separate ones with the correct types,
> so each driver can pick which one to use.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  .../gpib/agilent_82350b/agilent_82350b.c      |  4 +-
>  drivers/staging/gpib/cb7210/cb7210.c          | 12 ++---
>  drivers/staging/gpib/cb7210/cb7210.h          |  4 +-
>  drivers/staging/gpib/cec/cec_gpib.c           |  4 +-
>  drivers/staging/gpib/common/gpib_os.c         |  2 +-
>  drivers/staging/gpib/eastwood/fluke_gpib.c    | 12 ++---
>  drivers/staging/gpib/eastwood/fluke_gpib.h    |  4 +-
>  drivers/staging/gpib/fmh_gpib/fmh_gpib.c      | 25 +++++-----
>  drivers/staging/gpib/fmh_gpib/fmh_gpib.h      |  4 +-
>  drivers/staging/gpib/hp_82335/hp82335.c       | 21 +++++----
>  drivers/staging/gpib/hp_82341/hp_82341.c      | 16 +++----
>  drivers/staging/gpib/include/gpib_types.h     |  3 +-
>  drivers/staging/gpib/include/nec7210.h        |  5 +-
>  drivers/staging/gpib/include/tms9914.h        |  5 +-
>  drivers/staging/gpib/ines/ines.h              |  4 +-
>  drivers/staging/gpib/ines/ines_gpib.c         | 22 ++++-----
>  .../gpib/lpvo_usb_gpib/lpvo_usb_gpib.c        |  2 +-
>  drivers/staging/gpib/nec7210/nec7210.c        | 16 +++----
>  drivers/staging/gpib/pc2/pc2_gpib.c           | 16 +++----
>  drivers/staging/gpib/tms9914/tms9914.c        |  8 ++--
>  drivers/staging/gpib/tnt4882/mite.h           |  4 +-
>  drivers/staging/gpib/tnt4882/tnt4882_gpib.c   | 46 +++++++++----------
>  22 files changed, 123 insertions(+), 116 deletions(-)
> 
[ skip ]
Hi Arnd,
Thank you so much for these valuable patches.
I have successfully tested them on the agilent and ni pci boards
on an amd x86_64 system.
This exercises the agilent_82350b, tms9914 and tnt4882 modules.
Your patches have also fixed the i386 build issue as far as I can tell.
Link: https://lore.kernel.org/all/f10e976e-7a04-4454-b38d-39cd18f142da@roeck-us.net/
cheers,
-Dave
