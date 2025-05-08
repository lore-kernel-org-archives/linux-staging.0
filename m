Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77D6714D2A0
	for <linux-staging@lists.linux.dev>; Thu,  8 May 2025 13:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746710328; cv=none; b=Ygq8+ghPALFlpY7TlQtVl6KxxaAvL2DjM7MFOJX8FHLMdtxFLVnR0sKq3mLQ7e2mWT07/tv9ieYwquzS8Q/nk8MX85+QBDknzfzmPNwfegLbK3YPH/i9ywt0nM+y7yU4NczTDFfqAyYaggfppwxoQEO0H3f5XZXRaZMzTpzVEDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746710328; c=relaxed/simple;
	bh=W7R2W+HGwaOU6KXHWl2UWLPNhw7Otc/RRAtwobGk9ko=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZgvvAMBThjE9IP7kTKhtXT3WA+PSgG/K2HvJa2dJGW0aVJyzauKWIA2t7K4Xw+aHorRLyKIvTpYRtGqN9PQU7vm5RrvhxXWMWtHCL38SFNuNefGsDvtEyC6phYLHbceYwHI6GMSlEUehtFFgrjuDnGn4NRvTpTMOcZdaw93tq/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=T40s3aO9; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="T40s3aO9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746710325;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=P6xOX054sXenbyfHXykTuJA03aPocYLq5zEpHsINXa4=;
	b=T40s3aO98We+pD6mdpr9r8tsilJjvqMCBOUgA0HFfZF9I2H6hfUYaPII/OndIIJjQ//upz
	edQR8E4ra6etjnB3YXT6Hb987MvirYbNSwTlzr5hM68WqDQTG4xOLdFubKcFebq7CWne9w
	LmK8oTLZE4QPPywKnhqQ2RY7Lt5VytI=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-605-DL2lgiOBOliDltCAldYKjA-1; Thu, 08 May 2025 09:18:42 -0400
X-MC-Unique: DL2lgiOBOliDltCAldYKjA-1
X-Mimecast-MFC-AGG-ID: DL2lgiOBOliDltCAldYKjA_1746710320
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-acb90bccc16so95034566b.3
        for <linux-staging@lists.linux.dev>; Thu, 08 May 2025 06:18:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746710319; x=1747315119;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P6xOX054sXenbyfHXykTuJA03aPocYLq5zEpHsINXa4=;
        b=fMUx/pH1cPW8sfuyIN6aqZCjmRZijgpFc8xkJtV4RnpKu6145ZcDV5i6qP5gWaQJTv
         IpDKO2RI5gQKZISoINnSA/RUwfQiZ2+yJC+XF4mt680lfOf09YZhvbkXzAyL0UKQDM7t
         oVCiY/zMctlpwA7Zssqma3t+YqEZoBP2y2zGcyFSCtRCSaivbwegDtfulD9oPA97QRWd
         uhI6/kaTP9XpbuKCaFe5acfggn6pBZIHlWSQ0rn7IGEpTYF9Ujp2FApwVKnuq/i++G+k
         OVyxLNnvGBR9wcSW9u7PBvl2fC2zmaqkrg4fl6PrlWXnSMeGYwcm5JavBxTtWkh8/whn
         MpyA==
X-Forwarded-Encrypted: i=1; AJvYcCVNQEyffhfgPFBf+Iie8fgT08WW/7Nblkbynt/JYqQsU5uXoUpFi6NiKgK+a35Z1cRTdqOQom/E1s++2MyD@lists.linux.dev
X-Gm-Message-State: AOJu0Yx3zLxxj8BqD18UjULeZvC1QjqMQvisJ2418b+IjdIgGRyx+zqw
	HcCKmyhlBHyAkR+Ax/psl0g7kfLVoJHlhMY49gw9516Xd5drkmL5BVpzw3WybTOt5cZ/u/uYCTv
	v2ho3A/qbCA79O0PB4RISAMOTItY15Rf70ixsWglywqCeBTD9+kc1dVhnuQsQnxI=
