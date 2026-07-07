Received: from mail-pj2-f0.google.com (mail-pj2-f0.google.com [74.125.227.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBD2F3F6C29
	for <linux-staging@lists.linux.dev>; Tue,  7 Jul 2026 11:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.128
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783423539; cv=none; b=gnQ+MTJhvqv6KAXXZ3UCCIzrExsF0tTeAijldOGd59hOI9lI9yApvdHhnzacgyyFGhlIWfRSDnMKKpErelaIG8k/waEBGKikPAabSkaAlHHO6kiamD76Dwu6ukS0nKSsUqNIgJByevojiVRj1ATX8RhAvQUCD+7PxBv6HmGeifo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783423539; c=relaxed/simple;
	bh=iMxtahLHQoMiubV/pcHoTNYwowF8bdCxQr/U4FlYtrw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eH4ZBo6I3kYC0nZYpV6I6NCGCfHGY/7tPrYKZMEXQnOmq34BLtPrG9Gi2cSI5EG6d0FbvHXB1QEpS6vJ/W3TGOGKtVKbhoTXqxxTbeXSMRkuOn7ypaEKi7CFzkIdrJOp1eq1JQ8xLYXkpdX41YWpsfoajO+JvYQYzPF9rmaoziI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K8UQO2Sk; arc=none smtp.client-ip=74.125.227.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K8UQO2Sk"
Received: by mail-pj2-f0.google.com with SMTP id d9443c01a7336-2cc2c6e0688so14140685ad.0
        for <linux-staging@lists.linux.dev>; Tue, 07 Jul 2026 04:25:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783423536; x=1784028336; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+M3jZ+huP1pty8YCVL4kj3Pow6NKpQ1GPn0YVqT9low=;
        b=K8UQO2SkYKIJDpiBntKzVR7ohHaaL60z/wm5mRkXQRfEy46HhBhQrmlWbm411itR7G
         NJBavuGwOA7pBziC2rDaYT5LJh5KPr0PlLPckIUnV+6r+gnxh4IqjitXwLWn8iJem/K/
         hqUk6kjhjDa/ul9hY5nmtLrQEKvceKBaA3bqe5XlaV4xHqSY4M7mvvGNff3VUeooKSG4
         RSNQ8/KL7btVUxuFXRUanRmoGJehmY0Y8Hc7NYFPDGSX+J1UaPCQowXDoYFpH180I0Hr
         4Hydz1VDopQiJenkgeYwL2tYwx5/GZ54MssXShP07gv6mHI8Mb5suFd6h/o872JHzEEy
         ZF0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783423536; x=1784028336;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+M3jZ+huP1pty8YCVL4kj3Pow6NKpQ1GPn0YVqT9low=;
        b=bMri4TpLUP7W9E4lp8QRCSXjgIiAZ+Gd4yks7UuAm0sUMiXzoUVc12yZex83HE9iRO
         a/TuasSdQ5XXUpSGsOIlhgCj/GKmA9rQ+0BjH3alOMPON+1jGAVmxFUrYUbWe2OeO8lQ
         ZmWCrks1DI/8t7arcIuTwA2/GO3OK9L670wbRj6WqTr3vwU9UjN5wPufNZr+kCg9tEcz
         O6VxdQhi7p5emNCdrGm8yJobkvaIrz3zU2PXuWIV4qe/hUX5KcjlOIenEmtF1L3kSv9j
         WHmEUJW1ReU85e5CGeb5iD4sqb6955REszS66THFIjk7WvXIE27f8pJBeVZRAxfjBSLm
         Z+uw==
X-Forwarded-Encrypted: i=1; AHgh+Rp8UThTIDm1LJa8lm0MTpg2VV7QzbdmMS7LP7Z4xWVoxlVRD3M91+qP90IJ6aYIckDNjDgx7P8ogLlUWtx9@lists.linux.dev
X-Gm-Message-State: AOJu0Yzy0B9Hyi9/bXWhH3E+haxh4nefEPWDv2sc/gw6DrqmpV9eDAXC
	A1CNj8Y218FH9xnKoO8kon/VCOj8qSxFrm5YlvfQYfcAJssoWfaUlF5y
X-Gm-Gg: AfdE7ckeuVnb8B60+CDN7C/l+rdTZDfJ8kwCxdflD7wUiU1KnHvIUmUcuOVUVmXW7nB
	E1O56LaFBdjvAj9bm2tzMINqgJx7tAkNdsZTQAuVfDYO5ZgRh5JgAWSr8G3lI5zU2yXiL8JY3gB
	WniarZltt/Tpg9qEBjFzt7iCd4iL36aXNCR1DMBN21Ec9TLL0HnPC4MPC+VrHhziEhGQiU0qs96
	vpjfrSctR6IqVy+o5ALNZ3Foqk8niC0QgBnhDBu4OLCmHNWKdLscU3Q7lB3hSAet4usp+zr1pig
	kOE3RSPzkGp4bj039k2Zwo/8URb3W2znW4w1QwdApRvpRN87gTjit6P6lqbdHYQOKQ1UJ2mKEAc
	XpDGs4gVbJTIPJbGe2RANkWZHrdifdzrkO6Qim0sS09ZsdEgOTPWgk0LbwqxVrOv+eCH3AIZGVT
	D6CMAedmbs4PHg5Lh+9y8iNP0gzIyOVKV5UoVFA1ZTpsfn
X-Received: by 2002:a05:6a21:e85:b0:39b:ba95:b14c with SMTP id adf61e73a8af0-3c08ede20damr6218021637.24.1783423535842;
        Tue, 07 Jul 2026 04:25:35 -0700 (PDT)
Received: from localhost.localdomain ([76.32.119.210])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b65960d88sm6548721c88.6.2026.07.07.04.25.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 04:25:35 -0700 (PDT)
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
Subject: [PATCH v4 3/4] staging: rtl8723bs: convert update_attrib_sec_info to return errno
Date: Tue,  7 Jul 2026 11:25:02 +0000
Message-ID: <20260707112503.612-4-dennylin0707@gmail.com>
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

Convert update_attrib_sec_info() to return 0 on success and
a negative errno on failure.

No functional change intended.

Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_xmit.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index 69b6d3a2554a..066f6e974e4e 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -505,7 +505,7 @@ static void update_attrib_phy_info(struct adapter *padapter, struct pkt_attrib *
 	pattrib->retry_ctrl = false;
 }
 
-static s32 update_attrib_sec_info(struct adapter *padapter, struct pkt_attrib *pattrib, struct sta_info *psta)
+static int update_attrib_sec_info(struct adapter *padapter, struct pkt_attrib *pattrib, struct sta_info *psta)
 {
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 	struct security_priv *psecuritypriv = &padapter->securitypriv;
@@ -519,7 +519,7 @@ static s32 update_attrib_sec_info(struct adapter *padapter, struct pkt_attrib *p
 		pattrib->encrypt = 0;
 
 		if ((pattrib->ether_type != 0x888e) && !check_fwstate(pmlmepriv, WIFI_MP_STATE))
-			return _FAIL;
+			return -EINVAL;
 	} else {
 		GET_ENCRY_ALGO(psecuritypriv, psta, pattrib->encrypt, bmcast);
 
@@ -558,7 +558,7 @@ static s32 update_attrib_sec_info(struct adapter *padapter, struct pkt_attrib *p
 		pattrib->icv_len = 4;
 
 		if (psecuritypriv->busetkipkey == _FAIL)
-			return _FAIL;
+			return -EINVAL;
 
 		if (bmcast)
 			TKIP_IV(pattrib->iv, psta->dot11txpn, pattrib->key_idx);
@@ -596,7 +596,7 @@ static s32 update_attrib_sec_info(struct adapter *padapter, struct pkt_attrib *p
 	else
 		pattrib->bswenc = false;
 
-	return _SUCCESS;
+	return 0;
 }
 
 u8 qos_acm(u8 acm_mask, u8 priority)
@@ -755,7 +755,8 @@ static s32 update_attrib(struct adapter *padapter, struct sk_buff *pkt, struct p
 		return _FAIL;
 
 	spin_lock_bh(&psta->lock);
-	if (update_attrib_sec_info(padapter, pattrib, psta) == _FAIL) {
+	ret = update_attrib_sec_info(padapter, pattrib, psta);
+	if (ret) {
 		spin_unlock_bh(&psta->lock);
 		return _FAIL;
 	}
-- 
2.43.0

