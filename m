Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 659AC3C9ED5
	for <linux-staging@lists.linux.dev>; Wed, 15 Jul 2026 11:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784114243; cv=none; b=SH3JNm4S4K3qymN+7klA8O429VnvCW2MH+gAZf39sBS8l/c3AsnChUm92/m+teYfw5Zmgfz/yNZzbDnmXQ7i5MbeL7eCVKtF4w7SbQnXRrivdBRU+SmybhElMunTwvR4XAhpo+x6yqYzEdCQOzbah4235togiqAqAtfFolAESXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784114243; c=relaxed/simple;
	bh=Vo3MuuffeObU4toTDwymqx6wj5UgGx6UqL3hNTXyqMw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JQLbJI9yyQUtznMbOvJiF9jY0BsitE/rwn5RLMeprXZg5Qcfsutyw6AiXCSnurq7nxJVcDi+QJEBR0fo2J5WkBrqt0smGH27isovjLiUfd+KsQ88IW0iDuZRDXIB4pywiZNwSk6HaUy6oWOCrjAWtmJrNYHpEU7KXitbAc+iCcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ody8PiP8; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ody8PiP8"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2cabc0a1ab6so63150815ad.0
        for <linux-staging@lists.linux.dev>; Wed, 15 Jul 2026 04:17:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784114242; x=1784719042; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8waF9EW74z7Esj6+w6hWltBONCw/KZlMedKilRZKH2s=;
        b=Ody8PiP865n/sNWuKHvb6fC4mA7iZMmp4JhCT9OvbhK42J78Il1XRuqP2L9dm+1VL9
         q4D0R/0Xdhmh6ggG7/fgR5vzW3pXxM2e1go+m/O3+yhO5Rbu8+CHGbVmbleO6KbX95PS
         UZAzgp5jzm1LutMR1GfYBw20XgXr1eUUebcNCrX0hUh8VRCnZqAjc4kwvHALfkkDoqRJ
         s4oHuE3Z0mJvOmWf8ip+BgZv8Y/pKfLbG2aDVWvbcBu3VWyhhLPUq4sMFJWLO3AfJVFE
         /X530IXsFvPEkIkBX9erh1/fn/XYQKaF7E6h02e/NDz3J+Q4ewJ4YrSgBBYPuPwm6N5o
         lG4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784114242; x=1784719042;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8waF9EW74z7Esj6+w6hWltBONCw/KZlMedKilRZKH2s=;
        b=rItS+s9ORVKHYFy/pQYfnrfuB8pbzP/mUK2igRe4vAGPlRKzGXBXvgbByrNy9dDGS+
         /VWKnRXX4nrMgXh1n6Q/1G3q1grQX4wZFQR6JqCu87J+49q0P6EYr6H50q1berpk/o6K
         28JKR/jNWxbfa7WjpauD6UJreXkaoKjUUVV3IUY3NjOK7c0oIRax7qv3D6Rx3RXcCXDY
         BOvCmoI9lD2oPTLA+uapJUEw7zvEWUs+5lgr+Z+MXMqR++zAjaMIUzYYvliSnPSXOn6U
         BYyIArH5HycOYtdvt5cq0uV5ag+xvvm8PsqWDd57xcUqClrm2s5UItNklY+PLZMBsl7W
         I/nQ==
X-Forwarded-Encrypted: i=1; AHgh+RrK67GwiNSUE9ezyBmboFw51dvwOcctkG/h+hG7WJIHdLlf/tqP9gwyE1v4yqkn6DP9GlRp5J/0NSIvRBV8@lists.linux.dev
X-Gm-Message-State: AOJu0Yw4Y1nZbIPoUSouMX4Hqn5eDtkMwZzW+yOgWuRY+I4H6C7rf5VO
	QkeDFe3PdfvV458Bskq+WQ7yno9N6v6XuAmga5HCY/Zsxa0wTWhjEYKy
X-Gm-Gg: AfdE7cnXiLlMPyB4LqZAWIURX4vKU+llMyUm4Xaq01xcrYw5g62D52mWFv+2oU+IAmT
	yIi5Rr2Cv0cyNvfX3uNb11gLoRDS/XekaEXkiJFhW/37tWhQg8n7x2Zj7wSKIo4HOGGNy31nEN+
	uXBLz3FNiz05rrEVPsNbvfAPyx2nUHdCXbk7G+FfJxFRC5PjBtUcSLybO+L8xo3U16cy9QhjRQN
	mizdFGJx3eBXRr0+1sgmkyKr0EenKthdaamJzl2MgirxVsRCaozweZiVti4iX9uvkS3REukAwvN
	5JhngHdN7bN3OOXXYlLl/V7u+uDyEhSSETd0E6/yQKvvoWfPklc9gR/V5I+vnNAEDI/E1NJ8XBW
	JZVJHdqZ411jpIX8FGpNuLOcWNv9h/IiZ5UwrNdReeS2wBnUQvJWgT736t8TCTWHxZvL+tzH5IN
	TP9Ha8hosqP6+NTyLg/WlE6P1zplZagw==
X-Received: by 2002:a17:902:da89:b0:2b7:975c:dacc with SMTP id d9443c01a7336-2cee9a650ecmr76181715ad.1.1784114241648;
        Wed, 15 Jul 2026 04:17:21 -0700 (PDT)
