Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CEDE72
	for <linux-staging@lists.linux.dev>; Mon, 12 Apr 2021 16:30:07 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id p6so6879679wrn.9
        for <linux-staging@lists.linux.dev>; Mon, 12 Apr 2021 09:30:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sKFmckhJz1VQS6Awob+qO1rgj7w9RZgnwYkma6KaDks=;
        b=ecZVrX285qWlOUfKCveyPLbvKpIuiTuqI0EHT3oh5gbDaxMPsPdq2ieycXoduoZcAB
         b1QZuJoFjuMG7ba8awJAiRR4WwNCEYvD4CUGaO1cvtHm7u9kB2lJDrt+JZP+hrDr107+
         oXYxKNC9VmNWu0jL1U9xWrCZnMKvoZ5yB1eORPex+1IhZ+vrxBXZBZjR4ztpoxNtNsa+
         yhnuFDJJkEj+Nyt8XUTvN526yEfreyyjpWfSpbu44fZpWdQpVNBAdydygU5jqkcYZ24W
         TY4XYrugvEp9I9kbQZ8BqBQm3+RA5c3/ej/H4uvv99ziNAOqo6Z/zC5hHCEzjzf/f0Eo
         VI0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sKFmckhJz1VQS6Awob+qO1rgj7w9RZgnwYkma6KaDks=;
        b=iHL3bkxH6cvcS81JrwyqKEo/HzhB3MLVjQaiaVPfNbJBInkWPZ6rTG/l1mVD/qqYmO
         e/CU6LLk8f+usRGNpuxeT+cZjvSb0oZL3U3W0j/VhfzG/vnuNC+KFGxeejNnRMRurLfJ
         w/oQ9Vy0GoWnFACVm91S7J5M/rs9AU2dZOQPXgFacjGVJe6C4saxDPr5oCva46qqq2Sl
         98gd9vmnFoIKkCefq612YGc0Qdi4BSHhh03EnA/NTUgD1pqRHN5vVMNKWueF458fGpDs
         AIrVYyemmbOka5dmlJuopS3v6Q1K8buuVLbgxIKhOQHRVsHfJaYHRoz92aVmE+Acw7AJ
         MbEA==
X-Gm-Message-State: AOAM5319ujnIuFnNcTRdoDYcTt1xl1PRJh1bis6XZD5DlI7qLhv5kvBL
	rf99F3A+fJtFR1n413XSnOU=
X-Google-Smtp-Source: ABdhPJwaxWWWdCEKP71OaUul8gGzPUcFLqO2mrxNUEt8grdarnRRAfHGqjrOtzlMNR//zBS8afESMQ==
X-Received: by 2002:a05:6000:18cd:: with SMTP id w13mr31946331wrq.20.1618245006273;
        Mon, 12 Apr 2021 09:30:06 -0700 (PDT)
Received: from bcarvalho-Ubuntu.lan ([2001:818:de85:7e00:813f:b20e:675a:834d])
        by smtp.gmail.com with ESMTPSA id b5sm16786524wri.57.2021.04.12.09.30.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Apr 2021 09:30:05 -0700 (PDT)
From: Beatriz Martins de Carvalho <martinsdecarvalhobeatriz@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	outreachy-kernel@googlegroups.com
Cc: Beatriz Martins de Carvalho <martinsdecarvalhobeatriz@gmail.com>
Subject: [PATCH 1/3] staging: rtl8723bs: hal: remove space before tabs
Date: Mon, 12 Apr 2021 17:29:36 +0100
Message-Id: <9694aafb614bdcbb15fdea614502c1b31a534871.1618243073.git.martinsdecarvalhobeatriz@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1618243073.git.martinsdecarvalhobeatriz@gmail.com>
References: <cover.1618243073.git.martinsdecarvalhobeatriz@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unnecessary space before tabs to conform with Linux kernel
coding style.
Reported by checkpatch in file Hal8723BReg.h

Signed-off-by: Beatriz Martins de Carvalho <martinsdecarvalhobeatriz@gmail.com>
---
 drivers/staging/rtl8723bs/hal/Hal8723BReg.h | 26 ++++++++++-----------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/Hal8723BReg.h b/drivers/staging/rtl8723bs/hal/Hal8723BReg.h
