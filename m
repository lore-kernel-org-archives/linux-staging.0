Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A16B289376
	for <linux-staging@lists.linux.dev>; Fri,  5 Sep 2025 06:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757053522; cv=none; b=bZXl5bREUOYzzx9wRSqO2+b4tj1uSRbogh3E79WlMYPWVci0Uq8c9nm1KT7NaPizlJDw8oLfp2pWpDF8zwL4Iqty8I2MKkQtuyBRqqOgcH088q0QH4aDhxwaIuXGBLhJ7LuhmeW1K3GNsFtR1ka23tgVnIffuBqJcrvwkoJj5rQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757053522; c=relaxed/simple;
	bh=pXiEurxJInwPTgKXSaoKEHpVj6fkheqnUI0rAD/5J6c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DeukmHPn+gOOBsqsTuQdMLc2FpftUHPZ5y2J8gD8zCGdQk+DL8/RGUZo/WpELgUGHIAYfbs6LlwfkgLasOz6ZgVErh8h/Ixkg8vHvau65cQiwm9kb8JRcSkglzyu71ELEcwSxpGlJihW56VVsI8syQdeD1ZhwrE2r3KHO/uYMq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G/g4/8Aa; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G/g4/8Aa"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-4b3289ed834so22340701cf.1
        for <linux-staging@lists.linux.dev>; Thu, 04 Sep 2025 23:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757053519; x=1757658319; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=scuGHcf88Dp2LC+axjs+lbFAA0MMlzm0w1U6Wth8yZ4=;
        b=G/g4/8AaCb361VlRJmnLDYdt6ErxNprutAGB7d9Ua2HzEKtmykGNbkfabKkZAQk1bx
         y1oEujBuMjKy+/gj39LxBTkj7Ibg4nd9N2yz/DEpCGofLlfSveF3NzHGOdpWzO4gSby+
         Y08VhXJjs/1t50Lk9Gl5en6uY2/yYGP1h9ofK6yPIN8u1sAHoXl7pF6G5t6TZ3LRB69B
         9IqKkjth7uhwwoWYixCXziXvSLys35GI81mFOMaC6mjQMG9Jwc/iXC2rn8boY+6Ij24l
         Ly9dPSpXh3HNE6WrGTm7WLKVpOhiYXtSh3rXfoyPgYfGAIUHOABF8Lr5dagu+IOSJRhP
         2xyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757053519; x=1757658319;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=scuGHcf88Dp2LC+axjs+lbFAA0MMlzm0w1U6Wth8yZ4=;
        b=N2rtQ3G0STem3PwzUgvzS94b+4JFq1+OtRGGR1q+j4a8XfQlAXHenYopw+cQFCQYNb
         uKaotv32e0iWkQHMceohc9fXpM053zDbdNj7N0qOTAr3uT7EJiAB8mJXMmHYcycnUJ0a
         KO8LHIZZfO5QidRnloa1yJ++Ig0XLnGoD44awV66kylOBR/xFEmfDJSnwSU8EVIoVJYd
         naELbO8YxPb2Cjx37jmnhdk8Hiz+MG0rZr+NF3VgxMzwZQI1L6FpM/Jv/72e3ynTXvb4
         ea6rjk7slmLc4bAWxN+Q6uFK+98BRRD+TR/Y7T2SbpDJ+hrOtZj65s4d0Q4pI9VzB95x
         u3kw==
X-Forwarded-Encrypted: i=1; AJvYcCX3DIX+u96C5F+KUt6HSZ+moHBeeKOoiPOKOKWauRcPbd84NM3x0aAhLiwTHVraNrZ+AAjgRmVcIptXJTXO@lists.linux.dev
X-Gm-Message-State: AOJu0YxIz4hUjvhwohFVP9EWnv9C2uz5fuPm+bCh+MzpiVErluTr0vtu
	PJ7SoHQqUyS1z7xDF6Ta+J9yx/7YoxvOk0pv7QV2rnZJnvbqA8Y9BOY0
X-Gm-Gg: ASbGncuFycOqsXsuWvmvcx8bD7s9nqtb/0ggjrO7xRmHhkVt534nDAklZGUxkqoMUQf
	2T3OobB3gkuGUwL6n3SyoE7TzMW1foYw5oE88Df40tVxU1rh8g5ItdvkLewu18T+XWtwi2mehnl
	ybqkiP41imbw4kUSuw2YyGOx+c4Zfzl4hu1mvc2xDlXlFsTWdorc/10/PTf6rs3yftFs54K4Kqd
	clP7VS3FocEsoh+oOsDwrmJ5k0faGchWHbsv7OooIiEQ24yeMmnYS1gZUoQ7gonSJwUmYpbXEkf
	5RvVIlznREhVIqVT5/S+QjBUUtxeZ7ZPHsVEdBhaetmwMVSNa1H9vPLI8rwWXY5jiscuZTU1jYg
	Uu7OL1AP+IH2NzqbnAmFsS9TLutUPOi6usWUzVkmDcwZIdN6S/Q==
