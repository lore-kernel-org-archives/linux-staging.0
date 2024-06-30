Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BC24133987
	for <linux-staging@lists.linux.dev>; Sun, 30 Jun 2024 10:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719743878; cv=none; b=Rprz0wP3qilIZxrPT6lZm+qoQPFdkJYfAxJKKfbDfbwV/rJQGfFqcUqDIKnUKHhOo6Gfzv4ygQY08b31Tm1hfNNRpcNjqPkrKtVA2VNyDRFRyo34IMJ8L1xYdBpOSfSFtCz4u5xgAH6wlmXwTjdRGNMdxb1cUvOX8g9R4mCNLV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719743878; c=relaxed/simple;
	bh=bpcViS5LQY0OktTmKYD6xTF3nZ89Wbqo1+5YJX485f4=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=OMF0IocND/34HmZRApcSFqluTAuE8EiPBVqr6N0lRKEhSq0NQ7VY4oOhXikIhKS/p0xv7k2fBXiJuwZ2rYNK1lpXDvRt43OIg/n9g4SWCpJbAbnyNaEbivHOGikRGGD8cOTZqFj3y7zz9S8RMMopMYSE2LL7uSSw8JcYBOEkZrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eVoqvMaw; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eVoqvMaw"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-364fee5051fso152289f8f.1
        for <linux-staging@lists.linux.dev>; Sun, 30 Jun 2024 03:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719743875; x=1720348675; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:from:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iuE2Ud4V3w+e53yi43m8pMBIJuScpcjaVEcgNcib0DQ=;
        b=eVoqvMawXYm+ecHYKJ4e/RkzlQFXuKoJyLKV3RM+6cWuYSlyRE1BlvgU67ZlyL+Bh5
         snhcUJylzQQq6w8M9EdxhLxHyTXELry9T1Pksb4TdNSY7fJiQT9uANQsXVcYVIiMb63j
         /ablg+Crnxq4vWSLk44D00vV/up04PoNX9tMt5z4GNqXpcLQFJsS6yNUrsW5NgeT1ryt
         I2x0xDpWTF6XtLeerba4a3qTxDYY3PnyYsDDrEhaOee48+2RXfkR6PUGUJ09PDETetbG
         U//Wi1kiw9lHqIrsPyrGZsI59T09F2Zs0PiC7Ycr49ORb9u894Tg5Ntqa9nt/E+E2GxZ
         jhZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719743875; x=1720348675;
        h=content-transfer-encoding:cc:to:subject:from:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iuE2Ud4V3w+e53yi43m8pMBIJuScpcjaVEcgNcib0DQ=;
        b=OJDljqjqoNK/n/hXm63fD5kWQEaXs8U86Kk4Bzqt0NAKl2Z0iRRfleimEbx71pOZPP
         R4gsSe6usRPMuaG7zyeQOF5v7cwh+tKgzT0Y32xfiJQLGHLRHIR4erJxm4mCISng7c+b
         2khmw7Q2iM0+qgQP7X5fqSfevtkOD24maGJGlgHRjhfIIfz6kbwfqbHulRISGMBk/ywb
         yiMaSzFjHFHuQJyPpu1tnLVT9Lsv385WH8fMxwOT+vMAsFs1NJ6ctBhwJQjxZ64MQ8eF
         GT8+a7R1XHx7KQ0Qmy9aE/xHYtUSYFM/UNaKoaps+Yg2u8O3brYcvrv7vapCLlhmWQJN
         kApw==
X-Forwarded-Encrypted: i=1; AJvYcCXihjVdXy0kijLtJgQbxBfD0i+pb62rEqsSzRaqmlqbQR3XEyHGTB0LFoj9sXejsg8xAgrdcDnHfeetBWUnGgwtWfCNDzzrOedoRYkzZA==
X-Gm-Message-State: AOJu0YwVQJZKq4wntEsP8VQrksxIC0REPN0AFbuD1//HTCG9m3ItjVFr
	aTMrLE3PbEXhxSLXj58Mt1R0URavsLJSI/G4NuLAtPkA6ZFidPMB
X-Google-Smtp-Source: AGHT+IHKMZ0WthVhHtisNWWMCcUCgeN80h/zkh4IY9YimIQzobB2EJFD5tra1jRJSemaeYnQJyFSGw==
X-Received: by 2002:a5d:59a4:0:b0:360:872b:7e03 with SMTP id ffacd0b85a97d-3677561dd88mr2087042f8f.0.1719743875235;
        Sun, 30 Jun 2024 03:37:55 -0700 (PDT)
Received: from [192.168.0.103] (p57ba2f9b.dip0.t-ipconnect.de. [87.186.47.155])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3675a0e1412sm7088215f8f.53.2024.06.30.03.37.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 30 Jun 2024 03:37:54 -0700 (PDT)
Message-ID: <13cd3ec0-0f4f-4119-b2a5-f74e33e3c862@gmail.com>
Date: Sun, 30 Jun 2024 12:37:53 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Subject: [RFC] staging: nvec: cannot configure to compile driver for testing
To: linux-tegra@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
Cc: Tom Mounet <tommounet@gmail.com>, Julia Lawall <julia.lawall@inria.fr>,
 Marc Dietrich <marvin24@gmx.de>, Greg KH <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

to test the patch:

[PATCH v3] staging: nvec: Use x instead of x != NULL to improve readability.
https://lore.kernel.org/linux-staging/66804898.5d0a0220.6df0f.4f0a@mx.google.com/T/#u

I would like to compile the driver nvec. But the issue I have is that I 
cannot configure to compile it.


When start make menuconfig

and search with / for NVEC I can see:

Symbol: MFD_NVEC [=n] 
                                                        Type  : tristate 
 
                                        Defined at 
drivers/staging/nvec/Kconfig:2 
                                              Prompt: NV Tegra Embedded 
Controller SMBus Interface 
                              Depends on: STAGING [=y] && I2C [=y] && 
GPIOLIB [=y] && ARCH_TEGRA 
                Location: 
 
  -> Device Drivers 
                                                      (2)   -> Staging 
drivers (STAGING [=y])
	 -> NV Tegra Embedded Controller SMBus Interface (MFD_NVEC [=n])
Selects: MFD_CORE [=y] 


But I cannot jump or go into "NV Tegra Embedded Controller SMBus Interface"

In my .config file there is no string "NVEC" at all.

How to config this driver to be compiled?

Thanks for your support.

Bye Philipp
