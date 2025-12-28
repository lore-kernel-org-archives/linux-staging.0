Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2FC119DF8D
	for <linux-staging@lists.linux.dev>; Sun, 28 Dec 2025 03:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766892967; cv=none; b=Fcdi79DaEfYeVCOZ0v6V0Y+xOskUo3r4g+nU4I0M+169OFKmd6Sqw+7S61Q6dJSQxBjdcLAjCZ1vXqOinXrpHhefAzWAamZKZf4+ouEVrrawnLull2+KkNuB52NF3xms4qpLt5kKBpEFJO8qPytvGJ5kXVGA4bNkC2lG56Hau2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766892967; c=relaxed/simple;
	bh=7y9+JG1YQScaKpsvlkoSJnucnQXf3X7/A1e5+m7XKHo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R70kPAmcMzOsGlmU7j4RoLevAeEtrqkS3OkFAY5z+kKdBKnAYY4F9VoB4qyS+ptuskAx2uGirgbewmYQoTqyMsEMmDUAcyQrZ/hlCmpdl0tw4gCZzY/qQCPELAxRlcVVu2rMwiEpOdFYoyZtDuLa3Efqv7Mp/DVPrxcTtt/PAtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U9X/gYTG; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U9X/gYTG"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7aae5f2633dso8220696b3a.3
        for <linux-staging@lists.linux.dev>; Sat, 27 Dec 2025 19:36:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766892964; x=1767497764; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9GYMWvgynMfX2fSBNVCofj8NHTkRdY3lznnd4Y2OMfk=;
        b=U9X/gYTGI2QUtSfTHuTl/jxt+Gc9ZnLZooKXzeSK91nA9KwOXmYHUjvLMT0YkpEws4
         7h+NVKT7t2/4LBYwK/fqG5CeOxLEeVe96lHUgpAtHb4wHwExVbB1UtHT9EQg2ri/la1l
         hcwxYGR2VrjpT+l1PawsDtGfcDcblK1s8RQSrm+DC6y+p7BRITEeVgZdnDs7Dy0SMbTS
         uJyhdOM1+HlRvLOSzNhefu98G8YBXB3IRLR/642b3JGEZZMcPS7tYPxFdu7sCd0gxXQr
         iXMIQgx4fMbPnxV4XFrppluL3VcgK1NppmYp10eEloDC4GnpASra+jc2IGvF9nTxAMyR
         rYBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766892964; x=1767497764;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9GYMWvgynMfX2fSBNVCofj8NHTkRdY3lznnd4Y2OMfk=;
        b=EtCXkKX1joqQW3R9bjFfrFR73VLJFAn5FAPN6+Sz7HM6SZ4COi3Ai4HcVuhiorXUmU
         wN1UmunLpV3LVjMrVmACDrCUiktn3W3KFBKKVTQ+/yNTWs9NanJfVksPcKF0bPAYPMnm
         ZJ89ac07a7eQFI1wbTjDQhjrSs9zBdLEsHIzOaJVFfPapttHcVQuKmB15WLJ2RCC4rqu
         oAd2k4jsDsexgEjMeywjnU3PNd/XBOUBJWeNDRRUo/lMbEKShknJQLA8sJVyJJlEQldn
         YH0zvfhCqw66z5zhSbpFNphsb+R/uvfSpsFoOWtA67oMpUVJPcp/KHoxojqsDAz0J5Qt
         k5eg==
X-Forwarded-Encrypted: i=1; AJvYcCUCQ5TLJVinjOZsE+AC00b4tlYESMRwXdmvb/z1URyEuAPoxHUafVXSfweRmZ6G9SyEKdkcpgbyU/rj1QIF@lists.linux.dev
X-Gm-Message-State: AOJu0Yx362CVlPPZROBJowOwwfKKmJEJ24bOa2ZohraS66MI+Xnv+vCB
	244yCwt4sfFY8sajGQV1WcgNwtPAPNtSIxvR2uwQ00eRdFFIrR0h+TKA
X-Gm-Gg: AY/fxX4nCOK0+6ABp0ydygIhccbIE/h2JdES1VnF60aPrFmPcx7zEbNcDv+j1RkRA4Q
	cwU3dwdLkFgWtN4AosjkeWZFI90uqLQLUwkw4OkD2OeelMKkHuhaYhX9PNuGBCg39ibG9zQ9AWE
	ANuuN8cdN7j9tWiXtJCErDFsY8fDKoKrnjM9XLvTW1GhkeQ4Lv8j/lQOqs2nESY6WnXj+nGpPL5
	4K1KFEoPbmg0RO/9hJm5IC1GY2FNHT+3hGF3D7eeZhmu+hIaol61q2Qvb1CFZoeH8y7Ulg3+33o
	ooZd2TIpOqGoyDG8ch5Z+cfnzA/ZVDKbHD/JiAmD8r2XXhBPOS1NLu3l4MUZe5oZ53xFrkeMD/I
	7aYgCfkptPWHxpQCMWNPudfismbZ/QqqLIkSdOdMtWaejB6N5wbX7d/cXnfmRypvLXzJT0s2uTD
	LZa+HEbdcddpkPXdoDC0+d/RituXiPMLswR8ErtOxG9XINdN2FeRY7rMYM8IbfV9Td4/4hLeM=
