Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 815672248A5
	for <linux-staging@lists.linux.dev>; Tue, 14 Oct 2025 18:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760465890; cv=none; b=XUhUdYOJa5vCUIRw5obpxsnQjsoXElVmK+Ay8aIOqgcn0c63ZFxNIMuE9XLG97o5VVfYw1dm3LKO1Q55AuRLHAkOFYFWQew8LO7JEfrOmr37OBJGs62T3WogNeJp5onXp5qDKRD9pNkpyMNMPhdXCX+7KuqnjCe2vsK1Nci4rw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760465890; c=relaxed/simple;
	bh=fl9dxu0ycvvXitt44bCuyJPyoAQrj/yoDZITVlKXsjM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BS+4RWBB7vgmegq17UxR7j16NlIyn6E/V3PMeLrGkbRZUr5ZL50wh3B1OmlWOrtSsUP7V6QXmCgG7c4E3HjU8W1hGuWf/G6v3yb3TUf4FWVL2z+lKzVcj7f23zqnFDHevsGQC28aa4IcXeqYWkV2eSZu/DcOMDQmx5db6otH9Ko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JYXPa4V7; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JYXPa4V7"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-77f67ba775aso7925855b3a.3
        for <linux-staging@lists.linux.dev>; Tue, 14 Oct 2025 11:18:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760465888; x=1761070688; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FJYX0oFaOu5LIwnoU6nce/6u02Dn7Xqdn6lu9Olcq4Q=;
        b=JYXPa4V733OoQ4PdKLNGh4IIQ4MSQR11/+zgOeycMa5yYGYUQXQTEokUhSaayooXOt
         yCTsGIedJ4lLm0mlmXHV3YKkS2zidpcylu+mVgWlmMa7sG4EtCT+LyC4mQbwxLYs4RHa
         CBcdqSkFBK4/OvqNnBFGOPY5thascLzLlD5/OEJCT2ZoQThFjN7CD+WfYoJ1+QIoPTYQ
         iCEDWRUhnsagMvr62vQypSEfc/3JKtH7u7MKecaFWh4hw7irPJIswWw8o0pevc741ZFq
         HfhZpJbNYKsLrMpyK18b/wlmYwxmOCXVhcOHWA2u7MmA0M1WI608hpVDseSFBl5Mk0dl
         yt2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760465888; x=1761070688;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FJYX0oFaOu5LIwnoU6nce/6u02Dn7Xqdn6lu9Olcq4Q=;
        b=YvZhiy+dXS3BDol1WyiOh0hfgrnOHv572j5PeSxHyII4C2nsSl3qM0b3HXmikEnVn7
         jMskeCpCK0VpvashfEAXVSmndQ5rP3dXCeaS/sNpv4oBqzhiriIDfDDk0VsbYbJqTu8L
         LbiF7veYTxvL/4kXmWbApFabbb9jIgtA/tRBzTMU0l9qxIHbb8REZrIl09KuHVUKEQOZ
         oBgrzrbZk0S2jF2cQ2BunLtOaPCNr4Cb6W9sbXUvLUW1Ywph/A0MrtG9Kv7Gu37PKtRh
         9QtFPRpCqDvvqsNX8fmzE3cdYfKQeJB5DAtTaUxO1CJzgRmAlrUKQXuOi7jB05Idoe21
         BBgg==
X-Forwarded-Encrypted: i=1; AJvYcCXptdzRJ3gQalPb5zhCHXvX+VKFLy539kcfh6m/Pyzrn2f03H5O+3Fw5vhZHUYOryxhv7yMOgSno3s2e07S@lists.linux.dev
X-Gm-Message-State: AOJu0YzjhFUGvzaeCvcZxFuW9n4dJaf/NEMEWFCsOPUQqbBP+V+J6kCA
	IqH5l2CcgFjmjmjqxmvafv4QtvHUpjTt9y894rvERfR7J1y7ncsHtJ8ZnVf16kTCq0oLgQ==
