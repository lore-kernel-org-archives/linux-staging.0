Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A0EF17DE02;
	Tue, 25 Jun 2024 20:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719348742; cv=none; b=Hq9fofpGSqRVeUgWue1M4NHwpLl5KjxFYAfZNUGsrgkc0j66iUWEZZeIZYftXnP8T5pksEabQAKtidBa+Il9zhysyHYZQQEEeNLtOVov4Qy/6uiVdrfCcQkxrYJbp4zFNycoqNyVEPVUHitp2b9n36HmBlt5bj0rtvG9BhIeW+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719348742; c=relaxed/simple;
	bh=hiJgA6/DnnANN9qeLVXHvmiZDMqRcf+ipIv+ikZ+/GE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JbFW54Ut7s5V/Kvm8+IdqhzVcztyuIY7a2T+MfvbnkRACbu0d7B+jVYz8LWa5w6hT2HO7HojjdPAXvUSVDJ/ETDzUbkA7Ek6h4mSPEDRkJXoI1rm30YE0Fwi9hIxIf6IRkz18Qwn4hL0RGALCkyipVQOfLMmVCKP5ELcHdGzcjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C+Gogdw2; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C+Gogdw2"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-57d0f84b379so898994a12.2;
        Tue, 25 Jun 2024 13:52:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719348739; x=1719953539; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PHRkc9t07SlstseLeIgt/BF9i+oxbwcefEU9UF9cIXw=;
        b=C+Gogdw2oM86NC+SeHf7t7tywgV/t7Nevq4tGy4c4bxUhE5QLuqNzLgGgbF6tGyKev
         l9VMHEU+gNlxmaKb4VlSwM92VY08HfgXKjTkMT1yTgHurFxhCbSK1x6cslQ8Y6+mBLwE
         6BUa+pIPasQeDpq0jlSTn08oh01JvmUbt2FctokNby81oxV6OX/mMXNVz7VPwdZDBKIo
         hW3VEcqk6RvlnX0tyjaqwc7Wg4ILM+5RNgfZxST5Z4LTTYIVTNJ37Ep5K5ws3zbn9i6o
         U9jRrTob8NLbVasZ8b/UKSxFJop5gyTG0vbpY5/mSe0fV9QoyLoB0YZSXMP6ThOa+L7A
         FdzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719348739; x=1719953539;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PHRkc9t07SlstseLeIgt/BF9i+oxbwcefEU9UF9cIXw=;
        b=bcXJanjDyMZUZgen4LSwaPYUCmtFNG/0tRX8nt1ckzFcnM4DyjwwUpgX38uOnE3rB4
         7X/NACqDHzgYQ3+LoXodDpoWzi2/Eg7+/Wfync+7bf3pCuuI1QPs2Eto7B95J7g67o/V
         nKJD6Kq8rPkv7ajJ4Mqd7D2ggsVOnyFIyqhSv8F1+9wbnC25TRUoOP8bG8mP1nppjX7H
         EWP5eKp+AF/6As2tBlKtocsDs8y3r6Fi5MQ4x3EkFu4KH94Clx895MeYgYGKVZh1nKmy
         EiqPpVGzNBIHNWuLMGwyjAr0DT6/ydc8MXopjEuhOkEA5y2+xWkbB7K/vl91tKrxsiw7
         Njnw==
X-Forwarded-Encrypted: i=1; AJvYcCVeF5+jj9wVU9krgkg72vuHKrBM36puUAwFCjOnZAkwvDFxoW6/V6DSbXt4JS79n6WoTs8aLG5vJ+3EX3Z2sTiu3Uh4OqQWABgop32Bq1N8MVV2dRS44nj9OkRWv+02gvNBMmXowPYDGR5r0xc=
X-Gm-Message-State: AOJu0YwAxFxAwPJ1hjqcj2u4jQkznBDBzctjshrOnvxd7KmtL4j0b5g+
	5L/m0TRU8yBDckuPgyq9iOOG72i+6Z3mFXVZ8v5LT4hgZ4B2TeORn9flXg==
X-Google-Smtp-Source: AGHT+IGJnMiPU6FZQ9JOoLfal1V/WdfxPP5gjVBj6ljb7cVv+CJoVMW8AM6Z0i7Q6QmMjOqdkU49BA==
X-Received: by 2002:a05:6402:40d5:b0:57d:432a:582f with SMTP id 4fb4d7f45d1cf-57d432a5e3amr8476020a12.1.1719348739093;
        Tue, 25 Jun 2024 13:52:19 -0700 (PDT)
Received: from [192.168.0.104] (p57935a9b.dip0.t-ipconnect.de. [87.147.90.155])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57d3056301bsm6349566a12.89.2024.06.25.13.52.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Jun 2024 13:52:18 -0700 (PDT)
Message-ID: <9dc47763-1c44-4283-8692-5e7dce14a0e2@gmail.com>
Date: Tue, 25 Jun 2024 22:52:18 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] staging: rtl8192e: Fix conflicting types error with
 net_device.
To: Teddy Engel <engel.teddy@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 oe-kbuild-all@lists.linux.dev, devel@driverdev.osuosl.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: kernel test robot <lkp@intel.com>
References: <20240625163334.11117-1-engel.teddy@gmail.com>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20240625163334.11117-1-engel.teddy@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/25/24 18:33, Teddy Engel wrote:
> Add a pre-declaration of struct net_device so the compiler is able to
> use rtl_pci.h / rtl_cam.h.
> 
> Signed-off-by: Teddy Engel <engel.teddy@gmail.com>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202406250858.L8rJMHQm-lkp@intel.com/
> Fixes: 7dff0b27d9c8 ("staging: rtl8192e: Remove unnecessary pre-declaration of struct net_device")
> ---
> v3: Replace ad-hoc commit id / subject by expected Fixes tag.
> v2: Add commit id / commit subject  under description.
> 
>   drivers/staging/rtl8192e/rtl8192e/rtl_cam.h | 2 ++
>   drivers/staging/rtl8192e/rtl8192e/rtl_pci.h | 2 ++
>   2 files changed, 4 insertions(+)
> 
> diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_cam.h b/drivers/staging/rtl8192e/rtl8192e/rtl_cam.h
> index 3a5635494385..9deffdf96072 100644
> --- a/drivers/staging/rtl8192e/rtl8192e/rtl_cam.h
> +++ b/drivers/staging/rtl8192e/rtl8192e/rtl_cam.h
> @@ -12,6 +12,8 @@
>   
>   #include <linux/types.h>
>   
> +struct net_device;
> +
>   void rtl92e_cam_reset(struct net_device *dev);
>   void rtl92e_enable_hw_security_config(struct net_device *dev);
>   void rtl92e_set_key(struct net_device *dev, u8 EntryNo, u8 KeyIndex,
> diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_pci.h b/drivers/staging/rtl8192e/rtl8192e/rtl_pci.h
> index c645775b2150..3e39c4835ac8 100644
> --- a/drivers/staging/rtl8192e/rtl8192e/rtl_pci.h
> +++ b/drivers/staging/rtl8192e/rtl8192e/rtl_pci.h
> @@ -13,6 +13,8 @@
>   #include <linux/types.h>
>   #include <linux/pci.h>
>   
> +struct net_device;
> +
>   bool rtl92e_check_adapter(struct pci_dev *pdev, struct net_device *dev);
>   
>   #endif

Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
