Received: from mail-dl1-f66.google.com (mail-dl1-f66.google.com [74.125.82.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FFCE3A4513
	for <linux-staging@lists.linux.dev>; Sun, 14 Jun 2026 18:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781461406; cv=none; b=ag2/hUcQi+SJyz/5sji4ZY1r0EZwA88aTVF28+NowF0DWbN4aoDQmUgxld1h9wj30LKGruphSF6QiEJQnXj5GRa5ZOftj6MjvWh6uqh41g8mqSXs7i9VZUAEI0AHdj6BRREMAm/DIeWCzivU4AeYq7Gl6ZMfSEJnNDk6lvlKcGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781461406; c=relaxed/simple;
	bh=cQn4PXZvm0puKI16yFkqmjN3UyGMyADSB2yG8uSRgXU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=sgpQ3cMvHZle69vY0kljQoc444JHI52oBZPErFoNIxg4/7fugnLMYUcyYseEtoh3tuTBxqLqkWYVMmvM8PHx5dceJNZd1ePlsXAjWqw2r2S9wnujEutmcMiBKkldV1XmaJaaojCykVJRnihuHeKoSAbRLDxJVdaJt2JfRvP/pZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HOjaLOcN; arc=none smtp.client-ip=74.125.82.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HOjaLOcN"
Received: by mail-dl1-f66.google.com with SMTP id a92af1059eb24-137dd3af345so2394725c88.0
        for <linux-staging@lists.linux.dev>; Sun, 14 Jun 2026 11:23:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781461405; x=1782066205; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ynbuYtZbl2tj5aCq3jJaHb3txV79wERnqMqRqWhD+bo=;
        b=HOjaLOcNCaZmwj8AoT7iFOJ9TD/iqiZfLKpuQcdn5QmjuCBTcj5elpqYF1Ucz1tehK
         DVxt8zJt9EFgKBPLWaQyYetO+BCwf2+aj+C8RWtAJn+pkCczJFuzlIPNnVkVR9fY1t3d
         P292sVbLdIJWcTNEuNvRefRALpf94GrP4/99Vnu/tGlBmls7zGyIWt5XGPFz/lCuNgJF
         JqmnzasSj0WBIImDYVUv/R1dopqw6oGVcKPYJMRTYI9bFKQWl+e03JOAVhTSLU2z+fxU
         WDe3+vd+aLI8Cr/On2X96nFNX+4Yn4hWiZ14OkTeL5GGFTgewayyMoPDhtUCxgAFUFPI
         9KoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781461405; x=1782066205;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ynbuYtZbl2tj5aCq3jJaHb3txV79wERnqMqRqWhD+bo=;
        b=R0OJZnyH5pgQ2ynozy/gGi6Lun6vyu5hTCUAWwPaEe2RaXfXukkiCibrxBhFpjaKi2
         31adFffHtfrAVFP5Go1TcxyAoi0LU4983aNkPPUmfiUzxPgNDrInS7MeQWFdhid6NSII
         rRukXN5nX8KYGgVVHso8yPy0fLcLPcQgn79usGx95QVSKdyYEmmU793JjUYXoj1ZbmUF
         Idzi5jFhF5s5/Rg5jz7NJ/9xYj88qNnLXtFcFIoL8KS6QpXMdON0JXzjdff59KEitYkJ
         ZyMROW9k9dsImieTHdssC/y2oGuqUciTdBQk5ucoFtFF+0LohAQAfbU6EfuRtbJcgsb/
         iKmw==
X-Forwarded-Encrypted: i=1; AFNElJ/q4sSOV1VnTTq5Ooxq1CEJRDk3jacRMWXq+LLkERNnEUkD8FP1vnTUsCgJTN2pixl1w09l/HfELDOIjdHv@lists.linux.dev
X-Gm-Message-State: AOJu0YyXnX0q7zWPJD6FapuPpcCMt145TeYkVWrGxRtJHHJSFpOgKXLn
	op+1PbD31VnF4gIGpA6qVKaKkleMd1fXVivFMQk+yrg4BabzuAp//mK8zgwgAGosb04=
X-Gm-Gg: Acq92OGrywiubBUqo2okvyGG/5HJKiiFRvhG2nP+QoXTvpPgMG9XgIWcrnHRERTasgE
	EAHV9LjLgmjnkIlRZamV+5zPvtsAdNOK+b9tRxbnmX4SGiT4HvlHenBhAhGgBOvI0+6W9Z8K2vr
	WIeD0P0Sw7BoFXOFOCTbFzVvpbouAFlvjLAmGmdYi3E47/yijCPlyDSZZcu1JHEhHsmIHsmJWl1
	qLz3aXgPlSwk9D6WI/WKnC4MJgOS0oUgpG/5ZaAssRPz/t7E1TZ+YaIacZfcEDVI1PFZAiEzRvb
	b9Rj1Bk+ySK5OhpbEmn1F9gnA1jnbhR7k/M8gCsTije5AwvYEf0cokvyTamS0DSb21e3KM3bgKx
	IMPYtjBF3hKaCEzVqR2Jzy/Qugh6sGaqh6EzBY/U4ORIlGa5oGrBv48wdG9KsmcoOSMs/0rrQ9M
	VlcvvgmML0esqXPHDrwHyNLZxuYUlYUWmejt0VokRwq+sgH877VQAK3FQ=
X-Received: by 2002:a05:7022:4593:b0:136:da48:5edd with SMTP id a92af1059eb24-1386f24085dmr3757907c88.4.1781461404512;
        Sun, 14 Jun 2026 11:23:24 -0700 (PDT)
Received: from localhost.localdomain ([76.32.119.210])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1384b975e55sm8435022c88.13.2026.06.14.11.23.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 11:23:24 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: gregkh@linuxfoundation.org
Cc: error27@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH 3/4] staging: rtl8723bs: convert update_attrib_sec_info to return errno
Date: Sun, 14 Jun 2026 18:23:08 +0000
Message-Id: <20260614182309.96110-4-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260614182309.96110-1-dennylin0707@gmail.com>
References: <20260614182309.96110-1-dennylin0707@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert update_attrib_sec_info() to return 0 on success and
a negative errno on failure. Update update_attrib() to
propagate the returned error code.

No functional change intended.

Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_xmit.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index 7d10caf8cbfe..b6d9332958f5 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
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
@@ -754,9 +754,10 @@ static s32 update_attrib(struct adapter *padapter, struct sk_buff *pkt, struct p
 		return _FAIL;
 
 	spin_lock_bh(&psta->lock);
-	if (update_attrib_sec_info(padapter, pattrib, psta) == _FAIL) {
+	ret = update_attrib_sec_info(padapter, pattrib, psta);
+	if (ret) {
 		spin_unlock_bh(&psta->lock);
-		return _FAIL;
+		return ret;
 	}
 
 	update_attrib_phy_info(padapter, pattrib, psta);
-- 
2.34.1