X-Google-Smtp-Source: AGHT+IHTWL3q8c+FeXaSOBHPaw/cADChxlI8DiI1o2Cg5IPCvZurA0tG1OaDi1zTnHTBCrTFoMuu6w==
X-Received: by 2002:a05:6a00:6caa:b0:7e8:450c:61c2 with SMTP id d2e1a72fcca58-7ff66679603mr21673397b3a.50.1766892964131;
        Sat, 27 Dec 2025 19:36:04 -0800 (PST)
Received: from ?IPV6:2601:1c0:5780:9200:a91e:86e3:6d78:53d4? ([2601:1c0:5780:9200:a91e:86e3:6d78:53d4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7e797aadsm25834180b3a.61.2025.12.27.19.36.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 27 Dec 2025 19:36:03 -0800 (PST)
Message-ID: <ec86f093-8fe8-4fc8-b330-dc7ee8a01de9@gmail.com>
Date: Sat, 27 Dec 2025 19:36:03 -0800
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] staging: fbtft: Make FB_DEVICE dependency optional
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, tzimmermann@suse.de, andy@kernel.org,
 deller@gmx.de, gregkh@linuxfoundation.org
References: <20251219054320.447281-1-chintanlike@gmail.com>
 <20251219054320.447281-3-chintanlike@gmail.com>
 <CAHp75VeLF8nd-JiPFnxJ2H43ZS=oYgW4=BTZjR_GuUuj03gyRg@mail.gmail.com>
Content-Language: en-US
From: Chintan Patel <chintanlike@gmail.com>
In-Reply-To: <CAHp75VeLF8nd-JiPFnxJ2H43ZS=oYgW4=BTZjR_GuUuj03gyRg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Andy,

On 12/27/25 06:19, Andy Shevchenko wrote:
> On Fri, Dec 19, 2025 at 7:43 AM Chintan Patel <chintanlike@gmail.com> wrote:
>>
>> fbtft provides sysfs interfaces for debugging and gamma configuration,
>> but these are not required for the core driver.
>>
>> Drop the hard dependency on CONFIG_FB_DEVICE and make sysfs support
>> optional by using dev_of_fbinfo() at runtime. When FB_DEVICE is disabled,
>> sysfs operations are skipped while the code remains buildable and
>> type-checked.
> 
>> v2:
>> - Replace CONFIG_FB_DEVICE ifdefs with runtime checks
>> - Use dev_of_fbinfo() to guard sysfs creation and removal
> 
> The place for the change log is either a cover letter, or...
> 
>> Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
>> Suggested-by: Helge Deller <deller@gmx.de>
>> Signed-off-by: Chintan Patel <chintanlike@gmail.com>
>> ---
> 
> ...a comment block here. It's not so important to be in the Git
> history since we have a lore.kernel.org archive.

Thank you for suggestion! Will move to coverletter.

>>   drivers/staging/fbtft/Kconfig       |  5 ++++-
>>   drivers/staging/fbtft/fbtft-sysfs.c | 18 ++++++++++++++----
> 
> ...
> 
>>   void fbtft_sysfs_init(struct fbtft_par *par)
>>   {
>> -       device_create_file(par->info->dev, &debug_device_attr);
>> +       struct device *dev = dev_of_fbinfo(par->info);
>> +
>> +       if (!dev)
>> +               return;
> 
> 
> The better way is to decouple the definition and the assignment in the
> cases when it's followed by a conditional (validation check). In this
> case any new code added in between doesn't affect readability and
> maintenance efforts.
> 
>         struct device *dev;
> 
>         dev = dev_of_fbinfo(par->info);
>         if (!dev)
>                 return;
> 
>> +       device_create_file(dev, &debug_device_attr);
>>          if (par->gamma.curves && par->fbtftops.set_gamma)
>> -               device_create_file(par->info->dev, &gamma_device_attrs[0]);
>> +               device_create_file(dev, &gamma_device_attrs[0]);
>>   }
> 
> Ditto for the rest.

Will do v3 and re-send. Thanks for reviews!


