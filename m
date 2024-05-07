Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 925A554F86
	for <linux-staging@lists.linux.dev>; Tue,  7 May 2024 21:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715116559; cv=none; b=NgTRserjKP9FJaCTjUtEPWu2LkCvRhaKwRfqRr+uk/k2dPDGYxskTb6H7msNJjHJWt3tb+pzvqlZnfqhBi7wqlLH7vP1Hi6uSbYkIAT5g7Fn6Ct+kSHb835TckL1wvX3t9aZx2NzwJ3AqandQyi3WQTgkx9QcE8E5frju8rAiAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715116559; c=relaxed/simple;
	bh=goUkuLckbYtMinqNxuCVrvPMEnCgp7dtnW5xcRA5XCY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PHZdvjroxPTI4aZp/Xt+nvZTd2Sk/0H9vTuvFcsWoOtB1c5k/Q9AILXIQFUzQHKFevthlqNBYba+El/j0dSnzqsesZzxV0OjNRyRjMJCqae+me8PrJ1KGr6c3Y+KZRXKWFa6JGhH6HCgfMmu4QkFqlULi62KbG7SBLWaitYhSdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JLnmiO0Z; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JLnmiO0Z"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-61b4cbb8834so35647617b3.0
        for <linux-staging@lists.linux.dev>; Tue, 07 May 2024 14:15:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715116556; x=1715721356; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mYeGMToteaskIs6sMPrkW/JKjEbgC3kWhMUNPICMUpk=;
        b=JLnmiO0Z4f8LV/4BBUYQPKbAxudsLY81071IpGesEiyCVD0CbVl/cA1WSkB8/gT4Fa
         3Gpf4SBxZOYDtn3u4/Fw23uGs8mxVwiTQUeN4bmQyusyO3opduv15d9ha4O51Nwk7psR
         bQ4QvV34ptQrMfcXH87mayaJmp3Tc0syw+pryKnGM3kyL8gmb+DyKQxy6oHmswGk58yr
         F4b6wTNo7ieg29KbC4P4G9X41oHj5f7pIXva1qCE+5zDIFK9MlU7A2oB4xS1812YRXYA
         qj/bBQRBBSHRmT8QbotEHEmsXRhuXh7a9Ne79QtlbQwqH7LPX01f2snY+vdFZbQ6wz3N
         MSzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715116556; x=1715721356;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mYeGMToteaskIs6sMPrkW/JKjEbgC3kWhMUNPICMUpk=;
        b=c5HKVHHGbMA8STS3VamunHl6snrevYy6HriP9+wGPXWozJ1jcjzGha8+ES76uPhy34
         OzecQHcnUnhrMujgRm6XePCCYnIWU59pBsw1cCYiODjyr0XR4PoP0xmk3ozUZzdw7ZrG
         ZJVBL/+f5aCCcFeRKv4IRqTq3WwsjHSYDTh7Hav/4SNwaZjrIHLkyRf8gPO0f/mR7v5W
         cEB1sG4zp3weEeRQF4ikG7E+x9yd7cUfU/qSPLF0ACkfjEWtSUGs2fJjr/YsSQGYUfeK
         TC4pdZisDpUFfKFSefB9g2RoCnTnAz+ORl0rGpG34DzbzoEIQz0I63YtGw/cVOApD/kn
         Xpgw==
X-Forwarded-Encrypted: i=1; AJvYcCVTAxX6Qu/VF8G/x8QKmg7r9mQecRHe2brwvQJtXaG5QuK1saDqUjT1jzyX5BNajHFHbjU2rsHB6O5yM5y8hQB//bAgLBY9ODbK5ZWhOg==
X-Gm-Message-State: AOJu0Yxa05Iom6H/EPhUYC75oor8Vne+quZceVwx8zk8p/cqhd4K27iu
	mBLu8+MSqDQNq5g9IfKMW1JID7EJ79g4Qqk4JOcUy+8EmCwcCgSE
X-Google-Smtp-Source: AGHT+IGkf8neUX4Td3fdf5viAkv7QSY2fzH2N80z+lW4vEfVjVZop7l7kDw3wXLDKTTm9Ao1ryNEdw==
X-Received: by 2002:a05:690c:3603:b0:61b:1718:7302 with SMTP id 00721157ae682-62086299e20mr10077027b3.31.1715116556362;
        Tue, 07 May 2024 14:15:56 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:e3c:6631:2efa:fee2])
        by smtp.gmail.com with ESMTPSA id u70-20020a0deb49000000b00618876dc75fsm2879497ywe.27.2024.05.07.14.15.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 May 2024 14:15:56 -0700 (PDT)
Date: Tue, 7 May 2024 14:15:52 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: David Lechner <dlechner@baylibre.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Cameron <jic23@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Support Opensource <support.opensource@diasemi.com>,
	Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Antoniu Miclaus <antoniu.miclaus@analog.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-input@vger.kernel.org,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: Re: [PATCH v2 7/7] Input: mpr121: Use
 devm_regulator_get_enable_read_voltage()
Message-ID: <ZjqaCHUc7PlbKDCK@google.com>
References: <20240429-regulator-get-enable-get-votlage-v2-0-b1f11ab766c1@baylibre.com>
 <20240429-regulator-get-enable-get-votlage-v2-7-b1f11ab766c1@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240429-regulator-get-enable-get-votlage-v2-7-b1f11ab766c1@baylibre.com>

On Mon, Apr 29, 2024 at 06:40:15PM -0500, David Lechner wrote:
> We can reduce boilerplate code by using
> devm_regulator_get_enable_read_voltage().
> 
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Signed-off-by: David Lechner <dlechner@baylibre.com>

Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Mark, maybe you will pick up this one as well?

Thanks.

-- 
Dmitry
