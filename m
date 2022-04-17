Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B10A2567
	for <linux-staging@lists.linux.dev>; Sun, 17 Apr 2022 17:54:52 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id l7so23561555ejn.2
        for <linux-staging@lists.linux.dev>; Sun, 17 Apr 2022 10:54:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kkM9doiA/i7FmCkoWkaNp3fDJvZEfu53FAG4JMLkpr4=;
        b=RtG8TW745DqgPExo3dLdT274i4DPwhvzS6YADILJsm7uTpZLHqKUoKfyCBArXBD9Tk
         ZTM/U4QTwmQa6Fw+KTYKGLB8uEC41qoS4ZmY8mKXmmOGDO9Zw/s+z2RVAmI7QtVCwTiA
         Ra5O+ASfyv10lkvKOEMtoT5mj4TuSi0mfX3vOdnco50gf6bhQpGKoFZjIQZQ+RFE5LtX
         1YpYMM/r8JPNiCrRhvDv2GGtQwHCDM1XbhJ+bHrlPLqgrb4+GA/MrWG9wHJ8r8X6k/Vt
         TgkjNPf7deXW1c49vxFXbcETDdz3Zu+p9vXZmqakrJNFd6iiUciyU5McCiNsdWgNixNt
         KCOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kkM9doiA/i7FmCkoWkaNp3fDJvZEfu53FAG4JMLkpr4=;
        b=jHLu6+Lsng58Bn3NWMej7GKFxWN0FEFBKHOv0AjjynoWVU+WZdKzZsykV5uTF1pBii
         vm43P4JqhrR95b4FAMw1UvTxKYfjbi6onmJMyecma13S3BJ2mblzjUhLcgRiRtflRdHh
         le5h6aXnNRvd2GL5CjS0UkDBdxN5vZUU2y4whrOba7RqIoCwBwDhZF0MfCXSb4PsTNtZ
         scIOSPLi8ztRtDivsMM4MAYEkGC4jB81LeYoZSXL7YA1HkfM3cYUZ7BOARVTQsf/U5UR
         FEhC8OV4y4xVtDVwOix/eRKVWUX6XkY3aAqIQu9IIjx0gEPwrl90I2xnRv7qctdo0RQj
         o5/Q==
X-Gm-Message-State: AOAM5313LAcKVS5hbZM96548qljPbypTsVTACDthiHpAfyWN+G4XEvK5
	aA4UGQaMa6FpIMwz6AwuOtg=
X-Google-Smtp-Source: ABdhPJzB8V3WpMAzb62sj1vfrrDR4r0Prc0w9mfdMeUWGpI6008RYHpAgn1+pXQoM3Fu0fdY3kEl0w==
X-Received: by 2002:a17:906:3c10:b0:6e8:9e25:5156 with SMTP id h16-20020a1709063c1000b006e89e255156mr6473926ejg.703.1650218090694;
        Sun, 17 Apr 2022 10:54:50 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abba5.dynamic.kabel-deutschland.de. [95.90.187.165])
        by smtp.gmail.com with ESMTPSA id jw12-20020a17090776ac00b006e87137194esm3719409ejc.150.2022.04.17.10.54.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Apr 2022 10:54:50 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH v4 4/8] staging: r8188eu: rename fields of struct rt_firmware_hdr
Date: Sun, 17 Apr 2022 19:54:37 +0200
Message-Id: <20220417175441.13830-5-straube.linux@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220417175441.13830-1-straube.linux@gmail.com>
References: <20220417175441.13830-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename the fields of struct rt_firmware_hdr to avoid camel case.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
v4:
- no changes

v3:
- no changes

v2:
- no changes

 drivers/staging/r8188eu/core/rtw_fw.c | 58 +++++++++++++--------------
 1 file changed, 29 insertions(+), 29 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_fw.c b/drivers/staging/r8188eu/core/rtw_fw.c
