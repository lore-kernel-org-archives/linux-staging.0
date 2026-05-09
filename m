Received: from mail-dl1-f65.google.com (mail-dl1-f65.google.com [74.125.82.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AE9E2EFDA6
	for <linux-staging@lists.linux.dev>; Sat,  9 May 2026 09:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778317422; cv=none; b=RwmOzxf8Sxtikvv/lhliv1NsOc1GpGdt4CZ3MSPm5BRbLX8lFR3W9s8WUDOTjRJBTGW7iEdKdlJMZA+aynVOv0fvUHanY97L7uZ5d0wN3NzESQUs82XqvzXlpt1OkwQPKvmTA5BliL2B6C0e9Kg63vI8VoSz8YQCHTJXLvzj+Us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778317422; c=relaxed/simple;
	bh=byOtteQFJj7wH2m03b47SoF27/lgF6IuUDHq8SOBtxQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=u/gnkjBcrSr+NF9kXVTxQvw16lpa11p6GGqZTSq4SiGTu9j7Jqi09c7xTXHS2IcDSA453b2xMABHKTkByNJIeK5DuQLOXWcDlYaS5/S1ykHk6vvseYZqQCdtzADzlHWKdOooBAFmsXjdJjNzp6zKGileNi190gyQmsG+yqwpl0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XAQuQfvN; arc=none smtp.client-ip=74.125.82.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XAQuQfvN"
Received: by mail-dl1-f65.google.com with SMTP id a92af1059eb24-12c8f9846c8so3991518c88.0
        for <linux-staging@lists.linux.dev>; Sat, 09 May 2026 02:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778317420; x=1778922220; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ng77Sr+Aq2eTeCc4veSUx5zjPL7nDApX4AemJNimqX8=;
        b=XAQuQfvNWr1v7uO3VrezC7CJZmEPMqQiy+CgsaxixDY2r+2n8XbMRRSZrdYeOQmmgr
         xMhaulHDxckr2pcj4rxdNILDCeMOfvucB9HVw8NHZUxkx230wwF7c3T32klFEiuO1wAz
         VtGAHYvbRJF6Wi48XUqp+aYJOD6L+wGK/SFydoVI0VIx85z3auE+sTIu1Q2bep7trQv3
         EXlY4KdiPGDUrD0uXRDdhWUF7jL+Gx5+Llq/YyFNGRgzJFzqCBq0b9iYG+Sl0SrtHONy
         zgZcE45aL4DpNDai+wDJGrDMoOJzNh/EcXbb8RfBQM4k9uPD2wiQYGfWnXXkyhy1a4sY
         ymeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778317420; x=1778922220;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ng77Sr+Aq2eTeCc4veSUx5zjPL7nDApX4AemJNimqX8=;
        b=m9S/Sf5Rbw7UeLGDmk6QHJ03dSCygMjWGZAK/cHvSrfpighzQDPf584p0L2n2kip1f
         vRapS9cR3/Joc0h4J9eFRZV4Gndx2LA34LVFF6EXDgQxVQIRlyROH3BJyhJAjd4EII4K
         2ugvn5jTuA5YXYLBaz2u6I9fK/6XThQl8gcsjkezoJeW7XyPEPlC/LiV5XXhRZ8nbLmV
         G/Ub3sJ2F2q4R+JbwP89FtgHBIl0yXbExrdexWYbLQpD1t1+MniyFETUAjTgEOtln6Ky
         +D6mQYyVNpd5ALnvNzuVecCi6kXvgw8QsWIsIX9kF31DM53bLYk/OzPywnN3KvyBTYYa
         yEYA==
X-Forwarded-Encrypted: i=1; AFNElJ/VQJ5eyUEEdKFo+/Guh8EiV1rgUL8A95/+gEjtnvJOxfZkFZfuvl0ahjgGAfStJtMFY5xnnQ2TlPG3+QCT@lists.linux.dev
X-Gm-Message-State: AOJu0YxQ4T/oI908c9Hu97cGwvn5qcZD+bXN1id+RDiIy7ct8uWeaW0n
	dj8FlX9bdUbYftux1fzr+9byOUFrLeVvU4jHYFYTnaHOfTN6daK00COx
X-Gm-Gg: Acq92OGfmifUU4n3r1GumN9EmR6mndNVdhI7bryFTQ1KgfLc19oVb9kcqnbUEam99zh
	T9HjL2WikF6QVAta980VMg0CxY7TY/xZgbKoQzuCWc4vLUgJXM5TiAaGVuPUXct3NA29zt0ig5J
	9E2dWbAO+Xk/jm0YvOJVn2YmTRrlQsy98TlOfvIGtp7aqLOQZIZToyiDLPYGE2dOYWNpf0uYNsg
	g7seSAx8sEhEA2kPUGUzWyg+l2HE0t0t5WVKAnsSYwOK3aMeM43urV4k77pymrEqRfQtYWKGaHv
	crDRA5QI+OK6P5BZudFjrLa3+ZtisFnoSjyZoBj0W7vjeBSLUqHQAq+EDqlpiQMyPwtp/v/McA2
	0I2FYH99U9zd6ufPpLSSGYUFRU1LC6cmukGGV+faxqXgl789nZqIQJGa18Yi8z/8yBBRonENpeB
	4+0rcmI3bthhxMzeDlz4YDak9ie9mECP90m02G4nN1ng2ML3YvkLfmgqA=
X-Received: by 2002:a05:7022:672a:b0:128:bae0:e043 with SMTP id a92af1059eb24-1318eb4a66bmr7629992c88.31.1778317420273;
        Sat, 09 May 2026 02:03:40 -0700 (PDT)
Received: from localhost.localdomain ([76.32.119.210])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13278758e0csm6116676c88.12.2026.05.09.02.03.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 May 2026 02:03:39 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: linux-iio@vger.kernel.org,
	Jonathan Cameron <jic23@kernel.org>
Cc: Lars-Peter Clausen <lars@metafoo.de>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH v2] staging: iio: addac: adt7316: check SPI write errors in probe
Date: Sat,  9 May 2026 09:03:20 +0000
Message-Id: <20260509090320.85481-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The probe function issues three SPI writes to switch the device
from the default I2C protocol to SPI protocol, but ignores their
return values.

Switch the repeated SPI writes to a loop and return an error
if any of them fail, as failing to switch the protocol should
abort the probe.

Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
Changes in v2:
- Return error instead of just warning
- Clarify that repeated SPI writes are converted to a loop
---
 drivers/staging/iio/addac/adt7316-spi.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/iio/addac/adt7316-spi.c b/drivers/staging/iio/addac/adt7316-spi.c
index f91325d11394..056a4505bf30 100644
--- a/drivers/staging/iio/addac/adt7316-spi.c
+++ b/drivers/staging/iio/addac/adt7316-spi.c
@@ -98,6 +98,7 @@ static int adt7316_spi_probe(struct spi_device *spi_dev)
 		.multi_read = adt7316_spi_multi_read,
 		.multi_write = adt7316_spi_multi_write,
 	};
+	int i, ret;
 
 	/* don't exceed max specified SPI CLK frequency */
 	if (spi_dev->max_speed_hz > ADT7316_SPI_MAX_FREQ_HZ) {
@@ -107,9 +108,11 @@ static int adt7316_spi_probe(struct spi_device *spi_dev)
 	}
 
 	/* switch from default I2C protocol to SPI protocol */
-	adt7316_spi_write(spi_dev, 0, 0);
-	adt7316_spi_write(spi_dev, 0, 0);
-	adt7316_spi_write(spi_dev, 0, 0);
+	for (i = 0; i < 3; i++) {
+		ret = adt7316_spi_write(spi_dev, 0, 0);
+		if (ret)
+			return ret;
+	}
 
 	return adt7316_probe(&spi_dev->dev, &bus, spi_dev->modalias);
 }
-- 
2.34.1

