Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 795FA2AF0E
	for <linux-staging@lists.linux.dev>; Sun, 26 Jan 2025 18:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737915189; cv=none; b=gaxDIrKsPTlWvD9b1Ksy4i8ixEQRwb+9mQmjeAL+ZyYudfzR3d1zxkqyqWYbAvpisRHd3o68AUuXrxAjkag6v2uyyxlMnzdptv93SqVCJjzK3aClxJgVsyW5OP+3iCqqd9gIzyvhQd2ShLY7cHH9eDP4Sjl1iLodsZ9ox5Levtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737915189; c=relaxed/simple;
	bh=2Z5f3Ho/goba7XKv9XKk65eWIRKrQfD9BWjYDKnQXMc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z4bQNG9c3dwcrnqH29lc+QLchuHTit38Q/CITM14ALpfqpGbNxfGBnRejnMa80MX+ogqAH9GFogRY+6ZyyhHzt5JMqXo4Zw8eUI+yowK6xegKHW99rcLQU8PiFBg4I5NDbvwZS/ezqpsdh1kEwh4PRYE4C2R97Xtz6obvm1+bvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l+/qK8qq; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l+/qK8qq"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-38633b5dbcfso4213785f8f.2
        for <linux-staging@lists.linux.dev>; Sun, 26 Jan 2025 10:13:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737915186; x=1738519986; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uuUC2RadicKmNdt+Kmu6m/kYLq/GvnYjtGgefyr2vUc=;
        b=l+/qK8qqawoFvjnd5Hb1lwIw2oIKwuxIJAT/PX2tKeHX+3DEeChs1f1MWnzz4YXyPM
         TVyk1Zno8rMHbjHmVJlhveLpqmzB5NqG3z/s46+MabV+oDPGA03rIXg6/iz1mIVNxvop
         Kg1c148vrNPLcj98ciWNrjReXviO/m3zzWpcTUOQxj3XPMX/Ea1oeRqNV6driTprLCnZ
         YPpt7n3m2+KwMezZmOJHd0NOIvlw9pWHyYjX1BczkDV3tedGRiZi09R1v4XODuUIPddf
         vDNzKLlRWJsxGuEce5SGKcV/NdHspSmkM0ycu543cL0H8S1UAM4FEtdNF8iqaXFJaEcl
         CByw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737915186; x=1738519986;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uuUC2RadicKmNdt+Kmu6m/kYLq/GvnYjtGgefyr2vUc=;
        b=QggChYKszdh1YW3nm/v4y9gEqouHPGo8geZ4MZsoOCUIj4NLm7A+yrArF02k6pCh+3
         x8f7Gyirsx+iUQoPrgIOKOpDlnFDtz3aXs/H46B+wfi7r3OceA0e/iFrkL5iOptrUOpc
         yH5bSgp/NglrGg6TyCR1EqqgzYsnd+m0fwVeVyf+OKeHaBM/gg2WOr+HheJ79bffFjiG
         prkNjbLUo1f1eaGhKoGjgriHkZ+NR4dbVa/O/q4q+/EkU5yXpSU4Kew/2f+cZq7GHLr7
         +JG+hlaK0rXzgbSnZiLY3k3pZun2fysHMa4HD8TpW2FzFcvi4tZTvPtGFNm6B+pp+bEm
         SKJw==
X-Forwarded-Encrypted: i=1; AJvYcCU/2mJfs1jq6DmohkhFTXCdsG1dW1tDxHh+F66yb/85B3GJcKqTU6RWXLxMGO0i4wflk5jJbl11YsFbYfgS@lists.linux.dev
X-Gm-Message-State: AOJu0YyFoQioxfRsYXS2OgIsKcBOqbRVw27BGVILHURI8BKQXpR859hJ
	pgAaq1H0cHAc8zyLoufxcZrUEpadwwyofCb8L1NyGucE8jz8dteA
