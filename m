Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FF302C81
	for <linux-staging@lists.linux.dev>; Tue, 26 Oct 2021 13:43:12 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id f11so14351190pfc.12
        for <linux-staging@lists.linux.dev>; Tue, 26 Oct 2021 06:43:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JwzvnEtQyFzINH8lrQUN82IVP9LOJxQIr47i06O+OtU=;
        b=HdYCeMf81a8N+pUWVFHfIQSCcxlHrwBfZlUQeZ4JyooMtF9ug68RWnwbg8WZPsuF6A
         u7m1fyfzrReBF93Sl6ssvbnhYSlmlJebvX5420PBgCreVLAwDHGTtkpukUjmu+l7UZ2y
         YPH/pj/RqZCTrPNFmjnB+t9WdHrG4vBj9z96O9movWQuZMv2qBIBnqmWGeimYUDpR9ZX
         DeP3+cJslFQEQPtLR4//9HtQGhOarmEGeWUF3s+A4fy281NvM2KeNV1AQnYgddaPXWk5
         21IEFfgQvJWLHfVsP17imCowSUlf7d44DpibSAGCHRsomCgQbLJ7+m99s6YDNWA1tVJI
         T5fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JwzvnEtQyFzINH8lrQUN82IVP9LOJxQIr47i06O+OtU=;
        b=UxmsuB2TGrcmXKS5uIRaX5ZkN8chfvIME9qDpum34y4bWnVyDO5FADecZcG8XYGBNq
         wxXZ6QCXsGn4YEvqrT4fErxSwKClEo3B4KE4TZNwCF+Hm0pIv7dUoH3MNz4Xb1SHEqYr
         LskAxb1mJ+I1zkfyr7vordNQNyMsQcda+jHLtjbRYMmADLJByj3VCGe3Naw2XfDhrEry
         esMdoEOWpgKB2JdDeoanLqOf712pryGNWK3h2PSdmwy67dscSOAM+dVWEsnSOivTpFWu
         2eaWSIAFKH8xkQWjtKB8Sv28ASRZ5C+QwqE/VBQC0UnEVD3kB6dSHTOV8SQzhYDvzQqN
         jgmA==
X-Gm-Message-State: AOAM530xC14Z48QScAf0mNMJUo3CHhlGOT5DchZNW773iNeDPZ/mV/XW
	6NsBTw7wJn0iiXYpgvT3sx8=
X-Google-Smtp-Source: ABdhPJzoj0kvpHRxoTcjkPZO9BW2iW8gCKlYY/TxwhYww0PmpXsQ/bpgiVYkIeOJMqAZA/Yl3bPrTw==
X-Received: by 2002:a63:9d0b:: with SMTP id i11mr16378932pgd.429.1635255791737;
        Tue, 26 Oct 2021 06:43:11 -0700 (PDT)
Received: from kushal ([2401:4900:1d67:6055:69c2:a862:1f6e:c9e4])
        by smtp.gmail.com with ESMTPSA id m10sm1000844pjs.21.2021.10.26.06.43.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Oct 2021 06:43:11 -0700 (PDT)
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
Subject: [PATCH v2] staging: rtl8723bs: core: Refactor nested if-else
Date: Tue, 26 Oct 2021 19:12:53 +0530
Message-Id: <20211026134253.7868-1-kushalkothari285@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refactor nested if-else to avoid deep indentations. There is no change
in the logic of the new code, however, now it is simple because it gets
rid of five unnecessary else conditionals and it combines nested if into
single if-else-if. This refactor also leads to fix warning detected by
checkpatch.pl:
WARNING: Too many leading tabs - consider code refactoring

Signed-off-by: Kushal Kothari <kushalkothari285@gmail.com>
---

Changes in v2: Fix the bug of not handling properly the else logic
when p is not null in else-if. Also, reword the subject line and break 
it up at 72 columns.

 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 69 ++++++++-----------
 1 file changed, 29 insertions(+), 40 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index 0f82f5031c43..267d853b1514 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -1192,50 +1192,39 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
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
+			if (p && memcmp(p+2, WMM_IE, 6)) {
+				p = p + ie_len + 2;
+			} else if (p && !memcmp(p+2, WMM_IE, 6)) {
+				pstat->flags |= WLAN_STA_WME;
+				pstat->qos_option = 1;
+				pstat->qos_info = *(p+8);
+				pstat->max_sp_len = (pstat->qos_info>>5)&0x3;
+
+				pstat->has_legacy_ac = false;
+				if ((pstat->qos_info&0xf) != 0xf)
+					pstat->has_legacy_ac = true;
+
+				if (pstat->qos_info&0xf) {
+					pstat->uapsd_vo = 0;
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
-			p = p + ie_len + 2;
 		}
 	}
 
-- 
2.25.1

