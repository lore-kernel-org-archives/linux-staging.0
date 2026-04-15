Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 223DE393DCD
	for <linux-staging@lists.linux.dev>; Wed, 15 Apr 2026 08:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776240514; cv=none; b=cRi4CLtEhVkAs6xJu6LTXmzx9DBvq7b34Ljmlp7SB/AKAvtBpiTkcZ1aFEc0QwJmBfHvxV+cNTu9l7N7a0BZnVoDgWhb6TckPerp+Pm81aI+cOyoHfJoK6jZegTaK8mZGxhkm2DWuLpMrutmTLrCqFHPw5fyETvUfc1SaQD7NEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776240514; c=relaxed/simple;
	bh=3AArAB9JkVvyDUqHt5XNi95GMBX1UFZCe4XevFQvJI8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=rj+GO2Vmgn6BgeYmsSxPjfhXRhkeQIMP45vM0M/h801t1Wtbe2H3RN+sZ+FzsArrgg2LUvMXLCsiI/3zu9ptzc8LyfoKI5Zb1tuCSZrTbQ0zl1aeDm3b0o7Nq2nCCiEGQWiijM2siSYDoCPagJ07vjPP5i0/iRNu3CT6J4xE0XY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bv5fHiJ5; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bv5fHiJ5"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b93698bb57aso1131931566b.0
        for <linux-staging@lists.linux.dev>; Wed, 15 Apr 2026 01:08:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776240511; x=1776845311; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=POKoIB4YdAqGLajEiumFbnc3D55zVPH6mCJ2YioMkMo=;
        b=Bv5fHiJ57u3NVQPITInL+L2xsth++h8V+MXsaDe8boAt1FguPM0E2uE/6OiKXJ1nLe
         Q+luk1cGGzp9nhmLEs88nXxRerXIJvkR56F62P/G5vtG8YlICez6/69i3Le43iFdWll3
         eee8Ib4znfKPpi2UnX5gCdX8wSpC+9Jx2Z0TcsJyNNuBJFMXyqje4b0DYTcaXAkAfOsD
         lZwKO1uerIQG0IbbSC2XUVbaKYntDVo4VNGQCfwzekfV5Q/82hkSQlPScOYNKwhrWpq7
         z+sr9AQuAeQGNyRUZ9iU1FnBFmgEOSYLVItgRidyoL9WvZ0vCUQPrDHRERj4msPZsTBx
         x3ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776240511; x=1776845311;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=POKoIB4YdAqGLajEiumFbnc3D55zVPH6mCJ2YioMkMo=;
        b=Qr2mJ4miKhUXjfGTG+01aUXGx1h07Y4COFoV05f6ZM4QM84X/3v28Is9ZtT8TF79BB
         iekothgmK46vMV/3p5lka/YqrHfK2cwJID0FoNLlgdRUxThbwg0vTi22cSOQn4bv1yj0
         C1iSs5rugl2e3hOuHcczDjlvXRhCB+Jqqxft2iRFqCvRIPu6G++ZTbGU9dAJUnwtWDIX
         4pUAuteWvHHsJFN8g8aWxWciwJXC35MlbhlN5zeaXCzTx3AzS/TftVBpJWk+tIXI9R/t
         bGFouSnKYtvO8JMGTmIibimb3/SenwUT+HDKQVsUkXD2A6fSVQH/dPXJzjKf4kh3Yzgd
         DAsg==
X-Forwarded-Encrypted: i=1; AFNElJ+GCPNLRgJiT3wNTu1eXKrh1Rm0Q/Zak/B/G3oMxfyf6DfswFPHZzdtwhqp8T+iUceWFoC6G2DMpziIy1hT@lists.linux.dev
X-Gm-Message-State: AOJu0YyoLEoYOjyUSajAJgxZYdViTIYRleKa/BOkqLUpywxwVJoZoX07
	dqYvbMly9eEpCMxwbULBlX8TtgfBO2NYgcP7GfqeuksQZyJNUmKTuwrV
X-Gm-Gg: AeBDiev+det9+/enVpsvZBD4hz1mC8XSt0qcif3ZQfwB3Qldq2yOLPBa7Dc3d90xZLi
	4X13vdUCh1dHRWxGrARwi9Pd3OH3mzdhoZywaQ1Ao50EPAfi+PTNufKrjyoZgX9Gu5r6YvI5nlM
	ikZy2YZQfO+OAxogfToKppxJjzKJsABjVzcSjM2fJWeGhB0vpXlr2uUQ6q/T00JD+Vak9WSIvNr
	7Bmv11cCPEDWX/4cveWhvlZ6gF9aIpF5TYifpwp8VckNR2fMZV4zrbmJxmlkeQgQqBwXQeagJwb
	OXrWy2uJxkF62F2j2GP2S0fTuZMKJ/tEwuYcFgY5w+EMgd40dxs4OezqZV+c5VhoP/RytimdPa8
	Tqs44je28bvhPfo/10HgRW4zXu+mVXVXs4cZuN6aAeEzbKRdczvajZtxQT4JiO3PgcDH3bWxApF
	ciivL76kozzTgqmG9zyjalKeghw6XGSmeijaT4vKd6kHH0urSH3fVVDHud0H+wQNa9EN47HBqym
	74wJ3OKreO3FQRudmNX38249TTu9FzYSIu0dxG/YZ30VPRVMJGvGzPgvG+W39J3xAYJHsdb2HMu
	CQTFAM3rNsTOyHwWe6XaEe9fdpemGEbZq8SjLWpCl8o2YfSI4K+lDwW/4sdaorQfgCp15moRKJf
	cJCPcU3GuyzJoVL8VFeyxVx8R1Q4yG1wFgvoiQczxjbnyKBOtdwCu63okowQk12vWZbmKxGGKfv
	KyM25nYpFO0w==
X-Received: by 2002:a17:907:1c11:b0:b90:4838:46ff with SMTP id a640c23a62f3a-b9d76da5ee5mr1129889266b.21.1776240508407;
        Wed, 15 Apr 2026 01:08:28 -0700 (PDT)
Received: from cs-280612103108-default.europe-west4-a.c.od237066db22328bb-tp.internal (239.185.141.34.bc.googleusercontent.com. [34.141.185.239])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba1773c2013sm29720066b.34.2026.04.15.01.08.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 01:08:28 -0700 (PDT)
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: lars@metafoo.de,
	Michael.Hennerich@analog.com,
	jic23@kernel.org,
	gregkh@linuxfoundation.org
Cc: dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Joshua Crofts <joshua.crofts1@gmail.com>
Subject: [PATCH v4 0/2] iio: frequency: ad9832: cleanups
Date: Wed, 15 Apr 2026 08:08:10 +0000
Message-ID: <20260415080812.1284-1-joshua.crofts1@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This series cleans up issues in the AD9832 driver,
including proxy header removal and bit math
simplification.

v2:
 - PATCH 1: removed redundant bits.h include as it
   is implied in bitops.h
 - PATCH 2: changed ull to u64 type
v3:
 - PATCH 2: remove rogue vim typo
v4:
 - PATCH 1: removed slab.h based on IWYU
   recommendation, header reordering

Joshua Crofts (2):
  iio: frequency: ad9832: remove kernel.h proxy header.
  iio: frequency: ad9832: simplify bitwise math

 drivers/staging/iio/frequency/ad9832.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

-- 
2.47.3

