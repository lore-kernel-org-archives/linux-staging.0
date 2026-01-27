Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AB6E26C3B0
	for <linux-staging@lists.linux.dev>; Tue, 27 Jan 2026 22:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769554085; cv=none; b=eGxP+6I6u6sULCB/QMJq0eASC1KwhK9max+Pb40a4yF6i3RLMSPDe8HX9d7eOSIvzPMwa+2TnfcnAzDwC+DasZDE42pbS7q8ApoAi02Ps5om2aaaz6C4VS/wAlPY0TQc8FDna1fu4DStPneySK/89CE8NmiJ5Raa6glJEaHOLM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769554085; c=relaxed/simple;
	bh=2jjo84vXTrnJiSIC/k59vzt29lAphMXqdSh0WJr1nj8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IOEfvtdkE30Vqd1OYyS/Nh3t0z4h8lh8kI4Yp4chQA/5vHmuidpHkMGTRbqVroTDh2uQoqRgvtaMQsAdyQwORyx4Uz5+Qt6wIfh95vW8XS/DyLbXNK695mAkqIO/c7Z+J3Y+WT9iRhJH85fsSd+8jqtxjmiLWLHWEHh6mUZuF6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kk1rygou; arc=none smtp.client-ip=74.125.224.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kk1rygou"
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-649612e4582so4622623d50.3
        for <linux-staging@lists.linux.dev>; Tue, 27 Jan 2026 14:48:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769554083; x=1770158883; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wrbgHaXp5Vm0Dw8q8qO/OWNKLShSjn5LLCMy6DMK5W4=;
        b=kk1rygouuIzqWEXAj/GKuxSOnekrsQKkCzqyNPiOlr/39BjkfnOe08lXEZArMufhB5
         LCEH1dE/Vr60EAKCV+lv9VifsEFU9/A4CrqMbvq+rlI12sgV9mksl4Leo8IcLTVSeS8Y
         EcT5iKE1iXa5RQwjuU5Dq8Cr5CS4fxutLbOOW07pA39KMTE91kg1ujd5/B3/sYyrlE+j
         hLP10y5Y0RbaeTR+G8/m+MhQuc26FvR8gWmIw9D3lw+oWUaNFXK8ebBDO0DfmiUUlEdH
         eIZS52tOdp5SpVDGDtiQGTkHR03WU1tCWpMQM00edEXUSQ9mY2DVmSNYSJWj947qcDbc
         pvmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769554083; x=1770158883;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wrbgHaXp5Vm0Dw8q8qO/OWNKLShSjn5LLCMy6DMK5W4=;
        b=LA+kIFRLlDNBk7e0KwQkg/nJ0JwGR33OseujhxB0INu9y1d/kQ3icRSvJtAphJRWcS
         ileji8MZZppNFPf/mkNyjKiHBv+noc/KvqtWF1nIcr9dCGuLVva6sovwz7NKsWLuNx3u
         lKm+fRTnCHuwoszlWCCxzM6cGqrtwLJuvECsf/rQc1GkPc6Gn/ji9Cg7hMO+v84pGfkL
         LV1SIOBSd3YrkqFxX644cwOg/M7Y/qFCav0KMJVnlEkRgZhDEYuoy/STmKkIErwrBlfD
         UfYjre6KruGqBAvBLrSSeXDK10q/YqtGGE4yPo1hbfg2q0GQdcJRFFdhx1QbywzxfwQ7
         Kq3A==
X-Forwarded-Encrypted: i=1; AJvYcCXq3tiFPeKBxZ9PTvgBYgGP1pbZhslUh35VHsS/dwpIroE7ICFim2T//UD72J6Xq/6P9+DkEkU29OTVXUrB@lists.linux.dev
X-Gm-Message-State: AOJu0YxbTJTV27iBNEZfUx/iVm6cGtJCnQtAvBXIzyBmRQZOuppVcCSn
	vLv2ShhY6xglYOJY9N1E1hvBM5vpxhN5z8C986ARDJc5ucedE4ctM/mX
