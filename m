Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80C2233A014
	for <linux-staging@lists.linux.dev>; Wed, 22 Jul 2026 13:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784726320; cv=none; b=JLOTK8059CcGuW73XO4TPOAd4lPIGsTjlcOESgYFxh7amfu/3HCcf8JdOWgKXensuw1etS4NvT/b71beYpGK2rj5hLpOgOoTGtbW2cvpfZOBpoH8kGEcVW12bn19u9/M25hfzGgg87BOw9bxyfEgxwZ+nSkyGtdnFZnro3ScLP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784726320; c=relaxed/simple;
	bh=k+5oKtEqL70gEp3h6FzkBpEcLqg1ICPkB8aQSW7L7dc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=nHBw08yegrMtjhm5Qi86yUAEoS8NRaHcAwI7v+Tx1XPfkDbEe4C2a4qd80IJ/JewwnUIczhrJFZy1MXsR0V23LioqhfIA8K+y/Dm4FCy6zmPTPlQQ5E+t5IKHby7b2DB/AhHjJWay/4y+cMsQRR2NH4xelzOHUBbdVeCnwvEfvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e55SyFNj; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e55SyFNj"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-698a9f11776so14942364a12.1
        for <linux-staging@lists.linux.dev>; Wed, 22 Jul 2026 06:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784726312; x=1785331112; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AVcL8bHptDGyb4PRSOTsJyHP66RQMYrlTEWkldK31zI=;
        b=e55SyFNjHh6dKOL1Vtn+DXq9gfgfNR4vSPgMguoVIyBB1Ag5UB6/yKLYWEuhzQhdjg
         aejULLMRTiClBUIAdWISxAXnasam65rd5+NlqGN29w0uAM/5fw+dvsQyHlgLhE9AZnEU
         26bYInBYd0N1honGbsRdr1dcTMx92Bu66PVL/ItCUuXGOncUIOrM+kzQ6P2ZamegnTBn
         K8+O4jmo9qTnmEHhK7nIfLvBssVobQCq5R78HXITHXZZNMbGSw9zd+4Vh4tvHiLp+H6t
         ydbKi++Y3d/vObQGWcBRzhqc7DpQ4/VjAT18GIxskSEJA/YF0xLgmpD5qYBz31f0V2Ba
         DfXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784726312; x=1785331112;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AVcL8bHptDGyb4PRSOTsJyHP66RQMYrlTEWkldK31zI=;
        b=Nmk/eogAKApXa2W1d0ykwQ7xfqvcXj0SEfpykKRGtB2nbvN4CRLZa7SoL9heYliE2t
         kQ5lY112MD8/qKpg4YnGsW7p7r/e6BIBERc84M3B1Lzwn57jLV08gOwSy6y7VmXoeWiQ
         xP8gzMXYiNGLH4negmyl+YbnfhLy6XmuRBwzt44iRHADTyODeO163zLfik/fCqxgEnSL
         jh0ImX1EKyGe5/SDk5w5KUtG7LfHg9olpRak5SrdEb1j9pz8nYsNc71Db0qZ5WwEZtDm
         ZB1b47Zxo21zvdog16fkTGJRhbmdJeMCn+H1UtUpfzQaC9rs0E/0wRrAfTz2Uy1nKlo9
         7hKA==
X-Forwarded-Encrypted: i=1; AHgh+RocbbqGrO+mJ3vJDrEtO11uEsA85wDJjgf21Eed4P9uRDrdntAezzC2oeZwsSMsC3Be2VRnkMqLFRBDrlK7@lists.linux.dev
X-Gm-Message-State: AOJu0YwF3BfQKTUlQytpoSfw4XEm7WEojRmaeeX9+x00E8cXNxSQnGUE
	mJnvy9MW3Hly6RTbB1+aJF/L+MWS3tpr8tMY/DH55Kq8c7a6nau08d4c
