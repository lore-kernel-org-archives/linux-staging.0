Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBE38472798
	for <linux-staging@lists.linux.dev>; Wed, 15 Jul 2026 12:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784119824; cv=none; b=q0Xkn73HIToZ2nkxx46UZogEarBrQ0zkHZb5rOqkkt5PvgQnMrIGjGaz5qblbBGKgHL5RW1an8ETVGLj45Yr1Iyf1g6LCBYHiMKhW3AfA3dKDQVgu9oGr5ZPcygemsXFE9gY/Tt9XnsPQoYh6j1pOkhE1IuoG1ZjitOML3HwOxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784119824; c=relaxed/simple;
	bh=+etsDGOHprPmH6KL0zM57WhifkfFHzvhi7WgBXB7oPI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gnsfrZwM/weejHItyqEW7ZgujnMlXGzq2irQR+O218hdV1ydx5kCMuO+MvPOs9dyLpNjTGPLB2AsehZoY+w65Pm3IXtQ5Kk8OBBh++QhrKgvu1bcG/FHHIDJjTtSiGLKxPlD4MZqdfgaj9CI6fH+ymlXYrnKE5cPROlTzQSLogw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hCepLyMc; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hCepLyMc"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-39c86945164so44919431fa.1
        for <linux-staging@lists.linux.dev>; Wed, 15 Jul 2026 05:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784119821; x=1784724621; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NbyHxJjaCgQdr3hTdsrrcihXelZohw0VURs18q5Mk7g=;
        b=hCepLyMctQNsFt+75/Rpj36NMG/NFK8A8WAnZy85taqowU4VQINXehZ7ENclCyCTdE
         nPe3zWshpUVAiVEznjHJDy+7CHrQou6d7K17Kw5cTeXAvL/1USjzCQd2s3FZ1ebP8t9a
         JvHJfvmx/cgpl0EMNBKpy/jO5mM09NWUwM/bS1k4haXVCWYv1pIZmK5aLpDibIjaSX/+
         f1bgTtKmASyJgN3A3L0QO+SujBYgYoHTkCSUA605E+FjGaXXoM60XHbigmnsYhWKj3ni
         1AW6fYtXKm9/92P1NElVXcAvmdi0t9EhgrLJ6IwBDuoW0mF8cuKFmWEDsmzmtCnL+JUa
         mYQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784119821; x=1784724621;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NbyHxJjaCgQdr3hTdsrrcihXelZohw0VURs18q5Mk7g=;
        b=k83VoyyopohlVS4TFyruYSJt72Q9ULXcm0zk8FFXeERuO8miQEaKu63Y8ONhZ5awJp
         aVJH9Db5e66kLIblS6qjms1c6I8tEJhdiZav/jDCL2eqGKLlOKRWM7dHfzSjc570gba2
         KOyAazjX20ocMlq0KkmNiVtPlmo1dhmdZjK04EqReH1h9o44WvkIlObEN8CxkuF8Us6b
         HHCIDTPv4bsb5yh+rLoQQ6cIIySpacTRGKkZM7knS1CvD3ChSl2YzKXRp8deIIQyKi6s
         fWHN94W/VqjDA24exR54KY/wYpxMeO0V0Al6DII/xOWqmnYJlnQmRqXI2MoU7Zkh7tlm
         3Abg==
X-Gm-Message-State: AOJu0YxWVI8q9QBPr0k7kzu0IpukCnYHrEEtORmAm8ZsEPB5UkUpRQNr
	cD7h3qTnaGdA658jeSiLor9ESQRq1Vl9wTGEsa0AdzPkN46PTIuge4vi
X-Gm-Gg: AfdE7cmlEtL3a9I2oWQ8pDsiOuf2zAdKQC+wgPgfKEWhDn4anQtCiWw0NsqH65rDzJh
	yUcEZ2DorJW+zlStCqIVY0tjOTFEq4gzgwqx4BlGtdD11VFJZEBelBPm5HO6rfDszYzby8A7Aym
	XRebdK+1dTOWRpA+gFEGRpftzoykYYOMy+bEJXQ0eusBEDOInzJmv4JBzOgtPxQYeYgdkz7xBQp
	4G22P79xTJd0hkImHyadTzbPVL0bjoToohrPhKQi9/39LZVd6Ug7BzLDgthWX2io3p060mytkId
	zz4fVdAXLdEemCLlqF88dgz68ffCxM+EI7gwMmBIbzQdpY8Mw5kv22fQecNslDYW35j76OTHWp4
	kQ+RXoBx/PaMnjM7Ob4NwVqrs6mG6fETJUECgaDXFT2bxuZt2s9xlfGi4+TxydTn1DR7na9/Z5/
	oQzo2iFSyZFxspImcdR1xeRcXvQSTtm0EnHN8v7YFZAihxNtef0iNnB2oeGWC7oVwi96FAC/NAW
	IO778sjero5ng==
