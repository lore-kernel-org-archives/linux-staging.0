Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DA043FCF
	for <linux-staging@lists.linux.dev>; Wed, 22 Sep 2021 20:05:59 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id g16so10446469wrb.3
        for <linux-staging@lists.linux.dev>; Wed, 22 Sep 2021 13:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7/OYIY0iBm4i1u079WcJ0LeOokON3sdg+SJvQ71ptDo=;
        b=mpwykCkMauESvWVCDt5PefWMGPmFRy2VoXgpcsnk1M0JeuodCAzOQwie319caCp1A5
         0jrcx6SSIckwIGNHSGAtF0TMIm+hJumzKGkfgk64IC04qriLAOZVDAo0rCEJk+8kq6FG
         UrskMkA66eC8RTHKd3vIwHE++10wxKT/hEVZsmaPnno98pTk8/uEAengPpT8vbCsQ8qn
         aVYQ+pyhm0E1UU4CEwGgf1zH5CbmhB6AcH2VcaOJdzZAJLidrPJCzKpVFOF4TtKm7PMx
         GXQxEZGpukW1/LefoHt+AXx5z+v3nNUCrwssMVJmbOHabEWgkuy2k/mqkq1WthdoMj/f
         QETQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7/OYIY0iBm4i1u079WcJ0LeOokON3sdg+SJvQ71ptDo=;
        b=cMZnt/cRQbvBYaj294QkmahrJmd9nxSdYML91UB2ue8u7vjb27uqskfdyhDxHBxVhh
         T+CuGPL/PWgod55yiEu/BnOkyUaVIPVeOFik65Czx+AR/uEEYPIKyOgugvwAXTqufJRK
         C2+Tng26TDsPYjZr/OE38GCsarke1sQKtAnoMGKq6LB1gf/XtvPko4BKG5smnpc34rxT
         tve7vJPwdjnvZg6y4zIzCpLbuEaHU/PiInUsf2y5eGSOjaQT3s7LAG7BnK8bcy+I+nrw
         PdcUjIJtt3Foc11pfVQb/O5bd8QitL2B7WJ5SxVAkZMRvrY+YD07GVtT2U9deIBs92l2
         76qQ==
X-Gm-Message-State: AOAM533ChqY9Fyx1diDephuDpolGTfvgXkaLi8sVOKUYGf2k2FGc8FSX
	Hpo+s0/K0PgIbKKdiDbb4Z0XTgx+KmK3Rw==
X-Google-Smtp-Source: ABdhPJyaDzO3t3Octj3min1Pwchu0+e/UIpszf1eJ6nz+2c7XjJF1iljn160k40wT6Ktpcc4VFehCg==
X-Received: by 2002:a5d:4810:: with SMTP id l16mr890012wrq.3.1632341157981;
        Wed, 22 Sep 2021 13:05:57 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::cde])
        by smtp.gmail.com with ESMTPSA id e2sm3219761wra.40.2021.09.22.13.05.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 13:05:57 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 37/47] staging: r8188eu: remove rtw_ies_remove_ie()
Date: Wed, 22 Sep 2021 22:04:10 +0200
Message-Id: <20210922200420.9693-38-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210922200420.9693-1-straube.linux@gmail.com>
References: <20210922200420.9693-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Function rtw_ies_remove_ie() is not used, remove it. It is the only
user of rtw_get_ie_ex(), remove that function as well.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_ieee80211.c | 90 --------------------
 drivers/staging/r8188eu/include/ieee80211.h  |  4 -
 2 files changed, 94 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_ieee80211.c b/drivers/staging/r8188eu/core/rtw_ieee80211.c
index bc7ab84c0e05..b2a376867c54 100644
--- a/drivers/staging/r8188eu/core/rtw_ieee80211.c
+++ b/drivers/staging/r8188eu/core/rtw_ieee80211.c
@@ -201,96 +201,6 @@ u8 *rtw_get_ie(u8 *pbuf, int index, int *len, int limit)
 	return NULL;
 }
 
