Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9968B7B
	for <linux-staging@lists.linux.dev>; Thu, 14 Apr 2022 08:39:11 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id bg10so8687162ejb.4
        for <linux-staging@lists.linux.dev>; Thu, 14 Apr 2022 01:39:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SjWebb0xz2JlPboqiHF18jFOy9xu4u7Sl1Xjhzt8LEw=;
        b=gP4/hSeWQuS/g+Q7CqB/kF5+oipUEMvVVqp8MLHg1J9F9iKPwR2vS6Xda2MWovTVA9
         nyov1stL3UHsRhvCGJTTh3/1zAqQtHMd45Z3pRLHR2jTEDqXX1WQKr94+bbrKLmVAdO2
         DmTDZl/TMIdWNd0MumK5IAZHB2ArAQZmwDwxhfDVPzzWpFggSD9ky7fDcTpueHeY3B5A
         b+lYtLDS1XXLEVON8pAPL+7XS5ZtJimTD0wMKJL+fNUNwPA9F2ZK/rIy4S1kA6vbA5OE
         6dpGBZ3Kzbx8vitV669+USDbw9W1CNMbw5gm4rjAr2VhNX9tfhRRxt+hpdRzVjFogH+m
         djoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SjWebb0xz2JlPboqiHF18jFOy9xu4u7Sl1Xjhzt8LEw=;
        b=C00MeSJnSUTcobB+ccWdoqyBCSm4OlWYinCCpMGTMa/a3fovoCXbPuRBNpBtTMdxh3
         PPpKKO7rVqzTRtpGJFk4+8niq2D07bh+wrKDAH4f33d3PJ2Nhc8IuLAlxUD2xf70SriV
         PyOtdXQ3m4odDoa/nPW77N1fe0m/BdOIIV7IQj/pDcdTeAWD3g2g+4xTjkHKWEgG7wAC
         YbC117vXJEtf1vjoBQ60n9BcBdOUVm6HAY+i6+lxov4wkOaK5rAXU12Jsbvn/Wb517Z2
         9Wfzwec5lhYrjEmfxM9XcN/hqOzJPDCwishAUScfRVdFiBSAwKD2iCsp4Hx6cWqKOdEr
         YlAQ==
X-Gm-Message-State: AOAM532hHtuxyV9gVT8ts5eWU8DNZT4ESmhW8igBO9ssbvulJuzXz+Sf
	O3zyzS0E5j4UjE1qOLc2Bsw=
X-Google-Smtp-Source: ABdhPJxAErEv6I5kwWbRoynQtPMycoHXJfZsxujVKDmp2ouG2mnaosUahQhIU+lmF+W/N036r7s/GQ==
X-Received: by 2002:a17:907:9702:b0:6e8:be82:f43d with SMTP id jg2-20020a170907970200b006e8be82f43dmr1388679ejc.67.1649925549935;
        Thu, 14 Apr 2022 01:39:09 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abb6b.dynamic.kabel-deutschland.de. [95.90.187.107])
        by smtp.gmail.com with ESMTPSA id ah13-20020a1709069acd00b006e8a0b3e071sm418138ejc.110.2022.04.14.01.39.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Apr 2022 01:39:09 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 2/7] staging: r8188eu: clean up comments in struct rt_firmware_hdr
Date: Thu, 14 Apr 2022 10:38:48 +0200
Message-Id: <20220414083853.3422-3-straube.linux@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220414083853.3422-1-straube.linux@gmail.com>
References: <20220414083853.3422-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The comments in struct rt_firmware_hdr are not needed.
Remove them.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_fw.c | 37 ++++++++-------------------
 1 file changed, 11 insertions(+), 26 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_fw.c b/drivers/staging/r8188eu/core/rtw_fw.c
index 7cd08268f3b9..323e0c634c4e 100644
--- a/drivers/staging/r8188eu/core/rtw_fw.c
+++ b/drivers/staging/r8188eu/core/rtw_fw.c
@@ -14,37 +14,22 @@
 	(le16_to_cpu(_fwhdr->Signature) & 0xFFF0) == 0x2300 ||	\
 	(le16_to_cpu(_fwhdr->Signature) & 0xFFF0) == 0x88E0)
 
-/*  This structure must be careful with byte-ordering */
-
 struct rt_firmware_hdr {
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
+	__le16		Signature;
+	u8		Category;
+	u8		Function;
+	__le16		Version;
+	u8		Subversion;
 	u8		Rsvd1;
-
-	/*  LONG WORD 1 ---- */
-	u8		Month;	/*  Release time Month field */
-	u8		Date;	/*  Release time Date field */
-	u8		Hour;	/*  Release time Hour field */
-	u8		Minute;	/*  Release time Minute field */
-	__le16		RamCodeSize;	/*  The size of RAM code */
+	u8		Month;
+	u8		Date;
+	u8		Hour;
+	u8		Minute;
+	__le16		RamCodeSize;
 	u8		Foundry;
 	u8		Rsvd2;
-
-	/*  LONG WORD 2 ---- */
-	__le32		SvnIdx;	/*  The SVN entry index */
+	__le32		SvnIdx;
 	__le32		Rsvd3;
-
-	/*  LONG WORD 3 ---- */
 	__le32		Rsvd4;
 	__le32		Rsvd5;
 };
-- 
2.35.1

