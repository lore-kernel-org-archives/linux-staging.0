Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BE9F801;
	Mon, 18 Apr 2022 18:35:47 +0000 (UTC)
Received: by mail-pg1-f180.google.com with SMTP id r83so187766pgr.2;
        Mon, 18 Apr 2022 11:35:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KmHr1wk8EOwbhxVvKBnxuC9ee49Eu59ViAG/GBSeANQ=;
        b=MWz4jqWwGUsXbVTltM6tuqWJT967ActdIYjNhSt/dHhe2JxPBlsQ2jqFdgXTVhy2WK
         a6B84JXT5u4s9sBfPbw51CWO9C5ENZyFvEFtFfwKYtHJ/kjB/PH86Pg0SlO46nkSUTrE
         S1fW2RjdXgWEz4tAkD4Z8ybk9NB5HvcFKqHI6ynDUFzHmdoN1C2oAuzlzyQKS30QTbf5
         74i3wNKQGJnAcT+96zgLuh/F8Bz2srvlEE3FafQDYsAgHPOc7Nc+A6vnrAA5DnUWl2uu
         fZOLoyn1fiKd5lUYqLnje8p+EUFQpM53CRG9vI3wp1lcXhBahfx/AkMgX3l/WDhJuxsU
         kJqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KmHr1wk8EOwbhxVvKBnxuC9ee49Eu59ViAG/GBSeANQ=;
        b=WS/5UC8imPEgCCfDRIO/qyj6lCmFvGVBHVxH9AzfHkP/JTJ4v0PvQ8zBsmk/eYnw6Q
         L+6Iibtkc++dOM8eZZB2zgj4ZGzTgsJKHc229LbKFQYAC+e2Cl8J2R7LyQmlqa3OIbS0
         I7knlmsN89uu3RBqYhe1MR2vqZOUclZasuFcs3bSxXG3Ei7pC1pmzFxLaWN6lyc9r5OO
         wPemyFkwDpf68gojvqrhbZwXjeQuZjRkDVKxrNvWOnfWYCFJHoWn++2LXV78TNJzoNLR
         WOEDg2bLJbWQEZduAQtJFScBJFMO9sG3BOPNMCqRMVEfdDAIcsGUXzNFsBNDf7at5SdX
         sjRA==
X-Gm-Message-State: AOAM532YKuGuJP3RPM1AbIUkazxzJhoOCyHliVIuWlzO/4OpKw8J93lk
	lt5pc/eHN95J16JRXFw0QRc=
X-Google-Smtp-Source: ABdhPJyc2KzQbgNVhjjurVLDBCq7/8A7EC1wa+A4DP4OeTFDo7bFzZsI3Of+8eUO6rlvbPXq619kcg==
X-Received: by 2002:a63:4f56:0:b0:3aa:2a2b:e38d with SMTP id p22-20020a634f56000000b003aa2a2be38dmr972211pgl.11.1650306946556;
        Mon, 18 Apr 2022 11:35:46 -0700 (PDT)
Received: from aliyar-HP-Laptop-15-da1xxx.domain.name ([14.139.241.88])
        by smtp.gmail.com with ESMTPSA id g14-20020a65580e000000b0039ce0873289sm13564453pgr.84.2022.04.18.11.35.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Apr 2022 11:35:46 -0700 (PDT)
From: Aliya Rahmani <aliyarahmani786@gmail.com>
To: forest@alittletooquiet.net
Cc: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	outreachy@lists.linux.dev,
	Aliya Rahmani <aliyarahmani786@gmail.com>
Subject: [PATCH v5] staging: vt6655f: rxtx: Fix Lines should not end with a '('
Date: Tue, 19 Apr 2022 00:01:14 +0530
Message-Id: <20220418183113.19751-1-aliyarahmani786@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Put the first parameter immediately after the '(' and align
the other parameters underneath it. Put static and void on a
single and function type together. Code style warnings reported
by checkpatch.

Signed-off-by: Aliya Rahmani <aliyarahmani786@gmail.com>
---
v1->v2 changes: Put static and void on a single line.

v2->v3->v4 changes: Rework commit description.

v4->v5 changes: Put storage class and function type on a single line.
                Rework commit description and subject.
---
 drivers/staging/vt6655/rxtx.c | 24 ++++++++++--------------
 1 file changed, 10 insertions(+), 14 deletions(-)

diff --git a/drivers/staging/vt6655/rxtx.c b/drivers/staging/vt6655/rxtx.c
index 53506e242a96..8127807070a7 100644
--- a/drivers/staging/vt6655/rxtx.c
+++ b/drivers/staging/vt6655/rxtx.c
@@ -567,19 +567,15 @@ s_uFillDataHead(
 	return buf->duration;
 }
 
-static
-void
-s_vFillRTSHead(
-	struct vnt_private *pDevice,
-	unsigned char byPktType,
-	void *pvRTS,
-	unsigned int cbFrameLength,
-	bool bNeedAck,
-	bool bDisCRC,
-	struct ieee80211_hdr *hdr,
-	unsigned short wCurrentRate,
-	unsigned char byFBOption
-)
+static void s_vFillRTSHead(struct vnt_private *pDevice,
+			   unsigned char byPktType,
+			   void *pvRTS,
+	                   unsigned int cbFrameLength,
+                          bool bNeedAck,
+	                   bool bDisCRC,
+	                   struct ieee80211_hdr *hdr,
+	                   unsigned short wCurrentRate,
+	                   unsigned char byFBOption)
 {
 	unsigned int uRTSFrameLen = 20;
 
@@ -601,7 +597,7 @@ s_vFillRTSHead(
 		if (byFBOption == AUTO_FB_NONE) {
 			struct vnt_rts_g *buf = pvRTS;
 			/* Get SignalField, ServiceField & Length */
-			vnt_get_phy_field(pDevice, uRTSFrameLen,
+			vnt_get_phy_field(pDevice, uRTSFrameLen
 					  pDevice->byTopCCKBasicRate,
 					  PK_TYPE_11B, &buf->b);
 
-- 
2.25.1

