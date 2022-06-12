Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D9E57C
	for <linux-staging@lists.linux.dev>; Sun, 12 Jun 2022 01:05:56 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id x5so3182718edi.2
        for <linux-staging@lists.linux.dev>; Sat, 11 Jun 2022 18:05:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Xf3xxKruGtbmVze7fmNKHffezaj9ivzSE6bQck9KXk4=;
        b=KZa5hs95tk4xuPi5omzfIiCe25kl4RpicZGbYc6qWnTrVyvYT10ZCLUM0bsG+haopC
         an7tgatAVZajnRDbMIMjFlzfJdQmTfcQNyzdSYo6/nHtdr9CUp1xcsmax4QhgETCRVH7
         gZBLovKRQyNwfHi3fHv+EOfq0U9lzqzXeHzhXARxyUxmlbac6CYmNy3Ml0LLyB6G4fG6
         VThOBxwumuMw6yy5Oh9M6HJdhOHdMN3mymI7ZR4Nqt0Uy9lAWAKewg1eVbtiEcMwBMw+
         sMEf9B3bM0283hemiG7BbC/l2fAAYlxdKpRuUa+XtXTPd5LOFy+1X6o82rVm+VPaJPMp
         btQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Xf3xxKruGtbmVze7fmNKHffezaj9ivzSE6bQck9KXk4=;
        b=LYgqw2YH/QMXfss6GbttEZzl1jqejEAtXtpFhjzNpCjOkzv8uSelaP6IEDAu/lJe38
         1McvvKI6oFcpkSBVnm0rdk7cfmjzbE96Ojoo7PIS2yLHcDOuv6Uyy2e1tv1+/LCQF33u
         n/XATojn+oT3MxGIiDlEWwN8+byX4ZrSNOerVgV1RgWP4CuSA1EoLVbOa5w77y6ApP/M
         69p+hxwxZgcpRndG0iEowDM8s/mjvRgIdjPLi3Zzgmk2i5AbHMN9jfiBMGlmMB/FhlQp
         lyF7m1z8H8+XjO//31MAqaqQ1U8a8YQ0ClKyQtFx4vnCTKEfm2OFHUgQKi4RCW2U3ReM
         zj5g==
X-Gm-Message-State: AOAM531/GnKArMm4raovDoQT0Y8EmI+r6gSV6T6eAgfqIDVwHhDVJpRM
	any3Y43HNs72jPlqAA5RqCSvbabRGfE=
X-Google-Smtp-Source: ABdhPJzJPsLWLqitnqe2/zQvb5WuLYIGuxoBS48AkngjTxNh4xNJRoNLFl/lsLrn1tLzw5yfejv9pg==
X-Received: by 2002:aa7:c054:0:b0:433:2d3b:10ed with SMTP id k20-20020aa7c054000000b004332d3b10edmr20914084edo.211.1654995954761;
        Sat, 11 Jun 2022 18:05:54 -0700 (PDT)
Received: from nam-dell.fritz.box ([2a02:8109:afbf:ed88:b802:84b6:a3f8:7c89])
        by smtp.gmail.com with ESMTPSA id u20-20020a509514000000b0042dd1d3d571sm2312297eda.26.2022.06.11.18.05.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jun 2022 18:05:54 -0700 (PDT)
From: Nam Cao <namcaov@gmail.com>
To: gregkh@linuxfoundation.org
Cc: phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Nam Cao <namcaov@gmail.com>
Subject: [PATCH 2/2] staging: r8188eu: replace FIELD_OFFSET with offsetof
Date: Sun, 12 Jun 2022 03:05:14 +0200
Message-Id: <9443ef83f565eafe1e4f348412772d4ab966093a.1654994517.git.namcaov@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1654994517.git.namcaov@gmail.com>
References: <cover.1654994517.git.namcaov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This driver defines FIELD_OFFSET which does the same as offsetof.
Replace this macro with offsetof.

Signed-off-by: Nam Cao <namcaov@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_mlme_ext.c   | 4 ++--
 drivers/staging/r8188eu/include/basic_types.h | 2 --
 drivers/staging/r8188eu/os_dep/ioctl_linux.c  | 4 ++--
 3 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme_ext.c b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
index 87bf37f33606..2be166abe99c 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme_ext.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
@@ -7072,7 +7072,7 @@ u8 createbss_hdl(struct adapter *padapter, u8 *pbuf)
 		/* clear CAM */
 		flush_all_cam_entry(padapter);
 
-		memcpy(pnetwork, pbuf, FIELD_OFFSET(struct wlan_bssid_ex, IELength));
+		memcpy(pnetwork, pbuf, offsetof(struct wlan_bssid_ex, IELength));
 		pnetwork->IELength = ((struct wlan_bssid_ex *)pbuf)->IELength;
 
 		if (pnetwork->IELength > MAX_IE_SZ)/* Check pbuf->IELength */
@@ -7129,7 +7129,7 @@ u8 join_cmd_hdl(struct adapter *padapter, u8 *pbuf)
 	pmlmeinfo->candidate_tid_bitmap = 0;
 	pmlmeinfo->bwmode_updated = false;
 
-	memcpy(pnetwork, pbuf, FIELD_OFFSET(struct wlan_bssid_ex, IELength));
+	memcpy(pnetwork, pbuf, offsetof(struct wlan_bssid_ex, IELength));
 	pnetwork->IELength = ((struct wlan_bssid_ex *)pbuf)->IELength;
 
 	if (pnetwork->IELength > MAX_IE_SZ)/* Check pbuf->IELength */
diff --git a/drivers/staging/r8188eu/include/basic_types.h b/drivers/staging/r8188eu/include/basic_types.h
index c4b08fb82200..0b71e2c6e41a 100644
--- a/drivers/staging/r8188eu/include/basic_types.h
+++ b/drivers/staging/r8188eu/include/basic_types.h
@@ -9,8 +9,6 @@
 
 typedef void (*proc_t)(void *);
 
-#define FIELD_OFFSET(s, field)	((ssize_t)&((s *)(0))->field)
-
 /* port from fw */
 /*  TODO: Macros Below are Sync from SD7-Driver. It is necessary
  * to check correctness */
diff --git a/drivers/staging/r8188eu/os_dep/ioctl_linux.c b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
index 1b09462ca908..2063ace8398f 100644
--- a/drivers/staging/r8188eu/os_dep/ioctl_linux.c
+++ b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
@@ -403,7 +403,7 @@ static int wpa_set_encryption(struct net_device *dev, struct ieee_param *param,
 
 		if (wep_key_len > 0) {
 			wep_key_len = wep_key_len <= 5 ? 5 : 13;
-			wep_total_len = wep_key_len + FIELD_OFFSET(struct ndis_802_11_wep, KeyMaterial);
+			wep_total_len = wep_key_len + offsetof(struct ndis_802_11_wep, KeyMaterial);
 			pwep = kzalloc(wep_total_len, GFP_KERNEL);
 			if (!pwep)
 				goto exit;
@@ -1593,7 +1593,7 @@ static int rtw_wx_set_enc(struct net_device *dev,
 	if (erq->length > 0) {
 		wep.KeyLength = erq->length <= 5 ? 5 : 13;
 
-		wep.Length = wep.KeyLength + FIELD_OFFSET(struct ndis_802_11_wep, KeyMaterial);
+		wep.Length = wep.KeyLength + offsetof(struct ndis_802_11_wep, KeyMaterial);
 	} else {
 		wep.KeyLength = 0;
 
-- 
2.25.1

