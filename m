Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB34578C9C
	for <linux-staging@lists.linux.dev>; Mon, 14 Oct 2024 08:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728893730; cv=none; b=ILRz0SW6BksRDDhN4k/9zNwZlN8AA0Vsx9GDyjaeMmeXKG4+QrcCzPgqkkKeitwTcmh71uA88WnlnRIk8oi8zO6Euj0Tz26pHQ9bWuLX9LVUjXm71DmrJwSC54xIOjwUqgh3irOOgNRH5hAg2YIT6y5K6yOJCyYponOJHdq7ttc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728893730; c=relaxed/simple;
	bh=8Gx80y35qTfAir4KTu2n3X3gMfctxpJYjy38z/yGr90=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=grvzKBCfwO17MzuA6L3wsss/QM+lc6Y9UmuVA9RN+qmW+MMPXPdBNzwEh3GtGhPFm3IPv5EaF7gjrHReGQv0da3xir3F9eetwwiwT2A3RlO/m4hSSM3q41vTQnFts+ba1z1R+3buod+vgrJrTvcMccFC3aklIKR3F9zwqIh6lOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BvbJwYx9; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BvbJwYx9"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a99f1fd20c4so252160766b.0
        for <linux-staging@lists.linux.dev>; Mon, 14 Oct 2024 01:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728893727; x=1729498527; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aLHbrNZ9fuYWvLmMDbXY5r3ERTKyfWb6Phhkc4ckAZY=;
        b=BvbJwYx9H8gFtFC+f30avULuUABgt9+eOToUCzQNwjhu9bW32qlAaKWbssgqY4N38c
         4UidZcH2fG7s4iDpeMVWCXPe7i4GeX/K6aY+xKlU3l7QH5dijwMJVJlr6aeOeOmGme60
         Go803u+LiFAfH04HNutSn2QkFFslmZqmWlpiGN/Fa3w25/iilb/O1ruaZqDocJIKhcgB
         OnNj/JF/5wG6m6SHD0HzjCkcFt7KiU/9toXivoqwRxHCOk8iPga/FCiuP/keqOao3nK0
         kptmsuuAf71hobdq2pOdDqdWbuKz1wBeETIq6vlYMTzgUOwsIPFXAKwAVuEozGP5Wurb
         1jLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728893727; x=1729498527;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aLHbrNZ9fuYWvLmMDbXY5r3ERTKyfWb6Phhkc4ckAZY=;
        b=O/or8/wcnI9RZqENEWcI56ImbbBayAHC4r0kqCWcFPFkJ10nqgpjZpPnJDKCJdqesn
         K54emQwwwO07zmncePma+2lMptND+vGWmRzjZVOJVp4fqStFqNII0VlrifK6zOxyE1+n
         hrhJJ9+6+L2OgkIMXj9Hgt2ez+lX0TPDUu9XTrtsupDldSVPAZSVMJORlJp85bBsoqQd
         uthdNZRzQjAc1Of4iby4vcNE4L2JXTn2BU0itcmUCwT0afhoLyMqaPtWFSbVhOSpJXLJ
         GQTTyAuMhre1Tssx5GYSC/T1pXjSoco/0RGZHzhDnEg1hv8vssH8CK4hLidCTLRjmgu1
         gn9w==
X-Forwarded-Encrypted: i=1; AJvYcCX51S9yxzBo9nql0Lax17QrOXHvGcLMqTtQ9Wzycun4hQhlhv3o3stFjf1fbAINrTrwhi+wGpRiGe74UM1x@lists.linux.dev
X-Gm-Message-State: AOJu0YwrMplobCrReg3mfYOvAjD+oluObmnYtTm8LRhw4/9+JJJ4OjGM
	bG07X68BSh1EUTvZt5twe/Biy1LkvCF8zwiilrXcyAHvryK3TTBG
X-Google-Smtp-Source: AGHT+IG1/kIZFqniO178bhOM6QqOcHYjCO9xJL/7Kh/8jtK2DzEZpIJSuygJsgbTa5nRzV3LTGqryA==
X-Received: by 2002:a17:907:360c:b0:a99:499f:4cb7 with SMTP id a640c23a62f3a-a99b940530bmr988563366b.23.1728893726778;
        Mon, 14 Oct 2024 01:15:26 -0700 (PDT)
Received: from [10.10.12.27] (91-118-163-37.static.upcbusiness.at. [91.118.163.37])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a15e0b150sm56219366b.57.2024.10.14.01.15.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Oct 2024 01:15:26 -0700 (PDT)
Message-ID: <8c0bbde9-aba9-433f-b36b-2d467f6a1b66@gmail.com>
Date: Mon, 14 Oct 2024 10:15:25 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: vchiq_arm: Fix missing refcount decrement in
 error path for fw_node
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Stefan Wahren <wahrenst@gmx.net>, Umang Jain <umang.jain@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20241013-vchiq_arm-of_node_put-v1-1-f72b2a6e47d0@gmail.com>
 <a4283afc-f869-4048-90b4-1775acb9adda@stanley.mountain>
 <47c7694c-25e1-4fe1-ae3c-855178d3d065@gmail.com>
 <767f08b7-be82-4b5e-bf82-3aa012a2ca5a@stanley.mountain>
Content-Language: en-US, de-AT
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
In-Reply-To: <767f08b7-be82-4b5e-bf82-3aa012a2ca5a@stanley.mountain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14/10/2024 10:12, Dan Carpenter wrote:
> On Mon, Oct 14, 2024 at 09:59:49AM +0200, Javier Carrasco wrote:
>> This approach is great as long as the maintainer accepts mid-scope
>> variable declaration and the goto instructions get refactored, as stated
>> in cleanup.h.
>>
>> The first point is not being that problematic so far, but the second one
>> is trickier, and we all have to take special care to avoid such issues,
>> even if they don't look dangerous in the current code, because adding a
>> goto where there cleanup attribute is already used can be overlooked as
>> well.
>>
> 
> To be honest, I don't really understand this paragraph.  I think maybe you're
> talking about if we declare the variable at the top and forget to initialize it
> to NULL?  It leads to an uninitialized variable if we exit the function before
> it is initialized.
> 

No, I am talking about declaring the variable mid-scope, and later on
adding a goto before that declaration in a different patch, let's say
far above the variable declaration. As soon as a goto is added, care
must be taken to make sure that we don't have variables with the cleanup
attribute in the scope. Just something to take into account.

>> Actually there are goto instructions in the function, but at least in
>> their current form they are as harmless as useless.
> 
> Yep.  Feel free to delete them.
> 
> regards,
> dan carpenter
> 

