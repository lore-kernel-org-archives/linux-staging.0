Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 558017F496
	for <linux-staging@lists.linux.dev>; Thu, 28 Mar 2024 12:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711627980; cv=none; b=Wq1Pf5ubwc/E+rKrEYSapE/L5xekdRG4n5f1T0qjZ7/Auen1s3BtytCXaL5461AMyQDpmZR2cq+osRrVCzE7bV8m/VYt2jYUEjbDxVsn1ETaDYmlCXlmx+GvYYOoW27ahRGzoT/eyhawpxipCA1FewEb0SSmK2MbW6z6SDc/7TE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711627980; c=relaxed/simple;
	bh=jK+AFaPuB4QJkOlQSpapYzjziTfiCfCCfo7UWLC+ajY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=t6Q7QcrepL5q6ZfrrxH5UCwYbdbsRkTrZIDL4yXCP1VdW28cucYQFJIfWrYxtCnQ9XanKKXML717iazeE7oU3f1cFvVVMCvDSsJNXUZuBm+E4UCRh94wvFeRWjRZQWaeE71fXJ1nBkiNV6kOr0djqdUSI+tBkG1M627K6V+trv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hutxyzmX; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hutxyzmX"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2d47a92cfefso9613221fa.1
        for <linux-staging@lists.linux.dev>; Thu, 28 Mar 2024 05:12:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711627975; x=1712232775; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bF9nmGQgrbBBKoEODSqmsdf3m34vi7We9f5KYGrq5eQ=;
        b=hutxyzmXyTpvex+zpnUj3AONwKjs/Z0bEEZ95/IrUIjMtMdMYn1qIQK4YQHCfDdxZk
         ANG/fVDddKT3Do3f6cozDzl9S0lymx5zQpXQqZWk4jixCCMmjD7lbOBxI/pR9gypFvJZ
         BffqiRizmASEE7Iffq3qpJJRCsfDNS2PVc68yqboA7Hzl3Hjlyeg5wmaqtFthBrO8cot
         Hc4Dfy/ka0C/a4p/TcTVQa9Vu2iIbDqjtlc5akZG5E2PBW4Sxsok7jH3fM/zkHrlTs9j
         lo2niCX/ya9u8gqITtmBr4/tOf9tRaBs/1+cJJSoKM8ljNsFOdQi6C2t5Au4qZeVX6pA
         YnvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711627975; x=1712232775;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bF9nmGQgrbBBKoEODSqmsdf3m34vi7We9f5KYGrq5eQ=;
        b=H/nCKDPENrgiLcseqIAqoK7wi14/W6WRch6UtN3AF9hHqf5ejfuXl4sOMJKLYTbPvR
         wvW/6WGUEkZdDykaOs3n/pZvHl4W37n8gmeCa42QGqnzFgU4LV1C3BJvO6G7S5vcVsqV
         ug7R0zQzMmwF2fJUzQPGZ7UevXjeUYWkaFY0JJqw7ilO12BbUhXh2Ul0C1GlCmcIIQC5
         qtDVDunCQpt6uqI/jSHmc4l2EluzztH5yDezo+AHgWFahiSTFuNJpHY03fDmCHApwzvn
         DA8ikmMO9raM2keNQztIGae8bCToXi+3CXtqavJhupUe/4/3F2UGBEKyBwHSGf/sWjHi
         owLA==
X-Gm-Message-State: AOJu0YyRDTDI+096OVsPjHp/2stvwSKWt2MgqyscJre9Eer3OizEo7Of
	jI4pJLsWlnGWz+8prfhfW6Rw/Me3jv4sjgIL/qZIya8yQunEQVfe
X-Google-Smtp-Source: AGHT+IEWK9ENE10zwgU54CiNitUhI3g7jx9ewL2i3/B3VRdYM5jCJ7XFGT5qust3NTz5llpWiivhzQ==
X-Received: by 2002:a2e:8019:0:b0:2d3:f3fe:48ac with SMTP id j25-20020a2e8019000000b002d3f3fe48acmr2108960ljg.27.1711627975554;
        Thu, 28 Mar 2024 05:12:55 -0700 (PDT)
Received: from YOGA.local ([2a06:c701:736b:f200:125e:963c:4e4b:b7c5])
        by smtp.gmail.com with ESMTPSA id bd11-20020a05600c1f0b00b00415460a63ebsm1416456wmb.29.2024.03.28.05.12.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Mar 2024 05:12:55 -0700 (PDT)
From: Shahar Avidar <ikobh7@gmail.com>
To: gregkh@linuxfoundation.org,
	hverkuil-cisco@xs4all.nl,
	andriy.shevchenko@linux.intel.com,
	robh@kernel.org,
	felixkimbu1@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/5] staging: pi433: Replace pi433_receive param void type to struct pi433_device.
Date: Thu, 28 Mar 2024 14:12:42 +0200
Message-Id: <20240328121244.1244719-5-ikobh7@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240328121244.1244719-1-ikobh7@gmail.com>
References: <20240328121244.1244719-1-ikobh7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pi433_receive is only called once.
It immediately assigns the data param to a struct pi433_device.
Rename param name to pi433.

Signed-off-by: Shahar Avidar <ikobh7@gmail.com>
---
 drivers/staging/pi433/pi433_if.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/pi433/pi433_if.c b/drivers/staging/pi433/pi433_if.c
index 7efe6b8501e3..208c0c6d3649 100644
--- a/drivers/staging/pi433/pi433_if.c
+++ b/drivers/staging/pi433/pi433_if.c
@@ -409,9 +409,8 @@ static int pi433_start_rx(struct pi433_device *pi433)
 
 /*-------------------------------------------------------------------------*/
 
-static int pi433_receive(void *data)
+static int pi433_receive(struct pi433_device *pi433)
 {
-	struct pi433_device *pi433 = data;
 	struct spi_device *spi = pi433->spi;
 	int bytes_to_read, bytes_total;
 	int retval;
-- 
2.34.1

