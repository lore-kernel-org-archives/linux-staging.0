Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3D05399011
	for <linux-staging@lists.linux.dev>; Mon, 27 Apr 2026 08:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777277989; cv=none; b=USLpAq5aSB4XBx9cMIVKqtOrrV/kRQb+y+tk0CTBr4OmziGXY2nr+wziquF5ZDFzcyWzJV5LRl4EZOuHtFrW39JixB/ESTnU98Fa9MZ8Bkjh6M60ySTcSW34C54cISAiIh0xIFQWrCgkZ/Hz4bcosg5MoB73doTBi9fqmCI4cpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777277989; c=relaxed/simple;
	bh=GTrf3Sp/Bor9RDVfbFBCNK2/Ily1loPwsIGEXx/nFxM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gO+qrtKbnrQ+NE29Q4c/xDoV2Xj4mtrX7VbZ/yHfDLOEuGHv5sJqolEHGYbePqud1GzEAC/T7bDZNFJ58KCnCeQa/PfjlajWKXWIlj+QScmAOQvpKcnF8397i1ZpfBe9k4RVmRsPb025cadjhBWmNYnphLcENsNwDwyYKxzQWdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OUMcpAr6; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OUMcpAr6"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4891c0620bcso66909405e9.1
        for <linux-staging@lists.linux.dev>; Mon, 27 Apr 2026 01:19:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777277986; x=1777882786; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=muh4d06e6MKOx3RLMPSkijOmHQZUXxEoajlYypFsrtk=;
        b=OUMcpAr6vXbtKxT3KpPoN0fLBpJtXJa5ojkhW3FXQbvchU0yldANDl56tuYNLB/BJo
         0k2Tx3fMHgKzAPVUxzuxGbTrlEMLEj4dRY335Ce2edpj3O8moGlEoG4uYMWruHV4EYVn
         NBteluMtcm1QmFHG3nZYAiGjwOeJt5qjVYvlNG7nGF8zFLaRoytpT6dDh3POyaJee8wl
         M5DDbSDXCRbVlVWHOBSLgxDaXg9XejtboiWJDuIm9jWQN3UL9qd61lMz5+r1+o6lR4vG
         t+kfkFHlGewoW09e2SgUQ9OFK5t4uc/bp8fAq8o4c2uPMyiVsimoyNgMlZjfoq/TbnAR
         n21w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777277986; x=1777882786;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=muh4d06e6MKOx3RLMPSkijOmHQZUXxEoajlYypFsrtk=;
        b=RBd2bQrIa0UY24OloEzp/b14RtlBHMmb8ol263NitEDtIbhiys6lQv/1g29ptpVmlI
         Xvzgkyh0ymTD09AnWaRMeliwJbgTKqOvIyNpbGaQyLjvjLjdizVX5ovK97H0YMGjNErk
         h0iKZK413j+rElzRCKZn25W7tR8QAUFZ17KGkHLjm5LEwy4thy/oB3iVxMvcdOLnHAN7
         sKV7LYW2De2IPv+C0vw0bIwc41Afo5kyKUgC/fgQ21lP0wP8rZIWW+pLDb5cAFzk346O
         E8hrUgStkfWVNYWFztnguIYLVqgrtwWeYgyG++EMLgUMyMKkoGESmfBORtDAJXSwafB7
         J9tg==
X-Forwarded-Encrypted: i=1; AFNElJ/h9Pfz9pHoMv6Lzs0dzP7egHfi5N9LqIZh6Vd2qQscKnpt5Ws9LdyerlVMceaRUO90r0XcDiBYN8Krmrel@lists.linux.dev
X-Gm-Message-State: AOJu0YyFGpUZgubdL6YUHBGW0DmlpzmRmLE1UgR0K+hmE4TZZ00LSELO
	Ra/p2Ylzb/hzNUHcEsZPB7DkT4Bn0cGvZa6flxPNhGZ3ZNxD+fdeydsD
