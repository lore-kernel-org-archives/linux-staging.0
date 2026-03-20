Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04C923D1CCF
	for <linux-staging@lists.linux.dev>; Fri, 20 Mar 2026 17:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774027516; cv=none; b=cGVIdEmhosOUR2SKe/bBAM8rxKMWBv1EkLD5Aqhao8jzxyWrxuxhW4+kyxmzesYUQmOJUCDFlCmEu4tWdugtL4aQQQMsqmUiK8uJ6RKCguxAg5HjjkW2y43WrLL2yfAVvu5RCsStc/rKlHXX4SYij57NLf9xYhhpINKSyyadmuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774027516; c=relaxed/simple;
	bh=qH8F4vMhmLbL/E+5OyxCv4eTdZcU8AdjkigPGvAnfg4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=tagvHfNf03FKXb+UIlU+Rik5+uPSwE3CZi3lAcTVQIqzq5KmwZwelLbnB4idyLo/JWor61gPq+F+p28oU39ZjuCqT8o1cWsxDUmjPzaQ+NC9wbDqL5oP96QdAFaCPsD7rg1HFpyVCHkVUudTe0Nf444uUEogvUecCViG05e7UiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=acrOEyIH; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="acrOEyIH"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2ad9516a653so10337315ad.0
        for <linux-staging@lists.linux.dev>; Fri, 20 Mar 2026 10:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774027514; x=1774632314; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=t+GNu5I3W9NwmJK6inUqqXkgogIZfazIJwHUz45w1HA=;
        b=acrOEyIHshKm083RNMFzU4+dZC/uFMIQWb3QmMTf9r87G/AxoyYZ68Rh51aeNBU8z2
         VtQvpHoTLS+hjjA2SIt3cfmg8krDgWOLyl0FG5jPA2yb/82WucGkBgruC39KgeZuRHy+
         mN8cRPYx0zpRL4XvkP9eBXpDN3oUxZcLPbIn3ghnK15YXl56djrTEXx7TMBKCi7VNEQq
         mGMALwl/R5/rlcuM1ZSF8noh2AHbIlu0PNbIZ5qdij+CH6w+x3vuCBSWrxiDqEPEuYkc
         hMXbCoUkp++uEkKxWZ5cn+9f+vMHC272WqpKSGQdT1ZK+sn4vumubRxOq2wOVKBD03Ce
         54bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774027514; x=1774632314;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t+GNu5I3W9NwmJK6inUqqXkgogIZfazIJwHUz45w1HA=;
        b=lGMI15XT3UtdlMHLl1Sd5uRoEIhuNMpImIisTg9bF5equX3y/mYyb7Ho06v5bXFNzV
         IZ6pmabvGBtPKHePGvwyKFUgsAyrYIJPpwhH1tddpvjXhGwgeFmI2wdBTxUQ2cVWIBnr
         uC5e1/TkBZiU89qDNQ5JPz6OE1VvQ/Dk/p8HYWMoi1/wNh2NTgsAQVIyAdZiW6f0/ULA
         /Dapo1EnIBhrGU3vghZshqi7jt86K8TLLzQcBD5su+RqGZO1GnuHv9RcHuIk4r6E8YnF
         GhtMkRxmqNIzGRpUAXKgsyI5DuQi0lwp8pgM7SLL08dZbFXqEGvNPSPCCCmPGF3ooOQO
         FYeQ==
X-Forwarded-Encrypted: i=1; AJvYcCXBCSRfbNHx/d2vNnMhOPUeoKhy1V7pLvAB3oOLadd6PsFUZAeAGi+AKm8BvRXM0p7raDwTp/f5S+dtC8EI@lists.linux.dev
X-Gm-Message-State: AOJu0YypAxOJOiL743k206+u/q7RVqD204K+VuZE/Q7F86C3P0li8Y90
	UzjaaqmvPko9ovEphwB0iQc3wGBKQTvinXUsfKIOTnU6XjL8UP8gqSN3
