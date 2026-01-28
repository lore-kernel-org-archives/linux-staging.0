Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C70C330B3F
	for <linux-staging@lists.linux.dev>; Wed, 28 Jan 2026 17:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769620953; cv=none; b=pAyAURD5mD+4HV6bCKucgEQUguAGpaPknKPtu0k14z85EhVhBu+G1gTCPydhqHR0q/Z75auoLT7d0oIKA3BqhkFEOaUMRwi8k/gAXzIwbvsUQFZFRKfvmuXqV0oaysaDZaZjw1Iocgu9fiI9PjFugz9R4PPqGvs8sSEsyL1RuQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769620953; c=relaxed/simple;
	bh=m2DAeGWzupsYOReRvQVc1ESXRJf8bpaCOfiQBtpsZb4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u/cxiXAhUf8ZqNQ8Fww7llKpcb+xGrEE+ybbOmbiNEZitO/DQAOwRUCo0hqdEmYG2ns5q0OGT1hPkUztL/9HAv3kDznfFqqj44EgXuZx01BDsQXRT9QKumUNs/snIpGm/llf70vsBjOpy86MJFyV29Z/sGLsXMUXOqVeMuiknTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZfDOUaHI; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZfDOUaHI"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4806d23e9f1so854785e9.2
        for <linux-staging@lists.linux.dev>; Wed, 28 Jan 2026 09:22:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769620950; x=1770225750; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r3VV7ZXSxulCvmS7hGVdpnbRSgB5Z/EbJYfxcinKUqg=;
        b=ZfDOUaHIjOqDaHxxu5CokOYRfF4nwraSVKjp/RHdPkp7bRQloqOE/kzC5j0ScRXWmm
         gcH1ENVERagrhOnvG2RpygHgEdJ18mSeco9uYVrP7zsXWcfCWQVmKybY/PNaQIGPuzzK
         Vz8eo9bXhBhGNr0aXW2HJ9efbdkbPrVPNKtwIZrX3EsdY9OkkH1HGDmSVTVN+l71iZFq
         k4bETrPAwPVJvdfWuBjTy8tfXdLfIsF66gFr9FAM1KkuG6N0ZbzZib070HzpmiCA5p9t
         zptzGidt7PXTb4faP/3V6Mb7jM1WE8WM/fp01cUDbTq/UbDpe9RItWllbxsOZM6cNtDU
         u0Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769620950; x=1770225750;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=r3VV7ZXSxulCvmS7hGVdpnbRSgB5Z/EbJYfxcinKUqg=;
        b=VJ+Y79u6YekObP1uW2/W7Ta2XyyAIxtwHx8HL7Rbh0UH4+LpnbCFBRAEtA700Ss9z6
         HBTqJOFntA+igrhLMiwX8zWJ9XuDSZrbodFh7mq9nUjh8izZO35gHfivzsX8nuWoOVUh
         ysKDpZIEySIi9Ewt/9SmDfM9neXeO6uSZKIEMwXde09bZNewBSaRKXFtneMk2jbvT3x8
         t2x1RLcjGfdsNJFjoHD/xjQu02QHdPiz/sWN/FXDlIY4ZQ2mZE+Qgs6yOmvnRAbZpZ2d
         vHkZ/fHI94pitbuGvdmQ5tmerqbpirbYdhiki4k0Hk6Dve9KnV2T3hGDYgnfrj6OaBS9
         7YuQ==
X-Gm-Message-State: AOJu0YyG46sCxZmBTwTIPJrvCTs7BrqdLRdYgsqCCeRJy0rt8ro1ZaBK
	bybU2v5iKXy40lZAYTWgUzza3PUSoDqk5X1DU0VxoK3Yg83Iq0Qn8t/o
X-Gm-Gg: AZuq6aJD3rId2dGztG/+UNPorsiVwpIPCrQWAjyERFK/vNOwBham73jBbN/bxhT3jbw
	mLOBOgQStirACvj3QccF1e2DFH3EFova/jlIIeKIEGAcTSw80/Pfyk9mNT49lBzUgBGBzg0RRQC
	QQwBDHLrQnbZCeY/VD2T+Nnh3PaYB1kUarYg9+nh1K+FySPgfUYCTUKG4Zzafa5C4PiqvxQPEAA
	GWCg9GWzISR9eug1CrpYPurxidkXTwCzvZV+asnVbUo0hv6hM00p9dw05TC0cUPphUX7U0Ul+1g
	MOOLCjIOGi4ZYdgyfRWUn6nUOQ+kK7tCKCNZPAr/nAiOENTNZxVwmb/sv5ysgOLc0fTfWds42oc
	iWoTw5TZelzrEjF2ULmbfY5AVEhVuUGxlevjavrs9JYNKY8oTHkz2XEUHUBx3VXlcFaIWLL1BEi
	RShdpxJ57R
X-Received: by 2002:a05:600c:1c1c:b0:46e:761b:e7ff with SMTP id 5b1f17b1804b1-48069c67621mr80472415e9.28.1769620949660;
        Wed, 28 Jan 2026 09:22:29 -0800 (PST)
Received: from TTPP ([31.176.180.180])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48066c37420sm155554655e9.9.2026.01.28.09.22.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 09:22:29 -0800 (PST)
From: Omer El Idrissi <omer.e.idrissi@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Omer El Idrissi <omer.e.idrissi@gmail.com>
Subject: [PATCH v2] staging: rtl8723bs: replace magic -2 error codes with proper errno
Date: Wed, 28 Jan 2026 18:21:43 +0100
Message-ID: <20260128172143.23472-1-omer.e.idrissi@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260125221219.26151-1-omer.e.idrissi@gmail.com>
References: <20260125221219.26151-1-omer.e.idrissi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changes since v1:
- Removed leftover comment accidentally left in previous version
- No functional changes

Signed-off-by: Omer El Idrissi <omer.e.idrissi@gmail.com>
---
 drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
index abb6fdfe7e1f..8fa823f7bab3 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
@@ -205,7 +205,7 @@ static s32 xmit_xmitframes(struct adapter *padapter, struct xmit_priv *pxmitpriv
 			(padapter->mlmepriv.LinkDetectInfo.bHigherBusyTxTraffic)
 		) {
 			if ((phwxmit->accnt > 0) && (phwxmit->accnt < 5)) {
-				err = -2;
+				err = -EBUSY;
 				break;
 			}
 		}
@@ -260,7 +260,7 @@ static s32 xmit_xmitframes(struct adapter *padapter, struct xmit_priv *pxmitpriv
 							   "%s: xmit_buf is not enough!\n",
 							   __func__);
 #endif
-						err = -2;
+						err = -ENOBUFS;
 						complete(&(pxmitpriv->xmit_comp));
 						break;
 					}
@@ -380,7 +380,7 @@ static s32 rtl8723bs_xmit_handler(struct adapter *padapter)
 	/*  dequeue frame and write to hardware */
 
 	ret = xmit_xmitframes(padapter, pxmitpriv);
-	if (ret == -2) {
+	if (ret == -EBUSY || ret == -ENOBUFS) {
 		/* here sleep 1ms will cause big TP loss of TX */
 		/* from 50+ to 40+ */
 		if (padapter->registrypriv.wifi_spec)
-- 
2.51.0

