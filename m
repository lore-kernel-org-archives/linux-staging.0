Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 937B3757F6
	for <linux-staging@lists.linux.dev>; Tue, 21 May 2024 03:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716261463; cv=none; b=nrYMjjzx9lDhbfQS5y1oh/uc9ZEx4Cbsbr1elsGH35TbfXoC7GlMHtkTP27v9r4grYD87lMVN6P9QPeZAuuPgfiGWDY4Qz7rQEuysMtPB+diIOMc3RzNxpJZtCWDyPEuQgyfCKmwNypkdJYXhRu6to+pckaC+vRI4fl7sQo7EZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716261463; c=relaxed/simple;
	bh=zCqvorSBaGZIzif+lPh4oaRT8OhvldrR3odkMX5XB38=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=T97c4cztHI6fXkVMIdeYrOCRS8OeCKc297cXLn+lce0bcCotrpBiNPIpwKOaoWwTx9IMOpWfSD1L753sp75FCNpgUFisARcaQVvE7Oe+GxOFgi7zdrT8jTHZZCdsob99DVeoMRSjVPkyERqZUFmy+FidDnzkJHbjWhmm99DEvTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=DfFhd3Hu; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="DfFhd3Hu"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1eb24e3a2d9so105656305ad.1
        for <linux-staging@lists.linux.dev>; Mon, 20 May 2024 20:17:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1716261461; x=1716866261; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bi0tzsNlePC+MRPb33kI/mSFw1w7V1fTyHb4oJsIRQ4=;
        b=DfFhd3HuMAGgFnaJh28t6jv5ICicrrfVmmpWnriofMWHzO+gukwsAAXHk1HYMIlEwz
         vKGxRjUBXG0uH62Yb1wsl6VkzQ6UVLN3d5j+AjM/u2xl7NPzw5N4MGb5xEfb3RaVYcpN
         AMQFttJdzT7qntpcRddYsN7MAzVp2+KX/GiayixLQp5bd0F5eXSCRkavtyfJqYup6ba1
         bABi6F0Z/4mVBpMbIw6CFu2z7QUcjmLDwRGJiz2SxMWYsTar8jdoAQcnAViNLOMZ5nW2
         zY7dzKqWJTrl8D0sbRTWuUWn8l/nCzIvL5x4a1drQpWaZAH+UydpSPKgtBSFbdS3nmOT
         Bg8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716261461; x=1716866261;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bi0tzsNlePC+MRPb33kI/mSFw1w7V1fTyHb4oJsIRQ4=;
        b=WOkFOc99G/+JXHZK+qav1DlqX2ozGMkqRyPE+sv/0FkETaWTUN+Ic1dAbE1TYxJ+3d
         D08MnonNHG4eqLqKiDWXh3stj58uPaIJ8kf5zshpohoOgqb2+T24lndD4ikCNfEjWG8H
         30OZy4OQEUMAsnDTNiozR4TsNsptb7UktvYq/2hoEyNXbW34d6EglF0sFpWOh395yNU/
         OU5kni4liClAtq+q9lCCFFtFcOoyMNduAxS8FLO2QN9vCnRWXAn6yfer1l8qzX78fSjR
         vM1e/4KopVSXiD7zRPkaXqgkrCaP0QUjNuUMUTsMrfzF4QTYMeG3DuKHDY9JTo/sfiQz
         VfQA==
X-Forwarded-Encrypted: i=1; AJvYcCV7UFZ4ox82UprGSishuqd8yhrHhO0+DbL1GVSfw8tGOFZa6p8AilcsAZeOTTHjgmFtx7H/eD1AFqxqEHRPgVSh3sTpVGp7qypn17nLGA==
X-Gm-Message-State: AOJu0YyETApQd51ZGn+MdOOCj+WRCN5gPR7z/N0exJwVR4a77jNuJlG0
	9/TPYgMQPAigWLMQJZZlJ6FeEePERJJcd1Lepif11d391JSO4duLRVxLqSV44Gs=
X-Google-Smtp-Source: AGHT+IE1lUAWf9zcNS4+KWUmFaa+Gmi+y1btT54d3CnG4I5elxQClQvx7GoFbtofB9i0QLiAf/kcfQ==
X-Received: by 2002:a17:902:b70a:b0:1e2:8841:8d67 with SMTP id d9443c01a7336-1ef43d2da8cmr343378175ad.32.1716261460995;
        Mon, 20 May 2024 20:17:40 -0700 (PDT)
Received: from lunchbox.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0bf31a93sm214885415ad.134.2024.05.20.20.17.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 May 2024 20:17:40 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com
Cc: dan.carpenter@linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH v2 25/31] Staging: rtl8192e: Rename variable bWithCcxVerNum
Date: Mon, 20 May 2024 20:17:12 -0700
Message-Id: <20240521031718.17852-26-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240521031718.17852-1-tdavies@darkphysics.net>
References: <20240521031718.17852-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable bWithCcxVerNum to with_ccx_ver_num
to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
v2: No change.
 drivers/staging/rtl8192e/rtllib.h    | 2 +-
 drivers/staging/rtl8192e/rtllib_rx.c | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index 91164a3b01aa..4fec36cfa2fc 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -917,7 +917,7 @@ struct rtllib_network {
 	bool	mb_ssid_valid;
 	u8	mb_ssid_mask;
 	u8	mb_ssid[ETH_ALEN];
-	bool	bWithCcxVerNum;
+	bool	with_ccx_ver_num;
 	u8	bss_ccx_ver_number;
 	/* These are network statistics */
 	struct rtllib_rx_stats stats;
diff --git a/drivers/staging/rtl8192e/rtllib_rx.c b/drivers/staging/rtl8192e/rtllib_rx.c
index 480d4bf8df4f..2d0a0efedc97 100644
--- a/drivers/staging/rtl8192e/rtllib_rx.c
+++ b/drivers/staging/rtl8192e/rtllib_rx.c
@@ -1836,10 +1836,10 @@ static void rtllib_parse_mife_generic(struct rtllib_device *ieee,
 	    info_element->data[2] == 0x96 &&
 	    info_element->data[3] == 0x03) {
 		if (info_element->len == 5) {
-			network->bWithCcxVerNum = true;
+			network->with_ccx_ver_num = true;
 			network->bss_ccx_ver_number = info_element->data[4];
 		} else {
-			network->bWithCcxVerNum = false;
+			network->with_ccx_ver_num = false;
 			network->bss_ccx_ver_number = 0;
 		}
 	}
@@ -2349,7 +2349,7 @@ static inline void update_network(struct rtllib_device *ieee,
 	dst->mb_ssid_mask = src->mb_ssid_mask;
 	dst->mb_ssid_valid = src->mb_ssid_valid;
 	memcpy(dst->mb_ssid, src->mb_ssid, 6);
-	dst->bWithCcxVerNum = src->bWithCcxVerNum;
+	dst->with_ccx_ver_num = src->with_ccx_ver_num;
 	dst->bss_ccx_ver_number = src->bss_ccx_ver_number;
 }
 
-- 
2.30.2

