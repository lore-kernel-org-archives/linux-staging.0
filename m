Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF43F343D9D
	for <linux-staging@lists.linux.dev>; Mon, 19 Oct 2026 01:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792375106; cv=none; b=qBjcLYAP0Z1g2CUsGG4fZhK5lYkY/k41ZQv45D8AXpUxiFYtNo53kGPemZRqJZ7ZrFfB/ZC6Jk/3wTXqBjC4burbtW83hZfTZ8rPrSSaB1tf/tI2ZUbsfUS1fGf64M4+NiWZ24I3im1Z47wIN27Ugv8qEP4woBzQgEUAEsTg8Ao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792375106; c=relaxed/simple;
	bh=kl8uHsKtcdd3+P1gKs83VfUWcS1UvEVB1ftqYP2i9GI=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=ncAm3IOhHy9F9dB6v57WWKSpJpWtfXfx+s+uUZ4rziYxg2FVAZVZRwyyv+tuLXTP4WYiKxS6i6p40trVmc72sfty7QEebUfRlKlt0ho97pMbSkCP3na67SlHkfEM7sM6mPVkV31z9PXag7DG1MeJm7ZAEVHDuxJk071VZy86NUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VigkJnZv; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VigkJnZv"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-8b0f59a5fdaso8216737b3.3
        for <linux-staging@lists.linux.dev>; Sun, 18 Oct 2026 18:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792375104; x=1792979904; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qiiLrBltsrNS/cDaqww/ZFhb64+tZsgZICIoZQIW4nE=;
        b=VigkJnZvkyXY/3y4iOQ/7vyUivAXv4FxBbBvtfBxA0TINGQSBUxSuWNUyGTell3gCC
         LkHn2g/Y4+IB8AUAjP23SfN7tLL4kEc+AG0hI6SqtekHsWrmeH4LpxXQoDbPNIvhXPdR
         w60+ftlE3Qv5BZFKnPAc+7CQYHISuZnVQLgd3orBTiBp+ZZRrDHSuiv5V7E6Sv4B0TnM
         FXQqZ6jTjj/W/O6SmEtuKlTw52rgUmxHzlHa0z8yEWv8f4BZJTC6kdeZsUghq3P5q/aY
         hVb9YyZLCdjMdT4Y/zMqia+vJVPv+C3I31iFr2HXomusBWvtTB5YsvSyX4o7IR1UHZah
         XhFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792375104; x=1792979904;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qiiLrBltsrNS/cDaqww/ZFhb64+tZsgZICIoZQIW4nE=;
        b=JnQlkjaLoPQ5n1KLGB4lg6P3ZRjyYRMDS4Lh3TeBXBn6tzdKEpvZRnFdbFMdag9SeA
         pY5dN8kGvYN6iNUCkX3G4CTNPywCd1x5ejpXGYI+MCCgfV1Qv0FUsAXdL0qPJAeotxod
         m1d9w+jHomQ9YssGVbtrMLC1IPLqLJ2SmOAeZxcqMBaeyKmn8iwek1ZXAfJiCvFm4bit
         c/7ETyNQRrUiM8f2tDTzwnONr/wwWvVU29bgDWUw/F85NMBstOrjQy61imu7hXH17v0T
         i+mFWHSvEyjT3BN8Ni8yHmEaw2+rtfM+tTpbPiynO3RRYczEvRhiXzV34tXUGBXzA/OV
         iSLw==
X-Forwarded-Encrypted: i=1; AKwUvBzXLHgl+vd9hKhUuE0Dqxe+5c/KsFGSePNSJfF92+9yTrLIEG9uyxpFFmJbfk5RishodLTxw89RSYWFVCYi@lists.linux.dev
X-Gm-Message-State: AFq9FYKiN6AUpfKwtGI7zyvwHy/CvTPyxHB7+Hr4vTQGNJDQXX8pu0gw
	JclUyGIrOc3vfdcq1w9MXAj3fbX3Zc3ga59yr/0sHnE9Jr9E+O1FDJKN
