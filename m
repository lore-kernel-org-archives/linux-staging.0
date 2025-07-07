Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 325DD293C67;
	Mon,  7 Jul 2025 10:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751885877; cv=none; b=eYIirYAknsFFFFodnanWXKtrljY9TsUAMyfLi8E3B6PblgD7dBRG1Nl2QKJTCJOYvA46QUm0VKhjPh172cG5Y8AFHmoIbUes7JUN5gj0hzhoB7kYmGJYXRdkiZsupekuyQFmqoDK+2S7qHzeCOyNM8u69XpS25sL39T8H/0J1m4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751885877; c=relaxed/simple;
	bh=CjdYiBoeMS7qseIEcuh47YFTpqlehtkQQLEcP/t1k+o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RK2P4//Yz4sbWObHXIeXUsBrYWi83hojA+6Z5kLZh3TLe2nTO7Lp6te8WdndCYRCfr6C4LUKi3HoqwStyJwJdxDe9GzJIk7oHEz+naZKOouVC6CrbSniFd1EKD80+blABmFTE2UHLuva8nGq6gPI9Y0mEeeBI5mVZrgKuU0ToG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VLNshdTV; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VLNshdTV"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-712e7aceb69so1313087b3.1;
        Mon, 07 Jul 2025 03:57:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751885874; x=1752490674; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7ioNsEHWfe5qdqz4ks5nH1iCIyBMczU2uy4kn1CK7dc=;
        b=VLNshdTVzI4OockyOLMZzZlhbv0aW/EDdk6fjFMIbVARw6Er8ailECWVpYTN9KWM41
         +xswyJrEYC4FDCjWD6qlo9t9jZqVmynMKZwzTXzvuy1Xhu3weG4sIBzkUtkGJOTOTPve
         o0md580W5+Szh1Q+//0aDuXRT3IW4u5gz1WVpICMS99JEzvFI0VwB3q56YcjpcP8kYwV
         8zOg65s9Q16CcQeVTqSf2LLXiOYH6z0HP0H8S2HcE4iSVM6SvWls1s0x05dJN0sxfGBL
         olf6mS5dnDrCL5y/yi8shZGrh9U/icXgHxghlzAbGg+DgHkI+A3bev94HG6g3QVUZ0ue
         8oMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751885874; x=1752490674;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7ioNsEHWfe5qdqz4ks5nH1iCIyBMczU2uy4kn1CK7dc=;
        b=AmNWtrPQ8DEuulTNcHBZBHABQ23Vko2wacyMk6CzJ90q0mEjvD51DgDs/K6hh9XBYA
         2KZonwiYPdjpgjrQ1ddCnGR8V7CqM4jOM97JF+53mty2G1uwU0axcwKep/yulOivWAUp
         EKvQzQfBu8ZMxtVwSMt0nOh5Y2PhnFqQZpMp8xIMFzHJTsu+H7JYEwZOdBIrdHjMdcll
         15+iaibMPO/9LaXewi7GJ92QFodSvRzHAh2ClRnjmUe/yeMbZHsQp34diVvpZ37Rz9oG
         K8l137bFv+FXJ4w14WIChSazPGGtbUJRfo/b7MXeEtldt5uEdgIYzbuniMm+HLjqGwlf
         qW+g==
X-Forwarded-Encrypted: i=1; AJvYcCWChVc2kE8+A0Sxf7DRHGxvUpwCaxxn594njn8cY6qOCH4bZcd5f0MYkmtmgC1dUaobeft0cmNgzMjvXrkvkg==@lists.linux.dev, AJvYcCWbE+hEvdEW6trEEbkOSutSHDWUOcZ6tEnxc5QiPZLFqO/IycXmLDwHR7lVg4CZAFo/Z4ji2l5+acdSkN9uDp2Euc2ilQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzo0F8yWCef2jIQrCTsILaQeqIH59k2N+LSKzhLV3Qrzt3i6+9Q
	SqF+Xh9NNFiPmWbbEf4Pye1fjRYe2bw0WSmkoa8Cfa3ad3feqYq7O/QIi+RboIh8Oz+UU8MMUbv
	9FxTmvsJ1BABORJlEewt8P48kJeiDBV4=
