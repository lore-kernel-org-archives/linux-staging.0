Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C56311C84DC
	for <linux-staging@lists.linux.dev>; Sat, 24 Jan 2026 23:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769296593; cv=none; b=VUwOHKquAugdSLdpIUFC5nH90jR+7FpjfC5VWCeSWr0bpRkhaoU2b0jCkGr6vz5m69q1tsCjFfYuAU0mWy6UKM5yVwuRccn5XiT6pqffopDdEVAWQSy83soVYn5Lx+AJ1QnS6mRU/5TnqIVTliWLNZ03WB+GXK4Hx/ppccw4y6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769296593; c=relaxed/simple;
	bh=9cLPtVoM6XBgYdPNm02u/wUyoffIHQz3WhmZ9JF55Ns=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZUMqJnBrg6862R12ayK109lSdktY4Jz52wzwGREVNZf55PeLS6gJtiD8svb3mekg4k1HEtRlftsh7O7VQo9LivxOM32IlDHwYkcwL0ZA8m6zIcF8yZmnwTLstiBsk8VUekzifO2nwWTEXpaLYN2Qb1dh37Ajsl9nlJ6KyhjkOcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RrYA+eiJ; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RrYA+eiJ"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-352e2c59264so2435500a91.0
        for <linux-staging@lists.linux.dev>; Sat, 24 Jan 2026 15:16:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769296591; x=1769901391; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ikyD4BpDYjoVQTGheyIyXWdCqMtbvOsqd//2mMazfZY=;
        b=RrYA+eiJHi4gbjWaXZUrgvosIRtjqMf1/Fm2ERCByTzkWjWxrabrGMSS+XDcKAcx0y
         wKFrMa22V9E42tAcSp2+Uv69KDRzu/FR15zRm6K2AtzFmhZepuJp8wUifD5SPDMd+WR5
         xnFuKVUwbFvwmDzeiSwNd45bf9ZOMGlrYYUiagtNAvcgiUoFf7vkhhLFliDsKIEXyKCl
         S0MLESlL76KLgZEQaRkvmO8/1/zIEHuL1yqm85HpuPMWL3hEtiyreqiXekKvBwU3SViI
         ccEpkxUsLn1NszTqJph4lv05FENLf0qrJ3u6mefaGqM0rM/zntqW86RHJ0QG5p/tiDCc
         BGUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769296591; x=1769901391;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ikyD4BpDYjoVQTGheyIyXWdCqMtbvOsqd//2mMazfZY=;
        b=EMult/JuSJZAOrM0zLv/ky+qzPzhJZG4jjFFovlrrSIVpA4j5AbdReJnkjCK2qGYAe
         PW1uLpJAVNixfyHXNYkvi8K+AS0nwX3SaW1SUGL4IkPn+F80Es05DxWB6TGKMj8CElSZ
         yu3lVMVizRWS+xgv6ToFsThtcDY1pb3pvIgLWV90lNw873SF1A08VA6GE7+y11jEmr2a
         THqDsBWOfsHS88WB7aAIlamK22BRv5FxArLZKaRPw49oqucdTF5pm1hInW6hIcPPeTGT
         dan/rZTLXzO2zRTuywimdY2wxSFO5VjlAHGbbQAYSqw4/McEf05ncjaSH6qkCy1WqGNR
         3Wgw==
X-Forwarded-Encrypted: i=1; AJvYcCXj9vhas28p47o1XdpMsSBaQtNe8Rgutc+3lmkYCbX1X30VaXHjcxX+SsYhi7wuguhRNOqik4OCJCcZZ5ZB@lists.linux.dev
X-Gm-Message-State: AOJu0YzINDof9FYDeiyY+UZE4GnqfVb1dReLIswCrVtudOs9TEA4H4y3
	FCjo6vTc39i9dakP1uTJZdnawFQTMBRl1Tza677yD3u6D63w2rFPaVgmVJv5HbfL
X-Gm-Gg: AZuq6aJWSg/OrIzTbXJF/5R6APqemrPkITYBa7SsS1qD44As0PNvO6kGwbuMvCfYvXq
	nTs70rlaMynFasIxyv+619AxkDBeREO7FijXiuqirzrGOCpwGi+0atb8byb6tSaaIEJJB1owb+y
	q1bIhXW9aM+PCIQWyUMTK2x5OpPk03aJiNyIgfHOUeHb+7F6FJdMShkWR0eypw/8Oz6eg9YMgXB
	jOBQSwQ0X35sRuYzCiHSIJG5F3EXcp0bOVgsbJMRJgq1bBd7gRi7HK7eDtPRdwzIYLJ59QQm5cw
	64n+2YZZKU8aqcFy5W5uILmcIUSKsNb1ApD09H6vL6YpVuSxyD0vvU1L8cZIGsD8lsL30SZFklg
	8cX44Kz0r0O9+90hIJROs/vWX0YCKiRYSWAsYr05PRk+U89u1SJhKlcL9Kw5aban4nRtZnRYx1K
	H4/DFjFrpNu+L/2pZ0hvdRrHaycpHyXme0
X-Received: by 2002:a17:90b:2243:b0:340:a1a8:eb87 with SMTP id 98e67ed59e1d1-353c41a5765mr159582a91.35.1769296591127;
        Sat, 24 Jan 2026 15:16:31 -0800 (PST)
Received: from tehuang-Alienware-m16-R2.. ([50.47.240.160])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8231873bf53sm5604506b3a.45.2026.01.24.15.16.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Jan 2026 15:16:30 -0800 (PST)
From: Michael Huang <tehsiu.huang@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Huang <tehsiu.huang@gmail.com>
Subject: [PATCH v5 4/7] staging: rtl8723bs: Fix the line length exceeding 100 columns warning in the code
Date: Sat, 24 Jan 2026 15:15:54 -0800
Message-ID: <20260124231557.18189-5-tehsiu.huang@gmail.com>
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

