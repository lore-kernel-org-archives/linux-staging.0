Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEAFF20B33
	for <linux-staging@lists.linux.dev>; Tue, 21 May 2024 03:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716261446; cv=none; b=ATJsyAp6UpKEJQhPu3XLSNBQCC6+SXW7/Fy05Xh9cjV5JezzQtd80/FH3qykKmlQQTBx663TVovhEB+5MIqUyDFYa66WTiSbxlBWL82muL3WHltjwPQ/V3XTweyLPH60zqMgMMCpw5zzXKJh7D6ozBwFET6X7P298rtY6BU/KSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716261446; c=relaxed/simple;
	bh=ebhL7OWyfs31SLaHB1cYxnl7cOPvEZeqPuUHXc5pcNQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CtMRn38R9FEN6StSHJDe3/UlbQO1YsI3QF92xb02wW7QjvCQNJoTlpz1wC9NxoHe08NMmGXv2zaTkLGbnqweHSvl3Bb2DpzBj8m4tPjNplJHua/iKcKLE4Icsz8B7jL1EhtCWklXivEZWhysEVXQdZrpN6mQMtmsLO7OYyWXd8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=IaALNKMG; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="IaALNKMG"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1f3105f3597so1962765ad.2
        for <linux-staging@lists.linux.dev>; Mon, 20 May 2024 20:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1716261444; x=1716866244; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3P37hzP+paRdjgXjGabfu2gjX5afmH1EUMnSM6TIDMs=;
        b=IaALNKMG9bE5qMZch+ebsdpCUIP40p7GmRlFTIzM5F9hsw/ONCelMYhxSQMqwPjgZ0
         B1ka8Q59lxrUNdwCGEXjp0ZRs2EYAC8GsCzLkhuhNiR37Vr8+7GpGugkgmk8cLYyER0d
         Awayr8K3KKkuI1Pu2LZc3HEeOmiwTcl/sn2yBuncOR7IMN1N3B7j9zuyjA50wJiqjwGZ
         M20CVpcbe0OWLi6oyP3VvqvsX3WnfdzjDSaAvc6YF90vIHN7rt0c/Z20QZja1faZT/7L
         7o9qfLXwJfHuCpjW1SseT3+8izxlm1VBdeKtG2CgQKlRAo+i5UZ/T1GT7NPAb37UVdIJ
         2QAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716261444; x=1716866244;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3P37hzP+paRdjgXjGabfu2gjX5afmH1EUMnSM6TIDMs=;
        b=A8Dk8rYvG4MPP7ehlq4wtHEg0dga6zz5Z6GdyYNaTYeTirxMdppy+/MKLh27Vp+EzB
         35rwBmLw+Ol3OoZVnO+NxflshB6EIPR6vPRv0aIALAcWBn7x68bpJGWW5RZOB3uRX4VJ
         naDYmXtL5lFzGV85wTzakMvcLRAqtSjx0kYrWOtNtPtYhGmUrjBVLUkvi5ctDeyw4ts/
         dMslYpVXZIqbuL/sd/uQ9Q501LIoLROlK9f70qau8EMr2QooZ5xECc76SPhwBV471LgV
         xKxaaVZLStf97uxb/GTmyJp+2ztSE2ZcGkv/dkG6ZTd0tPIGRMkXSG6xXHbhKcXo6jJn
         w6HQ==
X-Forwarded-Encrypted: i=1; AJvYcCXsxnZdV5OPZ3CgPawfEYnB475WH2kKULoofZ4rHIEFQJuIhm/WN3tUO/VZIDcwUyqOnOXmcdmjHp6zWtsVWcwspdTUR5aCj9trXQfGWg==
X-Gm-Message-State: AOJu0YzmDW5GMbp3WbBlvMb4XlY10cmlr+UK7O4OytVHdkmFjAiUcL40
	3qDVEMO48DVTuFqbTL4imTo6KIiCIiXdlg+rAgnmo95/2ZqMB/GWHs7wNER9KTI=
X-Google-Smtp-Source: AGHT+IEguD0lIgnB383cVpP59a3+EhvaL8r/2t38JuAG5vekRSV96M1f9rt5EICHCrC7qXiplCmvTw==
X-Received: by 2002:a05:6a21:8cc9:b0:1b1:d31d:c0c8 with SMTP id adf61e73a8af0-1b1d31dc132mr8718679637.32.1716261444057;
        Mon, 20 May 2024 20:17:24 -0700 (PDT)
Received: from lunchbox.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0bf31a93sm214885415ad.134.2024.05.20.20.17.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 May 2024 20:17:23 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com
Cc: dan.carpenter@linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH v2 03/31] Staging: rtl8192e: Rename variable CountryIeLen
Date: Mon, 20 May 2024 20:16:50 -0700
Message-Id: <20240521031718.17852-4-tdavies@darkphysics.net>
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

Rename variable CountryIeLen to country_ie_len
to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
v2: No change.
 drivers/staging/rtl8192e/rtllib.h    | 2 +-
 drivers/staging/rtl8192e/rtllib_rx.c | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index 8a84d61e6912..cae4df481397 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -949,7 +949,7 @@ struct rtllib_network {
 	u8 wmm_info;
 	struct rtllib_wmm_ac_param wmm_param[4];
 	u8 turbo_enable;
-	u16 CountryIeLen;
+	u16 country_ie_len;
 	u8 country_ie_buf[MAX_IE_LEN];
 	struct bss_ht bssht;
 	bool broadcom_cap_exist;
diff --git a/drivers/staging/rtl8192e/rtllib_rx.c b/drivers/staging/rtl8192e/rtllib_rx.c
index dc0db6fade0f..1cae6d6efb96 100644
--- a/drivers/staging/rtl8192e/rtllib_rx.c
+++ b/drivers/staging/rtl8192e/rtllib_rx.c
@@ -2183,7 +2183,7 @@ static inline int rtllib_network_init(
 	network->turbo_enable = 0;
 	network->SignalStrength = stats->SignalStrength;
 	network->RSSI = stats->SignalStrength;
-	network->CountryIeLen = 0;
+	network->country_ie_len = 0;
 	memset(network->country_ie_buf, 0, MAX_IE_LEN);
 	ht_initialize_bss_desc(&network->bssht);
 	network->flags |= NETWORK_HAS_CCK;
@@ -2342,8 +2342,8 @@ static inline void update_network(struct rtllib_device *ieee,
 	dst->RSSI = src->RSSI;
 	dst->turbo_enable = src->turbo_enable;
 
-	dst->CountryIeLen = src->CountryIeLen;
-	memcpy(dst->country_ie_buf, src->country_ie_buf, src->CountryIeLen);
+	dst->country_ie_len = src->country_ie_len;
+	memcpy(dst->country_ie_buf, src->country_ie_buf, src->country_ie_len);
 
 	dst->bWithAironetIE = src->bWithAironetIE;
 	dst->ckip_supported = src->ckip_supported;
-- 
2.30.2

