Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C1FC2C0283
	for <linux-staging@lists.linux.dev>; Mon, 29 Sep 2025 06:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759128640; cv=none; b=YaU3M3vVRfAxZdrFbtENhD+EN7IBAe8w2ms7Z0BkzyxG0ql6jowZGSjukp/YH48fjzvfW/OzwebzuImxRKqvk1fy7+Qh389826tufwSuGQhFvpEzVitUZW4nv7L+Qk7Z4vdqvciteio6Y+qSZOKAgvAMh3uUIIq+gAyItAZ6GAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759128640; c=relaxed/simple;
	bh=t6cSp78s0xsgJIM8X+WnQ5gua4odTeVTTNH0xY+FGJ4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XBVzGYGVcUdRJOL9+U8IijBmwjLErFObKxUitlusS6NXYeWXcf9MEENWQpOx2t8FQQFOlkBP4uTUbJWEyIJeYaRERj22Jf4YmL7AAPrw2wCxM7MpPu7uUAGA6FH1NEGVwgJNIaN5rNqP2ApH/hXea7YYXjcWUh/EuMFf/l1QscU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UDzrN5Ez; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UDzrN5Ez"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-4df2911ac5aso10397161cf.2
        for <linux-staging@lists.linux.dev>; Sun, 28 Sep 2025 23:50:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759128637; x=1759733437; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gZzqBglcCR6z9WUwCh48OuTmyh9v+X8bzE5uxp+FKJw=;
        b=UDzrN5Ezvp+aGn1Ws5QeoIvT40R35t7YzkMs1ygqH847i2CEtcviw/yG5IKHyX84Zo
         YLve1TlQ25Z9LkW92oKYosNSDbGjOXQLUV6KSOZwSQUQsHZ3xrVMFYk42elYJ91kPPNV
         D1NhsXqNPIFVsOiLmWK28Ia6K2JSnu76JTzXx2VqrpWpxPxAKFCTTtpFRY3LoAEB94fR
         9SwOlhRENoafo+gDc+YQw//YB8dox997Je1iIT5n/r5sC3xePolR/8vMmSi92L5yHOkE
         dPIYunUFhuUsJ8/FYfyqKlGpBVuqkz3olSD2CDcaBN9yEtkFLPN890UInmGA/5io5JZY
         i/2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759128637; x=1759733437;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gZzqBglcCR6z9WUwCh48OuTmyh9v+X8bzE5uxp+FKJw=;
        b=lHfQIoyO3+QdPHarsEIBakI/BRDOH0ftnKk8c4RtJlvlO4PU/HW7O5M9DGLxtN4jtE
         OZMuON5qyvGC4wTGkpfpuFupPSDmvg+yQnCsWNXwRZGvSjLbt2Ow8VUXgfEExdxnzV9X
         aNMoXSih02ojY6q9RZwy+xgfKcrWIlXEFFbO8JcyOuIEZ3lYV0msuRK5n+a6uw/QouDP
         0ietSgty//GC/nUYQkabbQ3FXz4rejAJHBL6y5IxTeNmEoYh28T0vie1IBfOSFszVPB9
         4HLS3Kze/Pc6L1+WeAMncrgjo3d51uv7yYHmf53oAsz7VRgOX3d+USZdZSI8FIXBjs6j
         +zJQ==
X-Gm-Message-State: AOJu0YyBlYpYj4uenunoFuc3AsGcj+1GTJk58YKNYckZrWvm/Li2ePmG
	mtOrwkbN/zjJyRsuXIVNmdrCJCZs7pSW6QrEEa0uB8A4wRlBUe35KFHR
X-Gm-Gg: ASbGncvHZt16bmwAdF5ob5YzqukEwc+GQJPR74LByZ+MyZ3+AFLfCQBbUkFaY2kVGEX
	Cnwv/UsKQKQ9GOoPEkgydBm4PWGjEI3/EWTOcmBpFStIsujcKt/saJfGBEu1w3sXflKIyNAzcHH
	G7YuzcwYHGc46IJuqRA0/vrNiMvbgD5fzEsNol5u9/RSUKVDDGXlwGThCRzRwjQJkqg9YI4uizc
	DoAAqWjKSUyo/WFCGgJ2e4d0xHAGUjEWM1o800+lsyXag9CmKbnBH/i1NTtcflFYJ/z4f+b0kzf
	aKxVpLKeo31gs9iiI7v8zN2oVIIZ7tE0RKmHMsa9iAqrjEvI4inJwAfcPzFg0GmfG46ajO06ggX
	CpgkZXVNkwPSUMolcIcYN2cnPSUv4+Oa1G83gN/lcU8E/nUiQmS4=
X-Google-Smtp-Source: AGHT+IGRTMai0fhlyMeXGP8CzoshUuUh7SI0dyYwCT5ngazauezXgV6/mWhIhXhF9jtnM1oHzxnqmg==
X-Received: by 2002:a05:622a:1493:b0:4b7:9b8f:77f2 with SMTP id d75a77b69052e-4da4b141133mr225203501cf.39.1759128637485;
        Sun, 28 Sep 2025 23:50:37 -0700 (PDT)
Received: from linux-kernel-dev-start.. ([159.203.26.228])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4db10874bb9sm69517671cf.24.2025.09.28.23.50.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Sep 2025 23:50:36 -0700 (PDT)
From: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	vivek.balachandhar@gmail.com
Subject: [PATCH v3 04/15] staging: rtl8723bs: align asterisk in block comment to fix formatting
Date: Mon, 29 Sep 2025 06:49:49 +0000
Message-Id: <20250929065000.1010848-5-vivek.balachandhar@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250929065000.1010848-1-vivek.balachandhar@gmail.com>
References: <20250929065000.1010848-1-vivek.balachandhar@gmail.com>
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
index 3eeea832dcb6..cd41f713a52e 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -869,8 +869,8 @@ static void find_network(struct adapter *adapter)
 }
 
 /*
-*rtw_free_assoc_resources: the caller has to lock pmlmepriv->lock
-*/
+ *rtw_free_assoc_resources: the caller has to lock pmlmepriv->lock
+ */
 void rtw_free_assoc_resources(struct adapter *adapter, int lock_scanned_queue)
 {
 	struct	mlme_priv *pmlmepriv = &adapter->mlmepriv;
@@ -905,8 +905,8 @@ void rtw_free_assoc_resources(struct adapter *adapter, int lock_scanned_queue)
 }
 
 /*
-*rtw_indicate_connect: the caller has to lock pmlmepriv->lock
-*/
+ *rtw_indicate_connect: the caller has to lock pmlmepriv->lock
+ */
 void rtw_indicate_connect(struct adapter *padapter)
 {
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
@@ -934,8 +934,8 @@ void rtw_indicate_connect(struct adapter *padapter)
 }
 
 /*
-*rtw_indicate_disconnect: the caller has to lock pmlmepriv->lock
-*/
+ *rtw_indicate_disconnect: the caller has to lock pmlmepriv->lock
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

