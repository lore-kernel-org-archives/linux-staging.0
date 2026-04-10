Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5B942EBBA4
	for <linux-staging@lists.linux.dev>; Fri, 10 Apr 2026 19:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775849167; cv=none; b=aey9Ls85VQuZ0t2a8/nkFK/dzLQJGqPmPh22H83Per0VFqUYVshulE3NeJjv51p0oR4r3ny4sfIcarDBIdGtZsTcjjWsDx/P6QzlgtqKxL0oDJdn9KvHRst68y9Z08RHGReYLbuX6aZe6aHVq3QdM/y4p81yr86XpkA0gKEuPz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775849167; c=relaxed/simple;
	bh=s6wEwwesVR26iVgn/tsSt+twoNPoH8F2NzpaStGjxl0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j2P3dyihflAQ32tJW+WHwLyFSYXcg3qWauolwjvOTqhBD4RUhUbiof/J9arZ8OSrkuWr2LEPvH3mlbR9XfGJg2AZ9m+e8RM+MoOd9OQ1CYoHqdXdA4Eq7bDM+sJ5S/ISKQL0x6EhOfBgB+/r53zSG2zKoxAQE3ZHp5j1GTKrcK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=Jjecbpll; arc=none smtp.client-ip=209.85.210.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="Jjecbpll"
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-7d9b21d1461so2288995a34.1
        for <linux-staging@lists.linux.dev>; Fri, 10 Apr 2026 12:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1775849165; x=1776453965; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iKiBe8rgBpLHxLTkNsa5b/bSw+gXJRM0EijygM+CrR8=;
        b=Jjecbpllc+uHz5J2bpnIlmWofZ1SGulvOs1e04RVZ/6d7WnIubqh78ngUlEoe/hz7C
         JJzhuV5oLThJ6ZC7dRCKuV4p3gZ0undisGwFDv2RaT2b6d8e31HqLJdSeOF5MehAG/kA
         vZPWz4x0ei+qh7l/UfKabHX31osPlQMtpcSj9XELhrFj4OIN/JCw4cSBcGvNd1q4RJYJ
         8t09qnRV8h9Akr7QOqnHZdDGgjuwbfVCmEpmvGUDhWnNQOKnI+PFY6Ee4+kmhCe9n7d1
         gLH3Bp5WaW9ZkNEjbIWy9ivgkO/6fzEOnJoQVYfT0HmNVCcoaHYmFsJh32F6413ao3Fq
         GQ3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775849165; x=1776453965;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iKiBe8rgBpLHxLTkNsa5b/bSw+gXJRM0EijygM+CrR8=;
        b=AVlEGbqYo5Hqw//2LWpRcDCYvGcBqaI/WNn4yg6tGMhLWDi6jvDTuzJLBKvOvx1pU+
         UsjH5i9VWEYKRNvx90WOquzgN+kZ9EfinxD57qBz6oCsFk/bDgApd3KbT8i+qAg+Lvwa
         o7M61UQpMZKcAy94dW6BbDAgdjKa+cHktxVsAaR9KJk3VekobGwcavfKoavs1A1lQB9u
         YnMPdNMOpy5Qgh5+asctNv1meVHueGf1Ta8DCJfun+ztYfd8HsJ/Zqmd76utK8IEMKNC
         XB69d6NoJ8Hrjc6szg9iVQay/A7nlJtloWulag23hwh/lU9Ha09w17AzzHPtwhw9YyxH
         ORLw==
X-Forwarded-Encrypted: i=1; AJvYcCX8UHVY9hYV6t0p5LPjBUUIRL67307jsuvKM+9NarlKYbLbBNH0TiMA7VdXMMEaM9HrtukBMNvDiU0pruIV@lists.linux.dev
X-Gm-Message-State: AOJu0YyN5MmJ6RBtjD1jGYvDXSif902yB8lxzlN9jTuuIqk2R4rne1lT
	6K71Hn3oX8npX9+Dbuxyb3B1X107uj4Zm3bjoDUWGGr0hZpJis9Oi4HxU0+qzE1K9Y0=
