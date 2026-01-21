Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D78133DEF2
	for <linux-staging@lists.linux.dev>; Wed, 21 Jan 2026 02:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768961760; cv=none; b=Bj0m1i6ro08LvJ+wXbK9Qw0E1ygIkOMafVc0hiCsKVRsIIY+Qaw5GI2ofSwviALp2tv77kUr03B1B7uyO5onMlplHgt5dLgZfMRrgGV/ZA2N5reksx9Drg29M1XACY3fGY4WeHodb9L+tzoqwBFGHIOn5MpYYNFTkNABAEjM0XM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768961760; c=relaxed/simple;
	bh=EiqxYFAKuDv/UY1/7/yWHVKgFO6ivnoIo7jCuJsb0po=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UIg1CqRU+7W7HxtpgezggLfIKE+wFgWMy9jAEixfRPpOeC1LTVahGxYHtVP8B2DFt+BtfvI1k4L8zRlPNNHASqzhw2vx8xOvfMmpTa35IB/10ox78s7U2HMM4Tj3APlKbIAE5nfxsZSP7cPwPVkBH5MOikeQ7+v4FEllTYjQYrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WOJxmTwy; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WOJxmTwy"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-c56188aef06so2429727a12.2
        for <linux-staging@lists.linux.dev>; Tue, 20 Jan 2026 18:15:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768961757; x=1769566557; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rBYj61sXNcZXb9zsbWXDZntUfG6O/Hy5NDGW/6P4u40=;
        b=WOJxmTwyEXuPOq20eXXAQHNJBll2HQpJla8pZRy3uOQqC1HNJ2FEKBg6QD5A+I66HI
         JyRb5As/GHH+V9CrgVsJeZqSKRSTrJfp96oZIUcL11f2YZhBpsh5k3/raNwFhTeg193W
         XfJ+Xmw78YlPLkJQtMlQmF3NabtaUWutoXYplNwsz5EpGKDGnTqajmRGd0AwxugMtZhs
         XQErNNUMNnO74ZD11sq8kiyZmF3mXiWL3rBNHSbmj8++YP8+yOzlQcNc9CqzM2N+RlDw
         tKJyLxec+t8xz8YvqZtI+FdkdcAOT3tZXioa6xTyj9CELwciASgGEpg5D+tOaK61cq4n
         PwvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768961757; x=1769566557;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rBYj61sXNcZXb9zsbWXDZntUfG6O/Hy5NDGW/6P4u40=;
        b=Sfi2Z+fTToxNgkvxXJFCyQR247hNC1yQQ2GgsK10o6qUh9iIWUUtAzi8VZHNolz5Op
         78ZndTipN6LFSPEQKVQFAM9LCkAeeUdAnfvJ1EJU+joCCt+dLeok8u3kKDzgOG5LbSzk
         H4SJqSO7ypwaE6GzaAXUuyx6QpWPFYK7IS7e7e2Pl96ZYAEGSlpjfLzezDzlc8Q00kbX
         MC7Rb6AKriI8DlTm1wAhVed+Rb//RG0fqmHlyhvV5DqbUa9Fr9gjfH2BGbmCDTQDKHLU
         bncCP9EXouxVVqnhqZA5IP5Nvno2NXnBz/7Lhr8Bsp3VXWobQztz5fIfzSY3XHGgtio0
         LYQg==
X-Forwarded-Encrypted: i=1; AJvYcCUuudaQtV8rnI4SuE8PDK4Y1zWKPm7YeFhyA3w4stWsF2LLXApz9n02XX2TD2Ve46AB+p9mbsNjYaYF3RSR@lists.linux.dev
X-Gm-Message-State: AOJu0Yy6U7gBXShM/VPCf12PnRLOBZAAL3PW2EcaDK4Avilk3JSj+fjI
	SAoM97RVfPLUfGMfKZyXEKejLfPgEBC7jO5d/PTzCN4gqLszjH+BniCW
X-Gm-Gg: AZuq6aJ6gp7IMSFy6BGt3CU8UQ/1eTicjGPhFXg6FbzynBnP0eR35PnEcvkn1qcA6qr
	xve3cSMG6IiBVDNpTKBc3p+spXCgX65MPwLlPUchVRIyPtHg+h0SSwroNcIue/4Wid9r6HQF+fN
	e+mKsCnVd4rNQXWCHC8GNf3Neartyvudj2KX7dzDgZbQ5NI7kdRtoH8Iv4ixNjPhdYMuQC71oQ0
	cqF7CWcvs/FyGeDAqGuPN1ThbGIFIma+a0rJHJVOklMPKoPMFp3eZbr3yZDYAkXsuTSDlQ5trL3
	EEptrfvYVrinqZiq3mERNHgI1BDJoIjXo08TTDRjWDnXOEgfUO9Hg39JjM8ettbtnWoiSK+ahxM
	fufMaFWKgRw9R2rVM0qVBcdHS4FEPTShmHg0eq5gzMbs+94SbbyhMQG6E7zpw0CVT6uIWeMcIek
	DvA78bYm7vWOTJdBYbJlSZILgCeND8KH0B7KPCNwf+7EzPd0mci6dGMgWv6k8FdyQiPpBPjuw=
X-Received: by 2002:a17:902:d48c:b0:2a0:823f:4da6 with SMTP id d9443c01a7336-2a7177da66dmr148370945ad.50.1768961757159;
        Tue, 20 Jan 2026 18:15:57 -0800 (PST)
Received: from ?IPV6:2601:1c0:5780:9200:cb0f:63ad:26a0:511b? ([2601:1c0:5780:9200:cb0f:63ad:26a0:511b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7190ce4dfsm134107205ad.29.2026.01.20.18.15.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Jan 2026 18:15:56 -0800 (PST)
Message-ID: <aefd4942-41de-4e27-9777-aafff7b01aab@gmail.com>
Date: Tue, 20 Jan 2026 18:15:55 -0800
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/2] staging: fbtft: Make framebuffer registration
 message debug-only
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, tzimmermann@suse.de, andy@kernel.org,
 deller@gmx.de, gregkh@linuxfoundation.org
References: <20260117042931.6088-1-chintanlike@gmail.com>
 <20260117042931.6088-2-chintanlike@gmail.com>
 <aW3gCgB1YAsjuOZ7@smile.fi.intel.com>
Content-Language: en-US
From: Chintan Patel <chintanlike@gmail.com>
In-Reply-To: <aW3gCgB1YAsjuOZ7@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 1/18/26 23:40, Andy Shevchenko wrote:
> On Fri, Jan 16, 2026 at 08:29:31PM -0800, Chintan Patel wrote:
>> The framebuffer registration message is informational only and not
>> useful during normal operation. Convert it to debug-level logging to
>> keep the driver quiet when working correctly.
> 
> Suggested-by: Greg ...?

Ahh.. thanks for pointing it out! Will send v8.

> 
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> 

