Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 396191374;
	Tue, 19 Apr 2022 18:19:52 +0000 (UTC)
Received: by mail-qk1-f170.google.com with SMTP id q75so5534334qke.6;
        Tue, 19 Apr 2022 11:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eTY41j92DVLNXeSt4o0nuA9rJQeUxDOxu+njnckXIDQ=;
        b=LTl9kT3xpYL6VGEy2O5G2D/KacFzBLapBCcpa8SVQcm/vTgM1g2taCae9ti31ZnUnP
         jQ3wMxvJsuD3S5QQDIAo61l28GRuHnj+rQYPOxxH59K9KxAhQ6DOeh+H2v7m9F1WBJrU
         1cE6HGebZfiVlUTpQtUvgzZAhJPIjP70k53nd6Hh8mWk0ZTJJ4P+q1CcETzFGx+5Mxdr
         UM8BMo3myP85dULJVvG7tmEtEPGh42u/6Q6NuWuCAYq5gnXuauYPwWQFBrAf29ZR/ZAd
         nrEodCYgzqC5VptflF042txhrU25aUwKKluUY6nmnjT7yF5ZbL84tiYCyYDPbiaX/7oo
         GVEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eTY41j92DVLNXeSt4o0nuA9rJQeUxDOxu+njnckXIDQ=;
        b=2PzsZBHVin+bNs0RUcOUz7sYNcEr1uHA4OAu2HSYUxHDW20EghtPtW7jC78oQsQUjd
         HYkeyrYGQtARVCjqLZNWkSjrRrdMNOX/8v3asewG50GskuvHv2OGFgtgfQGSLEkfiyBp
         ZJgLjJpjk/zcg6cHX9iAj6D5qWiBkCsHmEBllAagGy6EXs1A9hD+yQZzKmmymL2xnM7a
         96cBjgdCoDwq4S/5nxy6S0SCCcAX4aFhY4BwF5mKVJU4ViPM6TsEIFhL9rc+0kq0f6HG
         ZegK6rKhT8Y35EJEqsTP4/iuGGHJUu3CcPEeG+kUV7OsSuhNZax6Tj4xhUI0J8PpH8ep
         o68g==
X-Gm-Message-State: AOAM531t+INDGeNxsS4kuHHNtSuEmYQu4DEuCkUiLAZMdjaz5XC3Z2Yz
	Y0X76TbvQ+21c40J4IQptEU=
X-Google-Smtp-Source: ABdhPJy7FqTgL+ZMMB+LutLXJ2/U/G82goC/xh9N3tuArQF8jIEzE5CndILEgQbLcUQNdwFSzoHjlA==
X-Received: by 2002:a37:8ac1:0:b0:69b:ef34:2655 with SMTP id m184-20020a378ac1000000b0069bef342655mr10460110qkd.336.1650392391091;
        Tue, 19 Apr 2022 11:19:51 -0700 (PDT)
Received: from jaehee-ThinkPad-X1-Extreme.wework.com ([4.34.18.218])
        by smtp.gmail.com with ESMTPSA id e126-20020a376984000000b0069c86b28524sm373334qkc.19.2022.04.19.11.19.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Apr 2022 11:19:50 -0700 (PDT)
From: Jaehee Park <jhpark1013@gmail.com>
To: Larry.Finger@lwfinger.net
Cc: phil@philpotter.co.uk,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev,
	jhpark1013@gmail.com
Subject: [PATCH v3 4/7] staging: r8188eu: place constants on the right side of tests
Date: Tue, 19 Apr 2022 14:19:35 -0400
Message-Id: <31d2a118c5d797a2df7428aa701afe46cbbc1d19.1650392020.git.jhpark1013@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1650392020.git.jhpark1013@gmail.com>
References: <cover.1650392020.git.jhpark1013@gmail.com>
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
index 47f528c14b25..adaf0f813a97 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme.c
@@ -703,7 +703,7 @@ void rtw_surveydone_event_callback(struct adapter	*adapter, u8 *pbuf)
 			set_fwstate(pmlmepriv, _FW_UNDER_LINKING);
 			pmlmepriv->to_join = false;
 			s_ret = rtw_select_and_join_from_scanned_queue(pmlmepriv);
-			if (_SUCCESS == s_ret) {
+			if (s_ret == _SUCCESS) {
 			     _set_timer(&pmlmepriv->assoc_timer, MAX_JOIN_TIMEOUT);
 			} else if (s_ret == 2) { /* there is no need to wait for join */
 				_clr_fwstate_(pmlmepriv, _FW_UNDER_LINKING);
@@ -711,7 +711,8 @@ void rtw_surveydone_event_callback(struct adapter	*adapter, u8 *pbuf)
 			} else {
 				if (rtw_to_roaming(adapter) != 0) {
 					if (--pmlmepriv->to_roaming == 0 ||
-					    _SUCCESS != rtw_sitesurvey_cmd(adapter, &pmlmepriv->assoc_ssid, 1, NULL, 0)) {
+					    rtw_sitesurvey_cmd(adapter, &pmlmepriv->assoc_ssid,
+							       1, NULL, 0) != _SUCCESS) {
 						rtw_set_roaming(adapter, 0);
 						rtw_free_assoc_resources(adapter, 1);
 						rtw_indicate_disconnect(adapter);
@@ -1952,7 +1953,7 @@ void rtw_issue_addbareq_cmd(struct adapter *padapter, struct xmit_frame *pxmitfr
 		issued = (phtpriv->agg_enable_bitmap >> priority) & 0x1;
 		issued |= (phtpriv->candidate_tid_bitmap >> priority) & 0x1;
 
-		if (0 == issued) {
+		if (issued == 0) {
 			psta->htpriv.candidate_tid_bitmap |= BIT((u8)priority);
 			rtw_addbareq_cmd(padapter, (u8)priority, pattrib->ra);
 		}
@@ -1979,19 +1980,19 @@ void _rtw_roaming(struct adapter *padapter, struct wlan_network *tgt_network)
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

