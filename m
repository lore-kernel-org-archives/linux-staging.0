Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58D91360EE1
	for <linux-staging@lists.linux.dev>; Thu,  3 Sep 2026 05:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788412771; cv=none; b=RQlxMNyBvRXeQDbimBuaVcZz/paBF6kd3fIcSp42snPfNBTYdWMvYrIRzEt3L0K2JuK2dR8ZI3JqAekmAv7l9G4xAHLbQSfb9KlPanLkHTd6G/Ej3dUBYSdM5JWbm8UtKWm1JgUkfRZ8COhes+LCIG6HplMGYxGq41PW2g9S+3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788412771; c=relaxed/simple;
	bh=raCy1icJURfHfg8hvmwuYspa5lN3bzdTo9njuaSZWyU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QqPBX8Q9cpDLZouczHuWKl2xLVdit8eRvypdYgKvtRpxC5M/TtLXWKUf31tUc1tDRz1O47DfrkMyalCP6hzOvdA8r5iuxVRIYCA2ptMBNa0dbvzJghFiY+ucX+hwY6CGC/WYgtlJ/qsjH2Iu6RtHfhKeE5mzqxP2YzGESuniqn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a/vNT6e2; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a/vNT6e2"
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5bfc5b77c02so1726051e0c.0
        for <linux-staging@lists.linux.dev>; Wed, 02 Sep 2026 22:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788412769; x=1789017569; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JhiKCb/De7JeZ/3UG9kBoVo3lIlkR7a6UOucprZ94/s=;
        b=a/vNT6e23IAHa/s6/nL0N9842ZiqCErF+AglenamkZQp2+t9sQy0fr29JshcYNjiae
         o7X7ZKLu8oUkV9v1D6IhBh0PHzSNlGHLz4onmnaB4jh1xm0t/Az/qQpcxtH3TAn5DHU5
         xexdgFo179q78OTbzuWlh2AnrzkU0GHMj6mK/lseQfH/LuxajmApr8xMyyw5l3/sJVSk
         Xv43Sh1SfbEkGgt1cqWCcgQsej9iDo0o71ELMc4VI/OBIgouEtCROyjGe+rnyFQnP5yQ
         2NUnOQo2irlXrdsRwHiMsKFb6Tajzl/zcejZRhfkt6FoCAFx7k+RzBGPZespDh4hDSE/
         JCdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788412769; x=1789017569;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JhiKCb/De7JeZ/3UG9kBoVo3lIlkR7a6UOucprZ94/s=;
        b=iEW287gk+azEitjVGwg+TSAtBVyiUB539uTkisebM0QgH5UcTTAqqe1GuPmEfmuvSd
         0YgOOqeDNFvDCu3BNcz/ab1XH7FqxQaCxGjezZ6HIlSUpg597082mLxjHHX118R3DuLa
         cvyYPZpWCUxXCx6dZmfrxn2tzPtME7HRUMsF3ZNTqJZjdLe7bEPomutK9blqYkq0wCiq
         tUKNxQ4JAIRCDxC3XT14AypyuiqEuH7bwnz+xPYhe7En/OlARaeupkvFnL7pL5RtMAO2
         qyctLw1hyKi21QooMeBMkqfwiT+Vtll1uQ8td32oKatB3SJk06i4cXF13DSaww50qNpp
         g8Sw==
X-Gm-Message-State: AFuF++liNXiH2eJiT9EV2eOdivYnZ8Xar23cY05liPwlq8z5r+5XBefA
	kJH++G491Hm3Xcsf5c1bjiuQ1GV1hNYO3y8RbZnnCRILjFVWuBnf6f0f
X-Gm-Gg: AYBFou2unI44C3CHIDK2/0Pr98ABiy6MnEf8EV9j9ptsIzyIJISkkQCG22lU9RMDvU2
	i/VVCOLJ1NOh/S5hL461WQPaM5Z10HWdP6S/d9wfv0IpC7mW3D+VifrVe2fA1Nn62hOITVPpiAd
	5toVTH1ptIbgwtOUoYmVYK0xhmtQ3vgUiRUHOysfbepbKaU5BATdKd+ccHer3HS3YFNDE6sJ9OR
	y1QAEA0T8wrqzUVaKzJa4QYgqp+gIFmehHXrQm054ItN3nN4q4P23ge8d7SUgd+FJSAF+HBB01Y
	GvWlljkMyl/L7BE2/oMePhN9U6XJl/gsL9nF/K/Y61KGRln8FgYcs8hMCsrDj/obAYAqYMIxu6U
	ZyMIz+r30yI7pPO6rzcSs1rQCzgYrA5qaonIS9wm9GG/FiAPg32EbcVmRtpBD6OEWVV0FpWO4Mo
	CkkHZqhwB53iuGsRTGdUdssSeeqzBGUNlB5fkPx9YDaWJrTwvBrudB2dMZU4V8AC4N
