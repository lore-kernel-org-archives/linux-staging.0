Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEC1D243371
	for <linux-staging@lists.linux.dev>; Mon,  6 Oct 2025 07:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759736536; cv=none; b=AfiRHpfcxK4fIRrXpphv9nSHh+Gtx/Hp5pfd4cxT/eyaOSSUNUnOmXZuqxwP9Mss5ib1qoG+X45ZJ5aN8ivNO4rcRp/zRlDIoL/5pfgPpk6pXy03iveeAaUZm77UGAaAM+8CFZ5TYjlEdlgsQRvXNBfTUnDvCuyt8LaVaRSRsFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759736536; c=relaxed/simple;
	bh=EA5+YhSBaUfXwzSIShV4NvNIreufT+oeSm4z7v1HRHc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SjYRQwPn9rjcp4/onFTfw2hEI/q1cyrQz5EZ9A6HZcFl6jMO4Q1+gmpzPgeP1Gly9eVbsktf7r56JdY5YPn377hjWq3Gf1uw9jKSZu4IdqcM+SgiS+R0nqk0+XtJuSyIahAXgLo5UrDSCnD7I1q75raF9iI83hoGD6FOAWSt2eM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VQLWT2qR; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VQLWT2qR"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-84827ef386aso316553685a.0
        for <linux-staging@lists.linux.dev>; Mon, 06 Oct 2025 00:42:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759736534; x=1760341334; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=woSAl7bOD989vqWds0TwLp0ZQWrpdmLNuruAIWeB26k=;
        b=VQLWT2qR0ayQKlrm5KKlxvwaujAuNVq1QRlyHNhPZdaHcPaWjrGYqKielNTM+xtdIQ
         SBdCv+WRzDniXFDR9BKku1GwTCy67wHISzl8DJA4wkjwwEsMwMDpb8jnnT9QCC8n7Ye6
         mGOVce/VOaQjh5GULsmT3NiD2r+yBmYRa5gY3g4J1lp5uEVIM4j+xlS7B3UnUmKAHf61
         aqf5+6y8467VRLKPXtD9t58A5uPDjHVi7Nss6rFfiYCk6xnVstFAmXXbtu10DI5gjp6+
         Ibmmh6LMlFM1LCPjOINOvRhSPpZ8yWWOE/85xwbPoSbn38PcMp2AOwu5v3AwHfMy9kzC
         bsJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759736534; x=1760341334;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=woSAl7bOD989vqWds0TwLp0ZQWrpdmLNuruAIWeB26k=;
        b=BLjpYPniWqQZxEVUuRthEthUyo9HESvJQV5RqHocvBS9tJzfYZ1qp2BuzZPLY9JGUy
         j+2p8oZc63X6SiOgMpA7okpNryP5PG8A6T6BanQmIzPrXgJ8Xdt0AI3QvzhSo0erWnB1
         DqOaIP+9g8zOcnSo7Zj6EeUN6rvRE1PSPEYOO+VYkwC0ZEwjeyrZcZgwySGAMUHi6Rp+
         yZW2r7qELSEXG4YKz71TQADH+HfZU50hUN8G5WCl6RKW6YZ7xfLkb6mXQtJcP/6mAdr4
         VQCRHsqjhFLictJw5BxEqSRUfyoKYDvQy711ZFzY7LScLovkfArgiw5ZD2vpbRWSOQtj
         YdLg==
X-Forwarded-Encrypted: i=1; AJvYcCWvmSEge7Rp5WTY0Ke7CKfySQZcFlsMjlvlnROa4eYZhcEvTbu6rx6z/avCOiFfl2wU8bz7WaNfApSl1g26@lists.linux.dev
X-Gm-Message-State: AOJu0Yw02hPlrCft4JYk/NphkRUpf7ACB+k6zL3zGlSgCoOq5GQuwV1B
	a8COfJHVG3gtY7XoExA0ZYJ6xOaWhJ64MQ6J8TU/XQHltqHlLFHg85OP
