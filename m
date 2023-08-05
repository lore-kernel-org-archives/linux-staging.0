Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 256AD1FDD
	for <linux-staging@lists.linux.dev>; Sat,  5 Aug 2023 07:51:25 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-99c10ba30afso838083666b.1
        for <linux-staging@lists.linux.dev>; Sat, 05 Aug 2023 00:51:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691221883; x=1691826683;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Qo01VZv46WbWZeQUoDu+eNXSK4QNZCobvRPShRBmW3A=;
        b=eFa/+pdZy12eq7uhOk6oj8lqvgCn7Ccc2eymJdN9wZhYSADZd8x6/6x2r1uWtvr275
         nyWcYMIKSTfIBpD31rf1i1b8J5jyywnbJeRYabxqSCY3j4Y3ndQZmv3frI4wf5/7f54x
         oPSjlE3KIgZ59NjdIlXI/XvfMMOrxlM8gGh+LfYqQHR3qkSBHrL9XQR8wwHYQyYUlYoA
         dPuQP3yA8Fqb8Dd5vbDrbOzpO1uTVyd3cDeOMNRQTeAlpzW52ysHL/SNGq6b65iJj2MT
         wGTflgu6ROT5KHYPu0mIZKZn1s1o51tdEzuv71ijYEjyJ46xFD+a3oHdg3Akhf7bYqMj
         C3yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691221883; x=1691826683;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qo01VZv46WbWZeQUoDu+eNXSK4QNZCobvRPShRBmW3A=;
        b=SSMezJdtFK5f3V9v7NQBztbKWmH8+k3JEt2OjozHOS5eKirDKxg/qc66ECbMYWwr8h
         s0ErXY+LFmyDHkGiSKbCrXNt+ihHUgfucsTZa/aj3bs8ipxGUQ6KoLi+t6R2+APq8nyt
         8h1mi+8BlDGXLyFTKD7MEZWUTy9mHlEpmw8dcbXb+a7bSV2rkMsMurcLOU7k1MUqISRV
         SHBdKjI2LjUnso/kjVhYuUA6nqc7YIoxglHN11vlbAzOCCMmUHTZdTZi468J8NWvzx/b
         WAI6ZhndLFmLEV8w3zgChkjz0dDNFeqXWM29jliTObnA239xiSJ/ZeqXtiQ05GBd34ip
         8uQg==
X-Gm-Message-State: AOJu0Yy2jZxADBqbCD/LaiqLUUS3JqZTVmAJSI+tLls/76hoA3FepYUC
	0k3LkCdEYlpiLvDc/w8Weow=
X-Google-Smtp-Source: AGHT+IEdLfKGC4Ymsl5AtF+aEqvdXaiMMHCh98KsjWyPo5aFKy+g6+j686PwFwGNtNXMIIoJq8sAzg==
X-Received: by 2002:a17:907:7f91:b0:99c:572:c0e4 with SMTP id qk17-20020a1709077f9100b0099c0572c0e4mr2255590ejc.7.1691221883217;
        Sat, 05 Aug 2023 00:51:23 -0700 (PDT)
Received: from localhost.localdomain ([95.90.187.185])
        by smtp.gmail.com with ESMTPSA id o17-20020a17090611d100b0099bd0b5a2bcsm2379716eja.101.2023.08.05.00.51.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Aug 2023 00:51:23 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: philipp.g.hortmann@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH] staging: rtl8192e: prefer strscpy over strncpy
Date: Sat,  5 Aug 2023 09:51:14 +0200
Message-ID: <20230805075114.15186-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.41.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace strncpy with strscpy in two places where the destination buffer
should be NUL-terminated. Found by checkpatch.

WARNING: Prefer strscpy, strscpy_pad, or __nonstring over strncpy - see: https://github.com/KSPP/linux/issues/90

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/rtl8192e/rtllib_softmac.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib_softmac.c b/drivers/staging/rtl8192e/rtllib_softmac.c
index 0e52b207942d..bd19d6a2ce41 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac.c
@@ -1564,7 +1564,7 @@ inline void rtllib_softmac_new_net(struct rtllib_device *ieee,
 				    (!strncmp(ieee->current_network.ssid,
 				    net->hidden_ssid, net->hidden_ssid_len));
 			if (net->hidden_ssid_len > 0) {
-				strncpy(net->ssid, net->hidden_ssid,
+				strscpy(net->ssid, net->hidden_ssid,
 					net->hidden_ssid_len);
 				net->ssid_len = net->hidden_ssid_len;
 				ssidbroad = 1;
@@ -2431,7 +2431,7 @@ static void rtllib_start_master_bss(struct rtllib_device *ieee)
 	ieee->assoc_id = 1;
 
 	if (ieee->current_network.ssid_len == 0) {
-		strncpy(ieee->current_network.ssid,
+		strscpy(ieee->current_network.ssid,
 			RTLLIB_DEFAULT_TX_ESSID,
 			IW_ESSID_MAX_SIZE);
 
-- 
2.41.0