Split lines that exceed the 100-character limit into multiple lines.
This resolves checkpatch.pl warnings and improves the visual layout
of the source code.

Signed-off-by: Michael Huang <tehsiu.huang@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 40 ++++++++++++++-----
 1 file changed, 30 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index bc0c9ee801e1..7f9251583a97 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -4932,7 +4932,9 @@ void _linked_info_dump(struct adapter *padapter)
 	if (padapter->bLinkInfoDump) {
 
 		if ((pmlmeinfo->state&0x03) == WIFI_FW_STATION_STATE)
-			rtw_hal_get_def_var(padapter, HAL_DEF_UNDERCORATEDSMOOTHEDPWDB, &UndecoratedSmoothedPWDB);
+			rtw_hal_get_def_var(padapter,
+					    HAL_DEF_UNDERCORATEDSMOOTHEDPWDB,
+					    &UndecoratedSmoothedPWDB);
 
 		for (i = 0; i < NUM_STA; i++) {
 			if (pdvobj->macid[i]) {
@@ -5000,9 +5002,18 @@ void linked_status_chk(struct adapter *padapter)
 			{
 				if (rx_chk != _SUCCESS) {
 					if (pmlmeext->retry == 0) {
-						issue_probereq_ex(padapter, &pmlmeinfo->network.ssid, pmlmeinfo->network.mac_address, 0, 0, 0, 0);
-						issue_probereq_ex(padapter, &pmlmeinfo->network.ssid, pmlmeinfo->network.mac_address, 0, 0, 0, 0);
-						issue_probereq_ex(padapter, &pmlmeinfo->network.ssid, pmlmeinfo->network.mac_address, 0, 0, 0, 0);
+						issue_probereq_ex(padapter,
+								  &pmlmeinfo->network.ssid,
+								  pmlmeinfo->network.mac_address,
+								  0, 0, 0, 0);
+						issue_probereq_ex(padapter,
+								  &pmlmeinfo->network.ssid,
+								  pmlmeinfo->network.mac_address,
+								  0, 0, 0, 0);
+						issue_probereq_ex(padapter,
+								  &pmlmeinfo->network.ssid,
+								  pmlmeinfo->network.mac_address,
+								  0, 0, 0, 0);
 					}
 				}
 
@@ -5507,8 +5518,11 @@ u8 sitesurvey_cmd_hdl(struct adapter *padapter, u8 *pbuf)
 
 		for (i = 0; i < RTW_SSID_SCAN_AMOUNT; i++) {
 			if (pparm->ssid[i].ssid_length) {
-				memcpy(pmlmeext->sitesurvey_res.ssid[i].ssid, pparm->ssid[i].ssid, IW_ESSID_MAX_SIZE);
-				pmlmeext->sitesurvey_res.ssid[i].ssid_length = pparm->ssid[i].ssid_length;
+				memcpy(pmlmeext->sitesurvey_res.ssid[i].ssid,
+				       pparm->ssid[i].ssid,
+				       IW_ESSID_MAX_SIZE);
+				pmlmeext->sitesurvey_res.ssid[i].ssid_length =
+					pparm->ssid[i].ssid_length;
 			} else {
 				pmlmeext->sitesurvey_res.ssid[i].ssid_length = 0;
 			}
@@ -5536,7 +5550,8 @@ u8 sitesurvey_cmd_hdl(struct adapter *padapter, u8 *pbuf)
 		}
 	}
 
-	if ((pmlmeext->sitesurvey_res.state == SCAN_START) || (pmlmeext->sitesurvey_res.state == SCAN_TXNULL)) {
+	if ((pmlmeext->sitesurvey_res.state == SCAN_START) ||
+	    (pmlmeext->sitesurvey_res.state == SCAN_TXNULL)) {
 		/* disable dynamic functions, such as high power, DIG */
 		Save_DM_Func_Flag(padapter);
 		Switch_DM_Func(padapter, DYNAMIC_FUNC_DISABLE, false);
@@ -5799,7 +5814,7 @@ u8 mlme_evt_hdl(struct adapter *padapter, unsigned char *pbuf)
 
 	/*  checking if event size match the event parm size */
 	if ((wlanevents[evt_code].parmsize != 0) &&
-			(wlanevents[evt_code].parmsize != evt_sz))
+	    (wlanevents[evt_code].parmsize != evt_sz))
 		goto _abort_event_;
 
 	atomic_inc(&pevt_priv->event_seq);
@@ -5937,8 +5952,13 @@ u8 set_chplan_hdl(struct adapter *padapter, unsigned char *pbuf)
 
 	setChannelPlan_param = (struct SetChannelPlan_param *)pbuf;
 
-	pmlmeext->max_chan_nums = init_channel_set(padapter, setChannelPlan_param->channel_plan, pmlmeext->channel_set);
-	init_channel_list(padapter, pmlmeext->channel_set, pmlmeext->max_chan_nums, &pmlmeext->channel_list);
+	pmlmeext->max_chan_nums = init_channel_set(padapter,
+						   setChannelPlan_param->channel_plan,
+						   pmlmeext->channel_set);
+	init_channel_list(padapter,
+			  pmlmeext->channel_set,
+			  pmlmeext->max_chan_nums,
+			  &pmlmeext->channel_list);
 
 	if (padapter->rtw_wdev && padapter->rtw_wdev->wiphy) {
 		struct regulatory_request request;
-- 
2.43.0

