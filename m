Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C55D13215
	for <linux-staging@lists.linux.dev>; Fri, 15 Apr 2022 12:10:38 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id v4so9715236edl.7
        for <linux-staging@lists.linux.dev>; Fri, 15 Apr 2022 05:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ao+2u5mN9oqQNh9Bj75ET9jSsQPun5Z4kpcJNLscrms=;
        b=cjoLOsSDj/9/qFpS2S1vuZWjEowzAEn4dR0Nh2GziZQLnl4Bn3FUrhJZjp7IfB7AS/
         6LdzKS8R4qeoBYxCkRdZjzxr4mTOY9oJcDZqA2QPH/v1BtuPL5kKlG8vOHAPwf5lKNs/
         vRfPfrVB/l7zNqMlmGmjcpMPUxSwzhsXSQqxV6OWrV2whRiGaW/al8nqo23kWqBswDO3
         Pv6lDtq8Nhcva64wzC+TwdnAf4HF2HWLSS0BwZAk0vO9NpNAhduMf96SpnsZkVdX9iCe
         AvGQq9OnuQC6jY0+XyGgLisJfmIvCdO8aPLreEP0Y9HC3YZ310e730d4NMy9xuSX5gvg
         t4vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ao+2u5mN9oqQNh9Bj75ET9jSsQPun5Z4kpcJNLscrms=;
        b=CZqWjrJ9NdYprsHChiX9M0xpBZhbJQuTZ/6kQTS8gSrC+xHu2Bo8qmBWX+juZ9YX2F
         E639Sn9d5VDc43O2VVVpZYN9FMfmYMXCQalJV4Wjxi9PIY+uSzDmj+tQebJ6gUFjI9d+
         SreH/YL4ZgUcs5pk5u56pZoD1JiCnWG/I1yq4bOXP3FXwFwjRdkOqb828CC8C2EqyuSx
         rORHehNgOn74myGIVJZt/ZJwCMi3jQNn0g0KEvcKjAuhDMr4bbKOZe1nO0ffcmUIEKAl
         VP2Lvl9WstdwnYB4TvfER7FzhuBmVjR8V3zHLPyxGZsuRAGSh4a3wVfOGjSgoZ7BVgRS
         KVvQ==
X-Gm-Message-State: AOAM531E9gs5cpfbyeNRYjZErbmHT6lY7Wq3Ed5Vbg5/eglGgre9Ag6X
	uy8ASRMmhxVP0De4w6tgE24=
X-Google-Smtp-Source: ABdhPJyKs7kZ6vzgwX3OHrdJ0E5c3YGCeKrhSaUtvDjb6Bz6b6BkhJdPWey9xTtiDxWqKRMwmZGI5w==
X-Received: by 2002:a50:cc9e:0:b0:41d:7123:d3ba with SMTP id q30-20020a50cc9e000000b0041d7123d3bamr8022989edi.296.1650024637162;
        Fri, 15 Apr 2022 05:10:37 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abba5.dynamic.kabel-deutschland.de. [95.90.187.165])
        by smtp.gmail.com with ESMTPSA id z22-20020a1709063ad600b006e8867caa5dsm1626114ejd.72.2022.04.15.05.10.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Apr 2022 05:10:36 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH v3 3/8] staging: r8188eu: clean up comments in struct rt_firmware_hdr
Date: Fri, 15 Apr 2022 14:10:18 +0200
Message-Id: <20220415121023.11564-4-straube.linux@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220415121023.11564-1-straube.linux@gmail.com>
References: <20220415121023.11564-1-straube.linux@gmail.com>
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
v3:
- no changes

v2:
- no changes

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

