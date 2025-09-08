Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C720BA42
	for <linux-staging@lists.linux.dev>; Mon,  8 Sep 2025 06:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757311988; cv=none; b=Obm26rgvCnO78p+AHng4lc3yHNZ9Av+2Lrv6F5ik0/nSnobyjyiUNfcpKE2aINNURm3HTn8t7J1UJCy98Twxb/0E53/XpnD5dSUqzHlWJUgxv3iCT8zd5MYV/rrEwP9vdMMnKUWfm/crunVQylxeTkWzSe75LOye7eziW5GwaOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757311988; c=relaxed/simple;
	bh=Qc4bsHVtegZZcT4Q9MAJ2Xhzn/hgV95X7DWU0v6B3Cc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GXViAiRHbeJnGsxdibVtdIk/pUB2xPL+AEhOjOf6Lke+27esqMAXbWyJXHU3RWeN7v2QMNvF5VOrMSNzfAWH9Hwp+t3TgKSXR2zGvoZp3OSgWFN9oW+N/r7RfUAD9W2Eay8QVNi2peK/O+6Q9r6T2a5YFhhuM4v4r8668oQu7FA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vhotw1xl; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vhotw1xl"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b04163fe08dso691221766b.3
        for <linux-staging@lists.linux.dev>; Sun, 07 Sep 2025 23:13:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757311984; x=1757916784; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZC8L7gwN/P+xK7g9ZrzjI62mr0TB4jFjFMHOdIX7NnE=;
        b=Vhotw1xlRuxsD2pXgtJnEDf1DY4uXEWyr73BIHdxHZWm9aRoQJ/c6/LawX8AE3PIL8
         SLEaaWswJs6r7YaVyEVE7ypKtJ+XtozCzRA53LQlsHnJmaPH+gXFzbQlEUciLGWvUJcZ
         137DxFfK6uZlrm+fTidVmC1wsggC0ep2f/es9aEPaVsD/NOTlwQL40U0Of74TAvsy21a
         DRM03+1xJ7sHMwbfYAPcrnbdRxLdIWCFnDgQlARnm8G3NQaFGa08vafXkEncAWkXDHaR
         yCZGuTW7mF0TnAWozfnppVUKG7HvZkjAfnXWfnFeAAqs0RdicUb7wII+lW2Idz1CLwAW
         K9sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757311984; x=1757916784;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZC8L7gwN/P+xK7g9ZrzjI62mr0TB4jFjFMHOdIX7NnE=;
        b=lNvD4Msa5gl60UI3QsHWLvQjVSQQXnSBrlK5srLL2u1SzTUqPJ2/wEcWTvKwrym6NF
         +mXqP+fCboKDBIl0lNeTExXs6VNk9GcY5qwb8K91IYMrg4qD0TNIVLCr2OvbM8aNTta0
         WAGE0xrpuS1zmDD6CdxvVqLz8qnB88XAzrtGKSJ8JxIpMIXRdtKVFXE+sQcIAV5/BSgg
         C36DagCIfJ7f7MhKoiBJMF0CvQ3+m0v7jNItJeCMqVW/SPJZ6h0rUdlLBsQ38TL9x4wA
         lSjRHic9tgIACt3XKROvUtNAbgoriV2RefzAImk7wfeAbjdSrbMtAyQGsH3aKNW6ojAo
         iqfQ==
X-Forwarded-Encrypted: i=1; AJvYcCXIUm/OGuPsnK68T26Ect2gWgJoxSA5Wva0aQRmrpaOCRzU/cEieEvbQFWIN4+P5RA748tSE/HPkTXN9Qgu@lists.linux.dev
X-Gm-Message-State: AOJu0YxH73lZuY3h0GUbctAXwHTfnuV+xByQIqfDd1QP8C7jVHcfQAum
	dT9NiVyjWwuiw6M84EZoPgAZeSPLHaYPs5wAI+r/XO+7kWy88vNSnBNF
X-Gm-Gg: ASbGncsEM50gRvF/Jf1y2tquSblBhKvCI241tZLydfUAJs4Jlbc02gaVT+HV2+KaTBn
	ooC2PP2BNFratzF+Q9JC9hg6eILgdTOt0yYChSLBkEpHoQ/12JIYnaxR2AdqdJs9d1kH4lQwSI4
	uqKsym87x+KDQ2HzkEsiki8N0aM7R9LqrAM/nz5ffq6SQdk2Fc1FP/93ofADd5zbUwQehcBNB2/
	n3z3l2q8dt5WI/aQVeNk23sHtIy8Yr6Zme58WrIPvbNY9xF+3E5g9IT56ehIJ+fqEiwBkmpwPMS
	dXu3jCBJcX0D5ZqYaLANz2R9FnABu9VwZokz+jLJ8HlYt45UbxtXPUQiR7n2IvI5KamGaqauALo
	SQPezt6zXr3O3tsSxhoBLK6nzN9lozmZT80ijSEvxfz3o8nYm6F1JneI=
