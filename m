Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A7BF72
	for <linux-staging@lists.linux.dev>; Mon, 12 Apr 2021 17:59:14 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id e14so21704866ejz.11
        for <linux-staging@lists.linux.dev>; Mon, 12 Apr 2021 10:59:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HM2+WjgVNp2s8oN3ygCDI5DayIVOUQDYvbW2EA6ryRo=;
        b=esLCFcZrPotVd1SoNfCXRoUwMhDLsk6XhgI8BfkxHlgIvZeIIFkMHm9MPiXdRk0ry4
         nUFxIk6MY43ZYqQ5VW3i05wa3dwgYOCVMl6kY0eTIkgojR/K43RpThyUbw8nT1rftzA2
         gHcn6X6Otvs0JDBuJLua8pgrUMuzG8TotjJxLojFmTr5A5nOpVr6KuPp0jmOYQAerHGn
         iRrHqwR77c6iTe+q/4e33w3Al2u2OCWsR3P9U5/hnjioM88JZLiGvswEHFyHnKxJeFOJ
         5lIX3dnlK4tGn0R1nOPZHst7nWwskGtTBA0L9en0Aej80nTKuV1FRmWfxMJchGxGuEAY
         qdsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HM2+WjgVNp2s8oN3ygCDI5DayIVOUQDYvbW2EA6ryRo=;
        b=o35M7ieG0cyzxMNXnqdeUG2+UQX7031C/wUBhLhMvvXqyMf4bltC9GFTajpNe2cw7U
         Qtzz/qPlPGNj0wufFIGhDJqtpL+Z/8uhdJdewnEmJ1G90I9pwtZ7VCpU2j52g7wiMOMS
         ak8l7FKUEDu/eVaLVDqEHxTWmWmTDVWafGuyIjEzqTkFmt+fGE0wqeIusnE4VBrXq63m
         WNHPiePe/3e31C/kIgqlDn4KumNCmHSRMkszouKaBOpIzWXj/ch3TEcyjh89Bf0LcGa1
         kZZ+j7mMPrGp1ZKanwjlbS0O9ASbC74N9dCSUGlQEt+KDxYKxIWVeKcogRUAym3/P7st
         PBKw==
X-Gm-Message-State: AOAM532Pbl1qPvwlcCO1XlhsywKQ4XNZ1ZONNHPLYjfjfRgqGFnjAZs4
	OIHCU2ZqvvRaPaZYR1y6KEo=
X-Google-Smtp-Source: ABdhPJxKCII/8OLgPgV63ZFXMbCuIQXJWPa5bsJ+xqVKWuBqOmiPS2NU7xTmEcw13DHeb+lDs/fZsw==
X-Received: by 2002:a17:906:6a94:: with SMTP id p20mr28753434ejr.68.1618250352838;
        Mon, 12 Apr 2021 10:59:12 -0700 (PDT)
Received: from linux.local (host-95-237-55-30.retail.telecomitalia.it. [95.237.55.30])
        by smtp.gmail.com with ESMTPSA id gz20sm6300534ejc.25.2021.04.12.10.59.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Apr 2021 10:59:12 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: outreachy-kernel@googlegroups.com,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Subject: [Outreachy kernel] [PATCH 2/2] staging: rtl8723bs: hal: Remove multiple blank lines
Date: Mon, 12 Apr 2021 19:59:03 +0200
Message-Id: <20210412175903.17819-3-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210412175903.17819-1-fmdefrancesco@gmail.com>
References: <20210412175903.17819-1-fmdefrancesco@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Removed unnecessary multiple blank lines. Issue detected by
checkpatch.pl.

Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
---
 drivers/staging/rtl8723bs/hal/Hal8723BReg.h | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/Hal8723BReg.h b/drivers/staging/rtl8723bs/hal/Hal8723BReg.h
index 1ff2043fb2e2..4a91913e20bf 100644
--- a/drivers/staging/rtl8723bs/hal/Hal8723BReg.h
+++ b/drivers/staging/rtl8723bs/hal/Hal8723BReg.h
@@ -19,12 +19,9 @@
 #ifndef __INC_HAL8723BREG_H
 #define __INC_HAL8723BREG_H
 
-
-
 /*  */
 /*  */
 /*  */
-
 /*  */
 /*  */
 /*	0x0000h ~ 0x00FFh	System Configuration */
@@ -142,7 +139,6 @@
 #define REG_RQPN_NPQ_8723B			0x0214
 #define REG_DWBCN1_CTRL_8723B			0x0228
 
-
 /*  */
 /*  */
 /*	0x0280h ~ 0x02FFh	RXDMA Configuration */
@@ -158,7 +154,6 @@
 #define REG_RSVD5_8723B					0x02F0
 #define REG_RSVD6_8723B					0x02F4
 
-
 /*  */
 /*  */
 /*	0x0300h ~ 0x03FFh	PCIe */
@@ -355,7 +350,6 @@
 #define REG_BFMEE_SEL_8723B		0x0714
 #define REG_SND_PTCL_CTRL_8723B		0x0718
 
-
 /*	Redifine 8192C register definition for compatibility */
 
 /*	TODO: use these definition when using REG_xxx naming rule. */
@@ -365,7 +359,6 @@
 #define	MSR_8723B		(REG_CR_8723B + 2)	/*  Media Status register */
 #define	ISR_8723B		REG_HISR0_8723B
 #define	TSFR_8723B		REG_TSFTR_8723B		/*  Timing Sync Function Timer Register. */
-
 #define PBP_8723B		REG_PBP_8723B
 
 /*  Redifine MACID register, to compatible prior ICs. */
-- 
2.31.1

