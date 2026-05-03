Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED74A383C85
	for <linux-staging@lists.linux.dev>; Sun,  3 May 2026 17:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777830536; cv=none; b=dQh6JKSqXbRFtJrf8pY6gNP10jcQ5ePaYuKEsVskN+wUDejRTIxITS9wUCoN8ozPJGr2egtXRuOtNp/dH3I2s+aGLWtMT+xYly36M0UMVJkdk88DdgtmqdNKHIzljDtyjtX98TSq1yN1On9E2z2suWuKue7ni8j2PcXdjmUnmrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777830536; c=relaxed/simple;
	bh=/VBCVobtHzG7OXxoZIYCYhtm+ZiWDosbxNPjzk1hMxU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=tEd1JlDeUjcWJ2w1uPIKTiUMzN+qK8zWa6UPvETYCmLatCMN2pcBvrqlRvDzaKK65kZSnh9/f1/rKD8oHzQ7/e5ZMJ5LoStuKYJUSSpd2XFCEfSY3L+TYp2JEqeGXQxjkpgCSPZniY5XxyjBtc9hrqfTLaGZ2BuWDQZAZjSneuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o4pNxDLr; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o4pNxDLr"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-43fe2771d8cso239533f8f.0
        for <linux-staging@lists.linux.dev>; Sun, 03 May 2026 10:48:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777830533; x=1778435333; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qSI2mfYYxwzI4OYRUhcEFSauAAw2yTVtrnw16ToaeQA=;
        b=o4pNxDLr5QqL42FnQiyYT9cjdzb1GennApGWxYjEaZuOdneNE3GT9rwQ3IrPI9bsH8
         W9UHq09aNFGk2LtKt5erI3noG/q+FBvA6myc7DpWniV5Rb9qmG7I9Uk50YOotTCyqWHE
         RZzMOT7FTig3p9Fos4pzVqzEvgd71XkzerTdictP6VzDJ+37GyHoPFsOrRjOmFR6XGGR
         n8u36WsjzNmqpBpXyFL8qXqplosL6B19WrfS3qMMwv/vwvmR12ejfnW6YzSxITwjnRe5
         YX++uXSzJpAQS1c6NEIaOVQZU2TWTstuPi57n3E71VS6zkL36mEeG6EWOLZnEVjAEib4
         dnHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777830533; x=1778435333;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qSI2mfYYxwzI4OYRUhcEFSauAAw2yTVtrnw16ToaeQA=;
        b=VirN5QrrRrjFX9hhn5EBEoSdyA5GDvpOoGke3jgnINi1eMyk5fdEcoeIKrnck7SekZ
         +OK7oOQnmRKnnUtEBUU+/f6PJfT90o23qCEz+My6mCd/46a5+PQ/l1TAjlELkGUIrfUd
         a8ckbNJQO4WvedE30dKiQABDqjbePNaIEbWbyw5U4VIQZ4VDmyk4M/kW3Uj4q0k0UjZY
         510hBTOz5s4Rfx19LCU0MeXpZzBSRdqLvVLT9fL1lWlC5TsjsZeQAhNs++ezcVjad2jP
         z2uD+WdYifz0MGojZwgfbIRbY78tYiuOUvG/S7KI6swA933W+cpPAXIRp5RFTteFH1Px
         mtOw==
X-Forwarded-Encrypted: i=1; AFNElJ8nElzlZWwwmc7gXMypFWzOTl+t5ShlF6D76vvMZ+e6j1iB/ncJFNh6+crTgNCbYy+iXuL85flgtN5gB71R@lists.linux.dev
X-Gm-Message-State: AOJu0Yy/Nx9MlQOJzUi5ciojRvTaETWQtaXLih8NG7YqX5Z54iNwAgjx
	D68sfvbhCxOuEJGI2N8cQzxOW/i5zeZctguAWjKYXLgtxwvS1iD3tCc7
X-Gm-Gg: AeBDietjMJ6EVFNL5YNwE7nILZCA+cj/d8PIm+c5KE570C4UZ+bqkgvR5+2TMBPlYvh
	xjZ4a1xPJANebNMZAyyIvbP7H6Ijycv3W7bwKsS7yvHzR5mBNVtvRHJaF/rkLkgbW7AyNwW31f7
	tm5p4uNfekn3unPPSHOfLEXv37t0yrrSykagoIuzVVPQrMVXI4amrQoBPoaZiv42RzezypSjduv
	N56RCSsj1Kaf0PdcGp52IdLE5CavxGr/aJeVgsDvuOOxXbwbPEvtvBWP/q3Glqaq2959go5KqyI
	WAFQVGm+Ek4t3zt5XaWM/FlPoqMW8ConbFMRupQYED+pW5RopVxJu02XTBCPK7RxwgVrbrKcYSL
	wIpBlOxOapS+/rSZ5L2zllqKlM8YYGzwMosVJ0yNIehcj1+dsomEDxdVHGc+wE7hHroh1Pzkasa
	lmcgoQMof+CtvnCSny6iGvd8twvFzJHLZC18W4VL3pEthmqRrfmSJnWT4=
X-Received: by 2002:adf:e00b:0:20b0:449:4c24:b6c6 with SMTP id ffacd0b85a97d-44bb35dbda5mr3147314f8f.2.1777830533210;
        Sun, 03 May 2026 10:48:53 -0700 (PDT)
Received: from localhost.localdomain ([82.215.118.79])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-44a986aab44sm21155287f8f.29.2026.05.03.10.48.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2026 10:48:52 -0700 (PDT)
From: Stepan Ionichev <sozdayvek@gmail.com>
To: hansg@kernel.org
Cc: mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	andy@kernel.org,
	gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Stepan Ionichev <sozdayvek@gmail.com>
Subject: [PATCH] staging: media: atomisp: fix typos in input_formatter_rst() comment
Date: Sun,  3 May 2026 21:47:55 +0500
Message-Id: <20260503164755.1899-1-sozdayvek@gmail.com>
X-Mailer: git-send-email 2.33.0.windows.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix two typos in the TEMPORARY HACK comment in input_formatter_rst():

  WICH         -> WHICH
  STREAM2MEMRY -> STREAM2MEMORY

No functional change.

Signed-off-by: Stepan Ionichev <sozdayvek@gmail.com>
---
 .../atomisp/pci/hive_isp_css_common/host/input_formatter.c      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_formatter.c b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_formatter.c
index 40b3f1e48..e15fb7e0d 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_formatter.c
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_formatter.c
@@ -59,7 +59,7 @@ void input_formatter_rst(
 	rst = HIVE_IF_SRST_MASK[ID];
 
 	/* TEMPORARY HACK: THIS RESET BREAKS THE METADATA FEATURE
-	 * WICH USES THE STREAM2MEMRY BLOCK.
+	 * WHICH USES THE STREAM2MEMORY BLOCK.
 	 * MUST BE FIXED PROPERLY
 	 */
 	if (!HIVE_IF_BIN_COPY[ID]) {
-- 
2.33.0.windows.2

