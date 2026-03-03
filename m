Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5C8F347505
	for <linux-staging@lists.linux.dev>; Tue,  3 Mar 2026 12:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772541876; cv=none; b=B8U0dSC9x/NbbRDY0J0M7Kj8XxImFueAizvjL17imUtuSaYKloJv0O2zdc/g4CMaOZwmdypZGZ0eR19oaq8jIE+MnZBeFEAuAbsl1ea/aR2S/d321qi4FCerM/7MxQ91Xmz5ufKqmgiWWc4LTJEVvHA0QxamazV9pd8sfa5lGhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772541876; c=relaxed/simple;
	bh=uaePVvUqY43fndnkcmj9ZE+XCjSSwnqVazHOuGlXskg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NR1+vT/eD0TOB0MtDzdpnsvf7CUj0Y492JvBel/p1nQfDf5Rn/pTw1oxoPUmR1JPHZwsSOmPvicXtv7aKbOUgvTKaPCVqgQXxrEzWe6oBFMd9F9CDRE9T/jeSLC/8mOL8+0djW3JEXdKeaf+yXhHzdkkOIUPeVH+u8/Xc/bYMcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FC7/tKvw; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FC7/tKvw"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4806b8fca44so7400325e9.0
        for <linux-staging@lists.linux.dev>; Tue, 03 Mar 2026 04:44:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772541873; x=1773146673; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fMQV0kVA1Xc2OKZN4OwDtIyLxduuBSWO+O/zVBvYQSE=;
        b=FC7/tKvwzDrbBFX0vdahnb/5m5fgfotLGCrtRbL7e3ecbRzCBvKFlswPRhn5tvW3eQ
         7V3zpdk8DtamRs8UClyv9tZj4wlxUTTrtiE558lqWT5qD3SKhggIv/atXrvNGC9/X8Wy
         Av/jyzZ+f2HSG0m5a+vaaRhxeOhTFAEm000dhvWkvCdBVeIu1uvSygh5MeN/0Z1pxR4w
         fnxMUCwEIlf9bMDfmJoQKSgU374QEl9Q8DPQn9ntgMdYf6aauPaMF47j+rj4FypB9tLQ
         WAS/sRXmykKi9nkhOTK9/gMBvtglFvR37CUkEAq1+1uZ9iBySxCqWQpvYTPOdVwNpwmN
         lgmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772541873; x=1773146673;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fMQV0kVA1Xc2OKZN4OwDtIyLxduuBSWO+O/zVBvYQSE=;
        b=GfIOR0H0w0i/9s8kMnYlatxPIcpHYojIUirApIp+Qar/H7bty/QTMqA+JvAGrf6Ubq
         +bo8I5jmb1AYn3AZWaizi5OzdXtba4rZ9b5apsnC+GQ1lqF6q0N3Gu2mgTofs2fXAYKz
         JeYrzyCpfgSD9VtPmRrA0PPxlYBD3+Cp+Pu0ly/LWBVTaCGX/uXuQtd/qq9RkiWkdJxC
         FiPXJycLVndjm2FJCPx4g2L9vuXg3tRcWKIR+G5RtqvynPFMdy4lj4fAcPw0MVRUgbkQ
         OXwtVs4YkZDw9OzXBBCoOCv4q8jXlnUatan69CMBPeF5Yvz54pQSA+NW8KOhykhoawgE
         yrDQ==
X-Gm-Message-State: AOJu0YzFLqyCmAOfmgldA1zh7nF4tOceU+1LUF1mM5zL2oPxgq/S8YEE
	aK490Tp46XN/l0i66KaruvTp4lM7ddyri0o+iyxo4ucSkHbZhBJ77/Ux
X-Gm-Gg: ATEYQzy5TQu2gSAFVUzUDGde3WLLV5au4pdS6z29DJ+hOaLzLRmv5zIKlmSHbWyKkTA
	QFYr5n6aXHy+TX9ksrVCB0KPfGSAWS8kk01XBNXqEUAPvBKksb+efNCNZCyyNslaG6PdyxCGu5A
	ysTF+5lu/6qpwNya4SR8cHpClmxKMAqQmIXflGAGRaRUdU06cJ2pGjRfLZcwmv5aDViLm2DHazp
	8YQ//sd+Ir0I0dgfQ67mCAH4zYXA/axad8FcDBECBPUXPQNQDNbiw6SQbO9AnD56lFkDnOcYyDx
	42syhuAIZPGqDaBSowj9F5LUR0ju9DyONPMCGbtcIDC8jR3Mpb0TD8Lrb8Udq3YTunTZGkC8etZ
	kofaBz1PMOLWHyhmxaCUinKHXxx4rUDXlm6rq4T2SEMu/athu0vCWXGdbh7E4cyIdRUxyEI+RV1
	f/BeN1iE4j+wTdQOvVl3iwBzc3emF/HsD8Ov57vJvIS9s7m7qmJY8HIiG/W/KfABNqgT57QvMDr
	P6l7rHFPKTSngEFV3uCpyGsEgkkSuzI7iI/ICb1+i7Y4gy96Tia
