Received: from mail-dy1-f193.google.com (mail-dy1-f193.google.com [74.125.82.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 179034014AD
	for <linux-staging@lists.linux.dev>; Tue, 16 Jun 2026 23:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781653981; cv=none; b=oq3jPQVJkeXADdePgo1UP21Y2FJZRol5JIe206HJvBaMT8iSxVX8A8Vzc9m3oBl+SA9QYuK1vKfxMyMaMctDUzk2VkzUPqJ6EoEikI02VqtkzHStRcGoCKRrIcYQ93EYLugdRO/MEW79RIZ9sIFbuPHKhl67p8kDbxfr1INwhlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781653981; c=relaxed/simple;
	bh=LSxmJsRhqENT5wVxzflqb7UNcZeK9p/EwzaMh/cRNP8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dutZbAWNDU9b2QUh5hjVyOd7c1X6fMLDjZ+ssWFXSMd/tT6IgjM11OXva7FeoOkGtNJZPvnM0i708i153u5L5tf0KjhFKMifsolRChLwKJNgxO7XbKNXpicLe4bL0wTz3A6kwC6XeQroa7lGYKlM0Q1aYSzs2CLl4gYw7aZ5VEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cCtRIHVu; arc=none smtp.client-ip=74.125.82.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cCtRIHVu"
Received: by mail-dy1-f193.google.com with SMTP id 5a478bee46e88-30bcf74e617so432377eec.1
        for <linux-staging@lists.linux.dev>; Tue, 16 Jun 2026 16:52:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781653979; x=1782258779; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z07ARaiMz6B0ZS7K3wv0bi+xVX8dJjXDhpIS7KELAP8=;
        b=cCtRIHVubwYHN2qRM574pT+yBYUhk6m7NREF7FG8CwzKhCqCpwEntykzUYoK0POQ1Z
         pu8ejXziwbaVxWqPM/8GGGGYxZjE4rxn9Q2reF3Z8x5yyI6f5hQsJGOjSieZGWxw6nbc
         GYSU9CSX56tCxT5HcfNMcDDIjJkNTu1BDoNGtPLLz96HlEaKz2Vnc/rqDhVUmyPBb1qi
         W0VmYmMK8nXnZqux9sMyMGJbDDcdcR5aXJ+cmyQZYCB9HAQqndgxBaMco35oTDAVnZAn
         XRdSB2fLWy/9wrMub6TJHNSGoHxZOXENU0JcfrzwgmWVIbU+6T4oSc/0wHpAiNcMh8Dn
         cHeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781653979; x=1782258779;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=z07ARaiMz6B0ZS7K3wv0bi+xVX8dJjXDhpIS7KELAP8=;
        b=SQqn32fZ2dEcS9rMiXjSeGY6LsVPAvGCoB/JXksf4K79dNaJh48CxgOuwRISsx8ciG
         NLbXEUPDSzW3zy32+p5mx1eSEKxtucASM7eG7iohe1v5TUtEwnLt+Kt+BqTPSzn2c1wl
         IJjMUfuPQllg29aa31XgNPznVulcFYTyvhRcIoxvYZEPUFiuhaxuM6xKnAZvAj1b4Lnh
         EMpuTj4TUtMqqY6/YQDOs0zEMpA2FoH0ea7z+WKwm3hLWlTfOby04rm0y1P/Yu9eXEwp
         Nx3GIIfgJjrZn5hWIshB3HbmTpEr7v4nRi0wMLLSgzkfn5209cW7LYnKQuf8s0CirA4x
         /96w==
X-Forwarded-Encrypted: i=1; AFNElJ9mTQvpYCgu+G92sH0kcVB6UNUph2mtGAg6eHMAW1GJtO7ty7C3ZyuPSfrK4ZNbDBzKKOau8oxPqdQnHN/6@lists.linux.dev
X-Gm-Message-State: AOJu0Yy06BsHGdHC95yaessbqF+9e7A+x++audHqhnAACk8YQJ7kQRO9
	ls4N26vQ7D8OZ9Tirri8yurCesHXODdFrmE+n+MA/JoG3MgpqNuTUdVn
X-Gm-Gg: AfdE7ckNZ1pnAtC1G46SMT9He+WAOSIlP6PpK62kQNSqQ39asl0PiuFV8LSpsM3uFYH
	rQtja7PqiFCGvO9eUI1RcCV0gLxCW4oH8Y7+RYeqsUPkBA1MlLD7PZDvznHjx2PQxeHRsiNUV6T
	l8uDZjnfoiiN4ArMGIawnB9AsZZ5WuhQazSXYz4n9QzZ54hnAEd5b1zGpSuOGnr/IuAZRXqJqsz
	yJ6xDTo+hmHmJYW1HNWGi20A1qpQyAWeXpM/TeLfQeTURaZ8waFGSviCK8a5sWbVxAniKttLClV
	fqq3+fhj9AG4afo+vqtd7bTcEgcUWlZWasVBLJrepwsdfhV8snN2q8RpGIUherim5Yp8vpMZ7lA
	wlxdufmzrf7JehcI9zLceQ482CBW+Lziij2l7DooXYXG5l+h+FcbEoM7QZKsZHs6f184vFaFt4H
	yJcImWN/lgkUhKBO995s+qZ6i8GU0AJOwzbRzjSi4bKgwFszfTXknRQeA=
X-Received: by 2002:a05:7300:ec17:b0:304:e20e:f5c9 with SMTP id 5a478bee46e88-30bca224971mr933065eec.31.1781653979176;
        Tue, 16 Jun 2026 16:52:59 -0700 (PDT)
Received: from localhost.localdomain ([76.32.119.210])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d3f20sm20208153eec.9.2026.06.16.16.52.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 16:52:58 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: gregkh@linuxfoundation.org
Cc: error27@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH v3 1/4] staging: rtl8723bs: simplify update_attrib_sec_info control flow
Date: Tue, 16 Jun 2026 23:52:38 +0000
Message-Id: <20260616235241.99076-2-dennylin0707@gmail.com>
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

