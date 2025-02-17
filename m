Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com [209.85.214.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F4FE217718
	for <linux-staging@lists.linux.dev>; Mon, 17 Feb 2025 11:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739790091; cv=none; b=hfetwMqfMjK+9HNWF0NuB9BQgZ/gTXltJqv+fGB+fgKjZKah6/l0ccqe/SOwJW7cicTmXXDG1f+SxqZJ9Gd3PhQ8rIvuyq/3bycnZrPAvzQvOxWQxQV+9FuF3OXNETHNgnDgmxiMCY/to73azV+2U8e+gzjkb+Vis7gSJQmWuRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739790091; c=relaxed/simple;
	bh=C9+CS3+xrz35ggieBD8mVagEUZNBCKGB2ypBhzW4meQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YuYFkh8TaGDb+f846QKiL2WgBgEMD5nHJcyRgwuMumJyuBgVgBl7nKmQPcvOeRXq+CQraDiD+xxtqe8s+rB2slZQYH/gk/0MiBiUS0OadT50SFM081hQThcaiPvjetUTo5dGGlZoBjt9ICa8mbU9kPTzH+I8ImfMEZxcU+UHVRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E9MVXRM/; arc=none smtp.client-ip=209.85.214.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E9MVXRM/"
Received: by mail-pl1-f194.google.com with SMTP id d9443c01a7336-220e989edb6so78401825ad.1
        for <linux-staging@lists.linux.dev>; Mon, 17 Feb 2025 03:01:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739790089; x=1740394889; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=svM2c3liAXz7zcfaXHI1zWhEfVZlndyzyMr/crIaP/E=;
        b=E9MVXRM/EkBklxu7bQ9tBj9qQK0XOXRVsdIY7SY5Pkd71JO1fxmjfFYzxHWcPdVRS8
         SqOHi1JHnBLkE/Ek3fqfmb6968+n67ZTEkuwMFxsMt9cusyJxaAgWfZq7mG3dYhN8mm6
         M7rlPJBxMDZGWkSvaC7Rw8LNmGepBIa/kchUvJWR+OEbyQjllCC8VqCB/1DI/JlKG3h6
         cbLR/TqNNI8FaM6ozF8esH5XeHWbIX6vbhZKrTcLp7piT2+Q30EGuQ1ig7ygOuZYs7dI
         yM3k/5QkzASosRja3tn/Ks+uh9iE/aVGkOVX3aPp71uJlAa+e7xH61ZpmFVqZ9OKQ9hQ
         iy8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739790089; x=1740394889;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=svM2c3liAXz7zcfaXHI1zWhEfVZlndyzyMr/crIaP/E=;
        b=Ah+iFEqihXJQH9eQ0gEIQw5NE+cXtD6Fpf+D7+yaEkCKsRPCJ0B7Qi4sAfMTkNczKe
         VgaUV1XJ3o9NrNN8mbFb5BefpPVkRqvCShAE7UDP9cZQucKOOYS2F4kUbc9WxEkC1n5s
         41CQS58vj66rGlrLVfa/nMbs81i6c0P6Yp+BreY9ICFvn8xNDacscOcnru7PztXl6hVZ
         84/RXPnVAb5rybjuUb0/6uHYyHCCQwi9/YeRoD4PayNW7qcsNMmaJPBZfWlh/lUBMlQx
         whWJDLKfHYoeKpKACxIcRpGISbnRJTQI3D88Xhtkpx0ieZLAAJyB1uVrJZH9v9t+OI1a
         tBcA==
X-Forwarded-Encrypted: i=1; AJvYcCXslHcg3aI5w+aXDwX2IKabL0kMBQ2itN9YHWM4RlVfDuMJR7gAyD0lYuopEXaD/zXuoLPFw9U8UpZ9IDpm@lists.linux.dev
X-Gm-Message-State: AOJu0YyjKGvINXaweE/pcTTfQ26jlYjD4faLvgd0AXZ5rtHneA9P8TLX
	YszACyslLMx8lpPBeTOpUq2uUuKkcfqa0sRr1fOfIMpgpaMCUtSA
X-Gm-Gg: ASbGnctwi22+3pp+RPecYQ0IUdHE2GX7lsMJUY1nQMIFlf62GpRC1iA7OfqILLc+I38
	mPd0LoKVPNIlOZ6LHaXi5RkXe4BchLQjjKwqITQEQAU1bswZ8rKeXTLyyGnJTVZOirkKYrKJ70B
	n1u8Rru+RQH17oNqKTf+9gvQATjFBZOGwlfOrTUP5pZD/aMzKJ3fCbF1QGSxwhajLsBGOUOQiPx
	iL0ghURMkBTG+LOa0SPWZ7JZZnuRg7qa01POpjnloq4qEhsxU8jthvJz8m5Xcx/QvsiRLGN7NC5
	QKwedXlUDibthkJSU8MVaV1o/gUyAZmqGmp+vI+6K1CgS6fWVJT8AGpdTSiGTD4Hqo/n
X-Google-Smtp-Source: AGHT+IFuFsKek5k7IV6yigvBBWUxtJuImh3iXjUHxjIvlw+dQW9yJsW9SniM4dh6dGgpLHPHefr/Mg==
X-Received: by 2002:a17:902:d507:b0:21f:dc3:8901 with SMTP id d9443c01a7336-221040a9a19mr146759395ad.34.1739790089314;
        Mon, 17 Feb 2025 03:01:29 -0800 (PST)
Received: from ?IPV6:2409:4066:d04:319e:1d76:db25:b6bf:4f52? ([2409:4066:d04:319e:1d76:db25:b6bf:4f52])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d545d016sm68401275ad.146.2025.02.17.03.01.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Feb 2025 03:01:28 -0800 (PST)
Message-ID: <5c6b9e9d-e360-4da6-aa82-2090efb1290b@gmail.com>
Date: Mon, 17 Feb 2025 16:31:24 +0530
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] [PATCH V2 4/4] staging:gpib:agilent_82350b: Fix
 Indent issue with block
