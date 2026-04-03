Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D4393D330B
	for <linux-staging@lists.linux.dev>; Fri,  3 Apr 2026 17:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775237411; cv=none; b=LhueYzScoj0Uev0fi0vuZScbw1I+KsgfDnX6EbuF8NEXNa1R+xL6ZzAdG3AF8GJuPN2m8i4Vv8kJRlA8k9aZEg7ObBohbnLtsVgUI42wSUBJhcjx55qT1jWiUTQT39KUj2X6hdXPFx4VWnql5mqGbYOFx36tpSnT1laAmutJJRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775237411; c=relaxed/simple;
	bh=5HgUw/PZ33qzmUqJitO72JwS5L+n5TBQZq/C8hW1eIQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KafaX14uTjhoISKpcnu9Wk/rmhZwpPqT+VrsYU92xiFxbTZVjYzIWnVl9zgQiGqgrEIp2f/QM0WFiwIyQjyGlS/jzkfEt5vtO1iPV7BQmhGR/17s4jrazkHAccfXdlIo4KHGLJm2Z2Zz5jOuLJpNgaPVM3g30S/U2G2TAmriIsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=samdaly.ie; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=samdaly.ie
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-66ba9dfe83bso2909516a12.3
        for <linux-staging@lists.linux.dev>; Fri, 03 Apr 2026 10:30:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775237408; x=1775842208;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5fj+bJJFsScGA4TvKB0s1XCPmZAM+dMhdxU9dL4OKSg=;
        b=HXOoR9RcV/2AyShAdvEOcGSM0409cQdS1Qaq1eDZrifEATSHhawohLm3GyKrqXNyfh
         h+XJLb+wdM8CIOOK0CRQmDEBlXKIcn3hZVWswEI3VMV/q4rcg1ysySl358FGZCNdtJa8
         rSUs+aMfD8vYDCsKO4fHsm6A5Nr46SVDmZZ+SdSxlvIM00XlaDfZxl/zezGRRkZwOQzN
         mtMt/MEsGiHKwJwhDv7ce1wB2dvCoz+iP8W35DaTci9QGfwLjBZOPZqU//isAP+l2WYa
         V1CCP6WrOFYaRD/M8LmMVfmafFzB+zIu9zMtdjQCOd6RajcE6H0b+ibu/ht1kj2xCVg3
         g0LA==
X-Forwarded-Encrypted: i=1; AJvYcCW04XEnwu3dSQRZfaBOP7VMKcKTStgdsAgtPCNOsRX8e09zracMhcKIua9tE6xiAKNaoQu62O4v+JEmId81@lists.linux.dev
X-Gm-Message-State: AOJu0YwEeHjbd29pRfN5Z6PhcWK1Rr0k8r1cExCXuazsDDDyuwbNafq9
	bQpSAsaQK98q6k2OkFmraXZWSqa0+iLVIiQgWq9aSjWCO9xjBGuoZNos
X-Gm-Gg: AeBDievJvv2ntF16zmR0w/FUdPu1NTAyZPyBQUfBFIKYBbC8k2a4lY5vnrjax7BSfA2
	FLt6tUtaxBWBK6jmHstGvmftMKgLVJJVashb6eLO1PrpDJ5rvbQ1OEWkRalUB9K5IOv6oe74n9A
	lqeNnMDIe0tS01KXFYcFx/5nO2lNKX/POQ8C56bQ+p3PO9sTEJpKVjha6wJvBM/d61KNAiyoIym
	QigFpn3EZRhB6m4BkcmdLXP2+nClypA4DN8trvJjGt0V3PQBrtDPncePcN6O0J6qby6xdiE22tK
	coFAehI6bRPYDWHw1Ody/4LyvFmPssvEOw1dYrNcdSL9fBMCE6BxiGTX9CakYBAcVTUyRvL6X5O
	nkgc9qUmoJSlIBTD22R9JBX/sknMiZyRx5vkhXy3Xke4iuEz/WJQuu6poAl1M/2iQ/R/qRFaqmL
	HC14oJt8IAnsra6EHm88hiNJVpgCdSlqVoxtVOtCK/wGI/5wNBdA==
X-Received: by 2002:a05:6402:3513:b0:66e:6ac4:2c01 with SMTP id 4fb4d7f45d1cf-66e6ac42c8dmr662670a12.2.1775237408443;
        Fri, 03 Apr 2026 10:30:08 -0700 (PDT)
Received: from gengar (77-248-15-86.cable.dynamic.v4.ziggo.nl. [77.248.15.86])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66e034d60desm1755308a12.31.2026.04.03.10.30.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 10:30:07 -0700 (PDT)
From: Sam Daly <sam@samdaly.ie>
To: greg@kroah.com
Cc: gregkh@linuxfoundation.org,
	dan.carpenter@linaro.org,
	ethantidmore06@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Sam Daly <sam@samdaly.ie>
Subject: [PATCH] staging: rtl8723bs: remove redundant & parentheses
Date: Fri,  3 Apr 2026 19:28:39 +0200
Message-ID: <20260403172839.367663-1-sam@samdaly.ie>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove redundant parentheses around the '&' operator to comply with
kernel style guidelines, as reported by checkpatch:
CHECK: Unnecessary parentheses around adapter->securitypriv

Signed-off-by: Sam Daly <sam@samdaly.ie>
---
 drivers/staging/rtl8723bs/core/rtw_security.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_security.c b/drivers/staging/rtl8723bs/core/rtw_security.c
index 4edcbd95aab3..a00504ff2910 100644
--- a/drivers/staging/rtl8723bs/core/rtw_security.c
+++ b/drivers/staging/rtl8723bs/core/rtw_security.c
@@ -1456,7 +1456,7 @@ int omac1_aes_128(u8 *key, u8 *data, size_t data_len, u8 *mac)
 /* Restore HW wep key setting according to key_mask */
 void rtw_sec_restore_wep_key(struct adapter *adapter)
 {
-	struct security_priv *securitypriv = &(adapter->securitypriv);
+	struct security_priv *securitypriv = &adapter->securitypriv;
 	signed int keyid;
 
 	if ((securitypriv->dot11PrivacyAlgrthm == _WEP40_) || (securitypriv->dot11PrivacyAlgrthm == _WEP104_)) {
@@ -1473,7 +1473,7 @@ void rtw_sec_restore_wep_key(struct adapter *adapter)
 
 u8 rtw_handle_tkip_countermeasure(struct adapter *adapter, const char *caller)
 {
-	struct security_priv *securitypriv = &(adapter->securitypriv);
+	struct security_priv *securitypriv = &adapter->securitypriv;
 	u8 status = _SUCCESS;
 
 	if (securitypriv->btkip_countermeasure) {
-- 
2.53.0

