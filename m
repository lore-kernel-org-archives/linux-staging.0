Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEB5920DD2
	for <linux-staging@lists.linux.dev>; Tue, 21 May 2024 03:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716261446; cv=none; b=cBcTLXXnlT8JjFSjjFx/9t2ppo1RRN8IbIW19r4h8jX7HT6z0oWx4IfX9ykV4niBH9BntdM0QFNeLOc0sB44DQjN2gIcVljC0X0by52xWmBIEbFiJhY/HuRnjmGJojawfmZa/EKsLjqfFgCBQjT46xhmJAB7IJnlvSwcrSozR40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716261446; c=relaxed/simple;
	bh=wUKoaCTHzLDDjFbhF0PGI5yAQPN1+rFJl7SEuLinulY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=LK5Y0LAWdNBNlMlmT2kWBywO3WzVtdRgIEAo+JO2WxYBEeA8bcaO4PtPjPvSZ+Gak9FEzlYTXmh47lmY7gOhow1v+jSc3ep1lIAqlV4uBPugFjsSSJIM+Cjz9Yy01adCsfI9O+GPmIcIWX42/leS6D8maSPTlfiHIWKAk2px3s8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=XVLbTOxZ; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="XVLbTOxZ"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1eeabda8590so89516025ad.0
        for <linux-staging@lists.linux.dev>; Mon, 20 May 2024 20:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1716261443; x=1716866243; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dAeUQPv6s9JrE6X44M25yrVX3F0jSkau/eRXgFLNcZw=;
        b=XVLbTOxZlWRvSqfA4VyKyBndrUGczbPe5q1jBjlHEONfwEhab3+BxWABrUaghQ0pTw
         48s7RJZW+dm5uDMoxsV8bkFEC/a1siwBXflVXWcn3+OFy+wdQMXsziaL2u0UOc3/ENN2
         dqEDPPso49zIORuIyKi7sOZKB75z/LZVY2HhCaisJxqkXBxP6SsGhEWfNI06GVH7RPZB
         DGMmQ1gi28wbjgDgJm2Zl+/spm8Ut/uxuQDzk9ITYC9v7JGCbU37uQgSk+oW3fuLp8Ug
         4fVExe3Pg2PBjq0RXiSFzVEsoKb9hABU+j7vBT2y5t/t2dp7zqsuGQdYzXeuyxNZkw3z
         n8Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716261443; x=1716866243;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dAeUQPv6s9JrE6X44M25yrVX3F0jSkau/eRXgFLNcZw=;
        b=N14tczvfubH9X3AWEqLrIE5aiLk0ojJ1Is7cLYVM6HGg1PH8xWPCLBisIzVdIWu8LY
         EJPiJE15fBh6bHXk5yf13NoulAPMNn+YfKo9EzH7xM2vwfyDn5rH/mvPRFwldzIa9Wfs
         TIhirI2N/dnbRFw8x1dPjjRbaKkr4dtsE/DuOcSzTy6ylvZHeFsHNhKqcIqs/jsBIc5v
         rQ0qZ2s/XZ7z1olD5ytIJ6MuDXtyTKaJFed6k5Fk9hpDHzhmePVptjsQWcFwWHp480u0
         rG8M5FEJjqN1MlSma782KD78VWZhDU/bGCU7RDv1gIs/Zhqwy8SoiNvX2/p+mxMS38bc
         OI+A==
X-Forwarded-Encrypted: i=1; AJvYcCWznHlZJ8aouY1ESz3gEtZxAHeK9t3GDx8ajDD32ubVjhOyNAjKB/ddkleSuupuK2OxEvzZxsHIDcI3rpxrWRZQYSbWnRpAEWumBHgLcQ==
X-Gm-Message-State: AOJu0YxZSUGflE3R5cfpDGr5Z/6fFj5ys2lHii0KpbmwuBfJqzO8hZF4
	YSp6JtAhie/knAnwab1Af29MHlHUvxQu5iwJqzVUhh4VG46Ro52MqIrPOAtcy4Q=
X-Google-Smtp-Source: AGHT+IHszlUz6OA/dUOeyg8tjnmbeh5iEFUaZGSDgL5C2iBiVC1BxXHS4d2GbPVB6NFN5UfSrcXH+g==
X-Received: by 2002:a05:6a20:9f43:b0:1af:f514:97cb with SMTP id adf61e73a8af0-1aff5149931mr28164789637.8.1716261443132;
        Mon, 20 May 2024 20:17:23 -0700 (PDT)
Received: from lunchbox.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0bf31a93sm214885415ad.134.2024.05.20.20.17.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 May 2024 20:17:22 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com
Cc: dan.carpenter@linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH v2 02/31] Staging: rtl8192e: Rename variable CountryIeBuf
Date: Mon, 20 May 2024 20:16:49 -0700
Message-Id: <20240521031718.17852-3-tdavies@darkphysics.net>
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

Rename variable CountryIeBuf to country_ie_buf
to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
v2: No change.
 drivers/staging/rtl8192e/rtllib.h    | 2 +-
 drivers/staging/rtl8192e/rtllib_rx.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index 0809af3fd041..8a84d61e6912 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -950,7 +950,7 @@ struct rtllib_network {
 	struct rtllib_wmm_ac_param wmm_param[4];
 	u8 turbo_enable;
 	u16 CountryIeLen;
-	u8 CountryIeBuf[MAX_IE_LEN];
+	u8 country_ie_buf[MAX_IE_LEN];
 	struct bss_ht bssht;
 	bool broadcom_cap_exist;
 	bool realtek_cap_exit;
diff --git a/drivers/staging/rtl8192e/rtllib_rx.c b/drivers/staging/rtl8192e/rtllib_rx.c
index 4a0db2dfd5e9..dc0db6fade0f 100644
--- a/drivers/staging/rtl8192e/rtllib_rx.c
+++ b/drivers/staging/rtl8192e/rtllib_rx.c
@@ -2184,7 +2184,7 @@ static inline int rtllib_network_init(
 	network->SignalStrength = stats->SignalStrength;
 	network->RSSI = stats->SignalStrength;
 	network->CountryIeLen = 0;
-	memset(network->CountryIeBuf, 0, MAX_IE_LEN);
+	memset(network->country_ie_buf, 0, MAX_IE_LEN);
 	ht_initialize_bss_desc(&network->bssht);
 	network->flags |= NETWORK_HAS_CCK;
 
@@ -2343,7 +2343,7 @@ static inline void update_network(struct rtllib_device *ieee,
 	dst->turbo_enable = src->turbo_enable;
 
 	dst->CountryIeLen = src->CountryIeLen;
-	memcpy(dst->CountryIeBuf, src->CountryIeBuf, src->CountryIeLen);
+	memcpy(dst->country_ie_buf, src->country_ie_buf, src->CountryIeLen);
 
 	dst->bWithAironetIE = src->bWithAironetIE;
 	dst->ckip_supported = src->ckip_supported;
-- 
2.30.2

