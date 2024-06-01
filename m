Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B007E187569
	for <linux-staging@lists.linux.dev>; Sat,  1 Jun 2024 14:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717253431; cv=none; b=t9bPP/InYIp0sIuWdN+TqINAKcwtSy6k0xPuMNAculP+OIP2KD9wRegsDx48g9Uf48YvethMYdDKw6lxxOhqwn4oFu3j1oVRz2DR+2twlestrgAiql5y/7LtoCmQ/To6zyIharJ9SlQpM6xJRfe9v26dvxQTrOu/YmCxFOK9L4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717253431; c=relaxed/simple;
	bh=BGUQfv3ddEEs7Y6Va6mWJCj4ZwBPxrpj1xJduPX+SQo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ndhwbs9P93OvDhQz7oqbVKdFNehJ4DWBMWsHoqMhTYM6F2ZwnCeZOXygNfaBhwr26nVqtpeAFS6yfwbANpKgTpHyt7sTZ6SehJ3+YZp+UHT00cGuaJfVwGe9jZ+AXvqmB3OSv9ezFJZGmgmRbvaU5k5m+RL43FyqZtuPHGzQCY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eQdI6CXA; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eQdI6CXA"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a682d289591so19647066b.3
        for <linux-staging@lists.linux.dev>; Sat, 01 Jun 2024 07:50:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717253428; x=1717858228; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Yy7wHDVcQQMPykugaV/Sts6o5xwuXy79ptch3fK9zNQ=;
        b=eQdI6CXAZ+CKmkHk8dnLRENnZ2KOHbH5sA5q2AEfH7i7rLvuRB/Ne5NOmfkqoex9T0
         0CTKbvuuIFgIPR4qiv9VuF+050hQTbMRUI0Kzg6qtZvyTlgz66HLq+jdTR8CTGRmoIjH
         C6dAWcxY8QFwKc17cQc6V3nqqEz+N/azKEXANZnb8XI9X9GtrblWoLPHEB9N4+OLvEyt
         /Jlexs1hsKir8uBxx2IrGJUVdnbagiICIIRQ0l76QMms0sBlhMQx0OnF7KsdjIqdqgYc
         46JBSlvuzGGPWMDtoIFWvv92FbwI7dX1A/QDhvu0sn2Uel/uEXELHNnWgQW++cMBWz7x
         WDuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717253428; x=1717858228;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Yy7wHDVcQQMPykugaV/Sts6o5xwuXy79ptch3fK9zNQ=;
        b=uvDGuPey/r7YbmYvfFBzIin6xlQNA0VTYqz5gVpMJbDjdQqTiOQfSfa25b3TdYvYa6
         V88bW0QhgaVBgWYev30tr7/KMzPtJTAPFA3OMVA4ckyPmkPbDhNsGbwgLhhhV4nYIaD9
         2x66OQ9NB36f5nt9f0ze+qWdMVJSRMdmVke+ytQjvB/3F6p7sj5MpYeGCipjwlajUcBQ
         pLZjxKPao5XxG1WCGLjeiGrSUSlnlyip+4LE4vFds6020i/Dwc/yAXJIEX+z3RriEK5A
         zaH9A0K22K8ED8577iQvScBJjxvfNn9/DVVsJPpZW023w7grNkZdFNYBkNWY40mmh89Y
         uUjg==
X-Forwarded-Encrypted: i=1; AJvYcCVZ+RT9TcFX9RJmVocSMH0D9/j8Y6zZeiXVfn5Cct9LXUHwNmXeo0gQbhS0d9R+FwAMrZDu60pk2qvD8el2qIt7W/coHj1bsrW+zXMSaA==
X-Gm-Message-State: AOJu0YzEUGnbu4TPI7Y9A5vo//8WS33BH8oSresWqVQID6UkJ2bhTzeO
	lxb27lnv2jzZpb0IMSmDZ4Wkhp2C22TVjow9lwtlzw3/NL56sdbB