Received: from SGN-LDSENG.tasernet.com ([2405:4800:5cc3:11a:1ac0:4dff:fe8b:4a69])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf10701ab0sm467845ad.77.2026.07.15.04.17.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 04:17:21 -0700 (PDT)
From: Cong Nguyen <congnt264@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <error27@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Cong Nguyen <congnt264@gmail.com>
Subject: [PATCH v2] staging: rtl8723bs: fix xmit_frame/xmit_buf leaks on mgnt-frame error paths
Date: Wed, 15 Jul 2026 18:17:10 +0700
Message-Id: <20260715111710.295052-1-congnt264@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260714163525.175763-1-congnt264@gmail.com>
References: <20260714163525.175763-1-congnt264@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

issue_beacon(), issue_probersp() and issue_asocrsp() obtain a management
xmit_frame together with its xmit_buf from the driver's fixed-size
management-TX pools via alloc_mgtxmitframe(). On the normal path the frame
is handed to dump_mgntframe(), which transfers ownership and eventually
returns both objects to their pools (the frame and, for beacons, the buf
in rtl8723bs_mgnt_xmit(); other bufs via the pending-xmitbuf/TX-completion
path).

Several error/edge paths return early after a successful
alloc_mgtxmitframe() but before dump_mgntframe(), so ownership is never
transferred and neither object is freed:

  - issue_beacon(): beacon larger than 512 bytes
  - issue_probersp(): cur_network->ie_length > MAX_IE_SZ
  - issue_probersp(): kzalloc() of the SSID scratch buffer fails
  - issue_asocrsp(): pkt_type is neither ASSOCRSP nor REASSOCRSP

Because alloc_mgtxmitframe() removes the frame and buf from their free
lists (list_del_init) without placing them on any pending list, an
orphaned pair is on no list and referenced by nobody, so it is only
reclaimed at driver teardown. Repeated hits progressively exhaust the
management-TX pools until alloc_mgtxmitframe() returns NULL and the
interface can no longer send beacons or probe/assoc responses.

Free the frame and buffer on these paths, matching the existing correct
error handling in issue_assocreq().

Fixes: 554c0a3abf21 ("staging: Add rtl8723bs sdio wifi driver")
Signed-off-by: Cong Nguyen <congnt264@gmail.com>
Reviewed-by: Dan Carpenter <error27@gmail.com>
---
v2:
 - Add Fixes tag (Dan Carpenter)

 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 22 ++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index 8cf3c14a0dd7..354acd7ceb6f 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -2196,8 +2196,11 @@ void issue_beacon(struct adapter *padapter, int timeout_ms)
 
 	spin_unlock_bh(&pmlmepriv->bcn_update_lock);
 
-	if ((pattrib->pktlen + TXDESC_SIZE) > 512)
+	if ((pattrib->pktlen + TXDESC_SIZE) > 512) {
+		rtw_free_xmitbuf(pxmitpriv, pmgntframe->pxmitbuf);
+		rtw_free_xmitframe(pxmitpriv, pmgntframe);
 		return;
+	}
 
 	pattrib->last_txcmdsz = pattrib->pktlen;
 
@@ -2258,8 +2261,11 @@ void issue_probersp(struct adapter *padapter, unsigned char *da, u8 is_valid_p2p
 	pattrib->pktlen = pattrib->hdrlen;
 	pframe += pattrib->hdrlen;
 
-	if (cur_network->ie_length > MAX_IE_SZ)
+	if (cur_network->ie_length > MAX_IE_SZ) {
+		rtw_free_xmitbuf(pxmitpriv, pmgntframe->pxmitbuf);
+		rtw_free_xmitframe(pxmitpriv, pmgntframe);
 		return;
+	}
 
 	if ((pmlmeinfo->state & 0x03) == WIFI_FW_AP_STATE) {
 		pwps_ie = rtw_get_wps_ie(cur_network->ies + _FIXED_IE_LENGTH_,
@@ -2309,8 +2315,11 @@ void issue_probersp(struct adapter *padapter, unsigned char *da, u8 is_valid_p2p
 				sizeof(struct ieee80211_hdr_3addr);
 
 			buf = kzalloc(MAX_IE_SZ, GFP_ATOMIC);
-			if (!buf)
+			if (!buf) {
+				rtw_free_xmitbuf(pxmitpriv, pmgntframe->pxmitbuf);
+				rtw_free_xmitframe(pxmitpriv, pmgntframe);
 				return;
+			}
 
 			ssid_ie = rtw_get_ie(ies + _FIXED_IE_LENGTH_, WLAN_EID_SSID, &ssid_ielen,
 					     (pframe - ies) - _FIXED_IE_LENGTH_);
@@ -2689,10 +2698,13 @@ void issue_asocrsp(struct adapter *padapter, unsigned short status, struct sta_i
 
 	SetSeqNum(pwlanhdr, pmlmeext->mgnt_seq);
 	pmlmeext->mgnt_seq++;
-	if ((pkt_type == WIFI_ASSOCRSP) || (pkt_type == WIFI_REASSOCRSP))
+	if ((pkt_type == WIFI_ASSOCRSP) || (pkt_type == WIFI_REASSOCRSP)) {
 		SetFrameSubType(pwlanhdr, pkt_type);
-	else
+	} else {
+		rtw_free_xmitbuf(pxmitpriv, pmgntframe->pxmitbuf);
+		rtw_free_xmitframe(pxmitpriv, pmgntframe);
 		return;
+	}
 
 	pattrib->hdrlen = sizeof(struct ieee80211_hdr_3addr);
 	pattrib->pktlen += pattrib->hdrlen;
-- 
2.25.1