X-Gm-Gg: AZuq6aLp9Uak8NwV2cbtnS5Omyy2MxAo5T6VvLM2UjFJyP8QdDIQXErWSiWGpLc4jAg
	2OYFCFMWrKbJosnoViVLTdFe5x95GXhsvTtZZa/eSmetgrNaGkB+NtoHZ3jhhCpp/4ZzbB2XBUv
	SuBC5/UiWGEGTv6a98N1E6GfyJcDbM0r8qLA2cV6X10VaU4xs3xDIhac4unA9yMIUcvu9qHxjiP
	x7DUAZ2lNnJC5d6NgXR6DUbnaWhRHSsSFxrEmDinA15YL5l2jqpZoWfXoggK4wYBPMRki6HuNQB
	83amjxpRWYuVYcz2eUAWMXqrjjseblPk+XzEDBZW5q5/ij0rXAJ6zI/peQTTyouJ+Nqa9xyU0MI
	UethLi3fEcs8O0PIq3LNKg6hoInvhdg/DwQw3Acx76RvqdxK6GcW1YIPkBFIRkW3GxxA=
X-Received: by 2002:a05:690e:1698:b0:649:5f25:3f71 with SMTP id 956f58d0204a3-6498fbe834cmr2503075d50.14.1769554082990;
        Tue, 27 Jan 2026 14:48:02 -0800 (PST)
Received: from tux ([2601:7c0:c37c:4c00::9944])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-649960788bbsm55250d50.9.2026.01.27.14.48.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 14:48:02 -0800 (PST)
From: Ethan Tidmore <ethantidmore06@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Michael Straube <straube.linux@gmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ethan Tidmore <ethantidmore06@gmail.com>
Subject: [PATCH v1 1/3] staging: rtl8723bs: remove dead RX info reset logic
Date: Tue, 27 Jan 2026 16:47:36 -0600
Message-ID: <20260127224747.40305-2-ethantidmore06@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260127224747.40305-1-ethantidmore06@gmail.com>
References: <20260127224747.40305-1-ethantidmore06@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function rtw_reset_rx_info() and its associated counters in
struct debug_priv are used to track AMPDU and management frame
statistics that are never read by the driver.

Remove the unused function, the write-only struct members, and the
now-unused pdbgpriv/psdpriv pointers in rtw_free_assoc_resources()
to clean up the MLME code.

Signed-off-by: Ethan Tidmore <ethantidmore06@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index f81a29cd6a78..411339ebab7e 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -819,15 +819,6 @@ static void free_scanqueue(struct	mlme_priv *pmlmepriv)
 	spin_unlock_bh(&scan_queue->lock);
 }
 
-static void rtw_reset_rx_info(struct debug_priv *pdbgpriv)
-{
-	pdbgpriv->dbg_rx_ampdu_drop_count = 0;
-	pdbgpriv->dbg_rx_ampdu_forced_indicate_count = 0;
-	pdbgpriv->dbg_rx_ampdu_loss_count = 0;
-	pdbgpriv->dbg_rx_dup_mgt_frame_drop_count = 0;
-	pdbgpriv->dbg_rx_ampdu_window_shift_cnt = 0;
-}
-
 static void find_network(struct adapter *adapter)
 {
 	struct wlan_network *pwlan = NULL;
@@ -848,8 +839,6 @@ void rtw_free_assoc_resources(struct adapter *adapter, int lock_scanned_queue)
 {
 	struct	mlme_priv *pmlmepriv = &adapter->mlmepriv;
 	struct wlan_network *tgt_network = &pmlmepriv->cur_network;
-	struct dvobj_priv *psdpriv = adapter->dvobj;
-	struct debug_priv *pdbgpriv = &psdpriv->drv_dbg;
 
 	if (check_fwstate(pmlmepriv, WIFI_STATION_STATE | WIFI_AP_STATE)) {
 		struct sta_info *psta;
@@ -874,7 +863,6 @@ void rtw_free_assoc_resources(struct adapter *adapter, int lock_scanned_queue)
 	if (lock_scanned_queue)
 		adapter->securitypriv.key_mask = 0;
 
-	rtw_reset_rx_info(pdbgpriv);
 }
 
 /* rtw_indicate_connect: the caller has to lock pmlmepriv->lock */
-- 
2.52.0

