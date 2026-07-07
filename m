Received: from mail-pz2-f0.google.com (mail-pz2-f0.google.com [74.125.228.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACA5A3F8233
	for <linux-staging@lists.linux.dev>; Tue,  7 Jul 2026 11:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.0
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783423541; cv=none; b=i+Ec8SL35aBBCK+fkLqBsHEpoMsCdUnZLDVYSBJEM4jaoKS5x7wj5cGsh2ocl2HLkZ0eAo0Nm65YTIoi6BhYILlObUc9mfrkcG+DufvMwq2xhKFI9C5fy5jR4i09ChQ5oXUgVJFGeqAti/dxfRb70eCImsaeUgwEJ0lQNEuo66c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783423541; c=relaxed/simple;
	bh=nB4yWnb/jg/+t+pIYYHahQVVd4WbT3ePmsmhKUWoTGw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GDOTn9maz3ZfgqrBxf42GWiDFMRPPY39Uw7V6phVZkt1Bpm72VMD/d+JDxoy4cm2mczlZbL4sRSSSceFOBsonjhIC8zrlJujwzoMyCrQcx0Svbk9uWl96odq+2x3KWcsDzzwpDvEllyiyJxAFqZNSnVbNOolH7iV7Vd9IKlH5zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nJLyPWiQ; arc=none smtp.client-ip=74.125.228.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nJLyPWiQ"
Received: by mail-pz2-f0.google.com with SMTP id 41be03b00d2f7-ca24d39d8a4so671589a12.1
        for <linux-staging@lists.linux.dev>; Tue, 07 Jul 2026 04:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783423537; x=1784028337; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IuAbGJhQVWmvJtc8YY8+MDLZa1n14D/X5ifksvSrOTg=;
        b=nJLyPWiQ/v/i1HJFA2XQ4iXAwgbYuRO4X3DiA6wyzks1u7BH6+e458WS1kgeyqr+KJ
         9GdY/CnYWnju8fr0W0zNPFgDsLxLLRDU0X2ggEYfXvGIhev+4PuPPsNU2kaJcLMR5H6D
         sk5YAw4nKVXu3zQ9E0+SALbSvG/Gml3d9OuRZRsI+byZkog5ICQSJ1ImjF3/Qt0UDCIj
         K2GyuTw4iwQ548NQ0HevoUkU12SEwtqSbWO9vmxrKqjVuqWHkqFai74Jg5642s7fBywn
         XFfCpJ5IAgTE36NrkUeCdDGYKHcdOhocUttL/ZBM6kReMonyQaulnIqN1+y3KDv136DI
         HGSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783423537; x=1784028337;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IuAbGJhQVWmvJtc8YY8+MDLZa1n14D/X5ifksvSrOTg=;
        b=R+VScQiPis60LMT6Q7UoyfXnN6r0JsydCTSlzTBIfbII7rUaqOnzGuI79O+ZJoYXfH
         ENLxkBaZkXduv2LM7bLKBGg/+SX+uDzNGBwdD0EFqXMFsGbPk4mLsETACNY7ig9ypnUa
         gneQJmJuO0vyaBveaIf3cATDiDS6NKrGsVjpHh+BBySxZj0fizdPGRWsBtd5PnxaAzs5
         FfU9fRLTbXCRzjNHcGYHmOyEwL7vtOdUByOM8ashXm1juRUoq0Acaa4z3B2VKtaIKrDt
         /TqwgaS1TMKAvJ9gJIJw2V64rb/PNOc+eAUlcRTpj0tF0c+LtbYewNQt/DfXyKjisitx
         EoFA==
X-Forwarded-Encrypted: i=1; AHgh+Rrhsbt7nbKddqYI+ezlmJFGNJ+3z+SIk4HsRh53EMIn48JFuZvv1HfIc5CV9RxmtRuoyaV6RZjz36TncuFd@lists.linux.dev
X-Gm-Message-State: AOJu0YwOPvFyIBu4BbCij4owsAperMzFk1Kav77Lxi9FNre3q4mej6RS
	5i99qUpW4tOlymWCfibByMIYzR5nUFw0Y+9HTQTRWweU0t3RbdVVYCZh
X-Gm-Gg: AfdE7ckztjT1o4wwLa3cvF6XyL6XI4U07cR6uqJd9LNBIB9/dh25tm17LbuQxkKoz9M
	H/ks9461D/aqv+YuXYgJBMFB4CxAwA97Rc9R/2u7fwGcpwQNtCelfAtT25lPVTnY24mv/0jv6YJ
	PCXOHjdlS7o4Izqm9bSh4sg60DdQWc1ErlrLkZ5L8OvoBjhL7b+YkEARECk2Q9Pq5ZABmPlWqxd
	zjLkvOTPBOKiSwJaPX7AjjrFOI9GQ+9WetaFIqLC63tcJ1zBKyC9vhHhEScXiNUfJQ6cpklPuqh
	P10BbZiNxcqMWqLqwyaOkarjAFmPXRmaa75QuIJaCOv+r+2EL0pPt7QU6ALiYiA5+ESqWw4/MIZ
	E9Vh7QJ6p3DUv6Eylc899AkrxlE9+AUUhISif2eHTA9HylPZRcAE+Mcl3IeuqX5rebYJbMG7+x6
	/PEmCQHw/dwSm9hVjDi/1kkolt4jrAJBlRFrZeyx2z6AIV
X-Received: by 2002:a05:6a21:648a:b0:3bf:a9cb:b799 with SMTP id adf61e73a8af0-3c08ef902e9mr6033506637.54.1783423536770;
        Tue, 07 Jul 2026 04:25:36 -0700 (PDT)
Received: from localhost.localdomain ([76.32.119.210])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b65960d88sm6548721c88.6.2026.07.07.04.25.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 04:25:36 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: gregkh@linuxfoundation.org
Cc: error27@gmail.com,
	khomenkov@mailbox.org,
	khushalchitturi@gmail.com,
	s9430939@naver.com,
	marcosandrade95963@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH v4 4/4] staging: rtl8723bs: convert update_attrib to return errno
Date: Tue,  7 Jul 2026 11:25:03 +0000
Message-ID: <20260707112503.612-5-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260707112503.612-1-dennylin0707@gmail.com>
References: <20260707112503.612-1-dennylin0707@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert update_attrib() to return 0 on success and a
negative errno on failure. Update rtw_xmit() to handle
the returned error code.

No functional change intended.

Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_xmit.c | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index 066f6e974e4e..4d886a35f4c8 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -654,7 +654,7 @@ static int set_qos(struct pkt_file *ppktfile, struct pkt_attrib *pattrib)
 	return 0;
 }
 
