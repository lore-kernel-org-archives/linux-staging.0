Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FCFE2D3738
	for <linux-staging@lists.linux.dev>; Tue, 30 Dec 2025 18:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767117709; cv=none; b=QoExU+kmUrA4IH4IFDIFnhfm0IR15y3JjH+bWg13qxr221nSgUmA1v0IVMV/DImhjYCTuEjXogURt23PqlXRUYOfD+/DmWb8KPN4lC7HMiaKs+8L5JUsOXdNfdKzfy8brciH11iX94ctWPEWKmPiwX83yVANI3tfuotemL8YmVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767117709; c=relaxed/simple;
	bh=qIiSEzgVDcgVsCIxFZLM6FM2Y/nR3K6GRD6w/1fsALc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u0C/Hpdi/dXcjif/1iSYykGH63kDMhTmnDsm4SL9JXiVZzPkOTosJ9nT6yKZJPu4wGR7fluO4UpjMYenE3OJ4QWHMpAtTqz7VGFpCv5rxcm33E8/dS+kBzC2of2jL7PEMK2GvFXya7slhDHMLc7X+BqDvT9EVXAnhFBAJrKJSxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZR7wRER0; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZR7wRER0"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2a110548cdeso140558025ad.0
        for <linux-staging@lists.linux.dev>; Tue, 30 Dec 2025 10:01:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767117708; x=1767722508; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XVU3dXZRNTzLxPhtD/PYUGsaxMaUV+wBqLq4ZJcCdKY=;
        b=ZR7wRER0pz0WcjkHlbl7z1Cm1QU2iyXuNwGZtX+bQOOiByFAfWCjXzSUzSXATmm+sy
         bsw2ve0Rwhf2Nna8pi+gjCx3iUQTB83rCPGAmGhdJN3tVtRcx/Qa8Xz4oUYZ+7Rz+Wua
         m3YvoKtFzuZsSGpzEgk5Q7kea5maGVNXQI8QgjM3YW9mk7lY4ZmPZk/LSLm6WLnpcAvD
         CkmfjcntnLgAnXn/junOFolhZ/L+MjG0Mc+oVccLblVE6D1ISuQ6YSIWlMNhm90Hn9f+
         6Q9t3JVuuI5qVOkQ8IM5a5mRqDY+aH1uk9W43iY0B00h86u4Fmp+x41QMddTyHgWAwV+
         /5LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767117708; x=1767722508;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XVU3dXZRNTzLxPhtD/PYUGsaxMaUV+wBqLq4ZJcCdKY=;
        b=CQ3snG3f3GxBUj9kXjOra5+6Q0glT7kMF6LVQ2ADPVA31Q+qVzYl9Zkt7Ad7Na9fCE
         IyRPTKfDEwXoOQYYyZpFddzW3Bnyjsfmex+Xj/k6XpwBk5Y9q8W6mdFntHXEDoPKvwWF
         QFnnHUc+Z4M05Jd9BSDDXB/kFMnPdAkno0OuLCg8L8nfNjMBeHYTRxyO+FrgKnhFYCXm
         iPNYjX1rNnBci1e9SUNlzHZO4e6JlO786SBv9IWSiJkWH0G8w2dpt9Ayn05kVGmuMvrT
         Gl/pV6yi4TmPKSzV6PqsUwbsLpRcycYwKuAcsIM+OlElut7U2boQIpXruc7rdbHd2d5d
         2pNA==
X-Forwarded-Encrypted: i=1; AJvYcCUUvkC64F8M9JphrZzd7AudHiDP7WJIy+uivsDKgs7RT8FVGWRUPkzwQ41vAi/vD3wzhI4or5edVgB4sjM6@lists.linux.dev
X-Gm-Message-State: AOJu0YwQmhq0shriazyDxjK5gDe/zl1Fvn9JjeqmOZVDa1oEAf0eU7vg
	XTqdxAUGRlINu3jKdSRofAO7yNC/tIrTBXAwbWFrtdeYxC4Hp1snkzDE