X-Received: by 2002:a05:6512:65d8:20b0:5b0:f9d:f7a0 with SMTP id 2adb3069b0e04-5b15d76c31cmr441525e87.8.1784119820630;
        Wed, 15 Jul 2026 05:50:20 -0700 (PDT)
Received: from archlinux ([94.180.44.28])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b022fac999sm3404042e87.55.2026.07.15.05.50.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 05:50:20 -0700 (PDT)
From: Arsenii Pashchenko <ulijg308@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	ulijg308@gmail.com
Subject: [PATCH 07/61] staging: rtl8723bs: remove redundant issue_deauth wrapper
Date: Wed, 15 Jul 2026 19:47:35 +0700
Message-ID: <20260715124829.90290-8-ulijg308@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260715124829.90290-1-ulijg308@gmail.com>
References: <20260715124829.90290-1-ulijg308@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the redundant issue_deauth() wrapper function. Make the
underlying internal function global and rename it from _issue_deauth()
to issue_deauth() by removing the leading underscore.

Update all call sites across the driver to use the updated
issue_deauth() function directly, passing the explicit trailing
'false' argument where the wrapper was previously used. This
eliminates unnecessary boilerplate and simplifies code traceability.

Signed-off-by: Arsenii Pashchenko <ulijg308@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_ap.c       |  4 ++--
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 11 +++-------
 drivers/staging/rtl8723bs/core/rtw_recv.c     | 20 +++++++++++++++----
 .../staging/rtl8723bs/include/rtw_mlme_ext.h  |  2 +-
 4 files changed, 22 insertions(+), 15 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ap.c b/drivers/staging/rtl8723bs/core/rtw_ap.c
index a6640cd7a..274d99e6a 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ap.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ap.c
@@ -1775,7 +1775,7 @@ u8 ap_free_sta(struct adapter *padapter,
 		/* tear down TX AMPDU */
 		send_delba(padapter, 1, psta->hwaddr);/*  // originator */
 
-		issue_deauth(padapter, psta->hwaddr, reason);
+		issue_deauth(padapter, psta->hwaddr, reason, false);
 	}
 
 	psta->htpriv.agg_enable_bitmap = 0x0;/* reset */
@@ -1824,7 +1824,7 @@ void rtw_sta_flush(struct adapter *padapter)
 	}
 	spin_unlock_bh(&pstapriv->asoc_list_lock);
 
-	issue_deauth(padapter, bc_addr, WLAN_REASON_DEAUTH_LEAVING);
+	issue_deauth(padapter, bc_addr, WLAN_REASON_DEAUTH_LEAVING, false);
 
 	associated_clients_update(padapter, true);
 }
diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index 48043dae7..84283bb22 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -1296,7 +1296,7 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
 
 asoc_class2_error:
 
-	issue_deauth(padapter, GetAddr2Ptr(pframe), status);
+	issue_deauth(padapter, GetAddr2Ptr(pframe), status, false);
 
 	return _FAIL;
 
@@ -3152,7 +3152,7 @@ int issue_qos_nulldata(struct adapter *padapter, unsigned char *da, u16 tid, int
 	return ret;
 }
 
