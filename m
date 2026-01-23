Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3E2732BF4B
	for <linux-staging@lists.linux.dev>; Fri, 23 Jan 2026 00:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769128356; cv=none; b=jzDKTagQx1OPXCaa8w9WVMSZmxJIdX/enynHFLJRNvbnAburxJU4w1p0Yzy9CnXgNweMrpOfbWD1w7AMx+XLD7Bibd+Zt3UTuPoi+fjGwWXrMsea5Efqa8t9pIHKnpLLP7Bs0xhLUzbQczlGvjfa37GejLvSfT1cq2ofLmn3kXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769128356; c=relaxed/simple;
	bh=hJ89ncWKlGLf6hjmVBwCUvsAU0++EW+pWL/nCGoJB6k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FWmVltPxbyWxK0kACbcVAC5mzyysDARtaToVgQEJwCcU2fRQugZtcYfncLZJxefy8tON1ttok8S1DJpxW/cQXTwEDzZi/M6ilFRwiSymufCmQdZIjTA3n6o2W9YT4QZPXgDnCi1Gj5/xBOmLSGdVoKOAskzXljHnQxQjt/f2Ekc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OiSeYjk8; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OiSeYjk8"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-350fe1f8ea3so817740a91.2
        for <linux-staging@lists.linux.dev>; Thu, 22 Jan 2026 16:32:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769128347; x=1769733147; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=r/7hLRIjtb3MQgSdxcpjKlLWrlEfFBG5SgL5jJWgheQ=;
        b=OiSeYjk8MtnmlYkFcKWdjF7DUB79SECnsmeakYwD54gb10Qq4vSEQixNMFVKEK2D/F
         g8i+KOIC0P6CkE365F4W1H4ffg+p5ZfEmArcdBB8Wv+Pbmt9jqSSSuDbi3bpxzi54Lys
         W0R+7JH+b7tyZ5LdWFo+ybihq4dAA0Lx+EBSalhl5rx+TNZHyfIiCT2h+L67lx54bLDr
         tzgg7w0csZNlSr7jcT7Z2j7u5RAXfskcDX9jKiKSay+teKN9OpNnmLGbeyngdvGSgDGw
         UOWHC69IXVBjDUrn2tiWPBFbPQd4lG8Ue5PKEvRfJAcxMhHsNkZy6VvTayk1cupIyfZL
         nfaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769128347; x=1769733147;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r/7hLRIjtb3MQgSdxcpjKlLWrlEfFBG5SgL5jJWgheQ=;
        b=gceNxR4uGP2kAuw8toAy+t4SMZ+2SYL7IAn268QZ2OhD4pdUZi0eFzkLLYUtT1sFMo
         hnDhKIHggvBcBBo9BoU9hnBhdLFBFtEv1LdPk6yM72wvoS45hXbDX1rwe87AF6nlRVB9
         7JotumMu4emruUnxVpm9gD8bOI/2WW19cxMUSKUuWOubX4Sx9e7eAY0BHUB6N0djdL7A
         f2msJz/YT/MURzTQzIU9DjJimlOe3jPt9Fjpsj+GVaZUMkN6DSyHcp/tIDQrnBP/GTai
         oC6wvKYxwtssaPgjB3FWtyhgjrSwx/YClIQqt0Y9dFkUR1aEYfG1oOkgT8IfEplmvQH+
         hUBw==
X-Forwarded-Encrypted: i=1; AJvYcCUiJMujblnjMoilMq4+MY5AKfc8mNEFDywHusG4tqYZlhUS3T3vm7tq8AoTyIN6uzjy2brPWNb0/BAtKOJW@lists.linux.dev
X-Gm-Message-State: AOJu0YwZLboLjaDk0+yRmRDWQ2soM21YG1MhTeM6iUu7qBMLOCRAQoDO
	HKqy9x1Qfg3eeNfjFPNHeCyo4BwBrko8+Ni9lhvvHcGS7MlM4ho5CYTC
