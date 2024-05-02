Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 422F722F00
	for <linux-staging@lists.linux.dev>; Thu,  2 May 2024 08:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714639898; cv=none; b=dZAjejp3P8EC0Fqyje/C5ePrE6p6vtiYV5ccwAHd+X1ZbWjNSj49U1QnyY0bBM0nm0MITmTPO0nNwEsa+OyBW/r9xA0CSMPWCPDUVkYbjFzqSrFBFch/XztCD0fg8A/pgYb/kjfeNOe/8ks81EVM2OnHCajkUdHnaj+PyMpbXZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714639898; c=relaxed/simple;
	bh=eo+3NUMxM2jwT1dw4HDbrVXtIRxpRTga71y+Fj/DEjA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FO0RsBoM4KTyyokDpAdxFuKOtH3VqK1gPt6sA4en+iWzG19XomNNAp5xiJpyItLvYEava8nCFCnZerEG/o9F+OsE3MJUAFxTpqr4tpzgP7z1pg8v75E3QYq3rfs+Nmt4MhTqIstm84LNBGKszuYw5ypJnZk3NlMEuLdvzhMFSuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d6sgEDR6; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d6sgEDR6"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-41b782405bbso45933605e9.1
        for <linux-staging@lists.linux.dev>; Thu, 02 May 2024 01:51:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714639895; x=1715244695; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rLLjzZnv4Z0/yLvYvsBEsvnw8lYsK6i6fPPd17AXon8=;
        b=d6sgEDR6Lu1U4idFIohe3xyq64gCVghuzhQJu4doT4rOdjStXeyeGUzjvMBbBEpenR
         /bcBuRUceNfzidmB7+0I5D2YGENJFzpsvsjC7wP6tNzzXGoS0zMI4gtGRqe1PSCaeM9v
         mazDr2icCyUzswohrpFaQPoC133gfMP6bKN9/6RCfPW7Y01DBWVXNRJzB13O5kZDv5jB
         JrGXmxsjLUeoIIAiqquNdzLEyb535vIb8bFBU6KiJEUUGBex0Uvd3+Vr3NfoxOlN4rb0
         CFtyt8rlG8MyAqZ440KwUYff5iPgAkIm1s8vr9zkMHZdlp4oe8555dgyvXbtVB/EcFFF
         dI6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714639895; x=1715244695;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rLLjzZnv4Z0/yLvYvsBEsvnw8lYsK6i6fPPd17AXon8=;
        b=KIoVMgUmPk3h77zT8jn8cvgfQDyzGk9W92Pv/L32s7t/stMun/0O4eNyKotZb/XbHF
         7VgPy774G7WW1vCnlrWxGOpZs6hX5ObC+g9pUt/xDj8etb1SO0Fm5L5EyGE5NjT7xqw/
         uvi3VqLbFT0izPWV7esv//Fbo10vINS3ye6gEHQDSGdRWFWRt87d84JmZV4gFN/7Fak2
         OXF6a4z/QyrXLya8mA/Iqc81H3aGLCSf4d2SUKe9WaXM7bBb/PznyqOTp3kPuBTRrNVa
         1mJW6YAZBuy2R34KcMZUg+yfPbV5V5aASx+bpuWSEyIlE/tSz/9oRJEJE0FiuHsFVxvY
         Wj8w==
X-Forwarded-Encrypted: i=1; AJvYcCXYuv2TAE4XnLWl12ZjMNKGiEEv0IJeAv1Z1aIyDQv0sCrjraUeAOr0PYcoz+csO2Wh0vUeZy5TCdoAfUYKAQ427X6r7+qMDlbtNFeehw==
X-Gm-Message-State: AOJu0YyMQuKjOjR5uc0iGgJ4bHuXwzVudSYT1ya/RvZTxwsrKtg+hzOd
	I5wc7cEctRkYRH1/7YqBVpV6O1wMX81+9xOptASq2Feuwl4YewNX
X-Google-Smtp-Source: AGHT+IHg1TRsUmwzWfbbGWlDaGt5SXUjJQMhVaOHCQTAnZ8ouQQ2/fxEkCt5liCywQBohpEhFZF5gA==
X-Received: by 2002:a05:600c:1d8e:b0:41b:dafe:ff78 with SMTP id p14-20020a05600c1d8e00b0041bdafeff78mr1165549wms.20.1714639895570;
        Thu, 02 May 2024 01:51:35 -0700 (PDT)
Received: from ?IPV6:2a06:c701:737b:ef00:c50a:d96c:6c34:ec52? ([2a06:c701:737b:ef00:c50a:d96c:6c34:ec52])
        by smtp.gmail.com with ESMTPSA id w6-20020a05600c474600b004182b87aaacsm1195572wmo.14.2024.05.02.01.51.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 May 2024 01:51:35 -0700 (PDT)
Message-ID: <9efb9bdf-6f79-486b-ac18-3cf501aeef82@gmail.com>
Date: Thu, 2 May 2024 11:51:33 +0300
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] staging: pi433: Use class_create instead of
 class_register.
To: Greg KH <gregkh@linuxfoundation.org>,
 Dan Carpenter <dan.carpenter@linaro.org>
Cc: hverkuil-cisco@xs4all.nl, andriy.shevchenko@linux.intel.com,
 robh@kernel.org, felixkimbu1@gmail.com, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20240501055820.603272-1-ikobh7@gmail.com>
 <20240501055820.603272-2-ikobh7@gmail.com>
 <cc00ea68-0ec9-40af-a147-e8f67f7f29d0@moroto.mountain>
 <2024050158-mutilated-zero-13b0@gregkh>
Content-Language: en-US
From: Shahar Avidar <ikobh7@gmail.com>
In-Reply-To: <2024050158-mutilated-zero-13b0@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01/05/2024 17:14, Greg KH wrote:
> On Wed, May 01, 2024 at 05:00:44PM +0300, Dan Carpenter wrote:
>> On Wed, May 01, 2024 at 08:58:19AM +0300, Shahar Avidar wrote:
>>> Make use of a higher level API.
>>> Reduce global memory allocation from struct class to pointer size.
>>
>> Doesn't this move the memory in the opposite direction from what we
>> want?  Originally, it's static const.  Isn't that the simplest best
>> kind of memory?
> 
> Our reviews just crossed...  This is just a revert (in 2 steps oddly),
> of a previous commit that changed this api call, and for that reason
> alone we can't take it :)
> 
Thank you for your input.
I replied to Greg's review on another thread.
I won't pursue this change.

-- 
Regards,

Shahar

