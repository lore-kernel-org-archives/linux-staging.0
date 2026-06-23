Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30A5139E9CF
	for <linux-staging@lists.linux.dev>; Tue, 23 Jun 2026 20:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782246529; cv=none; b=r2H+u61s22i+snuxtgHJ45wrACZe1gVny2FF8+kozCbeqkCmUsK3Z8KMLDXs3AVtIUXjKPBWwCXFNI6AHDLdbYPyU/onI6v+LjP0/J51yrRpotdvAsY2xGWbFSsRG/ofb6J4XhMdT67ceJnq0sXn5kVcEdSUbyKfizWvHm7CH/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782246529; c=relaxed/simple;
	bh=t8xcItmxlUvZa4FfZZJt06O8z78xeEb1VcfkqELMyB0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sg9rBJBfcloF/uSaTHeyAXsNmFc7jCkPDWcEk+3amp6klMWgLzAWgM3AbjIL9V9IcNeqtg4aXzGnp3qglUJBBRpioRCoV8dFSxOhTZ5+/N+o1+26tyt1wgFSbJ9LiEnVGcVyoQbQqHw6cQEGFRrhrF++otbP0VmWFfvphCiQOBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ovzd7xfi; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ovzd7xfi"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4908b92904fso3431135e9.0
        for <linux-staging@lists.linux.dev>; Tue, 23 Jun 2026 13:28:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782246527; x=1782851327; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HUvOpAp1AnoH/UC2gSkhKh0euuT0oHxArLADJwiZt64=;
        b=ovzd7xfi1dyKqWEZ9j2BjSynoHVEfeEiRKqdK6Q9+0+6dzkQm2nuXYqPiYcCoQCn4p
         8VNxchedMpPe4AWGkhvcARWMYGlhIsar1h2Lj2TSJw6mjYHl2JYzdSVl0Hj+NS53wtUk
         dkENT0NrNf06HBpJLKYp+eTeu0l3RfCOJWaKh+YqVM2Hr/R4Ca5hbQH+rBJTos78AS68
         6PktDvPRASyAMmlt0ruJ64OY8CuLVmOrKxJYiLjhO73m6fcM/CtlYfAtww9BV9kZOAGS
         BsT5PinYv0FlJ11fnaxmlSmLVm+3EDgeQx7fFS+WcwU4PC8AsYSwiR4AnCVp5ZchgEWe
         FgAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782246527; x=1782851327;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HUvOpAp1AnoH/UC2gSkhKh0euuT0oHxArLADJwiZt64=;
        b=rP1qcw2g8688wy+VTr2EmCjijaJPgFc3wQa80+yXJKW4tzOkY64G6C+iwdVZgJJALK
         cn/EcWsABWHn/thNjdJtiXNDOwsivLZ4HV9MSyZxGsZFvqQDhBzVOriR/+UOa8U2S5wH
         VX/lPDtBl3Tiu7eGJr5zI3e71jC5NwEkJrYTTllNoxWuFOo/cTRmWYN7H85HN/wEHyG3
         PfQ9Nn92Q1qqSbIaJQVkpzmgEKjFFmGmp6PK2IXtID2nexjf45IEC5jBVZomM9DLMHOG
         9XfRrcv1U+H2q8SyhV7DGdcJSYKvoZaiv9J9LRgwTmxXpPdtbDr1jMI89jQP6/ygcrB5
         Yczw==
X-Forwarded-Encrypted: i=1; AFNElJ/dX7n26GZ+9LTNr2EYSulXW5gGQ0SYlTmiqViUoFNgVYCEHLxnsliGoiqKYEUp3ITbNyrhro9F8UcnoSWZ@lists.linux.dev
X-Gm-Message-State: AOJu0YxJ9rFUvxROwVJjTljOr9SbSBu1L2pwbwlqDIoUlATB2wk2jW2O
	giTyXAd0qXQNo8e7Itzxrqjfk51P6EFiWoFaIxKc1NDrmTHciAZ41JmP
X-Gm-Gg: AfdE7clrpKJtPaqnvCHjjxPQeBKFkbBUytlP6kYN0yNVLVTatFz7RfpDk/cUN5e7diR
	f85FGOVS/D5cEH5zvZ+g0i82d4q0jX0pnJv/O7gumTwDWhOTOGI/no4blRL6lfs/q1knT4LBe1L
	m0PY/GzBPvy+TUHugqTjb2aXERxjhhG2dswoUAHIG09PYTSGs8mr3e1WVhRMs47tG+OMhQR9COZ
	7/Ywf8UT+daOYuDQKpWpr1A+DCFI/VqbXhDtT7C18ntYch6tSNxmGifYz1cthNs/1NrzI0YBwjp
	yjxL+9HXVnvO6AzJjtq9qsMFsKK9L+ttYr1MSzALCJAp2Y+PPC4E3q7yCCvDxgd+Xo2FmlZ7Xtn
	bp+T5xBtKsbOVdaG+XH6sQdQd3bR+vnzSyv6GF8cvGCpbk4ps2HuNb5iapEc+M94+ZNPlpw11IU
	BBNCCvK4hZaVHzPmbRIGks0e3ngSNJGsOH8+SzzQ==
X-Received: by 2002:a05:600c:6308:b0:490:b8c0:d470 with SMTP id 5b1f17b1804b1-4925b37eb4emr62966205e9.19.1782246526525;
        Tue, 23 Jun 2026 13:28:46 -0700 (PDT)
Received: from anthony.local ([2a06:c701:49b2:4c00:12ff:e0ff:fea5:3d2e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49249207dabsm570397635e9.0.2026.06.23.13.28.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 13:28:45 -0700 (PDT)
From: Amit Barzilai <amit.barzilai22@gmail.com>
To: javierm@redhat.com,
	andriy.shevchenko@intel.com,
	mripard@kernel.org
Cc: airlied@gmail.com,
	andy@kernel.org,
	azuddinadam@gmail.com,
	chintanlike@gmail.com,
	conor+dt@kernel.org,
	deller@gmx.de,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	gregkh@linuxfoundation.org,
	krzk+dt@kernel.org,
	linux-fbdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	maarten.lankhorst@linux.intel.com,
	robh@kernel.org,
	simona@ffwll.ch,
	tzimmermann@suse.de
Subject: Re: [PATCH v2 4/4] staging: fbtft: remove fb_ssd1351 driver
Date: Tue, 23 Jun 2026 23:28:11 +0300
Message-ID: <20260623202811.16262-1-amit.barzilai22@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <87ik79iqsz.fsf@ocarina.mail-host-address-is-not-set>
References: <87ik79iqsz.fsf@ocarina.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Javier Martinez Canillas <javierm@redhat.com> writes:

> Andy Shevchenko <andriy.shevchenko@intel.com> writes:
>
>> On Mon, Jun 22, 2026 at 06:25:06PM +0300, Amit Barzilai wrote:
>>> The SSD1351 support was added to the ssd130x DRM driver. To avoid
>>> confusion and irrelevant updates, the staging fb_ssd1351 driver is
>>> removed.
>>
>> NAK, the fbtft has two drivers in one (SPI + parallel), plus as Maxime said,
>> it has its own binding.
>>
>
> Yes, I agree that we don't want to delete the fbtft driver.

I will remove this patch from the next version.

Thank you Javier, Andy and Maxime for the feedback and explanations.

-- 
Thanks,

Amit

