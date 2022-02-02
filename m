Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E2332F26
	for <linux-staging@lists.linux.dev>; Wed,  2 Feb 2022 07:51:00 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id p15so62547534ejc.7
        for <linux-staging@lists.linux.dev>; Tue, 01 Feb 2022 23:50:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CgyjgB4L9zvBx61NtaEHH+XoDxcJaqF6DRtq7Ip9h4Q=;
        b=R75EEj2nxwyPKSloD7O5XcU7ZaZHe35FB3tehqwhB5A+eaqfCZckFSjV+9m3n16BcL
         u/A43WBUpnTPj7L0bgZp8Mtxw6Q+y4dM8x42AQFqEcde6jYZ+PH9qmMElxZHDLz0ckAX
         93k+HyUvNpRe1Pg3lMhYWDv1wUbZ0Oz3gdxbSiuvMBj9mqyCfvGo1bf8XQkHBSCPsaqF
         cqrtTBDCHOuNztM1GwTKhJ1ub7W0rWtbe5JxBNM62CZV8of3nkHLExY7qUBdC2N2hI38
         MNLPNPeVvhSN833RaeSkYpHgATxLfEbVKM103TQnrwSil+/lfjkboTueKkyNhxOiHJSg
         ZRqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CgyjgB4L9zvBx61NtaEHH+XoDxcJaqF6DRtq7Ip9h4Q=;
        b=wc0g2D2MYSDE5uoN5ArRXjDnKWdoHCtOHkxm61po5QPGDWRbhiDB/lpzW7jSK7vL7w
         Z4Z42AHfgRpilZzCfsCE3LbC7I8OaxX1IkcJHG7ndpda/ttf4IHaX4g/9paQzf7TC9au
         J5R8lkn2kITqwM4ls6ZxnglavlYc01GpF8BlaPBsryPPjPC7jBiL/as36Zpywj41qT/m
         R2WhhBQ7OGJmn9tRm/q619kOC0n/OQoAHD6NAmTy5XvTrqkIGe5bnhK8EEZf0g1Yy+7C
         jX33wuWOc45xMtAFO9kjjdS9p7X2L22YIpKD4lj6+pL0a4wOztdnRcz0Gq+qfT8KqJix
         c7vQ==
X-Gm-Message-State: AOAM531sk0KHumLJZbf9O4zlFxEBFKUKRgAu1gjXDYMMlr9eiymxCLTV
	tSczuvIboug5HMu2bo6BwM4=
X-Google-Smtp-Source: ABdhPJwqijHBykICxgf1RRVXDD4VV+z5w9QEVP6th+gogLNBO6C9aIT/cmLUU5Y90GlrPUQB4lL/8A==
X-Received: by 2002:a17:907:2d11:: with SMTP id gs17mr24662788ejc.189.1643788258331;
        Tue, 01 Feb 2022 23:50:58 -0800 (PST)
Received: from localhost.localdomain (ip5f5abb5a.dynamic.kabel-deutschland.de. [95.90.187.90])
        by smtp.gmail.com with ESMTPSA id w6sm6694673edd.50.2022.02.01.23.50.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Feb 2022 23:50:58 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH] staging: r8188eu: move struct rt_firmware_hdr to rtw_fw.h
Date: Wed,  2 Feb 2022 08:50:51 +0100
Message-Id: <20220202075051.21266-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The structure rt_firmware_hdr is firmware related. Move it to the
rtw_fw.h header.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 .../staging/r8188eu/include/rtl8188e_hal.h    | 35 -------------------
 drivers/staging/r8188eu/include/rtw_fw.h      | 35 +++++++++++++++++++
 2 files changed, 35 insertions(+), 35 deletions(-)

diff --git a/drivers/staging/r8188eu/include/rtl8188e_hal.h b/drivers/staging/r8188eu/include/rtl8188e_hal.h
index e3c028ff20c7..c323476f5936 100644
--- a/drivers/staging/r8188eu/include/rtl8188e_hal.h
+++ b/drivers/staging/r8188eu/include/rtl8188e_hal.h
@@ -34,41 +34,6 @@
 #define DRVINFO_SZ	4 /*  unit is 8bytes */
 #define PageNum_128(_Len)	(u32)(((_Len)>>7) + ((_Len) & 0x7F ? 1 : 0))
 