X-Gm-Gg: ASbGncvewbYck/aMXXXv8EhZJvJrffzAR9gURbjY0AE0GYnofSGQGiMPNL6l3IDKHU+
	OtTz5mr8rGWO1/mtV/LYmivVPal32Q8mgUOZAj3WoT73aoa0yyOUFzCE1edvbTbCO91AsKxJGZQ
	NFZPesBO+EFe9dsj2ubF+0mpAN4a4cgifsVaUV5zh0I9FV4qnVaqqJneEw76FPkXxT7v02UOwsi
	e+Y9kmT5lxm1lPgm4vLRefrSdndd/UP4yo1XYYhSl90NYhPhcsd3ZM7roDTOYS51rpVoM+uTCvj
	Jv/xPe9DnGrBm/Qy+OsqOq6dNBhK9IX+faMXBh9eFWnKfJNf95BT8Tt4WDQ3m46nxyEHTmnIvNZ
	6KySbs4bksA2G6XzcOWnFTG92IV5eaiKmqpjsIb7Yaith
X-Google-Smtp-Source: AGHT+IHpaIm1FVkV0NO5/LLLKAO5EveRWhKWjYPnl0QVM+/Ty5AmqP+fDzEXx8yVvAGcjrWDilVc2g==
X-Received: by 2002:a05:6a00:39aa:b0:793:11fc:783f with SMTP id d2e1a72fcca58-79387a21bd2mr33487063b3a.29.1760465887560;
        Tue, 14 Oct 2025 11:18:07 -0700 (PDT)
Received: from archlinux ([2a09:bac5:3e67:a82::10c:4a])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992b060b66sm15991997b3a.8.2025.10.14.11.18.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 11:18:07 -0700 (PDT)
From: fokaz-c <fokazmchakma4427@gmail.com>
To: dpenkler@gmail.com
Cc: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	fokaz-c <fokazmchakma4427@gmail.com>
Subject: [PATCH] staging: gpib: pc2: convert // comments to /* */ style
Date: Tue, 14 Oct 2025 23:47:45 +0530
Message-ID: <20251014181745.171714-1-fokazmchakma4427@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: fokaz-c <fokazmchakma4427@gmail.com>
---
 drivers/staging/gpib/pc2/pc2_gpib.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/gpib/pc2/pc2_gpib.c b/drivers/staging/gpib/pc2/pc2_gpib.c
index 9f3943d1d..a9715b3e3 100644
--- a/drivers/staging/gpib/pc2/pc2_gpib.c
+++ b/drivers/staging/gpib/pc2/pc2_gpib.c
@@ -19,30 +19,30 @@
 #include "nec7210.h"
 #include "gpibP.h"
 
-// struct which defines private_data for pc2 driver
+/* struct which defines private_data for pc2 driver */
 struct pc2_priv {
 	struct nec7210_priv nec7210_priv;
 	unsigned int irq;
-	// io address that clears interrupt for pc2a (0x2f0 + irq)
+	/* io address that clears interrupt for pc2a (0x2f0 + irq) */
 	unsigned int clear_intr_addr;
 };
 
-// pc2 uses 8 consecutive io addresses
+/* pc2 uses 8 consecutive io addresses */
 static const int pc2_iosize = 8;
 static const int pc2a_iosize = 8;
 static const int pc2_2a_iosize = 16;
 
-// offset between io addresses of successive nec7210 registers
+/* offset between io addresses of successive nec7210 registers */
 static const int pc2a_reg_offset = 0x400;
 static const int pc2_reg_offset = 1;
 
-// interrupt service routine
+/* interrupt service routine */
 static irqreturn_t pc2_interrupt(int irq, void *arg);
 static irqreturn_t pc2a_interrupt(int irq, void *arg);
 
-// pc2 specific registers and bits
+/* pc2 specific registers and bits */
 
-// interrupt clear register address
+/* interrupt clear register address*/
 static const int pc2a_clear_intr_iobase = 0x2f0;
 static inline unsigned int CLEAR_INTR_REG(unsigned int irq)
 {
-- 
2.51.0