X-Google-Smtp-Source: AGHT+IGRSfaTDArOtylxesKL7D931D7fAcpFGiqKS4Y4/fHrvmum1iIZdVWQNDKPW3eD2OCISFngyA==
X-Received: by 2002:a17:907:1315:b0:a62:446e:2cfd with SMTP id a640c23a62f3a-a681fc5c097mr264431266b.2.1717253427168;
        Sat, 01 Jun 2024 07:50:27 -0700 (PDT)
Received: from [192.168.0.102] (p57935a9b.dip0.t-ipconnect.de. [87.147.90.155])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a67ea67b645sm207265166b.125.2024.06.01.07.50.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 Jun 2024 07:50:26 -0700 (PDT)
Message-ID: <7e64f57e-7f49-4681-9b3b-2d8fe2e0f5ce@gmail.com>
Date: Sat, 1 Jun 2024 16:50:25 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: r8712u: remove unused struct
 'zero_bulkout_context'
To: "Dr. David Alan Gilbert" <linux@treblig.org>
Cc: Larry.Finger@lwfinger.net, florian.c.schilhabel@googlemail.com,
 gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20240529000814.233690-1-linux@treblig.org>
 <971c164f-5ebf-44cb-8cff-3a09c63bb77e@gmail.com> <Zlsfd9Eq5jecxRZq@gallifrey>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <Zlsfd9Eq5jecxRZq@gallifrey>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/1/24 15:17, Dr. David Alan Gilbert wrote:
> * Philipp Hortmann (philipp.g.hortmann@gmail.com) wrote:
>> On 5/29/24 02:08, linux@treblig.org wrote:
>>
>> please remove the following line:
>>> From: "Dr. David Alan Gilbert" <linux@treblig.org>
>>>
>> To me it is not important which commit introduced the struct. This is not a
>> bug. So I would omit this lines and use instead just:
>> Remove struct zero_bulkout_context as it is unused.
>>> 'zero_bulkout_context' is unused since the original
>>> commit 2865d42c78a9 ("staging: r8712u: Add the new driver to the
>>> mainline kernel").
>>>
>> please remove the following line:
>>> Remove it. >
> 
> v2 sent just now with changes as requested.
> (Although I think you're the only person who has asked
> to remove that detail, most seem to like it as a hint
> as to whether there's some reason it's unused).
> 
> Dave

May be you are right. But may be they are just happy that they do not 
have to respond to mails for the drivers named in this email:
https://lore.kernel.org/linux-staging/623629d4-87ad-4e7d-b4f7-2d10e0c02a2d@gmail.com/
Please consider that reviewers and testers are always wanted.

That only one person responses for simple changes is not so uncommon.

Thanks for your support.

Philipp



> 
>>> Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
>>> ---
>>>    drivers/staging/rtl8712/usb_ops_linux.c | 7 -------
>>>    1 file changed, 7 deletions(-)
>>>
>>> diff --git a/drivers/staging/rtl8712/usb_ops_linux.c b/drivers/staging/rtl8712/usb_ops_linux.c
>>> index b2181e1e2d38..0a3451cdc8a1 100644
>>> --- a/drivers/staging/rtl8712/usb_ops_linux.c
>>> +++ b/drivers/staging/rtl8712/usb_ops_linux.c
>>> @@ -26,13 +26,6 @@
>>>    #define	RTL871X_VENQT_READ	0xc0
>>>    #define	RTL871X_VENQT_WRITE	0x40
>>> -struct zero_bulkout_context {
>>> -	void *pbuf;
>>> -	void *purb;
>>> -	void *pirp;
>>> -	void *padapter;
>>> -};
>>> -
>>>    uint r8712_usb_init_intf_priv(struct intf_priv *pintfpriv)
>>>    {
>>>    	pintfpriv->piorw_urb = usb_alloc_urb(0, GFP_ATOMIC);
>>
>>
>> Hi David,
>>
>> I would prefer the following changes:
>> Subject: please change from r8712u which is the compiled driver name to
>> folder name of the driver: rtl8712
>>
>> Please also consider the above hints.
>>
>> If you send in a second version of this patch please use a change history.
>> Description from Dan under:
>> https://staticthinking.wordpress.com/2022/07/27/how-to-send-a-v2-patch/
>>
>> Please contact me for any questions.
>>
>> Thanks for your support.
>>
>> Bye Philipp
>>
>>
>>

