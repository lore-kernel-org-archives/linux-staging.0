Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D210258A
	for <linux-staging@lists.linux.dev>; Sun, 17 Apr 2022 17:54:51 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id t25so15346837edt.9
        for <linux-staging@lists.linux.dev>; Sun, 17 Apr 2022 10:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YHM9PFFwx6hClGPcuoJgSs1Sb6xb089x4uMzIqzHgxE=;
        b=Yp56c+ZB8HEv1qF30A4KlgnajiNfkp/end5U3doacovPJEmHPgB5M6jLXBAj6iHqYp
         9R3CjqP3XpBeMvY0D1uc4/D1k9NcvvT/5P/SB18egXGckfj+qK4SIuldWJftfnXDetPP
         oixZVm9mHe0rEIgR4YkuTxhJ5SwWJM3vOwqLNJXkihF3CQKhO2IwGHj2AIOJjnJBCvvc
         XCvs40JMYYhGizciLG+mwnPww5IYMX/0bJWrF+c31+UlY4IO+4CsLNAI6bTu9le4JEBf
         NtSAcjkyQyPB2TCehsBPWANsEfo9C7Qjpxh3uDHTPYc88z3opIRcxISWAXtprEXNZzEa
         kNuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YHM9PFFwx6hClGPcuoJgSs1Sb6xb089x4uMzIqzHgxE=;
        b=RKgvvSnzon6tie0IU/bKyLxq62Ruyoj7oguDzeObszFG0WG7eG1xeJDfQWPVh8m4+T
         i0Elc3dCHGVmzhGEzQuYWjkKpbat95Siz9+j91+PKX3GEFZKDAhcLdwF5i2589nORJTi
         c8vzhgvaif4o5iZVoynK5bHoBNt0uwtRXcewf6nGNvgWFfDoRLsPcWNxZ/H5c0lakq++
         zzPS1kHwwwaBVQuMEgBiMGbseAInDfRo+PspPDTmD6JAzzC7jmeJK0ghNlgynIY+Hfl/
         zo1U6l9PzhwZq53MnDaz7HJt6cgyACKQij9r9N6t1UWtB79lTVxJH7EDCTk9CTiiihts
         6E3w==
X-Gm-Message-State: AOAM531T3ciVTlxIqC7ommWLvZ9JmcU5j3Pzw5r7HOLMwNaIzcJ7/wL+
	mogfDVuCnW3VdbgJxlNhb3o=
X-Google-Smtp-Source: ABdhPJzpsqelcEFavErmiQTZY9Yba+1II7W/RaX2sY5D0MrTifQjwSVy8Q2XdtxzQbs85AIktc1GBw==
X-Received: by 2002:aa7:dcd3:0:b0:41d:70e4:bf4d with SMTP id w19-20020aa7dcd3000000b0041d70e4bf4dmr8649818edu.223.1650218089830;
        Sun, 17 Apr 2022 10:54:49 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abba5.dynamic.kabel-deutschland.de. [95.90.187.165])
        by smtp.gmail.com with ESMTPSA id jw12-20020a17090776ac00b006e87137194esm3719409ejc.150.2022.04.17.10.54.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Apr 2022 10:54:49 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH v4 3/8] staging: r8188eu: clean up comments in struct rt_firmware_hdr
Date: Sun, 17 Apr 2022 19:54:36 +0200
Message-Id: <20220417175441.13830-4-straube.linux@gmail.com>
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

Remove unnecessary comments from struct rt_firmware_hdr. While at it
align the in-line comments.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
v4:
- keep the in-line comments

v3:
- no changes

v2:
- no changes

 drivers/staging/r8188eu/core/rtw_fw.c | 36 ++++++++++-----------------
 1 file changed, 13 insertions(+), 23 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_fw.c b/drivers/staging/r8188eu/core/rtw_fw.c
index 7cd08268f3b9..0fa27b36bb8e 100644
--- a/drivers/staging/r8188eu/core/rtw_fw.c
+++ b/drivers/staging/r8188eu/core/rtw_fw.c
@@ -14,37 +14,27 @@
 	(le16_to_cpu(_fwhdr->Signature) & 0xFFF0) == 0x2300 ||	\
 	(le16_to_cpu(_fwhdr->Signature) & 0xFFF0) == 0x88E0)
 
-/*  This structure must be careful with byte-ordering */
-
 struct rt_firmware_hdr {
-	/*  8-byte alinment required */
-	/*  LONG WORD 0 ---- */
 	__le16		Signature;	/* 92C0: test chip; 92C,
 					 * 88C0: test chip; 88C1: MP A-cut;
 					 * 92C1: MP A-cut */
-	u8		Category;	/*  AP/NIC and USB/PCI */
-	u8		Function;	/*  Reserved for different FW function
-					 *  indcation, for further use when
-					 *  driver needs to download different
-					 *  FW for different conditions */
-	__le16		Version;	/*  FW Version */
-	u8		Subversion;	/*  FW Subversion, default 0x00 */
+	u8		Category;	/* AP/NIC and USB/PCI */
+	u8		Function;	/* Reserved for different FW function
+					 * indcation, for further use when
+					 * driver needs to download different
+					 * FW for different conditions */
+	__le16		Version;	/* FW Version */
+	u8		Subversion;	/* FW Subversion, default 0x00 */
 	u8		Rsvd1;
-
-	/*  LONG WORD 1 ---- */
-	u8		Month;	/*  Release time Month field */
-	u8		Date;	/*  Release time Date field */
-	u8		Hour;	/*  Release time Hour field */
-	u8		Minute;	/*  Release time Minute field */
-	__le16		RamCodeSize;	/*  The size of RAM code */
+	u8		Month;		/* Release time Month field */
+	u8		Date;		/* Release time Date field */
+	u8		Hour;		/* Release time Hour field */
+	u8		Minute;		/* Release time Minute field */
+	__le16		RamCodeSize;	/* The size of RAM code */
 	u8		Foundry;
 	u8		Rsvd2;
-
-	/*  LONG WORD 2 ---- */
-	__le32		SvnIdx;	/*  The SVN entry index */
+	__le32		SvnIdx;		/* The SVN entry index */
 	__le32		Rsvd3;
-
-	/*  LONG WORD 3 ---- */
 	__le32		Rsvd4;
 	__le32		Rsvd5;
 };
-- 
2.35.1

