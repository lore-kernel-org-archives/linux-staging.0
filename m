Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8ABF192D73
	for <linux-staging@lists.linux.dev>; Tue, 29 Oct 2024 15:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730215880; cv=none; b=hCcKQSViDW2QoW0mJiTS/vBb/ruuI9huPfoaS20zC43ABo8nYqU6APUBbU7evKYgy088yqJqbd8SWH4oeukIV4gZadfuLeDB6BQl36v6+IRzZRJm3x8aOuTxyJuptDY3afl6lszkUtu/oPa2EBVJVjsj+KIrHFMnMFjneqWum0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730215880; c=relaxed/simple;
	bh=5ZWBvWFLttHyVxwGnoez0lfIQc8LAnRAIwZIWfNfLrs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rFTsLaZDid44cG11PQOvO7mx/266Q8mqvddNWxXWxcBRn/uxKUAY2dNy6klbMjXhWXUmENJx4g/NVsgCaAa/uu4b/Nlk93FKxHoyIhOXuLCrqTgbvW9AX94p5IDUiJqp8ZZABk7wXl4ddL/rlj6sZVOziuF5aQPJ2cukO0uHGUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ieee.org; spf=pass smtp.mailfrom=ieee.org; dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b=hDmExcIk; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ieee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ieee.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b="hDmExcIk"
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-71822fabf4fso3270980a34.2
        for <linux-staging@lists.linux.dev>; Tue, 29 Oct 2024 08:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1730215877; x=1730820677; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=v8XpDDbBmci2FjmulVvCwTgF0HqY66ePAkYl4ZFsXC0=;
        b=hDmExcIkgxFDP384cP6bC1k3aHi/zurLdrbTllU4nh49q96LD2tgVTB7iRB/Y+ASMP
         D7cVIc1JNAvm0UCYrkywUVjAPWYeAzX5P46Gg6ncZfQGcuEJ7+vZk3vh6unABmaRL5G6
         O41JBS1b/oXwhRBFiDqIh6ApqvFmZ+4yyCj+s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730215877; x=1730820677;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v8XpDDbBmci2FjmulVvCwTgF0HqY66ePAkYl4ZFsXC0=;
        b=LlxjDSLmsfEIl9QGHxaTIVIshBunUCr3vR90/J5Wc18lGVjldNLUhPlNB0SRGo115Z
         dMDqWIzU/U2nnbxT9XrOiNtq/xTJHtyBkhKPzT3SHUHko7aLvpPWKimnFGjc1tsbwD6j
         C7XW0qtMjK7ZqgOvQAsqJ1vD84LwMhEWydxpSOgWWDgLHKU8jo7CbHZD91jPZvewCKul
         74wL+idoXu6jneqSck4/Y3KKav4Oo049Tq9RedQTxilEx9fsEwOgAvPF2zIS018hHfRR
         KX+0LkGZ08uJKq3i+AkvHPxUuHTDV/5UFtkMIQsnmEdqmMfxeU2NOCTrGSX62udoU5xo
         8rYQ==
X-Forwarded-Encrypted: i=1; AJvYcCWrHn9BlxItMnh3QElkLMQ2HPx2+kNWkbJGctrmHbU4CSDggYBcbXd7tdk0vjh41aCGdxHzy+kuijETd1gc@lists.linux.dev
X-Gm-Message-State: AOJu0Ywzzun15mIPf9kNKem8OjGsv1s8XkVSjwRWks7srAr0HYsRAP7S
	ckdJditjvYBPFR+RUpqtBXXNoH/Olgvwkq5+O4vSjQviei1riaGHXnYd3QhTSw==
X-Google-Smtp-Source: AGHT+IGm0yO5TGszk2aCqpJkNTyVy5/R7djSE8feo7tRfIGqXLedZcGXnsIRpDCtOp05Jz3Izf7wiA==
X-Received: by 2002:a05:6830:6383:b0:710:fa7e:e002 with SMTP id 46e09a7af769-71867f195d0mr13996945a34.5.1730215876789;
        Tue, 29 Oct 2024 08:31:16 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.googlemail.com with ESMTPSA id 46e09a7af769-718616134ffsm2213542a34.28.2024.10.29.08.31.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Oct 2024 08:31:15 -0700 (PDT)
Message-ID: <01caa8c5-5d7e-449c-a00d-28c81f453e41@ieee.org>
Date: Tue, 29 Oct 2024 10:31:14 -0500
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: greybus: fix possible null-ptr-deref in
 gb_audio_manager_get_module()
To: "yiyang (D)" <yiyang13@huawei.com>,
 Dan Carpenter <dan.carpenter@linaro.org>
Cc: vaibhav.sr@gmail.com, mgreer@animalcreek.com, johan@kernel.org,
 elder@kernel.org, gregkh@linuxfoundation.org, ankov_svetlin@projectara.com,
 greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
 wangweiyang2@huawei.com
References: <20241026081153.2649890-1-yiyang13@huawei.com>
 <9ada17f8-7b3a-4bf7-8fc8-f40bf67adb33@stanley.mountain>
 <a9cfb5e6-33f4-495c-b329-7e97f626d1a1@ieee.org>
 <541d16d3-ea2e-d956-5dd9-613ede430fe5@huawei.com>
Content-Language: en-US
From: Alex Elder <elder@ieee.org>
In-Reply-To: <541d16d3-ea2e-d956-5dd9-613ede430fe5@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/28/24 9:58 PM, yiyang (D) wrote:
> 
> On 2024/10/28 20:46, Alex Elder wrote:
>> On 10/26/24 5:50 AM, Dan Carpenter wrote:
>>> On Sat, Oct 26, 2024 at 08:11:53AM +0000, Yi Yang wrote:
>>>> The gb_audio_manager_get_module() is EXPORT_SYMBOL, and will return 
>>>> NULL
>>>> when incoming parameter id < 0, fix possible null-ptr-deref by add 
>>>> check
>>>> for return value.
>>>>
>>>> Fixes: 8db00736d365 ("greybus: audio: Add Audio Manager")
>>>> Signed-off-by: Yi Yang <yiyang13@huawei.com>
>>>
>>> Where is gb_audio_manager_get_module() called from?  So far as I can 
>>> see it's
>>> never used.  Why not just delete it?
>>>
>>> regards,
>>> dan carpenter
>>
>> I agree with this.  I suspected all callers might have guaranteed
>> that the "id" value passed would be always valid, but... there are
>> no callers.
>>
>> It is a simple function, and could be added back again if it is
>> needed in the future (possibly even by reverting the commit that
>> removes it).
>>
>> If you do this, please remove gb_audio_put_module() in the same
>> patch.  It too has no callers.
>>
>> Thank you.
>>
>>                      -Alex
>>
>> .
> 
> I tried to find the caller before I modified it, but unfortunately I 
> didn't find the caller, so I suspect some non-kernel driver code will 
> try to call this functions.
> 
> I just found this problem while reading the code and I'm not sure if I 
> should remove the function.

The Linux kernel is a unified whole.  This means that if you have the
current version of the kernel source code, it will incorporate *all*
possible callers of a given function (or more generally, references to
or users of a given symbol).  The only possible exception might be
out-of-tree code, but that is not our concern.

If you can't find any callers, none exist.  It's fine to propose
removing the function.  And if the maintainer accepts it, it's a
good change.

					-Alex

> 
> regards,
> Yiyang

