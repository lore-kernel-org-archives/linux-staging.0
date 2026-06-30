Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 815AC43E49A
	for <linux-staging@lists.linux.dev>; Tue, 30 Jun 2026 15:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782833756; cv=none; b=smUPgK2Zz+VH70CDp4WuNRYsfHpE4wfjM636HjiMW2Y3ROjPpzqNMY+DvWZr70Aqfds3+3v8Vyc339BRFhMxzk4wa4QgTUm3bXRdurXi2l95H5/T+snyMv4kTlltEroUXJfZmL01PeY3nIb4UeOkVvnx5FMworQ74IMDF/909SM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782833756; c=relaxed/simple;
	bh=l9SAqYDh99uRa+5idqLGpztcDnLC9lmCSlUiuvYK5DU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=O/f7qxaHOtZOm4ujXfKisZtqyF8aT9d9wAV+WSPsPHPn9I74I9EUlEgT94hPtnUnDzxdV7SnWBdw+pINmhtnVZuZdaFgun1t94b+Qm8x62HWkUCoeaCjHU/Edt9bab8LJvM7ApPsFXvtS+8RUCiobsQBUo5uMOxeeF0cv2hIdnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=hA2hMkUK; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="hA2hMkUK"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-493b77b150aso11799385e9.2
        for <linux-staging@lists.linux.dev>; Tue, 30 Jun 2026 08:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782833752; x=1783438552; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DF9O/32twL/C04Tje39llm96lgQatakM3itV7nl0gYE=;
        b=hA2hMkUKuGWHZ0zAfo7SQ9vdEVLjx+2h0WnTr5Fh6XT/HgDCKUaQUczbri+mCFJsVH
         gGCywquyZo4t+lvnvaC1REqLHgy8Y9W9j5+4AuQHGnbSLOHkcXqO9b+Xo1dmNxwqeV94
         U6WJDlZoS1X3XuDlLi9BVvi4M304oCXmpyV4aT8/VMUCnSxU/0cVfLqWlKk+1Uya0Nfd
         z9N3x9G00hWd1RHZPgAIGh310maB+81uT8aUq5JhwsYn8oo6yjysbQw3e6WFGBOCnhH1
         xSC6DJODe4RUraxd8RpVo1GOYHOiLNf6cUPw0wkhCrDCe9cfAGeHrATETOYpI4mZA27g
         ZbuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782833752; x=1783438552;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DF9O/32twL/C04Tje39llm96lgQatakM3itV7nl0gYE=;
        b=PMiByMYzzbd3Q7r4Vm0xxgNGaP+m+SSIdDiIwZoKgle0xh1Dy44nU/4MiKr+KHJtD9
         VLpsVAyTljmcQ+2vwao4GJikLDgpvIeDhHBsdsA0x/qEiZFiIVEDA9fkqSao7CiMoNsI
         RN/wgw5R8sA2cPFSJL37iy/nCRsK1j+Wpbn8BKblh5CTEUK2WZqrbxQ7EQMxfpNFXSb1
         POUGiVEydhhGAKhW7fAcoi7F0ViP3r2aOH8OATRtklU7SGvLidGwSslM0wQv2twQLR/V
         hnPcKut7/tDj2mFyrT9gUIb1C6BWJ4LDXHWKnhoMjH7OFHnD0SEMqa2VOU/7DqZQ+ISj
         Srqg==
X-Forwarded-Encrypted: i=1; AFNElJ96ZgIEbhn6GtMKLJUDqhPicHyC9HKwVbVhIMedZXanXFmsGk4gLEnlXd+6I/AoRLO3xdeRtSTsuyk4M0m9@lists.linux.dev
X-Gm-Message-State: AOJu0YybVFz7K3Cmoc/gaYtoHCIgMVCwE46/VCQpI5jKttg49i0HEzA9
	l/ZjkSJF+lNr+U1C4R/zlE0motJNuOKgGhVdAsIR8Elf37Z+ijHugQHoLXbuCtctVhc=
