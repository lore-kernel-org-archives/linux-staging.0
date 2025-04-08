Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39FFE257AC9
	for <linux-staging@lists.linux.dev>; Tue,  8 Apr 2025 22:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744150859; cv=none; b=uqIclJ2bq5rNAgPX8KqMxLIAoUDvMAF5ufaXzGh/SKz1IyS/Nb8SNOeM8rrdXzJeD1e2oI9L1nNPBGZHpKnSa1cH8uZvn7B9+pntDpjQ0EQduK/GItea/ZR2BN61y/SOScTpYRaXdcrRWk/Ezo41UMquPIj5+sBv/ttiVGsHoVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744150859; c=relaxed/simple;
	bh=XVlXgBarOpByMZ40cyRxIGU3F0ct0U+lW2mc3HyTQ/c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NFU1xhlNnDDdqroXhcp/Myz9psLGma6YhhkmMtsGVVMuMStDiQahtIQBDWHH37ysUTOFENqImIJzxcg4wY9kJMiM0gsTDKHns9YWa+vIstrxP7J9pGa0mNXegXdERsVzGITfaS+QnO0ZhqR1wcsFw9Ay5eDVlmwWPifkfUaGSZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=b6JWfV8o; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="b6JWfV8o"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-ae727e87c26so4061571a12.0
        for <linux-staging@lists.linux.dev>; Tue, 08 Apr 2025 15:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744150857; x=1744755657; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tOCJOouKRzWm4DusysfXTOFj97bZFWvP4soqnOkGANM=;
        b=b6JWfV8oj0WKkJBX0BUX/xJyspsnKEOmgCP/Gs4Ot+KuI9ykuzZcM3rmRNe+VfN4vF
         0Cx+q2yKmrZq7WF+m08Iy6Kh5E3BbX35M4w1G4Zb16JtZNu0LCQDhrEICdMz6vsc7V1n
         rbBLwq0JeDEY+CcXQX+m2EI+VeKxEWTcuFo9yqtVnx71Ehz2HYkTXB36S1kgmC9L3x4/
         m6FUc6yZCryWJX4fzTEoWj4YtxAYrQP1D+qUjpjmYpsm4WD1nGf0yCJNqtxWmazMsdCW
         znctSBmJe679MrXwcB6iW0RS3mgUmyTVDL/aVRcw3GgAHNuEw/7l5kB48oyFmWZiPMH2
         9flg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744150857; x=1744755657;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tOCJOouKRzWm4DusysfXTOFj97bZFWvP4soqnOkGANM=;
        b=Ukrjs2F1DboM+FsKiizmjSIR109yJyHweOUgqYlz8G6VZ8sb7loVA5+hWvirxOVe7s
         AxnSuIDMqd/5iTFrxnjxQwsKVIHHMUbVg0k/RW8BJ6Dzh+Z4Hbh3jKTwNLKpEtHScb2k
         Z5OU/ux10SyMjZBiw9p5Mp4SE7B/DbX+LP5U4bzi/M7oZjjMafco4lMncCo0i0UiYkA9
         c4LtdmsL7v/BV2msPJPWdONy/xQ+7LyMoOnrru7gdXbHumM7DgbCIQgxeM9ESpj+yV0L
         f6V6INwdLm1vIIAL1dJAcpIQXsXx1mIJp7z2NBWx4D3OzmbwDrFKcNVXNRDJs9w9r85I
         qmNw==
X-Forwarded-Encrypted: i=1; AJvYcCW+eFH9My8vm2DtRUMwg/qwG72OQSVYURS7aAcFivoeJMSsd1Hd74nB7v4BvjLPaVKvm/66yJN8g6eZYuuB@lists.linux.dev
X-Gm-Message-State: AOJu0Yxe16LroUDiGQ5AuyxqWHWgXOlPDG9+8acnKhPo3mG6cqBhUm3S
	oxh/otOnLtgh453yRTsv62ORwUBj2tybJYPQNnlvuAYTGPFM/V+hm2DPdRhFXclG+SC2LSEugnw
	=
X-Gm-Gg: ASbGncs/9SG9hn4/SNcRU1NkGfyMXKxt+i1e7ojOVAgd6eGhSYF7HMiOdU6hep4JenM
	vpQkDqfer4zMhT/7CNmvrve0DH0vh1uoEyEJgNskfGbmBYuFeRXkHq0VdfDQbRNTXH8XTcoPeBr
	2rqwGXqZMOs6eV2fAb0rbJItYotNkHg3gvWOORT4tC2cdKWXDeO0RJh9JODomB8BsXX9CRXS2oV
	/65EEZtYg/RB7Fwl//hC29ttPso5V8J9S6azpFJnN4W2A2QQVkdX0B9dYiNr5i6Cfmw5z4LuUAT
	7hlVXPyGcw+TNRm1yNSPJbn5RrrcCm5Cz5ZkrTbb6cjs6mptzzddVRAnoLSw8yQTFbXzxCyEAXd
	7XmKqW4Ping==