-/*  This structure must be careful with byte-ordering */
-
-struct rt_firmware_hdr {
-	/*  8-byte alinment required */
-	/*  LONG WORD 0 ---- */
-	__le16		Signature;	/* 92C0: test chip; 92C,
-					 * 88C0: test chip; 88C1: MP A-cut;
-					 * 92C1: MP A-cut */
-	u8		Category;	/*  AP/NIC and USB/PCI */
-	u8		Function;	/*  Reserved for different FW function
-					 *  indcation, for further use when
-					 *  driver needs to download different
-					 *  FW for different conditions */
-	__le16		Version;	/*  FW Version */
-	u8		Subversion;	/*  FW Subversion, default 0x00 */
-	u16		Rsvd1;
-
-	/*  LONG WORD 1 ---- */
-	u8		Month;	/*  Release time Month field */
-	u8		Date;	/*  Release time Date field */
-	u8		Hour;	/*  Release time Hour field */
-	u8		Minute;	/*  Release time Minute field */
-	__le16		RamCodeSize;	/*  The size of RAM code */
-	u8		Foundry;
-	u8		Rsvd2;
-
-	/*  LONG WORD 2 ---- */
-	__le32		SvnIdx;	/*  The SVN entry index */
-	u32		Rsvd3;
-
-	/*  LONG WORD 3 ---- */
-	u32		Rsvd4;
-	u32		Rsvd5;
-};
-
 #define DRIVER_EARLY_INT_TIME		0x05
 #define BCN_DMA_ATIME_INT_TIME		0x02
 
diff --git a/drivers/staging/r8188eu/include/rtw_fw.h b/drivers/staging/r8188eu/include/rtw_fw.h
index 9b7492ef0199..2ee9ae70a468 100644
--- a/drivers/staging/r8188eu/include/rtw_fw.h
+++ b/drivers/staging/r8188eu/include/rtw_fw.h
@@ -16,6 +16,41 @@
 	(le16_to_cpu(_fwhdr->Signature) & 0xFFF0) == 0x2300 ||	\
 	(le16_to_cpu(_fwhdr->Signature) & 0xFFF0) == 0x88E0)
 
+/*  This structure must be careful with byte-ordering */
+
+struct rt_firmware_hdr {
+	/*  8-byte alinment required */
+	/*  LONG WORD 0 ---- */
+	__le16		Signature;	/* 92C0: test chip; 92C,
+					 * 88C0: test chip; 88C1: MP A-cut;
+					 * 92C1: MP A-cut */
+	u8		Category;	/*  AP/NIC and USB/PCI */
+	u8		Function;	/*  Reserved for different FW function
+					 *  indcation, for further use when
+					 *  driver needs to download different
+					 *  FW for different conditions */
+	__le16		Version;	/*  FW Version */
+	u8		Subversion;	/*  FW Subversion, default 0x00 */
+	u16		Rsvd1;
+
+	/*  LONG WORD 1 ---- */
+	u8		Month;	/*  Release time Month field */
+	u8		Date;	/*  Release time Date field */
+	u8		Hour;	/*  Release time Hour field */
+	u8		Minute;	/*  Release time Minute field */
+	__le16		RamCodeSize;	/*  The size of RAM code */
+	u8		Foundry;
+	u8		Rsvd2;
+
+	/*  LONG WORD 2 ---- */
+	__le32		SvnIdx;	/*  The SVN entry index */
+	u32		Rsvd3;
+
+	/*  LONG WORD 3 ---- */
+	u32		Rsvd4;
+	u32		Rsvd5;
+};
+
 int rtl8188e_firmware_download(struct adapter *padapter);
 void rtw_reset_8051(struct adapter *padapter);
 
-- 
2.34.1