To: Greg KH <gregkh@linuxfoundation.org>
Cc: dpenkler@gmail.com, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, kuba@kernel.org, dan.carpenter@linaro.org,
 rmk+kernel@armlinux.org.uk
References: <20250217103046.54294-1-kumarkairiravi@gmail.com>
 <20250217103046.54294-5-kumarkairiravi@gmail.com>
 <2025021742-shoplift-arrogant-937f@gregkh>
Content-Language: en-US
From: Ravi Kumar Kairi <kumarkairiravi@gmail.com>
In-Reply-To: <2025021742-shoplift-arrogant-937f@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 2/17/25 4:09 PM, Greg KH wrote:
> On Mon, Feb 17, 2025 at 04:00:38PM +0530, Ravi Kumar kairi wrote:
>> From: Ravi Kumar Kairi <kumarkairiravi@gmail.com>
>>
>> There was a empty line, which was causing the checkpatch script to think
>> it's a single line statment, after removing the empty line it's no
>> longer asking to check that line.
>>
>> Signed-off-by: Ravi Kumar Kairi <kumarkairiravi@gmail.com>
>> ---
>>   drivers/staging/gpib/agilent_82350b/agilent_82350b.c | 1 -
>>   1 file changed, 1 deletion(-)
>>
>> diff --git a/drivers/staging/gpib/agilent_82350b/agilent_82350b.c b/drivers/staging/gpib/agilent_82350b/agilent_82350b.c
>> index b6871eb3c8..1d644d000a 100644
>> --- a/drivers/staging/gpib/agilent_82350b/agilent_82350b.c
>> +++ b/drivers/staging/gpib/agilent_82350b/agilent_82350b.c
>> @@ -228,7 +228,6 @@ static int agilent_82350b_accel_write(gpib_board_t *board, uint8_t *buffer, size
>>   		return retval;
>>   
>>   	if (send_eoi) {
>> -
>>   		retval = agilent_82350b_write(board, buffer + fifotransferlength, 1, send_eoi,
>>   					      &num_bytes);
>>   		*bytes_written += num_bytes;
> The subject line is really odd as this change has nothing to do with
> indentation :(
>
> thanks,
>
> greg k-h
Yes, I now realize it  ;-; and will do better next time, btw I came here 
from your foss conf video on YouTube
