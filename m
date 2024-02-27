Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C904A53385
	for <linux-staging@lists.linux.dev>; Tue, 27 Feb 2024 04:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709008929; cv=none; b=po88VRJ/JmwOd0J5cRSRJqFCwQKDeG/YhJ5jOU6NsT61zgpVZILIOzIRBWj6i+Hw807W3fVyzUtQwIZvb0HvyOad6Dp5poQOS5JK6lDYuHJ9y+xCRRSUJczuKsNU57Iz4pgpLwWFsHYJOTuLrHKS2kM1wWzvU5OgcMY4fmgR55A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709008929; c=relaxed/simple;
	bh=S1HpBS0V8SbrWzHD9lIz3Pm1wGEtJ0x8Om/JmBQtkBs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XMFEkvexM16QHfXzZKkmd6+7ikqNr/uGKkNrVX22hd7B/FfsREo/8MgGm4W4mvq9fHGXCNYQpzv3toaZKYZd9JdR7iahjxP3bMWky8v9s7qxuv9mPkvJ45VjpgPowLl73NOgx4FYnflI7rUbYGz8zpleiLxf4QYvme9AcoUGiyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=UUHIhNTN; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="UUHIhNTN"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-6e4e7e25945so1880277b3a.1
        for <linux-staging@lists.linux.dev>; Mon, 26 Feb 2024 20:42:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1709008927; x=1709613727; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O+q+AbEi3C3CZLXbva3ppHujTGDxM/LEcu1siopQo8Y=;
        b=UUHIhNTN3aCgKUHj4Ip8Zz5PYm3on9PpE7WhbgCHyBnuj2iNx9JlJO6BwmKbWwS6kT
         qCNKETyjilWAll6x1LBVO/jKmcA/r8kq6KMMO8IQNeYbNnBzgl+uLbDINa7xziAA26LP
         hQhoKUSuubV9PWr45zUPKhKBrpMgYRMDBEADpfeqkdn/qyszhlLkvwz9QQb5HR4RdCMk
         EClEfpJ1Swe32wlgEzG9RV6ykk1GkqBVQYxpPUOFLW6ariRg4ROzOmTeH6kXrDmbgcx8
         zkoOga9zx5qBBrCP26e8xWZFRYs8wSx2njopPLdYwYqzUyTSoT33rA5xo2N7Xye1goK+
         l96A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709008927; x=1709613727;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O+q+AbEi3C3CZLXbva3ppHujTGDxM/LEcu1siopQo8Y=;
        b=oLD0moslU+ySt7vMXPBB/QesGy3GJDlDV0HNSeuaxJ9CesTjCetO54oF5sORLyiKMI
         COYU6Uv9ASvC0F5b1uOO3wP0AqQui+p3aYH+xDBqJslJgxsq5fyiatuUmh97BfUMfts+
         l7HsXdeTdF89IpY39wXUYI6zsWMwdwK0+oVJrS07cy5BodCebAOBB6dMah3YAhBFciQx
         Mvb8FUr3QSDRxZmC/GvG/kel5yJMZaGJUZWoeliHUWWc+XOaTdfUyFUpZhqWWZw9bMX8
         AjoB9SWVsXQIb+axI9XxsAPtLiW73mGh9cb669jgHMbplxcpi9jaWKwL64fCf/ONgS3n
         0cyQ==
X-Gm-Message-State: AOJu0Yy+Ae1jaTGeiZT2AGBte8VZNUqIEXELpNqfxcABaW6DsC6uOL8L
	IN5O56Kes0cyCx097YaIvqjp25cP0Tw8Vf9A+kQThDitEipGjz3A7QiLuz0+UJc=
X-Google-Smtp-Source: AGHT+IEhzMvsHaSkGVqDnE+kjMjN1dvC3pYHwld+X5qjt5uDh6zjNPp0q7dKC2974RgAOMqyIaz/mQ==
X-Received: by 2002:a05:6a00:9287:b0:6e5:2e25:3495 with SMTP id jw7-20020a056a00928700b006e52e253495mr5565787pfb.32.1709008927129;
        Mon, 26 Feb 2024 20:42:07 -0800 (PST)
Received: from oatmeal.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id e30-20020aa798de000000b006e4ecc3e394sm4899782pfm.79.2024.02.26.20.42.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 20:42:06 -0800 (PST)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH v2 05/20] Staging: rtl8192e: Rename variable Turbo_Enable
Date: Mon, 26 Feb 2024 20:41:42 -0800
Message-Id: <20240227044157.407379-6-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240227044157.407379-1-tdavies@darkphysics.net>
References: <20240227044157.407379-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable Turbo_Enable to turbo_enable to fix checkpatch
warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
v2: no changes
 drivers/staging/rtl8192e/rtllib.h         | 2 +-
 drivers/staging/rtl8192e/rtllib_rx.c      | 6 +++---
 drivers/staging/rtl8192e/rtllib_softmac.c | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index a00db0d153da..ea08ac058421 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -965,7 +965,7 @@ struct rtllib_network {
 
 	u8 wmm_info;
 	struct rtllib_wmm_ac_param wmm_param[4];
-	u8 Turbo_Enable;
+	u8 turbo_enable;
 	u16 CountryIeLen;
 	u8 CountryIeBuf[MAX_IE_LEN];
 	struct bss_ht bssht;
diff --git a/drivers/staging/rtl8192e/rtllib_rx.c b/drivers/staging/rtl8192e/rtllib_rx.c
index 526d5969399c..63e3b655e4ee 100644
--- a/drivers/staging/rtl8192e/rtllib_rx.c
+++ b/drivers/staging/rtl8192e/rtllib_rx.c
@@ -1688,7 +1688,7 @@ static void rtllib_parse_mife_generic(struct rtllib_device *ieee,
 	    info_element->data[2] == 0x4c &&
 	    info_element->data[3] == 0x01 &&
 	    info_element->data[4] == 0x02)
-		network->Turbo_Enable = 1;
+		network->turbo_enable = 1;
 
 	if (*tmp_htcap_len == 0) {
 		if (info_element->len >= 4 &&
@@ -2183,7 +2183,7 @@ static inline int rtllib_network_init(
 	network->realtek_cap_exit = false;
 	network->marvell_cap_exist = false;
 	network->airgo_cap_exist = false;
-	network->Turbo_Enable = 0;
+	network->turbo_enable = 0;
 	network->SignalStrength = stats->SignalStrength;
 	network->RSSI = stats->SignalStrength;
 	network->CountryIeLen = 0;
@@ -2343,7 +2343,7 @@ static inline void update_network(struct rtllib_device *ieee,
 
 	dst->SignalStrength = src->SignalStrength;
 	dst->RSSI = src->RSSI;
-	dst->Turbo_Enable = src->Turbo_Enable;
+	dst->turbo_enable = src->turbo_enable;
 
 	dst->CountryIeLen = src->CountryIeLen;
 	memcpy(dst->CountryIeBuf, src->CountryIeBuf, src->CountryIeLen);
diff --git a/drivers/staging/rtl8192e/rtllib_softmac.c b/drivers/staging/rtl8192e/rtllib_softmac.c
index a847b6505c42..b189ba220e22 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac.c
@@ -707,7 +707,7 @@ rtllib_association_req(struct rtllib_network *beacon,
 				2 : 0);
 
 	unsigned int wmm_info_len = beacon->qos_data.supported ? 9 : 0;
-	unsigned int turbo_info_len = beacon->Turbo_Enable ? 9 : 0;
+	unsigned int turbo_info_len = beacon->turbo_enable ? 9 : 0;
 
 	int len = 0;
 
-- 
2.39.2

