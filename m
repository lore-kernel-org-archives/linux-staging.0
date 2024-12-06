Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 673CB1DA619
	for <linux-staging@lists.linux.dev>; Fri,  6 Dec 2024 19:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733512632; cv=none; b=hnL3ft0nJw/gBh/dCWFswYyXfwK20bsZfwp15PjU5BMYRCCfX0WiKin+cpQ77c2hATp5hsUBmf2ENb/c7RU2COrsMKyLb2yQMyrZjU50HLiY3+hELsjqYOsU+6WVuImUgyDvA5GgXHL8S92N+RUJxm1LKGUcD/Neeu8X3LkaynY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733512632; c=relaxed/simple;
	bh=zlk60MqkVJQkdKw40c7VQH7aFGaE/ZNR/0cEkoccHbE=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=T9QBaaRhTzeXLBc7nchsx4DxM4YKIdpnonxObpnCzifBjuAu26Zvl7GZsMWu+fkOIqNexCMM0Tupuhkb51pO92ramgqJX4ol2VNSkTBwB5yTdh99/dqdjRWGxLgarH+0ZF1EPhSfzfw4bLm2C5vwDEImzAxcRosyBASwEudEBGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LK3XpU+b; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LK3XpU+b"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-21583cf5748so23604745ad.1
        for <linux-staging@lists.linux.dev>; Fri, 06 Dec 2024 11:17:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733512630; x=1734117430; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=Skvkc/aUfLLCnpCFSRAH0M5+MLjeaXe3DXnkTopckn0=;
        b=LK3XpU+bZUJmJef3vKuxxru8DfrZXSju1/uTuHipyD7Raz9xtE4xS9qwPOjU4wMXjQ
         W/yruzxv5y5dl2bOVJx2SnHTNgKrD6JwVyX1H5bKQFUHm5SSlOuBQAHxCEP2ec9TcWEW
         a5bikplUG9VmGoau42iJR2111jVNuKfNgCMDlUhsnGbXrIALSF9Nse9ekbdKQNlShV2y
         EgrxHiHcVI6Uz8vPMy0wdU9G23IO6s0MZcH6pAESSIX+Ib1Q3AX+4oa5r+sWxU2DnxfT
         Z/jiO0q900HKLKdyyWDxeRYgzc/AkqETKiRTB5IxFQthJtk9+kFoU6Fv1kF66A8+08q2
         KAFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733512630; x=1734117430;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Skvkc/aUfLLCnpCFSRAH0M5+MLjeaXe3DXnkTopckn0=;
        b=a64KWUX5m51NU9G+xBPiEelCTLIIERjPYy0RTgtY2hY8Wim+sigtS5RagL3zz/cne0
         N7mpdUUcHFHpHPoLbxvsh7FwXAvhAIoZgRLTtID2f1pLzFanfPWcKedK7TmQruEuDL7b
         VARRpfN6313zw13Q2I46nrhwgT1ziEDXnw6JM1wWRL/yxSOSQLnvIjqpawlB2zkpV1lW
         u2JzJI/t6lFXmPD2FJynIoxaImFxPqNSSo7Xch3wv70Fyo28i4IFHhPcJO//Usxo49Bf
         LZyKlAKMYvnueV7zkmH6XCYydNYNvewHHMobuSowN1i6Dt4MSlS4546YfOID8tJKSSxy
         fWHg==
X-Forwarded-Encrypted: i=1; AJvYcCVs2gJVZCHpBe0ap8tGpCP3DGod0iuZJqJXW+jORzeSRTKsc/SkMDCFvJ7sEcHK8Q/qS83SDIyT6RgV7Ap7@lists.linux.dev
X-Gm-Message-State: AOJu0YyyV5WiUb3dkUNxGYobQRa8KFD4XZFTmd6QGEFdXlEeV5vfRc82
	yVLoDhAGl+El+LzR4a4E6xCKTN2PkW8sygvOqXzkiFPytv7NNbmP
X-Gm-Gg: ASbGncuLOaoWY4kYLcjgI1vQWQ6REt7NXv2/F8v2sETwY6OxJDCYuri3FwQgGVfK7MG
	DRwUFihQpI8jD4trW0MUjXX9CgJpy6R8McmenZajW6jw5cBEQRpcehbRx3/t6FkEJs8sIYd2gQP
	3GgV049o5WOrM82pBGFRh8rKzDIOEaQUq2ZHuK+GD5nD1LCtZKRLvmPqf/0UIdznRrw9McwcgSv
	e7KvuuCn0ijkNC9OJpgtFFTSXQnjzxy1Xnf7XMs38ElZkwpSuRbro8I+ze3bwM9Fi3418iScuQ7
	EwCvoUGKMbL7qdj2zXInlKM=
X-Google-Smtp-Source: AGHT+IGHUF0P0ag/DlVldxp6lV1eWV/tJL1UBufM8cFPdyivyt39TAdSQKsbCHCwqg2GI00N+reAaQ==
X-Received: by 2002:a17:902:ce8d:b0:215:a2af:44ca with SMTP id d9443c01a7336-21614dd2374mr47900245ad.37.1733512629648;
        Fri, 06 Dec 2024 11:17:09 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-215f8e5f2cbsm32197125ad.80.2024.12.06.11.17.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Dec 2024 11:17:08 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <b94d3f72-7a4d-44a5-baeb-5febac6b64e6@roeck-us.net>
Date: Fri, 6 Dec 2024 11:17:07 -0800
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] staging: gpib: Fix i386 build issue
To: David Laight <David.Laight@ACULAB.COM>,
 'Dave Penkler' <dpenkler@gmail.com>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20241204162128.25617-1-dpenkler@gmail.com>
 <ba3bf2c6c59f4019a3d502cb0b703d7b@AcuMS.aculab.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <ba3bf2c6c59f4019a3d502cb0b703d7b@AcuMS.aculab.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi David,

On 12/6/24 10:02, David Laight wrote:
> From: Dave Penkler
>> Sent: 04 December 2024 16:21
>>
>> These drivers cast resource_type_t to void * causing the build to fail.
>>
>> With CONFIG_X86_PAE enabled the resource_size_t type is a 64bit unsigned
>> int which cannot be cast to a 32 bit pointer.
>>
>> Disable these drivers if X68_PAE is enabled
> 
> You missed the obvious typo :-)
> 

FWIW, I fail to see that typo as well, so I am not sure if it is really
that obvious.

> There is also a proposal to just remove PAE support.
> Mostly because it is likely to have bit-rotted and isn't really
> needed now 64bit code is common.
> 

Presumably that removal would not be 6.13 material, though, and I hope
that there _some_ fix will make it into 6.13.

Thanks,
Guenter

