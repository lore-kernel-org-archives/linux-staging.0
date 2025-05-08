Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47F502528E3
	for <linux-staging@lists.linux.dev>; Thu,  8 May 2025 14:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746713196; cv=none; b=X5bUtvUDBI8Tqv33rlocLYN6/cFZfuV5Ze4pBQT5n2eTFFWfqbQmHIiU4nWk/Db6OaqnzZX5HDR84ey8UWn2bAkRWrDQ2lhLz1UbuVPAcZCuRSpTYoJt/PqRjOHnJThXfqahBioL99SJa0pARTiMFz9pF4ulehMrAq66SkDQvF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746713196; c=relaxed/simple;
	bh=kBdo3d/KoEhV9EUkuxZCI2cRaHqHBylhi7zJ+VTyZVc=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=tdVJXGoi5LwCtZH79JQFjlAvdgO0llfwynseou2M+L3FKlodk2/e2JVLgudHsThuZyDlG99Qp0M2BHrZ/i28ascnXgGmrqQ+6jGC6edtX+Asd0pu/VwmEgejEBJK1MfCkaLjTrA2bM829UVs6nw4id7yHBth7rz7o+t7khuc5wI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ATxvCOUt; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ATxvCOUt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746713193;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5ebO/qCZ0JEZ4vqg1hdJ8oPvjXAfo3GcradBLxE67v8=;
	b=ATxvCOUtV8RBv4pXcvpAkAebc5o8mol9bgVWSYDC7YQHjx8j//CHX79vPQpLVxEXped3Pt
	JRsI0sQ6l5QbMRXNPHHqbYsT5BX1THz+TV8hq1F8Z3k505GvKh/EjxSO7f+d4AefKp6SR4
	pBRsyHdCGb8zU/sPF7sqn/VHo3cwSjg=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-614-M00XVQVdPUKzUSzOO0PE_w-1; Thu, 08 May 2025 10:06:32 -0400
X-MC-Unique: M00XVQVdPUKzUSzOO0PE_w-1
X-Mimecast-MFC-AGG-ID: M00XVQVdPUKzUSzOO0PE_w_1746713191
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-5fbf5bed97dso1060184a12.1
        for <linux-staging@lists.linux.dev>; Thu, 08 May 2025 07:06:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746713191; x=1747317991;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5ebO/qCZ0JEZ4vqg1hdJ8oPvjXAfo3GcradBLxE67v8=;
        b=btWAM5o0ZlZoFE/9NqNjqhLFP6h4ou9t1Xp94LexZu5fqtws8RKhRHYfZL6vJXpNif
         UkH7j80Fwv/sN9kbs92gtaN6bIE23p8oiYDcRxdyadFtj5MMT2VNhZ4vBitx6CUbxZIz
         8dznr4foL8XZJlJ8HqzhJUR/KEf6kbTgkSBl2lKUF1fXjsrxn8e9hzmNsWMzDuMeN87t
         tSDYuHHOWhFZ3VhM/Ej6HB67DmPzHtwrVVqvBJXdHE85vNmimi5g+ulQ+5WDXFYlY88h
         VGS77fl79BOR8+4MmXZqi4k38oNVH7zRSmbR6O+VAL0kVfnMsfMr+3gYIH9ZzBNngP3d
         M3Xw==
X-Forwarded-Encrypted: i=1; AJvYcCVBfVMxhCkEggEkj8VNFmJqClC+Yt3xnIz1R3XRy8iocKu3D/xjr9YLSfkaC9xkWuKB010vjIh58Y5sQR9s@lists.linux.dev
X-Gm-Message-State: AOJu0Yxl31Yk2Do7lIQ6cEaiyeR5VFoQbmHl59FcCPw0e2opl88und7y
	0GXVKQKH+7QlMgj8AJs5LF8e7ucbbLcEXuWa/0l5ertp8GXn2gEdD+EF+gdEeMSGI87bryiEPF6
	94vx195NrNMw9CkONB8qmIVfJ5lFhJrpPlLbLGdjkuVqbt6XeLQIhhEnEMh6vLkw=
X-Gm-Gg: ASbGnctbh2O9a2e5sT+7454HQf7nmmU1wFdBmUpSHLSBQ1SAjNSNbOxJiZGEEfcNOJV
	nSYBdCLVG6S2e6/O4eb55NmAl78W92J9w8n3q1dgLCT/qzra29mLVD8bGSkFcPa6sbH1Zmbks9z
	Q7z79gpcsGbVv4OwesOCuTWR/eMGLYNu5ArEH7K5R+s6LeEF1J92scA/pjDhbEYqDFeGCAVUq8D
	CeOb1bbs91I7ip+NO7HEXbiaJsrRYayxzKM9qTcn6V/bDLSgcpAIqHbWqK81ZpGlU+UqQEJsxFX
	22gR4bj5VpDmRrB5RU6nbMzXQSaIZ0W7Jiqd2Ql1PzzbSesgf1mQjOargGFL9pF9OoQs1JkxSEl
	aI2EE7rX4eS8kqMdg4ovQ5Za908e90+Rd9Ec9kS95Fzf/ymnWX7ryJ/k6BjfvZw==
