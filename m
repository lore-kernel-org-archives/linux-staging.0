Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B3A81F8728
	for <linux-staging@lists.linux.dev>; Thu,  4 Sep 2025 02:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756952112; cv=none; b=ckPwxbpu/ZB36f8/8k2ronQN8KWad7LRhKZlsGxjbrVnK+1awZkOn8CFGwqkxxgnCrWMOuex6ynGc6LhaVhg8WXybjmx0WJMB+Z9NNL+Oh9ulNHbrynMGiTxiJyHKFrXv0NjR4VU5PKWR1rLw3nogRUeedhsmmZ7ZJmquzZuI4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756952112; c=relaxed/simple;
	bh=t6cSp78s0xsgJIM8X+WnQ5gua4odTeVTTNH0xY+FGJ4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GnSflKU9R/xC5UP4QBe6BfdVLsklPp3RJc4a+q+SkrlRy2itipIPyylCjROHySN0BekY/g8oYZ48ZV7MIO3dktdkd0YP74Fsn3SBdR/FXZWD1RopgXNQyQ7hfmXdFjTV0H5dOfTCe/2xg2fqHT+irLuE0w0Jbsqr1MLSRQVpXLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J0aNa75J; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J0aNa75J"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-7e8704e9687so61804085a.1
        for <linux-staging@lists.linux.dev>; Wed, 03 Sep 2025 19:15:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756952109; x=1757556909; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gZzqBglcCR6z9WUwCh48OuTmyh9v+X8bzE5uxp+FKJw=;
        b=J0aNa75JiBAN5vWgGVauDdpBIL1CWx7jRsaTPmtyfyUb2c/v0plB4YS6N7BtyIrmX5
         tGG4Ry9cUi2+CbxDrDhbKIhfvjHQOZtPISnbLwYfDKnSxKwXQLYY5j5siBgUNeEZHgt5
         ucdKAsZB4qvE+3UrInaykVJ/c6ic87oWG3pmQQ+VUghtMrBOZKpVFmHRpeQCFkgxyJka
         RMq51SzRDZq2ekQMH5YdAY1gT5W0E4UmeXhnTcQPZOKjegyE9YxdBVQJ8tCQM2gwypiA
         o6sTjIVUHd/kxF8mz+BfT/5RvKn74hfhpHrxdI29REF40L5vNlK6ieHT8oajDzpzRO2t
         aHAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756952109; x=1757556909;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gZzqBglcCR6z9WUwCh48OuTmyh9v+X8bzE5uxp+FKJw=;
        b=i1n0NXD31Le7ejPA0Xjgtvr9NgaobdjZ3hy5/d1cPyCtgDGMipUnyoFDJp+cG1LDAc
         A7AhCHCxAYCV+BxF9G6mzRXtkMGSZ+eRYcN2MUC29PU7ey+SlBrQP1wv7TgWH3ifmRAT
         PfZcgL5zjgjivqjKMqbBaZLDUu+LjZeT6LZ+0EPppmUMAeCCoid8zBpdijhz4iTWJ+vU
         Lw8Ul1nn3YwjvSYD3AxnGeEGME09EZAlBFItUbrZiwZKbCPN8YcPc4Wj/9L9mDWT6r+i
         gQoo+dkBg8cPmDFdrh1wSwZXnfC/PVayDZ80bTHx4fQF+2ulMXBoMnWHqlrb3dwgK5UO
         qBYw==
X-Gm-Message-State: AOJu0YwKo1cPq9+I5Nr9JinF29xdWdcNL3kDgrPoQQEvIvUE1uqoQtAC
	M4lQZhn4H5AHHe0JB7jLp/Gmo74GaI/uvjExDKlGSOhgiuP70qXbGDanhZSSnw==
X-Gm-Gg: ASbGncug3/RGISEyJ6NRUp0J6Ji4GB9ytsag5T3qeKZSwyWttmd1kACogCXxAPLy2Gr
	PC9n/yxIkY3Jpk//MuB2NY96+W/4J3Ea6QQR1vTY7SrlOrRusV0I25HIxbbFtUS2SwhCx1LF9O5
	+fYwpZk9VfLthi/GhAa3w7W9Jww4TMFN7J80FyczR2R5qEYA+OlCMYhf3u26bpaDEz62aAcxj2X
	JSNcKb3UGdx+kCmwKwZmaNp8CzxivtiegcEpDZ1vxSp2H1044VrgaMazV7gNs/JYqg2wjcF4oUW
	Q7sOAvEu3cBgG8rt2MRML7kt1PaleKM71zScY0vnUcO6OO6aOsmiu+SR5yMcmByUxmtNEy9yNmd
	XBhn95U5LBxlZ1WnVZ/R5RFigzFVWcxFVQPiryOL/SkUgEEYvkaPg267X2J6eMA==
X-Google-Smtp-Source: AGHT+IFQike7l/+zOttraj1oPCqSfblyiw2+GKeIZMRM/rYegNo6E/KoGLAJh5bsi60kYcTD6jl5ow==
X-Received: by 2002:a05:620a:3187:b0:808:234:d472 with SMTP id af79cd13be357-8080234d881mr886662185a.31.1756952108881;
        Wed, 03 Sep 2025 19:15:08 -0700 (PDT)
Received: from linux-kernel-dev-start.. ([159.203.26.228])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-720ad2cb78csm37714076d6.19.2025.09.03.19.15.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 19:15:08 -0700 (PDT)
From: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Vivek BalachandharTN <vivek.balachandhar@gmail.com>
Subject: [PATCH v2 04/16] staging: rtl8723bs: align asterisk in block comment to fix formatting
Date: Thu,  4 Sep 2025 02:14:36 +0000
Message-Id: <20250904021448.216461-5-vivek.balachandhar@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250904021448.216461-1-vivek.balachandhar@gmail.com>
References: <20250904021448.216461-1-vivek.balachandhar@gmail.com>
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