X-Gm-Gg: ASbGncvYLjO3CwJhscYJEGvDzVCH92ULueAtjFJAffPwnXVgP+tz2VCgQ15Quk7Xlxd
	2U7llqtIx2/RlgcywQQrhOV2PvnW+DPHQgjHPHCX8p4ymvCe/YZf2oHUK9vfN60dOrIFR0Iad0l
	MlT1m7Y4rhPcHhxv5CzJiDz8cfhjUNkACK2XRb4JRqPxk=
X-Google-Smtp-Source: AGHT+IGC8/osnImIufkkdDbo94SnWRe56rECvcr4sumXfQ1CXHwC0L1J81sjFCmHQGPgO6vDkShX/OtMSww4Y9CubhI=
X-Received: by 2002:a05:690c:1a:b0:712:b566:bf7c with SMTP id
 00721157ae682-71669eb7e1bmr71790577b3.1.1751885873842; Mon, 07 Jul 2025
 03:57:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250628052536.43737-1-abdelrahmanfekry375@gmail.com>
 <CAHp75Vcy3dHRu8Wb2KZ=xK7adz=-P-iuRTeR8vOWzHzZL9uFeg@mail.gmail.com>
 <CAGn2d8OMRaeozOMxj1Ry8i9T3sJ5J1QqA_Jpk7wYO8KiUbpKBA@mail.gmail.com>
 <aGPYZhK65LaD0wVO@smile.fi.intel.com> <836dc6b6-2821-47fc-8f24-0838f979af76@kernel.org>
 <CAGn2d8NBEwWm0mQ0YQ3KZ+V1Zon84zusfsQQV2foVmUTBAzEAQ@mail.gmail.com> <fbfbd0e5-2c27-4f32-a3d7-9cf57fde5098@kernel.org>
In-Reply-To: <fbfbd0e5-2c27-4f32-a3d7-9cf57fde5098@kernel.org>
From: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
Date: Mon, 7 Jul 2025 13:57:41 +0300
X-Gm-Features: Ac12FXw7W1irHG_Shk7SGyIt6mDyRdJM1OxzhEC8PPcEWPID0WwjfabTg3nNrbQ
Message-ID: <CAGn2d8OrhbJ_MqZEwfCrXy27+-a_6JVDQW_TVmVHM=mWbcEe2w@mail.gmail.com>
Subject: Re: [PATCH] staging: media: atomisp: Fix premature setting of
 HMM_BO_DEVICE_INITED flag
To: Hans de Goede <hansg@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, 
	Andy Shevchenko <andy.shevchenko@gmail.com>, andy@kernel.org, mchehab@kernel.org, 
	sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org, 
	linux-kernel-mentees@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	skhan@linuxfoundation.com, dan.carpenter@linaro.org
Content-Type: text/plain; charset="UTF-8"

Hi Hans,
Thank you so much for your support and guidance. It really helps a lot.

> The hmm_alloc code can use some more cleanups:
>
> * hmm_get_mmu_base_addr() should be moved to drivers/staging/media/atomisp/pci/hmm/hmm.c
>   and then the "struct hmm_bo_device bo_device;" in hmm.c can be made static
>
On it .

> * hmm_init() sets hmm_initialized = true even on errors. It should
>   immediately exit (return ret) on errors instead of continue-ing
>   with calling hmm_alloc() even though hmm_bo_device_init() failed.

I have created a patch for this but i was waiting for the other patch on
hmm_init() to be applied because it builds on it.

> * I've checked the code and hmm_init() is called before any hmm_alloc()
>   calls are made so the extra hmm_init() call in __hmm_alloc() can be
>   dropped.

Same for this too , i was just waiting for the prev patch to get
applied to avoid conflicts.

> * After dropping the extra hmm_init() call in __hmm_alloc() the
>   hmm_initialized flag can be removed since it is now no longer read
>   anywhere.
>
I agree with this too , will do it

> Regards,
>
> Hans
Thank you
Abdelrahman Fekry
