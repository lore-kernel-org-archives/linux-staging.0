Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4540C153808;
	Sun, 26 Jan 2025 18:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737915504; cv=none; b=W3zLQT6tUlhcYfqR8ICufeg1HhHKLBc0mnyYZ3yZDJsRGDOBzUDwR62PcLiwIqBUSpV1/QF4b6weahodUBr4siamxVaw194hv78AjWqoB0S/IWEqPcizbLIQxYc/6vFDo8m/ZhoyQ7VrfEBPK3Mw+b4jHuoxKOns8d/pZso/hWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737915504; c=relaxed/simple;
	bh=bjQ+BjqsN+XaNUDeaG65fQ5MfWBsAKH/MIoVme5Ghyo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=emlOsr3Nh4kE2VZ4dY+z1IIypBIWsYuAycKKvxteQmBq0WEn77/tSEfBy62BH2S3FZfWn+IQECdiBCfetoBW68fMEoRmgpx508pVdxSJtveVoOu5fXr9ta5qLkEtebCIUTFrR464iPhj90UKijlhU5yoDA0CLTfjzMpA2iQSUQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ax0GM5bH; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ax0GM5bH"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4361f796586so40259715e9.3;
        Sun, 26 Jan 2025 10:18:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737915501; x=1738520301; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Bnh+p1HEbTCxFxa6ALnjoJvMm9vVF7/t6oC1k+ZUFf0=;
        b=Ax0GM5bHEpHltjFowo0S1j5geodXZ2b5oYGykB3mYYjoDYwzZMWHndIgSmjEFvo7d8
         BN/LnwENp057Jb2EZnx8o0MeSEDV+D6n+hz3ZXLhI33ohRSmN0EC/5/o6thGT70R5NrA
         nY2FAkMGoqqYvTxRm/76HMs8y/jN3dCJj6jqPqkri4bojh05nOJ0Mo3yWwovP56YwmQH
         aNGa8Jg3JbO3aD/trWHyS2xUj7NWaZ8X80rsF16ditzefNhuNDUWPaopRKOT58QTUrWF
         Il0+qb/ywvRBh/zNjnKKzUKh6VV7r/jJYZvOa7ZTbBrVk99Ni4QT8Qcj0HZl3Kf0s0at
         PizQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737915501; x=1738520301;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bnh+p1HEbTCxFxa6ALnjoJvMm9vVF7/t6oC1k+ZUFf0=;
        b=hzCF7yGpucKawBfTesThzSY9ML+L/WQQ9oG57gyZJh9AKRtEiCKwlyZWR1p5ULodDf
         98j8xuJJ1qk7pan0YNQC9pwfVTXjRC7u+1Occ/0bccZ93mkoBI6bXTNcWfZzWc7dk640
         VCvg4sVDG/56Oz0JVpRG0mmNAyNluLaGU+SOlTzLrNh3LlK86ycfapHbYMA+1/IHXWvq
         bkvzhUBoh3jzDNahCv6tDntvHTOhK9dtknbuVhsJDIjTIy9KyN08VZNJUWb+UIbcc5Gh
         CCPxg77gT93Z/+1iL7WdqgJ2t364DEHvW6I8bBNJPyDdJ4iLgtnsjSyany9z6giv5qVE
         2vQg==
X-Forwarded-Encrypted: i=1; AJvYcCUULGVhCUvcndr1kpzjM9FoNAWpsYx7WnNf1mn+cc6oPLzIQPO40LzxhabyCM42b0VlPwGg/KxGcotBeDNT@lists.linux.dev, AJvYcCVHYVbVl5FjdASiU8oFOxRQuwN2fD9VjNniznPn1GflIlVZaNUr7OcUoUKBtcqZJrlxovTZptCFoxynK0nykw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxJNI7PZa1kqChCfHA8KZZVKdPyPbWXz/f2kdg3uNUuYshdDAtc
	5wnn3ljp6JinP5qvl2M7+5qbTE3GZL8PpjX/LGFIzuG1lZIZTSKqpWfv78ox
