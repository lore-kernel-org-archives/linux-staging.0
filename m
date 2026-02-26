Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 583E0389DE0
	for <linux-staging@lists.linux.dev>; Thu, 26 Feb 2026 08:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772094339; cv=none; b=BQS+vpoNbxVFAWaQ6o+kxA+HGsGHBoGGRywqMVg/DaJQ4QiBc46cL9aCat64uZB6vYlzAvC50/HoY28z4hGyANVO0FbSIg6zyO9RvZn0WLtsB1xYfsFPyNl80hpLFgfYXo3vPOGd4m4rWpTTtK23B49AYQx7nHy0+sjVfXYLzOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772094339; c=relaxed/simple;
	bh=XIwS/j6OrQcSxL2M4z+3WsXzvqEIK9l8BmiQ7ezW8Cc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TyKjWTpt8xqjIeXj9O0VxQKtY9YKRFPnhfY8o1+B0pi/yOUsqJY3Xn93RRqyuM6uVJ5iTOeZIDVwM6TaTPR8QRPvcY3SPDY6RqapZTv+TeutTj2Op4tm/8FqVmsk5OY36NWaDkhjhrO6OFv3EYrpN6sFizBzvXspRfBbKE+VMzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DyE1ad8a; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DyE1ad8a"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-4398c7083d7so493549f8f.3
        for <linux-staging@lists.linux.dev>; Thu, 26 Feb 2026 00:25:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772094337; x=1772699137; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XIwS/j6OrQcSxL2M4z+3WsXzvqEIK9l8BmiQ7ezW8Cc=;
        b=DyE1ad8aOpth3Ck51JdpHtg4pJjr+aAwk2PKwoCKNgli8+OL616V/SHxpwc+65oWvb
         V1P9TT0SIsYJlB9uMkY08N//bBHBR6xftG2fGaspyFE6iX2VeJy7QZZKsmNa+DDJ9rLI
         ytykOAsQuMe1QCYT8A1lVjwlc6408XrbNI124ofRiYBrF7uItryGjzzDolAIK63IvqPJ
         kG0Zwt+sCDaxYM9/swiW+gowQ4vb99RLaS/byy9DoUxdFuRm5D27uoWc0Tg3uyP7doGB
         91YIsAbyOJ1OAT99C8tq0oe3DLMKFSXWLGyUyCZoOsNIkLGDhtjxDLqtA9rQwW+ldY7Y
         RsOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772094337; x=1772699137;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XIwS/j6OrQcSxL2M4z+3WsXzvqEIK9l8BmiQ7ezW8Cc=;
        b=lTqAgWdtAfAmiqOBUn0McK5ol3zt7mO2XJ/c5FIR6uuyIjnjJmhcxLGGth0ixuTSbh
         fcFFwfeE4nToM59kY273+JntNvPUlMoNWqECrE3fV/f89/xyGFatQ7KbihGrSSa2aRFG
         dbqt4yUekeeps9Pq/phwDkf5TmnW5uaY7ZfzOt14HCAGiDtfLEuvmg7xGc16UDNOYpzH
         F7E760mIdgvmOXgX6DeRP6JkCtvsWKko6Gxqf5DHvLJV7zNkGD5R29+/sIpylnRt+jaA
         hDcdPLLr13ZtdqHGLES2KKm/ne5m4kg2HgQIg2WLdMf9Rwcst9N6AdFMJ4mtiduJTdpz
         IARw==
X-Forwarded-Encrypted: i=1; AJvYcCXns4hFbl94Uy5eYE5zHZ8SEAhcwDHqtNyhylwzzgCCbe7+T8a2AB7uj00hf5q92CsUeN4hptFAXw1fufL9@lists.linux.dev
X-Gm-Message-State: AOJu0YxcEI6ALSxD/FaZpfU6tE9hfOTwJvRQjeOG/aTT+Bh8RPpqFgrt
	zHwCXy9UeJvzoyfsDIBxlzIp5jSZVL00GHhT9Bc5fEbRwqDLwLWYH4db
X-Gm-Gg: ATEYQzxrbk6ISsaGzI/nWjOdr/vtampyROqHm9Lk71Jy+b4xUR03YkQRC0kNEyXd+Gx
	muPD8jaHtEBpm8XoxgRZpSpEMWc1j8d6su9eC+et/72+8I7Z1WnaVkS9QGyRXSyYwKDIQi+pXOi
	gVHDri9s1YLhmskAYlen0t4bmDA2uwGsHREM1Lqh8ggdJnXJXmQdRAqVy/XCllx7bBEN+A0Y8Gp
	anlbYZkUB75lYVr5+z7nsFcWQg2N0ZEzF6i5tBB5/PRIZR29bD8aYOmhngPDWTZRneOkrzckUg3
	64+Drw3hM10xsuX5ugHOPwC8lLXp1LWmhtbiiIsYgxFqQg2xQpMOSqEd7GbpjfRbon9vkSqk3G2
	0XKWT4dMHFrzUSxNgkVFWpX5ijpB611cGM0aJnw2gpA3qolSn+mXvfGzmVYdaxHXGpBSPuoFqp8
	RmGaaW1cVF
X-Received: by 2002:a05:6000:4007:b0:430:f301:3e6c with SMTP id ffacd0b85a97d-43997f30fb2mr2644203f8f.34.1772094336607;
        Thu, 26 Feb 2026 00:25:36 -0800 (PST)
Received: from kimsufi.. ([2001:41d0:303:6f54::1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d4c60bsm38896093f8f.27.2026.02.26.00.25.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 00:25:36 -0800 (PST)
From: Ruslan Valiyev <linuxoid@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno Sa <nuno.sa@analog.com>,
	linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ruslan Valiyev <linuxoid@gmail.com>
Subject: Re: [PATCH] staging: iio: adc: ad7816: add timeout to busy-wait loop
Date: Thu, 26 Feb 2026 08:25:35 +0000
Message-ID: <20260226082535.69503-1-linuxoid@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <aZ_9x4q5BZRJi3ue@smile.fi.intel.com>
References: <20260226052615.65734-1-linuxoid@gmail.com> <aZ_9x4q5BZRJi3ue@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Thu, Feb 26, 2026 at 05:26:15AM +0000, Andy Shevchenko wrote:
> Have you able to test this?

No, I don't have AD7816 hardware, compile-tested only.

> Have you investigated the code? It was an atomic, now it's sleeping.
> This is a huge behavioural change. See my first Q.

You're right, the sleeping change was unnecessary. ad7816_spi_read()
is only called from ad7816_show_value(), a sysfs show callback, so
it runs in process context. But for a wait of at most 27 us per the
datasheet, there's no benefit to sleeping. The atomic variant adds
the timeout protection while preserving the original busy-wait
semantics.

I've respun as v2 using read_poll_timeout_atomic(). Also fixed the
commit message: v1 incorrectly said the original loop treated
negative gpiod_get_value() errors as "not-busy", it's the opposite,
negative is non-zero so the loop treats it as busy and spins forever.

Ruslan
