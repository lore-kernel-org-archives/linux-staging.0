Received: from mail-dy1-f194.google.com (mail-dy1-f194.google.com [74.125.82.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B52E948BD4B
	for <linux-staging@lists.linux.dev>; Tue, 16 Jun 2026 23:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781653982; cv=none; b=q7R0TzITfWwIv/3F7PmhNc4+6xzomgbi2fOc9/lhTIb0lAk1C+OlEwKAvbJgppYz4bxLfgVipFR6rYjtrTUqoPNmDVAmTwGPXz6mLIwFUErfL0FZJSud0hFKAtFhZrWEZSk8BeOJetI8Nu13ObJTUJoNHjMg9Ayyhige0Dm9EZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781653982; c=relaxed/simple;
	bh=+2ZAsq+xEDTtQWxNiEgUsg8vHStQmbMMnyhTm0Hh1R8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=s3I4WVpUCdDNt572iKER+p9v4RbdLB4Nh0PreKJ6bUUIJxX8cZYV+zdxTpopX9ouLBhmMCcMRRLii0WUi7kqvokJ6v6V9sRQBfSXLgWgofmTHuDCT8Tg3Cs1A3JT68W2TSNl0kUNNc+XNeZFDzVc9CFi+VJJRqtgXsry0tUGMr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mTx7sca5; arc=none smtp.client-ip=74.125.82.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mTx7sca5"
Received: by mail-dy1-f194.google.com with SMTP id 5a478bee46e88-307d0405e07so7929477eec.1
        for <linux-staging@lists.linux.dev>; Tue, 16 Jun 2026 16:53:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781653981; x=1782258781; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3aMuC1VCOyhVkCqSO+h6+ZxFuqfGmZeukjOGA+GlgDo=;
        b=mTx7sca5FIpTksiABkccZ+9HxrFUDRnjYsMGL/J6zOu8a10LTNqd+9op85iURQlpnj
         OjlhritBF21KG0Gg7j3M295ggQP0CF7Le50LaK2fHVZCtb9Tt5O7MMqTISLlNXAQycqO
         V61UHO8RI0FDAyf52WheJ6e1rP0vyTJ8cJ7iGJeOfj0Xfl1YG6cKsDL4V2xC+uQcL2++
         V6Hhkgih2rphKKtyOJO7QXK1jjXj2ywcOlpko+t4+y6c9aq3NTAa1cHHAlmNGFveWq61
         ZsVEn0+m2PFMbYFc7mKHL6GW1wib6wXcLL/k7mJvdfDYfP4ThboWqP2OCKXDuEU3hxE8
         dWvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781653981; x=1782258781;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3aMuC1VCOyhVkCqSO+h6+ZxFuqfGmZeukjOGA+GlgDo=;
        b=j4vMmB3N4yMpZyCIgaNQIsbuPaKExgSZZaizlsW+lVB2BiIIT35A0ZHALIapCDWaX/
         bRZfG6lIwiNIHRuJdx9NE/ytBdtEFkIiiDifFNR3S2N8CrkIjgI9DuQnb1dFkfSyHNye
         ZReJsKCOpOfVpc4pJxyx88AU4FVxsoAqQ97UyKoui8BNNHRM8kgTm3M/d7Lgh1zG4ZrU
         Z6fg6gYtWWfWPo0FniCtc9Sbrobeo7dd6RkCiMmu/QWwowDa1XLsxuYBcxVQFb+D0kkG
         k+A/JWYTGHBvaIgz71h/1bgKVwlEDgahunJvIW7fpspnz6r0cPs6aLwHLMROte2gun0X
         xTQg==
X-Forwarded-Encrypted: i=1; AFNElJ/KJcBookBtb68mnZUrwjkQEcmYExxtxSPXS1iGGREj9DjbaNTN75QWxCxs8pvEC9u7HI6MLvdCuEvL1nKp@lists.linux.dev
X-Gm-Message-State: AOJu0YwlaqKit4le5+Zsjf1Bk/NvbYZu1eb9tbuV4Z51h3WDqqlGZYJ4
	N/12KBLOFatNtuBeW/B/3f09rW7L8Ca9a/U8VKTsHtZqMb7NvmlNidy0
X-Gm-Gg: AfdE7cm78avGd7DQTa9e5EnXYeoc2GHDtpYq95MKGlGtUZDTDaAyJxm0o+CNmYtj2Tv
	mMNRP/NMEtfCfGA7i7oIhaK8uFp9vpNfhnpvqMGf4ID7L8Hs3mCILInaf8sVL556Umm9copjJKj
	wMwQnkM6D/v7WEQfRzKNemAdmgsOXLZYzpH+c+IaYoycQAxENyMfkWKZzMpd8Z1/bW5HFARpSi7
	/0yBb5sU1S87rQ5UiilVmkooKEAdJ9CHkiP4O8BYkfj7+QnrH74E0GbXquOWUNCYdX5x1rX25XZ
	Z08pOUMcd75M36uC3IcH8mEi9uPNL3n7Ncsf0w77w1+hRTtf44BTbT3de0CzQdx8xlu4JRxPlZD
	N4SoNakTEtCNlGpDIYkweB0r7yvVr0Z3xFzF0VeYFXjCJYzT1OjZdRltkTKDfbqJ5ot1hT/W3rO
	WahSLnclA4tkRLi0mBUydS3Hje+ulSE+HXsGso0jleJXj+/nxstb8lewrAJ7l+Aie63Q==
X-Received: by 2002:a05:7301:7c0e:b0:304:9b48:53d8 with SMTP id 5a478bee46e88-30bc9df7446mr796485eec.10.1781653980896;
        Tue, 16 Jun 2026 16:53:00 -0700 (PDT)
Received: from localhost.localdomain ([76.32.119.210])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d3f20sm20208153eec.9.2026.06.16.16.53.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 16:53:00 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: gregkh@linuxfoundation.org
Cc: error27@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH v3 3/4] staging: rtl8723bs: convert update_attrib_sec_info to return errno
Date: Tue, 16 Jun 2026 23:52:40 +0000
Message-Id: <20260616235241.99076-4-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260616235241.99076-1-dennylin0707@gmail.com>
References: <20260616235241.99076-1-dennylin0707@gmail.com>
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
2.34.1

