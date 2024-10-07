Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA1E01D86CE
	for <linux-staging@lists.linux.dev>; Mon,  7 Oct 2024 15:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728314549; cv=none; b=fsnwNJjaWHDFoSd3pdjK6XWcvJJULJHcVErZc7oMa1ZXrECEcoxNTSWtK1sujQKJ4YJMMn40sdaEB7xqvCR0Ovfvu9qbuiMqT/Q88sl9aUm8Qvuloqsv5wHsHjUN+xp7EYqRwm38bG+z2K0rE7RzHC+AbX/d39KqCbhku96XhYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728314549; c=relaxed/simple;
	bh=DQQVfGrS5RUHTZ+tOB8qSUpU88TcHxUfCXR+O1O7nys=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Q1g62oHBMoQREgHGMUU+OYprWRR2ypgkEWLQp7Q/jbRmwE+I5mM57hGI6xZH74i8BkH6abiRxrpWsQLskTFIqqq09Po4kiHvaurd5rXjmgiNNvx3uPW4mumnAdhWM61ve+++HMtz+LCasWST+nWd8UhhCREEn+j+mbcd3ulvRWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hbyzOC/b; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hbyzOC/b"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-71df8585a42so1371868b3a.3
        for <linux-staging@lists.linux.dev>; Mon, 07 Oct 2024 08:22:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728314547; x=1728919347; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2en3p3K0idvwobjjiOo582pKirErAeqEZWAXl8QOuws=;
        b=hbyzOC/bXbfHeJX65YpX2tisfGaD/xcuFrKJ+yJi2aG6wK4FUPBwqdjfg4vWYlsVOI
         ed+UBlkuly/Rcq/9WMi5q8gCcvPRMNsamZTSDl1cdpNx/494F7Su25kyFfxXUwWIDbdN
         xOztakpfOI50k33NYrFOoNPH5KrOiUX5S0cUW/Aj8hc4paF8GaI4l9FR2nfH9i8YfnM1
         Ijzd4Jf9Cgp66S19O+6ZAH4zi1ErnceRFU6rkwxO2Z3wCI855SihjzzCAAKlLpTnVbFu
         dI7KMZMX9C7L/MtCcwUfarV3/SZwoYfO9SbueeCTL0QFMyhNp0IoAv/89k4PCXTyBSUs
         XlIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728314547; x=1728919347;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2en3p3K0idvwobjjiOo582pKirErAeqEZWAXl8QOuws=;
        b=Y26kUCN3DWmKthfSKCFFTs/kg3niPCief7CC2HgwrQwAAJCrufkxueXSV0s+9RDHIj
         AEpmJakEPAOwUMnqdRytb5PzI4jlo1rHNzwg5p+W7sCYX4YTrfWKt1EkYoL+ZmBHBaIz
         FH8Bltc9ephnOR7JrOCWxlAGuQgR63tfyiUudDhg/Ai3r9xUt/PK1BzS5VWr7+Obj2hH
         dKxWuCdsBxsYb4Wnxj0/ldb/1TS5XnFc+0qo4EUr80TYLDlfvWQxfbWQMwYD9FnlKI7z
         jJESdCPkF7zRAbLEpLpsLcxTne+qIpMXIEWJ2/GwaIgx2raHG4nIU8QLeSznxGzRgUa2
         GR0Q==
X-Forwarded-Encrypted: i=1; AJvYcCVJz1W7jHYBjKcgQTawAhMlRNJt6Ugyjs3VF4Qw4gzFJPzUyjLEjfjE+7FFVGmwEtXuxEsyLDX5eBYH8a9i@lists.linux.dev
X-Gm-Message-State: AOJu0Yy8uLPoQtvDgghdPLJcYQuSw+7SRraIYqrdOeEaPrgPavd6uIZs
	JbdLp3RTmtBKAzVaMF8VJ15Xe3ZH27hwVVTGpCf0C5s4YCexkIVc
X-Google-Smtp-Source: AGHT+IEOIuARC4t3bbCfRUL6FjWcjVTlAwmRSxsVCma2x9vxwVwrkHaImWNCBrRMWA6Q2aCcSvQd0A==
X-Received: by 2002:a05:6a21:3305:b0:1d5:10d6:92b9 with SMTP id adf61e73a8af0-1d6dfa55caemr17683670637.30.1728314546949;
        Mon, 07 Oct 2024 08:22:26 -0700 (PDT)
Received: from Hridesh-ArchLinux.am.students.amrita.edu ([123.63.2.2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71df0d7d407sm4493234b3a.210.2024.10.07.08.22.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 08:22:26 -0700 (PDT)
From: Hridesh MG <hridesh699@gmail.com>
To: linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Hridesh MG <hridesh699@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Stefan Wahren <wahrenst@gmx.net>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH] staging: vchiq_core: Fix code indent errors
Date: Mon,  7 Oct 2024 20:52:12 +0530
Message-ID: <20241007152214.23240-1-hridesh699@gmail.com>
X-Mailer: git-send-email 2.46.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace spaces with tabs to adhere to kernel coding style.

Reported by checkpatch:

ERROR: code indent should use tabs where possible

Signed-off-by: Hridesh MG <hridesh699@gmail.com>
---
 .../vc04_services/interface/vchiq_arm/vchiq_core.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
index 1f94db6e0cd9..3f3ef1ca7154 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
@@ -2761,13 +2761,13 @@ vchiq_bulk_xfer_queue_msg_interruptible(struct vchiq_service *service,
 		state->id, service->localport, dir_char, queue->local_insert,
 		queue->remote_insert, queue->process);
 
-        if (bulk_waiter) {
-                bulk_waiter->bulk = bulk;
-                if (wait_for_completion_interruptible(&bulk_waiter->event))
-                        status = -EAGAIN;
-                else if (bulk_waiter->actual == VCHIQ_BULK_ACTUAL_ABORTED)
-                        status = -EINVAL;
-        }
+	if (bulk_waiter) {
+		bulk_waiter->bulk = bulk;
+		if (wait_for_completion_interruptible(&bulk_waiter->event))
+			status = -EAGAIN;
+		else if (bulk_waiter->actual == VCHIQ_BULK_ACTUAL_ABORTED)
+			status = -EINVAL;
+	}
 
 	return status;
 
-- 
2.46.1

