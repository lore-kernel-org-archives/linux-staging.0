Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB69E7C
	for <linux-staging@lists.linux.dev>; Wed, 30 Mar 2022 12:07:12 +0000 (UTC)
Received: by mail-qv1-f42.google.com with SMTP id kk12so16607683qvb.13
        for <linux-staging@lists.linux.dev>; Wed, 30 Mar 2022 05:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:subject:message-id:mime-version:content-disposition;
        bh=DIU0qW0oqokq5sgo17jUrrfi/pfNulAd15d8nAXYtvg=;
        b=ZqJOSLg2+c6hbYSTjjh6gJ7f7m6Rm4W0tjpkI/8E2fgAwA5tS14me47hbpGLg4N3kQ
         ViyiyDpcJcRM83Y+nGiF++wtaqA1QxlkFNWoVgzegGr+G22eCdsEikLvW49mqUkhWa0P
         ArkPaFTLLL6AoRCGuy2DbAQ0YrVZGSSmHXaHXN0g6dtNpdojPnWzx9j8CxONmy0npfw4
         0gbk3lvrbqPIpFWr7s6EYoTDvEXbcMjhuDCOaT2OsJPZjTTXowkzYtQb86dwkGANPK1T
         g4dlfsABmofCqjnHBEwHMElk/UfRvP2F9Yk1NU1uYeP+lJI+ODmJqgiLWTxQNlGzdDM8
         hGmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition;
        bh=DIU0qW0oqokq5sgo17jUrrfi/pfNulAd15d8nAXYtvg=;
        b=oARwER+uHIlbI9+Q/TweFrpxa/4YTCptG24FK5OFGuiojfPksi+hUJkGDT/ciwN8E8
         kAg3z2aiEsbVmXt+IBpxjbGEbwJVmpNSXJ6L/uPqXrYgnCJTKjdYDZ2fSpBjCaZW7zQ8
         Wo/vCqd2y8mi1y9fjlX9a2RRfymKmQjowsQuW3v1Xs+TrJaoho8w60l7PvzF07xINdm4
         iwJiAPUUV12E+55oH3dbeTESlcNZ9pTgSeVIjo6umNRksvka7A4oRyH9gl6jl73/wdL9
         8B8U75TRkC7MJkNGxst6cjRHum6eEYYNNfQEwlmFrNfm7rV1269V9+tBI6yaokZ9XyGU
         kZJw==
X-Gm-Message-State: AOAM530RlwrBPrx0hZAeYYaYL8A42V7UhzyDde4vYHTfrlc+jRY8ILAx
	xdFdinar/oKg2GO6Fb7jmak=
X-Google-Smtp-Source: ABdhPJyqWifpcmkHCB3u6Bu2U3ChnYAdVLJmBQKdlcYppxlxcqXuYSsghw2laEWpXEQA2k+jt6ABfw==
X-Received: by 2002:a05:6214:2305:b0:432:f1d4:6177 with SMTP id gc5-20020a056214230500b00432f1d46177mr31091513qvb.107.1648642031640;
        Wed, 30 Mar 2022 05:07:11 -0700 (PDT)
Received: from euclid ([71.58.109.160])
        by smtp.gmail.com with ESMTPSA id 8-20020ac85948000000b002e1cd3fa142sm17790827qtz.92.2022.03.30.05.07.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Mar 2022 05:07:10 -0700 (PDT)
Date: Wed, 30 Mar 2022 08:07:09 -0400
From: Sevinj Aghayeva <sevinj.aghayeva@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH] staging: rtl8723bs: place constants on the right side of
 tests
Message-ID: <20220330120709.GA339788@euclid>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Adhere to Linux kernel coding style.

Reported by checkpatch:

WARNING: Comparisons should place the constant on the right side of the test

Signed-off-by: Sevinj Aghayeva <sevinj.aghayeva@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index ed2d3b7d44d9..d5bb3a5bd2fb 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -792,7 +792,7 @@ void rtw_surveydone_event_callback(struct adapter	*adapter, u8 *pbuf)
 			set_fwstate(pmlmepriv, _FW_UNDER_LINKING);
 			pmlmepriv->to_join = false;
 			s_ret = rtw_select_and_join_from_scanned_queue(pmlmepriv);
-			if (_SUCCESS == s_ret) {
+			if (s_ret == _SUCCESS) {
 			     _set_timer(&pmlmepriv->assoc_timer, MAX_JOIN_TIMEOUT);
 			} else if (s_ret == 2) {/* there is no need to wait for join */
 				_clr_fwstate_(pmlmepriv, _FW_UNDER_LINKING);
@@ -1554,7 +1554,7 @@ void _rtw_join_timeout_handler(struct timer_list *t)
 				int do_join_r;
 
 				do_join_r = rtw_do_join(adapter);
-				if (_SUCCESS != do_join_r) {
+				if (do_join_r != _SUCCESS) {
 					continue;
 				}
 				break;
@@ -2558,7 +2558,7 @@ void rtw_issue_addbareq_cmd(struct adapter *padapter, struct xmit_frame *pxmitfr
 		issued = (phtpriv->agg_enable_bitmap>>priority)&0x1;
 		issued |= (phtpriv->candidate_tid_bitmap>>priority)&0x1;
 
-		if (0 == issued) {
+		if (issued == 0) {
 			psta->htpriv.candidate_tid_bitmap |= BIT((u8)priority);
 			rtw_addbareq_cmd(padapter, (u8) priority, pattrib->ra);
 		}
@@ -2610,14 +2610,14 @@ void _rtw_roaming(struct adapter *padapter, struct wlan_network *tgt_network)
 	struct wlan_network *cur_network = &pmlmepriv->cur_network;
 	int do_join_r;
 
-	if (0 < rtw_to_roam(padapter)) {
+	if (rtw_to_roam(padapter) > 0) {
 		memcpy(&pmlmepriv->assoc_ssid, &cur_network->network.ssid, sizeof(struct ndis_802_11_ssid));
 
 		pmlmepriv->assoc_by_bssid = false;
 
 		while (1) {
 			do_join_r = rtw_do_join(padapter);
-			if (_SUCCESS == do_join_r) {
+			if (do_join_r == _SUCCESS) {
 				break;
 			} else {
 				rtw_dec_to_roam(padapter);
-- 
2.25.1

