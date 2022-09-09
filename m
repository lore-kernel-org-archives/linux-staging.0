Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCC324A02
	for <linux-staging@lists.linux.dev>; Fri,  9 Sep 2022 14:14:02 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id r18so4270126eja.11
        for <linux-staging@lists.linux.dev>; Fri, 09 Sep 2022 07:14:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=ySwWI942jaxyz5lWBkAOHKVuWAIl4C9M1/fPskGwiY0=;
        b=cHUZnXW68BAC3LoHZFdFKCiMv5iqTS+JZMsdn3lgXfdwK/hmcm+UCHqTqWAQ0miBtA
         PwZgy9mbViiwWhdi72v2lF0ae6j98smmgpgJp2Ew0qgy2/fMpqXUDL/ehhEyyjpVw8c0
         N9rlFFfQU0goGolBC8vNzmfHAxShvOzf023KT/szZxznJrQQEx9p0E6msT6N/w3+BzFj
         T+k+j5O8Y29ym9uewzVAmaLte0pC4xlyFNZ4l/mmZ/Ryg6O9pSHvxJi2ze6YbB1wgBSx
         sAuI1Sz2GMfDr1+mnx/VRi8flaxmu8cW2A7ntKyJMOtiwfdSF5uwUJAnekzvRZpFDQqJ
         kutQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=ySwWI942jaxyz5lWBkAOHKVuWAIl4C9M1/fPskGwiY0=;
        b=Ki1RwisMXJ1FLhV3mdQj58MQwWvCFgNLLyRhwaDByOG++3HxSHGCIewgMarHUwJADS
         8NdmlZbafE9aLdWaACb6t0CQFUZ8DcttmZFK3GdmlmnPKEbEEtDS7IhzzQ5/k1frgpa/
         Empw/FBz52jrG83cNPx1Icx3QCHLu1yHllAr29Xk3jIuBJygtNnwT8YnERgzJPyg5QvE
         2nj8qOJ2Naag66CyniCVMed9cRqpP/xzP1BqQsd7fEoQOdNlZXNpHDT1t1DeOWCJPLLA
         8OTvOylHzUkGaS3MZ2/KQFpaWQeyW5+iPyF6En3Bdyqxt13krfaHWD+/pK3ilmDEOqsa
         51ng==
X-Gm-Message-State: ACgBeo2tvJMgc5VGC382w8jq7VhnuvSjBf7vTa+g3v4GboG9I0prCpTt
	OSnsfpsyTxz/DwdVp6epsPA=
X-Google-Smtp-Source: AA6agR5nXtIg6vdlK66fSHhsIm6fnp9wpUrbqDxdOS3dZr8g/6FzAhW1Su6/jr2mPLPn7UJ0+r4Yzw==
X-Received: by 2002:a17:907:2bf8:b0:770:837a:e3b8 with SMTP id gv56-20020a1709072bf800b00770837ae3b8mr9126840ejc.562.1662732840890;
        Fri, 09 Sep 2022 07:14:00 -0700 (PDT)
Received: from localhost.localdomain (wlan-244090.nbw.tue.nl. [131.155.244.90])
        by smtp.gmail.com with ESMTPSA id cn11-20020a0564020cab00b0044ea7b8f57bsm471146edb.1.2022.09.09.07.13.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Sep 2022 07:14:00 -0700 (PDT)
From: Nam Cao <namcaov@gmail.com>
To: forest@alittletooquiet.net,
	gregkh@linuxfoundation.org
Cc: namcaov@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH] staging: vt6655: fix potential memory leak
Date: Fri,  9 Sep 2022 16:13:39 +0200
Message-Id: <20220909141338.19343-1-namcaov@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In function device_init_td0_ring, memory is allocated for member
td_info of priv->apTD0Rings[i], with i increasing from 0. In case of
allocation failure, the memory is freed in reversed order, with i
decreasing to 0. However, the case i=0 is left out and thus memory is
leaked.

Modify the memory freeing loop to include the case i=0.

Signed-off-by: Nam Cao <namcaov@gmail.com>
---
 drivers/staging/vt6655/device_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/vt6655/device_main.c b/drivers/staging/vt6655/device_main.c
index 3397c78b975a..a65014195fdc 100644
--- a/drivers/staging/vt6655/device_main.c
+++ b/drivers/staging/vt6655/device_main.c
@@ -743,7 +743,7 @@ static int device_init_td0_ring(struct vnt_private *priv)
 	return 0;
 
 err_free_desc:
-	while (--i) {
+	while (i--) {
 		desc = &priv->apTD0Rings[i];
 		kfree(desc->td_info);
 	}
-- 
2.25.1

