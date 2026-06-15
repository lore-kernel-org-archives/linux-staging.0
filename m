Received: from mail-dy1-f195.google.com (mail-dy1-f195.google.com [74.125.82.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCCEF346E66
	for <linux-staging@lists.linux.dev>; Mon, 15 Jun 2026 23:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781567041; cv=none; b=eHuXEZxt6Oyy9X21Unu5s37vrwueE799ud3fTXiDw1mod607GbxCPwsF/ha5zmoJjtaHqOsiLFqCYkRAC99ndQ0tWVs/NHFn/5nuUKTTNk0Baej4E36mLDzxTrav9FjjN9NEn8sfvesKKIkwhmeDbFG0mHaDyknqNtM3jUVP3uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781567041; c=relaxed/simple;
	bh=LSxmJsRhqENT5wVxzflqb7UNcZeK9p/EwzaMh/cRNP8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kvL0Tc36yXHHzYZGWPrPPxHb4GdXjCbdni2k+4McChfHUYcUkzd1/lggArOyMj/JYU2q96z141YrB7TOZkxMA76mcPARg7VcH2VQDmDwxwiT63n5MLxkUL6JlpffoREVmIK5qdbSByw3YiU65/ZH1vGZwiqwptRSFGN91SbC0fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qVuEEuAz; arc=none smtp.client-ip=74.125.82.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qVuEEuAz"
Received: by mail-dy1-f195.google.com with SMTP id 5a478bee46e88-304fb780deaso4097036eec.1
        for <linux-staging@lists.linux.dev>; Mon, 15 Jun 2026 16:44:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781567040; x=1782171840; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z07ARaiMz6B0ZS7K3wv0bi+xVX8dJjXDhpIS7KELAP8=;
        b=qVuEEuAz8Sx1tbYk0t6aEyjPWeIbv/Rh+eG2B7RV3kLT9lZSzhWsunBEIM6NNf8E6m
         o9J/vSx13scagcyIy+8ME9GYoSHJjiTUGGDJChjJCXAGVe0QbHL+spSpEnTSq3VO6Y6t
         eoMmS2NKpFlGNPeJRFDn0IjnolkjL86PA4fyjybWtCCbj3NCdXhE2wJM5P88EeWjB06a
         fxWZaYZg+lG1kgMQIVUNQFXXLpD+Qd+mkTGdNeujnVV3s6z1T7OPs9HSoO+2856ub2kk
         bf4+u41dpSPGXGurUnTyv9hFSvlM5ywqHGHfD5ZzKYzP3bIiqI7Qc7UvIfEsfjHho0tF
         G+bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781567040; x=1782171840;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=z07ARaiMz6B0ZS7K3wv0bi+xVX8dJjXDhpIS7KELAP8=;
        b=CA4F+AbFTxY2hG0r0MhkaMYRyZ4YRrfcpVUhPK9YIae1egfXyJTxIQ+kV0YvxoEO/5
         CpnRN8AUTxZ8g+j8tLIjJDun1hgtPLnoAh1SbmbCJqtEtQOIqbYSqhJorq3PM/6nicgs
         064V5fh6bqbBer+JJ/BKpyoC0O2dIG3dL5B++R1dnTaBMtvggp/JdWy39dhxdqVZ8WxD
         vv0Q3aPQfkhuOydPfWi5QleXqQceSdwRUWdAdpqevC+H34ayUqQ4D1ABLMWh6gKXPE6V
         Yt85De7UmDqSnw/BeaXDkKsQQNwC2eZRTZiMrYdyPj9r7EDV2JGiQPGokFaSjr4u/zp5
         qIbw==
X-Forwarded-Encrypted: i=1; AFNElJ/Es6aTAZHE9fN/48UFPLDAD5S0G+awP5y7YMwlNSrJbwvnrcdN9znOjplqGbHkyT8fagU4WfI65qeaSp3O@lists.linux.dev
X-Gm-Message-State: AOJu0YyqiEQ9sxUwheIsLtCAzR1+i4x4uCez9C5CGprHvrEtt2U5NjTq
	5J4OCswHzFGVfys51SMoANHogUJoUek0cNQ7qj9T/PDYfecUp+nnb4MU
X-Gm-Gg: Acq92OH1toAVJaXyrOqvrt2Hb970p6Fk79L+bFAa/wG6NRvjdBTLkRKDJfmhJpbG3Vo
	rHn2fJaKtRk6wC+XxBNBDb0A8lziJjQczyfab5tXjeNyRi6bt3Cqv6FHhSO3P12OVJBtLGSzz7y
	mOiFUsZ1bnEDAVwgiyN8fxi/qPx4JDkFyue5x2AFUxCmUYjmo/yxeNe4dWGILHuV9d9x4UejoLO
	ENVxEG3Lj9FWLeEwQ99wa32vZMxDS4BYM/13rg5dcjY2ug7MlnLsuX4HTPZ672fNHZQ3fZrie/Z
	JI8pJfmmdqgH8EMZsJrn0n+J5v66vC5zcmhAIC8nOQPOVYRKbybOjgGOpQ2D8cb/p40AcE3GSsY
	rp0he9a0HJ0uVlJO9iaQYHi3bQd9VeKwNWb4djBqxvpFLxefnFHtsrZb9WL+9//pLOUCeuivg6o
	OdGs2C4ZwkGsOqVv04xID1QOConLg0HzpwmOlKdduxEC6UYWAwyHsl1ys=
X-Received: by 2002:a05:7300:b58b:b0:304:bce8:fa30 with SMTP id 5a478bee46e88-3081ff4bb5emr8321242eec.5.1781567040007;
        Mon, 15 Jun 2026 16:44:00 -0700 (PDT)
Received: from localhost.localdomain ([76.32.119.210])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e92096esm16988335eec.15.2026.06.15.16.43.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 16:43:59 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: gregkh@linuxfoundation.org
Cc: error27@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH v2 1/4] staging: rtl8723bs: simplify update_attrib_sec_info control flow
Date: Mon, 15 Jun 2026 23:43:37 +0000
Message-Id: <20260615234340.97299-2-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260615234340.97299-1-dennylin0707@gmail.com>
References: <20260615234340.97299-1-dennylin0707@gmail.com>
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
2.34.1

