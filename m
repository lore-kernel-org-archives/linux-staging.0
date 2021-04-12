Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5315972
	for <linux-staging@lists.linux.dev>; Mon, 12 Apr 2021 16:30:11 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id r7so1606370wrm.1
        for <linux-staging@lists.linux.dev>; Mon, 12 Apr 2021 09:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZLMXuiqimbamnVGxeY3wIizCjoU1LFQjurxEMAi/nOU=;
        b=qk1UWmkIqjEB3sQUGZa2ZR66NqTcHku4v4uwBJ0TkdvZpfBrzeZZ0UroO+wxDMKIE+
         BWEShIFwHoOgFOXSnK2LnXIs7oEi/GsNZYwlz3Fbwo95sdhFj1IEMEnw8N6KpxQR8yli
         8gfbSQTpTYoyu0xMVw6mF9mtUVrEqDZc6GDcJ5Lmh7oXi3coRXpLVHM9fnKS8HMHHXiX
         DGMvTZ+pLT5PAhwuqSWe0TDMnYM7hDaGF5KZXqaCus/8seQVEouQSXSr4kkH71MybHc9
         0RNTovXnRXylNd/mmLi9DQ4KK26gXQRE1N+9TvCNIRVPy7/P7/Xbq02D1fp8t/UH74qT
         HVGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZLMXuiqimbamnVGxeY3wIizCjoU1LFQjurxEMAi/nOU=;
        b=EICx0z/V/D6mmj3MilLxcQOMj4aftMSl4jmlqdLdolRwD6bq4nhurl5k8AZ3WcFbRj
         7KNybQ4QDNjtNl3Wm4vJxV8fH/rF4mijgBKLhWRYNmRR5w3Roq+NKHmsnqv26FuMPDjX
         ltv1bvEySL/ugzst/D0Qs9+cSGKgDdB1m3PRKu0kaoPl8ReYvO2/hzp2/DQJyDtrIu+k
         toFl7TJaf2y6yVnlvChVjUo/F6/Jg+/ZF/jQ8MmjBnUmuNDCqP4Yokb28RrlUNJYrOGk
         nGBzxUirlg1VcI6Gt/V6YZl6V4kMzWDoLjDSTi5iXutPMaN4Vc3Ifun5RZlUIEo8BWO3
         hgIQ==
X-Gm-Message-State: AOAM533t2x9mC8A+M0GzQejaCvfRiLQrFxAzdbB1OVKvm9Q0DgYF+bkc
	bu8U4Hj7eqmq5oDkMoBMBtE=
X-Google-Smtp-Source: ABdhPJxzCL5vIFCm3zIk5Wki2WZL3IyGLgYci7JiYjpv/yUCHnERZW/FtIssgcWNvReHd0OoMObkNQ==
X-Received: by 2002:a5d:4e81:: with SMTP id e1mr9135210wru.305.1618245008945;
        Mon, 12 Apr 2021 09:30:08 -0700 (PDT)
Received: from bcarvalho-Ubuntu.lan ([2001:818:de85:7e00:813f:b20e:675a:834d])
        by smtp.gmail.com with ESMTPSA id b5sm16786524wri.57.2021.04.12.09.30.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Apr 2021 09:30:08 -0700 (PDT)
From: Beatriz Martins de Carvalho <martinsdecarvalhobeatriz@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	outreachy-kernel@googlegroups.com
Cc: Beatriz Martins de Carvalho <martinsdecarvalhobeatriz@gmail.com>
Subject: [PATCH 2/3] staging: rtl8723bs: hal: Remove extra blank line
Date: Mon, 12 Apr 2021 17:29:37 +0100
Message-Id: <7f48b48d92b54c1f5db29f0d23c8c1c666236c43.1618243073.git.martinsdecarvalhobeatriz@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1618243073.git.martinsdecarvalhobeatriz@gmail.com>
References: <cover.1618243073.git.martinsdecarvalhobeatriz@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove multiple blank lines to conform Linux kernel coding style.
Reported by checkpatch in file Hal8723BReg.h

Signed-off-by: Beatriz Martins de Carvalho <martinsdecarvalhobeatriz@gmail.com>
---
 drivers/staging/rtl8723bs/hal/Hal8723BReg.h | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/Hal8723BReg.h b/drivers/staging/rtl8723bs/hal/Hal8723BReg.h
index 68a56627546f..1279ff82c097 100644
--- a/drivers/staging/rtl8723bs/hal/Hal8723BReg.h
+++ b/drivers/staging/rtl8723bs/hal/Hal8723BReg.h
@@ -19,8 +19,6 @@
 #ifndef __INC_HAL8723BREG_H
 #define __INC_HAL8723BREG_H
 
-
-
 /*  */
 /*  */
 /*  */
@@ -142,7 +140,6 @@
 #define REG_RQPN_NPQ_8723B			0x0214
 #define REG_DWBCN1_CTRL_8723B			0x0228
 
-
 /*  */
 /*  */
 /*	0x0280h ~ 0x02FFh	RXDMA Configuration */
@@ -158,7 +155,6 @@
 #define REG_RSVD5_8723B					0x02F0
 #define REG_RSVD6_8723B					0x02F4
 
-
 /*  */
 /*  */
 /*	0x0300h ~ 0x03FFh	PCIe */
@@ -355,7 +351,6 @@
 #define REG_BFMEE_SEL_8723B		0x0714
 #define REG_SND_PTCL_CTRL_8723B		0x0718
 
-
 /*	Redifine 8192C register definition for compatibility */
 
 /*  TODO: use these definition when using REG_xxx naming rule. */
-- 
2.25.1