X-Google-Smtp-Source: AGHT+IGjyv2g0Hoy+GpwpNntbrskFyIXfjwG34HMBREFvxg8rJ4IkZOlj/srXH4ccqbTT/+w7h/eiA==
X-Received: by 2002:a17:907:c14:b0:b04:3513:5138 with SMTP id a640c23a62f3a-b04b154786bmr714144466b.41.1757311983317;
        Sun, 07 Sep 2025 23:13:03 -0700 (PDT)
Received: from tumbleweed (ip-77-25-33-28.web.vodafone.de. [77.25.33.28])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6234c677dbdsm4870248a12.50.2025.09.07.23.13.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Sep 2025 23:13:02 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH] staging: rtl8723bs: remove unused tables
Date: Mon,  8 Sep 2025 08:12:43 +0200
Message-ID: <20250908061243.62692-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove some unused tabels to get rid of dead code and thereby reduce the
object file size by more than 1400 bytes.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/rtl8723bs/hal/odm.c | 152 ----------------------------
 drivers/staging/rtl8723bs/hal/odm.h |   6 --
 2 files changed, 158 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/odm.c b/drivers/staging/rtl8723bs/hal/odm.c
index ba85efb30db2..4b36af47f680 100644
--- a/drivers/staging/rtl8723bs/hal/odm.c
+++ b/drivers/staging/rtl8723bs/hal/odm.c
@@ -9,118 +9,6 @@
 
 /*  Global var */
 
