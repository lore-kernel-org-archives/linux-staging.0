Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EA962750E6
	for <linux-staging@lists.linux.dev>; Sun, 26 Apr 2026 20:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777236643; cv=none; b=SzowRpaRbCsmNzbuPSGMaCAP/Awi/6qVnvmwG3UeU9PfsPMNQsaxza10v/E9WWBfQYtkVQ074pbal7loIeHdIRlcGq62Zd8AJPafzdV5lRNj3Y+V6LFL6YdUyeARB1ShWj1EKrjkQW9Wgc5Fkl2w0CJl4pJr6D83HRBHXcog8A0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777236643; c=relaxed/simple;
	bh=S8COp5cvrjo0lKiTIgw3J0o4L4SnaSUb3SMdXelG/z0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=okdvnLDeijUMNHcwWFO5SoC/Z10rN+3VPHIl9XDeypgGqb3213D382NhZqE/lyo+DANF/tQ+D8J7hCeAKrO4/HcLtAh2gqFyiVwa7fa4Y29NJTlIRkHTdoUYsKec51TmWsA5JyqtiEkbZX+f8L3BTpsUpavXhpnoVL10VAETsnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SAI9mkdt; arc=none smtp.client-ip=209.85.210.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SAI9mkdt"
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-7de46b8e432so3740190a34.1
        for <linux-staging@lists.linux.dev>; Sun, 26 Apr 2026 13:50:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777236641; x=1777841441; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DUk8j10LOn+5jK3eG5TZh8pc0y7Efus/q8JN9vQKIsw=;
        b=SAI9mkdtgLBnG7Toy9dYLKVdLuSgq2OtSsKMZrF6rYTy3X/e3EoX/a268Z9Jw8f2EP
         EwdU0w/+Y7SZgEwDZ+eMTdYr9fYM2opPVGUY9HZ2a681QMXSIeWXKz+n4tPeT3cJLxXo
         kC5NF2UdUN21OWiA0vCVsiOdOZFbb1nwqMkJGTuHWUidkodFqfd2kyWwz3bg5FeFo0KJ
         A5qAoCKX8J763EA+qZcuDPlonJiSAOfcbmc1ZvjU/nm5vwCM1MOV4u//bEieo38flfQv
         U138zL0XXxYSBeRM7tgOpyr4qJH8BtPLTdL4PAsi/xUxqUzTcNMkNM6EYkUoF2IH1ep9
         RC8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777236641; x=1777841441;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DUk8j10LOn+5jK3eG5TZh8pc0y7Efus/q8JN9vQKIsw=;
        b=b7+BUYp2zf0PiycN7iYRfS1XrrYNDN/AYXoGsZEVgtAbVwxl+ux3EiNpK9qfnKSzlB
         1ISMEAPjgPWAYjPSPPMleLVZEVoXof0VnK8SPab6mfIM1DsstE/z5XxflbCJyG5qisw6
         R+cH+P7NfeYk+jmq+vDGTuGqQhW+q16WRpu8zS7NwuGOg52VowCr+KtDHj5znr6QIb+1
         v6Ov+MhMbxxbafsMJ3qrmFkceIj3Vz9Pb9pEb04UUR53zkIPYKW9OKM7AQI6ol1Gnb2b
         iGgb8EX1Ol3ItBINDc/uAYNd+aZhG1J5AEx/JASUrg3gDxXf0ci6HJ46znjzyj/vrPDI
         uSfg==
X-Forwarded-Encrypted: i=1; AFNElJ+4kzy1Bz/G7zLoTuuEkImZjs6lH7yAlhUhI+zrB5PjjZnHPp+AumD3TEfV+15gmjzAm02d7lV/N29T1bq4@lists.linux.dev
X-Gm-Message-State: AOJu0Yz9saGdTZG135GEJrSDYQTkM0PySJjbHzUTnrjiHuWZ8IVgHuj4
	imVKHQJyC4l7Zkm9cBsmVpQbs/Yj8mVXmaPvNKnHj9cbjZqpyF9IYBzU
