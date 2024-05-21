Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45E26848A
	for <linux-staging@lists.linux.dev>; Tue, 21 May 2024 03:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716261448; cv=none; b=s0dNm18sLDP7s/ahaNECp7PNgrS9FjhfEhdLrG+zUNJ1qL1iot1ahIjgDQleMK+6iVhQOICGMam9hxX+Id96Dgb6/Guh5jyaHqL7PWtGvEI03cxHR5MxbIhNlHeK/aXuHT/FLgS3QNna4G5z/uOpV3+G3McPHX6fhpHnFXnth74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716261448; c=relaxed/simple;
	bh=yjnVfiPa/m1e7bMoAHPK8wG9ELF9HjLigJk4WoCJGCg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=AOTitAvJrfkxC9BnSJUCTV0jkPc+lSXNbDPbChKlcXTa7AmwHC7dIBJ7EaprO9ZaK5aFrF73pv0RGHc2HIdb3PX8zQkz5zYaBlZD6/AYkgAyECEyLRDAPFHK3VkTHQyT9q2M82KdtLwd4x1f//BB94cijCN9DTtJjszrf8WWnUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=f25LLMFY; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="f25LLMFY"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1eca195a7c8so93281495ad.2
        for <linux-staging@lists.linux.dev>; Mon, 20 May 2024 20:17:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1716261445; x=1716866245; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oKQNuljJrQrm0mrk57cCGFb1Ap+racxF02oGqH9QatU=;
        b=f25LLMFYJfIEX+asPJGCtiqNyINelPkDV6ewgJmqYLBIynHgxwFMDhBKuDs00X/hBC
         O9OIZ1YBHpZaktkEYyQ6UbZEByPyI4AVhE67lzkmgiHRwieqAfPEqMieIYDtT7k8Qqcd
         iXL9+VAd/pB4JOm8YyXI33g5JM6wPsLDJOSi1zWxFtxrz0XGuV02dn95CE7ysaNOD2Cn
         F+3ZeZlvvY+IBWOp2NCaq+WL3eknvfzX09yr815KHI6EsoY+TN4LsaxProcL39bpixmD
         oqgXHJGtNi1HyRQixx7vC6c030R6ZcU6pmGkOm0xx9Goi5dVgryvXbJLEzd3YreXELAb
         sQyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716261445; x=1716866245;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oKQNuljJrQrm0mrk57cCGFb1Ap+racxF02oGqH9QatU=;
        b=mt9rrGftNiUtc6rwcbrB7m4TonhxLvaaRKj0WVtsYBjQGIVVeMBSPse7KMH43eN51G
         T7x8xEZ7DOBXFhWOfJZ3wUywhLRPA4Kl9jJhoKuU7KPSLnf6yjWXLr76fa22PP8Gia78
         7QkiFPMv1uSo8mCkedIiaKeFdg/vucK/B4JV0i7HJDClmoKp46Rt5JDjnYcFCSzotd/l
         JJv6oCqCszJy/O3qwAkzEysY9e8UPtKWsqchDYk+kSzUCVPACCa6kOCUopdkF6AF1Pyl
         6x6ByNnCCxidHU8mXZLt6OyWlBgb6YIZRlfPm451KAcw7lIwmmCZLzVS2TzKop/f+YSi
         7mkg==
X-Forwarded-Encrypted: i=1; AJvYcCXsVrH4p4vQe3OL4m/+fj3bMd2Ad5Ov2k1tByw0gwVCp2Zr+vKnnVHw15H03XkhmTuCROqQhIaZDMr9CxRNCFXb4NNDlVipth5cOCWIAw==
X-Gm-Message-State: AOJu0YzPD7G7wjBbIA0ERiZef3OJkHoDFifdPVL6MnWKuaC+QDRlTrOY
	bqDOKgpyIxDxIEWnP50KrX2yKVMEMS7RtW+rhm98a+XQb9nbNbVPro7gZDjtuoM=
X-Google-Smtp-Source: AGHT+IFw96ldbcgB3oflpWfTd8TOYioaKqrI7h7QhyBMYAnNYP6nXm5YDsaO4zlFVR8FeN+BqXFiSw==
X-Received: by 2002:a17:902:eccb:b0:1f2:ffca:879e with SMTP id d9443c01a7336-1f2ffca8d6fmr51273685ad.11.1716261445574;
        Mon, 20 May 2024 20:17:25 -0700 (PDT)
Received: from lunchbox.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0bf31a93sm214885415ad.134.2024.05.20.20.17.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 May 2024 20:17:25 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com
Cc: dan.carpenter@linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH v2 05/31] Staging: rtl8192e: Rename variable bContainHTC
Date: Mon, 20 May 2024 20:16:52 -0700
Message-Id: <20240521031718.17852-6-tdavies@darkphysics.net>
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

Rename variable bContainHTC to contain_htc
to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
v2: No change.
 drivers/staging/rtl8192e/rtllib.h    | 2 +-
 drivers/staging/rtl8192e/rtllib_rx.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index 40ec29434d68..ce0cd1f557c3 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -489,7 +489,7 @@ struct rtllib_rx_stats {
 	u8    RxBufShift;
 	bool  bIsAMPDU;
 	bool  bFirstMPDU;
-	bool  bContainHTC;
+	bool  contain_htc;
 	u32   RxPWDBAll;
 	u8    RxMIMOSignalStrength[4];
 	s8    RxMIMOSignalQuality[2];
diff --git a/drivers/staging/rtl8192e/rtllib_rx.c b/drivers/staging/rtl8192e/rtllib_rx.c
index d4dbf8052c30..4e7c491c0aaf 100644
--- a/drivers/staging/rtl8192e/rtllib_rx.c
+++ b/drivers/staging/rtl8192e/rtllib_rx.c
@@ -743,7 +743,7 @@ static u8 parse_subframe(struct rtllib_device *ieee, struct sk_buff *skb,
 
 	if (RTLLIB_QOS_HAS_SEQ(fc))
 		LLCOffset += 2;
-	if (rx_stats->bContainHTC)
+	if (rx_stats->contain_htc)
 		LLCOffset += sHTCLng;
 
 	ChkLength = LLCOffset;
@@ -862,7 +862,7 @@ static size_t rtllib_rx_get_hdrlen(struct rtllib_device *ieee,
 			netdev_info(ieee->dev, "%s: find HTCControl!\n",
 				    __func__);
 		hdrlen += 4;
-		rx_stats->bContainHTC = true;
+		rx_stats->contain_htc = true;
 	}
 
 	return hdrlen;
-- 
2.30.2

