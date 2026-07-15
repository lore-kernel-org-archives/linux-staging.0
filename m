Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 308844BC02C
	for <linux-staging@lists.linux.dev>; Wed, 15 Jul 2026 12:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784119876; cv=none; b=O5esO+v8vy/3QPr1GCq0y8Kxo7vt0addKYeFIbq0Pksw6pTXqLMmXT1ccnGZ0X1xjdL5bYbcR01UPgFS21d7cCEhEveNKACNOy2O1pMt4XKA2d6mEAgdz2fI2e7hxnZISR6XgtUrv02pXIyCF50tZ2Xf0b7Fz0Ivr6tbqS9JyNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784119876; c=relaxed/simple;
	bh=cSVtqwIAX/SFczkOeUbAhlabmVOHw/+tSx5h7+a5Czw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LVI/XPxXKALUWgC2YWP9ATUMTXAbsZHe65wPhoJPmJdcKihQoT4OTlpNSTn6ykwzjEiqWbaGnWlJ3Axae6Lc341IRoDkXCC6hPYslKWe4rAAYATCtTuTOnYYkKV+RZJBgbyUgwIKby/fqG9XMuYyO7OlNgak3VMiTh34ES6+OrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XhQCGJN9; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XhQCGJN9"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5b159850b16so1842039e87.3
        for <linux-staging@lists.linux.dev>; Wed, 15 Jul 2026 05:51:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784119864; x=1784724664; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P7qtNLeb3vifmZy8w97jp5BanhP4clMFWT1Ht9D7LA0=;
        b=XhQCGJN9FrJhp3+c09JCwkcGYqXUZV3mlp9IidzB2rt1doAm9HuFjVLode8Ys7XFSj
         3PAwhmdJyse+XrsBYhWel6umIhueKTutQLF0lLtzIxfexlaXJqfMso8TLsp43u6PQblJ
         6FKhq/xOzEal6XVqHN09hkOw5TQ9tnopUFN71N4iQecQm/sGBFyAP1utAB8z02rVg5y4
         38ylkshvo2Wf8fCX6HftClqYwNRE46tJIBI/gB3pBW3wqpB5wh692ZTeWsb+NdPLg3jl
         9UKx44r+zRv56jqvvqp6qqDLjQ5XWuVklP2zps72tSi38BJGE/qMO3Xgxd+vKzYZ2UdZ
         EFCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784119864; x=1784724664;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=P7qtNLeb3vifmZy8w97jp5BanhP4clMFWT1Ht9D7LA0=;
        b=AHS82gtSYq29Z0ikdDY1NE5kDoWOskkunplC+IF8BlsgnOFtR+npseNFb3F9VDbMlS
         fV+lgj0nS1rvtk51046yOzADAad9PFAQjntyp8IZlzbqfRPnSF4RkdIVwMbZRRMcee/N
         UhUBI6g5GpJ/oGJbzS1MZ05QoLKuHmQMMgYVKazUFoj+VkVZxOK58BWQa206IgtWOtDX
         Z9QjZ67OBo8WFk2N8jP6OS0ed7N1kktKd4mGMnoGbkUz2FV+UT3++VrU6cnKAihjBJo0
         zzVvMp/5wWTjjgKPKfrYO/GvY9tRAdbkBcjMJ3YYKHLSPlgyx3EvExXvgnZBI7uXLIEw
         6Aog==
X-Gm-Message-State: AOJu0YwBMNWoZWIrk6jmp33POp53Mgnd1MJKn6A81qwl8/0xY3j3Irnq
	ICqf2Rvzgp9ekFHfvXE/8RO9e8JD6CHHCh3HvzWSsxToMJi3akK0pnyHecXqYEuk4xg=
X-Gm-Gg: AfdE7ckUK0yDFzctVh5lxXaHvZQ8v1OuQ9P5n3NPfCR/HYldxQMVWGIWAvXHJYcKcsx
	ACCuSkM5rOQmJUgTYq9uI9aeN9dO30via/1fhRC5ZS9E32vQ11+CGGC37j984Nbd6G4H2JitTyX
	mAyMSkdVhScb1a94McX0Mh1sxoMcFSR1C3chkWTY7h7y7Es70R5/+gj/0Nw6waACeJcUh3twujM
	dulQdoQn3bU5wR/67GTu9pZ5W8fmPCPeN+1vF3fnzLpcsRJveZVqs+tmDNN1gHbibxi8IoaIepi
	J+nWerJgOgD7OHZOedIX/f4R9DPl6E3DV3MOF9AVZYwsfMbMtBk4xDwQmwFrBeGj6+rNGoxQZ5j
	VNDHdQCMh7aD2wEg0p6QZe/6fQSE56SeHelFHODcGOv6NvyP9ihgk6jXHbDurf23S+mtsoElcWS
	GLaynjtqEEmX61U7iYpDC5zrlGb1xH8HnQuoagpSHHnAfEH7UHAbBq2NKEx5v3H+v609RfbgYJx
	PwznQCRM8eaWg==
X-Received: by 2002:a05:6512:2524:b0:5ae:b5bd:5e72 with SMTP id 2adb3069b0e04-5b1582c61aemr1847196e87.59.1784119863753;
        Wed, 15 Jul 2026 05:51:03 -0700 (PDT)
Received: from archlinux ([94.180.44.28])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b022fac999sm3404042e87.55.2026.07.15.05.51.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 05:51:03 -0700 (PDT)
From: Arsenii Pashchenko <ulijg308@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	ulijg308@gmail.com
Subject: [PATCH 57/61] staging: rtl8723bs: inline rtl8723bs_hal_xmit into rtw_hal_xmit
Date: Wed, 15 Jul 2026 19:48:25 +0700
Message-ID: <20260715124829.90290-58-ulijg308@gmail.com>
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