X-Gm-Gg: AeBDiev4wv388ERCPOMxuJY5dmX//RQyAmLWDgcYHTASJeNdDY3rRfxilPXLJ04F+WN
	fEnlACzoPKXmHhC2vBSjn/tCOGSeTxapYNmLxif6rIXyrKHYf/KIZ16JXNRT7Onz3OeWqh5M/m4
	lM+Pr83UKJyF622GPdjMUwEC7WBzqPkkdNhZoSGRFCiI2Hgjq4TVh3Qp60fsXzzeZiXEDeKLChE
	aTuROjKbiiMQzsp5ZuNLfY+GWquo6DNZbOQn6VT9nKmlrbkpCsQRjfMk7ksZ51rIWDtOxDYlZO6
	6KQLO8c99ck4+V0Vf4c4FNS2i/3F/iYUaqHQkLPTAClzOvEo/Q01p3JVP57n2wv0veRb7+HJXT/
	HVojBNE4HBKVg7EBn54iIJ6iwc2pjnoNaT98p9Drk02hD3iEAJLYS0H1Snc2vL+9Yj6Ss+NFNQy
	On5ZCN7EawaC/csbnArob8SYgoTUwTwLSHVDL67u2w3+NiesoToiAmObkIB+mjLJgUHN/Ens8od
	2zfwTBR5eYP2Qoa6dogIjXeCqrLH4afEeI1uKkA3iFbt2eb/s7zTuSVH8bb20IGoJeQQKE=
X-Received: by 2002:a05:600c:a088:b0:48a:75b9:5e07 with SMTP id 5b1f17b1804b1-48a75b95e3dmr616135e9.11.1777277985956;
        Mon, 27 Apr 2026 01:19:45 -0700 (PDT)
Received: from ahossu.localdomain ([82.78.232.184])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4e3a18csm90455670f8f.20.2026.04.27.01.19.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 01:19:45 -0700 (PDT)
From: Alexandru Hossu <hossu.alexandru@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: error27@gmail.com,
	luka.gejak@linux.dev,
	Alexandru Hossu <hossu.alexandru@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2 1/2] staging: rtl8723bs: fix OOB write in HT_caps_handler()
Date: Mon, 27 Apr 2026 10:17:47 +0200
Message-ID: <20260427081748.3407939-2-hossu.alexandru@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260427081748.3407939-1-hossu.alexandru@gmail.com>
References: <20260427081748.3407939-1-hossu.alexandru@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

HT_caps_handler() iterates pIE->length bytes and writes into
HT_caps.u.HT_cap[], which is a fixed 26-byte array (sizeof struct
HT_caps_element). Because pIE->length is a raw u8 from an over-the-air
802.11 AssocResponse frame and is never validated, a malicious AP can set
it up to 255, causing up to 229 bytes of out-of-bounds writes into
adjacent fields of struct mlme_ext_info.

Truncate the iteration count to the size of HT_caps.u.HT_cap using
min_t() so that data from a longer-than-expected IE is silently ignored
rather than written out of bounds, preserving interoperability with APs
that pad the element.

Fixes: 554c0a3abf21 ("staging: Add rtl8723bs sdio wifi driver")
Cc: stable@vger.kernel.org
Signed-off-by: Alexandru Hossu <hossu.alexandru@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_wlan_util.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
index e0d73c267786..3247565f41bd 100644
--- a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
+++ b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
@@ -936,7 +936,8 @@ void HT_caps_handler(struct adapter *padapter, struct ndis_80211_var_ie *pIE)
 
 	pmlmeinfo->HT_caps_enable = 1;
 
-	for (i = 0; i < (pIE->length); i++) {
+	for (i = 0; i < min_t(unsigned int, pIE->length,
+			       sizeof(pmlmeinfo->HT_caps.u.HT_cap)); i++) {
 		if (i != 2) {
 			/* Commented by Albert 2010/07/12 */
 			/* Got the endian issue here. */
-- 
2.53.0

