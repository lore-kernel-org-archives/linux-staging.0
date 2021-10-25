Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 873F472
	for <linux-staging@lists.linux.dev>; Mon, 25 Oct 2021 07:25:34 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id f11so9850844pfc.12
        for <linux-staging@lists.linux.dev>; Mon, 25 Oct 2021 00:25:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6NvuoX+y/aQP32R25dGmgeemawZN8QxRAfe7RYJ9bLY=;
        b=CydAgOUgtPZGUtp64KxNowVTwE9xzIhDYtnfLHwLFgLPJGlaHRBQhyFuQuu+C2b0t3
         /IDYmxsL55PUP2AC42nn74+1ids3M9K1vWqw3XCwmlaLC8JMftq1xM6H+u61lVOfM6qZ
         TQj4sOgN9mAWUZButvAw68x2JsiuhqOZI2ooV1mPjlwObgFUbTLjwTVM2TuQG324HaAJ
         68SYuy/uojXjtupMmVn63X4Q+q7YIvqsPtTOHSGFPowROWjZQR1h8gQwjCc8wHZGhh1U
         xOu4AWQ2XClVGlexMlggx5aFaDlT20kJ/tAYzBbPtagUzs9A62CrrUZPxU3HRSUr9nwp
         xhXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6NvuoX+y/aQP32R25dGmgeemawZN8QxRAfe7RYJ9bLY=;
        b=UsShRCemIvUDJsrjvJ47cifIEYVsq/RyhoTSL17BxUscAuYC+FmU1rEZDryTK4AWcr
         pZUdeZFZgDXCaBBExzfdzGAP5Ii5vRsijk6gaN1YhvjUZtnlD76hcHLDYqe5PMBS8SgQ
         5zsR8eUSTZPKEk4jZaVS+W2xho/CBj2WmW+BfNK2gU3pPCY6053lOa/BliN2AX7OnyLU
         u0zb3tWsBUQ08V9WBL9EMws771cFUVuJUpPl2iWybvJsUpywwmOhdEy32g742PpZj3Qs
         0HsRJ1y5JH5MsjZgv3lmuG4o6mx2tjZ80wyc5u1jRgt41OiQ3+7wa3U0MfbWrD5tAf3G
         OEPA==
X-Gm-Message-State: AOAM533dU/vqS+J7xc1/Y4a5PWPLSI0Votw4nA6utwC3OFkocaTmHXu+
	f2VwZ3oej2G2htHdRW58Gr4=
X-Google-Smtp-Source: ABdhPJwOPfpKz5bZoQhcRp/ru6MZBaGdDQXLeJE2i3n9qgmhCh3ZUaevAuB8gxe1wz2kZxY0frkmjw==
X-Received: by 2002:a63:6e03:: with SMTP id j3mr12359099pgc.465.1635146733963;
        Mon, 25 Oct 2021 00:25:33 -0700 (PDT)
Received: from kushal ([115.96.219.235])
        by smtp.gmail.com with ESMTPSA id mp16sm17576256pjb.1.2021.10.25.00.25.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Oct 2021 00:25:33 -0700 (PDT)
From: Kushal Kothari <kushalkothari285@gmail.com>
To: gregkh@linuxfoundation.org,
	fabioaiuto83@gmail.com,
	ross.schm.dev@gmail.com,
	hdegoede@redhat.com,
	marcocesati@gmail.com,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	outreachy-kernel@googlegroups.com,
	mike.rapoport@gmail.com,
	kushalkothari2850@gmail.com
Cc: Kushal Kothari <kushalkothari285@gmail.com>
Subject: [PATCH] staging: rtl8723bs: core: Refactor nested if-else
Date: Mon, 25 Oct 2021 12:55:28 +0530
Message-Id: <20211025072528.152028-1-kushalkothari285@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refactor nested if else by combining nested if into a single if condition and removing unnecessary else conditionals which leads to removing unnecessary tabs .There is no change in logic of new code.
checkpatch warning : Too many leading tabs - consider code refactoring

Signed-off-by: Kushal Kothari <kushalkothari285@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 65 ++++++++-----------
 1 file changed, 26 insertions(+), 39 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index 0f82f5031c43..eb10b6f85426 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -1192,46 +1192,33 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
 		p = pframe + WLAN_HDR_A3_LEN + ie_offset; ie_len = 0;
 		for (;;) {
 			p = rtw_get_ie(p, WLAN_EID_VENDOR_SPECIFIC, &ie_len, pkt_len - WLAN_HDR_A3_LEN - ie_offset);
-			if (p) {
-				if (!memcmp(p+2, WMM_IE, 6)) {
-
-					pstat->flags |= WLAN_STA_WME;
-
-					pstat->qos_option = 1;
-					pstat->qos_info = *(p+8);
-
-					pstat->max_sp_len = (pstat->qos_info>>5)&0x3;
-
-					if ((pstat->qos_info&0xf) != 0xf)
-						pstat->has_legacy_ac = true;
-					else
-						pstat->has_legacy_ac = false;
-
-					if (pstat->qos_info&0xf) {
-						if (pstat->qos_info&BIT(0))
-							pstat->uapsd_vo = BIT(0)|BIT(1);
-						else
-							pstat->uapsd_vo = 0;
-
-						if (pstat->qos_info&BIT(1))
-							pstat->uapsd_vi = BIT(0)|BIT(1);
-						else
-							pstat->uapsd_vi = 0;
-
-						if (pstat->qos_info&BIT(2))
-							pstat->uapsd_bk = BIT(0)|BIT(1);
-						else
-							pstat->uapsd_bk = 0;
-
-						if (pstat->qos_info&BIT(3))
-							pstat->uapsd_be = BIT(0)|BIT(1);
-						else
-							pstat->uapsd_be = 0;
-
-					}
-
-					break;
+			if (p && !memcmp(p+2, WMM_IE, 6)) {
+				pstat->flags |= WLAN_STA_WME;
+				pstat->qos_option = 1;
+				pstat->qos_info = *(p+8);
+				pstat->max_sp_len = (pstat->qos_info>>5)&0x3;
+				pstat->has_legacy_ac = false;
+				if ((pstat->qos_info&0xf) != 0xf)
+					pstat->has_legacy_ac = true;
+
+				pstat->uapsd_vo = 0;
+				if (pstat->qos_info&0xf) {
+					if (pstat->qos_info&BIT(0))
+						pstat->uapsd_vo = BIT(0)|BIT(1);
+
+					pstat->uapsd_vi = 0;
+					if (pstat->qos_info&BIT(1))
+						pstat->uapsd_vi = BIT(0)|BIT(1);
+
+					pstat->uapsd_bk = 0;
+					if (pstat->qos_info&BIT(2))
+						pstat->uapsd_bk = BIT(0)|BIT(1);
+
+					pstat->uapsd_be = 0;
+					if (pstat->qos_info&BIT(3))
+						pstat->uapsd_be = BIT(0)|BIT(1);
 				}
+				break;
 			} else {
 				break;
 			}
-- 
2.25.1

