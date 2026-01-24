Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67EC918A6A7
	for <linux-staging@lists.linux.dev>; Sat, 24 Jan 2026 23:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769296594; cv=none; b=BoqfVRM/GpNGCbuE30RP3ComKXG/Xx+t6efF/j+4WOQebI4uFGjPLf3hq0aStlDsLAk7hvl3sLTj4BB71qfTIyVU+NcgPYtaV5e5UeC8E2kYnCrKPJgXhOln8UReUS+PFCZNT54rqAnYn6E/1aS/bDrh2xELCeSPZOUsORLYEjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769296594; c=relaxed/simple;
	bh=KZ873uhNOrs3oFP5zrdhpAhT9ibMvaDEGZBBqv+BWuo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aXpIMDssG5ShYE8DXA8wGn/Qatqb8B9c/eP9+hxcgH9FL/TTRcLTBWtWd6juzS3e1dTctJGfOyi6lwPrQ/LqmC7zSx9teZ2zCpMSbVikkkF8H1v9KJjzAaQoktm3gIpg1DhebZONL0FQdqV/JlYOfbt5HGFNVv8Np9+lmZQiKTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h/7BPjnk; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h/7BPjnk"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-352ccc61658so1521784a91.0
        for <linux-staging@lists.linux.dev>; Sat, 24 Jan 2026 15:16:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769296593; x=1769901393; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vWqBypiMoFICL/xF567F09TfFzK1ePlqTYkT2e2vfrs=;
        b=h/7BPjnkHOk9aK+kQluU4IQih21ihscjuoYpkPYgTYySwLaLt62jKJWHuGARoA1I1H
         gvwxTWXND4LLxmj2wYaCkZDOVAntVL9wbZTyXyneYNDmijEf+esO1wdERK2x9//bC+gD
         7GUyzqt6JWwm8qqRSfkO+JY/I+wi+w1tMOJMF1o+IEg4Yl0mO/aeOYUiHUdvLvHxyz6i
         m2UiJRoBA03Wp73lD4ftsn0eA8ASHc1TekLQ3olJXY+Y2lmMTKzj211yLEBbEiwRnpZD
         bIj293FRHA+IKFjYUcsEnVXWG7raWL03DapD8Lv//6ubeXuE1ZsB1rRI9IQzv0ijd38c
         F1yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769296593; x=1769901393;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vWqBypiMoFICL/xF567F09TfFzK1ePlqTYkT2e2vfrs=;
        b=XUFyImYgAEYPd+f7+9rQW/F22zxTSChbVeK5+SlkhvXUvh/81a/yvn5I97kjv0bfnv
         dP5A4cbS82fzZ0pAaAJfBTbX6T/A5Ap8umgUCOBFons4UT1qA/LUXxeZ/Tez/jN8fWfG
         xlMXdvK/MMkosEnFVJG1jOXjTEp22NCxhK9vHEFuRpDt4p9aD/RSNXmXVAknLoCLwaV1
         HLCm3/J0R+PuPyxbwlbgZ55Ws0BxUPOi1NvtPxiFLhsur85XGWW7Mv6dRAOHfyy2Z/aY
         aEGIXvJIKSIGFHnUhEMvOO4HhjvpRuH6OzlypkzufOOFUIwJRAfm1knNfShe+Br/HLwF
         JxKA==
X-Forwarded-Encrypted: i=1; AJvYcCUQ7ADySzzmNNmvkaJ8z2M6/2gLl3cgP4iTgBGsmlvHcOadkKy2QYlX6RSyBIkeFJtLwRKZZVHAhuvl3BPc@lists.linux.dev
X-Gm-Message-State: AOJu0YwJQ7TChZuu6SFjSOjPXM2XsXZBuIKxrNaBNzqPcE19bFgstlUT
	k2XjXrMcYw9htwZshMJlv47HLkknMOWOJT4yB+L3XqVoUeRNSQMZYowj
X-Gm-Gg: AZuq6aJwFvpoGUuzanwONNfj9FdLBrgn8D5LkqJkYF6WYynBoTEAxm2l3KZjoEFgr1K
	nuQWS/DVWLWfB9lXJMfjqQZEuHTsaHrfOYsqe6BfBuGA2ljpJ7F7KvFa/GND6AdheEY0LWKlSwg
	Hj2CSuPPKJwH+MzHWfM6TcbtSQ+6WsNHQ+rrR4qffAbgcc9UaGFhF99ml7HEhDwMqo+7jcaIVIw
	+ng9k06sn41c3FNqKWaTvUtZMERsU5X8T8PJWjcW+CEgfy35OHVXDmRIt67H+fZRvVSgfDeI2kA
	7HigJHnBlNkT5//ok5pxbUQ03GsB9LnxLsbO8c6bsdwAxByky2zkBQoGG18DtirJFxN5PxUVyOz
	12f1Jo93TRQQE0yu7jFpNf2mcbLrbUmjmubykN0PkRrdf0oJV+k9THefqTOxjiH6EaEw0IPUBNa
	HUkwmcp6GSV1CiK0wJ9kE/TGMZW8nCRlJo