X-Gm-Gg: ASbGncsTp/+XvZwgB7eN1WLPEXJtQqGgrgxhbfqeXVWiYEC6gY5qLt7K8In07mhl9Qa
	mx7qrQwvIGvResSnrcc+UIxzC4QlINjOicFmSCU6e2yV8q+34kQooqGkUqyTqahIqLARJz9Js+7
	bEpNYhM9A21/p+dK04WDZA9oxA7F8f0GqxgOfYVLQA2zX9smhv0yNL4skdjzmxk7ImsjbPen6kh
	5dkijvuAwQEFo7qAqacqUtf28eNfjvpEnvBs8H83pcx+b+iMnwkf/BkV4+jYMIQ1x6y1Z2SA+4h
	+Q3bKkQyY5ar3I5X4C98
X-Google-Smtp-Source: AGHT+IHc4CHZsEKtrbKoqsvQuk7s8d7ztPIkr6RcVt80vc3QzxXaarBhX6RGKClxBNRbJgcbdd+I5g==
X-Received: by 2002:a05:600c:3c82:b0:434:f5c0:329f with SMTP id 5b1f17b1804b1-438913f08a2mr390752945e9.14.1737915501290;
        Sun, 26 Jan 2025 10:18:21 -0800 (PST)
Received: from egonzo (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438bd4900e2sm102554375e9.24.2025.01.26.10.18.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jan 2025 10:18:19 -0800 (PST)
Date: Sun, 26 Jan 2025 19:18:17 +0100
From: Dave Penkler <dpenkler@gmail.com>
To: kernel test robot <lkp@intel.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 3/3] staging: gpib: Remove depends on BROKEN
Message-ID: <Z5Z8aaPYfxtOnMJV@egonzo>
References: <20250124105900.27592-4-dpenkler@gmail.com>
 <202501252201.OmgbVCva-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202501252201.OmgbVCva-lkp@intel.com>

On Sat, Jan 25, 2025 at 10:47:53PM +0800, kernel test robot wrote:
> Hi Dave,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on staging/staging-testing]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Dave-Penkler/staging-gpib-Fix-pr_err-format-warning/20250124-190232
> base:   staging/staging-testing
> patch link:    https://lore.kernel.org/r/20250124105900.27592-4-dpenkler%40gmail.com
> patch subject: [PATCH 3/3] staging: gpib: Remove depends on BROKEN
> config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20250125/202501252201.OmgbVCva-lkp@intel.com/config)
> compiler: alpha-linux-gcc (GCC) 14.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250125/202501252201.OmgbVCva-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202501252201.OmgbVCva-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    alpha-linux-ld: drivers/staging/gpib/hp_82341/hp_82341.o: in function `read_and_clear_event_status':
> >> (.text+0x1400): multiple definition of `read_and_clear_event_status'; drivers/staging/gpib/agilent_82350b/agilent_82350b.o:(.text+0x13c0): first defined here
>    alpha-linux-ld: drivers/staging/gpib/hp_82341/hp_82341.o: in function `read_transfer_counter':
> >> (.text+0x1480): multiple definition of `read_transfer_counter'; drivers/staging/gpib/agilent_82350b/agilent_82350b.o:(.text+0x1440): first defined here
>    alpha-linux-ld: drivers/staging/gpib/hp_82341/hp_82341.o: in function `set_transfer_counter':
> >> (.text+0x1510): multiple definition of `set_transfer_counter'; drivers/staging/gpib/agilent_82350b/agilent_82350b.o:(.text+0x14d0): first defined here
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

This problem has been resolved by a previous patch:
Link: https://lore.kernel.org/linux-staging/20250122103859.25499-3-dpenkler@gmail.com/T/#u

This patch has not yet been applied to the staging-testing branch.

-dave

