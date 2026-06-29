Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE5834218B7
	for <linux-staging@lists.linux.dev>; Mon, 29 Jun 2026 14:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782744603; cv=none; b=utHREwsddy9SBDEhEsZVqqZR63eIVemI7mQseVSAi7QOrfo7uwU2IF+ZfianGNA0ot83U5hTS905tW4KOZC6c7Ka2gykIodR5/BVo7hmWQ5zTwfeebpKTqPLF9PvvJoYTnfw/w2fht7I3p2mWg5JLKraEAyNk9wa48TACziw1/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782744603; c=relaxed/simple;
	bh=MfPygXF5akVPsKxz3CGdHJDI2hAoehZ7pchI2qJH/ow=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aWbf9giCAYTL5YoffXYYpjxLGentM35ZIr6u3bawHSXW+4/0eTBwAnEIGJ4bJnZdlGxVCU4PwxfETPWGvzAbaJOZny5Pqt76j5Vrmswvkl2gbVCVfsl8A42uzCWUAxDI0Jm1F5q6i43djoJTVrLDJP6bR2vBDhjKrPD5nNF7F98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y6eAaVJG; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y6eAaVJG"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2c9cb97e178so15839605ad.3
        for <linux-staging@lists.linux.dev>; Mon, 29 Jun 2026 07:50:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782744600; x=1783349400; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=U3IH7lTasgN8z7TKzZJYuQBYYqraZCPUHS7aDOkklfQ=;
        b=Y6eAaVJGaoFDJOC0JtTD8CxRqvGvKIkXYRqVd9BTzELBRNJNWRqHba3NMR+1bpZinJ
         lWU6fTFVn+AXJN6YaczStWF4yC4tYhHxV7MRINLD6EWhW7bc4p49LMQM1ayW8cpnsOrc
         rHzmiZnoweLFA4jmGPIOB1dyPGZeZ6e07GVJDqSCFs9zKCxaSY6ZeT8H5v468u3+u9zc
         MKXNtGV+91+QxApMXxqsXEN9IXdTWGRAWnm+gwfosyx6Ydwi7AFLOlRCK9xHV0UkVgDM
         P+gAexNCp0bLngtajM6TwavfKmYlG7PH+LyHGUkpZFbjNuVS+yngCBjzqB5L0z+Tho9m
         VFnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782744600; x=1783349400;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U3IH7lTasgN8z7TKzZJYuQBYYqraZCPUHS7aDOkklfQ=;
        b=OfnKaEELjIggtii07M+4jd+YtmEFIjjqXgyfexc3VcTvi5GyNqGxcsdAialerus4kn
         v8mRCXxb2ac37zyp62dbLbh9rmZ8UtcWINUUecAHgb6rFiGURbOigxAhaT79W5APJyZE
         DpUULU+0vOEFa1MKTYQ0J+iS1Lhm7oc/ZcYcz7ElazewNt72XK3EN0mGzwzCjsps5Lbx
         8CBP4+W3ejIWO+IjvGFhMcGmpivFwywSETwHdNvagynaZXMm+ShqkVNs4jVgKGsIM4lg
         ePdoBuUoJWyuEGqNFdIxQIJsVokzK+aXmL4BBGZpEdpr+vkoeXuDReIsqZ7EgMQlSLUI
         8KpQ==
X-Forwarded-Encrypted: i=1; AHgh+Rps8voJDHh8hL1oL0ml3NMCsP/a/2hhRgtX+I3f2aMwr22JZlo2pNbwG4dY+Y5VPflsiiThg5DF1fLxsHzK@lists.linux.dev
X-Gm-Message-State: AOJu0YzHpXR308SlazAns8ZJv456PiTVCOQ3k0R0oH6Wz86DR8bnYFoW
	7WqbLb4dvS7TTt8L23u+uzUIaqbCTKY2lZiqmA4yqpW7Lpulf4QH3J3M+LYq+nFv