X-Google-Smtp-Source: AGHT+IGHT7RRVezlBF9H/kxnO3Lrh2y5UUZCr9j4hDVHEPRyyuEUSn3lz/GNt3xvHP6dzamWD4w2Lw==
X-Received: by 2002:ac8:5914:0:b0:4b2:cfa8:7403 with SMTP id d75a77b69052e-4b31da239e0mr295192411cf.51.1757053519146;
        Thu, 04 Sep 2025 23:25:19 -0700 (PDT)
Received: from [192.168.0.155] ([170.10.253.128])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b48f670a1bsm40344641cf.20.2025.09.04.23.25.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Sep 2025 23:25:18 -0700 (PDT)
Message-ID: <59c70b2c-5dd5-4b57-9b74-9ae3c7401f0b@gmail.com>
Date: Fri, 5 Sep 2025 02:25:17 -0400
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/16] staging: rtl8723bs: remove unnecessary braces
 for single statement blocks
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20250904021448.216461-1-vivek.balachandhar@gmail.com>
 <20250904021448.216461-13-vivek.balachandhar@gmail.com>
 <aLlC-raf6UksVFlC@stanley.mountain>
Content-Language: en-CA
From: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
In-Reply-To: <aLlC-raf6UksVFlC@stanley.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Will fix this. Thanks for pointing this, Dan.

Best,

Vivek

On 2025-09-04 3:42 a.m., Dan Carpenter wrote:
> On Thu, Sep 04, 2025 at 02:14:44AM +0000, Vivek BalachandharTN wrote:
>> Drop braces around conditional blocks that contain only a single
>> statement, as required by kernel coding style. This enhances clarity
>> and reduces visual clutter.
>>
>> No functional changes.
>>
>> Signed-off-by: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
>> ---
>>   drivers/staging/rtl8723bs/core/rtw_mlme.c | 6 ++----
>>   1 file changed, 2 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
>> index ef9057456768..27be46c11b65 100644
>> --- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
>> +++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
>> @@ -514,9 +514,8 @@ void rtw_update_scanned_network(struct adapter *adapter, struct wlan_bssid_ex *t
>>   			break;
>>   		}
>>   
>> -		if (rtw_roam_flags(adapter)) {
>> +		if (rtw_roam_flags(adapter))
>>   			/* TODO: don't select network in the same ess as oldest if it's new enough*/
>> -		}
> Heh.  No.
>
>>   
>>   		if (!oldest || time_after(oldest->last_scanned, pnetwork->last_scanned))
>>   			oldest = pnetwork;
>> @@ -2546,9 +2545,8 @@ void rtw_update_ht_cap(struct adapter *padapter, u8 *pie, uint ie_len, u8 channe
>>   	len = 0;
>>   	p = rtw_get_ie(pie + sizeof(struct ndis_802_11_fix_ie), WLAN_EID_HT_OPERATION, &len,
>>   		       ie_len - sizeof(struct ndis_802_11_fix_ie));
>> -	if (p && len > 0) {
>> +	if (p && len > 0)
>>   		/* todo: */
>> -	}
> Also no.  Also heh.  You've introduced a bug.  Smatch does find this
> sort of bug btw.
>
> $ ~/smatch/released/smatch_scripts/kchecker --spammy drivers/staging/rtl8723bs/core/rtw_mlme.c
>    SYNC    include/config/auto.conf
>    HOSTCC  scripts/basic/fixdep
>    HOSTCC  scripts/basic/fixdep
>    CHECK   scripts/mod/empty.c
>    CALL    scripts/checksyscalls.sh
>    DESCEND objtool
>    INSTALL libsubcmd_headers
>    CC [M]  drivers/staging/rtl8723bs/core/rtw_mlme.o
>    CHECK   drivers/staging/rtl8723bs/core/rtw_mlme.c
> drivers/staging/rtl8723bs/core/rtw_mlme.c:843 find_network() error: we previously assumed 'pwlan' could be null (see line 838)
> drivers/staging/rtl8723bs/core/rtw_mlme.c:2413 rtw_restructure_ht_ie() warn: odd binop '0x1c & 0x0'
> drivers/staging/rtl8723bs/core/rtw_mlme.c:2467 rtw_update_ht_cap() warn: if statement not indented
> $
>
> It's always a good idea to add a kchecker to your QC process.
>
> regards,
> dan carpenter
>
