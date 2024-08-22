Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B994B101F7
	for <linux-staging@lists.linux.dev>; Thu, 22 Aug 2024 00:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724287795; cv=none; b=NoL8+3ZfdNVCTvmuNhRO6kI3eKepB3IHylnTL6DSwwAG+dIvaEqJGfJCaB6RP++4gKTZLZbxy7xfpwZjyGu4TCJZ4vZTTEu6wYqRHsDJEWtB0DdUW5j+IZKZuU7hHQLts5LpE7Oq+VYrbX07x7vN0tvgjOorjzIdahMOVJoXf38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724287795; c=relaxed/simple;
	bh=AnIqKnh9ldoevdKJjoL24+oTb6ZiwTuOexuRPtIUMz4=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=W00YAeQALMlnOWIfpojP7FTPEQORK9H28pee1Bo52psNqhHATyzdccvTw4aUrSS83gWPkc2o87Ynam8hSJAojJN/HGzMeYWmY/KTvmV6TZKUbIEyuq/yi8YK/Rkzqj9pr56hbkI2+D/oDLNRr2GgYPJyg7oYuUfyu0OyUjQL83E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XtZ5KHNG; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XtZ5KHNG"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-7b594936e9bso206399a12.1
        for <linux-staging@lists.linux.dev>; Wed, 21 Aug 2024 17:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724287793; x=1724892593; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=8tw5cLiO6wnytINGEVE6XWwraB+DzGxHZd6q+jRn0Qo=;
        b=XtZ5KHNGIeBKz3mLQ8UprbmuscujRUlD92SCgTvKkb+COOCIqYNyW5gt/7VqHfiE4t
         kwQx0PFVwECi/mbynVnKZPA8CGXpauV1Dizd9vD9r6kIbQUdyZqRRby2hoQYclcySLFp
         rwjoCDfzOSnliaziB0viJg9c140o6yHdt+g90f3RDDnsfy3fEVOsEDZ/hqnv2h/ZSMTO
         MEbLnSb4kxFeocrC0Lhma4nAqBi0YuhOKLVnZj/u/T9Brt1Z/Mm1dlnVqIcLT3slOPlU
         n3e/1Qo1OVESqk8Mj2I5ufQhk2tPqgnL1Potq6zJEOCCY+mvojWKQTwHAPuTpk38yuJR
         Th2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724287793; x=1724892593;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8tw5cLiO6wnytINGEVE6XWwraB+DzGxHZd6q+jRn0Qo=;
        b=fjYqFiOEIDqu8zY4RHovA71AxaV62s/jT0cl98i49eubMybdhyQUUbuM3iNYWtD+g3
         xaiLRGRyb/YH+8rE6njv4kiZucVVLUa5VJp1qWtx3H7BtM0OlxqohV6+1jCEmSlHNgWD
         m+Gz5C9UlBRRbKVB4h8YwugApQFhwSHaNu0FasGYVHvIVWEmCwmM315nXXPAvQvf4tcb
         TocqlB75z36726jCBiR1lihZcR0vvze380/kgjz/XnWJVke++QdSx26D2+Ex3sWAVEuk
         924LwXQaxBmX7epA1ku5vMB56U/s5Vr00WPY4MPk4tcTFYXhGJq7UopMmaTrRVhAJIbC
         7P5g==
X-Forwarded-Encrypted: i=1; AJvYcCVxuf+273ojmcWL6LvVcX+uCznv0ddcjhT7shxsRZaNboye5h3qk1SZUxWITj+2Y6wtzYLWIIv04q8tQHgu@lists.linux.dev
X-Gm-Message-State: AOJu0YzmoXSOvV0tLll5ClrPmfotibnQRw7DB/l8M4jjuh0OHlVGNtd0
	WeUoBGHMT8WEucnT42mdKLlD1j/TR/t/tEBUdKoreUtAn+AY6MPU
X-Google-Smtp-Source: AGHT+IECJLsEhyFo7Za/jVB5clI3+X86rnYOL6uziPIj9ErLnw1RmP2dNAX6v3lsVzauwnm0qHxvdw==
X-Received: by 2002:a05:6a21:e85:b0:1c4:9f31:ac8f with SMTP id adf61e73a8af0-1cad81447c0mr3939501637.37.1724287792739;
        Wed, 21 Aug 2024 17:49:52 -0700 (PDT)
Received: from localhost.localdomain ([2804:14d:baa2:9074::1002])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d613af14a1sm267398a91.45.2024.08.21.17.49.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2024 17:49:52 -0700 (PDT)
From: Hans Buss <hansbh123@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	~lkcamp/patches@lists.sr.ht
Subject: [PATCH] stagging: rtl8192e: fix alignment parenthesis
Date: Wed, 21 Aug 2024 21:49:34 -0300
Message-ID: <20240822004939.153517-1-hansbh123@gmail.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Fix alignment parenthesis in _rtl92e_wx_set_encode_ext.

CHECK: Alignment should match open parenthesis

Signed-off-by: Hans Buss <hansbh123@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/rtl_wx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c b/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c
index c21a0560410a..fc8e7f73b2a4 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c
@@ -675,7 +675,7 @@ static int _rtl92e_wx_set_encode_ext(struct net_device *dev,
 		u8 idx = 0, alg = 0, group = 0;
 
 		if ((encoding->flags & IW_ENCODE_DISABLED) ||
-		     ext->alg == IW_ENCODE_ALG_NONE) {
+		    ext->alg == IW_ENCODE_ALG_NONE) {
 			ieee->pairwise_key_type = ieee->group_key_type
 						= KEY_TYPE_NA;
 			rtl92e_cam_reset(dev);
@@ -710,7 +710,7 @@ static int _rtl92e_wx_set_encode_ext(struct net_device *dev,
 			rtl92e_set_swcam(dev, idx, idx, alg, broadcast_addr, key);
 		} else {
 			if ((ieee->pairwise_key_type == KEY_TYPE_CCMP) &&
-			     ieee->ht_info->current_ht_support)
+			    ieee->ht_info->current_ht_support)
 				rtl92e_writeb(dev, 0x173, 1);
 			rtl92e_set_key(dev, 4, idx, alg,
 				       (u8 *)ieee->ap_mac_addr, 0, key);
-- 
2.46.0

