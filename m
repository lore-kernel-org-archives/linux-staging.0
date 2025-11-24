Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08A77275AFF
	for <linux-staging@lists.linux.dev>; Mon, 24 Nov 2025 13:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763989640; cv=none; b=KfAeDjVxs6rqnQeVCO6pjguTq/vfnDzVWB9cZFN7hQ+4lHkVyq2ll57rIvsBMprgJ5Jx7B3ISjK/YHbhnwkjWGZUMW1ITmHxkespL9+xxyD+B3Sv0zsICZx/E4XxsDC9dv24aS6w9AnzjCSpzZHMqFoPhhmJEToS6/XImokAnJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763989640; c=relaxed/simple;
	bh=LFLwSLvla9h6ILg+cRWILezDdFb/taYKuyCkiqMrV5Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Kr//ZHeKiPxPa8HWYJu9+RF8BlDPeKZhQ0Kq/rviKdPZcGdRgeG3V/iFdIsAT9sHLCUsL1BxJfKwSI4nP2R0/Wr2NIwN31F+1S5jIxLv3F/1oe94tLlFeeuuDkLrTDsEWOU2BwAOF8x1AQsuVCZ+wY9+8TNoMyqEsAVHLID1SgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PGZC6WNZ; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PGZC6WNZ"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-29555b384acso52789555ad.1
        for <linux-staging@lists.linux.dev>; Mon, 24 Nov 2025 05:07:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763989637; x=1764594437; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eKDBEWppWKgZXVk9naXtMVTvTD+iNGRYthAd9NDpUBI=;
        b=PGZC6WNZF/2Svq8cQ7PSkjAtm1sSps8tPxlb4lC2o4RoO+og2iPFVq2L4NM+0w+m56
         2xgmJ6sKfvAkE1iP8Y2hw3mEtcIIKrDBOeRA8a5Y5G91YR+7RMoPrgoFmt+2a77ubMzL
         B2cXx+MA99MQ6a6qu4wDPu11nmP63vzBZiKYgFGHgaM7eQCHFIvHl4BmNQQn/DWehAcy
         dSVyJLVbjwLk4d6vQa9vEH+ElKZYq1kE+3lUzAp/qKVyUeIV2r1MikgicR+nQRzyC4CO
         EVdXTbi8r5LA8jyk2JBb/gw7WNsYnDE+gquFck3axj9e3j+vaj2YMCiD25SM8PUaOBDe
         lGHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763989637; x=1764594437;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eKDBEWppWKgZXVk9naXtMVTvTD+iNGRYthAd9NDpUBI=;
        b=EVd+cSZYHZQvmmGkRFgmfey/6uvi38diSt/lF3Grkaflufh6TtBS1JIo/dkjlYL30m
         TnpuDpZvzadVlha+ljk8tW0oP5Vb6dh6/I/Luim0oeZasfFxPSBOR0TZL6IFEc8aqGch
         blM837Bul9sNVZO2dJ4Y86ao69BmFCHMPskukDmm0Sp+0h07oOrIkC/m9NdCBlXa1wD3
         0QcbeWW72g/C6/7DaF/+pDGt7Y8YOBoujXWKjK0i/jAFT4lG6yIRmixBntr7GcJvdWG0
         /FPfdi095mtyViFubKKxBlZlgU9y+A4aXjQAHan3LfbVdKVqYLsxp2BaWAGL0002cXSS
         KTOQ==
X-Forwarded-Encrypted: i=1; AJvYcCU9byFvVMHGBIMr4dZbPeW2ubpdav4dLQm3v7I6G1/RgGooJpyYrTQp1kXRJLVl8yWWddT2bU6FnLFanrNA@lists.linux.dev
X-Gm-Message-State: AOJu0YyjyWqvDKAJL27ojYXuuogjl8R/IZgKd/fM9Zbz451vNOhYAQ15
	TYqdgoEKpROUgxy74/Zo5H/76jMBxPY0QrcnWr5/tYC3i2B9MslMpng6