-static s32 update_attrib(struct adapter *padapter, struct sk_buff *pkt, struct pkt_attrib *pattrib)
+static int update_attrib(struct adapter *padapter, struct sk_buff *pkt, struct pkt_attrib *pattrib)
 {
 	struct pkt_file pktfile;
 	struct sta_info *psta = NULL;
@@ -741,24 +741,24 @@ static s32 update_attrib(struct adapter *padapter, struct sk_buff *pkt, struct p
 	} else {
 		psta = rtw_get_stainfo(pstapriv, pattrib->ra);
 		if (!psta)	/*  if we cannot get psta => drop the pkt */
-			return _FAIL;
+			return -EINVAL;
 		else if (check_fwstate(pmlmepriv, WIFI_AP_STATE) && !(psta->state & _FW_LINKED))
-			return _FAIL;
+			return -EINVAL;
 	}
 
 	if (!psta) {
 		/*  if we cannot get psta => drop the pkt */
-		return _FAIL;
+		return -EINVAL;
 	}
 
 	if (!(psta->state & _FW_LINKED))
-		return _FAIL;
+		return -EINVAL;
 
 	spin_lock_bh(&psta->lock);
 	ret = update_attrib_sec_info(padapter, pattrib, psta);
 	if (ret) {
 		spin_unlock_bh(&psta->lock);
-		return _FAIL;
+		return ret;
 	}
 
 	update_attrib_phy_info(padapter, pattrib, psta);
@@ -794,7 +794,7 @@ static s32 update_attrib(struct adapter *padapter, struct sk_buff *pkt, struct p
 	}
 
 	/* pattrib->priority = 5; force to used VI queue, for testing */
-	return _SUCCESS;
+	return 0;
 }
 
 static s32 xmitframe_addmic(struct adapter *padapter, struct xmit_frame *pxmitframe)
@@ -1955,7 +1955,7 @@ s32 rtw_xmit(struct adapter *padapter, struct sk_buff **ppkt)
 	struct xmit_priv *pxmitpriv = &padapter->xmitpriv;
 	struct xmit_frame *pxmitframe = NULL;
 
-	s32 res;
+	int ret;
 
 	if (start == 0)
 		start = jiffies;
@@ -1968,9 +1968,8 @@ s32 rtw_xmit(struct adapter *padapter, struct sk_buff **ppkt)
 	if (!pxmitframe)
 		return -1;
 
-	res = update_attrib(padapter, *ppkt, &pxmitframe->attrib);
-
-	if (res != _SUCCESS) {
+	ret = update_attrib(padapter, *ppkt, &pxmitframe->attrib);
+	if (ret) {
 		rtw_free_xmitframe(pxmitpriv, pxmitframe);
 		return -1;
 	}
-- 
2.43.0

