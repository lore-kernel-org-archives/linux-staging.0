Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E50BDEEBA
	for <linux-staging@lists.linux.dev>; Thu,  5 Mar 2026 06:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772690654; cv=none; b=Kpp+vANggOQhJgT8OZlFDf/GHcz3m+KF+tuXKihtI4arTmVZa48hEuYk5t0cCl/PBoNMFTDeX9XbWzBise+BN7RUCei2xoHvxuap0ToUsj95Y1ltWHT8cyICD9GLqv6M36Wa4GQ3GqGIeO2B1bUpS5tpWjU0INklNJW74UlS0/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772690654; c=relaxed/simple;
	bh=mw2FowQeB3NKNiDWEv3z2zPNu0YlBCNNOQVnPEtXm00=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gmAHrXvlQFUHCu/6CMOekd3rRhI8RIjq4o+GzkFYLhnaaCRJ9bQYoTZTGkvt0HSsk7U9Io7HKoxWyzOQprL59YzLWPKb6A8tsvNJh7v8btzDMkdGckAtfMyMHh2RTqGNbwkpu4Ez5E+mceCw1jr13F4F3SrO1golSRj966i3riY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VqZcahPz; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VqZcahPz"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8297e0b27e5so517743b3a.1
        for <linux-staging@lists.linux.dev>; Wed, 04 Mar 2026 22:04:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772690651; x=1773295451; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jEWkW3Nk8ma3FEylFtlJlya4pyZzhciMSL74qSW9b+o=;
        b=VqZcahPz3lmFryqzSIq79i2z3xPYg5Ia6yJfb5UmK2gKDgIUDmhFaDfL8Sh7WOPhFO
         6Tql9vn/FjEOxg6c/HLuE13i5m4TUbMEl13AxmLD16hWbK6Nduaw666kz3CJYbnhPM+M
         acIpyd2pogpbRRqJbxOr7RIeU/hmsX1jz5jw7yVZNi6UKFdLJuwM0o1T78+S/c7I7ft5
         8zTxswm6PBfUoNSzNXMxhOxiGAi4zd7CEQrDQ9BjszfE9aMDj/XfiECrw/4nwrhymiN6
         Dr9n1pkt5fXegX47J1wUkVmPHTcKvUeN0BFXPugbO1VLra5oeYAtOd68PUr0vLh4g2lM
         ES0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772690651; x=1773295451;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jEWkW3Nk8ma3FEylFtlJlya4pyZzhciMSL74qSW9b+o=;
        b=aVwR47O/aU8lGsd9/T898IBnMTzA6lz0w4QO7VH1iPoJOWzgbjNtJ76MkyEuuRXR6U
         BKH0LCqCYQLWuQeSaIujl6KisVFgo5KexqiFu3xTN31z3v9R7guteTarGU4UsuZMEfl5
         yuSy3/nDOO/3pN0/ZREa2vDV2buqYauyKZ2NjeL2yDGf8w1Gs/9LcaNggokpdQuhBVDR
         OFcdvrb7fYx6DztahoiPwzobgrjcx/dgUyD8ge942SahBP/vOA+b0VPtZSF+J1G8SNOB
         E+oNyvv4zxaX1To0pKRs6IME7PjTy6H4r364ViULNCeABbdcCUAJYVDG8e1SF6kmB+zW
         IiCA==
X-Gm-Message-State: AOJu0Yw0k+mYbywyN5M4rbF5tZ13HU1AYpkzQzUng63JZ3bAHg7rqG+9
	3NnwqwoK3/6I2lTwIEn/5JFeBqiP/P8XjTSro3xmiTPU55FkMi2rBNEZ
X-Gm-Gg: ATEYQzz88j7QXVG4bvAXOeCjW6+kqu4o0OzwcICRFGV0tfdKT8nEC1IVmkxWHe3L0DI
	3kgSbXQYJ8MFoTZC+zYf8XHB14NBsznSx585R0XR2dvkq93Fre62zPfv6XRoDiLlJGGgfHwQhvY
	zQLQlxUb4JsHeh1tjYEh//dx0q59cpc1onLafhrae2YxsI7X60riQ+fUQdj6PEO4PuiIf2ncsyc
	QnkxziK6trIrVWTgx5i9oS8BuiH/KI+nwS+DJhkriJiXwjuaOXyLIjiy0KovMyg3pl/rpMBDG8O
	7DaDFjEA7FGOw6rHK075q9BduGqrwhizNogUfrzkR3ciMdGnULqR/UbsceAKSnM30bsdwVtqmCH
	jrCYvqckkyrj+ACEDArB5JFf043CHkzkwA8R773XMQwupk8TCu6cndSkWAGudzDbffHoDewVu/k
	arlixszpNwWYqrRRYyeuTdACHPsqKIwWUqkEtL0R2fSjW2ebu64sUo6BOSKFBhVrcq7nCOZ+/YI
	vfZhdcxDhIpSXlyz4GLxKd99VPDiA==
X-Received: by 2002:a05:6a21:60c8:b0:392:e5eb:f0f with SMTP id adf61e73a8af0-3982e24369bmr4341135637.68.1772690651300;
        Wed, 04 Mar 2026 22:04:11 -0800 (PST)
Received: from [192.168.1.109] (c-73-37-64-97.hsd1.or.comcast.net. [73.37.64.97])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c738877202fsm1600352a12.25.2026.03.04.22.04.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Mar 2026 22:04:10 -0800 (PST)
Message-ID: <2f7bcd41-eb4d-4b4d-8332-da2b193e3aea@gmail.com>
Date: Wed, 4 Mar 2026 22:04:10 -0800
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: nvec: fix multi-line comment
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: linux-staging@lists.linux.dev, gregkh@linuxfoundation.org,
 marvin24@gmx.de, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260305012626.56403-1-marusik.adamenko@gmail.com>
 <aakaLv83wsXQl54x@stanley.mountain>
Content-Language: en-US
From: Mark Adamenko <marusik.adamenko@gmail.com>
In-Reply-To: <aakaLv83wsXQl54x@stanley.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

I was not aware of such a thing. Thank you

On 3/4/26 21:52, Dan Carpenter wrote:
> On Wed, Mar 04, 2026 at 05:26:26PM -0800, Mark Adamenko wrote:
>> Fix multi-line comment style flagged by checkpatch.pl.
>>
>> Signed-off-by: Mark Adamenko <marusik.adamenko@gmail.com>
>> ---
> 
> Someone already did this.  Please, work against the staging-next git
> tree.
> 
> regards,
> dan carpenter
> 

