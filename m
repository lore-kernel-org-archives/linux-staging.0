Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7697F225D6
	for <linux-staging@lists.linux.dev>; Fri,  5 Apr 2024 07:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712303284; cv=none; b=XiyXaiMiX85IEwl+gThipfwHLuEY9GGPxC9doYWgz1y4INFmXWSHUu4B1O/RGjyRPBgxnlPbwP29RkobBqvFZ8dZmaiMpoetVssuri8Ww4L4vuieNN87ZbGFlSneF4m6S452wAAk4439GxjObgDQHdZPdXiqwqtsx0M045tQuGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712303284; c=relaxed/simple;
	bh=gOG1yICSBmPjhUbFo9boDY9KzUjbnwLfl9fXH6ZAGzs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O+pQKqOpUIGqIJn0zhOxGX8CqndFxQfJhmiSRbyksLM9JJM8YWUecSyYGNj1/DnEtaw6r/ZB2pui0v603xxmTD1Ycp/4HcNOZ9p0HslSC3gu/BjhAu2jbR66vFCfspKH2BR+brJV3y6/egx7iaBKcs+CisX1sWnr6DOo3YrXAKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ElBO6tSx; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ElBO6tSx"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-33ddd1624beso1026914f8f.1
        for <linux-staging@lists.linux.dev>; Fri, 05 Apr 2024 00:48:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712303281; x=1712908081; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mjYtOFS/YUqjywKLI686Ne/5YotV1Em6o9D2DdIDwZQ=;
        b=ElBO6tSxDmn63uveipP3kuXLYB/9VLqpUcC2QX3s149iqrQdr5siv+XmIcXi/jJkW1
         S3ngXMMHV58PUep327jIAvmSJN9jwrmV4V1MniV9AEFh1Vj/ivE9tRskK3OjRNN1zdrZ
         +mwxBCp34/9Go171wFaDD1TlE8nYnHm1MnLhlMnd19o9dPlfgnY1EO6kWEX1A4hLUykM
         6ujf1O31BuOsuv2ZpjqkYb83jmKOyeMmECAC/mEShYDHij8h1QdjPxWrL2cgksDLTtlx
         YW9jx7PDn1HTyAzGNPxfBKZsgZCLpMF7sL+4ZwcpSEP+2bpfvsJeAq8znAWE6e9736KU
         dLQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712303281; x=1712908081;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mjYtOFS/YUqjywKLI686Ne/5YotV1Em6o9D2DdIDwZQ=;
        b=KOQQrsdYIjXJpbTiKwc+g2iyDAwq0m7thjgohbN/DdiTrSN3D9gNGRhYrFIrzHUP7r
         c+TQ0M7P8ayjMMywY1aAb8LiXh1XsVf07NgsWvtmMcVMmxV1qfR9tQYfas6gszqAGkT5
         NZDUcehMr5CZbIiLjiQed2TxOexBDYsHB4st+rEVluBkMOoDvINKOTLlBm9A0Zgj54bp
         Ch+jAfdQIaZhyy9rDvzsU4tnIxvdk7/seA4uMVrqoyW8F18suQ8ePgEIXG+IdWFZJyyY
         qS+ri18UnrKPh3hlLh89Uk7LbeS8vlleqaD0qLDw+ibXDCaz0r9DgubCBaHxZwRpyXkf
         Wflg==
X-Forwarded-Encrypted: i=1; AJvYcCVt+CEN/O1RqZjGzM/M1ex0dUitEJSm069AAkAbIskB49FWhCzO8SDmcGXM2BOlN5vi1B/uQlqZrpWaLFZqZ05C/k179uKXrB7fwLJ/ZQ==
X-Gm-Message-State: AOJu0Yz0Ifp/g5e6pn32Ji1HZ2R+RVKshah5LwwSH9lPA6N4WH4kG4d/
	a4tca/uf69auTqo0rEtpAvNJhWY4ltpcSg1FWvXnWbkdtfk0Shd8
X-Google-Smtp-Source: AGHT+IH6cPLZwgitk6VaqGQan35d4fZJ0GiH/3NOfsbxR5dOYAmgRvrukm3gTBuMwCEhG962fGyqjA==
X-Received: by 2002:adf:f04a:0:b0:343:eb7d:bfb with SMTP id t10-20020adff04a000000b00343eb7d0bfbmr695346wro.27.1712303280839;
        Fri, 05 Apr 2024 00:48:00 -0700 (PDT)
Received: from ?IPV6:2a06:c701:737b:ef00:2bdf:f41a:ebd1:fb2c? ([2a06:c701:737b:ef00:2bdf:f41a:ebd1:fb2c])
        by smtp.gmail.com with ESMTPSA id p5-20020adfce05000000b00343e760c637sm878397wrn.84.2024.04.05.00.47.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Apr 2024 00:48:00 -0700 (PDT)
Message-ID: <b03d3689-9519-4b2a-a9bf-3fe278356e67@gmail.com>
Date: Fri, 5 Apr 2024 10:47:58 +0300
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/6] staging: pi433: Rename return value from "status"
 to "ret".
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: gregkh@linuxfoundation.org, hverkuil-cisco@xs4all.nl,
 andriy.shevchenko@linux.intel.com, robh@kernel.org, felixkimbu1@gmail.com,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20240402111414.871089-1-ikobh7@gmail.com>
 <20240402111414.871089-7-ikobh7@gmail.com>
 <1f1572b9-9b0f-45b4-94ec-7f79467a7205@moroto.mountain>
Content-Language: en-US
From: Shahar Avidar <ikobh7@gmail.com>
In-Reply-To: <1f1572b9-9b0f-45b4-94ec-7f79467a7205@moroto.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02/04/2024 19:50, Dan Carpenter wrote:
> On Tue, Apr 02, 2024 at 02:14:14PM +0300, Shahar Avidar wrote:
>> Drivers init functions usually use either "ret" or "rc" naming their
>> return variable.
>>
> 
> status is also fine.  Just leave this as-is probably.
> 
Patch dropped.

> regards,
> dan carpenter
> 
-- 
Regards,

Shahar

