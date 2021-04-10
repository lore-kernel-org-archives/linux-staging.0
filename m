Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3704C71
	for <linux-staging@lists.linux.dev>; Sat, 10 Apr 2021 09:22:58 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id l4so12271244ejc.10
        for <linux-staging@lists.linux.dev>; Sat, 10 Apr 2021 02:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZSnOFIesKBCVdD0WKupHufVEiQpga/uUTH6Sx1Oc/oc=;
        b=X5RFo/3GVWmXIAANlMsEGxClbqtDEvC6CCQpZgHR/1hHEnFzQYYYOJlDyMr2YMS3mL
         2MyA4DVWfY19rAuM76nUaCBmr7H6WL9+FrRR+u/caHi2yZ8rmg4Qe9H5fnSRGNTvlKMX
         pzt0fiJNNBdQaeYDMnIDArz5w6eGZN6WwOmAZL023xpxVOYew+fNv2IRj5xANvz3lz6F
         RYEHb3bGpP7ZhG8OeDB2UMNjh3p6yyuoOFHX4qS5A8A6078ZvKJTNvUH9vyY+H07Osi3
         tQ5BLQ+jBt/FmkpkqmuitZt/Agp+n9i1AD2RnGPUx4LB6akfDbYgSVuIwRSXjVX93sMf
         loRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZSnOFIesKBCVdD0WKupHufVEiQpga/uUTH6Sx1Oc/oc=;
        b=N7Zs4jiMll4XHNt5WqizCei5ZRx1PiiWfnSITjq04xF12MHtPp9bmIa6xjUSfmJkzG
         KxbUiuTTrjjVP39ygnBciPyJ2ROw3q9SSrWnQoN3XYJ4WgQsZUfNjbPKB/e6g2gR413j
         6oT5ZY+X39N2BOBtjJlcUri+fNtCRQKFh+1N0A5X0Ch64I3znMTXdT9rxwPb/kz9HgyP
         Er2MQEv2MY6BxiDUExZVLLgRw0WxNXV6bFNf1mEOHyDojsmxvosdiyGKiFzHN3pMulQp
         WNeW03dpDQMLlnk9MBeAM3TXncqOKV5/V4ZHKZlL4IiWfvCw/N5ep1SPcpumEN6M1e6o
         XEqA==
X-Gm-Message-State: AOAM531UCsoKCu7Jr9IpspPz5zF6bUox86y9vf3hqQeX1ztV0HmmPRL4
	+FFT5gY7zzMhTXW91pmwK7o=
X-Google-Smtp-Source: ABdhPJxIMqYxr5oClj3WIN/kzVKrPcI1JKNkqCdpWK0mhvNgtmYXuwTYAcOdQNZ7zrnvfX5gOWlwiA==
X-Received: by 2002:a17:907:d09:: with SMTP id gn9mr18916239ejc.538.1618046576868;
        Sat, 10 Apr 2021 02:22:56 -0700 (PDT)
Received: from localhost.localdomain (host-95-237-55-30.retail.telecomitalia.it. [95.237.55.30])
        by smtp.gmail.com with ESMTPSA id a22sm2801624edu.14.2021.04.10.02.22.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Apr 2021 02:22:56 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>,
	outreachy-kernel@googlegroups.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Subject: [Outreachy kernel] [PATCH 3/4] staging: rtl8723bs: core: Remove an unused variable
Date: Sat, 10 Apr 2021 11:22:31 +0200
Message-Id: <20210410092232.15155-4-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210410092232.15155-1-fmdefrancesco@gmail.com>
References: <20210410092232.15155-1-fmdefrancesco@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Delete local variable "u8 sec_idx" because it is declared and
initialised, but never used.

Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_ieee80211.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
index 2af66a18200d..3fd8a4261ea2 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
@@ -628,7 +628,7 @@ int rtw_get_wapi_ie(u8 *in_ie, uint in_len, u8 *wapi_ie, u16 *wapi_len)
 
 void rtw_get_sec_ie(u8 *in_ie, uint in_len, u8 *rsn_ie, u16 *rsn_len, u8 *wpa_ie, u16 *wpa_len)
 {
-	u8 authmode, sec_idx;
+	u8 authmode;
 	u8 wpa_oui[4] = {0x0, 0x50, 0xf2, 0x01};
 	uint	cnt;
 
@@ -636,8 +636,6 @@ void rtw_get_sec_ie(u8 *in_ie, uint in_len, u8 *rsn_ie, u16 *rsn_len, u8 *wpa_ie
 
 	cnt = (_TIMESTAMP_ + _BEACON_ITERVAL_ + _CAPABILITY_);
 
-	sec_idx = 0;
-
 	while (cnt < in_len) {
 		authmode = in_ie[cnt];
 
-- 
2.31.1