X-Received: by 2002:a05:6122:8c3:b0:5bf:9bfa:53a0 with SMTP id 71dfb90a1353d-5c7d2462268mr4480821e0c.1.1788412764474;
        Wed, 02 Sep 2026 22:19:24 -0700 (PDT)
Received: from [127.0.1.1] ([2804:14d:9ea1:8718:4ce2:18a3:3335:cf81])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c7cd8ce88dsm3618080e0c.9.2026.09.02.22.19.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 22:19:23 -0700 (PDT)
From: Leonardo Martins Martins <dev.lmmrtns@gmail.com>
Date: Thu, 03 Sep 2026 02:18:09 -0300
Subject: [PATCH 3/4] staging: rtl8723bs: remove invariant parameters from
 _issue_probereq()
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-issue_probereq-v1-3-82f153d157a1@gmail.com>
References: <20260903-issue_probereq-v1-0-82f153d157a1@gmail.com>
In-Reply-To: <20260903-issue_probereq-v1-0-82f153d157a1@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Leonardo Martins Martins <dev.lmmrtns@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788412751; l=2382;
 i=dev.lmmrtns@gmail.com; s=20260813; h=from:subject:message-id;
 bh=raCy1icJURfHfg8hvmwuYspa5lN3bzdTo9njuaSZWyU=;
 b=reqSz8oD1t8+nGiU4ALLKyUZnmnY+/etlAMmnx799Q8QVj14lLEoXoQzjy1GNjyt2zSt/akZ3
 +4pJsNuZJX+B/uZa+yjpr/y3C6JX0pUDAgmPg272wz+EiYAVMZ3iowf
X-Developer-Key: i=dev.lmmrtns@gmail.com; a=ed25519;
 pk=dOFSCpUL7hbyVftAaUGDebsgsSl9Uk/Tx0Aqpd4Bcng=

The parameters ch and wait_ack in _issue_probereq() are always 0 and
false respectively, remove them and remove unreachable code that depends
on them not being these values.

Signed-off-by: Leonardo Martins Martins <dev.lmmrtns@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 18 +++++-------------
 1 file changed, 5 insertions(+), 13 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index d3c87d25fab1108adde15d959e0b890b2180f20d..b3642c5021a230bd70e5d8fd8d5bf77ad1d8946a 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -2401,9 +2401,8 @@ void issue_probersp(struct adapter *padapter, unsigned char *da, u8 is_valid_p2p
 	dump_mgntframe(padapter, pmgntframe);
 }
 
-static void _issue_probereq(struct adapter *padapter,
-			    struct ndis_802_11_ssid *pssid,
-			    u8 *da, u8 ch, bool append_wps, bool wait_ack)
+static void _issue_probereq(struct adapter *padapter, struct ndis_802_11_ssid *pssid, u8 *da,
+			    bool append_wps)
 {
 	struct xmit_frame		*pmgntframe;
 	struct pkt_attrib		*pattrib;
@@ -2468,9 +2467,6 @@ static void _issue_probereq(struct adapter *padapter,
 		pframe = rtw_set_ie(pframe, WLAN_EID_SUPP_RATES, bssrate_len, bssrate, &(pattrib->pktlen));
 	}
 
-	if (ch)
-		pframe = rtw_set_ie(pframe, WLAN_EID_DS_PARAMS, 1, &ch, &pattrib->pktlen);
-
 	if (append_wps) {
 		/* add wps_ie for wps2.0 */
 		if (pmlmepriv->wps_probe_req_ie_len > 0 && pmlmepriv->wps_probe_req_ie) {
@@ -2482,21 +2478,17 @@ static void _issue_probereq(struct adapter *padapter,
 
 	pattrib->last_txcmdsz = pattrib->pktlen;
 
-	if (wait_ack) {
-		dump_mgntframe_and_wait_ack(padapter, pmgntframe);
-	} else {
-		dump_mgntframe(padapter, pmgntframe);
-	}
+	dump_mgntframe(padapter, pmgntframe);
 }
 
 inline void issue_probereq(struct adapter *padapter, struct ndis_802_11_ssid *pssid, u8 *da)
 {
-	_issue_probereq(padapter, pssid, da, 0, 1, false);
+	_issue_probereq(padapter, pssid, da, 1);
 }
 
 void issue_probereq_ex(struct adapter *padapter, struct ndis_802_11_ssid *pssid, u8 *da)
 {
-	_issue_probereq(padapter, pssid, da, 0, 0, false);
+	_issue_probereq(padapter, pssid, da, 0);
 }
 
 /*  if psta == NULL, indicate we are station(client) now... */

-- 
2.47.3

