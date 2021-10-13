Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5628C2C89
	for <linux-staging@lists.linux.dev>; Wed, 13 Oct 2021 18:58:21 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id v17so11551307wrv.9
        for <linux-staging@lists.linux.dev>; Wed, 13 Oct 2021 11:58:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZX+m9eRP3G6qa3o26UuCwjfzdvb0rxacvbcUwg9LjVM=;
        b=0fraruSs5JA2w0zlm1r62hMvuaG/kbbnuWMCWFTQWqJsVmi2r/Ro+6EYSWtmqJvTYq
         w5ipymlSp5yAX+FxAGnY2hQnmmUxEbcoXoESQ5WNPIQIfRZ+4a56Kw5HTNsGol55NIJl
         gm/w8rVI5neU2OiqkPrOmgGoue0G36l2uL1ldpjo1qroSLzzoJ3P2+Zs7NQe4z30WCTu
         emnSgxxat5ShTB3byfnqT1/+C941aLMrH6T3LxFE/UWOZr6IRwSzRVtFAgLlZqgkFuXn
         G4NUol0ZVP7ugV6A6x0tSlFE51wGUDnjJnPsqvoqSXbtO7CEMQb18QzQOYhlSJyx3NXN
         1YeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZX+m9eRP3G6qa3o26UuCwjfzdvb0rxacvbcUwg9LjVM=;
        b=TBJ1Me1Rw59RUHp1WL638v8p0FPSM0Gn7kuTVjkfKeJXX8l3KIMYweYOyvi1GuTTIf
         D2jk1mB5Id3AvN96DCxW0MksdP7Pv6m2b98B+i2lDq4zyDV6+QBn36rPTqqxGSkwUiUq
         HqvHytUMZ0RTlrUYGQv2S4b64gWQrsTXg3R0Nfghk0Rg9x+OnU7/x5yB8gCTAZj/j//c
         QZRZB/fWJtta3viq858GynFYVIbv1/7+s6QxJwz2dODOpZ9kWol9pD1r84KGjLHPnoep
         FUDH2P+6rWNCohXz2xHHSKTyMv9ai4iy0R6f+IFBDNnTQjdN7rj54nKbW9KCcJBJiz/i
         nWMA==
X-Gm-Message-State: AOAM533x2rBYQ0kErOxinSW/+Ntd5Q7XMH3J1duvmYDXGa8v1U7iHO4y
	b+PtJ8hFmVjwWhiIyrhYZqdDFg==
X-Google-Smtp-Source: ABdhPJxS28AO2ivLhxy8BOINPOGg4Vely5WZFA0d6sD5YfIE+u2saP5/Q0HFdclbPDIcewy4i5gghQ==
X-Received: by 2002:a5d:6481:: with SMTP id o1mr1105102wri.60.1634151499697;
        Wed, 13 Oct 2021 11:58:19 -0700 (PDT)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id e8sm573059wrg.48.2021.10.13.11.58.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Oct 2021 11:58:19 -0700 (PDT)
From: Corentin Labbe <clabbe@baylibre.com>
To: mchehab@kernel.org,
	hverkuil@xs4all.nl,
	gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	mjpeg-users@lists.sourceforge.net,
	Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH v2 02/10] staging: media: zoran: use module_pci_driver
Date: Wed, 13 Oct 2021 18:58:04 +0000
Message-Id: <20211013185812.590931-3-clabbe@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211013185812.590931-1-clabbe@baylibre.com>
References: <20211013185812.590931-1-clabbe@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Simplify code by using module_pci_driver()

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 drivers/staging/media/zoran/zoran_card.c | 21 +--------------------
 1 file changed, 1 insertion(+), 20 deletions(-)

diff --git a/drivers/staging/media/zoran/zoran_card.c b/drivers/staging/media/zoran/zoran_card.c
index 3bc0e64f1007..f1465fbf98af 100644
--- a/drivers/staging/media/zoran/zoran_card.c
+++ b/drivers/staging/media/zoran/zoran_card.c
@@ -1314,23 +1314,4 @@ static struct pci_driver zoran_driver = {
 	.remove = zoran_remove,
 };
 
-static int __init zoran_init(void)
-{
-	int res;
-
-	res = pci_register_driver(&zoran_driver);
-	if (res) {
-		pr_err("Unable to register ZR36057 driver\n");
-		return res;
-	}
-
-	return 0;
-}
-
-static void __exit zoran_exit(void)
-{
-	pci_unregister_driver(&zoran_driver);
-}
-
-module_init(zoran_init);
-module_exit(zoran_exit);
+module_pci_driver(zoran_driver);
-- 
2.32.0

