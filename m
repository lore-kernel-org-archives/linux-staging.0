Received: from mail-dl1-f65.google.com (mail-dl1-f65.google.com [74.125.82.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BA163043C8
	for <linux-staging@lists.linux.dev>; Sun, 14 Jun 2026 18:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781461406; cv=none; b=cVMTsBy87Iq+72UK9CAxT0iYN7arbDOqbRt7/fIjCxl2m2yYI6hXN17MfQ++TmA++KEBJb+lqCFVb25fedZODbiV0vlAonFbVOjeo2d0AiOkxFAxwiEsHlhO8O7uGWNNqXV1hqXtyb9gBFVmeWCBGGQY2kHN+4oZ/o8pD8UP/zE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781461406; c=relaxed/simple;
	bh=LSxmJsRhqENT5wVxzflqb7UNcZeK9p/EwzaMh/cRNP8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=uEmzisgndL6Yfuo85lrN2fnCPp75TwXPuHn7Fqmti4uNJqgtXn3n/W9PtFeQJ7A44ONMNosKGw9YKRwcxB9natSb4eUrXKXKgGHYa6nisUZPlSk33Wgpo9tXM+o5g92F389rZEKgOx/dGTctUWxv6cnnHHqtWkbfay6Fzg2laOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OfAx1z/x; arc=none smtp.client-ip=74.125.82.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OfAx1z/x"
Received: by mail-dl1-f65.google.com with SMTP id a92af1059eb24-137335bc3caso2892793c88.0
        for <linux-staging@lists.linux.dev>; Sun, 14 Jun 2026 11:23:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781461403; x=1782066203; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z07ARaiMz6B0ZS7K3wv0bi+xVX8dJjXDhpIS7KELAP8=;
        b=OfAx1z/xxreUXess7tiInbDtDEjyLoBVCgCiYIBxXPjfoPOXciaxGz81grl/jKEFqs
         f1n5IwVfAfGB58x/O95I0WOC16KBIg8YUcuiBwxvs5SSZwuOdjlqQZmllqKeAt4c3eiZ
         PawwTOs6CyKmvS62QYhfu53vIusd05g2leYftKNC8Y03Z9kwYNNGcGm2fqCZDQJtQsA7
         BhsRGBX6toobnD0H6Oc/Rr2PAX1LgoQ76Z+jsuBVKSw1tMx9diyOkplTYDMIXrM0FLjZ
         UkD1veNGqbIndFtKd+9xVcLkWHssVbb+wlY7cg8U6S+plKejDqrAr/VDXB9CbxKsEdrK
         kbrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781461403; x=1782066203;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=z07ARaiMz6B0ZS7K3wv0bi+xVX8dJjXDhpIS7KELAP8=;
        b=KP7CDCK20H7QxO8v/Ug6GSnv2aUlkZ1agoG3jum0BIaGGh+2n101GK1VI4kLTGYDkT
         AAZL4NQGNu6TvD8vLoUr8OxME+KhtD1C8p46BrM51WvTYa5t/EjuHhoxOvIh3VjI9owB
         FKxXXTOvTaSCH5VtLKmdGsy4l2YGYRQ4UUXhiQUtBHtCs6hVTFjKjxsHTSA60RvpKbiZ
         FyJYk5dT7lg3t0ubMNqkmQMIV8kmy0Q9HW1y+pH8oNwWUeLuWFsVqH7rGISah+WFHZ/V
         D0JebWNP8hgdN1RKoyOml2DPwAieB3RFt8dKaG4UeOhxVHcphReCQmRDpfutC7qFobh3
         g+9Q==
X-Forwarded-Encrypted: i=1; AFNElJ8sGEMctD0cqIDlOBfl+qFV3phJzQpxRWAnF0SwT0XDz1ab7d3oVhYSyqeuYYf8y+Z817rusl9GmX0l6sE6@lists.linux.dev
X-Gm-Message-State: AOJu0YzpjR+IpCcSjM+IMd4/gz77rrVt4q3qiyo+RGqE5TD6yvOU3Vti
	ou7FApiAKdMSvXXWBpe/qGeOcyQLuVQstRKSuPwmphpjRzsKTmIBBr2D
X-Gm-Gg: Acq92OEihB4xS+fCNL+Kcg6Ry5HzN4Aiuik3abo4+kDw+H+uahpBkr2cC4426Wk8Yio
	ng6g5bo83G1rD/Q84jB5/NOdncPrvF/2rl/Aoy2pMdm0GlIcyCeT9pphqtco6kVE+fx0EepcaAC
	d1KWorVi9Pe74QSsm2tzHqmdHhf1D4XpdUiiNAJLAxQ+1Nh8kszQ7a3yg3ONqkWzY4MGP0eHrLY
	CywUOa03UkHbkBX1xZiT61ufKjqy0OXmipCqKCdMxkgtDoc60f5FwMRQjpg6dFYxQgf5cGL4vzT
	ywP9rEfjlxUS1NioFZ09p+98QpcIV2dM3tspYJSDVRGC4VOS3BKqXWZY/AK4/Qtm3/bOYokg16v
	KVDaAbZSXjAnGMm56+DgR4Pny4k7XoOMHM6vwk+Yy5wLPetpDqbzYxEMX6GIljEiCZKkwy0FCx0
	Z1yhdrS858ygA7A/UVdisDuHA9bk3oT7g6U7SuNua1IdWZRojbyXMMr+o=
X-Received: by 2002:a05:7022:692:b0:138:43f1:e48b with SMTP id a92af1059eb24-1384bbb6ba0mr4959401c88.17.1781461402685;
        Sun, 14 Jun 2026 11:23:22 -0700 (PDT)
Received: from localhost.localdomain ([76.32.119.210])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1384b975e55sm8435022c88.13.2026.06.14.11.23.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 11:23:22 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: gregkh@linuxfoundation.org
Cc: error27@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH 1/4] staging: rtl8723bs: simplify update_attrib_sec_info control flow
Date: Sun, 14 Jun 2026 18:23:06 +0000
Message-Id: <20260614182309.96110-2-dennylin0707@gmail.com>
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

