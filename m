Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8ABD17D4
	for <linux-staging@lists.linux.dev>; Thu, 14 Apr 2022 10:43:49 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id g20so5799185edw.6
        for <linux-staging@lists.linux.dev>; Thu, 14 Apr 2022 03:43:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SjWebb0xz2JlPboqiHF18jFOy9xu4u7Sl1Xjhzt8LEw=;
        b=fQu9zVhyLfSvkDTiVKK35W3kogpJHHy8JcRjdvY7yUh85D1JHhkyeWvqrBnKjAVAwR
         hXERnHr8RPNFs2iKyRJ9cO+jGHB67q6bNMfUOU5sYYI5r3Rre8eC9cp1p6L/wGKMcIDN
         FSlB3P/RIRODBtayPyIqYDT1IqKwlFjHuvYAUOFBsZHDJ3Z3xye+wLsf+Vlsgoa2+QV7
         siw3OFi7YgGzHONajSRxSz4K+fhJIelu8i6pxNwQTRG0IXfIUTBkTRYCQyLlhvkAZh1d
         iyUwvDtlB0Ox6Zt1kCz4hBtadcabdsTCvt3j1eL1mmjWvSqi01Ehp+RJIegNvYXbJZN2
         wE4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SjWebb0xz2JlPboqiHF18jFOy9xu4u7Sl1Xjhzt8LEw=;
        b=gOppBSOMWj3YPMBNr9W7EfXSrQEz0bVBuXX3BO09zmU9hSK5+unwNQeu80+6sPdy9w
         VSjVQqVHxzTKvh9zyc1GybzNiE+vfsL7J/d1AiRknj/Z45sh1JhBPog0DiA8CZke1oyq
         GSaA0X8R6V9aueFTPBgvZCjzSYwPgpdQbGddEpcLdkw9p1Nzyhznl2apzAOe1gSAxIh2
         SQWHbBW1jOr3pT2OEe26iianJOawaNH+tZgT/VaGPNPzRkZwSWgHkYGbU8Kw2Pp6k8BR
         8O8c14gkjmSCb4TqgVi8prAC41rpumw9wEWGi1mo12ZbtznQ4z8GqmsHRBBoA9Vt6tD8
         vuTw==
X-Gm-Message-State: AOAM531FbX056eGHwJc7R+enpxhsN2oVchwDzvp6QWXmuAUBzSQpNi5E
	n/hBQodyb0iKfd35J36C+1xdS2GrRf8=
X-Google-Smtp-Source: ABdhPJwdyJBKaw+6ezo0DN2iI5ToAsHEhtUcQb+bNDgAmdGF+YPAyeOrPuGaSFxaoJ/SA/673FxfRA==
X-Received: by 2002:a50:e696:0:b0:419:998d:5feb with SMTP id z22-20020a50e696000000b00419998d5febmr2294868edm.122.1649933028339;
        Thu, 14 Apr 2022 03:43:48 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abb6b.dynamic.kabel-deutschland.de. [95.90.187.107])
        by smtp.gmail.com with ESMTPSA id h9-20020aa7c949000000b0041b4d8ae50csm821318edt.34.2022.04.14.03.43.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Apr 2022 03:43:47 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH v2 2/8] staging: r8188eu: clean up comments in struct rt_firmware_hdr
Date: Thu, 14 Apr 2022 12:43:17 +0200
Message-Id: <20220414104323.6152-3-straube.linux@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220414104323.6152-1-straube.linux@gmail.com>
References: <20220414104323.6152-1-straube.linux@gmail.com>
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

