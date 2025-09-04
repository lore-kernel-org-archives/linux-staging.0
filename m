Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 031141D90DF
	for <linux-staging@lists.linux.dev>; Thu,  4 Sep 2025 01:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756949192; cv=none; b=Gz2VOVkBBOxwoSDzOOEg82QJcTSOP+O3g+X+vGdfX2BGyVuAOhDOSLp739VFc25lqT0KriiL5EbrpjnB8oxJWy/aaeBWR1SFxAYBJ1qdaJSCqDwXrOLzhi6hv7+omplhAEvrl8XwPDTuma/NKkzqGqalgWx2wSJx+bs1hOepYVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756949192; c=relaxed/simple;
	bh=t6cSp78s0xsgJIM8X+WnQ5gua4odTeVTTNH0xY+FGJ4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=IK8YU/h6PzBgNXuNp8U7HKUHV4HqPWTpEdvX1ZL/AGbSRtk5f78eyetlICkMlly0ioU3c/yLuwyTZwG6W3LWbFlFboKZju1BYGAh86cpUgjHBBzXb4sEKb6DazsEi6vsvzOwTxyu/Db5DwtNTphNU204cviAYSHDJY7hhbN3UzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EH+tcRLz; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EH+tcRLz"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-723c971b63bso4307846d6.1
        for <linux-staging@lists.linux.dev>; Wed, 03 Sep 2025 18:26:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756949190; x=1757553990; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gZzqBglcCR6z9WUwCh48OuTmyh9v+X8bzE5uxp+FKJw=;
        b=EH+tcRLzP4volbPH3ib9mEF8OkdTzzih3wjinwas1TcL6fjJ/s72dF9e05DkoA7wmV
         1gGE3c7Yu1sj3JVHRSAhnoDUlWD6cxhSAGRoRDs0PFSebMHCk48/6I0waF31K5tuPJqi
         8cLQ+BFXNNl/mMg8JSiUhFCmJicqJP9Vdq6SEcsHNIoB6LlTEo95fVSNzcQrX2GwKkYJ
         Ogr+eYSBTC+fEkj3wwv6LXk2rlut2Lw69So/t1phWUSoKD8OKj4+mPaet05uVrygyvFf
         ETGpVddYm83Ez3tHb46KBmn5iVoceZMr7HTxMuR2Kp1imT7+d0LQaW2ACtRGEYH0ET9W
         b7AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756949190; x=1757553990;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gZzqBglcCR6z9WUwCh48OuTmyh9v+X8bzE5uxp+FKJw=;
        b=IMxOuI8zpI3oGuhltFQG8hRAaYuKOxluBJGY4RMSaTsW4Yb2l+hjEzeYx06PYtiaiJ
         S7yty8AfoWGE3iJ5SHocP99nOrt1MiEzvhGPEQTXUt0gDrm417NjBQi+Ma8KE7vi0WpF
         AIzERLRvuM5QjSRE93C+PEnKTYs1QeO4Zi+DLvvcaXSHXoqMfkAZEB5yrir8lfajD+eU
         pc7sSL9dkK5WPUgEpJjaS/DquD0pCY6vFgD5gKm4YWdyRZm8LRZPgK8CzkK97fH7dBkE
         fBCrcxmit2mimiam1Mu00UvBff/hNU325wkaSdV3Dh4tA4rLZyQ06o3PUT2P9z4264Fg
         3ANw==
X-Gm-Message-State: AOJu0Yzbw8Qf0GYdPKRoR1lEnWNOufC1wync+OgJOXDz8o8xx/zR1vp4
	OVuL2fFuAFdaY9JnSL23QPHLFuSsNkxOFq/KkUecWVDfxpyVkYcjkQN6
X-Gm-Gg: ASbGncvpZbXYGy9evc+x812tiq5xSRAxPWawt+r75BFpQbJZCMO1XG+yl8NotP9nukG
	2d0m2txTzYGwtT3Zl/0Vw1fyQz0oZlS4njP0gPyNNZyXx+QdrNm6bwNg2MY583d9cy2hyqx/k2u
	6PxD7glrTjAeS5ipmoUwjyyKnyf7iXGVNg4PTM1g0oH5XOjEzQfrSOUphOC6jg3bNA281ZJc9Tc
	Ll7XTtQTYAMjzYQP+yPZGU1OCRehkhkOvbjwSE/tK5nUR3xJP09HPNDCNJBr5ZFug1BMF7wKFyO
	5YXoIjdCknQo3skiSQde6365EDoNXDeBdQhRF4soJzKFuu7TBIYRk9wS9UAOQVjP+4uujYuxa0a
	MHVSuawQDS3iWkFlsjPmKZrEhaZkQCCaVHhv5pUbeMZTpcHM7RyQ=
X-Google-Smtp-Source: AGHT+IGYGdwLwTWby8sdQDjLB43X6KM/WS5I8MepBpWtGFWYSlr94mSBJ14DrQ3pYcC4Lri0gLLo5A==
X-Received: by 2002:a05:6214:20ad:b0:713:bf18:cf32 with SMTP id 6a1803df08f44-713bf18d062mr187282296d6.10.1756949189802;
        Wed, 03 Sep 2025 18:26:29 -0700 (PDT)
Received: from linux-kernel-dev-start.. ([159.203.26.228])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-720b682faf5sm38423266d6.65.2025.09.03.18.26.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 18:26:29 -0700 (PDT)
From: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Vivek BalachandharTN <vivek.balachandhar@gmail.com>
Subject: [PATCH 04/16] staging: rtl8723bs: align asterisk in block comment to fix formatting
Date: Thu,  4 Sep 2025 01:25:24 +0000
Message-Id: <20250904012529.215521-5-vivek.balachandhar@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250904012529.215521-1-vivek.balachandhar@gmail.com>
References: <20250904012529.215521-1-vivek.balachandhar@gmail.com>
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