X-Gm-Gg: AYBFou3pNpGH1HcLGfuJjChdF4oJksCqEI+6hcbyEzFeGF4D1+MTZc2C4GsRM9M5YN0
	/J56viSIB+rFZ95Y6BkLJ+Cx9r60caXz7SL2v/w6pnZnEyDuLW65xwaWDVkI8zBR20W6JGQ+vE2
	2jElNC6yrCsf7+oB+mABDr0q/x9v6p5uBiF9fzd3tDvO7y/9fis05zi452hRi3crenCoObCL8Pz
	J/o1qkrwaqEfn/3Kxmu6qrX4+DMr59Wk0KMQ/SCMWXDTh7+MHrnn5yrW18Tgr+RO5zuawFArYYg
	yEYRAmoJRGljmOOzgo36DkgssreSdtJfXi/VKg7APKiIOrt4hg18s6SI0LuOh2CZH2fGKyeowkj
	VHHvZqtG2IoVK8IiX7dilAx5AL+PCkPDajxPmGdMfF1BI4kx587rddkWwvw2/JRNoA8JT51lv/5
	Jcw+qVN3SocvRyHmGznYcacPsKNwv0lfq+XJ1IIPydDarsKE/hfe9wPBJ9m5jtzPKKjEVQZvh/V
	nEu3gv6SJtMcRatBc7JHPsmogvrk59Mt0ZmpK1kXULO4a7xunZvoaiV/UBliQMvqmXHZoFrf+kt
	imnY
X-Received: by 2002:a05:690c:e3ef:b0:8ab:33d2:152a with SMTP id 00721157ae682-8b0f21c14f5mr21503857b3.52.1792375103747;
        Sun, 18 Oct 2026 18:58:23 -0700 (PDT)
Received: from localhost ([2601:7c0:c37c:135::8803])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b0e58af029sm35834427b3.19.2026.10.18.18.58.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Oct 2026 18:58:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 18 Oct 2026 20:57:44 -0500
Message-Id: <DM8FXLI78NYT.1211XFYSRH5P7@gmail.com>
Cc: <linux@analog.com>, <linux-iio@vger.kernel.org>,
 <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/2] staging: iio: addac: adt7316: error code and probe
 cleanups
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: <raffaele.tranfaglia@gmail.com>, =?utf-8?q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, "Michael Hennerich" <Michael.Hennerich@analog.com>,
 "Jonathan Cameron" <jic23@kernel.org>, "David Lechner"
 <dlechner@baylibre.com>, "Andy Shevchenko" <andy@kernel.org>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261018-adt7316-error-codes-v1-0-1970b7e242ac@gmail.com>
In-Reply-To: <20261018-adt7316-error-codes-v1-0-1970b7e242ac@gmail.com>

On Sun Oct 18, 2026 at 4:41 PM CDT, Raffaele Tranfaglia via B4 Relay wrote:
> Two small cleanups for the adt7316 driver.
>
> Patch 1 makes the driver return the error codes reported by the bus
> helpers instead of replacing them with -EIO, so callers see the
> actual cause of a failure.
>
> Patch 2 removes the dev_info() printed on successful probe, as
> drivers that are working properly should be quiet (see
> Documentation/process/coding-style.rst).
>
> Tested on arm64 QEMU, with i2c-stub providing the device:
>
>   insmod i2c-stub.ko chip_addr=3D0x48
>   i2cset -y 0 0x48 0x4d 0x01
>   echo adt7316 0x48 > /sys/bus/i2c/devices/i2c-0/new_device
>
> - probe succeeds and no longer prints a message
> - device_id reads back the stub register value
> - writing 0/1 to "enabled" updates CONFIG1 (0x18)
>
> Error path, instantiating the device where no stub chip exists:
>
>   echo adt7316 0x49 > /sys/bus/i2c/devices/i2c-0/new_device
>
>   before: probe with driver adt7316 failed with error -5
>   after:  probe with driver adt7316 rejects match -19
>
> Signed-off-by: Raffaele Tranfaglia <raffaele.tranfaglia@gmail.com>
>
> Signed-off-by: Raffaele Tranfaglia <raffaele.tranfaglia@gmail.com>
> ---

This is the current policy regarding AI and staging [1].

Thanks,
ET

[1] https://lore.kernel.org/r/2026080354-skater-urgent-31b2@gregkh
