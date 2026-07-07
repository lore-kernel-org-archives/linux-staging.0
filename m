Received: from mail-pj2-f0.google.com (mail-pj2-f0.google.com [74.125.227.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D9223F5BDD
	for <linux-staging@lists.linux.dev>; Tue,  7 Jul 2026 11:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.128
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783423537; cv=none; b=ijMulBkoDdgBB9bZ+e+IsMlYrx1i/LysqG77BY026u0KLbel/h1IoW4d1vI6xAaPaTJM9innwrE69kIv5yUf/KE4qcrcmVN30K5QYZ0R3FB2BdEvaDljTHRWq7jCOIPNRuZeZj7euaZ0+h6fl84P5dxd0VfKu1XwOtAIPAdUXPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783423537; c=relaxed/simple;
	bh=BWhnoMByY8tlUDjvMcBDWxhqMvqW3vappDP793Yy5HU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mSVhSnRZ0b3l9w4mJTv9LhHSljk0A7Vc4F2t+AwCozPSiZ9pqTCuecYxBeFF5eE8HpzM9hcBDZzHrWdArGK5A2eYEdbcwcJqkrgEgu6o+xAnl0NqRoDRkI/W5MuGUb4M+axFuMro2K7msSqV2r/wvXmRWcxNPCVOu/B2/UUMpKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KIylgwV1; arc=none smtp.client-ip=74.125.227.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KIylgwV1"
Received: by mail-pj2-f0.google.com with SMTP id 98e67ed59e1d1-380f4166f80so994592a91.1
        for <linux-staging@lists.linux.dev>; Tue, 07 Jul 2026 04:25:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783423534; x=1784028334; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=23UYfOtXBSiXwdJ5KRDbMy0SKO5+6XK2WJxF7MSTjcs=;
        b=KIylgwV1Xt5d2GQGnRQvsgnSo/M2/yYwnZZaY9fqT1zeXtr1oopwtyN8ujqSL7Zilb
         +hmcdxpifIOBrbh53pOy6C8ANnweXRGCKiormdg/rIhW+C7+gryv9C7+hI8DzEDk1BV+
         6s3rKGFyvjt9UYcmkRCUCJC/RJJ1rjZdmqT3mUfSqAvVh01fBkMliePHOwilC4qflRA/
         Gm57C176F+ZSuiWKJDFAy2yrjG17ZdXvS9Er7YI0ysZYdoyhiy2TYRH/F7JVT05yXVCw
         NJ82hib4b8pdHzA4KQnGnK5O+X1sk1fyHjYq5XP+91XKzfUNK/xq5FUGxYmxUnI5+/Ww
         H5kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783423534; x=1784028334;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=23UYfOtXBSiXwdJ5KRDbMy0SKO5+6XK2WJxF7MSTjcs=;
        b=KpTc3bOlE/q3cWU/yh/2vdkj4Ns0enGqcFrRGGFhHR/R8EE7IVEK+yDFt0h8quAuGe
         RYHcCq7gMs05fqJWMd6+Qd3CCE5/ED30vkWrWRuPcqzFXj03MJgTNmUz4TIj802LDlOT
         6l66xMPlhK2eC49FeeiL/xMyKjNpjmj9eoyCRMG0xO/BSbrA497hBIQhoFEY9s1pKlMZ
         +1LHwY1H+6ohtnIzt/rAZTjhUQO7dV5rXI8QcEbwYFnyul3LGpvU4FORcTkInvq3V+wK
         9/iDSs3nYQmX8R5noPCsCzig1CM9KYRW/BDg+vVQBnZ4dj2DdCev4lnVVepbKh3RIqhc
         Oq9g==
X-Forwarded-Encrypted: i=1; AHgh+Rr1PYee8wMdKtpg7iYkA+9IWFmsS6noP7y9xGUKMNT12liHGd5IzlHUbx34069rxCD/Mk2FNYo4b6/6jdRC@lists.linux.dev
X-Gm-Message-State: AOJu0Yzb8B1Wkd8t0sC2Fqp0tBFmJgViw8TziWeSFYhDWs9ESkYLcf2d
	8lUCLeVHNGUtyn4eRwN39X/gJ1m5hUkaEzKylmq5fDlzICcgc6hga+Kj
X-Gm-Gg: AfdE7cncpQIHXTdslq8QHxsb0EHlOUnJ1QjwSp3uoVb6/6QbYQFNqV8qMmYkLW1PCAH
	god2mjfcZ0rgaMNYCUsvkcTihpocIZCifkg+CwApwXkUSyUszpSABw2YehgyQ9wVseBeoolMDQK
	9L/h/Tryv8GPSJmNDwhWJiREs72PUBvoimMMccdLV9kwCsU/s1EDD8GEpwL5i8Zfbuv2+vnxrPg
	Nrwxqqey+ti0dGfsSvCDkRMSg6lk00m7/ILaYiNAEaF6Y/TYk3XEx3mYKA5hnEiRFDYNQ25VxSm
	mAuVVw7grGDNEMRNAeJ9iioYWJZW0gnO2eUyhCpN3iwhZuxdBL4ZnKmT5SEYYKAZwXnuRhzQcgO
	ky5RaxDvH3qjtHOssKI/hAalfsNcVWsQKXRbn0ZA9qFcEN4wiqpEvPJjRdcHAfuuNRwuCfdpn3k
	XbI94fA4yQsy7F7NfZQIXSsvvFtLZp2Hv0NJiTg2WDJNEH
X-Received: by 2002:a05:6a20:4311:b0:3bf:d0c8:2a8b with SMTP id adf61e73a8af0-3c08ece2de6mr5315885637.20.1783423533864;
        Tue, 07 Jul 2026 04:25:33 -0700 (PDT)
Received: from localhost.localdomain ([76.32.119.210])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b65960d88sm6548721c88.6.2026.07.07.04.25.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 04:25:33 -0700 (PDT)
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
Subject: [PATCH v4 1/4] staging: rtl8723bs: simplify update_attrib_sec_info control flow
Date: Tue,  7 Jul 2026 11:25:00 +0000
Message-ID: <20260707112503.612-2-dennylin0707@gmail.com>
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

Replace goto-based error handling with direct returns and
remove the temporary res variable.

No functional change.

Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_xmit.c | 17 +++++------------
 1 file changed, 5 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index 444966c0de7f..6ab91de472b0 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -507,7 +507,6 @@ static void update_attrib_phy_info(struct adapter *padapter, struct pkt_attrib *
 
 static s32 update_attrib_sec_info(struct adapter *padapter, struct pkt_attrib *pattrib, struct sta_info *psta)
 {
-	signed int res = _SUCCESS;
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 	struct security_priv *psecuritypriv = &padapter->securitypriv;
 	signed int bmcast = is_multicast_ether_addr(pattrib->ra);
@@ -519,10 +518,8 @@ static s32 update_attrib_sec_info(struct adapter *padapter, struct pkt_attrib *p
 	if (psta->ieee8021x_blocked) {
 		pattrib->encrypt = 0;
 
-		if ((pattrib->ether_type != 0x888e) && !check_fwstate(pmlmepriv, WIFI_MP_STATE)) {
-			res = _FAIL;
-			goto exit;
-		}
+		if ((pattrib->ether_type != 0x888e) && !check_fwstate(pmlmepriv, WIFI_MP_STATE))
+			return _FAIL;
 	} else {
 		GET_ENCRY_ALGO(psecuritypriv, psta, pattrib->encrypt, bmcast);
 
@@ -560,10 +557,8 @@ static s32 update_attrib_sec_info(struct adapter *padapter, struct pkt_attrib *p
 		pattrib->iv_len = 8;
 		pattrib->icv_len = 4;
 
-		if (psecuritypriv->busetkipkey == _FAIL) {
-			res = _FAIL;
-			goto exit;
-		}
+		if (psecuritypriv->busetkipkey == _FAIL)
+			return _FAIL;
 
 		if (bmcast)
 			TKIP_IV(pattrib->iv, psta->dot11txpn, pattrib->key_idx);
@@ -601,9 +596,7 @@ static s32 update_attrib_sec_info(struct adapter *padapter, struct pkt_attrib *p
 	else
 		pattrib->bswenc = false;
 
-exit:
-
-	return res;
+	return _SUCCESS;
 }
 
 u8 qos_acm(u8 acm_mask, u8 priority)
-- 
2.43.0

