Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A51503FDD
	for <linux-staging@lists.linux.dev>; Fri,  3 Sep 2021 19:15:56 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id k20-20020a05600c0b5400b002e87ad6956eso214534wmr.1
        for <linux-staging@lists.linux.dev>; Fri, 03 Sep 2021 12:15:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZX+m9eRP3G6qa3o26UuCwjfzdvb0rxacvbcUwg9LjVM=;
        b=Ns2hVXrhoznNB3oQH1t3+j6ATt0VKG0o6PldIrMPznDbonpNc1JD3nxHMg2SOs8UB8
         BEJjTrpy4wiOEyUr11OotV8A6rA4sifBneYuht28Gc5LpQI9C+bPdJBSE6ikH5bmDNGw
         cqzxmpIGpbK7/VhLW70smCjFmbueWXY/fc7MfM+Yo1sG39GmR9+QMyasxlMaKklG5Fa9
         YKT09M1sYE4rW2rJLeVh/AkKNItUQk636prFyQ7ozincLTr+iQbEo9cuWtfCqbFvC++B
         trzuWRKuU4MdJ04uS0RxcaGjecHNZL6OGlx33M5+rYVeDG0ngluExiFl0ZClBTh/zNXG
         0hMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZX+m9eRP3G6qa3o26UuCwjfzdvb0rxacvbcUwg9LjVM=;
        b=CYuTXlabGTabssVb8zk8Yzs+dIr+p9WZPscz06yzw73r1pB/cVT9gOBUfsws68vCx7
         vXvZLxJfZGgaColLtjgKRBiZ3RGXT7RlcAy3ZwlAMQA957mnSINvjDOHxqQGR6oex9dH
         WXmO1ZsfXn6MgzknRgFPHMvcKolB6GSyCNhg5NFetAldsrb4hQ9LiQmE6o/FJM1xc+d+
         olUhXKIWpGOUKgZWLLFtby7jA0oPYIW+ucnA1b9OEXu4r+B2jU47lKkAQqWoyvG6QZF7
         qTd+aBYX9fksNJPHLeVcYnI30EO8sMe+kaxw1M6eWbgvD8tnB5xb5fe4dF69n4i0yYGp
         hlcw==
X-Gm-Message-State: AOAM533MWTZpzuIIL1b15z9ZrvdJynFzSmgEOWYgJBL1ZRsyFmbEjTUM
	4tVDEeR1Y7nPMfeoWlSYnZgaSw==
X-Google-Smtp-Source: ABdhPJxE0dUX5u4RNf/Wx18X+2EXKv90xIdKm7MsrBaO5GUKwN6yqejEQKaf0pkgyJ7eVksRjDUa2Q==
X-Received: by 2002:a05:600c:acd:: with SMTP id c13mr327456wmr.28.1630696555125;
        Fri, 03 Sep 2021 12:15:55 -0700 (PDT)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id a133sm253397wme.5.2021.09.03.12.15.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Sep 2021 12:15:54 -0700 (PDT)
From: Corentin Labbe <clabbe@baylibre.com>
To: gregkh@linuxfoundation.org,
	mchehab@kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	mjpeg-users@lists.sourceforge.net,
	Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH 2/8] staging: media: zoran: use module_pci_driver
Date: Fri,  3 Sep 2021 19:15:34 +0000
Message-Id: <20210903191540.3052775-3-clabbe@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210903191540.3052775-1-clabbe@baylibre.com>
References: <20210903191540.3052775-1-clabbe@baylibre.com>
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

