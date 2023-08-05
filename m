Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D07A1C13
	for <linux-staging@lists.linux.dev>; Sat,  5 Aug 2023 01:42:37 +0000 (UTC)
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-6bcd455fc88so1051582a34.2
        for <linux-staging@lists.linux.dev>; Fri, 04 Aug 2023 18:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691199756; x=1691804556;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SR4+0lK8VMa7xEJXrkPeazYWkv8MbM9OkffI+Wr4AlU=;
        b=MT7P9SzDvq3ZHRNDZExMw50zHVv9hnPu4zmqDXEEci98q5btHQOIQb0/T/ASjxgoYK
         u5OtHfy3UJNc36TeWj/1Z45/wC/4qV7nnb8Vdy5lbtVtkimaN803ZsGYDncvjP3GMtSF
         OoRYkO6xzMcDYjFIcwTOFsyd+ISJt5GjXo5lHD9os9qWQaaAYWR1MIlDrqF0eQHGTiCc
         A1r5UcE8FXCgIk0dFctLYA6VUxpqty2cpIGm3/tf7DnWeFhEF1djbAvVqxuoEM4GNacg
         N+Ht7qhleRaT90+f7gW0OEg0zpgYHOONBaIwOOTZZXHD/tpvvR3rRSUySFEe/W+5DhtM
         FkAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691199756; x=1691804556;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SR4+0lK8VMa7xEJXrkPeazYWkv8MbM9OkffI+Wr4AlU=;
        b=K/jCrYkfcmK51LNKmMCXDGX4fOY+8MEWUrTc/qMMjwzDr1ZOfVlhSjc+nGeVg6akTt
         Jqz4gfYSagYObx1v9snRiImpeNdH6+NPSMMoYJkBIDncQgfvOEyXKxmU35watY7OOe3M
         fahsCn4hJDj/dUaXL/kBEAZn+D5Z6GqNz34gVFEdGJWXVy3nhmYcfEi2iva378Obhq05
         Jti2zvqO3i0S2jeUwEGzbPsauoqEDYZFRiXjqWEd6WSLa/YAzi2Bgs02kIrwdEuEvouM
         V1J+A7tIvk1aNfeo85p/MmaU9pMqrnKvkXoisiisp8PMc0dl2F2+T2e3Y7Ul9FISkWva
         a7gQ==
X-Gm-Message-State: AOJu0YxlKGdbQHtOmAwzERQxCt89/b/8rIlWQmrRohepIjDZf8DKH9Z5
	rP9kUWsHIMERTq4U8VVfGcU=
X-Google-Smtp-Source: AGHT+IFBWyNqEvS4q0WvesTp6PCfMAaDtxmOs5YBue/bsaJxgXfOd7Kb003+ZuRH1oaq86Bv8XjGAQ==
X-Received: by 2002:a05:6871:452:b0:1b7:4521:31f with SMTP id e18-20020a056871045200b001b74521031fmr3373967oag.18.1691199756170;
        Fri, 04 Aug 2023 18:42:36 -0700 (PDT)
Received: from madhu-kernel (99-145-207-128.lightspeed.austtx.sbcglobal.net. [99.145.207.128])
        by smtp.gmail.com with ESMTPSA id v3-20020a056870e28300b001b36699bd5fsm1872379oad.35.2023.08.04.18.42.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Aug 2023 18:42:35 -0700 (PDT)
Date: Fri, 4 Aug 2023 20:42:34 -0500
From: Madhumitha Prabakaran <madhumithabiw@gmail.com>
To: vaibhav.sr@gmail.com, mgreer@animalcreek.com, johan@kernel.org,
	elder@kernel.org, gregkh@linuxfoundation.org,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: skhan@linuxfoundation.org, ivan.orlov0322@gmail.com,
	madhumithabiw@gmail.com
Subject: [PATCH v2] staging: greybus: Refactor gb_audio_gb_get_topology()
 into separate calls
Message-ID: <20230805014234.GA948556@madhu-kernel>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Refactor gb_audio_gb_get_topology() into separate calls for better modularity

Signed-off-by: Madhumitha Prabakaran <madhumithabiw@gmail.com>
----
Changes in v2:
Include prototype in the /audio_codec.h, as
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202308050511.y5Yb9otW-lkp@intel.com/
---
 drivers/staging/greybus/audio_codec.h |  4 ++
 drivers/staging/greybus/audio_gb.c    | 67 +++++++++++++++++----------
 2 files changed, 46 insertions(+), 25 deletions(-)

diff --git a/drivers/staging/greybus/audio_codec.h b/drivers/staging/greybus/audio_codec.h
index ce15e800e607..356143f3e241 100644
--- a/drivers/staging/greybus/audio_codec.h
+++ b/drivers/staging/greybus/audio_codec.h
@@ -176,7 +176,11 @@ int gbaudio_module_update(struct gbaudio_codec_info *codec,
 int gbaudio_register_module(struct gbaudio_module_info *module);
 void gbaudio_unregister_module(struct gbaudio_module_info *module);
 
+struct gb_audio_topology *gb_audio_gb_alloc_topology(u16 size);
+
 /* protocol related */
+int gb_audio_gb_get_topology_size(struct gb_connection *connection,
+                 u16 *size);
 int gb_audio_gb_get_topology(struct gb_connection *connection,
 			     struct gb_audio_topology **topology);
 int gb_audio_gb_get_control(struct gb_connection *connection,
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