X-Gm-Gg: AZuq6aLnWVVmJA+keEVdDwZhoRG4X3PuCat2++WF9yPL5wrOrvgh+pOQnRjLKM/lYyH
	yRV9hZ14cA4Sx5zlJ+nMtmH1+PvgrLCOokQ7JcRViKN4MEVFwUxuEC0YyOZgmwgfX/PuaMh3qhu
	MFbuqVV7ENfTMjqY8/1EYLdJydw6y+lw5n0MUYoqVv+WkuB776bYiJhMaQIZz33qJKSxTWKYnzv
	u7/BBMslHAlweHL2wfWWGTXrkwArBLXbyr6686yA+sHR32+wBRSyDhyN6gNHcZaMF2/IiSmI7Gr
	Z6reYuJ0zhRCRcgc3B966zAfW6STdijouIxT/uSNhjZb3MbnWf91mz3zguH8NBFEwNDMBEJ7u0E
	/9DBSSlZejcLkvGbJmgFXT/yLLc3LGBxzkW6eLKjMb9MGHTMHZ9RKTAoKhxUPYxyaWe0qpxV3oh
	zMrsVGwuQY1ASwslus6QLKpdvIffJb8rOvuo5bjfMUkwY=
X-Received: by 2002:a17:90b:3f44:b0:340:99fd:9676 with SMTP id 98e67ed59e1d1-35367013c64mr817474a91.10.1769128346845;
        Thu, 22 Jan 2026 16:32:26 -0800 (PST)
Received: from tehuang-Alienware-m16-R2.. ([50.47.240.160])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-353355e1161sm3420415a91.17.2026.01.22.16.32.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 16:32:26 -0800 (PST)
From: Michael Huang <tehsiu.huang@gmail.com>
To: gregkh@linuxfoundation.org
Cc: straube.linux@gmail.com,
	hansg@kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Huang <tehsiu.huang@gmail.com>
Subject: [PATCH] staging: rtl8723bs: fix coding style issues in rtw_mlme.c
Date: Thu, 22 Jan 2026 16:32:05 -0800
Message-ID: <20260123003205.33898-1-tehsiu.huang@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch fixes several checkpatch.pl issues:
1. Remove redundant else after break/return.
2. Remove unnecessary boolean comparisons (== true/false).
3. Fix trailing whitespaces and overly deep indentation.

Signed-off-by: Michael Huang <tehsiu.huang@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 98704179ad35..71a0efe49bdd 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -710,8 +710,8 @@ void rtw_surveydone_event_callback(struct adapter	*adapter, u8 *pbuf)
 	rtw_set_signal_stat_timer(&adapter->recvpriv);
 
 	if (pmlmepriv->to_join) {
-		if ((check_fwstate(pmlmepriv, WIFI_ADHOC_STATE) == true)) {
-			if (check_fwstate(pmlmepriv, _FW_LINKED) == false) {
+		if (check_fwstate(pmlmepriv, WIFI_ADHOC_STATE)) {
+			if (!check_fwstate(pmlmepriv, _FW_LINKED)) {
 				set_fwstate(pmlmepriv, _FW_UNDER_LINKING);
 
 				if (rtw_select_and_join_from_scanned_queue(pmlmepriv) == _SUCCESS) {
@@ -1206,10 +1206,9 @@ void rtw_joinbss_event_prehandle(struct adapter *adapter, u8 *pbuf)
 						rtw_free_stainfo(adapter,  pcur_sta);
 
 					ptarget_wlan = rtw_find_network(&pmlmepriv->scanned_queue, pnetwork->network.mac_address);
-					if (check_fwstate(pmlmepriv, WIFI_STATION_STATE) == true) {
-						if (ptarget_wlan)
-							ptarget_wlan->fixed = true;
-					}
+					if (check_fwstate(pmlmepriv, WIFI_STATION_STATE) &&
+					    ptarget_wlan)
+						ptarget_wlan->fixed = true;
 				}
 
 			} else {
@@ -1560,10 +1559,6 @@ void _rtw_join_timeout_handler(struct timer_list *t)
 				do_join_r = rtw_do_join(adapter);
 				if (do_join_r != _SUCCESS)
 					continue;
-
-				break;
-			} else {
-				rtw_indicate_disconnect(adapter);
 				break;
 			}
 		}
@@ -2018,7 +2013,7 @@ int rtw_restruct_wmm_ie(struct adapter *adapter, u8 *in_ie, u8 *out_ie, uint in_
 	return ielength;
 }
 
-/* Ported from 8185: IsInPreAuthKeyList(). 
+/* Ported from 8185: IsInPreAuthKeyList().
  * (Renamed from SecIsInPreAuthKeyList(), 2006-10-13.)
  * Added by Annie, 2006-05-07.
  *
-- 
2.43.0