X-Received: by 2002:a17:90a:c2ce:b0:33b:dec9:d9aa with SMTP id 98e67ed59e1d1-353c417d7d1mr121648a91.25.1769296592654;
        Sat, 24 Jan 2026 15:16:32 -0800 (PST)
Received: from tehuang-Alienware-m16-R2.. ([50.47.240.160])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8231873bf53sm5604506b3a.45.2026.01.24.15.16.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Jan 2026 15:16:32 -0800 (PST)
From: Michael Huang <tehsiu.huang@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Huang <tehsiu.huang@gmail.com>
Subject: [PATCH v5 5/7] staging: rtl8723bs: add missing space around operators
Date: Sat, 24 Jan 2026 15:15:55 -0800
Message-ID: <20260124231557.18189-6-tehsiu.huang@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260124231557.18189-1-tehsiu.huang@gmail.com>
References: <20260124104920.5721-1-tehsiu.huang@gmail.com>
 <20260124231557.18189-1-tehsiu.huang@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add required spaces around logical and assignment operators.

Signed-off-by: Michael Huang <tehsiu.huang@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index 7f9251583a97..5277267e9ef1 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -5037,7 +5037,7 @@ void linked_status_chk(struct adapter *padapter)
 			}
 
 			if (tx_chk == _FAIL) {
-				pmlmeinfo->link_count %= (link_count_limit+1);
+				pmlmeinfo->link_count %= (link_count_limit + 1);
 			} else {
 				pxmitpriv->last_tx_pkts = pxmitpriv->tx_pkts;
 				pmlmeinfo->link_count = 0;
@@ -5196,7 +5196,7 @@ u8 setopmode_hdl(struct adapter *padapter, u8 *pbuf)
 		type = _HW_STATE_AP_;
 		/* start_ap_mode(padapter); */
 	} else if (psetop->mode == Ndis802_11Infrastructure) {
-		pmlmeinfo->state &= ~(BIT(0)|BIT(1));/*  clear state */
+		pmlmeinfo->state &= ~(BIT(0) | BIT(1));/*  clear state */
 		pmlmeinfo->state |= WIFI_FW_STATION_STATE;/* set to	STATION_STATE */
 		type = _HW_STATE_STATION_;
 	} else if (psetop->mode == Ndis802_11IBSS) {
@@ -5749,8 +5749,8 @@ u8 set_tx_beacon_cmd(struct adapter *padapter)
 
 	memcpy(&(ptxBeacon_parm->network), &(pmlmeinfo->network), sizeof(struct wlan_bssid_ex));
 
-	len_diff = update_hidden_ssid(ptxBeacon_parm->network.ies+_BEACON_IE_OFFSET_,
-				      ptxBeacon_parm->network.ie_length-_BEACON_IE_OFFSET_,
+	len_diff = update_hidden_ssid(ptxBeacon_parm->network.ies + _BEACON_IE_OFFSET_,
+				      ptxBeacon_parm->network.ie_length - _BEACON_IE_OFFSET_,
 				      pmlmeinfo->hidden_ssid_mode);
 	ptxBeacon_parm->network.ie_length += len_diff;
 
@@ -5805,8 +5805,8 @@ u8 mlme_evt_hdl(struct adapter *padapter, unsigned char *pbuf)
 		goto _abort_event_;
 
 	peventbuf = (uint *)pbuf;
-	evt_sz = (u16)(*peventbuf&0xffff);
-	evt_code = (u8)((*peventbuf>>16)&0xff);
+	evt_sz = (u16)(*peventbuf & 0xffff);
+	evt_code = (u8)((*peventbuf >> 16) & 0xff);
 
 	/*  checking if event code is valid */
 	if (evt_code >= MAX_C2HEVT)
@@ -5853,7 +5853,7 @@ u8 chk_bmc_sleepq_hdl(struct adapter *padapter, unsigned char *pbuf)
 	if (!psta_bmc)
 		return H2C_SUCCESS;
 
-	if ((pstapriv->tim_bitmap&BIT(0)) && (psta_bmc->sleepq_len > 0)) {
+	if ((pstapriv->tim_bitmap & BIT(0)) && (psta_bmc->sleepq_len > 0)) {
 		msleep(10);/*  10ms, ATIM(HIQ) Windows */
 
 		/* spin_lock_bh(&psta_bmc->sleep_q.lock); */
-- 
2.43.0

