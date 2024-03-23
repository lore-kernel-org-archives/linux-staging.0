Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B22A617583
	for <linux-staging@lists.linux.dev>; Sat, 23 Mar 2024 10:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711190514; cv=none; b=r5YTJR/RwMViIPboQ+YG2PJeprdshTFaIxnw/jQzX1y6rHhWcoWSJ4F/3e3DIgdcuJLSA8wGz3so5Ua2wz0TObTumv9xWQN2yY/0ZFA6+DP31ERbQG1ChHOT1sQdgrEYYav2zOc7jCzy1Al3ePtisZeO99w/EAopF41WvrzhPe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711190514; c=relaxed/simple;
	bh=GEI/ooPR1uxzhyNgwywp7m8zeQWCBAmFv9ShGuGC3WM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=T8cN4zKpPiqkvgEz0tTyZjkwh06Dls1UdyI6DhkT1jH7XSNNDpRgxVAeR/gUK0sbrCrscmE1UP4NcFiDkvxi94f0L8+n7GJ3udhYQAuAy9injgGmLjJwDi2WFkz3nqWVYdVkgU9yV4F5dO+L45VELDhK5hioIF7vxyuj6tTyka4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Bv692VgU; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Bv692VgU"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-690be110d0dso19404616d6.3
        for <linux-staging@lists.linux.dev>; Sat, 23 Mar 2024 03:41:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1711190512; x=1711795312; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MqD8wzexo6xit6zjT25NUCdriPsphWfFfa0tlNyYYks=;
        b=Bv692VgUBFq8zwCt2H/sivQ3cv6EXMfUYpsBrWiGvbSWlnrvOZIoILtBI+I2rLeu5h
         1hbbNnaHlEKISpvG10u1B9cDLOFhdla1S9wikEuuubiR46XKV8AQSagsk4lPtW/yQWut
         aunVsmeDh/HHdQRok8UdqJ7uF+ljXX150f/4Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711190512; x=1711795312;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MqD8wzexo6xit6zjT25NUCdriPsphWfFfa0tlNyYYks=;
        b=j55okAlC9ivZgmdqFULST7aAt+GZlsTrbsYUYjfUKmJetgPsi9w8Y52lpFijkwMhKR
         7w7Qaep9VceofS1Til0kx/njDm3AKculXcqfFo5fPV4MEJx6Q0wR6PkdN7qwXavKtawm
         Gqtqs1AJsuLPCUanfD003L+XApMbp1jWCGkr4uWUAwFymBMAXZrgRKgagA0JR9kgwx9k
         rzCi/ydnkcz9zXELhBlkFYGilx3hMsq7PXKKvDjpL0N79I0Y7mOzRWYTYxJgCHYBL37u
         6LzA6L+j2nVYpeflV5v0j9gmx+lqyK4lLzAijc89Yruvb19wsPuJmXN9arbPXVGUuqRD
         E0uA==
X-Forwarded-Encrypted: i=1; AJvYcCXQUm+zWe+DihXwd5IQGWNz0qbW4Q/LIaHHNwgN3wR5/Ll3bODCy83aDptqFItdG8TJRfvq/cGMee3wBbcJbXMKcc1Ff+zQpXoYjLfmVw==
X-Gm-Message-State: AOJu0YzQIuID4zcbZvtAPdIUvTxFIt0puENFHE4ArFpXiCSulCJBEqQY
	CVbB5yqA4Jp90tg9ISWF2Mo+qa1PgfqqMb57V0aulN8vU4jFBI27Z7MLdhiAog==
X-Google-Smtp-Source: AGHT+IFqiP6PxKrx0iNYkypU5fRxQ2Tg1JQsARpN7FhxoFv5VhxvCeHLgOCqbXVBG5RX/NkfTi463g==
X-Received: by 2002:a05:6214:2249:b0:690:c093:d833 with SMTP id c9-20020a056214224900b00690c093d833mr2314782qvc.0.1711190511851;
        Sat, 23 Mar 2024 03:41:51 -0700 (PDT)
Received: from denia.c.googlers.com (188.173.86.34.bc.googleusercontent.com. [34.86.173.188])
        by smtp.gmail.com with ESMTPSA id 6-20020a0562140d4600b0068f75622543sm1998523qvr.1.2024.03.23.03.41.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Mar 2024 03:41:51 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Sat, 23 Mar 2024 10:41:47 +0000
Subject: [PATCH 3/3] media: dvbdev: Initialize sbuf
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240323-gcc-arm-warnings-v1-3-0b45cc52f39e@chromium.org>
References: <20240323-gcc-arm-warnings-v1-0-0b45cc52f39e@chromium.org>
In-Reply-To: <20240323-gcc-arm-warnings-v1-0-0b45cc52f39e@chromium.org>
To: Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Sowjanya Komatineni <skomatineni@nvidia.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.12.4

Because the size passed to copy_from_user() cannot be known beforehand,
it needs to be checked during runtime with check_object_size. That makes
gcc believe that the content of sbuf can be used before init.

Fix:
./include/linux/thread_info.h:215:17: warning: ‘sbuf’ may be used uninitialized [-Wmaybe-uninitialized]

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/dvb-core/dvbdev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/dvb-core/dvbdev.c b/drivers/media/dvb-core/dvbdev.c
index 733d0bc4b4cc3..b43695bc51e75 100644
--- a/drivers/media/dvb-core/dvbdev.c
+++ b/drivers/media/dvb-core/dvbdev.c
@@ -956,7 +956,7 @@ int dvb_usercopy(struct file *file,
 		 int (*func)(struct file *file,
 			     unsigned int cmd, void *arg))
 {
-	char    sbuf[128];
+	char    sbuf[128] = {};
 	void    *mbuf = NULL;
 	void    *parg = NULL;
 	int     err  = -EINVAL;

-- 
2.44.0.396.g6e790dbe36-goog

