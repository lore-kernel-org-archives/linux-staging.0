Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C26B330B0E
	for <linux-staging@lists.linux.dev>; Fri, 30 Jan 2026 18:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769797006; cv=none; b=OaCDGP76HCpcIh8lPGGxgfpB1mDaFePb557jQjQhYRt+U8e9vcMap5eFb+g4mXUam2TEAjy8ElnuTETNfEM0VLd3ReEaU/kQ67c+qYzJgyX924p3DssxQ8S2ZBTryhjNEd4g6+Xa7FDxAxHn8DW4QuM5jwjyrcsBz0cYWz7aecg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769797006; c=relaxed/simple;
	bh=54jF80axLN2UJAh0SY0zu8J2BqHK+0mKcS7a+qODr54=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NdJlc1VOUUO4hoX7FilnLNkAzOxd3+Sw4T0McE9HsgX4PuC5CoRoECly02lg7JD6oQrqh8CwvI7BGynICOYc8yieMb0WOmYgUXOk1lq4nrJZNjmltQMrmRCcbIeHjnUa25D76WpuxcZBsjESkTDGIkutcJnP++ei6VFauIZzLew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GnDDxTTB; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GnDDxTTB"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4806e0f6b69so17985735e9.3
        for <linux-staging@lists.linux.dev>; Fri, 30 Jan 2026 10:16:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769797003; x=1770401803; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z2f4MfuhNu/cLjFrGUoAiSMm/1GSuujiaDwedPKXZAI=;
        b=GnDDxTTB6vtpkut2n2xNryNoqLeflZBdvxJ+SW+nMHPinlxw+SDRO0QOSl3HvEhrpH
         EP5PR508kB2rSNBKuv7V6Dop/Hk2NHgoMuNat9H3nrpLKLjIAQVztG4U2K16VKpz6T2P
         gccEc7tCevgB/F5744vaejlWtHMGUuoY5ZqQudztx3hqMJZ/F7cdyyQbE+hvx+7YP/qz
         YTaRp43MIgvGdEIxbFa8bRk4iuJE03/Hu1FRrZtLWiClkPuaBtsLrx3s42IyWbrwcYSL
         c9IufDS19DPmoYIwvLn36WiDa3QqDo7y9BTKN/Xfd9pQ7qf3jVCwB3hsBq+MmqHPrblR
         H6RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769797003; x=1770401803;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Z2f4MfuhNu/cLjFrGUoAiSMm/1GSuujiaDwedPKXZAI=;
        b=It+pX/Dyr5UHZwA+phRgVe7XbLokJSSfCtIGxVTzMHSOe96iie/VZvuca/ZDlDdvMG
         SMtsf8XkmpMV69xa0xecBaDd5ZrwqpeRBNFzDThlcYMVkkzkQl3nkaI0gXl+MNngg5HZ
         GNBNMjZjTq8nqSzV4euMP+9tvqz+DQz0ykG1n1qOMC5P8JVJ2SQ10i9AXfDi6FW8u5W3
         X2v7ki0bO+kXAP+j9tjpfIWGSKdn16jLeILwy5NCnFVrlFEj2RZWoeH4hRI0ZeKx10Kw
         LWAbj9ftNVqH+JVzybf3K0Jzg59kpeUzfIK3BCPuzFovsjKtdFizizUz+zxxkZVfRPcn
         Eu8Q==
X-Forwarded-Encrypted: i=1; AJvYcCVzvczNhVNyOr3sQm7K1CydRCxUHfaB1QjHdEwIWQ9ZiU0Z1bxp2RDEKPn0triycDCQR+jyRcBU/SZvW750@lists.linux.dev
X-Gm-Message-State: AOJu0YzrRgkSTjgE2acImp/e0PzEJBTYIyyOEx5E+/BRfTaWPrZbdi5Y
	F1OlSBRohrHfr3qwhUfgw2eJQ4ru4hJWUF1rkEbEVZNdFoYGb2F/2DuZ0XFrWng=
X-Gm-Gg: AZuq6aIe3v7Py//uqRKrvKgNxbZEUWfCx7aF6Bc4FDUERy2SSeHTOytOTxSZlBqhm+w
	H/sB3QSFchNTkr9qAdsg7RkTeVn5LdLvIxIYBzMKkjR80Ja2VcaxcxVhxC9I/9LgxfLHPp6RlLq
	1XyKvi+Cffw3Sd/FMJfaNkd06iJbj6/9TbjpRkfWGRrFYAcyjaF9DIffhk8/2BHAxg5m0OvxM+3
	aB6pd+zk0JO+tjplFkplL0g96gd30A580frT0selv/a1Wd+Tw3FJ0X/P5EvRta3mAwwLd2O+5h+
	3uPwMCOuZMsnwhtiTe2rPfNQFMFy4q+kT4bdCYaCndYRp7SVlmlVzpUoqyTKV4qRCoAGHXqn2o8
	9rwlBBlCnzArNUmvCsVLMzpwL4Hd68D8SfVqWAhmz9J9jLBdDPnGW4tGOZmgGZ9dVf9OxlRCe39
	NpHSL/TEQt2a+wY1wB1okJTcYKc0x9a4y15IS4Fpdv+n3eeJ2UcZVQNcKnhaThvd1JyqWBXmmp
X-Received: by 2002:a05:600c:3e1b:b0:477:7af8:c88b with SMTP id 5b1f17b1804b1-482db45129bmr44705235e9.11.1769797002303;
        Fri, 30 Jan 2026 10:16:42 -0800 (PST)
Received: from LGPC ([31.223.131.55])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48066c40e04sm280571025e9.13.2026.01.30.10.16.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 10:16:41 -0800 (PST)
From: Luka Gejak <lukagejak5@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Luka Gejak <lukagejak5@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v5 1/5] staging: rtl8723bs: fix potential out-of-bounds 
Date: Fri, 30 Jan 2026 19:16:16 +0100
Message-ID: <20260130181620.199152-2-lukagejak5@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260130181620.199152-1-lukagejak5@gmail.com>
References: <20260130181620.199152-1-lukagejak5@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The current code checks 'i + 5 < in_len' at the end of the if statement.
However, it accesses 'in_ie[i + 5]' before that check, which can lead
to an out-of-bounds read. Move the length check to the beginning of the
conditional to ensure the index is within bounds before accessing the
array.

Fixes: 554c0a3abf21 ("staging: Add rtl8723bs sdio wifi driver")
Cc: stable@vger.kernel.org
Signed-off-by: Luka Gejak <lukagejak5@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 98704179ad35..7dfc2678924e 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -2000,7 +2000,10 @@ int rtw_restruct_wmm_ie(struct adapter *adapter, u8 *in_ie, u8 *out_ie, uint in_
 	while (i < in_len) {
 		ielength = initial_out_len;
 
-		if (in_ie[i] == 0xDD && in_ie[i+2] == 0x00 && in_ie[i+3] == 0x50  && in_ie[i+4] == 0xF2 && in_ie[i+5] == 0x02 && i+5 < in_len) { /* WMM element ID and OUI */
+		if (i + 5 < in_len &&
+		    in_ie[i] == 0xDD && in_ie[i + 2] == 0x00 &&
+		    in_ie[i + 3] == 0x50 && in_ie[i + 4] == 0xF2 &&
+		    in_ie[i + 5] == 0x02) {
 			for (j = i; j < i + 9; j++) {
 				out_ie[ielength] = in_ie[j];
 				ielength++;
-- 
2.52.0