X-Gm-Gg: AY/fxX5gXJ0Te8CkV2sLyrxUSbRazbPuM1D51Q9ZvH7TClaCktoFHK7aX8kzsB4AJOs
	tlvYed5YC2qNbXGKLoiFpEZCDdUloy5Aie6hmIjf5pwllpkUjMkxvy71ESwHOrfL+Jth6+hpwgt
	3YL+j3QzyHS1Xst9p2iC9uAEhJSLHnjQJaf/XnQLHxLyOyFWCtQlB3PN/lwohoTQE+oavNlzoGK
	NkecQm+YlMj3gcvhZlK31Ib8tAkbPppFmbiHG9+k9WVLp73pXXDPv4GPbHJgtpTB2meBjc6Ohmo
	X9wCq82FYz84myXEt53qJdXltP1Sd9DSSEdTBixx1etFB/tXuNMJ5CC8fKvVy1n9fzezS4ehHH7
	iq/8/uBAnz03Eqp9k0K1wl//tvLUw9PSfNX5AqT8+jee5daB7bJCp4fZswObiRD9kEWKxvYo9JB
	SpPhDryHEhpo/oRz+kKGalNSgoC+t3us9J6P5yqba2RzXJa1bpKpggH7Ik4CH0
X-Google-Smtp-Source: AGHT+IFCY5D2OrgQbO8T1ac5XgJ7Dh5PRosYfy4bjpWjfeV/DmYMVgVyyX6wvp70OFg3Iu7Fy2RfYQ==
X-Received: by 2002:a17:903:38cd:b0:2a3:6b54:5d42 with SMTP id d9443c01a7336-2a36b545df5mr162573995ad.59.1767117707570;
        Tue, 30 Dec 2025 10:01:47 -0800 (PST)
Received: from ?IPV6:2601:1c0:5780:9200:d742:b62c:dcc9:47cd? ([2601:1c0:5780:9200:d742:b62c:dcc9:47cd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d4d2c6sm301374495ad.49.2025.12.30.10.01.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Dec 2025 10:01:47 -0800 (PST)
Message-ID: <081b59e8-e74b-4af6-bd31-00ebb4e12e5c@gmail.com>
Date: Tue, 30 Dec 2025 10:01:46 -0800
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] fbdev: omapfb: Make FB_DEVICE dependency optional
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, tzimmermann@suse.de, andy@kernel.org,
 deller@gmx.de, gregkh@linuxfoundation.org
References: <20251230052827.4676-1-chintanlike@gmail.com>
 <20251230052827.4676-4-chintanlike@gmail.com>
 <aVO5X0NKSdkH6Ab5@smile.fi.intel.com>
Content-Language: en-US
From: Chintan Patel <chintanlike@gmail.com>
In-Reply-To: <aVO5X0NKSdkH6Ab5@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 12/30/25 03:37, Andy Shevchenko wrote:
> On Mon, Dec 29, 2025 at 09:28:21PM -0800, Chintan Patel wrote:
>> omapfb provides several sysfs interfaces for framebuffer configuration
>> and debugging, but these are not required for the core driver.
>>
>> Remove the hard dependency on CONFIG_FB_DEVICE and make sysfs support
>> optional by using dev_of_fbinfo() to obtain the backing device at runtime.
>> When FB_DEVICE is disabled, sysfs operations are skipped while the code
>> still builds and is type-checked.
> 
> ...
> 
>> +		struct device *dev = dev_of_fbinfo(fbdev->fbs[i]);
> 
> Still the same issue I pointed out in v2 review.
> 
>>   		int t;
>> +
>> +		if (!dev)
>> +			continue;
> 
> ...
> 
>> +		struct device *dev = dev_of_fbinfo(fbdev->fbs[i]);
>> +
>> +		if (!dev)
>> +			continue;
> 
> Ditto.
Sorry about that. I had actually made your suggested changes but somehow 
I mistakenly send old patches instead of updated one. I will send 
updated one. Should I send v4 or v3 is fine?



