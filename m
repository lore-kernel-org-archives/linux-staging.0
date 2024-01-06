Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9554310A02
	for <linux-staging@lists.linux.dev>; Sat,  6 Jan 2024 05:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="mQbqnwMd"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-6d9b37f4804so810076b3a.1
        for <linux-staging@lists.linux.dev>; Fri, 05 Jan 2024 21:56:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1704520584; x=1705125384; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jwfwhIccyziHiwo66eg7faLZcAMdjGptODSVe+nyh+Q=;
        b=mQbqnwMdvfEeNGDXhzy+dt4frVwlq/Yg8SBNj2pt1wUbVhwXUFIEe9kzV5byIZTvHG
         9vC6hVnPxOY7q0UNmzcTqxD25RsAm6Rl1I90CtQARa3O6HXn8+gXqCgZc/Vott+FVkK8
         C/6bWNq8seBs7z9Yk3HcucL3inEc245X7WdKDWyOMEbwlIzMVcifUdaZX29OztPqZCWG
         lJ3FvCM5yGMUHX2dnXwdY23JLbWRbnVu8THDWQ7Zg1l61Nv5ZHjScvBfpyrCWjW4vdFR
         XZnn3O/xnCMOkiLhHtEls1cVLOc3KWIWNJSXYngI0pawhM9haNvA8kmpLY75v5AH2Umd
         i/JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704520584; x=1705125384;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jwfwhIccyziHiwo66eg7faLZcAMdjGptODSVe+nyh+Q=;
        b=rbEiVkdit7TmCQUvIGx+F5sBQ99fjt5IJHxtXodfwDokHRDCol6znN9/E/QUGlxdXF
         6M8c6/VogOgIKFUFnppAJixIQN0QS0CyI+oTN63yiV9W/pRYIOISrS5BrcSFR0cL3H5h
         UEIkT0DEIK+5xD3vIOD2lkL0TKpS6M2Z+ZSVHOeso8dfRUq1vPjKlTtTdBZ1anpHgqnW
         ki120NSsSUGK1y5aRJ9IxZg61zOXuZITQ3jxVm0uslIn/yuto1egxBqa0uJCEGEXXR5F
         bwIxxRGyJk7ZnbgajXqp1FT1meOmZtAoK4yJ2z9CgsmXqBtbC5WSmKWVKA6HY8AJrAVi
         pAkw==
X-Gm-Message-State: AOJu0YzSsKK0ToTUMRGRfT71M8Yy8m45/MFAxvb6CxCcSvdceP1zpLoC
	ZPE+FVZE6QzCjbFv1ZUXtJ6VTDNOrifzHg==
X-Google-Smtp-Source: AGHT+IHLv+e/knL2B/INmeZsc8iZq7Ok/BFetW23w2eIwIYNTqywnr9LhR0sSs0Xl/U/d6mSbtaKEA==
X-Received: by 2002:a05:6a00:464c:b0:6da:c207:a2c7 with SMTP id kp12-20020a056a00464c00b006dac207a2c7mr4692549pfb.15.1704520583941;
        Fri, 05 Jan 2024 21:56:23 -0800 (PST)
Received: from oatmeal.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id y29-20020a056a00181d00b006d99d986624sm2280873pfa.151.2024.01.05.21.56.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jan 2024 21:56:23 -0800 (PST)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 18/21] Staging: rtl8192e: Rename variable bHalfSupportNmode
Date: Fri,  5 Jan 2024 21:55:53 -0800
Message-Id: <20240106055556.430948-19-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240106055556.430948-1-tdavies@darkphysics.net>
References: <20240106055556.430948-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable bHalfSupportNmode to half_support_nmode to fix checkpatch
warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtllib_softmac.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib_softmac.c b/drivers/staging/rtl8192e/rtllib_softmac.c
index b422ffbf0cbc..5305486c9594 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac.c
@@ -1648,7 +1648,7 @@ static void rtllib_rx_auth_resp(struct rtllib_device *ieee, struct sk_buff *skb)
 	int errcode;
 	u8 *challenge;
 	int chlen = 0;
-	bool support_nmode = true, bHalfSupportNmode = false;
+	bool support_nmode = true, half_support_nmode = false;
 
 	errcode = auth_parse(ieee->dev, skb, &challenge, &chlen);
 
@@ -1667,10 +1667,10 @@ static void rtllib_rx_auth_resp(struct rtllib_device *ieee, struct sk_buff *skb)
 			if (!ieee->GetNmodeSupportBySecCfg(ieee->dev)) {
 				if (is_ht_half_nmode_aps(ieee)) {
 					support_nmode = true;
-					bHalfSupportNmode = true;
+					half_support_nmode = true;
 				} else {
 					support_nmode = false;
-					bHalfSupportNmode = false;
+					half_support_nmode = false;
 				}
 			}
 		}
@@ -1684,7 +1684,7 @@ static void rtllib_rx_auth_resp(struct rtllib_device *ieee, struct sk_buff *skb)
 		}
 
 		if ((ieee->current_network.mode == WIRELESS_MODE_N_24G) &&
-		    bHalfSupportNmode) {
+		    half_support_nmode) {
 			netdev_info(ieee->dev, "======>enter half N mode\n");
 			ieee->bHalfWirelessN24GMode = true;
 		} else {
-- 
2.39.2

