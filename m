Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEF2E235046
	for <linux-staging@lists.linux.dev>; Thu,  2 Oct 2025 17:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759425837; cv=none; b=ifpJfI5ZZHUGlnGkHxKhbZsvC1syfTadfqYjBvNNwhefm+TYjtlXMNGVtCdNsYjKVJ5hkvcCg4faJJ64F9Z7GsVI1KUuwLeGQba0Sa6o+bGEKBqeChDKDtGlurvyNy0nQzOC31939OUGtQPUlYSR1Z788DWiuQOs3RpSHozsCy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759425837; c=relaxed/simple;
	bh=gLqaqDCDdle/KvgA2xR1oczrA2cmUnFNtS2KtHaVGA8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hZ+aBJpSlkAUsoR4ZkLubxWnh67OQsr+/uUOSIiXPPKx0NA9GI4Ybq1Zd1LOJptYIY8iVRPoJHN6lsGYhV4i82cluNKQI6KIvqOniEiu/l+CDjDaVfRCbteBGHRrhverjpYk8P7rd3GqLZsw+59xNDRBwAFKJKy5I94TTJU+oLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CSu3P7Q0; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CSu3P7Q0"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-4dca66a31f7so17371431cf.3
        for <linux-staging@lists.linux.dev>; Thu, 02 Oct 2025 10:23:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759425835; x=1760030635; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aWd5BC2XgSagrwNc+rN7Wfr2/BH16xqhtfWifgZDwag=;
        b=CSu3P7Q0ez83m9J81USyko8LliZirAvlTY97z6BpfFRzPcnDv71+2dKajhOLDQKJy5
         12iciYj46DUwfyxAHLvbHqCpuZ9VAIulBavcSgy3Vb/V/z7k4SOB44Raw/Nq1XihTfTL
         2ID34ENacmXVTEsesjkZU1770HqyMF5Yq5E2MFhwfWR3dx5KoOJXoAnZoRAZiUS76of8
         Y73cPI5G2AtVIhVm1/6SvDu/K/obApW4vl/S9o/oH9HXJ51FbPNWuevlxb3kKKzwGY2S
         hQrGNWtg7jLgWlWcIVKQZDDSowaXsP93B5qo4fvfwIeFey24NBJolbWEWKOH7mfZpNZy
         t3IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759425835; x=1760030635;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aWd5BC2XgSagrwNc+rN7Wfr2/BH16xqhtfWifgZDwag=;
        b=Zki6ZfCQVuK0Ph9mTwWR9Nh9uS9eaqcujdejeDgNI31n2BEMw1yG8k1w17Vri1jCj+
         z23l275oIi6HKWmhS4R19MTdafdgqZqEiAV3klE/dhzlosnLbqWKn9yBb6Bvb+OnNo4B
         sHgFKnnTxKGzM0o0IaTyKuz9qDUPbhn4Ue7Balb20abWML8mwQXAFtJ3IBobstlI2RE5
         18y1fT+emtX6TpGxlKj97FgXXjcXdx22Qroxiqkv9Qqs0TiW1sSi0tt5uJpJ1mSBIvM/
         2GYeBCuRKImYnUVcAsppSKwLhzp8+Rsp0A7j4AzIH39e70Lp5lsjsjRT/kOW8rr4jvBx
         eSew==
X-Gm-Message-State: AOJu0YxVwRnUx6vQ3l7XOM6WlEeR3tzaFFJEYuzswWcSYAbnayT8wSyR
	LgRKoreEpGmFjudqUr5vcUWp29j/lXTy/vE7MAVPn07tVmMyUOXddfKl
X-Gm-Gg: ASbGncsblNHBfMgwBcaSnOZ1/OppmKSni2UQcAJhGm1LKk/X7vjHapV3Bsyss2FdEJE
	jxXqbNzyckVU2OHql+g+rL+gyfIadiSztvhaJA4fw7tR6UIE1nU1w32Gmvbc7IP2LX8rEenx7s4
	APervsFBFfHrL3bgPVVO0zLuUxWON6Zy9UGmJsIFkC9c1v0mH0suEpRrJrTvZbm58+sePF1XJcx
	6YGW+e4U/uhs67v7oph4qATKyiupgRHgfIyOR864ZbANjfosyfzzZJ1NWOkSf7EPaWc4mNk3XqR
	qKlLMgmgfhcddYvgLieu0YyzBjVHpEe2kFgIfiyVTQbFGry9GyFUUI+UI4RfMCegi+YEa9UsIOx
	5cny2Cg4xJmhZoMrez8PD3YgAMFT//2nEicycNxe5jhL33R2sWr2jsshH6ZP0anU5g+/UWGOOlF
	Q=
