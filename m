Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED3B528FFE7
	for <linux-staging@lists.linux.dev>; Sun, 15 Mar 2026 23:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773616805; cv=none; b=Id3jCYcCm/8+Eh37zukbENoPRB+AEio9gHY1AHFJug810K9mLevAptg1VwJkRTd3RhmFkMwRnwufw6+eD8PTy7r0TiC9iu3f2A/e0X8OORxymMsmlmfdjiPbpwafo0qqrpNt+Phc0WPM8Q0+fepVt+l+Cy6Vjxe4Zol0WH7R78k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773616805; c=relaxed/simple;
	bh=Sprnt5ZDjRPUa1ww1QcN1glz1ZQiWBmFB3RPxEPrdgs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ef0DMbGB+u3/AhOFL2hj7IVOLjLaKsXR0NFyfR1m70/ryyNTrP2KrfhEIx2loAUGOSLpFWElVoUlWpN3sua295UH8MBpmEQSLc931+w5DshJG7BCb9GYWVxHP3Uui3+N9T72vFY8Gw6cQ4qY+D4sH+q5+4YDnYSCwwpF8JZKWyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IvWo6udQ; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IvWo6udQ"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4852fdb36a8so47563575e9.2
        for <linux-staging@lists.linux.dev>; Sun, 15 Mar 2026 16:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773616802; x=1774221602; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Df2cbTHSLjGNi97ps33ixIYcO5hgiRbvTnx5Ikk0MHE=;
        b=IvWo6udQXBPJb4Ech6fZQz1fzzorjGZyLHVvwhLseL6SRzDnYsEWHhcorxLtCS2sFm
         0teDJKPVxjCo1ntCYxZD4uLzQExbGnyauRTZCybZT/B/3mtArPhqnAiHODVRDI728vlS
         zhxVpx8XgVDgDwhvdXa6LyW1ly8B1zoNPhlBlOdaBgYi8UoAy62KgHijRGEV1HIc4szn
         y4vyGw1mZiCkOkGNuNyUuveC+3TGR2k4TSWuuTjsxzTBYq4qpOnisQ51FFgTnI9YPmuo
         n7EVKcP13NMG8uP3nWb0Pp9D0AmC6WkC6j4rmTn9RQK0TfUPaph43rwALo6rNCFLx+Du
         nmrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773616802; x=1774221602;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Df2cbTHSLjGNi97ps33ixIYcO5hgiRbvTnx5Ikk0MHE=;
        b=j1webF+rTTTz3qjFSl0POSasbLWaRqmLz6cVDceONxac2CcTSelSf8bXX1mgSn+FKk
         Z+gibQIUX4pxSoVpYFCkCk7WvHVmMnlcrokZHv3uW6ZO2+ri97zB7R/UFZmCOAPEPWd3
         faK24eFNVMNc8U02TTDYzhcix5xF/hw3a7qT3PF7YiUVFJb6dWb6EBgVq/O/1ybHM2kl
         tDXEslq+LQb48YND9FsA0xh9qgkD+Xkf2qa6mQg4ZyL5maBTO3aX805rcn1h7EQSFg3k
         GIIcrbQk6W590BgLcIW/pyNkPHMtJXuxjKvrHtTiU+V5kDTru3NXQY4GhHe5taMJ9Pe3
         ExVw==
X-Forwarded-Encrypted: i=1; AJvYcCVnFcuAWq2Ok5d8b434Huqs81OAj79oBEGJ2e8w7AMZ9KmhArAM130Uz/FwWrvvxchMu0AKAs4Egu0gmPmS@lists.linux.dev
X-Gm-Message-State: AOJu0YzhRmSEoCguIOZPIdxl11+oy2Lnmr3VIxpil6/Q0qMlvxToaXC9
	7zIUJfh9U0E6cunYs0+KrYxLHut4+qeW4sfabhsVmjt30LBG2i3gmydJ
X-Gm-Gg: ATEYQzyjisOswLrmFng1msxg3ks14dZH9opU3wEPE9X2OY8/p3B/iZyJnEgzK7g4Bnm
	Kbb8eaHEeDMLQ3j1qpzSYmLhH0t3/S6BcNOGA3T5Y55PrkRv3s8zJXdXiK1xKMDF7qY4jU9H4M1
	PpCFzGK4tCYavZNFXJg332y0reEA8ynXlx3JzgdeYskvPqZD5jCCnqC9qJYDrmVjbvVnduTcfXb
	3B40DMjMrq99ICmBfxDN9GWXIBhPUquWsTX6XCNNMePj8yjhOd+2V9WyGaV3xUrqJlOTdcsdgE/
	ZScS9si5SIFPTVyO9lKyAPx9+YGJI60fAsggYHGx0mu2p9utAM6IwFwhEOJtguNHQlqpwMlzQ4N
	DyUtvXegHTzbzu6tbbDmM+LPMuqgEr8B2WhXgQ2RcRofq8A1JIOZIWs5xdAyxFVA54GiC2mVbvH
	K/7RRKDb4nNlIdinbuUHEpJ/ROcvjlFmWd5VrcYscRktADRmj4OuMViCCE7EmszwE=
X-Received: by 2002:a05:600c:8488:b0:480:1d0b:2d32 with SMTP id 5b1f17b1804b1-485566d6fd7mr153183055e9.12.1773616802090;
        Sun, 15 Mar 2026 16:20:02 -0700 (PDT)
Received: from OaroraEtimis.tail60902c.ts.net ([95.179.249.152])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe22529csm37662624f8f.31.2026.03.15.16.19.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2026 16:20:00 -0700 (PDT)
From: Oarora Etimis <oaroraetimis@gmail.com>
X-Google-Original-From: Oarora Etimis <OaroraEtimis@gmail.com>
To: vireshk@kernel.org,
	johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org
Cc: greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Oarora Etimis <OaroraEtimis@gmail.com>
Subject: [PATCH v2 2/2] staging: greybus: bootrom: fix potential null pointer dereference
Date: Mon, 16 Mar 2026 07:19:49 +0800
Message-ID: <20260315231949.231320-1-OaroraEtimis@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In gb_bootrom_get_firmware(), the 'fw' pointer could be NULL if the
function jumps to the 'unlock' label. The execution flow continues
into the 'queue_work' block where 'fw->size' is accessed, leading to
a null pointer dereference.

Fix this by adding a NULL check for 'fw' before accessing its members.

Signed-off-by: Oarora Etimis <OaroraEtimis@gmail.com>
---
Changes in v2:
- Rebased onto the latest staging-next branch to resolve merge conflicts.
- No logical code changes.

 drivers/staging/greybus/bootrom.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/greybus/bootrom.c b/drivers/staging/greybus/bootrom.c
index 83921d90c322..50c80475d241 100644
--- a/drivers/staging/greybus/bootrom.c
+++ b/drivers/staging/greybus/bootrom.c
@@ -298,7 +298,7 @@ static int gb_bootrom_get_firmware(struct gb_operation *op)
 
 queue_work:
 	/* Refresh timeout */
-	if (!ret && (offset + size == fw->size))
+	if (!ret && fw && (offset + size == fw->size))
 		next_request = NEXT_REQ_READY_TO_BOOT;
 	else
 		next_request = NEXT_REQ_GET_FIRMWARE;
-- 
2.47.3

