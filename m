Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41C80260563
	for <linux-staging@lists.linux.dev>; Mon,  1 Sep 2025 19:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756756050; cv=none; b=D+tH/aGm2laJFHlnKqX+zsRhwGFgpZAbxezvKpDCy7o5TqOPk99nNtBd+T30F+96F60I7+N/YNd9sNArjLodC+hnF3BkjtuW9rAtc6iqujyFYQdjRNuqM/qGelVLxhxzggFdfimtNSry663GOZf99clzgQbdaN3PCBxQ/oS5aSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756756050; c=relaxed/simple;
	bh=RcgZq6hquKpfqYbIn+6sTfO1bsT384AJr49qfHk1DIM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ilrIFbM0zNxWYRMBxHSbqrGrcWX0h6u2bAd/dYxMN2cFiMarZMhf+Jzy9VQthDIUbCNjFb6U4l8qzaWDNmXV3pEPQKpuWa2cm96aOMFVLb4jMkZkRb8Yi/tOBoZIOdncXlmVRfRXqxEUHGW1x4pGHv/l75b1p9JBEQFwV/umabc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=U5Ihc7lo; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="U5Ihc7lo"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-45b869d35a0so14376195e9.1
        for <linux-staging@lists.linux.dev>; Mon, 01 Sep 2025 12:47:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756756046; x=1757360846; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JSndmNKgJlks386GK4b6RRkFbD+zX0itT5uudAAwxDU=;
        b=U5Ihc7lo/jSM4lfD4ZkIlG13KSQjIelb//i5k/g7q1ULBbx4kZ9D+KczowvyJxoWfn
         zBTh91ngkT/J463mPmawzOhj2JVQXz31jvshi7JjKVC83hpUEYRgY8X+fzwqqbbGC89w
         5hMSnjiMe0NbDjl3yDtJCGP5PE9cu67M93inK4oocM2RL2649x0wDOi9cWNf5zJcFtXI
         k3Zl5v8mFZ0VRK8iY2Rr/LgdSeZbVbCwA3a/3zTjB5RQzFr5qjHf0nd+uYSfKZ/x7ewu
         0A6EB9n3z0T2QiJ2kbiP8nhYO6oW1+f2FvUF3SwKoXxiXrR+JeIXhPrPetOZbNWpfk2U
         Ph7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756756046; x=1757360846;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JSndmNKgJlks386GK4b6RRkFbD+zX0itT5uudAAwxDU=;
        b=t5yCJt2CZpfwvIZn+ag531vAmuiyWn13UMOxOB70F00cxxB7fD8Bw90a6oqnS9sZZo
         nZOuWrnbRj+wtBz+66i5ibvCApRYvbiqXf3qUtzBmUVmAhpIQvl+QzpRgjD9+Mt0DWlw
         UzRrb0kewdRT/JkwcWYIbHJAHOnSHji9oZPwxjx/wET/7KuUJp4+r79bGWVDVpus12wa
         v/t4a7mdcinJL+2i+jyeNL08mFXpvF6L3QjmaGC+eG0y6wqJHttHQN7b8c7KSXjR36rV
         WJx4VO5TkQsgKxGY+/19OZsL+LDbvcNEJ5nnASMM9oYdb9h1pyzoY0+ibAls8xYoQhwa
         mH9g==
X-Forwarded-Encrypted: i=1; AJvYcCVdZ7QX5ywuTk9w2MTeCNiGm01SK8m21hNwMNXgQGdkrJWqbw56W7Y2Y/NhOOYxg6Ygr5kKUkVsuyH3rrcS@lists.linux.dev
X-Gm-Message-State: AOJu0Yz39eh1yzkAGEigsZobAxWikuXsrQ45TGCT+ukjWF9+bDHE6vCe
	Ytx4s16VnLpbAL6/Z6qF8B/OpL82/SaGJOhX6YXrklUdD4jR26ZAhkKFm3am7zbKIqE=
X-Gm-Gg: ASbGnctRAp4h4pwuqEH2o7GZHQni61lCw/Sn2O8JbZMwSH8h+lKX3LapUbSrJJoNHIS
	XuzftEQBZxnnfnHf0G/GHwSg0mZXaEblNQScOmXpr8N1iHIsy4ItnGYK1trHYfCpKrWqKiYaURA
	L41M35OM7WHA5RuC7ABdc9SvGAT8Fk+mOBjXznGQ9LEYOApp3rGPleozK6LD+e+JalSGon6SuqX
	+LJ7iPzx6CV8Hef6m70SJS2vUUWP9PK4ffYeR45Q05YzpHs+KB5dSwbCE/zJUTEoS3V01iugsQY
	HL7xRddFD6appFNc4+sQWxMeoqBKJQG58+DMo1nWPGCgAup8BpwUqpfOZ0qLjZEn26NCi5O99AI
	kAKDCZvNOfTunCVThiefGSEl1AOo=
X-Google-Smtp-Source: AGHT+IF9XFzQaT4OzJqcXj3L72JEO/FSHcvHo14utxyiHAVTrzPdiXGjm/HvwtINoBkZqKmFN9Prrg==
X-Received: by 2002:a05:600c:c491:b0:45b:7a03:8d7e with SMTP id 5b1f17b1804b1-45b85587defmr63827345e9.21.1756756046448;
        Mon, 01 Sep 2025 12:47:26 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45b96d2a6b3sm1825785e9.10.2025.09.01.12.47.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 12:47:25 -0700 (PDT)
Date: Mon, 1 Sep 2025 22:47:22 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Mohammad Amin Hosseini <moahmmad.hosseinii@gmail.com>
Cc: linux-iio@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org,
	jic23@kernel.org, lars@metafoo.de, Michael.Hennerich@analog.com,
	dlechner@baylibre.com, nuno.sa@analog.com, andy@kernel.org,
	sonic.zhang@analog.com, vapier@gentoo.org
Subject: Re: [PATCH v5] staging: iio: adc: ad7816: fix race condition in SPI
 operations
Message-ID: <aLX4SmvqBjJrS3FS@stanley.mountain>
References: <20250901194043.20366-1-moahmmad.hosseinii@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250901194043.20366-1-moahmmad.hosseinii@gmail.com>

On Mon, Sep 01, 2025 at 11:10:43PM +0330, Mohammad Amin Hosseini wrote:
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

I've asked you to wait a day between resends and Jonathan asked you to
wait for "a few days"...  It really is a headache to review the same
patch over and over in the same day.

regards,
dan carpenter