X-Google-Smtp-Source: AGHT+IGaYSVVuUQxkF0uoFyFGDCVwC2Plw92ZS2jW5P5DTXGaEG4/HIb8G+lJD9ZfWkG7QY++FH2uQ==
X-Received: by 2002:a05:622a:5a92:b0:4df:194:b479 with SMTP id d75a77b69052e-4e576b23b8cmr1139471cf.59.1759425834552;
        Thu, 02 Oct 2025 10:23:54 -0700 (PDT)
Received: from linux-kernel-dev-start.. ([159.203.26.228])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4e55cbd3d9fsm24504971cf.32.2025.10.02.10.23.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 10:23:54 -0700 (PDT)
From: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	vivek.balachandhar@gmail.com
Subject: [PATCH v4 04/16] staging: rtl8723bs: align asterisk in block comment to fix formatting
Date: Thu,  2 Oct 2025 17:22:52 +0000
Message-Id: <20251002172304.1083601-5-vivek.balachandhar@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251002172304.1083601-1-vivek.balachandhar@gmail.com>
References: <20251002172304.1083601-1-vivek.balachandhar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Align the leading asterisks in a multi-line block comment to maintain
consistent formatting and improve readability,in accordance with kernel
coding style guidelines. No functional changes.

Signed-off-by: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 40 +++++++++++------------
 1 file changed, 20 insertions(+), 20 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 3eeea832dcb6..c898c10f0813 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -869,8 +869,8 @@ static void find_network(struct adapter *adapter)
 }
 
 /*
-*rtw_free_assoc_resources: the caller has to lock pmlmepriv->lock
-*/
+ * rtw_free_assoc_resources: the caller has to lock pmlmepriv->lock
+ */
 void rtw_free_assoc_resources(struct adapter *adapter, int lock_scanned_queue)
 {
 	struct	mlme_priv *pmlmepriv = &adapter->mlmepriv;
@@ -905,8 +905,8 @@ void rtw_free_assoc_resources(struct adapter *adapter, int lock_scanned_queue)
 }
 
 /*
-*rtw_indicate_connect: the caller has to lock pmlmepriv->lock
-*/
+ * rtw_indicate_connect: the caller has to lock pmlmepriv->lock
+ */
 void rtw_indicate_connect(struct adapter *padapter)
 {
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
@@ -934,8 +934,8 @@ void rtw_indicate_connect(struct adapter *padapter)
 }
 
 /*
-*rtw_indicate_disconnect: the caller has to lock pmlmepriv->lock
-*/
+ * rtw_indicate_disconnect: the caller has to lock pmlmepriv->lock
+ */
 void rtw_indicate_disconnect(struct adapter *padapter)
 {
 	struct	mlme_priv *pmlmepriv = &padapter->mlmepriv;
@@ -1596,9 +1596,9 @@ void rtw_wmm_event_callback(struct adapter *padapter, u8 *pbuf)
 }
 
 /*
-* _rtw_join_timeout_handler - Timeout/failure handler for CMD JoinBss
-* @adapter: pointer to struct adapter structure
-*/
+ * _rtw_join_timeout_handler - Timeout/failure handler for CMD JoinBss
+ * @adapter: pointer to struct adapter structure
+ */
 void _rtw_join_timeout_handler(struct timer_list *t)
 {
 	struct adapter *adapter = timer_container_of(adapter, t,
@@ -1641,9 +1641,9 @@ void _rtw_join_timeout_handler(struct timer_list *t)
 }
 
 /*
-* rtw_scan_timeout_handler - Timeout/Failure handler for CMD SiteSurvey
-* @adapter: pointer to struct adapter structure
-*/
+ * rtw_scan_timeout_handler - Timeout/Failure handler for CMD SiteSurvey
+ * @adapter: pointer to struct adapter structure
+ */
 void rtw_scan_timeout_handler(struct timer_list *t)
 {
 	struct adapter *adapter = timer_container_of(adapter, t,
@@ -1762,10 +1762,10 @@ void rtw_set_scan_deny(struct adapter *adapter, u32 ms)
 }
 
 /*
-* Select a new roaming candidate from the original @param candidate and @param competitor
-* @return true: candidate is updated
-* @return false: candidate is not updated
-*/
+ * Select a new roaming candidate from the original @param candidate and @param competitor
+ * @return true: candidate is updated
+ * @return false: candidate is not updated
+ */
 static int rtw_check_roaming_candidate(struct mlme_priv *mlme
 	, struct wlan_network **candidate, struct wlan_network *competitor)
 {
@@ -1844,10 +1844,10 @@ int rtw_select_roaming_candidate(struct mlme_priv *mlme)
 }
 
 /*
-* Select a new join candidate from the original @param candidate and @param competitor
-* @return true: candidate is updated
-* @return false: candidate is not updated
-*/
+ * Select a new join candidate from the original @param candidate and @param competitor
+ * @return true: candidate is updated
+ * @return false: candidate is not updated
+ */
 static int rtw_check_join_candidate(struct mlme_priv *mlme
 	, struct wlan_network **candidate, struct wlan_network *competitor)
 {
-- 
2.39.5