-u32 OFDMSwingTable[OFDM_TABLE_SIZE] = {
-	0x7f8001fe, /*  0, +6.0dB */
-	0x788001e2, /*  1, +5.5dB */
-	0x71c001c7, /*  2, +5.0dB */
-	0x6b8001ae, /*  3, +4.5dB */
-	0x65400195, /*  4, +4.0dB */
-	0x5fc0017f, /*  5, +3.5dB */
-	0x5a400169, /*  6, +3.0dB */
-	0x55400155, /*  7, +2.5dB */
-	0x50800142, /*  8, +2.0dB */
-	0x4c000130, /*  9, +1.5dB */
-	0x47c0011f, /*  10, +1.0dB */
-	0x43c0010f, /*  11, +0.5dB */
-	0x40000100, /*  12, +0dB */
-	0x3c8000f2, /*  13, -0.5dB */
-	0x390000e4, /*  14, -1.0dB */
-	0x35c000d7, /*  15, -1.5dB */
-	0x32c000cb, /*  16, -2.0dB */
-	0x300000c0, /*  17, -2.5dB */
-	0x2d4000b5, /*  18, -3.0dB */
-	0x2ac000ab, /*  19, -3.5dB */
-	0x288000a2, /*  20, -4.0dB */
-	0x26000098, /*  21, -4.5dB */
-	0x24000090, /*  22, -5.0dB */
-	0x22000088, /*  23, -5.5dB */
-	0x20000080, /*  24, -6.0dB */
-	0x1e400079, /*  25, -6.5dB */
-	0x1c800072, /*  26, -7.0dB */
-	0x1b00006c, /*  27. -7.5dB */
-	0x19800066, /*  28, -8.0dB */
-	0x18000060, /*  29, -8.5dB */
-	0x16c0005b, /*  30, -9.0dB */
-	0x15800056, /*  31, -9.5dB */
-	0x14400051, /*  32, -10.0dB */
-	0x1300004c, /*  33, -10.5dB */
-	0x12000048, /*  34, -11.0dB */
-	0x11000044, /*  35, -11.5dB */
-	0x10000040, /*  36, -12.0dB */
-};
-
-u8 CCKSwingTable_Ch1_Ch13[CCK_TABLE_SIZE][8] = {
-	{0x36, 0x35, 0x2e, 0x25, 0x1c, 0x12, 0x09, 0x04}, /*  0, +0dB */
-	{0x33, 0x32, 0x2b, 0x23, 0x1a, 0x11, 0x08, 0x04}, /*  1, -0.5dB */
-	{0x30, 0x2f, 0x29, 0x21, 0x19, 0x10, 0x08, 0x03}, /*  2, -1.0dB */
-	{0x2d, 0x2d, 0x27, 0x1f, 0x18, 0x0f, 0x08, 0x03}, /*  3, -1.5dB */
-	{0x2b, 0x2a, 0x25, 0x1e, 0x16, 0x0e, 0x07, 0x03}, /*  4, -2.0dB */
-	{0x28, 0x28, 0x22, 0x1c, 0x15, 0x0d, 0x07, 0x03}, /*  5, -2.5dB */
-	{0x26, 0x25, 0x21, 0x1b, 0x14, 0x0d, 0x06, 0x03}, /*  6, -3.0dB */
-	{0x24, 0x23, 0x1f, 0x19, 0x13, 0x0c, 0x06, 0x03}, /*  7, -3.5dB */
-	{0x22, 0x21, 0x1d, 0x18, 0x11, 0x0b, 0x06, 0x02}, /*  8, -4.0dB */
-	{0x20, 0x20, 0x1b, 0x16, 0x11, 0x08, 0x05, 0x02}, /*  9, -4.5dB */
-	{0x1f, 0x1e, 0x1a, 0x15, 0x10, 0x0a, 0x05, 0x02}, /*  10, -5.0dB */
-	{0x1d, 0x1c, 0x18, 0x14, 0x0f, 0x0a, 0x05, 0x02}, /*  11, -5.5dB */
-	{0x1b, 0x1a, 0x17, 0x13, 0x0e, 0x09, 0x04, 0x02}, /*  12, -6.0dB <== default */
-	{0x1a, 0x19, 0x16, 0x12, 0x0d, 0x09, 0x04, 0x02}, /*  13, -6.5dB */
-	{0x18, 0x17, 0x15, 0x11, 0x0c, 0x08, 0x04, 0x02}, /*  14, -7.0dB */
-	{0x17, 0x16, 0x13, 0x10, 0x0c, 0x08, 0x04, 0x02}, /*  15, -7.5dB */
-	{0x16, 0x15, 0x12, 0x0f, 0x0b, 0x07, 0x04, 0x01}, /*  16, -8.0dB */
-	{0x14, 0x14, 0x11, 0x0e, 0x0b, 0x07, 0x03, 0x02}, /*  17, -8.5dB */
-	{0x13, 0x13, 0x10, 0x0d, 0x0a, 0x06, 0x03, 0x01}, /*  18, -9.0dB */
-	{0x12, 0x12, 0x0f, 0x0c, 0x09, 0x06, 0x03, 0x01}, /*  19, -9.5dB */
-	{0x11, 0x11, 0x0f, 0x0c, 0x09, 0x06, 0x03, 0x01}, /*  20, -10.0dB */
-	{0x10, 0x10, 0x0e, 0x0b, 0x08, 0x05, 0x03, 0x01}, /*  21, -10.5dB */
-	{0x0f, 0x0f, 0x0d, 0x0b, 0x08, 0x05, 0x03, 0x01}, /*  22, -11.0dB */
-	{0x0e, 0x0e, 0x0c, 0x0a, 0x08, 0x05, 0x02, 0x01}, /*  23, -11.5dB */
-	{0x0d, 0x0d, 0x0c, 0x0a, 0x07, 0x05, 0x02, 0x01}, /*  24, -12.0dB */
-	{0x0d, 0x0c, 0x0b, 0x09, 0x07, 0x04, 0x02, 0x01}, /*  25, -12.5dB */
-	{0x0c, 0x0c, 0x0a, 0x09, 0x06, 0x04, 0x02, 0x01}, /*  26, -13.0dB */
-	{0x0b, 0x0b, 0x0a, 0x08, 0x06, 0x04, 0x02, 0x01}, /*  27, -13.5dB */
-	{0x0b, 0x0a, 0x09, 0x08, 0x06, 0x04, 0x02, 0x01}, /*  28, -14.0dB */
-	{0x0a, 0x0a, 0x09, 0x07, 0x05, 0x03, 0x02, 0x01}, /*  29, -14.5dB */
-	{0x0a, 0x09, 0x08, 0x07, 0x05, 0x03, 0x02, 0x01}, /*  30, -15.0dB */
-	{0x09, 0x09, 0x08, 0x06, 0x05, 0x03, 0x01, 0x01}, /*  31, -15.5dB */
-	{0x09, 0x08, 0x07, 0x06, 0x04, 0x03, 0x01, 0x01}	/*  32, -16.0dB */
-};
-
-u8 CCKSwingTable_Ch14[CCK_TABLE_SIZE][8] = {
-	{0x36, 0x35, 0x2e, 0x1b, 0x00, 0x00, 0x00, 0x00}, /*  0, +0dB */
-	{0x33, 0x32, 0x2b, 0x19, 0x00, 0x00, 0x00, 0x00}, /*  1, -0.5dB */
-	{0x30, 0x2f, 0x29, 0x18, 0x00, 0x00, 0x00, 0x00}, /*  2, -1.0dB */
-	{0x2d, 0x2d, 0x17, 0x17, 0x00, 0x00, 0x00, 0x00}, /*  3, -1.5dB */
-	{0x2b, 0x2a, 0x25, 0x15, 0x00, 0x00, 0x00, 0x00}, /*  4, -2.0dB */
-	{0x28, 0x28, 0x24, 0x14, 0x00, 0x00, 0x00, 0x00}, /*  5, -2.5dB */
-	{0x26, 0x25, 0x21, 0x13, 0x00, 0x00, 0x00, 0x00}, /*  6, -3.0dB */
-	{0x24, 0x23, 0x1f, 0x12, 0x00, 0x00, 0x00, 0x00}, /*  7, -3.5dB */
-	{0x22, 0x21, 0x1d, 0x11, 0x00, 0x00, 0x00, 0x00}, /*  8, -4.0dB */
-	{0x20, 0x20, 0x1b, 0x10, 0x00, 0x00, 0x00, 0x00}, /*  9, -4.5dB */
-	{0x1f, 0x1e, 0x1a, 0x0f, 0x00, 0x00, 0x00, 0x00}, /*  10, -5.0dB */
-	{0x1d, 0x1c, 0x18, 0x0e, 0x00, 0x00, 0x00, 0x00}, /*  11, -5.5dB */
-	{0x1b, 0x1a, 0x17, 0x0e, 0x00, 0x00, 0x00, 0x00}, /*  12, -6.0dB  <== default */
-	{0x1a, 0x19, 0x16, 0x0d, 0x00, 0x00, 0x00, 0x00}, /*  13, -6.5dB */
-	{0x18, 0x17, 0x15, 0x0c, 0x00, 0x00, 0x00, 0x00}, /*  14, -7.0dB */
-	{0x17, 0x16, 0x13, 0x0b, 0x00, 0x00, 0x00, 0x00}, /*  15, -7.5dB */
-	{0x16, 0x15, 0x12, 0x0b, 0x00, 0x00, 0x00, 0x00}, /*  16, -8.0dB */
-	{0x14, 0x14, 0x11, 0x0a, 0x00, 0x00, 0x00, 0x00}, /*  17, -8.5dB */
-	{0x13, 0x13, 0x10, 0x0a, 0x00, 0x00, 0x00, 0x00}, /*  18, -9.0dB */
-	{0x12, 0x12, 0x0f, 0x09, 0x00, 0x00, 0x00, 0x00}, /*  19, -9.5dB */
-	{0x11, 0x11, 0x0f, 0x09, 0x00, 0x00, 0x00, 0x00}, /*  20, -10.0dB */
-	{0x10, 0x10, 0x0e, 0x08, 0x00, 0x00, 0x00, 0x00}, /*  21, -10.5dB */
-	{0x0f, 0x0f, 0x0d, 0x08, 0x00, 0x00, 0x00, 0x00}, /*  22, -11.0dB */
-	{0x0e, 0x0e, 0x0c, 0x07, 0x00, 0x00, 0x00, 0x00}, /*  23, -11.5dB */
-	{0x0d, 0x0d, 0x0c, 0x07, 0x00, 0x00, 0x00, 0x00}, /*  24, -12.0dB */
-	{0x0d, 0x0c, 0x0b, 0x06, 0x00, 0x00, 0x00, 0x00}, /*  25, -12.5dB */
-	{0x0c, 0x0c, 0x0a, 0x06, 0x00, 0x00, 0x00, 0x00}, /*  26, -13.0dB */
-	{0x0b, 0x0b, 0x0a, 0x06, 0x00, 0x00, 0x00, 0x00}, /*  27, -13.5dB */
-	{0x0b, 0x0a, 0x09, 0x05, 0x00, 0x00, 0x00, 0x00}, /*  28, -14.0dB */
-	{0x0a, 0x0a, 0x09, 0x05, 0x00, 0x00, 0x00, 0x00}, /*  29, -14.5dB */
-	{0x0a, 0x09, 0x08, 0x05, 0x00, 0x00, 0x00, 0x00}, /*  30, -15.0dB */
-	{0x09, 0x09, 0x08, 0x05, 0x00, 0x00, 0x00, 0x00}, /*  31, -15.5dB */
-	{0x09, 0x08, 0x07, 0x04, 0x00, 0x00, 0x00, 0x00}	/*  32, -16.0dB */
-};
-
 u32 OFDMSwingTable_New[OFDM_TABLE_SIZE] = {
 	0x0b40002d, /*  0,  -15.0dB */
 	0x0c000030, /*  1,  -14.5dB */
@@ -239,46 +127,6 @@ u8 CCKSwingTable_Ch14_New[CCK_TABLE_SIZE][8] = {
 	{0x36, 0x35, 0x2e, 0x1b, 0x00, 0x00, 0x00, 0x00}	/*  32, +0dB */
 };
 
-u32 TxScalingTable_Jaguar[TXSCALE_TABLE_SIZE] = {
-	0x081, /*  0,  -12.0dB */
-	0x088, /*  1,  -11.5dB */
-	0x090, /*  2,  -11.0dB */
-	0x099, /*  3,  -10.5dB */
-	0x0A2, /*  4,  -10.0dB */
-	0x0AC, /*  5,  -9.5dB */
-	0x0B6, /*  6,  -9.0dB */
-	0x0C0, /*  7,  -8.5dB */
-	0x0CC, /*  8,  -8.0dB */
-	0x0D8, /*  9,  -7.5dB */
-	0x0E5, /*  10, -7.0dB */
-	0x0F2, /*  11, -6.5dB */
-	0x101, /*  12, -6.0dB */
-	0x110, /*  13, -5.5dB */
-	0x120, /*  14, -5.0dB */
-	0x131, /*  15, -4.5dB */
-	0x143, /*  16, -4.0dB */
-	0x156, /*  17, -3.5dB */
-	0x16A, /*  18, -3.0dB */
-	0x180, /*  19, -2.5dB */
-	0x197, /*  20, -2.0dB */
-	0x1AF, /*  21, -1.5dB */
-	0x1C8, /*  22, -1.0dB */
-	0x1E3, /*  23, -0.5dB */
-	0x200, /*  24, +0  dB */
-	0x21E, /*  25, +0.5dB */
-	0x23E, /*  26, +1.0dB */
-	0x261, /*  27, +1.5dB */
-	0x285, /*  28, +2.0dB */
-	0x2AB, /*  29, +2.5dB */
-	0x2D3, /*  30, +3.0dB */
-	0x2FE, /*  31, +3.5dB */
-	0x32B, /*  32, +4.0dB */
-	0x35C, /*  33, +4.5dB */
-	0x38E, /*  34, +5.0dB */
-	0x3C4, /*  35, +5.5dB */
-	0x3FE  /*  36, +6.0dB */
-};
-
 /* Remove Edca by Yu Chen */
 
 static void odm_CommonInfoSelfInit(struct dm_odm_t *pDM_Odm)
diff --git a/drivers/staging/rtl8723bs/hal/odm.h b/drivers/staging/rtl8723bs/hal/odm.h
index 010274ba8079..1c929d88e596 100644
--- a/drivers/staging/rtl8723bs/hal/odm.h
+++ b/drivers/staging/rtl8723bs/hal/odm.h
@@ -1080,16 +1080,10 @@ enum { /* tag_RF_Type_Definition */
 /*  */
 /*  Extern Global Variables. */
 /*  */
-extern	u32 OFDMSwingTable[OFDM_TABLE_SIZE];
-extern	u8 CCKSwingTable_Ch1_Ch13[CCK_TABLE_SIZE][8];
-extern	u8 CCKSwingTable_Ch14[CCK_TABLE_SIZE][8];
-
 extern	u32 OFDMSwingTable_New[OFDM_TABLE_SIZE];
 extern	u8 CCKSwingTable_Ch1_Ch13_New[CCK_TABLE_SIZE][8];
 extern	u8 CCKSwingTable_Ch14_New[CCK_TABLE_SIZE][8];
 
-extern  u32 TxScalingTable_Jaguar[TXSCALE_TABLE_SIZE];
-
 /*  */
 /*  check Sta pointer valid or not */
 /*  */
-- 
2.51.0