X-Gm-Gg: ASbGncslCNRXL1qWJhEuLib3She3/U7AXys6dm9twgMDSU2P+rxqRpwwG54xje1a11j
	2lgZeriEXCqQsMacXpNgJt1xOQrCoDspQTlJngvvhofNhWXFiFRNmov+n4zTSsb4B04mJd/JJM2
	1At7DIT0KaZa3Dk3BHaa0bwQn1z/NS1rwNKYJ6agdqbIhQV4q27cHNO4TrohRa8PIep7Z5Fmw8p
	iG9gPKcQTnL7H+m40xB3uOL6orVQYKC3H2HxlgPm4AdHbPz0GcaUAYvVkAmP7iYtOU8PrWbsWzG
	rXEECJBWEWPKEZrdEEHG
X-Google-Smtp-Source: AGHT+IGXvcULgIgx69vt973bLQNtKSFbRZpvKAGdjau0peUuwKgyDDJjdlVUkrLE+Jb9otnaJOCV9Q==
X-Received: by 2002:a05:6000:1863:b0:385:e877:c037 with SMTP id ffacd0b85a97d-38bf57a7515mr37910617f8f.42.1737915185331;
        Sun, 26 Jan 2025 10:13:05 -0800 (PST)
Received: from egonzo (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c2a1bb0besm8841008f8f.79.2025.01.26.10.13.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jan 2025 10:13:04 -0800 (PST)
Date: Sun, 26 Jan 2025 19:13:01 +0100
From: Dave Penkler <dpenkler@gmail.com>
To: kernel test robot <lkp@intel.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] staging: gpib: Remove depends on BROKEN
Message-ID: <Z5Z7LZwtn32wwWKy@egonzo>
References: <20250124105900.27592-4-dpenkler@gmail.com>
 <202501252218.eaGgSuN3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202501252218.eaGgSuN3-lkp@intel.com>

On Sat, Jan 25, 2025 at 10:16:20PM +0800, kernel test robot wrote:
> Hi Dave,
> 
> kernel test robot noticed the following build warnings:
> 
> [auto build test WARNING on staging/staging-testing]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Dave-Penkler/staging-gpib-Fix-pr_err-format-warning/20250124-190232
> base:   staging/staging-testing
> patch link:    https://lore.kernel.org/r/20250124105900.27592-4-dpenkler%40gmail.com
> patch subject: [PATCH 3/3] staging: gpib: Remove depends on BROKEN
> config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20250125/202501252218.eaGgSuN3-lkp@intel.com/config)
> compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250125/202501252218.eaGgSuN3-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202501252218.eaGgSuN3-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
> >> drivers/staging/gpib/hp_82341/hp_82341.c:802:35: warning: unused variable 'hp_82341_pnp_table' [-Wunused-const-variable]
>      802 | static const struct pnp_device_id hp_82341_pnp_table[] = {
>          |                                   ^~~~~~~~~~~~~~~~~~
>    1 warning generated.
> 
> 
> vim +/hp_82341_pnp_table +802 drivers/staging/gpib/hp_82341/hp_82341.c
> 
> 6d4f8749cd5da8 Dave Penkler 2024-09-18  801  
> 6d4f8749cd5da8 Dave Penkler 2024-09-18 @802  static const struct pnp_device_id hp_82341_pnp_table[] = {
> 6d4f8749cd5da8 Dave Penkler 2024-09-18  803  	{.id = "HWP1411"},
> 6d4f8749cd5da8 Dave Penkler 2024-09-18  804  	{.id = ""}
> 6d4f8749cd5da8 Dave Penkler 2024-09-18  805  };
> 6d4f8749cd5da8 Dave Penkler 2024-09-18  806  MODULE_DEVICE_TABLE(pnp, hp_82341_pnp_table);
> 6d4f8749cd5da8 Dave Penkler 2024-09-18  807  
>
 
The MODULE_DEVICE_TABLE macro does not really "use" the hp_82341_pnp_table
variable. It just generates a mangled symbol with it but it also adds the
unused attribute. However when compiled as a built-in the macro is a no-op
and so the variable is flagged as unused.

I think the unused pnp_device_id variables and their MODULE_DEVICE_TABLE
declarations can safely be removed or bracketed by an #ifdef MODULE

The same problem exists in drivers/staging/gpib/tnt4882/tnt4882_gpib.c
and drivers/comedi/drivers/ni_atmio.c

-dave