X-Gm-Gg: AfdE7ckjQeLaAE2WvlZhdZPYydqOXF2f0nbc5d6ItOjnOQcU49zywC/mxn/WYVDu8NP
	y6w/NJlGiRCMC9HovdU9hFy/CNRL9rMjDzUMBLUl26+nLfcpERkUjaK60pPCFo/wg03+7gLeQih
	0EpUopdFVYGvjtCSdFFtH9Vx3y5Lqa/LadO0HjiW/j7zno9TUa8Nwc40HvS+mcUMvjafPQsnzze
	8s0ixx8r2gkHJNDFfRSR+spqOoZkGxJ7f0SupwUTgcgimUt0FBieqy+U80+0y4RolhlUzbNwtwQ
	LXMWjoaBxNjJ972vjNxUiXJ4WfXNIbjZK0H1t+iJLwenQcds2URX310AM+LC7u41ZyhiLWlecuI
	6VNXab56mrPiILcdsCokFwqYbADmYhmm5rcSQacVslRMvqhyeOJcneDFQ6cTg+idSIIHzgA1FsW
	I9jF0DjwhuJ9W1RpGOQ627kzuIXgH0UsOBGusugP3uSu7zgk+37TfIBv7XdfmfvNguvgqMxul0W
	vea
X-Received: by 2002:a05:600c:6216:b0:493:bc4a:c6b5 with SMTP id 5b1f17b1804b1-493bc4ac7dcmr32220755e9.39.1782833751793;
        Tue, 30 Jun 2026 08:35:51 -0700 (PDT)
Received: from localhost (p200300f65f47db042a9b551def0a6b94.dip0.t-ipconnect.de. [2003:f6:5f47:db04:2a9b:551d:ef0a:6b94])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47563d195a7sm8360563f8f.7.2026.06.30.08.35.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 08:35:50 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Oleksij Rempel <o.rempel@pengutronix.de>,
	Jonathan Cameron <jic23@kernel.org>,
	=?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: kernel@pengutronix.de,
	David Lechner <dlechner@baylibre.com>,
	Andy Shevchenko <andy@kernel.org>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@analog.com,
	linux-staging@lists.linux.dev
Subject: [PATCH v2 0/3] iio: Use named initializers for device_id structures
Date: Tue, 30 Jun 2026 17:35:33 +0200
Message-ID: <cover.1782833415.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1369; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=l9SAqYDh99uRa+5idqLGpztcDnLC9lmCSlUiuvYK5DU=; b=kA0DAAoBj4D7WH0S/k4ByyZiAGpD4kWiNHg8m91o/D7fofJy/CQiuQNUDcGvmceC+UOR3Lvg9 okBMwQAAQoAHRYhBD+BrGk6eh5Zia3+04+A+1h9Ev5OBQJqQ+JFAAoJEI+A+1h9Ev5Oc6wH/jwD 5s8COzfqYhNohwbiX43TalZQTsYnqjC/vuPkNCIXJEx/SKHSR3bAENRyM1Dqw11g/StkODiIuvH kwT7CBkjgLy05N1F9AXSKoS81D0/JIlLjMQh8d0DpQz6+sSz0RQjsZKA0BwEz8/l9hKx+euZ5eB d+nRrb4dDD9t/B0EGs1jFOPL9M4eNkJp1upoqDKeLUYFq2HIVBS74TT3ZAIH/4xs0luFmoFp2F7 skvM+HlqBNI+A+Q7ohJ7WLK2BOPjqWjwntZOmSkSGNzXEVHNxurizIXw/89vqzNwmubus6MZ0so nhKzHQt5WvL9sF08DFoQre+OZiXkVU8hrQ17xyA=
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Hello,

v1 of this series can be found at
https://lore.kernel.org/linux-iio/cover.1781883685.git.u.kleine-koenig@baylibre.com
.

Jonathan already applied most of the v1 series, so here come only the
remaining bits with the following changes:

 - Squash the ti-tsc2046 changes together and simplify some more 
 - Apply the same simplification to the adis16550 driver. Jonathan
   asked the ADI people if they have a driver extention in the queue to
   actually make use of the device abstraction that is thrown away here.
   There was no reply yet, so I thought I'll implement this
   simplifictions such that it's clear what we're discussing.

Patch 3 was already part of v1 and Jonathan claimed to have applied it,
but it's not in his testing branch, so I included it here again.


Uwe Kleine-König (The Capable Hub) (3):
  iio: adc: ti-tsc2046: Simplify device handling
  iio: imu: adis16550: Simplify device abstraction
  staging: iio: Initialize spi_device_id arrays using member names

 drivers/iio/adc/ti-tsc2046.c           | 25 ++------
 drivers/iio/imu/adis16550.c            | 89 ++++++++------------------
 drivers/staging/iio/adc/ad7816.c       |  6 +-
 drivers/staging/iio/frequency/ad9834.c |  8 +--
 4 files changed, 37 insertions(+), 91 deletions(-)


base-commit: 76b8de6371463f29189d4df52f464c3fd6f3328e
-- 
2.47.3