X-Gm-Gg: AfdE7clOoH+y8y4ewdy8Jq/OnLD+J9Otf+WKh4WlXgMXrA3owzXPzwO0vuL+itBX8e8
	cU82e7TrbBwJDtXCC2gXuKvy50f45f/isosWPNDtDzwhJgfMthijZjbHU4lNZxFapitO4ESVSVQ
	gLURZRd0tY0Scyt4wFyL5pfO4pR1g5L9W+/c5HgnZ1JmxMj2akuCDRlz5MxsqyDZj5U7bCw0Abp
	SiFN28VOOWc86pVw0xUdEpDrfr0v/5uicWlUXp1IWKlP4jNRAwYnGR+m8uO1znsq2vTdoBhmQOQ
	wAki9U4XTzGMLpwxJ/nct2ATLtssyVAyZVjxtYusoNnAs40MF4yArvSmJhR3Q+HaVcJEIW1bKay
	5wfeAwyGA6niJAeFHdcqGrf8rhT2kzhkzwz+Fac2n6QL+saym2JDKnR9jASPMdVp1WB3Npy8OtX
	Kh93+fDBbBOF4Xnlrs0bSaWnB1eR2+sq5X0EJ0Szj+BZYFP4nJ9PxFwp8=
X-Received: by 2002:a17:903:1a24:b0:2ca:329:3d96 with SMTP id d9443c01a7336-2ca03293fd1mr28737305ad.3.1782744599684;
        Mon, 29 Jun 2026 07:49:59 -0700 (PDT)
Received: from kernel-dev.multipass ([49.36.101.14])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca0e498ff5sm17873205ad.38.2026.06.29.07.49.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 07:49:59 -0700 (PDT)
From: adi25charis@gmail.com
To: vaibhav.sr@gmail.com,
	mgreer@animalcreek.com,
	johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org
Cc: greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Aditya Chari S <adi25charis@gmail.com>
Subject: [PATCH] staging: greybus: audio: split topology get into size and data calls
Date: Mon, 29 Jun 2026 20:19:41 +0530
Message-ID: <20260629144941.33818-1-adi25charis@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Aditya Chari S <adi25charis@gmail.com>

gb_audio_gb_get_topology() combined three separate responsibilities
into a single call: querying the topology size, allocating a buffer
for it, and fetching the topology data into that buffer. This left
callers with no way to perform any of these steps independently, and
forced the kzalloc() allocation to live inside the protocol-layer
driver rather than the caller, as already flagged by a FIXME comment
at the call site in audio_module.c.

Split the function into two:

  gb_audio_gb_get_topology_size() - queries only the topology size
  gb_audio_gb_get_topology()      - fetches topology data into a
                                     caller-supplied buffer of a
                                     given size

Update the only caller, gb_audio_probe() in audio_module.c, to query
the size first, allocate the topology buffer itself, then fetch the
data into it, freeing the buffer via the existing free_topology error
path on failure.

This resolves both the "TODO: Split into separate calls" comment
above the original function in audio_gb.c and the FIXME comment at
the call site in audio_module.c, both of which are removed as part
of this change.

No functional change in behavior for the existing probe path.

Compile-tested with W=1, sparse (C=2), and checkpatch.pl; all clean
on the three changed files (audio_gb.c, audio_module.c, audio_codec.h).

Signed-off-by: Aditya Chari S <adi25charis@gmail.com>
---
 drivers/staging/greybus/audio_codec.h  |  4 +++-
 drivers/staging/greybus/audio_gb.c     | 33 ++++++++++----------------
 drivers/staging/greybus/audio_module.c | 21 +++++++++++-----
 3 files changed, 31 insertions(+), 27 deletions(-)

diff --git a/drivers/staging/greybus/audio_codec.h b/drivers/staging/greybus/audio_codec.h
index f3f7a7ec6..be5a2a86b 100644
--- a/drivers/staging/greybus/audio_codec.h
+++ b/drivers/staging/greybus/audio_codec.h
@@ -178,8 +178,10 @@ int gbaudio_register_module(struct gbaudio_module_info *module);
 void gbaudio_unregister_module(struct gbaudio_module_info *module);
 
 /* protocol related */
+int gb_audio_gb_get_topology_size(struct gb_connection *connection,
+				  u16 *size);
 int gb_audio_gb_get_topology(struct gb_connection *connection,
-			     struct gb_audio_topology **topology);
+			     struct gb_audio_topology *topology, u16 size);
 int gb_audio_gb_get_control(struct gb_connection *connection,
 			    u8 control_id, u8 index,
 			    struct gb_audio_ctl_elem_value *value);
