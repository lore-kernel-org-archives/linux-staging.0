Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00A11178CDE
	for <linux-staging@lists.linux.dev>; Sun,  8 Sep 2024 20:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725827174; cv=none; b=fKd+VKgm1UMLVta9gQaFrwpSmXie1Pwju7mt+xW+QorU8DbOjXCbeh4fIcSQUy7OItij7/9TsGKl70SoxcVc667v8HiNXGELLXsvvkVQEGv+61HBDWuovMA9XzzxKwOuWfp75c1VWF+zbOLrc0uP02QLbUDECgqN8+H//UO+DkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725827174; c=relaxed/simple;
	bh=ZONi8oTVgdeLD7glO6pXuDk1u8cI1QYm/3E0oElhbP4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AVboCrHyl2fd9uZnqB3wqkc8GFjUMOBM2I2t8E2fP+Laj+HJQXWwANDzIHeH0kYAdhmY9pFECSOCiOlyvZcXNbDE3VaJWehsjwaWlek6uPu1z661nQr0mWH1thOICF3bri6xSHqB4HfSNNXwn4+vfBL7yKqbRI2BZ5I9Ixi7iv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QNdRc22x; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QNdRc22x"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-42cb1758e41so10304055e9.1
        for <linux-staging@lists.linux.dev>; Sun, 08 Sep 2024 13:26:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725827171; x=1726431971; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KFgTZS6YaG4OZRC2cQbKF/8vq72Pq4HNgWz2U4ZCqEo=;
        b=QNdRc22xjgMzIvRCGxFhE5GVU7kbCke/W33tZ6UEzi9jv7kSYXfBEkSWU1P/wV+kny
         jru7YpjLkq8UttzCmWEXc5iWYTYTRxTyo09/wywG2/3it81CevO4jwmD8Sv0e7LSgv3R
         ZwyH93jfHd/ZdTLsr4BSUOtm1z8/qrjY6S8UWfT58VsgYHwBGJSqAqoRt4W1+N48u5LO
         Zt7ZxjGf/LOn+og0bMbe/cAtiWssnzL+0g6iqnRaedTaXd4dEeh/YFLkbda0CkmKM1TV
         tUo63wD13P1sHZMy3BxzoAK53BTEXbl3Z5opMlkapQYn5oqoDv/KJxBtIOOJL6q8sC/4
         F+QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725827171; x=1726431971;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KFgTZS6YaG4OZRC2cQbKF/8vq72Pq4HNgWz2U4ZCqEo=;
        b=J/XI3zKbTXa6mnzOXdAg4/cQa3DJ5nihIwGC5Sq0PMi3EjCjAU/uEQrXztQ+6hXfuk
         AXwAgd+Bo96pIiqDYT/76zuV0lteWUfY5JxvT/yqnq5btwFt+I9UPy0fAVgfREqnJnfN
         VP7SL0Ey47qIefrCxGdo3Y9Eeh2UdLFNoXL4FBwxDMfG0fz0Gdj+E7vutBF10K+NQz/F
         YmbRGShTPEGO4Os6S7TBLWJAahshQrnhVkUkvmKOkAi5MWHIaeKkUEH96yWL+RATmoVi
         7tu3ylHBoWOk1pv5ODWFBIe3s6zeXH59x4e1qJmsHWQJ5XqAGaOlqlDTgcM68Mjh7wXM
         g60w==
X-Forwarded-Encrypted: i=1; AJvYcCUWJVYVWpAXsUhzatc1jOFtb4cbjUupWsS7p4LJJmKt40NgmkJcrIc/BTkYAwYplkub2hgLnEbHdafoEgcZ@lists.linux.dev
X-Gm-Message-State: AOJu0YxKQ3QspjDHi5LC81CGSbPTOVVmtsvMZlWfXk1eyv0jbzpe1L4l
	Lla19IzLky7l7mX8Vmd6Yte7bTTsVBYgSVDT4iT2gmOqtFzThj8g
X-Google-Smtp-Source: AGHT+IHVNtAxcHLeKntFo0w1vxjjPlBWpIVcqJJM9cZm+EOP8X5coWa622xs7sypcOql4/uV4QZ3uw==
X-Received: by 2002:a5d:5189:0:b0:374:c1de:7e64 with SMTP id ffacd0b85a97d-37894a53e29mr3416928f8f.42.1725827171022;
        Sun, 08 Sep 2024 13:26:11 -0700 (PDT)
Received: from ?IPV6:2003:c7:8f2a:8576:4416:5fef:fc17:c89e? (p200300c78f2a857644165feffc17c89e.dip0.t-ipconnect.de. [2003:c7:8f2a:8576:4416:5fef:fc17:c89e])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8d25cebcb2sm242997466b.153.2024.09.08.13.26.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Sep 2024 13:26:10 -0700 (PDT)
Message-ID: <4bc6cfea-ecf4-40ad-a3f6-c32bb411949a@gmail.com>
Date: Sun, 8 Sep 2024 22:26:10 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] staging: rtl8723bs: fix comment with a trailing */ on
 a separate line
To: Sayyad Abid <sayyad.abid16@gmail.com>, linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org
References: <20240908101110.1028931-1-sayyad.abid16@gmail.com>
 <20240908101110.1028931-5-sayyad.abid16@gmail.com>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20240908101110.1028931-5-sayyad.abid16@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/8/24 12:11, Sayyad Abid wrote:
> This patch fixes the trailing "*/" on a comment block.

Hi Sayyad,

important is to describe why this patch makes the code better. You 
described in the description just what you did. But that can be seen in 
the changed lines blow.

Thanks

Bye Philipp

> 
> Signed-off-by: Sayyad Abid <sayyad.abid16@gmail.com>
> 
> ---
>   drivers/staging/rtl8723bs/include/rtw_security.h | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/rtl8723bs/include/rtw_security.h b/drivers/staging/rtl8723bs/include/rtw_security.h
> index 4efa2d258ebf..1e5e7f52f8da 100644
> --- a/drivers/staging/rtl8723bs/include/rtw_security.h
> +++ b/drivers/staging/rtl8723bs/include/rtw_security.h
> @@ -240,7 +240,8 @@ struct mic_data {
>   /* ===== start - public domain SHA256 implementation ===== */
>   
>   /* This is based on SHA256 implementation in LibTomCrypt that was released into
> - * public domain by Tom St Denis. */
> + * public domain by Tom St Denis.
> + */
>   
>   int omac1_aes_128(u8 *key, u8 *data, size_t data_len, u8 *mac);
>   void rtw_secmicsetkey(struct mic_data *pmicdata, u8 *key);

