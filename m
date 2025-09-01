Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7B8626F2A1
	for <linux-staging@lists.linux.dev>; Mon,  1 Sep 2025 20:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756759066; cv=none; b=QhNrnoc/qQs8BWDdJ1hdeoeTAMD/OtrgLdWYFLDrkl/ymf9/i+ZloFbTNRo8d9Bi6LOHTLHNva7Uwq3NVgTzMQT2FAJlarDjuFrbe65/v+oANMdVh/0raXwXsqPJ5SRNAGSC+nJr/dRokRZo/IE1B3+dsKmxgWO2v5A8jFXXHPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756759066; c=relaxed/simple;
	bh=+HxizGUNPE0IAbaEtDTKLzRhHig2naRomVFB+5URGC4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PXmUpTugYl/6YB5IMYzhi2FIJU0cgk8J1dXXp6/KIKlm0rb+5XgfYvxUQ7hF+LtSW68arsugiElwazC6bDSN4Q/ogCwc8rP/PAz5FkAXLN5jsaDj5EHDq/cVuWc5rM2XFmhcC95RAAx7TS7quiwqLEK3t+nsfXCq0pHHUc46B6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=X/Kx3nkO; arc=none smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="X/Kx3nkO"
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-74526ca7a46so1615220a34.2
        for <linux-staging@lists.linux.dev>; Mon, 01 Sep 2025 13:37:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1756759062; x=1757363862; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/zfsf0ToW5FKPBE5eHIj7npldCgSMxNQpkAfQKcXNrQ=;
        b=X/Kx3nkO8vDHeBFmHjYarSN3tqTliC/ONt0K6N1sS7qebnjMtZtBEMeInrWBxMPsmD
         EQWLRgVUAhSPifO4dhFv2YdEzpcSa0JwfsIilnl3dkL3iPlNXp6u6BHXkCC9Wch1h3H5
         NqNgWbIScnyljJc+kTssrZyNSTvFBTGuDWqEZ5pBLU8VaTX0ecwyVnBjQ7WXlFxdqlLE
         NrFgdV902avyYnplRxPpOUIN05VxVEV4NITLejj+7S1e8ags+HPKjqo6BZLIpUAwwGSi
         7Skw02k5zKdP/8DaFpDH8h/yDaJ3wMMy3uMdOo0TzsZvdTSNEyovH1Uhy1MwwlcatV/T
         Zyrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756759062; x=1757363862;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/zfsf0ToW5FKPBE5eHIj7npldCgSMxNQpkAfQKcXNrQ=;
        b=nlpQHVtzuvBL9jj0ZHE9PABikfSn8MFP8ORadMfVv6nzc6A7R/NibIZ1QbdzXFkftV
         ivCG1UWmojdOf6ojPQ88lhj/Bk7wtRJhxCOjkNx1GOo2V16/sbImmxKYQJdXOmsWskmK
         ACKJ9BpRILtlwM+Vkws4UR294aQFYAt88Irhd8C0+HK0EzSkAEymXET+c6rumGj4X4En
         vEM72G/HtbzcyjTeAdbluc8C5v/U1FFoOykuLkV1UXmpwCDI/jVrxC3pI0FWWd2ijHuw
         5hDRBmKMxsDaoSDzW4BsG9Q1gjb1lF0olQhjKh0CfafIx+Z4zjiSIpQGqcOwzyn1qptP
         BzHg==
X-Forwarded-Encrypted: i=1; AJvYcCV7WDruOLeFRoF/dUoqA3hEp7ImePvKrUwR/S8pvyRSpir0b8D2CkyQcT41SZ8VgeMUDA44PO32wPPpifl2@lists.linux.dev
X-Gm-Message-State: AOJu0YzLgT96MgvEVS+/FzuQkrBL7mmZTUYTM4/K/KFUrei18w646k91
	R+pXQhsP5qNdxIJ3Q5tVvHR3tm2RtH5VVziHuoX7HsbHPo9nP2Wqptu94FA+gR6WhRw=
X-Gm-Gg: ASbGncv8646rTIdZKW5176Lj6V2sC/Ik79XSa+RLjMvv7i546b66mCDwnFr9DH7sXP0
	dPS89irvgYSe0EMD9937CDqXRMMK5cKguv6NlFTV3ABe8Bdl5d4RVJJ9hmyCQ4lOBpJT0tkHVLw
	8Exe8PR7bKMyty2Za4alscX2bE7g3MXZ1/N7OfOfrb5GlwO92VSxIQK1A1FwJluj1rcFucCsvGU
	NCM15TNAAk57lWyK5EdNqrY9/nxw3bA8lr119fK+FuqkhurgYjvW/Lpr8H9sNMZAfNTw3trLR8w
	NeUFycY+qvFvHkzOlTFA0vZL42KvoSTTVivhHsoT9sFzabTCP6arsBgcpAa1CyOswqgFFRpeAeG
	LimdWbguAjMrq/0VqsyOhbiRxTdoWrY8Ea2QVvo+idGqSrJ29gnXikOUtw7Qhb9wsJqTpZMrVr8
	Va8nLxd9E=
X-Google-Smtp-Source: AGHT+IHn+yQITVhX7JOhNKmg1v0d4AeFsuyhfMZxVSx4jo79SO8Ist/PfxPol73ufoIwTw32azv2aA==
X-Received: by 2002:a05:6830:3109:b0:741:c038:f51c with SMTP id 46e09a7af769-74569dd8573mr5472670a34.11.1756759062500;
        Mon, 01 Sep 2025 13:37:42 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:3c0d:2a9:2478:d89e? ([2600:8803:e7e4:1d00:3c0d:2a9:2478:d89e])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7457428c153sm1192315a34.8.2025.09.01.13.37.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Sep 2025 13:37:42 -0700 (PDT)
Message-ID: <5365cf30-042e-4b71-87ea-3766c6f16bcb@baylibre.com>
Date: Mon, 1 Sep 2025 15:37:41 -0500
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] staging: iio: adc: ad7816: fix race condition in SPI
 operations
To: Mohammad Amin Hosseini <moahmmad.hosseinii@gmail.com>,
 linux-iio@vger.kernel.org, linux-staging@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org,
 jic23@kernel.org, lars@metafoo.de, Michael.Hennerich@analog.com,
 nuno.sa@analog.com, andy@kernel.org, sonic.zhang@analog.com,
 vapier@gentoo.org, dan.carpenter@linaro.org
References: <20250901194043.20366-1-moahmmad.hosseinii@gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20250901194043.20366-1-moahmmad.hosseinii@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/1/25 2:40 PM, Mohammad Amin Hosseini wrote:
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
> Changes in v5:
> - Rebased on top of latest staging tree
> - Dropped unrelated cleanups (sysfs_emit, sysfs_streq, type casts, etc.)
> - Keep only the mutex locking for SPI and GPIO access
> ---

My comments from v1 [1] are still applicable (have not been addressed).


[1]: https://lore.kernel.org/linux-iio/b6c2ac13-2781-49ba-964f-ca821b32e2a2@baylibre.com/
