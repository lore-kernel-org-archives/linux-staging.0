Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 646A229CA
	for <linux-staging@lists.linux.dev>; Tue, 26 Oct 2021 19:34:24 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id e4so129167wrc.7
        for <linux-staging@lists.linux.dev>; Tue, 26 Oct 2021 12:34:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZX+m9eRP3G6qa3o26UuCwjfzdvb0rxacvbcUwg9LjVM=;
        b=yTCQeaUgyQ77dr9b2Tas/r0wJ3HPcbupOrQjRBkua/PfAuEuXTXMwtxto/o3HU79is
         NmLl9oDzcOdghZbtMlbaHabKQ2UB3EAC63EGGX7nzfEttHH8JIuyEuu1m6pwU4Yxoy1S
         Tmqf/6fYkmrZXx2GePhaTP5vCWlzSUiTUKPOLVf+xkxmpXoqZSiyxfMcjG2kA8mQZr5W
         MDSLSvsLjpGFVthu/fU3iAmVWgXtm2cAmvGL/pGsZuS+9T3gCuAk9E5HaTJ8yYwZVbXv
         IU4NDVhcnr8XD+eekoSB5qnM4rOpYTcHQbfw1/mzq6kCVMQeXBNMWh0zWc7Nrqw5LaX+
         petQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZX+m9eRP3G6qa3o26UuCwjfzdvb0rxacvbcUwg9LjVM=;
        b=QHKceztPOI6YIaiXm9ZnrqJ7XjUr+rjVo3Io+ywM7zCaLEPyeTliFursrNGbMMaJxS
         pXirwbgXHaOdM3uQP3ZzChLGmKOVEq8dQh9ONhR+UVCTodvfZf32JmZ7vn+OOC0kLPkc
         bpoS7EfEZ0KcrmGm5YJoO+wqROIB40neSRuLtG2RfSRmVNGBiUjDgQq7AL6TXD9OGFgE
         9ku3JzBGYJiOOvuXaLHDYnfyDDhni3nv7nZNfoXyO8DkMeYpfOt2f3mrE8156Q0FMz7w
         CLDHcyYvlejmcTYz/Ggtcyv3xYP+EeV8Dbede8oa6o4iyYoM0YpHsyiQMLLBYD8Jmkvy
         AnNw==
X-Gm-Message-State: AOAM530YKxslSDELZBuxPOU4nlfGiRaVWfha47liKW+2tI+uuvMT5eC3
	Ft6ymqKODUXRiTfp4tJcj9Fn39Bb92190g==
X-Google-Smtp-Source: ABdhPJw3HDmUSQ8StzDpfTOvfI979TWeAuUk5h+MXHiF/2I1HBt1rTdwIYUJA+bXbYnM2R8M3B5XsA==
X-Received: by 2002:a5d:4b51:: with SMTP id w17mr35244771wrs.47.1635276862764;
        Tue, 26 Oct 2021 12:34:22 -0700 (PDT)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id s18sm17676123wrb.95.2021.10.26.12.34.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Oct 2021 12:34:22 -0700 (PDT)
From: Corentin Labbe <clabbe@baylibre.com>
To: mchehab@kernel.org,
	hverkuil@xs4all.nl,
	gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	mjpeg-users@lists.sourceforge.net,
	Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH v3 02/14] staging: media: zoran: use module_pci_driver
Date: Tue, 26 Oct 2021 19:34:04 +0000
Message-Id: <20211026193416.1176797-3-clabbe@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211026193416.1176797-1-clabbe@baylibre.com>
References: <20211026193416.1176797-1-clabbe@baylibre.com>
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

