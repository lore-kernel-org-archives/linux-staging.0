Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C131850C2A3
	for <linux-staging@lists.linux.dev>; Fri,  4 Sep 2026 16:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788540713; cv=none; b=Xvw0ujF3rFDWSjm3yDvPROwQa7cwuo62LWvAeFHcIG4RgngOuja1IoFpYHO3Ig5vbEpTPVLp0vziqo943OXX3Yz8XDiQAtwXegS4NrmtCm0xseuoDGihP76uPsGqumahZNx3K6KcJXEn0YRyFVcqf8vmf/u9t3j/l+jSzfjDuEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788540713; c=relaxed/simple;
	bh=wr06q1j6egQgLlwJ2GcTDS7dH7wTNEsRtN9Wo3hJNDw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KbJJt6hk8xw/AlCHYwc+nyGFVYr1P9qF1ntQeFm2H+L55kWB0vHZiGK1g7jHdOOcU8Rz7zhgy00mtf1eDp2osgjHEoLL1rIMLNyTEeK2uMnoORjXKTOde3k1GAjSCPieELiUvEqwhZ5uMweYcKd1rZySIu3W/4q32joXVc8Okmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gHgUz21K; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gHgUz21K"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cc2276e6daeso1054053a12.0
        for <linux-staging@lists.linux.dev>; Fri, 04 Sep 2026 09:51:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788540711; x=1789145511; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rGHMxZ3rFuySAWzmDjUwEnKK4209RW925xasnyoZmGw=;
        b=gHgUz21KCUmnYH0e9dcgjLf9RQBUTLOtRy4ELo0uHDVfEz6tOs9axybZthDxoB3rGW
         Fb3ow2J83ARG8FIqXDP9rATN8qCyhG85dMXtNLDVJ1kcaMMy6tX+azfqN9o7ORkEYt4b
         YC8d+nBI9nJZFvhye6QktHjqy/AQ/R9p8lX/pLMThsTy+J0JwnrVfCrLBH+BriGOrr7n
         OC4S6hSCXJjWkKIRFJdPniFPevL1DQHfj/S2hhqzEOsdVyzDgvoJugcWoItyH/5X05FA
         LWJISy/b6FWJuVCjI6lDMtpdCqwHDSrjp7K3HVFDOJrOJ3HkKR9Iuo7Ig8xGxsjlvSNY
         lqng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788540711; x=1789145511;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rGHMxZ3rFuySAWzmDjUwEnKK4209RW925xasnyoZmGw=;
        b=aZwVwPNKYgrmlA7K0EJSKmfzliAo/w4oeDjCaTrSrwftVBsNTiALe8No6Cc49qeaLq
         53V8mFyOdIUFZu+k2bxZxTouRcBP/x15Zb+3EJ0/e6G+Mv30+JoPsA4Ex14DbXL87vJj
         tW1EG+LChot+j63qzkI29xZeVd/TCsdH5kDm1M1H8b4ozmtWftQ9K25+QUC7vZhiX/EK
         3oy3cyGDwsKa5GcxiaIaH85sryfB9aSg98lsqimoD/b9tLNEjdT1a7OcLFeNMB6Ou3w3
         2l7R+LL5xozvBxTEAh1WaB5vZnmYI/kJmXosVWet6Q/0xgaH1I/TnOIrXb7uXhAALzc2
         /Wzg==
X-Forwarded-Encrypted: i=1; AKwUvBztpqDO6ch+T1cVK+1Mth0/vYoAFXLfC35CohYOk5ghnulwMtowni/owEueK1pg++ZEGv0hchr3jMUjX5Qi@lists.linux.dev
X-Gm-Message-State: AFuF++mkrQrMZ7UELhrrQ/VX3j1VNp7t6L3DWW3HpWrgs5lr7UoXoekz
	aIOfCPgbVXmkDdzISR2inqdoRsxuDvXYUBCiA/Q2jix9m+dwSUNrOqng
X-Gm-Gg: AYBFou2l83x8VX5Pcp+jWDnIzUb1PzAlqz4qoEW683RX8/vdbp25VjwM3CpCmzz7e7r
	YQNzxIH/J0nQ53Bl3m44ebv/KahyroHowFuBVD8StDb1EjbcmOrAlZOmWy7B60qseLv6dDyuPAb
	7Z/jtMIcp/K+Av1x2aLLIR3TC7OpaWU6tE9nO/ZBvnGc6If1Zb5ZEH5KPC9g590levnJ59NMnVd
	+UmlWNIavrDnEG9r/y/bcl6gtkK2D+k9g7yEKQ3ECWNN5AAqK/LZL+Ubk5mMpyq0BxF4h+20YAz
	G72ni17liBkCyQDIAmbyxpNx/I03nqAKAARmWF5MzXBOU+t/pIzv08gwBf3OI8wIT1GKjoSSG5C
	/XkDyka3ntQK0U8pFmLBgEn1wFtT+1xmwqyuQSioBxanSQ+sxBblh2Tvz5H+yCCVwNDB1Cw3GEm
	5WVcdYv9kRIpyXC8lAgx4Erd3oPoLqj8wusKOhquIng0JjVMzGTGsiVb6dA6nsS5IcyHy9yDFn+
	GO7JReFR+ckQBNpHIt8NiHpWPU6lDtvIslRi300MKX9idXZVhF6F/Yk/6rOlMcqdNjENc01k7Tc
	fOMXkWaLtsI=
X-Received: by 2002:a17:90b:4b0c:b0:37f:fdc8:71b4 with SMTP id 98e67ed59e1d1-39b26121f6cmr11436269a91.2.1788540710785;
        Fri, 04 Sep 2026 09:51:50 -0700 (PDT)
Received: from workstation ([2401:4900:8902:9774:f2e9:38cc:6b1d:1764])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b6036fcsm8463943eec.20.2026.09.04.09.51.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 09:51:50 -0700 (PDT)
From: Amiitesh TSP <tspamiitesh@gmail.com>
To: jic23@kernel.org,
	gregkh@linuxfoundation.org
Cc: dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	tspamiitesh@gmail.com,
	linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] docs: fix typos in drivers/staging/iio
Date: Fri,  4 Sep 2026 22:21:15 +0530
Message-ID: <20260904165115.228990-1-tspamiitesh@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix typo error in iio staging documentation from none zero to non-zero

Signed-off-by: Amiitesh TSP <tspamiitesh@gmail.com>
---
 drivers/staging/iio/Documentation/sysfs-bus-iio-adc-ad7280a | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/iio/Documentation/sysfs-bus-iio-adc-ad7280a b/drivers/staging/iio/Documentation/sysfs-bus-iio-adc-ad7280a
index 863d3856718a..d19db00acd1d 100644
--- a/drivers/staging/iio/Documentation/sysfs-bus-iio-adc-ad7280a
+++ b/drivers/staging/iio/Documentation/sysfs-bus-iio-adc-ad7280a
@@ -4,7 +4,7 @@ Contact:	linux-iio@vger.kernel.org
 Description:
 		Writing 1 enables the cell balance output switch corresponding
 		to input Y. Writing 0 disables it. If the inY-inZ_balance_timer
-		is set to a none zero value, the corresponding switch will
+		is set to a non-zero value, the corresponding switch will
 		enable for the programmed amount of time, before it
 		automatically disables.
 
-- 
2.55.0