X-Received: by 2002:a05:600c:34d0:b0:47a:94fc:d063 with SMTP id 5b1f17b1804b1-483c9bc553amr171011025e9.1.1772541873002;
        Tue, 03 Mar 2026 04:44:33 -0800 (PST)
Received: from fedora ([149.3.87.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485135b4a11sm14507955e9.19.2026.03.03.04.44.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 04:44:32 -0800 (PST)
From: Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
Subject: [PATCH] staging: rtl8723bs: remove unnecessary parentheses in rtw_pwrctrl.c
Date: Tue,  3 Mar 2026 16:43:07 +0400
Message-ID: <20260303124306.260483-2-giorgitchankvetadze1997@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unnecessary parentheses around address-of expressions
(e.g. &(adapter->mlmepriv)) to address checkpatch warnings.

No functional changes.

Signed-off-by: Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_pwrctrl.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
index 666e241704d9..67d3def17da8 100644
--- a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
+++ b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
@@ -84,7 +84,7 @@ int ips_leave(struct adapter *padapter)
 static bool rtw_pwr_unassociated_idle(struct adapter *adapter)
 {
 	struct adapter *buddy = adapter->pbuddy_adapter;
-	struct mlme_priv *pmlmepriv = &(adapter->mlmepriv);
+	struct mlme_priv *pmlmepriv = &adapter->mlmepriv;
 	struct xmit_priv *pxmit_priv = &adapter->xmitpriv;
 
 	bool ret = false;
@@ -104,7 +104,7 @@ static bool rtw_pwr_unassociated_idle(struct adapter *adapter)
 
 	/* consider buddy, if exist */
 	if (buddy) {
-		struct mlme_priv *b_pmlmepriv = &(buddy->mlmepriv);
+		struct mlme_priv *b_pmlmepriv = &buddy->mlmepriv;
 
 		if (check_fwstate(b_pmlmepriv, WIFI_ASOC_STATE|WIFI_SITE_MONITOR)
 			|| check_fwstate(b_pmlmepriv, WIFI_UNDER_LINKING|WIFI_UNDER_WPS)
@@ -301,7 +301,7 @@ static u8 PS_RDY_CHECK(struct adapter *padapter)
 {
 	unsigned long curr_time, delta_time;
 	struct pwrctrl_priv *pwrpriv = adapter_to_pwrctl(padapter);
-	struct mlme_priv *pmlmepriv = &(padapter->mlmepriv);
+	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 
 	if (pwrpriv->bInSuspend)
 		return false;
@@ -438,7 +438,7 @@ void LPS_Enter(struct adapter *padapter, const char *msg)
 		return;
 
 	/* Skip lps enter request if number of associated adapters is not 1 */
-	if (check_fwstate(&(dvobj->padapters->mlmepriv), WIFI_ASOC_STATE))
+	if (check_fwstate(&dvobj->padapters->mlmepriv, WIFI_ASOC_STATE))
 		n_assoc_iface++;
 	if (n_assoc_iface != 1)
 		return;
@@ -487,7 +487,7 @@ void LPS_Leave(struct adapter *padapter, const char *msg)
 void LeaveAllPowerSaveModeDirect(struct adapter *Adapter)
 {
 	struct adapter *pri_padapter = GET_PRIMARY_ADAPTER(Adapter);
-	struct mlme_priv *pmlmepriv = &(Adapter->mlmepriv);
+	struct mlme_priv *pmlmepriv = &Adapter->mlmepriv;
 	struct pwrctrl_priv *pwrpriv = adapter_to_pwrctl(Adapter);
 
 	if (Adapter->bSurpriseRemoved)
@@ -527,7 +527,7 @@ void LeaveAllPowerSaveMode(struct adapter *Adapter)
 	if (Adapter->bSurpriseRemoved)
 		return;
 
-	if (check_fwstate(&(dvobj->padapters->mlmepriv), WIFI_ASOC_STATE))
+	if (check_fwstate(&dvobj->padapters->mlmepriv, WIFI_ASOC_STATE))
 		n_assoc_iface++;
 
 	if (n_assoc_iface) { /* connect */
-- 
2.52.0