-static int _issue_deauth(struct adapter *padapter, unsigned char *da,
+int issue_deauth(struct adapter *padapter, unsigned char *da,
 			 unsigned short reason, bool wait_ack)
 {
 	struct xmit_frame			*pmgntframe;
@@ -3210,11 +3210,6 @@ static int _issue_deauth(struct adapter *padapter, unsigned char *da,
 	return ret;
 }
 
-int issue_deauth(struct adapter *padapter, unsigned char *da, unsigned short reason)
-{
-	return _issue_deauth(padapter, da, reason, false);
-}
-
 int issue_deauth_ex(struct adapter *padapter, u8 *da, unsigned short reason, int try_cnt,
 	int wait_ms)
 {
@@ -3222,7 +3217,7 @@ int issue_deauth_ex(struct adapter *padapter, u8 *da, unsigned short reason, int
 	int i = 0;
 
 	do {
-		ret = _issue_deauth(padapter, da, reason, wait_ms > 0);
+		ret = issue_deauth(padapter, da, reason, wait_ms > 0);
 
 		i++;
 
diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
index 86c5e2c4e..78bd04982 100644
--- a/drivers/staging/rtl8723bs/core/rtw_recv.c
+++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
@@ -798,7 +798,10 @@ static signed int ap2sta_data_frame(struct adapter *adapter, union recv_frame *p
 		    is_zero_ether_addr(mybssid) ||
 		    (memcmp(pattrib->bssid, mybssid, ETH_ALEN))) {
 			if (!bmcast)
-				issue_deauth(adapter, pattrib->bssid, WLAN_REASON_CLASS3_FRAME_FROM_NONASSOC_STA);
+				issue_deauth(adapter,
+							 pattrib->bssid,
+							 WLAN_REASON_CLASS3_FRAME_FROM_NONASSOC_STA,
+							 false);
 
 			ret = _FAIL;
 			goto exit;
@@ -852,7 +855,10 @@ static signed int ap2sta_data_frame(struct adapter *adapter, union recv_frame *p
 				if (jiffies_to_msecs(jiffies - send_issue_deauth_time) > 10000 || send_issue_deauth_time == 0) {
 					send_issue_deauth_time = jiffies;
 
-					issue_deauth(adapter, pattrib->bssid, WLAN_REASON_CLASS3_FRAME_FROM_NONASSOC_STA);
+					issue_deauth(adapter,
+						pattrib->bssid,
+						WLAN_REASON_CLASS3_FRAME_FROM_NONASSOC_STA,
+						false);
 				}
 			}
 		}
@@ -883,7 +889,10 @@ static signed int sta2ap_data_frame(struct adapter *adapter, union recv_frame *p
 
 		*psta = rtw_get_stainfo(pstapriv, pattrib->src);
 		if (!*psta) {
-			issue_deauth(adapter, pattrib->src, WLAN_REASON_CLASS3_FRAME_FROM_NONASSOC_STA);
+			issue_deauth(adapter,
+						 pattrib->src,
+						 WLAN_REASON_CLASS3_FRAME_FROM_NONASSOC_STA,
+						 false);
 
 			ret = RTW_RX_HANDLED;
 			goto exit;
@@ -907,7 +916,10 @@ static signed int sta2ap_data_frame(struct adapter *adapter, union recv_frame *p
 			ret = RTW_RX_HANDLED;
 			goto exit;
 		}
-		issue_deauth(adapter, pattrib->src, WLAN_REASON_CLASS3_FRAME_FROM_NONASSOC_STA);
+		issue_deauth(adapter,
+					 pattrib->src,
+					 WLAN_REASON_CLASS3_FRAME_FROM_NONASSOC_STA,
+					 false);
 		ret = RTW_RX_HANDLED;
 		goto exit;
 	}
diff --git a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
index 9d42b7494..578708cb3 100644
--- a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
+++ b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
@@ -546,7 +546,7 @@ s32 issue_probereq_ex(struct adapter *padapter, struct ndis_802_11_ssid *pssid,
 int issue_nulldata(struct adapter *padapter, unsigned char *da, unsigned int power_mode, int try_cnt, int wait_ms);
 s32 issue_nulldata_in_interrupt(struct adapter *padapter, u8 *da);
 int issue_qos_nulldata(struct adapter *padapter, unsigned char *da, u16 tid, int try_cnt, int wait_ms);
-int issue_deauth(struct adapter *padapter, unsigned char *da, unsigned short reason);
+int issue_deauth(struct adapter *padapter, unsigned char *da, unsigned short reason, bool wait_ack);
 int issue_deauth_ex(struct adapter *padapter, u8 *da, unsigned short reason, int try_cnt, int wait_ms);
 void issue_action_BA(struct adapter *padapter, unsigned char *raddr, unsigned char action, unsigned short status);
 void issue_action_SA_Query(struct adapter *padapter, unsigned char *raddr, unsigned char action, unsigned short tid);
-- 
2.55.0