X-Gm-Gg: AR+sD13tp+O9DtwC8sew6U/FqQnnj5tXlfBRKLAxP44+N1TpTZfTucpHoLH241TdrJh
	bTN3lW/5uzbvaBjKGFF+1aBbSDlw2t3nT/ELpp+ZPdWUmClgDUa/H3yRcyCrKYNHIs/PeTNE0Xu
	8fqQyEfb5jKQ4v+WQXQytvIilqRjlifBlqgDkwbDNqz3qbSTrJoWEcedJMCP3ikgqzAbJVTcjc+
	v07NeLgq7t98lpNBpO2d/ohHd+AsJWaXbzZzw9L99VbGONJ8V+XvK9cK7iqSIbKgZ8t92wfAHDR
	XiG+w8Xw28hENWsPXYb1PSEXQ7W8Wy2nDgQfS21mIF2nkgptbWYNnpDfWah/wy2AzGCFbyksDMt
	1FcS8g+sxKtQwdr1hcEaqPiq0RIY/HtOVjMIWiwGjUDQnz0xPzKfNspL74Z1G0r0JOfWrjALMME
	wMCuMTK97oYd/NwgWubidPgZOdazTVZc6LhdA3DBZ41EPOIB1vA8AJn1SU3wf3HpdR
X-Received: by 2002:a17:907:26c7:b0:c16:9ca5:e551 with SMTP id a640c23a62f3a-c16b46ec872mr1031163566b.14.1784726311924;
        Wed, 22 Jul 2026 06:18:31 -0700 (PDT)
Received: from DESKTOP-LO2SIVE.localdomain (83.4.116.191.ipv4.supernova.orange.pl. [83.4.116.191])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c32a76fcdsm104303666b.4.2026.07.22.06.18.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 06:18:31 -0700 (PDT)
From: =?UTF-8?q?Patryk=20Gawro=C5=84ski?= <gawronski1.6@gmail.com>
To: gregkh@linuxfoundation.org
Cc: =?UTF-8?q?Patryk=20Gawro=C5=84ski?= <gawronski1.6@gmail.com>,
	Nikolay Kulikov <nikolayof23@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	Michael Straube <straube.linux@gmail.com>,
	William Hansen-Baird <william.hansen.baird@gmail.com>,
	Gianmaria Biselli <gianmariabiselli@gmail.com>,
	Eugene Mavick <mavick4022@gmail.com>,
	Artur Stupa <arthur.stupa@gmail.com>,
	Yan Pan <maxwell2119@163.com>,
	Diksha Kumari <dikshakdevgan@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: rtl8723bs: Use pointer type in vzalloc()
Date: Wed, 22 Jul 2026 15:18:25 +0200
Message-ID: <20260722131827.46975-1-gawronski1.6@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Update the memory allocation in _rtw_init_sta_priv() to use
sizeof(*pstapriv->pallocated_stainfo_buf) instead of explicitly
passing sizeof(struct sta_info).

This resolves the following checkpatch warning:
"Prefer vzalloc(sizeof(*pstapriv->pallocated_stainfo_buf)...) over
vzalloc(sizeof(struct sta_info)...)"

Using the pointer type is preferred in the kernel as it ensures the
allocated size remains correct even if the pointer's underlying type
changes in the future. The allocation was also split across multiple
lines to comply with column length limits.

Signed-off-by: Patryk Gawroński <gawronski1.6@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_sta_mgt.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c b/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c
index aea660f27959..0758d0540f4b 100644
--- a/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c
+++ b/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c
@@ -54,7 +54,8 @@ u32 _rtw_init_sta_priv(struct	sta_priv *pstapriv)
 	struct sta_info *psta;
 	s32 i;
 
-	pstapriv->pallocated_stainfo_buf = vzalloc(sizeof(struct sta_info) * NUM_STA + 4);
+	pstapriv->pallocated_stainfo_buf =
+		vzalloc(sizeof(*pstapriv->pallocated_stainfo_buf) * NUM_STA + 4);
 
 	if (!pstapriv->pallocated_stainfo_buf)
 		return _FAIL;
-- 
2.55.0