X-Gm-Gg: ATEYQzzqn63i9ATx8qXiRzfhLqJO++fq910eiojiXkCNTrc3CTrOQLSpubJhd6E26VC
	mSVGbYohy/JalrvwpRGSWJSXfXyk/K+oFkc3an/cYb6OuDip6TGNWXSI+x5sqaQq4K47r79NQYv
	gibZkxELxpZHRwSgPRh1SRyfkUP9d9l17fPlyLmd0HCFACLQVyf2wntZSqkaird1wr86IOLjTGg
	lHzsu8YN/VeqLvow5KYojxWeH3FzOXZRpUXQNjpNpNoG8QM6K+bSe2DDdBaakUWa4uJp9Tj2w+B
	ougRU29Jgy42CGdzdr2PqJytHbeTWVjP/KT3jqvLMyJvHqkFj7n67XduiVZGubrMXQVQgCgizNw
	/eTMKZKv0NLiP4WTjIDq/RFNrQuCBVJRyYSBFWo62eW8KsA0/901utrTIYEkX8GAu5sqmxvzBqr
	AAyKtCe7CYyBO921H+wjzd9dNIZl2/yT7JciAy6LVroozeE67jl5Dw9kSev0PUfQh/CePrna++u
	wnWmMfhWg0PXxFS9qhTKrEspHq7zKVQP5A5cp099+Gbmn2m
X-Received: by 2002:a17:902:e743:b0:2b0:3f76:9e98 with SMTP id d9443c01a7336-2b082711294mr37351235ad.17.1774027514259;
        Fri, 20 Mar 2026 10:25:14 -0700 (PDT)
Received: from starpt-K55VD.. (2001-b011-7803-12be-cb09-1ed7-38f9-f58e.dynamic-ip6.hinet.net. [2001:b011:7803:12be:cb09:1ed7:38f9:f58e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b08369e41csm28220345ad.74.2026.03.20.10.25.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 10:25:13 -0700 (PDT)
From: Lin YuChen <starpt.official@gmail.com>
To: gregkh@linuxfoundation.org,
	dan.carpenter@linaro.org
Cc: straube.linux@gmail.com,
	starpt.official@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] staging: rtl8723bs: initialize le_tmp64 in rtw_BIP_verify()
Date: Sat, 21 Mar 2026 01:25:02 +0800
Message-Id: <20260320172502.167332-1-starpt.official@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Initialize le_tmp64 to zero in rtw_BIP_verify() to prevent using
uninitialized data.

Smatch warns that only 6 bytes are copied to this 8-byte (u64)
variable, leaving the last two bytes uninitialized:

drivers/staging/rtl8723bs/core/rtw_security.c:1308 rtw_BIP_verify()
warn: not copying enough bytes for '&le_tmp64' (8 vs 6 bytes)

Initializing the variable at the start of the function fixes this
warning and ensures predictable behavior.

Fixes: 554c0a3abf21 ("staging: Add rtl8723bs sdio wifi driver")
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/linux-staging/abvwIQh0CHTp4wNJ@stanley.mountain/
Signed-off-by: Lin YuChen <starpt.official@gmail.com>
---
v2: Add Fixes: tag as suggested by Dan Carpenter.

 drivers/staging/rtl8723bs/core/rtw_security.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_security.c b/drivers/staging/rtl8723bs/core/rtw_security.c
index b489babe7432..c3f5fc4abd17 100644
--- a/drivers/staging/rtl8723bs/core/rtw_security.c
+++ b/drivers/staging/rtl8723bs/core/rtw_security.c
@@ -1291,7 +1291,7 @@ u32 rtw_BIP_verify(struct adapter *padapter, u8 *precvframe)
 	u8 mic[16];
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
 	__le16 le_tmp;
-	__le64 le_tmp64;
+	__le64 le_tmp64 = 0;
 
 	ori_len = pattrib->pkt_len - WLAN_HDR_A3_LEN + BIP_AAD_SIZE;
 	BIP_AAD = kzalloc(ori_len, GFP_KERNEL);
-- 
2.34.1

