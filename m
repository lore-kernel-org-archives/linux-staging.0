Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C33EB3D47A0
	for <linux-staging@lists.linux.dev>; Mon, 13 Apr 2026 14:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776089120; cv=none; b=WEH5nKY9co2L618Ji5CwDaXunTkQCeVskY+VF+f2q/FENjZllFpAsDJIl6lYg5XBkogWtwC1hqWK3+V+n2lBpHTzrVWY9tH6/yPnDxXZS6PdrfSBXnOjxN1KxXGvwn2JQAq56PZNauH5NNrlkTOZ4gcFzygDI+lCDMt39h5Lx0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776089120; c=relaxed/simple;
	bh=g+dzCnOhfDnhMO8wLb+BZK51V1vamtGYzimE/itDyf0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=e2LQMM8I9UM7Tu8sBm5Y03XPhdbPdx6e5Sy1pB0+Fs5yFMa/cweVkcGMO0GhUnseKnxFTxFrb54ImkkI2tj32Fpg2pH1+TDFwdnuBpb0mb43avRfIdJ04YnYfSVr59x3imRtx92YkFXOqmfdc6vt2eZ4odIcXat2cfwEqH0qJf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=crimson.net.eu.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=crimson.net.eu.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-48897fd88ebso48317135e9.2
        for <linux-staging@lists.linux.dev>; Mon, 13 Apr 2026 07:05:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776089114; x=1776693914;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5JnKPGdKl61jJVXdpeo9/vk2srOSD6cjBkyyFZPy7YM=;
        b=UsrBam1lmu3mTcv7F4zKoE6mkdyx0mwY3JCdaQyz1gZXqs3L4fstRiiMJyNgibubC1
         V91CDKPUlzYtcBHchgRva6PbGzmR5KSR4/UmFfvJ8HCucb5mzEzFRZylhae+6X/ffScu
         RpvmqX1p+J1A3oS/g2fvXaWDxA8fc118N7iIZDCZLgCi/Hzq2GX/PxFzjw46hSvAxU0m
         C17MFtFwSaFOwCZzmsYU2RnWMf8xUQMhq09RFnMWRU/WMBr8ICyU5D6sSMnyjE44utID
         9pzLOXNCl2e3kC9NQXjtKk413X2iq5Gw/xFhT9orgYaVXxuQYDYe+kzsmuFQo3pO1Otf
         Y2hg==
X-Forwarded-Encrypted: i=1; AFNElJ/4kMM7dpZhwXOigxa46vrh8HDfAxJh/DvnUvIA4ysSJplEWjl1hj6yHpjY5J7PX6y8mD8VSzB3ldsQsL4M@lists.linux.dev
X-Gm-Message-State: AOJu0Yw3YrOlUCuBVlxGyS/mzcCBP/fNyJwV8aOdXe/1mjOPTuzXTW4Y
	lqrg9RvaUWJMT53CgkjyMW8JekPkQclU/XSDa1MjY8lwlG+JxizLtaND
X-Gm-Gg: AeBDies7zwXLukzHN6pKlGpalZXYaDtTTBTwpRcgaGhzQsusIrW/ZcvHnyUUehSZLfE
	OIXbC9YmdFiHij4Ny8rZOncDzgpIWtqjBc84IeYIesl78dCmG+Rropf/aMtpLsfJIPgJatSLNFC
	3PGsJJc2YAbSJLH5vsIxq6804hJCvqI6nUntPB+zLHwZHRSujuMtRz4nY7dMndhnuZohxdJ1/hI
	8n9Z+0NAUutuSA1QgQheXtweSYShe5im5Ow6tEd8wHBqm8aX41giZ4tppytzfUUedGn1WJyDskT
	OIoRpiZYVp5am7hoLpIGnJTy9IUK57hjZJwsNE8WzxOjDmwCi/AJUVSODIr1NrBnfu7cbSmuZzi
	CGEcPnY70eltVp4pDyX80fb4lDvUwI5t+XaAShr159moOwO2brtpdmJgpqc2kp5kA5GdsYy/vp4
	EiBW8oUu6LHqkEZOnZIZSqAgDs/1W7tB7qXgp/qMBX3JkxrRelK7MbafbIQUHZ6g27cEQVWAcG2
	5i46O2Z
X-Received: by 2002:a05:600c:c173:b0:485:39d1:b4dd with SMTP id 5b1f17b1804b1-488d684b024mr178926565e9.10.1776089113512;
        Mon, 13 Apr 2026 07:05:13 -0700 (PDT)
Received: from localhost.localdomain ([2a09:bac1:3920:50::27:ae])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d531f2b6sm323665615e9.2.2026.04.13.07.05.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 07:05:12 -0700 (PDT)
From: deep@crimson.net.eu.org
To: gregkh@linuxfoundation.org,
	ovidiu.panait.oss@gmail.com
Cc: gshahrouzi@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Kenet Jovan Sokoli <deep@crimson.net.eu.org>
Subject: [PATCH] staging: axis-fifo: fix alignment in wait_event_interruptible()
Date: Mon, 13 Apr 2026 16:05:08 +0200
Message-ID: <20260413140508.1190800-1-deep@crimson.net.eu.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kenet Jovan Sokoli <deep@crimson.net.eu.org>

Signed-off-by: Kenet Jovan Sokoli <deep@crimson.net.eu.org>
---
 drivers/staging/axis-fifo/axis-fifo.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/axis-fifo/axis-fifo.c b/drivers/staging/axis-fifo/axis-fifo.c
index aa90b27197cf..9b5b640e53b3 100644
--- a/drivers/staging/axis-fifo/axis-fifo.c
+++ b/drivers/staging/axis-fifo/axis-fifo.c
@@ -246,7 +246,8 @@ static ssize_t axis_fifo_write(struct file *f, const char __user *buf,
 		mutex_lock(&fifo->write_lock);
 
 		ret = wait_event_interruptible(fifo->write_queue,
-			ioread32(fifo->base_addr + XLLF_TDFV_OFFSET) >= words_to_write);
+					       ioread32(fifo->base_addr + XLLF_TDFV_OFFSET) >=
+			words_to_write);
 		if (ret)
 			goto end_unlock;
 	}
-- 
2.43.0

