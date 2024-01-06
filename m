Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 705C26FDD
	for <linux-staging@lists.linux.dev>; Sat,  6 Jan 2024 05:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="Ml5fTyhc"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-6d9e62ff056so263516b3a.1
        for <linux-staging@lists.linux.dev>; Fri, 05 Jan 2024 21:56:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1704520574; x=1705125374; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=StnyJgFOT64M/Chcxu97Xz0SNkYawN5oNQ23pftyJ9s=;
        b=Ml5fTyhcRP+mbqkiAHl8YVDWE+diT0vsJfrW+/h0Z0DhzqRW6MvbuZJcfFyblyqcW8
         3zIPDy2IGkCLOrl61kLqRt1+vH8OTRQeeZvGNX8dnZEc2YUlkiifOM/Wy7XBxX3odocN
         3PE5h9DR6a8lkcxK3jrPZgSvr/W5SymoTUI1u259DR/8Ujgyq5owBEOZnJYXL7hM11//
         GgaEanrtwq4SosEacPsAjUW7o28VEwjPemkpncEdONnxapOvQsPD5mhgoQNoOKfanfiC
         KTrXm2OljnCkQ10wSsQcRk50HAK6+XIc5F938sX69dTxbWY8l1JC4MDnIni/L9fbMjMp
         sIdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704520574; x=1705125374;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=StnyJgFOT64M/Chcxu97Xz0SNkYawN5oNQ23pftyJ9s=;
        b=rTSYYIL9U4ksybJZcOUIUmoq+39yR7iX514XjCziwdX4YCoXK20a8zNJZovjLroYOn
         hTLpBCSbr/yow3QVNYfyFjv7ooSGArJ6f7VpUM7ApBSpVKYSqr86l0EFMeqd8hZvoDk1
         /NHxt3KCwlbGL/UjRRtFPqr6ibXsFQb34UFXcFSArsAn4Tom4SlZbxSOi/VGfOv+DwJ/
         ADrjYxqwNk+RakS8mAGLWrwVQX/86gcs8d1QAg2hGY+eK2XSD2eAvZ+OA4p9TBPlfDz1
         zv8YEJu43skz/jG1GXnLN1WP/DkqCyj81d5I/IwpiByXbA85Sp1rZvbs3h/LweUSZEwe
         H6wA==
X-Gm-Message-State: AOJu0Yyju++Lvso987Uz8EEzSlN0j1cL5cMrW+hak6B0ForNzq47gtsH
	CG9ZZ5WWrzm60ntpLrXErMfgeaKfRhx3RQ==
X-Google-Smtp-Source: AGHT+IGHYzKL2jjs5bDEPHvlZnNLlDRAvqneSLlW81rUavWMoEaQa5Y5vl6ZtMdPyhiTa7dNbPhKyQ==
X-Received: by 2002:a05:6a00:4e57:b0:6d9:b320:94c9 with SMTP id gu23-20020a056a004e5700b006d9b32094c9mr540868pfb.33.1704520573848;
        Fri, 05 Jan 2024 21:56:13 -0800 (PST)
Received: from oatmeal.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id y29-20020a056a00181d00b006d99d986624sm2280873pfa.151.2024.01.05.21.56.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jan 2024 21:56:13 -0800 (PST)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 07/21] Staging: rtl8192e: Rename variable bSupportNmode
Date: Fri,  5 Jan 2024 21:55:42 -0800
Message-Id: <20240106055556.430948-8-tdavies@darkphysics.net>
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

Rename variable bSupportNmode to support_nmode to fix checkpatch
warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtllib_softmac.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib_softmac.c b/drivers/staging/rtl8192e/rtllib_softmac.c
index 08ff55c2f1be..85e6e727bec7 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac.c
@@ -1648,7 +1648,7 @@ static void rtllib_rx_auth_resp(struct rtllib_device *ieee, struct sk_buff *skb)
 	int errcode;
 	u8 *challenge;
 	int chlen = 0;
-	bool bSupportNmode = true, bHalfSupportNmode = false;
+	bool support_nmode = true, bHalfSupportNmode = false;
 
 	errcode = auth_parse(ieee->dev, skb, &challenge, &chlen);
 
@@ -1666,16 +1666,16 @@ static void rtllib_rx_auth_resp(struct rtllib_device *ieee, struct sk_buff *skb)
 		if (!(ieee->ht_info->iot_action & HT_IOT_ACT_PURE_N_MODE)) {
 			if (!ieee->GetNmodeSupportBySecCfg(ieee->dev)) {
 				if (is_ht_half_nmode_aps(ieee)) {
-					bSupportNmode = true;
+					support_nmode = true;
 					bHalfSupportNmode = true;
 				} else {
-					bSupportNmode = false;
+					support_nmode = false;
 					bHalfSupportNmode = false;
 				}
 			}
 		}
 		/* Dummy wirless mode setting to avoid encryption issue */
-		if (bSupportNmode) {
+		if (support_nmode) {
 			ieee->set_wireless_mode(ieee->dev,
 					      ieee->current_network.mode);
 		} else {
-- 
2.39.2

