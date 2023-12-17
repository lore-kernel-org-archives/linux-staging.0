Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8246E4B5B2
	for <linux-staging@lists.linux.dev>; Sun, 17 Dec 2023 23:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="BicVuT/b"
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-591a6f1385eso1599964eaf.0
        for <linux-staging@lists.linux.dev>; Sun, 17 Dec 2023 15:55:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1702857327; x=1703462127; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CQyqLl2j3iLvLgdglWKcDF464BuHW+ufozKe2II4NWc=;
        b=BicVuT/b4C39QRzOqj5BhRaFJnkr3qwT+B8bpPH20LsEo2FsWzNxy9gwVFO9NFPksZ
         1RraGz5S7+WQHDNV1Ao3OfiVoIuDmIE4tz18S4zgbaIf4Du/17EWA8MWq0JzoX8kPuh9
         uiBHVc05CtX92i67O41FveTYw+AnOhBMtIod7CjgDhq/D7uZik9qduCSWBtDPG1nWWWp
         DeHFgOh5uhx5sjh+GcPdCfY2sdcPVppnCoaoNM57e4mMJPYhgvND9OVc6Bph71uuUVSD
         M1+lhiAW/ZJcl5bu4k2HIgj4/gJPM2ATrt74T0yVpPD1rI8F4eUbZC3UjXKjZB0gA6As
         gVHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702857327; x=1703462127;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CQyqLl2j3iLvLgdglWKcDF464BuHW+ufozKe2II4NWc=;
        b=aDOktCeWI3JPKgKg+XTFCK7r5oBNrSp9tZVcbGSe2s4unsp0cj4CH1b+QnePo2R7PA
         SONaAtMMoviv3WDdAAI/QrxtFGyfIGeChSRrIZqjjlh3ElBZUHj+egK7U0QJBL+73BcH
         sxhD3jy/KIEbgLiwaN0X1hgDQaOYNRHTK3nkvq6E9V/aEzjsYbnk2uZzeMjdq8BdkP9v
         vhOhnp7vFXFzA1uOdijtPGqWjA2zDfuYM0yOHKwyDJXPH/27kHYcWg/RrJxRQrJyzoI8
         in6kKM5goiZvewRrozrzrx1aDWfZm3iFqHn8Rd+RojTb8C4cNWT9DVp+Gkp/EHr6tdNo
         F4rA==
X-Gm-Message-State: AOJu0YwcCXHN3ZiM8No3AERXhRPXy+KhkUQuvmD5JvyBNw/7gJMVynhl
	irvqkprZk1gIZ4gsNJ1qEtpQXQ==
X-Google-Smtp-Source: AGHT+IH1/iDKHIOawiUcbaHza/A6Vm6/Ocp+IYfmYobaksQrUQHzUGiA5K0lhGSEfy1ZtFqAsZyMXw==
X-Received: by 2002:a05:6358:419d:b0:170:4168:8b91 with SMTP id w29-20020a056358419d00b0017041688b91mr17715132rwc.24.1702857327426;
        Sun, 17 Dec 2023 15:55:27 -0800 (PST)
Received: from oatmeal.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id f11-20020a17090aec8b00b0028ae8284840sm9036176pjy.10.2023.12.17.15.55.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Dec 2023 15:55:26 -0800 (PST)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 4/6] Staging: rtl8192e: Rename variable pDelBaParamSet
Date: Sun, 17 Dec 2023 15:55:18 -0800
Message-Id: <20231217235520.30377-5-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231217235520.30377-1-tdavies@darkphysics.net>
References: <20231217235520.30377-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable pDelBaParamSet to del_ba_param_set to fix checkpatch
warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtl819x_BAProc.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_BAProc.c b/drivers/staging/rtl8192e/rtl819x_BAProc.c
index fd0149d3f717..2fd54312c04f 100644
--- a/drivers/staging/rtl8192e/rtl819x_BAProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_BAProc.c
@@ -402,7 +402,7 @@ int rtllib_rx_ADDBARsp(struct rtllib_device *ieee, struct sk_buff *skb)
 int rtllib_rx_DELBA(struct rtllib_device *ieee, struct sk_buff *skb)
 {
 	struct ieee80211_hdr_3addr *delba = NULL;
-	union delba_param_set *pDelBaParamSet = NULL;
+	union delba_param_set *del_ba_param_set = NULL;
 	u8 *dst = NULL;
 
 	if (skb->len < sizeof(struct ieee80211_hdr_3addr) + 6) {
@@ -427,17 +427,17 @@ int rtllib_rx_DELBA(struct rtllib_device *ieee, struct sk_buff *skb)
 #endif
 	delba = (struct ieee80211_hdr_3addr *)skb->data;
 	dst = (u8 *)(&delba->addr2[0]);
-	pDelBaParamSet = (union delba_param_set *)&delba->seq_ctrl + 2;
+	del_ba_param_set = (union delba_param_set *)&delba->seq_ctrl + 2;
 
-	if (pDelBaParamSet->field.initiator == 1) {
+	if (del_ba_param_set->field.initiator == 1) {
 		struct rx_ts_record *ts;
 
 		if (!rtllib_get_ts(ieee, (struct ts_common_info **)&ts, dst,
-			   (u8)pDelBaParamSet->field.tid, RX_DIR, false)) {
+			   (u8)del_ba_param_set->field.tid, RX_DIR, false)) {
 			netdev_warn(ieee->dev,
 				    "%s(): can't get TS for RXTS. dst:%pM TID:%d\n",
 				    __func__, dst,
-				    (u8)pDelBaParamSet->field.tid);
+				    (u8)del_ba_param_set->field.tid);
 			return -1;
 		}
 
@@ -446,7 +446,7 @@ int rtllib_rx_DELBA(struct rtllib_device *ieee, struct sk_buff *skb)
 		struct tx_ts_record *ts;
 
 		if (!rtllib_get_ts(ieee, (struct ts_common_info **)&ts, dst,
-			   (u8)pDelBaParamSet->field.tid, TX_DIR, false)) {
+			   (u8)del_ba_param_set->field.tid, TX_DIR, false)) {
 			netdev_warn(ieee->dev, "%s(): can't get TS for TXTS\n",
 				    __func__);
 			return -1;
-- 
2.39.2

