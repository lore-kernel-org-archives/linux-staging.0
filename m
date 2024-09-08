Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46A2016D4E5
	for <linux-staging@lists.linux.dev>; Sun,  8 Sep 2024 18:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725819024; cv=none; b=PZR2IgkXVzf8tu9noaTREs6TibY9cns+AQzovIjkDAYSyfkLozzMJYkMBZDRNaIIOAyCkIVs+773y3AbDpSWgMNuPUzvJZc9Kt3CUX8Xx/8wgZapw5rBwwru1VNTddsBXR8IBnsXi9DruvGp7ugm6oXgYCECJLQXLEZigkkb+k8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725819024; c=relaxed/simple;
	bh=3pkGKpnps9BRZYFTTIc/uwOCzJXREVREtCLzMWazsNA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=TCDpVaPb5KCapmjiNjKhkL/RldDH3yFJBnXwaoWFVRDxhZlEtjAoLvifjg3aWtGr0c+G2u6050062COQgi8BPtbVldtQ3B4RHYm9ubQTrwp2j/qtxilt23k213yj7pKJoX8tH4EbbD6BRixsaNBkZLKUgMXy1au4HQWvJAKkPxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UTv/qEFU; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UTv/qEFU"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-71781f42f75so2815111b3a.1
        for <linux-staging@lists.linux.dev>; Sun, 08 Sep 2024 11:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725819022; x=1726423822; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ar6XzATEWGm9OHxBFH6LESh/+hr+qtyBbKtC4UJ6nYM=;
        b=UTv/qEFUqwZLYJVAggXR0lL5CYWUIB/9IXm1ksVy63TUGjNJZ5hZAOa+ihycDtbcbQ
         DAejNAyh6DG3W8Ls4JxKGwuDGrr8lpsZgrKrBUvR33i0Ic5mDDBiRS6dLgew/O+TTagm
         FEfy+gx04h+hUK1dILUWT+WhEmCCIfrgHZ4YxLsbYR61uwQMgD/W91MTXzLbaX41fGV9
         NUZNx4d+9Z26fLqUy9TWhD28CMJ0LBEKmcBOyDNLDYuAH0VJTPy2nJYRYNxVwC1STkhP
         54au6ZO4n5z2hOhrSezBbABqAIoU3Fi0CNoO5IceH8FNMRXD+YAPyAFBwjRfd/VD37dV
         9mVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725819022; x=1726423822;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ar6XzATEWGm9OHxBFH6LESh/+hr+qtyBbKtC4UJ6nYM=;
        b=DkQJw1Sc4xy466o74KoN2r9g2Cs+sjnGOqW0oYw1mDQ6YrwFaJokTfchUQZoVr8Y0A
         v7xrVCXa5iKM+otZDRQIF9NWN+sls6hO5++gsaA6XRSa9iOWQ6dqaGE9cQsBskyQ2Uvn
         lhgpSQP1TdNUrro+Q99E2dCvzECLnGqgRJs1IAIZovPmPSRwOvqi3PAAU8AgwFOnVsTr
         l9cJMto4k/6ROjYo9W3taU37qLRbzra1QOVF71y3Qra8KK9VljpcgoTmC3YoyJkDQlcf
         u2HxbogkJIcBxQwUNPQwcHgAdr38XFTgHk9mKOTmiKJr/kXG3Yw60eRbExB3YnIbi0r9
         4yXw==
X-Gm-Message-State: AOJu0YxKVCyoNBRZs+dqyJRKevb0jJGwSyLA5CMxaNEPIDp/Lg6WZvhj
	NQM6j6Qkz4hdCFyShB00+617W/S/5SIHhApsNpU/fMdriWzKhZfRCEmp0CBtnWc=
X-Google-Smtp-Source: AGHT+IFojJtbBA7n99nPrVY+xntXWkLZS3SZDBpXDq21nzUN1RbLsMOWEgz+7t+o4Zu6RIAB+RTWZw==
X-Received: by 2002:a05:6a00:b42:b0:714:2069:d90e with SMTP id d2e1a72fcca58-718d5f0839amr12084718b3a.26.1725819021981;
        Sun, 08 Sep 2024 11:10:21 -0700 (PDT)
Received: from debian.tail629bbc.ts.net ([103.57.172.39])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-718e5896f19sm2278769b3a.32.2024.09.08.11.10.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Sep 2024 11:10:21 -0700 (PDT)
From: Sayyad Abid <sayyad.abid16@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	sayyad.abid16@gmail.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: rtl8723bs: Fix tabs for indent and + in comment blocks
Date: Sun,  8 Sep 2024 23:39:03 +0530
Message-Id: <20240908180902.3196764-1-sayyad.abid16@gmail.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch fixes the use of space instead of tabs,
removes trailing space and adds "+" each line in a comment block.

Signed-off-by: Sayyad Abid <sayyad.abid16@gmail.com>
---
 .../staging/rtl8723bs/include/hal_pwr_seq.h   | 46 +++++++++----------
 1 file changed, 23 insertions(+), 23 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/hal_pwr_seq.h b/drivers/staging/rtl8723bs/include/hal_pwr_seq.h