X-Google-Smtp-Source: AGHT+IGRcG/0A9R895NyLY04xo7ZTyvvpe7D0pWZVZ+pOHxJpZpWUst5VA6hx9p/XlK8Wh57gi11HA==
X-Received: by 2002:a17:903:1a6b:b0:229:1717:8826 with SMTP id d9443c01a7336-22ac29b0e16mr14759815ad.28.1744150857638;
        Tue, 08 Apr 2025 15:20:57 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739d97ee2d9sm11141575b3a.39.2025.04.08.15.20.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 15:20:57 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v1 11/14] staging: gpib: uapi: Fix CamelCase and IBC Dup
Date: Tue,  8 Apr 2025 22:20:37 +0000
Message-ID: <20250408222040.186881-12-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250408222040.186881-1-matchstick@neverthere.org>
References: <20250408222040.186881-1-matchstick@neverthere.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Resolved duplicate entry for IbcSPollBit vs IbcSpollBit.
Correct CamelCase for IBC enums

Adhere to Linux kernel coding style.

Reported by checkpatch

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/uapi/gpib_user.h | 63 +++++++++++++--------------
 1 file changed, 31 insertions(+), 32 deletions(-)

diff --git a/drivers/staging/gpib/uapi/gpib_user.h b/drivers/staging/gpib/uapi/gpib_user.h
index e02323508245..7f343256c110 100644
--- a/drivers/staging/gpib/uapi/gpib_user.h
+++ b/drivers/staging/gpib/uapi/gpib_user.h
@@ -289,38 +289,37 @@ enum ibask_option {
 };
 
 enum ibconfig_option {
-	IbcPAD = 0x1,
-	IbcSAD = 0x2,
-	IbcTMO = 0x3,
-	IbcEOT = 0x4,
-	IbcPPC = 0x5,	/* board only */
-	IbcREADDR = 0x6,	/* device only */
-	IbcAUTOPOLL = 0x7,	/* board only */
-	IbcCICPROT = 0x8,	/* board only */
-	IbcIRQ = 0x9,	/* board only */
-	IbcSC = 0xa,	/* board only */
-	IbcSRE = 0xb,	/* board only */
-	IbcEOSrd = 0xc,
-	IbcEOSwrt = 0xd,
-	IbcEOScmp = 0xe,
-	IbcEOSchar = 0xf,
-	IbcPP2 = 0x10,	/* board only */
-	IbcTIMING = 0x11,	/* board only */
-	IbcDMA = 0x12,	/* board only */
-	IbcReadAdjust = 0x13,
-	IbcWriteAdjust = 0x14,
-	IbcEventQueue = 0x15,	/* board only */
-	IbcSPollBit = 0x16,	/* board only */
-	IbcSpollBit = 0x16,	/* board only */
-	IbcSendLLO = 0x17,	/* board only */
-	IbcSPollTime = 0x18,	/* device only */
-	IbcPPollTime = 0x19,	/* board only */
-	IbcEndBitIsNormal = 0x1a,
-	IbcUnAddr = 0x1b,	/* device only */
-	IbcHSCableLength = 0x1f,	/* board only */
-	IbcIst = 0x20,	/* board only */
-	IbcRsv = 0x21,	/* board only */
-	IbcBNA = 0x200	/* device only */
+	IBC_PAD = 0x1,
+	IBC_SAD = 0x2,
+	IBC_TMO = 0x3,
+	IBC_EOT = 0x4,
+	IBC_PPC = 0x5,	/* board only */
+	IBC_READDR = 0x6,	/* device only */
+	IBC_AUTOPOLL = 0x7,	/* board only */
+	IBC_CICPROT = 0x8,	/* board only */
+	IBC_IRQ = 0x9,	/* board only */
+	IBC_SC = 0xa,	/* board only */
+	IBC_SRE = 0xb,	/* board only */
+	IBC_EOS_RD = 0xc,
+	IBC_EOS_WRT = 0xd,
+	IBC_EOS_CMP = 0xe,
+	IBC_EOS_CHAR = 0xf,
+	IBC_PP2 = 0x10,	/* board only */
+	IBC_TIMING = 0x11,	/* board only */
+	IBC_DMA = 0x12,	/* board only */
+	IBC_READ_ADJUST = 0x13,
+	IBC_WRITE_ADJUST = 0x14,
+	IBC_EVENT_QUEUE = 0x15,	/* board only */
+	IBC_SPOLL_BIT = 0x16,	/* board only */
+	IBC_SEND_LLO = 0x17,	/* board only */
+	IBC_SPOLL_TIME = 0x18,	/* device only */
+	IBC_PPOLL_TIME = 0x19,	/* board only */
+	IBC_END_BIT_IS_NORMAL = 0x1a,
+	IBC_UN_ADDR = 0x1b,	/* device only */
+	IBC_HS_CABLE_LENGTH = 0x1f,	/* board only */
+	IBC_IST = 0x20,	/* board only */
+	IBC_RSV = 0x21,	/* board only */
+	IBC_BNA = 0x200	/* device only */
 };
 
 enum t1_delays {
-- 
2.43.0