X-Gm-Gg: ASbGncsdaYH+HvsllwsUgIUVxrdxjaJKa/9P54ThYPojgwASOYjy4+fMAgYUNtDbfn+
	YcjWBWrcnJf7iCYlocRTL4rmpgTmNH5UZtZnbaS4vxEwmFL+kk0IVZPwur6zQHtdS1qrWKgQYTO
	KimWTnmH1jJMv+rmWz4l7SNhJRO9ZxvggDLxtF6M1JLIpKmV5GkoUXSDifu/1IQYbuJVK8kCdY1
	d2ITT3YhdT+dajvUO0IEDHAFrr65FCMTPWYKZ+gUwW4/dIukJWOitY8aElSYh090eNacBmJ5fsS
	MXJ2fkblKMxFXfAC0L2f4MKib89IHkRbw4f2Z6l5hnMNCRdXXOLkG7EGSjAdNbHeF7e9zrULEsB
	iHeVh3xIFZgHb+ZsrI2W4ii9oaGmyc1q7GeAmvmPSWUd9qOQLJI5b3vLrbZWkvQ==
X-Received: by 2002:a17:907:7fa5:b0:ac7:c7cd:ac39 with SMTP id a640c23a62f3a-ad1e8ce1984mr600776566b.24.1746710319594;
        Thu, 08 May 2025 06:18:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFjQisuRmo1A3ga06FkdeW6dRFUyT4fgAX707T6Omh7wPCOe7z/c9yRleLjQ2hsSAoTmaM+oQ==
X-Received: by 2002:a17:907:7fa5:b0:ac7:c7cd:ac39 with SMTP id a640c23a62f3a-ad1e8ce1984mr600773566b.24.1746710319159;
        Thu, 08 May 2025 06:18:39 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad189540478sm1081647966b.169.2025.05.08.06.18.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 May 2025 06:18:37 -0700 (PDT)
Message-ID: <6d5a5cc2-a7b1-4032-82cd-0250f345dca9@redhat.com>
Date: Thu, 8 May 2025 15:18:37 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] media: atomisp: Switch to int3472 driver sensor GPIO
 mapping code
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 platform-driver-x86@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev
References: <20250507184737.154747-1-hdegoede@redhat.com>
 <20250507184737.154747-7-hdegoede@redhat.com>
 <CAHp75Vc0UZOXbfhjeq1XCAwt-2SX-SGOYomHhEfvx5HuXaxf1g@mail.gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75Vc0UZOXbfhjeq1XCAwt-2SX-SGOYomHhEfvx5HuXaxf1g@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: x9krd7c89opxAxVBs_PK5ZVi5l0Wo7gWMDznx-veawc_1746710320
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Andy,

On 8-May-25 10:34 AM, Andy Shevchenko wrote:
> On Wed, May 7, 2025 at 9:48 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Replace the duplicate code for calling the special Intel camera sensor GPIO
>> type _DSM (79234640-9e10-4fea-a5c1-b5aa8b19756f) and mapping GPIOs to
>> the sensor with a call to int3472_discrete_parse_crs() from the int3472
>> driver.
>>
>> Besides avoiding code duplication the int3472 version of the code also
>> supports more features, like mapping the powerdown GPIO to a regulator on
>> the mt9m114 which is necessary to make the camera on the Asus T100TA work.
> 
> ...
> 
> Don't you need the Kconfig(s) update to have proper dependencies all
> over these cases?

Yes I do, I thought about doing this already but forgot to actually
do it, thank you for catching this.

When I've some time for it I'll prepare a v2 of just this patch
addressing this and your s/then/than/ remark.

Since you and Sakari are happy with them patches 1-5 can be picked up
and merged by Ilpo as is, so I do not plan to send a v2 of those.

> Otherwise I am fully in favour of this change and the series as a whole, thanks!
> 
> ...
> 
>> +       /*
>> +        * On atomisp the _DSM to get the GPIO type must be made on the sensor
>> +        * adev, rather then on a separate INT3472 adev.
> 
> rather than
> 
> (FWIW, it's your typical mistake, it's something like the 10th time I
> noticed it :-)

Yeah, I'll try to remember to double check for this spelling mistake
myself, but I'm afraid I'll probably never learn. We have something
somewhat similar to than vs then in Dutch and I even do it wrong there :)

Regards,

Hans


