Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A91C2F3C;
	Wed, 13 Apr 2022 20:11:48 +0000 (UTC)
Received: by mail-qt1-f181.google.com with SMTP id z16so2196802qtq.6;
        Wed, 13 Apr 2022 13:11:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RsvCyHjEEdexsUzersCRTZshhGaPsOo9bh7mou5OagQ=;
        b=WBa6NhY5yXEgT+Gqpg+Z7tCpNTFJgemPs7PlszxJc+y7RgCQdhK3PHMpWMCOk4HXxv
         szv9jgCdUdjpfOHPHmysqL8OCRpRqphSnFGz4ckaxREtKkGKS18cIvQTrf8R1oOS1Pr7
         w5ZJFzSotN/sRNntDULkFrstvVE2nyyFM080AYpX+qDRp72nu3WE+/DsTgvFIPoAWpvN
         s2X87tdyLY4Nzi4ADA0uS5TNH29UGIEiOZxe1ciYtRVkUpeiem+yzwh5Z//7xg+g78/X
         PARTVv5/SHKxHUGsvkGJnhpSakxSd20oenlW0nN2juDh/dbHchU2IH89ebTAdWYXp/qR
         4EVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RsvCyHjEEdexsUzersCRTZshhGaPsOo9bh7mou5OagQ=;
        b=SA6aUw7yyfBhXfl5Ikgpiz6VTzezp9lHqU/07MapvYtkSFQxbfNqgxcORgI9vDDO2C
         W1Ch+p33ExBPdtLF0OsUM7RMcEVNVlBuLWsSMgNQcSzVQgJzb6fLOjXY9uYymarUzh3G
         T8tG6smQpKZ1Np2QFXkM5xyxc9aZvXALqjz3U8hNatnSpQVQLKSYMmSb2j/ojeWNuT2a
         lYaehc1bm309BsaCupRBQ8dOga4dTFOqUdeXt1yb+Ckt4TQerIj/m1yu71r0i6CrmL+b
         jIRV8rmEYtylh8ehi8vuYS4Itsf2V+rxspCuuLdZxNLZZ8GdPKpjmgBSvqP/lVEKo+il
         s/6A==
X-Gm-Message-State: AOAM533/zpu1jSIzXbL5E86U9mSbjBnFuxcG0+yW9KeJxHog6DxF3LKH
	4gmm2DC6mHLWzHKGmyYoHAc=
X-Google-Smtp-Source: ABdhPJxaQNRyxc9Zpj6FjipuAcabNJxruD2Sgxd4BAP+w78VhMt55IcS0VntKwyV96blPz/x50H1eg==
X-Received: by 2002:ac8:698a:0:b0:2ed:260f:b751 with SMTP id o10-20020ac8698a000000b002ed260fb751mr8403327qtq.89.1649880707276;
        Wed, 13 Apr 2022 13:11:47 -0700 (PDT)
Received: from jaehee-ThinkPad-X1-Extreme.wework.com ([4.34.18.218])
        by smtp.gmail.com with ESMTPSA id 7-20020a370907000000b0069c5598584esm1469827qkj.105.2022.04.13.13.11.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Apr 2022 13:11:46 -0700 (PDT)
From: Jaehee Park <jhpark1013@gmail.com>
To: Larry.Finger@lwfinger.net
Cc: phil@philpotter.co.uk,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev,
	jhpark1013@gmail.com
Subject: [PATCH 4/6] staging: r8188eu: place constants on the right side of tests
Date: Wed, 13 Apr 2022 16:11:32 -0400
Message-Id: <d2469155c37b8677a8dcbed28bc0840745d46f76.1649880454.git.jhpark1013@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1649880454.git.jhpark1013@gmail.com>
References: <cover.1649880454.git.jhpark1013@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

To comply with the linux coding style, place constants on the right
side of the test in comparisons. Issue found with checkpatch.
WARNING: Comparisons should place the constant on the right side of
the test.

Signed-off-by: Jaehee Park <jhpark1013@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_mlme.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme.c b/drivers/staging/r8188eu/core/rtw_mlme.c
index 5adef9b9108d..b943fb190e4c 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme.c
@@ -721,7 +721,7 @@ void rtw_surveydone_event_callback(struct adapter	*adapter, u8 *pbuf)
 			set_fwstate(pmlmepriv, _FW_UNDER_LINKING);
 			pmlmepriv->to_join = false;
 			s_ret = rtw_select_and_join_from_scanned_queue(pmlmepriv);
-			if (_SUCCESS == s_ret) {
+			if (s_ret == _SUCCESS) {
 			     _set_timer(&pmlmepriv->assoc_timer, MAX_JOIN_TIMEOUT);
 			} else if (s_ret == 2) { /* there is no need to wait for join */
 				_clr_fwstate_(pmlmepriv, _FW_UNDER_LINKING);
@@ -729,7 +729,8 @@ void rtw_surveydone_event_callback(struct adapter	*adapter, u8 *pbuf)
 			} else {
 				if (rtw_to_roaming(adapter) != 0) {
 					if (--pmlmepriv->to_roaming == 0 ||
-					    _SUCCESS != rtw_sitesurvey_cmd(adapter, &pmlmepriv->assoc_ssid, 1, NULL, 0)) {
+					    rtw_sitesurvey_cmd(adapter, &pmlmepriv->assoc_ssid,
+							       1, NULL, 0) != _SUCCESS) {
 						rtw_set_roaming(adapter, 0);
 						rtw_free_assoc_resources(adapter, 1);
 						rtw_indicate_disconnect(adapter);
@@ -1970,7 +1971,7 @@ void rtw_issue_addbareq_cmd(struct adapter *padapter, struct xmit_frame *pxmitfr
 		issued = (phtpriv->agg_enable_bitmap >> priority) & 0x1;
 		issued |= (phtpriv->candidate_tid_bitmap >> priority) & 0x1;
 
-		if (0 == issued) {
+		if (issued == 0) {
 			psta->htpriv.candidate_tid_bitmap |= BIT((u8)priority);
 			rtw_addbareq_cmd(padapter, (u8)priority, pattrib->ra);
 		}
@@ -1997,19 +1998,19 @@ void _rtw_roaming(struct adapter *padapter, struct wlan_network *tgt_network)
 	else
 		pnetwork = &pmlmepriv->cur_network;
 
-	if (0 < rtw_to_roaming(padapter)) {
+	if (rtw_to_roaming(padapter) > 0) {
 		memcpy(&pmlmepriv->assoc_ssid, &pnetwork->network.Ssid, sizeof(struct ndis_802_11_ssid));
 
 		pmlmepriv->assoc_by_bssid = false;
 
 		while (1) {
 			do_join_r = rtw_do_join(padapter);
-			if (_SUCCESS == do_join_r) {
+			if (do_join_r == _SUCCESS) {
 				break;
 			} else {
 				pmlmepriv->to_roaming--;
 
-				if (0 < pmlmepriv->to_roaming) {
+				if (pmlmepriv->to_roaming > 0) {
 					continue;
 				} else {
 					rtw_indicate_disconnect(padapter);
-- 
2.25.1