X-Received: by 2002:a17:907:1b18:b0:acb:52cb:415f with SMTP id a640c23a62f3a-ad1e8dbe8eemr783521166b.48.1746713190589;
        Thu, 08 May 2025 07:06:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHjk0Ylim6P8bbYmFioBSZ3Y8jszu127kHRxjA4923VyGRj8RfhDIcxpEg4n97baRRqmai8mg==
X-Received: by 2002:a17:907:1b18:b0:acb:52cb:415f with SMTP id a640c23a62f3a-ad1e8dbe8eemr783514766b.48.1746713189971;
        Thu, 08 May 2025 07:06:29 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad214d24f07sm11348966b.93.2025.05.08.07.06.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 May 2025 07:06:28 -0700 (PDT)
Message-ID: <1a5cca5a-4bb1-4ac5-aefc-b1ef0e693914@redhat.com>
Date: Thu, 8 May 2025 16:06:28 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] media: atomisp: Switch to int3472 driver sensor GPIO
 mapping code
From: Hans de Goede <hdegoede@redhat.com>
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>,
 Andy Shevchenko <andy@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 platform-driver-x86@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev
References: <20250507184737.154747-1-hdegoede@redhat.com>
 <20250507184737.154747-7-hdegoede@redhat.com>
 <CAHp75Vc0UZOXbfhjeq1XCAwt-2SX-SGOYomHhEfvx5HuXaxf1g@mail.gmail.com>
 <6d5a5cc2-a7b1-4032-82cd-0250f345dca9@redhat.com>
 <a8a6257d-854f-62c2-dd63-c3d2cbab31a5@linux.intel.com>
 <f8a321cc-2545-4048-a257-56c3c5dd03b3@redhat.com>
In-Reply-To: <f8a321cc-2545-4048-a257-56c3c5dd03b3@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: WVfZST1kvG7whXCCV7EOD_5WOJc_CCL5RGoQyRsmTUs_1746713191
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 8-May-25 3:56 PM, Hans de Goede wrote:
> Hi,
> 
> On 8-May-25 3:48 PM, Ilpo Järvinen wrote:
>> On Thu, 8 May 2025, Hans de Goede wrote:
>>> On 8-May-25 10:34 AM, Andy Shevchenko wrote:
>>>> On Wed, May 7, 2025 at 9:48 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>>>>
>>>>> Replace the duplicate code for calling the special Intel camera sensor GPIO
>>>>> type _DSM (79234640-9e10-4fea-a5c1-b5aa8b19756f) and mapping GPIOs to
>>>>> the sensor with a call to int3472_discrete_parse_crs() from the int3472
>>>>> driver.
>>>>>
>>>>> Besides avoiding code duplication the int3472 version of the code also
>>>>> supports more features, like mapping the powerdown GPIO to a regulator on
>>>>> the mt9m114 which is necessary to make the camera on the Asus T100TA work.
>>>>
>>>> ...
>>>>
>>>> Don't you need the Kconfig(s) update to have proper dependencies all
>>>> over these cases?
>>>
>>> Yes I do, I thought about doing this already but forgot to actually
>>> do it, thank you for catching this.
>>>
>>> When I've some time for it I'll prepare a v2 of just this patch
>>> addressing this and your s/then/than/ remark.
>>>
>>> Since you and Sakari are happy with them patches 1-5 can be picked up
>>> and merged by Ilpo as is, so I do not plan to send a v2 of those.
>>
>> Thanks for the quick reviews.
>>
>> I took patch 1-5 into the review-ilpo-next branch with one typo in 
>> change log fixed (reser -> reset).
> 
> Great, thank you!

Ilpo, I just noticed that Sakari typod his Reviewed-by, it reads:

Reviwed-by: Sakari Ailus <sakari.ailus@linux.intel.com>

and this is also how the tag looks in review-ilpo-next now.
so missing an 'e' you probably will want to fix this.

Also Sakari gave an Acked-by for patch 6/6, but since he did so
in a reply to the cover letter all 5 (1-5) patches now have:

Reviwed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

so besides adding the missing 'e' you probably will also want
to drop the entire Acked-by.

Regards,

Hans