X-Gm-Gg: AeBDievCNmltEl8PoXRNi7oZi0XCZ/o+Sr09VmC1JOwEpzyngY614qLJS8xwqtm7whm
	CHUkuGaoEYNVR0gDJi0JqCYraU2cfWEOBAPJ38Bpm4ziLBcVrcddMSxzFVulgURhvji5Dw/Yhc8
	KdfN5zMmxDWt08kUQS84/qVyaCPxAOyqyygZGH9QlP2DKu4y7hcbYAz+edIMykoq+DGJYSbkETf
	Nly4ZPv+KZr9JRbWSkt3utP9n7GFZmIQ4TX7eDbGp9W0E+53iyaXtcxXBacNw2gHVjVwoUAo3TE
	vYowJtMz5BiWkuVv48saQejt0UM5QWg0FQp37hX3mrpIRX1Yx31mUYhqVnXYy1qEBq9IuT7sPcf
	r6E/utURdLL39hnb11GAaQDYWs/V+gcge0yJwXUbO8hHbXpZRZt06utvCEJnL28snyyPe0hW+AV
	7NK2vzaXl0v0X2QmW9Q0wZm2aDY6ykVaeZ38cQNSHhfw1nJ5tL6exejC6zWbMJnZRRBrwv69u40
	g==
X-Received: by 2002:a9d:7b4b:0:b0:7db:a297:9e62 with SMTP id 46e09a7af769-7dc17632cfbmr3187099a34.8.1775849164720;
        Fri, 10 Apr 2026 12:26:04 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:b75d:2440:dc10:808b? ([2600:8803:e7e4:500:b75d:2440:dc10:808b])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7dc2664157fsm2580273a34.12.2026.04.10.12.26.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Apr 2026 12:26:04 -0700 (PDT)
Message-ID: <ac8912f2-3bee-483f-91f1-72c5346792c6@baylibre.com>
Date: Fri, 10 Apr 2026 14:26:03 -0500
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] Add QST QMC5883P magnetometer driver
To: Hardik Phalet <hardik.phalet@pm.me>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jonathan Cameron <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Brigham Campbell
 <me@brighamcampbell.com>, Shuah Khan <skhan@linuxfoundation.org>,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
References: <20260409210639.3197576-1-hardik.phalet@pm.me>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260409210639.3197576-1-hardik.phalet@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 4/9/26 4:07 PM, Hardik Phalet wrote:

For a series this be, please wait at least a week for more feedback
before submitting the next revision.

> This series adds initial Linux support for the QST QMC5883P, a 3-axis
> anisotropic magneto-resistive (AMR) magnetometer with a 16-bit ADC that
> communicates over I2C. To my knowledge there is no existing upstream
> driver for this device.
> 
> The driver supports:
>   - Raw magnetic field readings on X, Y, and Z axes
>   - Four selectable full-scale ranges (±2 G, ±8 G, ±12 G, ±30 G)
>   - Configurable output data rate (10, 50, 100, 200 Hz)
>   - Configurable oversampling ratio (1, 2, 4, 8)
>   - Configurable downsampling ratio (1, 2, 4, 8) via a custom sysfs

What is the difference between oversampling and downsampling? I think
we have used some filter attribute for downsampling/decimation in some
other drivers so maybe that could be a good fit?

>     attribute
>   - Runtime PM with a 2 s autosuspend delay
>   - System suspend/resume via pm_runtime_force_suspend/resume
> 
> Regmap with an rbtree cache is used throughout. CTRL_1 and CTRL_2
> bit fields are accessed via regmap_field to avoid read-modify-write
> races. The STATUS register is marked precious so regmap never reads
> it speculatively and clears the DRDY/OVFL bits unexpectedly.
> 
> The init sequence on probe is: soft reset → wait 1 ms → deassert
> reset → configure SET/RESET control → apply default ODR/OSR/DSR/RNG
> → enter normal mode. This ordering was determined empirically on
> hardware to produce reliable, non-zero axis readings.
> 
> The driver is placed under drivers/staging/iio/magnetometer/ with a
> TODO file tracking the remaining work before it can graduate:
>   - Triggered buffer support (iio_triggered_buffer_setup)
>   - DRDY interrupt support
>   - Self-test implementation

These are not reasons to have the driver in staging. It is fine
to have a driver that doesn't implement all functionality. We should
be able to add those features without breaking anything.