-/**
- * rtw_get_ie_ex - Search specific IE from a series of IEs
- * @in_ie: Address of IEs to search
- * @in_len: Length limit from in_ie
- * @eid: Element ID to match
- * @oui: OUI to match
- * @oui_len: OUI length
- * @ie: If not NULL and the specific IE is found, the IE will be copied to the buf starting from the specific IE
- * @ielen: If not NULL and the specific IE is found, will set to the length of the entire IE
- *
- * Returns: The address of the specific IE found, or NULL
- */
-u8 *rtw_get_ie_ex(u8 *in_ie, uint in_len, u8 eid, u8 *oui, u8 oui_len, u8 *ie, uint *ielen)
-{
-	uint cnt;
-	u8 *target_ie = NULL;
-
-	if (ielen)
-		*ielen = 0;
-
-	if (!in_ie || in_len <= 0)
-		return target_ie;
-
-	cnt = 0;
-
-	while (cnt < in_len) {
-		if (eid == in_ie[cnt] && (!oui || !memcmp(&in_ie[cnt + 2], oui, oui_len))) {
-			target_ie = &in_ie[cnt];
-
-			if (ie)
-				memcpy(ie, &in_ie[cnt], in_ie[cnt + 1] + 2);
-
-			if (ielen)
-				*ielen = in_ie[cnt + 1] + 2;
-
-			break;
-		} else {
-			cnt += in_ie[cnt + 1] + 2; /* goto next */
-		}
-	}
-	return target_ie;
-}
-
-/**
- * rtw_ies_remove_ie - Find matching IEs and remove
- * @ies: Address of IEs to search
- * @ies_len: Pointer of length of ies, will update to new length
- * @offset: The offset to start scarch
- * @eid: Element ID to match
- * @oui: OUI to match
- * @oui_len: OUI length
- *
- * Returns: _SUCCESS: ies is updated, _FAIL: not updated
- */
-int rtw_ies_remove_ie(u8 *ies, uint *ies_len, uint offset, u8 eid, u8 *oui, u8 oui_len)
-{
-	int ret = _FAIL;
-	u8 *target_ie;
-	u32 target_ielen;
-	u8 *start;
-	uint search_len;
-
-	if (!ies || !ies_len || *ies_len <= offset)
-		goto exit;
-
-	start = ies + offset;
-	search_len = *ies_len - offset;
-
-	while (1) {
-		target_ie = rtw_get_ie_ex(start, search_len, eid, oui, oui_len, NULL, &target_ielen);
-		if (target_ie && target_ielen) {
-			u8 buf[MAX_IE_SZ] = {0};
-			u8 *remain_ies = target_ie + target_ielen;
-			uint remain_len = search_len - (remain_ies - start);
-
-			memcpy(buf, remain_ies, remain_len);
-			memcpy(target_ie, buf, remain_len);
-			*ies_len = *ies_len - target_ielen;
-			ret = _SUCCESS;
-
-			start = target_ie;
-			search_len = remain_len;
-		} else {
-			break;
-		}
-	}
-exit:
-	return ret;
-}
-
 void rtw_set_supported_rate(u8 *SupportedRates, uint mode)
 {
 
diff --git a/drivers/staging/r8188eu/include/ieee80211.h b/drivers/staging/r8188eu/include/ieee80211.h
index 36c95adb9d85..65e21d5d5b46 100644
--- a/drivers/staging/r8188eu/include/ieee80211.h
+++ b/drivers/staging/r8188eu/include/ieee80211.h
@@ -1103,10 +1103,6 @@ u8 *rtw_set_ie_mesh_ch_switch_parm(u8 *buf, u32 *buf_len, u8 ttl,
 				   u8 flags, u16 reason, u16 precedence);
 
 u8 *rtw_get_ie(u8 *pbuf, int index, int *len, int limit);
-u8 *rtw_get_ie_ex(u8 *in_ie, uint in_len, u8 eid, u8 *oui,
-		  u8 oui_len, u8 *ie, uint *ielen);
-int rtw_ies_remove_ie(u8 *ies, uint *ies_len, uint offset,
-		      u8 eid, u8 *oui, u8 oui_len);
 
 void rtw_set_supported_rate(u8 *SupportedRates, uint mode);
 
-- 
2.33.0

