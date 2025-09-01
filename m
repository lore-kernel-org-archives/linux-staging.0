Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 142C920FA9C
	for <linux-staging@lists.linux.dev>; Mon,  1 Sep 2025 17:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756746049; cv=none; b=bUOxCMQJxsiRoMJWRVshsY4qIRQE4XaW+0nXwzxf7dAH1XwYzotPUHGQ2KLn+vYgCh8nktxcqSbYuf+IXlWnQc3qNQD2p/xcoWrFXpV82OrAISDuuDMAuB73SmUvtsUFbecvh6NioKClkmAkLDWVnlX2iRzakQgVRgvhBTvSS0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756746049; c=relaxed/simple;
	bh=Bt/E5fYRuYgMGd5E3qlp1QAR/XCLIWL9ANVQ3PXy9nI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AHC8IZgv7YtghZTlilzRCXJU1TH2Es1334NgEX0jPFOxd85MjcT4piDMyUxVv65Ezg9N9h9sVIK8DtRmtBxxiZtmL8+A1gSSh08s9J4CsHjGuJp5zeW5e+BdCak7F2zr/6ymmtNpeIKA9yAvJncdgXyNh01gYjjX8+gl67QaFlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=zpvPLFNJ; arc=none smtp.client-ip=209.85.161.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="zpvPLFNJ"
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-61e23ec2538so2224187eaf.2
        for <linux-staging@lists.linux.dev>; Mon, 01 Sep 2025 10:00:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1756746046; x=1757350846; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DrqdFNDTpOyLhwZdVOt2XYhBmnygUG0NkUlt1st9S5o=;
        b=zpvPLFNJLvtwXK3xYtB7oeeIqAQNo/vUaLJNF5/4rOfuLqExmf1frxj+mDdtDtRjHR
         JlSme8hAfHfyGZAIHK7eCyf5crlpMW8lW5HKjoMevFpRGUY9JQiliI/GbloV1C+eHhfj
         EBMNNS5Xv5HiObuWY2iHfKgwod1oT3YXMNvC0T59XpgooH7RQMLAZukm4N0Hv5qZgc+M
         XZLDLsi+F9bVExHGe2bvP9V1L2UwczdicL78lMR5Z4NfBkCFaTmB0Z5KZG+7vivXKupk
         5XLZdeQF0lxz5Ay5BjkSyhk4FJxJGv/haPiAGhb69l1sdW4nTCgB4FALkTArp80Y7mv+
         WGAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756746046; x=1757350846;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DrqdFNDTpOyLhwZdVOt2XYhBmnygUG0NkUlt1st9S5o=;
        b=BTrpRlLWd0oekE0P4OXKpwh7fZqCFlZ0IOiyRo64LCzjKh4JSOvXKbz3QDFLVM6+iu
         yw0px8sqVyTfrdI0chCgwJSqim3jVrYPju8O0B1To949OmsY46OhNHmx5D9mnB834Izr
         x/TkGqMcxBn6omvVxPqV0zcIPX5cC8KPyJYS5LQry5xJR3dK8ijF15v4vvuf08or/V2+
         25MLKmV0UY07hvXrJCNzX+sUuv4nq7pfgv7//IyBv7yfEqb2DgLHrnkjOxC74u+g2nEb
         0F5MKU6Z/3KhyJ3xJCzsuYhEUOzaId+JJuaMeR0LQjDw1WX8fRE9zN+Yid1yQjyBCIW/
         0Mbg==
X-Forwarded-Encrypted: i=1; AJvYcCU6cdyXMHw1Q2bRi03qDs5eEiIrAdDhIEW3moxm/yE8aNXiVbr27DhBc7csIWzNLVhKg1uqok3sZEaXfbkR@lists.linux.dev
X-Gm-Message-State: AOJu0YxHF1SiYxyftvLIQ6A24QkmPFKkhlZ74dUBdvtiaD75qL3W2c8K
	T/LA3EuhAXUMAKusXbGIQ+HJprroCCuCgLluWAZuFW0o7rg4OyKjHM9LfJPf3wLcHxk=
X-Gm-Gg: ASbGncv+J6y4ChwRh0Y6AwxJDjZFt1zhylcEulWoFMhqCsvilKcvjYXrKEvPqEUVyoB
	5rn0bNGsvrVJklgptPvuAT479YvQ1j3gYZdqDYDcCjhZx9IPm5JXCMBAVanuTpJsxqSU1Fdq3M5
	EysMQtgXDnqfRRkAr/7LdtAh36hreX6j8RqLsporNl3YW8J+uP2iu7x1kUZABz4SVsrdJSdVhhb
	k+1xibuCj3YToxrJ171Q7MkxRCDbh/u/fTyCCXwC/EIdOWEw1XbgBOhBVl6Wz2zWViqzsB0uFqt
	MICqrFcMWyol8tlla9DdBRV6nCFCZ1VYjqHZ95g3/Vv4Utaqs7HXCPuDrnG9YGR6rX42fAeINwL
	1m3kmVd5h2tiDvnzj1PepPykzPncL8UBI5lozB0CZk1HO6qhi8BT0pukH8D6Z+480pEBFGYtg
