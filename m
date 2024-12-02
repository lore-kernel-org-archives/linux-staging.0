Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 020351DBB03
	for <linux-staging@lists.linux.dev>; Mon,  2 Dec 2024 17:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733161733; cv=none; b=jNnMg1iaVF+0zWm55+zO0nghZKaH5KMhtHydsvpetEPXk4Hm39ietuRMmFYEkW+fU0A9tSel2QlKTCYIJckiFTZgT/QpUZI2EFoLmingnsfk61jMTGmquX7tO2Ka3yEkp1ARErXwh7rKRAt1pTDZbhZLJ6KL9DHOUrDBzIqFi2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733161733; c=relaxed/simple;
	bh=WKospFR6+WV+Zjl/3/4cyAzA9P+WMRVfkoIaOmiAd2E=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=OGPf7CTqmoznLcacTFGPW5SBwZIsAnkg58AtDhxs7iVa9UcZOVbZ7qctCSbVEVK7JfEM+DRrxMbL7VSXNChWsU1eL+M2oUfhznb9TyWN20RhSLY6DOmVSjY6zEciqKacaSl/DyWGcHAB973a5Nt831jnS6kXSWbusLxQTn5Wqg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HXdopjpM; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HXdopjpM"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-7fc22a88bcbso3201584a12.2
        for <linux-staging@lists.linux.dev>; Mon, 02 Dec 2024 09:48:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733161731; x=1733766531; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=S8JMWjbRy8E+huOpI4PWDUpf5cc+KWX17p6yAqPuPD4=;
        b=HXdopjpMRLujJEEtUr3yk746rKroQdwBSCfin15SwAZFt2micfBB7kcxVOFilF6cmm
         W044Vk6a3FhkgkhMJlczGhSZ3DM9zwS8bmrC5GjN6wncRSCLZOkQzseqw63VSVm0Cg2d
         RKFRQPPkH/HUEZbBRlYajKVR/k74ykVJAPBKBV8dqWaVU5Y0qTJVViFp5larQxYwQHOo
         jFE1GAvSp3fkHKeySiMo+hJLtrDeDtbsvELZF3NVFSadu/N005tX4zE9N57YnTH70InX
         TwmWcHhrUaY9itiiDFZPWdTjp6SSuKee6GvgUOtFxPWT7DPBglF+fCYBaIt5KNRakQNZ
         2MRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733161731; x=1733766531;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S8JMWjbRy8E+huOpI4PWDUpf5cc+KWX17p6yAqPuPD4=;
        b=UNkTaao8L6V6wFDrVg0vaNR+RmmLL+uFQ+Dj5d+RpA0Ph7MDSltzxobRA+gnzGazly
         zrMoPgR7lbAha8L5UZeY2Ym2iegGE5J509bNHCpZaZpBqPiEeF7x+VNBCfR4AkmczPY8
         8EnfljwHhcMaUUGmsoUIlmn63Cmrr9R1erFPWBoxaP54X7fcqNQS9WVT/jvY/lPUcWzw
         e2HArot00L85kMJcjsRIEVVjXD9HQAAFME2iCdEs8uEum1ChR+/h0GIarw6dUhqrJibb
         ozf0HBVhosoybEGe9mdY2HbdQSMUtgu5rEnCbbLQWL7u8WmOsa8hviAB/aWQpRht8FNH
         cXgw==
X-Forwarded-Encrypted: i=1; AJvYcCUi2+Rgec+KHqalzRcUXP/8A363i4JGr0QBWScoSe3NLZwG4Uc6nayu9+jCmvTzo2hF34EiYR+rd/QFJvk2@lists.linux.dev
X-Gm-Message-State: AOJu0YzGxiayfoidQ8xvbfLHGT67tU16AiaKuFb/bKki4p0vM7kCv2Pi
	9KsK2ZuZM1CddrA/kqpUuahixnF+j4XjXaAlJyCA+jayIi2RUoeU4gxuew==
X-Gm-Gg: ASbGncujh24F2S60PeXcBCQf+jrZyxZb+iThBfd3x80iJx0wj6RhfVAXAprQxdsdREw
	8FTCl/agnjCnKKea8TSEO7iQoCL0Uj5TV63tmp07wlZIL6JSyWf9zlRn+VJAB+vW1zh9jv1cVtO
	+ZInYnAlrPABkdAwQSw4ugiEgJ77lcjjP7J6qWqWgRGgvRJPhEc/tshJ0IA/0TWCsQlcRCoPDTB
	KzS2xH3suKuyjUE97X9zhjyAY/loDkAanjYbAa85+cSIwx/Ve+vO38nkIFMNDja+Obp1Q+m1IsE
	rVq2086cQ4IwEJ8x59tkaFk=
X-Google-Smtp-Source: AGHT+IGctXjbY1GfXjI9+V31YWmakVA/xpMLR9J82y/OAK1clFMOU3x213fpwCCX4aZRO94dpIjiZg==
X-Received: by 2002:a05:6a20:6a09:b0:1e0:d104:4dab with SMTP id adf61e73a8af0-1e0e0b8d1cfmr34054425637.44.1733161731087;
        Mon, 02 Dec 2024 09:48:51 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-725417fb9adsm9082044b3a.127.2024.12.02.09.48.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Dec 2024 09:48:50 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <88c8ede5-47c0-49ec-805d-161293eec679@roeck-us.net>
Date: Mon, 2 Dec 2024 09:48:49 -0800
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] staging: gpib: Fix i386 build issue
To: Dave Penkler <dpenkler@gmail.com>, gregkh@linuxfoundation.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20241202173301.6462-1-dpenkler@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20241202173301.6462-1-dpenkler@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 12/2/24 09:33, Dave Penkler wrote:
> Both drivers cast resource_type_t to void * causing the build to fail.
> 
> With CONFIG_X86_PAE enabled the resource_size_t type is a 64bit unsigned int
> which cannot be cast to a 32 bit pointer.
> 
> Use ioremap() instead of pci_resource_start()
> 
> Reported_by: Guenter Roeck <linux@roeck-us.net>
> Link: https://lore.kernel.org/all/f10e976e-7a04-4454-b38d-39cd18f142da@roeck-us.net/
> Fixes: bb1bd92fa0f2 ("staging: gpib: Add ines GPIB driver")
> Fixes: e1339245eba3 ("staging: gpib: Add Computer Equipment Corporation GPIB driver")
> 
> Signed-off-by: Dave Penkler <dpenkler@gmail.com>
> ---
> v1 -> v2 changed pci_resource_start to pci_resource_len for second parameter of ioremap
> 
Sorry, there are some more.

drivers/staging/gpib/tnt4882/tnt4882_gpib.c: In function ‘ni_isa_attach_common’:
drivers/staging/gpib/tnt4882/tnt4882_gpib.c:1430:26: error: cast to pointer from integer of different size [-Werror=int-to-pointer-cast]

drivers/staging/gpib/cb7210/cb7210.c: In function 'cb_pci_attach':
drivers/staging/gpib/cb7210/cb7210.c:974:36: error: cast to pointer from integer of different size

Not sure if that really fixes the problem though, since there is other code
which maps the void * back to phys_addr_t (or, rather, to unsigned long).
It might be better to work around the problem for now by disabling support
for platforms where sizeof(phys_addr_t) > sizeof(void *).

Guenter

