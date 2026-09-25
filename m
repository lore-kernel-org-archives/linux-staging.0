Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F24414A2061
	for <linux-staging@lists.linux.dev>; Fri, 25 Sep 2026 16:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790353807; cv=none; b=brZUoS4PCd9FXgy0Gp77/n9JnXtHblaDF9GBSxQqBRTB+KoFDSJYgovyMup0SikStTyrRCUkXJON5ToPNOqDuqO8XnKMXnfNUssx2iZdZlajlarQW/eSox6xvk664LHxi55EuhZHn/GPNerS04N1asCuCWXnZo0t9+SfUe4pxf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790353807; c=relaxed/simple;
	bh=4UpX6srx3oLFAGEMM8e8NdsoDG1s4k5Bpof+TJYVNYE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=T+JFMRPuyGFPFmA+6Xdjq8rnCY9pyCfnd2U7LbprQrt/oINZawiKiLkrwLMRZQ/AE+AW/mdUQM6bNstkSGFRALHvnnmMJWvA+5RLSKHUdzgLncl9N/1MTRol5Lh2GJPCVeVz0kVxq7wUJBOpuQp+7N6dIi50VL7GYKZ4Bkva1jI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nXktFQBr; arc=none smtp.client-ip=209.85.167.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nXktFQBr"
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-4b28d9537bcso653020b6e.0
        for <linux-staging@lists.linux.dev>; Fri, 25 Sep 2026 09:30:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790353805; x=1790958605; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=unPCMDEhiQkXWt8fmU0VRBGU/w1jOtQEuAK0OF4Mp98=;
        b=nXktFQBr6ysuz+eOoPmmWQ1ILz0Gw5UgK55tN5YBuE3Nijz5TMLEFpAgKpdBzvwt3h
         xqD5qjQDEKoS48C9WBLrbLK1TirCfnRfp2KtM/j9E+93r+fE1RKz072U+aboQPKcqAtq
         GG+7IPJ6SmIV7DeIE30RXZUbyS66TO/MuYM8SsXqXfaz9TYw8/OWTTwhP3JuHoheC0DE
         hymCajFi6wKhVwxRqHqTME1tKYm6Qqe7XQDnvsrkOp5cDquuaBUjYvSKRLsE3EL2a3Hd
         17Gaga+p4wEkWpZ971q/OgUh9zCmoIiVdyT8PNaHutDvPSV7LioFaL/E7rXW3wX/+5EB
         3j5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790353805; x=1790958605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=unPCMDEhiQkXWt8fmU0VRBGU/w1jOtQEuAK0OF4Mp98=;
        b=i5UndZpk6Xk7u1qPNo19hEyzX2C9cSyNufLOvcGJO/zXgvPfPEgzvhkPJcUhg3Lml0
         xc56VCa4aMARRJ9XZ1iP6LdMwoVk8j0YFZ34xk/MxJEI5Wcp86vNcRlX2+Tx1O3hyJTN
         Q2j5193flMVXdOHAHVP8rmCFt4KvHMpE+q4ZsGEFDsdfQ+ke273yn7hbwT8QqBcj8czR
         bBM4oOWj2P/uktFtS5WC3/NEttIMNXnIGq6FVmVn+D7anr6xVYpnIAeujOc/v71S1ykz
         mPB6he0BdLF4ey2o6zXkizzRNHQ9rQQpPX9HOe98BllDCksQy5YesUv5Y7CPoVrio1xj
         IPug==
X-Forwarded-Encrypted: i=1; AKwUvByPucY6mtk+AQIIltuiZfKWvKRLlhC8ATVlkz6vyWfMd0UYVVzMET3uunemmHm6aMfWfQYAqvWxZIbErXt6@lists.linux.dev
X-Gm-Message-State: AFuF++lb8g6HUupCWRPJtU094k1zdacyOJLWIFmftgi8vkbTBw8etsxH
	3kk9giRfVmHl3DFvuUoRFB5TeYWYLeCeUisD+YDilSdacjd8bLQMzO+v
X-Gm-Gg: AYBFou38rvVpJso3mmpAZv2G298Yj4+bKVg+m/vBzBpmwxBWMaqp/TvuXwEIY2J/W9s
	iQRt4bEP5Rde28l8OMOnwJM0eBpRdGG43Ktw2GlBeb3XsBgAhCbWdisPAzUIzQhYfNF8yakDA5Q
	DOFTJYXOXcUtMiepPFTdz5xQFLNKRK7kvdORc2deyi/R2DUl2NFaFADUz1tx6lxnFgFWybk33ZO
	njOlEZiSwW53YPM1pBJnl3AL2iGmmAvpEGot/AesF5/Fi31eqrHOBVfpzofAJOHMSkaRjofkO6/
	gN76/bs8Wt8ImeASXQmbLn6BwDZlOmHhDm6sMAyEA9u/dVJu6C190LSWF8pOiXRqeTo9Ar0nq9m
	aoNHVi4qExr5Wq1Cfq52oNn4hoqh710xgfFZUi18Gan1UiDeygu3R3vIDiImCpsChRGuoQaj+Sf
	ruv4FuKPq6onu8zSq4Gq8qKZUbH5Kk1ZddqvAKAd7KyGbl6iq5DG/WkVpvv5FetGeKv1DB3QscV
	g==
X-Received: by 2002:a05:6808:3508:b0:4b8:4703:db90 with SMTP id 5614622812f47-4d72c73ec5amr6529895b6e.25.1790353804577;
        Fri, 25 Sep 2026 09:30:04 -0700 (PDT)
Received: from pop-os.. ([24.32.17.59])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4dbf6209b83sm2164628b6e.10.2026.09.25.09.30.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 09:30:03 -0700 (PDT)
From: Rishik Yechuri <epicrishik@gmail.com>
X-Google-Original-From: Rishik Yechuri <rishikyechuri@protonmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Rishik Yechuri <rishikyechuri@protonmail.com>,
	Gabriel Windlin <gawindlin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging rtl8723bs: align function parameters in aes_decipher
Date: Fri, 25 Sep 2026 11:28:27 -0500
Message-ID: <20260925162828.221356-1-rishikyechuri@protonmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix checkpatch.pl alignment check in aes_decipher() where parameter
alignment on the second line didn't match the open parenthesis

Signed-off-by: Rishik Yechuri <rishikyechuri@protonmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_security.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_security.c b/drivers/staging/rtl8723bs/core/rtw_security.c
index 3de102a27..6a4e50d71 100644
--- a/drivers/staging/rtl8723bs/core/rtw_security.c
+++ b/drivers/staging/rtl8723bs/core/rtw_security.c
@@ -966,8 +966,8 @@ u32 rtw_aes_encrypt(struct adapter *padapter, u8 *pxmitframe)
 	return res;
 }
 
-static signed int aes_decipher(u8 *key, uint	hdrlen,
-			 u8 *pframe, uint plen)
+static signed int aes_decipher(u8 *key, uint hdrlen,
+			       u8 *pframe, uint plen)
 {
 	static u8 message[MAX_MSG_SIZE];
 	uint qc_exists, a4_exists, i, j, payload_remainder,
-- 
2.43.0