X-Google-Smtp-Source: AGHT+IGB3TjTYkZgHsuQOjcnZwKuCtsoGCrFHqU14FGoXAjd8xo5T6xjTMwKegpWpbn1ROIfbcTsBw==
X-Received: by 2002:a05:6808:2386:b0:433:ef4c:6d85 with SMTP id 5614622812f47-437f7ce00d8mr4030240b6e.14.1756746045833;
        Mon, 01 Sep 2025 10:00:45 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:3c0d:2a9:2478:d89e? ([2600:8803:e7e4:1d00:3c0d:2a9:2478:d89e])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-43800064245sm969232b6e.23.2025.09.01.10.00.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Sep 2025 10:00:45 -0700 (PDT)
Message-ID: <51042a87-0233-4748-b3c0-b167d3a4fa06@baylibre.com>
Date: Mon, 1 Sep 2025 12:00:44 -0500
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] staging: iio: adc: ad7816: fix race condition in SPI
 operations
To: Mohammad Amin Hosseini <moahmmad.hosseinii@gmail.com>,
 linux-iio@vger.kernel.org, linux-staging@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org,
 jic23@kernel.org, lars@metafoo.de, Michael.Hennerich@analog.com,
 nuno.sa@analog.com, andy@kernel.org, sonic.zhang@analog.com,
 vapier@gentoo.org, dan.carpenter@linaro.org
References: <20250901160310.399-1-moahmmad.hosseinii@gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20250901160310.399-1-moahmmad.hosseinii@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/1/25 11:03 AM, Mohammad Amin Hosseini wrote:
> The ad7816 driver lacks proper synchronization around SPI operations
> and device state access. Concurrent access from multiple threads can
> lead to data corruption and inconsistent device state.
> 
> The driver performs sequences of GPIO pin manipulations followed by
> SPI transactions without any locking. Device state variables (mode,
> channel_id, oti_data) are also accessed without synchronization.
> 
> This bug was found through manual code review using static analysis
> techniques. The review focused on identifying unsynchronized access
> patterns to shared resources. Key indicators were:
> - GPIO pin state changes followed by SPI operations without atomicity
> - Shared state variables accessed from multiple sysfs entry points
> - No mutex or spinlock protection around sections
> - Potential for interleaved execution in multi-threaded environments
> 
> The review methodology involved tracing data flow paths and identifying
> points where concurrent access could corrupt device state or SPI
> communication sequences.
> 
> Add io_lock mutex to protect:
> - SPI transactions and GPIO sequences in read/write functions
> - Device state variables in sysfs show/store functions
> - Concurrent access to chip configuration
> 
> This prevents race conditions when multiple processes access the device
> simultaneously through sysfs attributes or device file operations.
> 
> Fixes: 7924425db04a ("staging: iio: adc: new driver for AD7816 devices")
> 
> Signed-off-by: Mohammad Amin Hosseini <moahmmad.hosseinii@gmail.com>
> 
> ---
> Changes in v4:
> - Added locking to reader functions (show_mode, show_channel, show_oti)
> - Fixed incomplete reader/writer synchronization that could still race
> - Ensured all device state access is properly synchronized
> - Replace sprintf() with sysfs_emit() in all sysfs show functions
> - Use sysfs_streq() instead of strcmp() for proper input parsing
> - Implement locked/unlocked SPI function variants to prevent deadlock
> - Use channel snapshot to ensure atomic read operations
> - Fix sizeof() usage in spi_read to be more explicit (sizeof(buf))
> - Make oti write operations atomic (SPI write + shadow update under lock)
> - Fix race condition in ad7816_set_oti() by taking channel_id snapshot under lock
> - Fix return type consistency (ssize_t vs int) in show functions
> - Use chip->id instead of string comparison for channel validation
> - Add explicit cast for narrowing assignment
> - Add default case for unknown chip ID validation
> - Use cansleep GPIO variants in sleepable context
> - Improve lock documentation for protected resources
> ---

This is way to much to do in a single patch. Also, given that this
part is obsolete [1] and this driver is in staging, is it really
worth all of this effort to fix it up?

[1]: https://www.analog.com/en/products/ad7816.html
