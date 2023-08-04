Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDB0B1DA37
	for <linux-staging@lists.linux.dev>; Fri,  4 Aug 2023 20:31:37 +0000 (UTC)
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-3a5ad4477a7so1880620b6e.1
        for <linux-staging@lists.linux.dev>; Fri, 04 Aug 2023 13:31:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691181097; x=1691785897;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=P2sRXegefcAEl333biQwB8H/OIszvfSG+NNQtF6Df6w=;
        b=sJxIClGpPyW2HMO2BQEMygYCD21+kw9MK5mfE9Jl0bGSq/VBa+BVWlZgjp4vfpCM73
         /itVh0mFRBTgD4yixQPHc5rzFzYUi9vH5ip3cSDi5ob+JbpJpA7B2wqzw23fFCr43Jfh
         K4sJnIIKjz9VqutdxqdXF3ZQRwpbRkVwe8mmNaKz3bZjS7Hg4DWd2sP5Le3PtrcKOATt
         cSBmau63g/oFdMg+agGgsDep9RcCgwjrZ4Z1PSAuBCsQS6FLKVO/KMAfQZ8mXo+7PaNM
         qSW3+wKvxkzd/FL0DxSr7mrtqvYRyX8W96NPAfdnJBn8cF++oNNSSv+qjGJ6QbRFHtXX
         DSfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691181097; x=1691785897;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P2sRXegefcAEl333biQwB8H/OIszvfSG+NNQtF6Df6w=;
        b=RiEuRv+U7fWowq7szxYxeucuxyJtv6IB1C2AHSJufPYyNuyl6Px8jTsv43oE/jLfLF
         ZNvxIfnX77D1zVwcsd5efQqU80D8i5nGAJbgyD2mKfAH3aNcmcyd3Y3t3EbsF2cx52ZS
         5tB6aNbqm9UyFQbUd25Z3ufYBJVyh0GdOQ7FMejfHE+8GXNnXqWe9vMS3pzla60/t8SM
         hqrZWCDbc4BQW0uEDKntg2OwUgGZNFJaDdlhbV61MlK0fWK6F/T9ea9QpTf4EkILr/C5
         3LYLTHXum0rhbQC7peiwqqz9VuKKp5CralGgNG078T0eGHaDerz3wapNgGwXbleSdowi
         rIGw==
X-Gm-Message-State: AOJu0YxZurm6EqfOVTyi6Eou9Yw1emNOon01Ezrimy8eyPxL7mZLuBzu
	FsjR4Mzn3/O1cVnu6y6Q+xM=
X-Google-Smtp-Source: AGHT+IFSGKqv/EpwBMvrQ1Kag1VNKCAJJWEtIYcN330189QrIWtiqx2lwCILiFCLfVr3YgfuDwm90w==
X-Received: by 2002:a54:4e02:0:b0:3a4:57a7:b30e with SMTP id a2-20020a544e02000000b003a457a7b30emr2404804oiy.26.1691181096638;
        Fri, 04 Aug 2023 13:31:36 -0700 (PDT)
Received: from madhu-kernel (99-145-207-128.lightspeed.austtx.sbcglobal.net. [99.145.207.128])
        by smtp.gmail.com with ESMTPSA id e22-20020a05680809b600b003a75b6cbd38sm1467104oig.45.2023.08.04.13.31.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Aug 2023 13:31:36 -0700 (PDT)
Date: Fri, 4 Aug 2023 15:31:34 -0500
From: Madhumitha Prabakaran <madhumithabiw@gmail.com>
To: vaibhav.sr@gmail.com, mgreer@animalcreek.com, johan@kernel.org,
	elder@kernel.org, gregkh@linuxfoundation.org,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: skhan@linuxfoundation.org, ivan.orlov0322@gmail.com
Subject: [PATCH] staging: greybus: Refactor gb_audio_gb_get_topology() into
 separate calls
Message-ID: <20230804203134.GA618419@madhu-kernel>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Refactor gb_audio_gb_get_topology() into separate calls for better modularity.

Signed-off-by: Madhumitha Prabakaran <madhumithabiw@gmail.com>
---
 drivers/staging/greybus/audio_gb.c | 67 +++++++++++++++++++-----------
 1 file changed, 42 insertions(+), 25 deletions(-)

diff --git a/drivers/staging/greybus/audio_gb.c b/drivers/staging/greybus/audio_gb.c
index 9d8994fdb41a..a48ddadd6f1e 100644
--- a/drivers/staging/greybus/audio_gb.c
+++ b/drivers/staging/greybus/audio_gb.c
@@ -8,39 +8,56 @@
 #include <linux/greybus.h>
 #include "audio_codec.h"
 
-/* TODO: Split into separate calls */
-int gb_audio_gb_get_topology(struct gb_connection *connection,
-			     struct gb_audio_topology **topology)
+int gb_audio_gb_get_topology_size(struct gb_connection *connection, u16 *size)
 {
-	struct gb_audio_get_topology_size_response size_resp;
-	struct gb_audio_topology *topo;
-	u16 size;
-	int ret;
+    struct gb_audio_get_topology_size_response size_resp;
+    int ret;
 
-	ret = gb_operation_sync(connection, GB_AUDIO_TYPE_GET_TOPOLOGY_SIZE,
-				NULL, 0, &size_resp, sizeof(size_resp));
-	if (ret)
-		return ret;
+    ret = gb_operation_sync(connection, GB_AUDIO_TYPE_GET_TOPOLOGY_SIZE,
+                            NULL, 0, &size_resp, sizeof(size_resp));
+    if (ret)
+        return ret;
 
-	size = le16_to_cpu(size_resp.size);
-	if (size < sizeof(*topo))
-		return -ENODATA;
+    *size = le16_to_cpu(size_resp.size);
+    return 0;
+}
 
-	topo = kzalloc(size, GFP_KERNEL);
-	if (!topo)
-		return -ENOMEM;
+struct gb_audio_topology *gb_audio_gb_alloc_topology(u16 size)
+{
+    struct gb_audio_topology *topo;
 
-	ret = gb_operation_sync(connection, GB_AUDIO_TYPE_GET_TOPOLOGY, NULL, 0,
-				topo, size);
-	if (ret) {
-		kfree(topo);
-		return ret;
-	}
+    if (size < sizeof(struct gb_audio_topology))
+        return NULL;
 
-	*topology = topo;
+    topo = kzalloc(size, GFP_KERNEL);
+    return topo;
+}
 
-	return 0;
+int gb_audio_gb_get_topology(struct gb_connection *connection,
+                             struct gb_audio_topology **topology)
+{
+    u16 size;
+    int ret;
+
+    ret = gb_audio_gb_get_topology_size(connection, &size);
+    if (ret)
+        return ret;
+
+    *topology = gb_audio_gb_alloc_topology(size);
+    if (!*topology)
+        return -ENOMEM;
+
+    ret = gb_operation_sync(connection, GB_AUDIO_TYPE_GET_TOPOLOGY,
+                            NULL, 0, *topology, size);
+    if (ret) {
+        kfree(*topology);
+        *topology = NULL;
+        return ret;
+    }
+
+    return 0;
 }
+
 EXPORT_SYMBOL_GPL(gb_audio_gb_get_topology);
 
 int gb_audio_gb_get_control(struct gb_connection *connection,
-- 
2.25.1

