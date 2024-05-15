Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2003E2BAF6
	for <linux-staging@lists.linux.dev>; Wed, 15 May 2024 04:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715748758; cv=none; b=kt3cSTz39CnvQeaOfNUbVCtK2NiuanyF+NcPg7IanUXlNJh/0ilVK2kVLhTURtg9vsTG4fQI0CqItr1qWZgD/rt6LtlhCJMFGLV0CF7cty4Ucg4UTebEKSMxOtiFQXcZIp+raEHO0FspMQjl0raBTfpBWntv6Gr14NGGui36wr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715748758; c=relaxed/simple;
	bh=bMj1LTysdPDWnmSnuPdPl6x6oclWypZmQaNvIISuQVs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KeCivcrHytDeDi0Cxc7yZlJtjh1ol2q4J6+tU49jxNdiPeX7N4B8aSwulfA5c/izYELV27ExMu/vilsYgRyg1mXHlsYFTwniue45jicn0QNjcdxD/wcosAwFXs5NuOoUUHMeG7y5hpiZmmCZu/viIc9AQcj95vnhU2jdSYjP7eE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=YMi+LxgF; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="YMi+LxgF"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-6f467fb2e66so5711130b3a.1
        for <linux-staging@lists.linux.dev>; Tue, 14 May 2024 21:52:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1715748756; x=1716353556; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+bA+4MlFti+w7GYvI8La/yKfya2pdjLh+dw43i0/xQU=;
        b=YMi+LxgFdzNkSvB5U6w1pWaIZDYSpHTeZv1twcPAYA16XVHFRJMj72MPOVA1nCrYK/
         qOucHa3/pBtNL98B0ZYzWUzUY/vZ7YSRFLHKbZI0/S1+XdXyjmZ6pwup6V46v/wtXI4Z
         GuLzTzwq/Nm1bsZn4lPzsBr45LvdxJg1LFUYwBKxyoaVs5GOEFOAc48AQlQ6B2NMPsfD
         q4mFX23OaMsdRSY+KVTZNU/qDT3HphjcIZQgb5TlREe3R2rB83QmX3iJiYD6bCCQJlqJ
         eltb3+yqSJQ+ay8yE6D6Xl6pFLVtSF8+dT0lchgasIwZIjUqLCdQZDMUdxScS9zCWXaq
         YLww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715748756; x=1716353556;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+bA+4MlFti+w7GYvI8La/yKfya2pdjLh+dw43i0/xQU=;
        b=hnQ8S9/rScTTNbqtlZIW3XIPYTuj9YQOmpUSkYIxJQl6FDKuW7MyCtwJZkw4ASzwyu
         hc8WiNvlpqWSdEjFBNDWFAx08O+yHKp0FNbw145IZ+wqBuqp3IsOyK439eXIPQtxL8wD
         fuI3IgGm27wF97Z+ZqJvq+yd2TsSEO7eLJvret1goGaiN/m6auYEQIsPVXvxzmI3b5mG
         dLG+xbtsn6YoksN/yI3AFCadRhiLAQrJsylvz6zKLtnz2Jpz7Qak0F3wf8le6L9psXkj
         8iGieAx+SZf7GS4baiCbCZIn7wa8ZHT7qqPpWku+d8Soxq4zIxsENiGoAeT2u2zTpv9J
         O1Jw==
X-Gm-Message-State: AOJu0Yx1gQhmxaIU64VP9Jqfb3Ql3wFPWovI3KSbxZ5bjCRiHs9aGMdv
	IYvO4XBhAsbmb63MVjIkz+vqv9GS8NDHW06AragxhX+eya/p4NDczcVCrTYyxpE=
X-Google-Smtp-Source: AGHT+IH+7IPgOluoAi3IpL4zc0TWJUrUEQhz7bufL00+sd65WAAqzL9nuA6x83MXq7Z+UVGa6pgcOg==
X-Received: by 2002:a05:6a00:1807:b0:6e8:f66f:6b33 with SMTP id d2e1a72fcca58-6f4e029fc8emr19237540b3a.4.1715748756357;
        Tue, 14 May 2024 21:52:36 -0700 (PDT)
Received: from lunchbox.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f4d2a827fdsm10135035b3a.60.2024.05.14.21.52.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 May 2024 21:52:35 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 03/31] Staging: rtl8192e: Rename variable CountryIeLen
Date: Tue, 14 May 2024 21:52:00 -0700
Message-Id: <20240515045228.35928-4-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240515045228.35928-1-tdavies@darkphysics.net>
References: <20240515045228.35928-1-tdavies@darkphysics.net>
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

