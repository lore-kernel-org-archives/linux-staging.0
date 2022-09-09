Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA2F07E3
	for <linux-staging@lists.linux.dev>; Fri,  9 Sep 2022 10:07:43 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id gh9so2815414ejc.8
        for <linux-staging@lists.linux.dev>; Fri, 09 Sep 2022 03:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=d0rkg1Wut40eiym1yldjAgKe+UB9rsjZIgZDS1zS8Og=;
        b=TPjJ6gb6kEtf88JMwg1KzNxfCwiR8/s2cVlZ271QMlPhrKPmINFT3USrixhDu6YCoI
         2/StKZnkBqo7nt6pFPqO/Th75YmDp/wiEsmJQob5nSs2VrEmh/OjvJVaT0sbHevghCPL
         yNilw3cUqRwzY44SQOD0mlwD/vUVLtwM9XLxPmRVqyhPlH9ehw1q/lB9cZ3lY/yHK1+F
         c3L3aOqGRgGjPzfYuHETnoyptz0XwcsjfnUqKmDSmFjpaZNUefVf1sJkt/ImjBEwTfMs
         me/1QJqYJX9U4XnjwsSmhvy3yl9X4v2ijghlsLFcQwX27nfZw2++MztTZhSYcMvLa7/h
         Bk1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=d0rkg1Wut40eiym1yldjAgKe+UB9rsjZIgZDS1zS8Og=;
        b=mVkFXHAPrWFAs3WQ6dQ5E6EV8amyYeeynA9RtWsiYkQ0ZXRAj0P+4YFhTRY7sfNS3x
         4YIXeltM7KJbE/gp9n6ef4Oim8u91i1RIY20cBDIgWZmrAHybFJGjOD7DIh4vtUH4/NR
         R951BkJLpXj9EZ9KoIa1ble+DIqVtCCebskxT5qRc3xFY6uaE4YfgjJR9YlNM6Ur1Xqu
         AUGH3MRGmJ4kuDAsI0IzAyXWvWewXIMdB/eFQnvucdIWgIlDlOBDBqcGyV++9fTI/NHG
         bbCk+CQFX2L/GJeUqZVWvoW9WtGnXUx3Z8pvAGXIzlao6U+FWSYziROVkU6yTn1ptG+l
         ClRg==
X-Gm-Message-State: ACgBeo1Iry4oRqr/VoE234tDyq96+Ok+2MSaspW7blzirLZAS3ajZo/P
	MMu03tJxIg7LB6Y5lU9gJzA=
X-Google-Smtp-Source: AA6agR5kUAD0FvJcUodcBXnZvqfYdN7vGbvmaFWosgjKQ/z+limR4Mqb9s/UoQmlIHT4GNVI0UqAYA==
X-Received: by 2002:a17:906:216:b0:711:f623:8bb0 with SMTP id 22-20020a170906021600b00711f6238bb0mr9533387ejd.174.1662718062233;
        Fri, 09 Sep 2022 03:07:42 -0700 (PDT)
Received: from localhost.localdomain ([131.155.244.90])
        by smtp.gmail.com with ESMTPSA id 2-20020a170906210200b00715a02874acsm82283ejt.35.2022.09.09.03.07.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Sep 2022 03:07:41 -0700 (PDT)
From: Nam Cao <namcaov@gmail.com>
To: forest@alittletooquiet.net,
	gregkh@linuxfoundation.org
Cc: namcaov@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH] staging: vt6655: remove unnecessary null check
Date: Fri,  9 Sep 2022 12:06:51 +0200
Message-Id: <20220909100650.44609-1-namcaov@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove null check for priv->tx0_bufs, because it can never be null at
this point.

Signed-off-by: Nam Cao <namcaov@gmail.com>
---
 drivers/staging/vt6655/device_main.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/vt6655/device_main.c b/drivers/staging/vt6655/device_main.c
index 3397c78b975a..0d8876278953 100644
--- a/drivers/staging/vt6655/device_main.c
+++ b/drivers/staging/vt6655/device_main.c
@@ -586,13 +586,12 @@ static void device_free_rings(struct vnt_private *priv)
 			  priv->opts.tx_descs[1] * sizeof(struct vnt_tx_desc),
 			  priv->aRD0Ring, priv->pool_dma);
 
-	if (priv->tx0_bufs)
-		dma_free_coherent(&priv->pcid->dev,
-				  priv->opts.tx_descs[0] * PKT_BUF_SZ +
-				  priv->opts.tx_descs[1] * PKT_BUF_SZ +
-				  CB_BEACON_BUF_SIZE +
-				  CB_MAX_BUF_SIZE,
-				  priv->tx0_bufs, priv->tx_bufs_dma0);
+	dma_free_coherent(&priv->pcid->dev,
+			  priv->opts.tx_descs[0] * PKT_BUF_SZ +
+			  priv->opts.tx_descs[1] * PKT_BUF_SZ +
+			  CB_BEACON_BUF_SIZE +
+			  CB_MAX_BUF_SIZE,
+			  priv->tx0_bufs, priv->tx_bufs_dma0);
 }
 
 static int device_init_rd0_ring(struct vnt_private *priv)
-- 
2.25.1