X-Gm-Gg: AeBDievA4kH5RCUcOAB0D1C/QKcGj9e2AVmgj5o0Id6esjqcc6btQHNNgyR1X3h5Cnc
	ZiiLR4NzYEmLEG6r0T1V5zqphBYRlMvT9XkM0PQU24c9kpJoYSmz6Ug+TNhTP2nqJA7l5vaYdHj
	Mh+VfwsXdglxQ8joLBYFizgjgBxd7Jenuan8DVudMs86bQhRK5kjb7vDG1ma1MVQ/O5M99LvWdg
	GaaIvKaQdu6MA30+2W17zaLnS9yyNjDpiP31LFLQxPfZOTcsAYpMuxnvkVoBBGOPgc9DbWEArfO
	p5uBlXUW05sUKAiH5cOv8JouaypslOcEXMKD4F04b7asaFWm13aHI7bCyD1k56V6wCXsqPMXZj4
	f4bN1sjY/fNiC9gps5KeApCVye5fFJTI+zUm3077supqOV8GKPHmCdLIXp209/6tUeEl4riwEy2
	9DXCZdI31fWV57JXKo//OEmnJwEmHbqSKLp9cdDuiEhN4Nr9EY0GKCZEepu0jJNFn+T3qt4PxT3
	pHiETg=
X-Received: by 2002:a05:6830:8288:b0:7d7:f90c:5833 with SMTP id 46e09a7af769-7dc952831c8mr24682765a34.27.1777236641172;
        Sun, 26 Apr 2026 13:50:41 -0700 (PDT)
Received: from linuxescape.lan (23-88-128-2.fttp.usinternet.com. [23.88.128.2])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7dcc747f1aasm18754101a34.18.2026.04.26.13.50.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 13:50:40 -0700 (PDT)
From: Maxwell Doose <m32285159@gmail.com>
To: lars@metafoo.de,
	Michael.Hennerich@analog.com,
	jic23@kernel.org,
	gregkh@linuxfoundation.org
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: iio: adt7316: Add error handling to adt7316_spi_probe()
Date: Sun, 26 Apr 2026 15:50:38 -0500
Message-ID: <20260426205039.125818-1-m32285159@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, the return values of the adt7316_spi_write() calls in
adt7316_spi_probe() are unchecked. Add error handling to return early
and pass on the error code if we receive an error from
adt7316_spi_write().

While at it, move all three adt7316_spi_write() calls inside a for loop
to condense the logic.

Signed-off-by: Maxwell Doose <m32285159@gmail.com>
---
 drivers/staging/iio/addac/adt7316-spi.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/iio/addac/adt7316-spi.c b/drivers/staging/iio/addac/adt7316-spi.c
index f91325d11394..ffd1dae8d1b1 100644
--- a/drivers/staging/iio/addac/adt7316-spi.c
+++ b/drivers/staging/iio/addac/adt7316-spi.c
@@ -98,6 +98,7 @@ static int adt7316_spi_probe(struct spi_device *spi_dev)
 		.multi_read = adt7316_spi_multi_read,
 		.multi_write = adt7316_spi_multi_write,
 	};
+	int i, ret;
 
 	/* don't exceed max specified SPI CLK frequency */
 	if (spi_dev->max_speed_hz > ADT7316_SPI_MAX_FREQ_HZ) {
@@ -107,9 +108,12 @@ static int adt7316_spi_probe(struct spi_device *spi_dev)
 	}
 
 	/* switch from default I2C protocol to SPI protocol */
-	adt7316_spi_write(spi_dev, 0, 0);
-	adt7316_spi_write(spi_dev, 0, 0);
-	adt7316_spi_write(spi_dev, 0, 0);
+	for (i = 0; i < 3; i++) {
+		ret = adt7316_spi_write(spi_dev, 0, 0);
+		/* Check for errors, if we get an error, return early */
+		if (ret < 0)
+			return ret;
+	}
 
 	return adt7316_probe(&spi_dev->dev, &bus, spi_dev->modalias);
 }
-- 
2.53.0