X-Gm-Gg: ASbGncsZfCHV9p0XD/L3zac9FL2a92uc6/7xGAwbR/IbaKl2sS2pO5ZY05EDDwg+FOc
	QR+TWjffSVb9CvNyCXcUam6+6wJe7YsC+MMCdfyqtpT3000UCiDldYIxcgQd11gJiRJmUfpqtTh
	/M0U6dAOh1Mwo1reu797Xk84l7A6ZGfZuFkab0QQjYIw/kqcyCoiZyabwTkrrOKHFeBFcPILpUS
	oI4rNtL4XrAxOI8OiSgAHuaQIxJwGRiGm+EasLBmRzFNHQPuQC7+CbIJPg6yGjKkixeGSOdFQSn
	gx3ZGSf7CtdZLHpjhU18M7LhJw4+8SzfTlWLIdYgLknSlKjGCr87KmGBzRYzbAndTyMBR3bkRhm
	1DIsDR672sN6J9asCX1l7n21ReIWCERINZmWnrmane5LhWziJtkPOKI10LJlgyxAmVzB0IL+VIZ
	cDgzX7wpfB
X-Google-Smtp-Source: AGHT+IGahQ0lLmXwP/YYcAaECZTnIW//G/p0RYMK/3NcjxNtZ8EfYRA09/3KlKfRwYwYYu0VLM0KWA==
X-Received: by 2002:a05:620a:1706:b0:84b:63e8:f04f with SMTP id af79cd13be357-87a3410d4b6mr1493227185a.31.1759736533757;
        Mon, 06 Oct 2025 00:42:13 -0700 (PDT)
Received: from [192.168.0.155] ([170.10.253.128])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-87771129f10sm1171502085a.9.2025.10.06.00.42.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Oct 2025 00:42:13 -0700 (PDT)
Message-ID: <1a50635f-4525-41dd-8d96-eeee5d25d526@gmail.com>
Date: Mon, 6 Oct 2025 03:42:12 -0400
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 15/16] staging: rtl8723bs: merge nested if conditions
 for clarity and tab problems
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20251002172304.1083601-1-vivek.balachandhar@gmail.com>
 <20251002172304.1083601-16-vivek.balachandhar@gmail.com>
 <aN924wqH--MgGEak@stanley.mountain>
Content-Language: en-CA
From: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
In-Reply-To: <aN924wqH--MgGEak@stanley.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Ack. I will do the changes after the merge window. Thanks for the 
review, Dan.

Best,

Vivek

On 2025-10-03 3:10 a.m., Dan Carpenter wrote:
> On Thu, Oct 02, 2025 at 05:23:03PM +0000, Vivek BalachandharTN wrote:
>> Combine nested if conditions for clarity and fix tab indentation in one
>> place to match kernel coding style.
>>
>> No functional changes.
>>
>> Signed-off-by: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
>> ---
>>   drivers/staging/rtl8723bs/core/rtw_mlme.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
>> index aa842905a467..f17b16fe8819 100644
>> --- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
>> +++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
>> @@ -1254,8 +1254,8 @@ void rtw_joinbss_event_prehandle(struct adapter *adapter, u8 *pbuf)
>>   						rtw_free_stainfo(adapter,  pcur_sta);
>>   
>>   					ptarget_wlan = rtw_find_network(&pmlmepriv->scanned_queue, pnetwork->network.mac_address);
>> -					if (check_fwstate(pmlmepriv, WIFI_STATION_STATE) == true) {
>> -					    if (ptarget_wlan)
>> +					if (check_fwstate(pmlmepriv, WIFI_STATION_STATE) == true &&
>> +					    ptarget_wlan) {
>>   						ptarget_wlan->fixed = true;
>>   					}
> Delete the curly braces as well.
>
> regards,
> dan carpenter
>
