Received: from mail-wm2-f6.google.com (mail-wm2-f6.google.com [74.125.225.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBFF2387588
	for <linux-staging@lists.linux.dev>; Sun, 13 Sep 2026 08:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.134
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789289632; cv=none; b=Xa3+osGScMsqzaCe92B0SJYO+e/DJPicTF5pFSc33wUEAFPzB+n21+7phL+BviTgMYQj7/Ew6JyEWW7dRiGX6l3deDnMmCFXLXTSqxrW3ii/ArmN+2X6kN0WY6EzR4Y0K+Ghg55gA5mlbgaHyqDIb00ScZWquBho9eeRZ4rNw4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789289632; c=relaxed/simple;
	bh=8tYMLwTuWe8fYcGR09huCcpUaAb1MgVXwJPlzqSxY1I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SNQAeFRYbkTtsS5XtSBMQOzFP2FmNrlm/PNVWvEHrL9FFai3Xyi0BBtYcI8JF042465n0Rbgqx3ryjBr2nYlAKHHNDHNqwx0DxsgCZxTZrkZUaLdHJNhqjGsGxPMK157rBfN29TGsBUbNtNkIsBuP8ImYD3COJLfAKI17ftbakI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sloyPoow; arc=none smtp.client-ip=74.125.225.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sloyPoow"
Received: by mail-wm2-f6.google.com with SMTP id 5b1f17b1804b1-499c930cb9cso7445165e9.0
        for <linux-staging@lists.linux.dev>; Sun, 13 Sep 2026 01:53:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789289629; x=1789894429; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KSDgB+q40G0XD7B1gkgkSaOt7eTVxj8YhAlhk59D7iE=;
        b=sloyPoowGSaLADfaSQ6byTmCdl1c+HpksJuvzGF6SYm4nzWlPCHiTfsairRgKu+Rdu
         ZDRGy39I83Re3rOrgdwws/7VxphsXTNc2c2AvsAIZj+3bQ7kStlCYKR0W8vUyTmJJ3wc
         soqGyleexPH6EdpFH9IsaCEVXHvUo+iMILLspalUnc/tXLp8k9ZBjvqR9ZTJ/6RiRZYM
         NF9CQd5TousYhc9gZbz2XVIqCfliryQKJVZRXikUFPRqkLcXU6xxJ6w2cHZ4ZERVkAKS
         yQ3FnwG+hye6QovGQmSXypNl9N41GVGJtBCbcHfY960ruiA9SV14ohlUv/joM0nwyOhk
         3iRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789289629; x=1789894429;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KSDgB+q40G0XD7B1gkgkSaOt7eTVxj8YhAlhk59D7iE=;
        b=jYQagBNwT8312ZIm2BbCis5GX1vM1aUDGQByoVeKqcuJmgTAPXuoLhxJYUA5POmB+i
         ZA7nf6Sa7mAgVk2GrPEzNJqcZPabm6VeumIVZokxKuVOXG1dQFb58jNADOIRvjEqlAJh
         q49ZICpmff2Caq2xWnVLhvQa29JveNBr8qIH1PlJwFJGGEQspwuhLdI4/9OwQcg9C3ty
         XuxCl77EfkoXVxXdZix3wRz+B2w79wFKax31gWPGG1CRU5Frg6tJZouf27qnlrWWgDvy
         gjz8lRRB+qipZJyGIG8k229+zHnUj8evqnCbH33fU5l1Z1yU/bQtZi3c+zaHmF40/8/f
         28sA==
X-Forwarded-Encrypted: i=1; AKwUvByTWscQDvRw7Yb7K9MvDjrFwtk47VS8kQC0xBLNnERDwo/sn4sNRmh5Re+Y8fo/B6HLyWR1VuGO06RC8S9v@lists.linux.dev
X-Gm-Message-State: AFuF++nLG2JDXBCKYdv5EHkn+kL9ThET1Oeq/bmKMwX/T7Ksfkr22sY/
	XWHrlRW4eiB3LtU/K56zwC2hNh2gtMe5kXECJZfWMDXf+lWroqj50nUeeBqkJpTmQWs=
X-Gm-Gg: AYBFou0MKg0MlqiTJDZ0ZTjUsJ2kKzUOreR2LJhM2/mWDgTBaNYkckvcLE7KQt38A7k
	oYM+xsw4jsBtGqESQWpgvXfn47wVfZRkaJojt2aeFSy2je5i7fOtBfWX+D+radzupaFXT589i8h
	aHiZTOpmH5M00TXfpYedszz4WiUOP3j0+cuUNyzo7wKeS8VyPz6YcgzqA6TYzZdkacsS6Wdhe5b
	yF2XGqQm8qbW6pGreo8U40DrqqIQjWANdqd0h9WakYxb9AYANH97Ls99vvVveB/g0PQQJDtSslh
	dUDEBvu0aQ4lu6htJuBBSlFBs6vDXpt0Y7m47+MzupnXl1Gpys0S1dzOlPkMahNVd25PTPXYmNM
	voXPRMKBN8tpjiXnNwIKKzJ94KG7uBS9ik6rcrt1W405+sTVkUcjtGfJiAWuPNSON6WtJtygxuK
	fdPci+f3HAzRxCK/TOlM0Ss06sjKLfiiAveEKele3cxFX4VdTHyMprbOGvjXU+TvEGjt/k8k51D
	Zm/KlsM95lOA4S0rN4=
X-Received: by 2002:a05:6000:4024:b0:486:f4cf:59b2 with SMTP id ffacd0b85a97d-486f4cf59c0mr7888496f8f.4.1789289628683;
        Sun, 13 Sep 2026 01:53:48 -0700 (PDT)
Received: from DESKTOP-M0MLFVC.localdomain ([165.99.41.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb32e7f5sm18228489f8f.9.2026.09.13.01.53.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 01:53:48 -0700 (PDT)
From: Shehryar Ahmad <shehryar.amd@gmail.com>
To: jic23@kernel.org
Cc: nuno.sa@analog.com,
	Michael.Hennerich@analog.com,
	dlechner@baylibre.com,
	andy@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	gregkh@linuxfoundation.org,
	linux@analog.com,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	devicetree@vger.kernel.org,
	Shehryar Ahmad <shehryar.amd@gmail.com>
Subject: [PATCH v2 0/6] iio: accel: merge adis16203 into mainline adis16201 and remove from staging
Date: Sun, 13 Sep 2026 13:53:01 +0500
Message-ID: <20260913085307.13846-1-shehryar.amd@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This v2 series addresses review feedbacks on the previous attempt to
move ADIS16203 from staging into the mainline ADIS16201 driver [1].

Key changes from v1:
- Introduced adis16201_chip_info and adis16201_state infrastructure
- Added SPI and OF device ID tables with proper MODULE_DEVICE_TABLE
- Fixed adis_data stack lifetime issue in probe
- Fixed IIO_CHAN_SOFT_TIMESTAMP index collision in adis16203_channels

Patches 5 and 6 carry Reviewed-by tags from prior review.

[1] https://lore.kernel.org/all/20260831184201.34416-1-shehryar.amd@gmail.com/

Shehryar Ahmad (6):
  iio: accel: adis16201: add SPI device ID table
  iio: accel: adis16201: add OF device ID table
  iio: accel: adis16201: prepare driver to support additional parts
  iio: accel: adis16201: add ADIS16203 support
  staging: iio: accel: remove adis16203, merged into mainline adis16201
    driver
  dt-bindings: iio: accel: adi,adis16201: add adis16203 compatible

 .../bindings/iio/accel/adi,adis16201.yaml     |   6 +-
 drivers/iio/accel/Kconfig                     |   6 +-
 drivers/iio/accel/adis16201.c                 | 123 +++++--
 drivers/staging/iio/Kconfig                   |   1 -
 drivers/staging/iio/Makefile                  |   1 -
 drivers/staging/iio/accel/Kconfig             |  19 --
 drivers/staging/iio/accel/Makefile            |   6 -
 drivers/staging/iio/accel/adis16203.c         | 315 ------------------
 8 files changed, 106 insertions(+), 371 deletions(-)
 delete mode 100644 drivers/staging/iio/accel/Kconfig
 delete mode 100644 drivers/staging/iio/accel/Makefile
 delete mode 100644 drivers/staging/iio/accel/adis16203.c

-- 
2.43.0