diff --git a/drivers/staging/greybus/audio_gb.c b/drivers/staging/greybus/audio_gb.c
index 9d8994fdb..e6356643d 100644
--- a/drivers/staging/greybus/audio_gb.c
+++ b/drivers/staging/greybus/audio_gb.c
@@ -8,13 +8,10 @@
 #include <linux/greybus.h>
 #include "audio_codec.h"
 
-/* TODO: Split into separate calls */
-int gb_audio_gb_get_topology(struct gb_connection *connection,
-			     struct gb_audio_topology **topology)
+int gb_audio_gb_get_topology_size(struct gb_connection *connection,
+				  u16 *size)
 {
 	struct gb_audio_get_topology_size_response size_resp;
-	struct gb_audio_topology *topo;
-	u16 size;
 	int ret;
 
 	ret = gb_operation_sync(connection, GB_AUDIO_TYPE_GET_TOPOLOGY_SIZE,
@@ -22,24 +19,20 @@ int gb_audio_gb_get_topology(struct gb_connection *connection,
 	if (ret)
 		return ret;
 
-	size = le16_to_cpu(size_resp.size);
-	if (size < sizeof(*topo))
-		return -ENODATA;
-
-	topo = kzalloc(size, GFP_KERNEL);
-	if (!topo)
-		return -ENOMEM;
+	*size = le16_to_cpu(size_resp.size);
 
-	ret = gb_operation_sync(connection, GB_AUDIO_TYPE_GET_TOPOLOGY, NULL, 0,
-				topo, size);
-	if (ret) {
-		kfree(topo);
-		return ret;
-	}
+	return 0;
+}
+EXPORT_SYMBOL_GPL(gb_audio_gb_get_topology_size);
 
-	*topology = topo;
+int gb_audio_gb_get_topology(struct gb_connection *connection,
+			     struct gb_audio_topology *topology, u16 size)
+{
+	if (size < sizeof(*topology))
+		return -ENODATA;
 
-	return 0;
+	return gb_operation_sync(connection, GB_AUDIO_TYPE_GET_TOPOLOGY, NULL, 0,
+				 topology, size);
 }
 EXPORT_SYMBOL_GPL(gb_audio_gb_get_topology);
 
diff --git a/drivers/staging/greybus/audio_module.c b/drivers/staging/greybus/audio_module.c
index 12c376c47..1163cf093 100644
--- a/drivers/staging/greybus/audio_module.c
+++ b/drivers/staging/greybus/audio_module.c
@@ -239,6 +239,7 @@ static int gb_audio_probe(struct gb_bundle *bundle,
 	struct gb_audio_manager_module_descriptor desc;
 	struct gbaudio_data_connection *dai, *_dai;
 	int ret, i;
+	u16 size;
 	struct gb_audio_topology *topology;
 
 	/* There should be at least one Management and one Data cport */
@@ -304,16 +305,24 @@ static int gb_audio_probe(struct gb_bundle *bundle,
 	}
 	gbmodule->dev_id = gbmodule->mgmt_connection->intf->interface_id;
 
-	/*
-	 * FIXME: malloc for topology happens via audio_gb driver
-	 * should be done within codec driver itself
-	 */
-	ret = gb_audio_gb_get_topology(gbmodule->mgmt_connection, &topology);
+	ret = gb_audio_gb_get_topology_size(gbmodule->mgmt_connection, &size);
 	if (ret) {
-		dev_err(dev, "%d:Error while fetching topology\n", ret);
+		dev_err(dev, "%d:Error while fetching topology size\n", ret);
+		goto disable_connection;
+	}
+
+	topology = kzalloc(size, GFP_KERNEL);
+	if (!topology) {
+		ret = -ENOMEM;
 		goto disable_connection;
 	}
 
+	ret = gb_audio_gb_get_topology(gbmodule->mgmt_connection, topology, size);
+	if (ret) {
+		dev_err(dev, "%d:Error while fetching topology\n", ret);
+		goto free_topology;
+	}
+
 	/* process topology data */
 	ret = gbaudio_tplg_parse_data(gbmodule, topology);
 	if (ret) {
-- 
2.53.0