X-Gm-Gg: ASbGncv3+Qenq9d3miuQlJluRypAb8QEKe6PJdzwHknThuHwwAcZwWg6RUJ0sgn8bBo
	0dBJK3FuEqN6pDG0uKuRmlHE5ygYeSJf15NjaWXaiPHvvHOTPNRhSjmXEF2ZyhrOC2eMUEaIB2T
	1lCH76MkWItvuayhEreLUeBaO5R2UoYIAZArWFF96btzpf/88PHPjio4ZFH8wQcWPpTPftIliyt
	H56eBKuXx05QaRadsnpSgOZdpfKg0I70hMqC3AuMUaxNcVpAgi4Pur6pKBJRdDsArgVkY2+mnDP
	kHP0GWrqqvxG2Fmott31Wa8RitDMohHecHyrYNsrtfc/gZ4Z9YOTLjobymfar9JNSAUv3Ih2d7G
	mUwz0Tnc+iQGAgAfK2CVVOWtOkn9O+WCYaua85iZE5UsunHGCXIIOqs2pDfHuegoZ3WYBnEeYhO
	cqoRYSlELbQ3+U0p3FmVRb7QOP7gcEnHt+qKziDJvJPAUAmWSIMX+57oenA1veOkw30vVRxRY57
	EQns7u8YJoLSSPvo3fq7p2r
X-Google-Smtp-Source: AGHT+IGYN/r8oBndMZKJary0NXzIUVYqopsfyp9AtFvshWybB7U2BPq+Q+uB29yd3ds5KWxfyGNUtQ==
X-Received: by 2002:a17:903:40ca:b0:299:dd98:fac2 with SMTP id d9443c01a7336-29b6c6b2646mr152991625ad.54.1763989637287;
        Mon, 24 Nov 2025 05:07:17 -0800 (PST)
Received: from [192.168.2.119] ([103.92.100.185])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b25e4basm133596575ad.47.2025.11.24.05.07.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Nov 2025 05:07:16 -0800 (PST)
Message-ID: <4d7139b4-1f06-4efa-b930-5955dd3c78f4@gmail.com>
Date: Mon, 24 Nov 2025 18:37:12 +0530
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] staging: rtl8723bs: replace FIELD_OFFSET usage with
 offsetof
To: david laight <david.laight@runbox.com>,
 Dan Carpenter <dan.carpenter@linaro.org>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20251122174555.215109-1-knavaneeth786@gmail.com>
 <20251122174555.215109-3-knavaneeth786@gmail.com>
 <aSQSg91zk2zCQ8xE@stanley.mountain> <20251124091754.7147dc66@pumpkin>
 <aSQpSiazYpEquYS6@stanley.mountain> <20251124121302.2d1988b6@pumpkin>
Content-Language: en-US
From: Navaneeth K <knavaneeth786@gmail.com>
In-Reply-To: <20251124121302.2d1988b6@pumpkin>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Dan, Hi David,

Thanks for the clarification.

I’ll remove the unused macro entirely in v2 instead of adjusting the cast.

Regards,
Navaneeth K

On 24-11-2025 17:43, david laight wrote:
> On Mon, 24 Nov 2025 12:45:46 +0300
> Dan Carpenter <dan.carpenter@linaro.org> wrote:
>
>> On Mon, Nov 24, 2025 at 09:17:54AM +0000, david laight wrote:
>>> On Mon, 24 Nov 2025 11:08:35 +0300
>>> Dan Carpenter <dan.carpenter@linaro.org> wrote:
>>>    
>>>> On Sat, Nov 22, 2025 at 05:45:52PM +0000, Navaneeth K wrote:
>>>>> Replace usage of the custom FIELD_OFFSET macro with the standard
>>>>> offsetof() macro in drv_types.h. This improves code readability and
>>>>> standardization.
>>>>>
>>>>> Signed-off-by: Navaneeth K <knavaneeth786@gmail.com>
>>>>> ---
>>>>>   drivers/staging/rtl8723bs/include/drv_types.h | 4 ++--
>>>>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>>>>
>>>>> diff --git a/drivers/staging/rtl8723bs/include/drv_types.h b/drivers/staging/rtl8723bs/include/drv_types.h
>>>>> index dd9018aa4ee5..47cabf8707f6 100644
>>>>> --- a/drivers/staging/rtl8723bs/include/drv_types.h
>>>>> +++ b/drivers/staging/rtl8723bs/include/drv_types.h
>>>>> @@ -173,9 +173,9 @@ struct registry_priv {
>>>>>   
>>>>>   
>>>>>   /* For registry parameters */
>>>>> -#define RGTRY_OFT(field) ((u32)FIELD_OFFSET(struct registry_priv, field))
>>>>> +#define RGTRY_OFT(field) ((u32)offsetof(struct registry_priv, field))
>>>> These casts to u32 are bogus garbage.  Delete them.
>>> Dunno - they might be needed (or have been needed) to stop min()
>>> complaining about type mismatch.
>>> They can also stop expressions being evaluated as 64bit (on 64bit)
>>> which may reduce code size.
>>> But that is a bit subtle...
>> Actually the macros are unused.  Just delete them entirely.
> Sounds good to me :-)
>
>> regards,
>> dan carpenter
>>