Inline the transmit frame handling logic from rtl8723bs_hal_xmit
directly into rtw_hal_xmit. This simplifies the driver's transmit path,
cuts down on an unnecessary redirection layer, and improves code
maintainability.

Signed-off-by: Arsenii Pashchenko <ulijg308@gmail.com>
---
 drivers/staging/rtl8723bs/hal/hal_intf.c      | 28 ++++++++++++-
 .../staging/rtl8723bs/hal/rtl8723bs_xmit.c    | 42 -------------------
 .../staging/rtl8723bs/include/rtl8723b_xmit.h |  1 -
 3 files changed, 27 insertions(+), 44 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_intf.c b/drivers/staging/rtl8723bs/hal/hal_intf.c
index b11f4ab4a..9bb1fba5c 100644
--- a/drivers/staging/rtl8723bs/hal/hal_intf.c
+++ b/drivers/staging/rtl8723bs/hal/hal_intf.c
@@ -219,10 +219,36 @@ int rtw_hal_xmitframe_enqueue(struct adapter *padapter, struct xmit_frame *pxmit
 
 s32	rtw_hal_xmit(struct adapter *padapter, struct xmit_frame *pxmitframe)
 {
-	if (rtl8723bs_hal_xmit(padapter, pxmitframe))
+	struct xmit_priv *pxmitpriv;
+	s32 err;
+
+	pxmitframe->attrib.qsel = pxmitframe->attrib.priority;
+	pxmitpriv = &padapter->xmitpriv;
+
+	if (
+		(pxmitframe->frame_tag == DATA_FRAMETAG) &&
+		(pxmitframe->attrib.ether_type != 0x0806) &&
+		(pxmitframe->attrib.ether_type != 0x888e) &&
+		(pxmitframe->attrib.dhcp_pkt != 1)
+	) {
+		if (padapter->mlmepriv.link_detect_info.busy_traffic)
+			rtw_issue_addbareq_cmd(padapter, pxmitframe);
+	}
+
+	spin_lock_bh(&pxmitpriv->lock);
+	err = rtw_xmitframe_enqueue(padapter, pxmitframe);
+	spin_unlock_bh(&pxmitpriv->lock);
+	if (err) {
+		rtw_free_xmitframe(pxmitpriv, pxmitframe);
+
+		pxmitpriv->tx_drop++;
 		return _FAIL;
+	}
+
+	complete(&pxmitpriv->SdioXmitStart);
 
 	return _SUCCESS;
+
 }
 
 /*
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
index a4dfee1d4..2298c41df 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
@@ -453,48 +453,6 @@ s32 rtl8723bs_mgnt_xmit(
 	return ret;
 }
 
-/*
- * Description:
- *Handle xmitframe(packet) come from rtw_xmit()
- *
- * Return:
- * true      dump packet directly ok
- * false     enqueue, temporary can't transmit packets to hardware
- */
-s32 rtl8723bs_hal_xmit(
-	struct adapter *padapter, struct xmit_frame *pxmitframe
-)
-{
-	struct xmit_priv *pxmitpriv;
-	s32 err;
-
-	pxmitframe->attrib.qsel = pxmitframe->attrib.priority;
-	pxmitpriv = &padapter->xmitpriv;
-
-	if (
-		(pxmitframe->frame_tag == DATA_FRAMETAG) &&
-		(pxmitframe->attrib.ether_type != 0x0806) &&
-		(pxmitframe->attrib.ether_type != 0x888e) &&
-		(pxmitframe->attrib.dhcp_pkt != 1)
-	) {
-		if (padapter->mlmepriv.link_detect_info.busy_traffic)
-			rtw_issue_addbareq_cmd(padapter, pxmitframe);
-	}
-
-	spin_lock_bh(&pxmitpriv->lock);
-	err = rtw_xmitframe_enqueue(padapter, pxmitframe);
-	spin_unlock_bh(&pxmitpriv->lock);
-	if (err) {
-		rtw_free_xmitframe(pxmitpriv, pxmitframe);
-
-		pxmitpriv->tx_drop++;
-		return true;
-	}
-
-	complete(&pxmitpriv->SdioXmitStart);
-
-	return false;
-}
 
 /*
  * Return
diff --git a/drivers/staging/rtl8723bs/include/rtl8723b_xmit.h b/drivers/staging/rtl8723bs/include/rtl8723b_xmit.h
index 8d6d6d2b7..157b2a808 100644
--- a/drivers/staging/rtl8723bs/include/rtl8723b_xmit.h
+++ b/drivers/staging/rtl8723bs/include/rtl8723b_xmit.h
@@ -409,7 +409,6 @@ u32 rtl8723bs_hal_init(struct adapter *padapter);
 u32 rtl8723bs_hal_deinit(struct adapter *padapter);
 s32 rtl8723bs_init_xmit_priv(struct adapter *padapter);
 void rtl8723bs_free_xmit_priv(struct adapter *padapter);
-s32 rtl8723bs_hal_xmit(struct adapter *padapter, struct xmit_frame *pxmitframe);
 s32 rtl8723bs_mgnt_xmit(struct adapter *padapter, struct xmit_frame *pmgntframe);
 s32 rtl8723bs_xmit_buf_handler(struct adapter *padapter);
 int rtl8723bs_xmit_thread(void *context);
-- 
2.55.0

