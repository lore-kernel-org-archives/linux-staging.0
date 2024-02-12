Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9587A3EA9B
	for <linux-staging@lists.linux.dev>; Mon, 12 Feb 2024 13:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707745037; cv=none; b=no9cEEbp2Qn1OnoPOtddk/ZL0/MvXmMwQ+eYzy+gE2mSLdX1tpmE7mX4kkeXHcEBHfdCxg6+ls+Qy9KtSb/Hj6ALiSHOoPws/iYBSGJ1Sc84YztsrJ0b+axOF12S2x5r6S5tgSgs337bo2G4SIl8QFedu9WP1qBW2yFlvrxCyqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707745037; c=relaxed/simple;
	bh=F//opeBQLHL9vnvCVwkl/A7cs5ydPs9MIEctpGlDv58=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=iejtfRteFVd8EhU5PO1X/HFEd8bKsJTBbOrhTn4yBB6jwyemvmsTGAQ7WMPTsbrBwz+A95lHSsGQdK7wgJ7wASN5SbUYtMLB20juWgAoDF5HeT4l7Itg3NwyBgshxwuC85Q8D/m4Mi4IrNeV8NfEVQVHhIKgCJJCfjF8moxOVAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hml2TwkA; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hml2TwkA"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-560e9c7a094so4218164a12.0
        for <linux-staging@lists.linux.dev>; Mon, 12 Feb 2024 05:37:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707745034; x=1708349834; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=laRfN/HWi9oFcahbxDTMU1nfn0SEB7plYdxrJOODhts=;
        b=Hml2TwkAAbwhsMEhQnUNw2iI3Z4gAgcDzi+zf9JI9uXbG++i8zl6bjJ21fNpgugvP+
         7kmP+7moEGWhRC/KvdSQCARONnvkO726eOvl/7FeRon6Vi+O1cxoGY7IhU6xlUpxA2ZT
         qX/9D6R1/o48AQ7dLVglYWUcnKQy3TG0gZjPHs75+lbDqaHatzreS7pgFLSzqh0V2fV4
         obfxH3RCB4NnkkjaGlcQdKaEMmdSIYKXmcbMi27E/uHd66B/sEIARhHs9Y72d0LLN7Yz
         WHb+XHQ+spAgJZ4u8iXzuFDDBLP90gLE+Aa2LTqxlWuJLzcYlwOnlK7OvxLb3x9mSE5u
         HEmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707745034; x=1708349834;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=laRfN/HWi9oFcahbxDTMU1nfn0SEB7plYdxrJOODhts=;
        b=GTom+aN1loTKoV341+3Dt/hFRtMZfoAEhmLCwIrzgdZWqHXOrUSUb3ynYs2X0qCrPl
         OSDa+iMk1AjGCA8S40VQSIkHSPJP02zGm9RHU/l0xxjTis6rmDWxDBjEqd6Le+8cav1e
         +JHP/AvGjSS/V2rtsQNd5fLAhX+vqMhdyWDuvfSbiVqYQN7kLa8CHVKAlH/7WDLKGwWt
         5U/l9zUPWd+uknvvzc7m3uc7zt5rxVO7QyQ8YSlLlSlfgqTlIfWorD+OkCi85A9pXoDi
         mNLr+5Brf9F8rXmduWoleGbRXTDvuuP0mNlYpkDAuUPSOk75hotYyq7jmQkqC6KyZNre
         VbnA==
X-Forwarded-Encrypted: i=1; AJvYcCWogagGCJO1ppSRIpRrqAIk1V2xZw485aVfAVr/y42jhU66gIXjl+mI0OXao/9zUOD5xoxMR2q02U7GId1Yj25mqLVFd7TQfSzGu3DH8A==
X-Gm-Message-State: AOJu0YzYA2Yacy4kANAGvwMhqS4SAsshka84HPv4CVUFMIUAsQ+lOOQd
	a5zRIhbKsZoZZuyiLo4hcfr3BZfvxoAU3rBDeS3megb580HoJtRh
X-Google-Smtp-Source: AGHT+IHClMT+6z/F2LOpPmY+C90cvi23oE87OBATifYkMwiSVZ7weG3wvapxuODx9ah9CqYEZSSRKQ==
X-Received: by 2002:a17:906:af94:b0:a2d:a6a7:b3bc with SMTP id mj20-20020a170906af9400b00a2da6a7b3bcmr4914263ejb.4.1707745033563;
        Mon, 12 Feb 2024 05:37:13 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXe432sCq8gKTTI0yG5pfLkQIYtqJ861AS8PZqUqhhYamDxyw7VdxiA2uix2eU872LkARzAtoE46oCSfAsRpuqm4Oa7niFQkv0IzqTpadWZ6HfO81nB7lzr4NYa94oJXYGqYev2IFT637FH4p/nM1HNZxXSlKg3qwgfsFA2YRY+l1lPcNqZ+baDql4Xb7RodzRqCAGV1yuVPh14jq+ZMQ==
Received: from pinguine.lan (ip-176-198-146-182.um43.pools.vodafone-ip.de. [176.198.146.182])
        by smtp.gmail.com with ESMTPSA id v16-20020a17090606d000b00a389838037bsm221777ejb.94.2024.02.12.05.37.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Feb 2024 05:37:13 -0800 (PST)
From: "Moritz C. Weber" <mo.c.weber@gmail.com>
To: marvin24@gmx.de
Cc: ac100@lists.launchpad.net,
	linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	"Moritz C. Weber" <mo.c.weber@gmail.com>
Subject: [PATCH] Staging: nvec: nvec: fixed two usleep_range is preferred over udelay warnings
Date: Mon, 12 Feb 2024 14:36:45 +0100
Message-Id: <20240212133645.1836-1-mo.c.weber@gmail.com>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixed a code style issue raised by checkpatch.
---
 drivers/staging/nvec/nvec.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
index 2823cacde..18c5471d5 100644
--- a/drivers/staging/nvec/nvec.c
+++ b/drivers/staging/nvec/nvec.c
@@ -627,7 +627,7 @@ static irqreturn_t nvec_interrupt(int irq, void *dev)
 		break;
 	case 2:		/* first byte after command */
 		if (status == (I2C_SL_IRQ | RNW | RCVD)) {
-			udelay(33);
+			usleep_range(32, 33);
 			if (nvec->rx->data[0] != 0x01) {
 				dev_err(nvec->dev,
 					"Read without prior read command\n");
@@ -714,7 +714,7 @@ static irqreturn_t nvec_interrupt(int irq, void *dev)
 	 * We experience less incomplete messages with this delay than without
 	 * it, but we don't know why. Help is appreciated.
 	 */
-	udelay(100);
+	usleep_range(99, 100);
 
 	return IRQ_HANDLED;
 }
-- 
2.30.2

