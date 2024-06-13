Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 041CE149DF0
	for <linux-staging@lists.linux.dev>; Thu, 13 Jun 2024 15:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718291866; cv=none; b=RiogMIqt4NVCQdU0pxXGyaxLZHZerynEarwtLKMXH0x8Z263nOtzkkneBkTassj2ABcy07kofa5MXqzxXop2yrbJlMqqd8UtCxNNySDw6qNBkE9RriOHpV/V8lWevi89hYyNxRsEPx3mQyRTxbBYd2o2t/VsEYuw90fUSCZ/s6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718291866; c=relaxed/simple;
	bh=qQRjjZZws/Ma6VIvIPN2Ic4SkHiuVcNFQMuhJXO9qHw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=IlNJkj9dWjDp0eCSJb6wdQk0uCBXaKbAgED9B0YrNMlSfF1JjcTr2x83ZLW185wlqaMXHQav7lCW95TUAytOtPrpi631DFvltuRc9cmSTroUW5Ly9dWd/BqLHhVY0CqcABXJs+HfXE9BJOJltjTnYekzmyEfI2iIEAKcIbB5nHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ysx8OEM8; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ysx8OEM8"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-356c4e926a3so1228078f8f.1
        for <linux-staging@lists.linux.dev>; Thu, 13 Jun 2024 08:17:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718291863; x=1718896663; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tcEzKvcxuUEgSwRZ+SIVZqsXz/1BXJpqKsYkBURq044=;
        b=Ysx8OEM8Nsc+XlipeVV07kGj12GETK/fWAOLScN+oGZgcxCesWErwdG4bWfGoNKkET
         6ETy8odmbiFxMUZZwUq8VO1sU/dImPVY0x+YBS6outK8ngarWvl1xNFokNzcDuGShB7l
         lCFzierMFUQZqArm8YFj3MF3MJw2xm1wrTXgxvnLlXcKqwstUZRn1Tl1RcYM0LvTx/rC
         87hloGfN7TKSPDlN9oCbDBUFWKrFHyavNwSzNW8AVUnWsxdaAKddr6lhjGQ+xZqh9t2y
         HNh/AboPvN41eifQyweGvP+PsRRrzkUS6SZNVHWR8HL55lVWg1ktRH7scJTC6sJpzSQs
         JsKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718291863; x=1718896663;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tcEzKvcxuUEgSwRZ+SIVZqsXz/1BXJpqKsYkBURq044=;
        b=kUrcjZtzdlN1QsLpx8zAuv+HjdAyXDcn3bN+QCn/PMqNOMuyXU4Qh0tYZalNLI3RC1
         ND2u94QKkqutJ69d1YHrMvnz/LVN6a78r95dsLaKz3NLjv8r5RVcDGStTnQRPiiCGiHE
         oT8WnXSSlWmT7umUIQn/4wLSjOB9CjoY+dJm/sDJp+fZcFZ7PlijoV9QW3Brui0HELTs
         aFgVyv2PCnhE0VHGWmWAFt1u+qzmAVMD9xGJCUOKZLWKwuME/w56OCT9AtL8q0f0yA62
         uaty4x3JMsJ90z+WSFtyNgWYYG8yJYDQcd1uWa9UkN7qVhw+wCIldNvVYhOj21ESdzOY
         6Rww==
X-Forwarded-Encrypted: i=1; AJvYcCXVxatibEJaZ6kcv/9oaJOFuvTbdL+D9kDRLbFsJHLQOuaNY8ddv8aYiEoCFrpr8s/CvPqdRDKGCLkV+EZrQDn1W5bkpbIii6y3L/Ci4g==
X-Gm-Message-State: AOJu0YxbKCYDtLdRIwO1n0Fvo+nw5lcbxGPk01OYSJHJEbMeFZmX7tpi
	xATv/SgC4lpmr62HAh3teVnHZZ5VMNDnETowICAjqBnbH/Lvgm7w
X-Google-Smtp-Source: AGHT+IFo365wIbaTyR5MvgPkQnOZIFxNKFkoeJy3PVoY4SbWu7nxToHLufTUlQJONnJUSagdq2ojaA==
X-Received: by 2002:a5d:6dc7:0:b0:360:7809:ff0b with SMTP id ffacd0b85a97d-360780a0073mr1253891f8f.51.1718291863156;
        Thu, 13 Jun 2024 08:17:43 -0700 (PDT)
Received: from localhost.localdomain ([31.120.167.14])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36076515a80sm1856978f8f.76.2024.06.13.08.17.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 08:17:42 -0700 (PDT)
From: Teddy Engel <engel.teddy@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Teddy Engel <engel.teddy@gmail.com>
Subject: [PATCH 4/6] staging: rtl8192e: Capitalize constant RegC38_TH
Date: Thu, 13 Jun 2024 16:16:35 +0100
Message-Id: <5a64c076a932cd062587dae176418a39ccf8d19a.1718291024.git.engel.teddy@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1718291024.git.engel.teddy@gmail.com>
References: <cover.1718291024.git.engel.teddy@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

According to kernel coding style, capitalize defined constant.

Signed-off-by: Teddy Engel <engel.teddy@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/rtl_dm.c | 4 ++--
 drivers/staging/rtl8192e/rtl8192e/rtl_dm.h | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
index 5392d2daf870..4863ced04916 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
@@ -1752,7 +1752,7 @@ static void _rtl92e_dm_check_fsync(struct net_device *dev)
 
 		if (priv->rtllib->link_state == MAC80211_LINKED) {
 			if (priv->undecorated_smoothed_pwdb <=
-			    RegC38_TH) {
+			    REG_C38_TH) {
 				if (reg_c38_State !=
 				    RegC38_NonFsync_Other_AP) {
 					rtl92e_writeb(dev,
@@ -1763,7 +1763,7 @@ static void _rtl92e_dm_check_fsync(struct net_device *dev)
 					     RegC38_NonFsync_Other_AP;
 				}
 			} else if (priv->undecorated_smoothed_pwdb >=
-				   (RegC38_TH + 5)) {
+				   (REG_C38_TH + 5)) {
 				if (reg_c38_State) {
 					rtl92e_writeb(dev,
 						rOFDM0_RxDetector3,
diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.h b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.h
index 863af8ef9f94..3add5aa933b8 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.h
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.h
@@ -42,7 +42,7 @@
 #define		CURRENT_TX_RATE_REG		0x1e0
 #define		INITIAL_TX_RATE_REG		0x1e1
 #define		TX_RETRY_COUNT_REG		0x1ac
-#define		RegC38_TH				 20
+#define		REG_C38_TH				 20
 
 /*--------------------------Define Parameters-------------------------------*/
 
-- 
2.39.2