index 0fa27b36bb8e..a80cc7fa3a53 100644
--- a/drivers/staging/r8188eu/core/rtw_fw.c
+++ b/drivers/staging/r8188eu/core/rtw_fw.c
@@ -9,34 +9,34 @@
 #define MAX_PAGE_SIZE		4096
 
 #define IS_FW_HEADER_EXIST(_fwhdr)				\
-	((le16_to_cpu(_fwhdr->Signature) & 0xFFF0) == 0x92C0 ||	\
-	(le16_to_cpu(_fwhdr->Signature) & 0xFFF0) == 0x88C0 ||	\
-	(le16_to_cpu(_fwhdr->Signature) & 0xFFF0) == 0x2300 ||	\
-	(le16_to_cpu(_fwhdr->Signature) & 0xFFF0) == 0x88E0)
+	((le16_to_cpu(_fwhdr->signature) & 0xFFF0) == 0x92C0 ||	\
+	(le16_to_cpu(_fwhdr->signature) & 0xFFF0) == 0x88C0 ||	\
+	(le16_to_cpu(_fwhdr->signature) & 0xFFF0) == 0x2300 ||	\
+	(le16_to_cpu(_fwhdr->signature) & 0xFFF0) == 0x88E0)
 
 struct rt_firmware_hdr {
-	__le16		Signature;	/* 92C0: test chip; 92C,
-					 * 88C0: test chip; 88C1: MP A-cut;
-					 * 92C1: MP A-cut */
-	u8		Category;	/* AP/NIC and USB/PCI */
-	u8		Function;	/* Reserved for different FW function
-					 * indcation, for further use when
-					 * driver needs to download different
-					 * FW for different conditions */
-	__le16		Version;	/* FW Version */
-	u8		Subversion;	/* FW Subversion, default 0x00 */
-	u8		Rsvd1;
-	u8		Month;		/* Release time Month field */
-	u8		Date;		/* Release time Date field */
-	u8		Hour;		/* Release time Hour field */
-	u8		Minute;		/* Release time Minute field */
-	__le16		RamCodeSize;	/* The size of RAM code */
-	u8		Foundry;
-	u8		Rsvd2;
-	__le32		SvnIdx;		/* The SVN entry index */
-	__le32		Rsvd3;
-	__le32		Rsvd4;
-	__le32		Rsvd5;
+	__le16	signature;	/* 92C0: test chip; 92C,
+				 * 88C0: test chip; 88C1: MP A-cut;
+				 * 92C1: MP A-cut */
+	u8	category;	/* AP/NIC and USB/PCI */
+	u8	function;	/* Reserved for different FW function
+				 * indcation, for further use when
+				 * driver needs to download different
+				 * FW for different conditions */
+	__le16	version;	/* FW Version */
+	u8	subversion;	/* FW Subversion, default 0x00 */
+	u8	rsvd1;
+	u8	month;		/* Release time Month field */
+	u8	date;		/* Release time Date field */
+	u8	hour;		/* Release time Hour field */
+	u8	minute;		/* Release time Minute field */
+	__le16	ramcodesize;	/* The size of RAM code */
+	u8	foundry;
+	u8	rsvd2;
+	__le32	svnidx;		/* The SVN entry index */
+	__le32	rsvd3;
+	__le32	rsvd4;
+	__le32	rsvd5;
 };
 
 static void fw_download_enable(struct adapter *padapter, bool enable)
@@ -259,9 +259,9 @@ int rtl8188e_firmware_download(struct adapter *padapter)
 	/*  To Check Fw header. Added by tynli. 2009.12.04. */
 	fwhdr = (struct rt_firmware_hdr *)dvobj->firmware.data;
 
-	fw_version = le16_to_cpu(fwhdr->Version);
-	fw_subversion = fwhdr->Subversion;
-	fw_signature = le16_to_cpu(fwhdr->Signature);
+	fw_version = le16_to_cpu(fwhdr->version);
+	fw_subversion = fwhdr->subversion;
+	fw_signature = le16_to_cpu(fwhdr->signature);
 
 	if (!log_version++)
 		pr_info("%sFirmware Version %d, SubVersion %d, Signature 0x%x\n",
-- 
2.35.1