index 616d20106392..68a56627546f 100644
--- a/drivers/staging/rtl8723bs/hal/Hal8723BReg.h
+++ b/drivers/staging/rtl8723bs/hal/Hal8723BReg.h
@@ -27,7 +27,7 @@
 
 /*  */
 /*  */
-/* 	0x0000h ~ 0x00FFh	System Configuration */
+/*	0x0000h ~ 0x00FFh	System Configuration */
 /*  */
 /*  */
 #define REG_SYS_ISO_CTRL_8723B			0x0000	/*  2 Byte */
@@ -84,7 +84,7 @@
 
 /*  */
 /*  */
-/* 	0x0100h ~ 0x01FFh	MACTOP General Configuration */
+/*	0x0100h ~ 0x01FFh	MACTOP General Configuration */
 /*  */
 /*  */
 #define REG_CR_8723B						0x0100
@@ -131,7 +131,7 @@
 
 /*  */
 /*  */
-/* 	0x0200h ~ 0x027Fh	TXDMA Configuration */
+/*	0x0200h ~ 0x027Fh	TXDMA Configuration */
 /*  */
 /*  */
 #define REG_RQPN_8723B					0x0200
@@ -145,7 +145,7 @@
 
 /*  */
 /*  */
-/* 	0x0280h ~ 0x02FFh	RXDMA Configuration */
+/*	0x0280h ~ 0x02FFh	RXDMA Configuration */
 /*  */
 /*  */
 #define REG_RXDMA_AGG_PG_TH_8723B		0x0280
@@ -161,7 +161,7 @@
 
 /*  */
 /*  */
-/* 	0x0300h ~ 0x03FFh	PCIe */
+/*	0x0300h ~ 0x03FFh	PCIe */
 /*  */
 /*  */
 #define	REG_PCIE_CTRL_REG_8723B		0x0300
@@ -189,7 +189,7 @@
 /*  spec version 11 */
 /*  */
 /*  */
-/* 	0x0400h ~ 0x047Fh	Protocol Configuration */
+/*	0x0400h ~ 0x047Fh	Protocol Configuration */
 /*  */
 /*  */
 #define REG_VOQ_INFORMATION_8723B		0x0400
@@ -243,7 +243,7 @@
 
 /*  */
 /*  */
-/* 	0x0500h ~ 0x05FFh	EDCA Configuration */
+/*	0x0500h ~ 0x05FFh	EDCA Configuration */
 /*  */
 /*  */
 #define REG_EDCA_VO_PARAM_8723B		0x0500
@@ -263,10 +263,10 @@
 #define REG_RD_CTRL_8723B				0x0524
 /*  */
 /*  Format for offset 540h-542h: */
-/* 	[3:0]:   TBTT prohibit setup in unit of 32us. The time for HW getting beacon content before TBTT. */
-/* 	[7:4]:   Reserved. */
-/* 	[19:8]:  TBTT prohibit hold in unit of 32us. The time for HW holding to send the beacon packet. */
-/* 	[23:20]: Reserved */
+/*	[3:0]:	TBTT prohibit setup in unit of 32us. The time for HW getting beacon content before TBTT. */
+/*	[7:4]:	Reserved. */
+/*	[19:8]:	TBTT prohibit hold in unit of 32us. The time for HW holding to send the beacon packet. */
+/*	[23:20]: Reserved */
 /*  Description: */
 /* 	              | */
 /*      |<--Setup--|--Hold------------>| */
@@ -300,7 +300,7 @@
 #define REG_ACMHWCTRL_8723B		0x05C0
 #define REG_SCH_TXCMD_8723B		0x05F8
 
-/* 	0x0600h ~ 0x07FFh	WMAC Configuration */
+/*	0x0600h ~ 0x07FFh	WMAC Configuration */
 #define REG_MAC_CR_8723B		0x0600
 #define REG_TCR_8723B			0x0604
 #define REG_RCR_8723B			0x0608
@@ -356,7 +356,7 @@
 #define REG_SND_PTCL_CTRL_8723B		0x0718
 
 
-/* 	Redifine 8192C register definition for compatibility */
+/*	Redifine 8192C register definition for compatibility */
 
 /*  TODO: use these definition when using REG_xxx naming rule. */
 /*  NOTE: DO NOT Remove these definition. Use later. */
-- 
2.25.1