index 5e43cc89f535..10fef1b3f393 100644
--- a/drivers/staging/rtl8723bs/include/hal_pwr_seq.h
+++ b/drivers/staging/rtl8723bs/include/hal_pwr_seq.h
@@ -5,26 +5,26 @@
 #include "HalPwrSeqCmd.h"

 /*
-	Check document WM-20130815-JackieLau-RTL8723B_Power_Architecture v08.vsd
-	There are 6 HW Power States:
-	0: POFF--Power Off
-	1: PDN--Power Down
-	2: CARDEMU--Card Emulation
-	3: ACT--Active Mode
-	4: LPS--Low Power State
-	5: SUS--Suspend
-
-	The transition from different states are defined below
-	TRANS_CARDEMU_TO_ACT
-	TRANS_ACT_TO_CARDEMU
-	TRANS_CARDEMU_TO_SUS
-	TRANS_SUS_TO_CARDEMU
-	TRANS_CARDEMU_TO_PDN
-	TRANS_ACT_TO_LPS
-	TRANS_LPS_TO_ACT
-
-	TRANS_END
-*/
+ *	Check document WM-20130815-JackieLau-RTL8723B_Power_Architecture v08.vsd
+ *	There are 6 HW Power States:
+ *	0: POFF--Power Off
+ *	1: PDN--Power Down
+ *	2: CARDEMU--Card Emulation
+ *	3: ACT--Active Mode
+ *	4: LPS--Low Power State
+ *	5: SUS--Suspend
+ *
+ *	The transition from different states are defined below
+ *	TRANS_CARDEMU_TO_ACT
+ *	TRANS_ACT_TO_CARDEMU
+ *	TRANS_CARDEMU_TO_SUS
+ *	TRANS_SUS_TO_CARDEMU
+ *	TRANS_CARDEMU_TO_PDN
+ *	TRANS_ACT_TO_LPS
+ *	TRANS_LPS_TO_ACT
+ *
+ *	TRANS_END
+ */
 #define	RTL8723B_TRANS_CARDEMU_TO_ACT_STEPS	26
 #define	RTL8723B_TRANS_ACT_TO_CARDEMU_STEPS	15
 #define	RTL8723B_TRANS_CARDEMU_TO_SUS_STEPS	15
@@ -101,7 +101,7 @@
 	{0x0007, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_SDIO_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, 0xFF, 0x20}, /*0x07 = 0x20 , SOP option to disable BG/MB*/	\
 	{0x0005, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_USB_MSK|PWR_INTF_SDIO_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT3|BIT4, BIT3}, /*0x04[12:11] = 2b'01 enable WL suspend*/	\
 	{0x0005, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_PCI_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT2, BIT2}, /*0x04[10] = 1, enable SW LPS*/	\
-        {0x004A, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_USB_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT0, 1}, /*0x48[16] = 1 to enable GPIO9 as EXT WAKEUP*/   \
+	{0x004A, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_USB_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT0, 1}, /*0x48[16] = 1 to enable GPIO9 as EXT WAKEUP*/   \
 	{0x0023, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_SDIO_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT4, BIT4}, /*0x23[4] = 1b'1 12H LDO enter sleep mode*/   \
 	{0x0086, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_SDIO_MSK, PWR_BASEADDR_SDIO, PWR_CMD_WRITE, BIT0, BIT0}, /*Set SDIO suspend local register*/	\
 	{0x0086, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_SDIO_MSK, PWR_BASEADDR_SDIO, PWR_CMD_POLLING, BIT1, 0}, /*wait power state to suspend*/
@@ -112,7 +112,7 @@
 	{0x0005, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_ALL_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT3 | BIT7, 0}, /*clear suspend enable and power down enable*/	\
 	{0x0086, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_SDIO_MSK, PWR_BASEADDR_SDIO, PWR_CMD_WRITE, BIT0, 0}, /*Set SDIO suspend local register*/	\
 	{0x0086, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_SDIO_MSK, PWR_BASEADDR_SDIO, PWR_CMD_POLLING, BIT1, BIT1}, /*wait power state to suspend*/\
-        {0x004A, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_USB_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT0, 0}, /*0x48[16] = 0 to disable GPIO9 as EXT WAKEUP*/   \
+	{0x004A, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_USB_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT0, 0}, /*0x48[16] = 0 to disable GPIO9 as EXT WAKEUP*/   \
 	{0x0005, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_ALL_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT3|BIT4, 0}, /*0x04[12:11] = 2b'01enable WL suspend*/\
 	{0x0023, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_SDIO_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT4, 0}, /*0x23[4] = 1b'0 12H LDO enter normal mode*/   \
 	{0x0301, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_PCI_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, 0xFF, 0},/*PCIe DMA start*/
@@ -209,7 +209,7 @@
 #define RTL8723B_TRANS_END															\
 	/* format */																\
 	/* { offset, cut_msk, fab_msk|interface_msk, base|cmd, msk, value }, comments here*/								\
-	{0xFFFF, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_ALL_MSK, 0, PWR_CMD_END, 0, 0},
+	{0xFFFF, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_ALL_MSK, 0, PWR_CMD_END, 0, 0},


 extern struct wlan_pwr_cfg rtl8723B_power_on_flow[RTL8723B_TRANS_CARDEMU_TO_ACT_STEPS+RTL8723B_TRANS_END_STEPS];
--
2.39.2

