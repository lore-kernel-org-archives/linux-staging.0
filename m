Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65BF83B4EAC
	for <linux-staging@lists.linux.dev>; Tue, 30 Jun 2026 20:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782852562; cv=none; b=MTwYVULJJgH4gqmKv1dwNQjdCoq/aoJrExdy990Z+eZOP2isZ1zIs/sVbFqDR/Zv3yrZ1/Q/5JgLPfP7ZXCS/Oxi9tI5HHhNvOJnZeKGGDqTBCBzmpExJwQtWILIjLI4D5FxSrRPNKEXTeStuJxomLlOlb7YXy0Nvv5KxOQN8ro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782852562; c=relaxed/simple;
	bh=rTNXmBVWAS5n2+/3LHVSjM6xu9gkPeS4/DADE/TX0Cw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dtOwtzntPTYfOQ0Y8zTBJpk1XDQwt4+IyXohOmpfMA00BME8BcskxlOCGSsQysjzY6SQ19J7o3aUYdesSC81cmXz8VeXzuJc9jkPmO7dZJ4817HFNs5RLScjvGH2xnCqhv6jFlVAfUnsBbWkMEvjYOV0XHGPmmLuRaC3Z/0rH6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cCy5sR2I; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cCy5sR2I"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-30cac93dfd7so874888eec.1
        for <linux-staging@lists.linux.dev>; Tue, 30 Jun 2026 13:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782852560; x=1783457360; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QH7GLHNGfwBkJqHxvx3I3p3T8oUpVImJRLd2zYY0WZg=;
        b=cCy5sR2I3uYksa/WnM3smQ02cuKuZ/RTSnaAKVqBiOCKoCZb8cd49uHNNmxs+aQP+B
         f/+PsJ7ZO97HBIrPYDiWMoQmDZTiMDm629xlHW7sDoyFT9BljQ+tCs6zcQJHlo3XGc4U
         fMjv+owgtyyDxQhKUq0QM9VQpZuohifQsFI1AKBG2Gr4T6XeQLjY96TreTFNKKmRlLM3
         awu4n/9HYUTlaDnAleqmvlfkBthA/La01h315RRkJkvbEngsgfy8UJcIh3zi0Jrek4kw
         xtUzT540TM1fQp8BJGje56B4GIgKPzoWbJ+1dMdW4AQtS0Vp9KlkSSXrq+3xqQ62YJ0I
         ndEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782852560; x=1783457360;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QH7GLHNGfwBkJqHxvx3I3p3T8oUpVImJRLd2zYY0WZg=;
        b=F1ky2As0JwGjB6LksGH1hdLFjsDdaeCo/Om7PAANGKP8M52Q/HH9hKGCc+YZ1mnhsq
         LY6QOCPTbTHYEK0F5ONvDXiOfLvnlPV33+MRie/SZHj3NTTUMHO8KJ04vUepsWFSMWsy
         tzh9Moo3AXJCGyp11eTsM7FKphMx58GdXP1+oqxJnQDPCQR2Ujg8d/Y6kUdp95iw02kF
         +RUJTpUvLszDbUtKDE9RoD8Hs2bexOqA+6H7b53TXCkh+gXg0aKRF6sibOcjMw2QhpfI
         PS1l+n9KQjmKVRu+eFguC6lNNwQu/F605SEbl1+XMFvr1KT2uuDHdeoGCW4mMHL0vd4Q
         b1cg==
X-Forwarded-Encrypted: i=1; AHgh+RoYkdcN3VeDn54E4KVImBeJ0KVOb9kxTKQTWINB5Ts7mo+DXDa1rnqiOrhmrFu/bbhBi8HdhjdjupoBSFNr@lists.linux.dev
X-Gm-Message-State: AOJu0YxAvDZMHvyWlSHMEzlaapE38TnfcHFRZThGU00EkHLPmaWjQlf7
	m/D+mR1Poo+zk6/BYxxJei68d/+o3+kv+fUUMnp+vfzgt8wRD56gvoR1
X-Gm-Gg: AfdE7cmo0qKs4Ji5/mvGAt/GS4/i0o4Zfd/wkhWifwFTJU91lvVvTNnS74hVXxYvvIP
	DcN4JHxtibbjGAYLPFnrPUkO0UakaymXhCUDqMS9XV4j+bxoCtv1dayIpULgcb4nw26YeQKn8eG
	wMS68V/+wDOtSE37RQMN+fjfEJUzsSpiwd7H5wdl3CtBvL+F52PBGU4crPo2LLVthqW5lwvD6u9
	cyfo1q0/3LKDYVliFXOXD2qkOqFhDaIu8JHXuj4c+nRlkxY7DDGORmon9PRbIQsQ235ZcDOPMNY
	6BV8/GMN/KMv6jCl2en/IlbghR8Sk9u8sbmn419fulDSrblrhH0nj63ILQgJvJaHYyth+GGrJkG
	35emGvXeLv7nUfpDkEeFszw9TqpJT9jPkE7JB5rTd2IMyTT/44TBFd5r3EHSDMeboZgi6JvkJm/
	CpTT1KwtNFBDhCB8NaTs9iegGAn6+KPpeLjlxuehhDR4//qb07ISSYJNA=
X-Received: by 2002:a05:7301:7191:b0:30c:829a:f67c with SMTP id 5a478bee46e88-30ee9f6ce52mr1786800eec.3.1782852560400;
        Tue, 30 Jun 2026 13:49:20 -0700 (PDT)
Received: from kernel-dev.multipass ([49.36.101.14])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ee32519aesm10902297eec.27.2026.06.30.13.49.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 13:49:19 -0700 (PDT)
From: adi25charis@gmail.com
To: vaibhav.sr@gmail.com,
	mgreer@animalcreek.com,
	johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org
Cc: error27@gmail.com,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Aditya Chari S <adi25charis@gmail.com>
Subject: [PATCH v2] staging: greybus: audio: split topology get into size and data calls
Date: Wed,  1 Jul 2026 02:19:08 +0530
Message-ID: <20260630204908.40206-1-adi25charis@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260629144941.33818-1-adi25charis@gmail.com>
References: <20260629144941.33818-1-adi25charis@gmail.com>
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

----------
v2:
- Fold in review feedback from Dan Carpenter.
- Store topology size as size_t instead of u16.
- Move topology size validation into gb_audio_probe() before kzalloc().
- Use -EINVAL for invalid topology size.
- Drop unrelated dev_err() formatting cleanup.
- Compile-tested with `make M=drivers/staging/greybus`.
- Run checkpatch.pl on the updated patch; no issues reported.
---
 drivers/staging/greybus/audio_codec.h  |  4 +++-
 drivers/staging/greybus/audio_gb.c     | 32 +++++++++-----------------
 drivers/staging/greybus/audio_module.c | 27 +++++++++++++++++-----
 3 files changed, 35 insertions(+), 28 deletions(-)

diff --git a/drivers/staging/greybus/audio_codec.h b/drivers/staging/greybus/audio_codec.h
index f3f7a7ec6..b45cd257d 100644
--- a/drivers/staging/greybus/audio_codec.h
+++ b/drivers/staging/greybus/audio_codec.h
@@ -178,8 +178,10 @@ int gbaudio_register_module(struct gbaudio_module_info *module);
 void gbaudio_unregister_module(struct gbaudio_module_info *module);
 
 /* protocol related */
+int gb_audio_gb_get_topology_size(struct gb_connection *connection,
+				  size_t *size);
 int gb_audio_gb_get_topology(struct gb_connection *connection,
-			     struct gb_audio_topology **topology);
+			     struct gb_audio_topology *topology, size_t size);
 int gb_audio_gb_get_control(struct gb_connection *connection,
 			    u8 control_id, u8 index,
 			    struct gb_audio_ctl_elem_value *value);
diff --git a/drivers/staging/greybus/audio_gb.c b/drivers/staging/greybus/audio_gb.c
index 9d8994fdb..2e6f155d8 100644
--- a/drivers/staging/greybus/audio_gb.c
+++ b/drivers/staging/greybus/audio_gb.c
@@ -8,13 +8,10 @@
 #include <linux/greybus.h>
 #include "audio_codec.h"
 
-/* TODO: Split into separate calls */
-int gb_audio_gb_get_topology(struct gb_connection *connection,
-			     struct gb_audio_topology **topology)
+int gb_audio_gb_get_topology_size(struct gb_connection *connection,
+				  size_t *size)
 {
 	struct gb_audio_get_topology_size_response size_resp;
-	struct gb_audio_topology *topo;
-	u16 size;
 	int ret;
 
 	ret = gb_operation_sync(connection, GB_AUDIO_TYPE_GET_TOPOLOGY_SIZE,
@@ -22,25 +19,18 @@ int gb_audio_gb_get_topology(struct gb_connection *connection,
 	if (ret)
 		return ret;
 
-	size = le16_to_cpu(size_resp.size);
-	if (size < sizeof(*topo))
-		return -ENODATA;
-
-	topo = kzalloc(size, GFP_KERNEL);
-	if (!topo)
-		return -ENOMEM;
-
-	ret = gb_operation_sync(connection, GB_AUDIO_TYPE_GET_TOPOLOGY, NULL, 0,
-				topo, size);
-	if (ret) {
-		kfree(topo);
-		return ret;
-	}
-
-	*topology = topo;
+	*size = le16_to_cpu(size_resp.size);
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(gb_audio_gb_get_topology_size);
+
+int gb_audio_gb_get_topology(struct gb_connection *connection,
+			     struct gb_audio_topology *topology, size_t size)
+{
+	return gb_operation_sync(connection, GB_AUDIO_TYPE_GET_TOPOLOGY, NULL, 0,
+				 topology, size);
+}
 EXPORT_SYMBOL_GPL(gb_audio_gb_get_topology);
 
 int gb_audio_gb_get_control(struct gb_connection *connection,
diff --git a/drivers/staging/greybus/audio_module.c b/drivers/staging/greybus/audio_module.c
index 12c376c47..4cd1f42c1 100644
--- a/drivers/staging/greybus/audio_module.c
+++ b/drivers/staging/greybus/audio_module.c
@@ -239,6 +239,7 @@ static int gb_audio_probe(struct gb_bundle *bundle,
 	struct gb_audio_manager_module_descriptor desc;
 	struct gbaudio_data_connection *dai, *_dai;
 	int ret, i;
+	size_t size;
 	struct gb_audio_topology *topology;
 
 	/* There should be at least one Management and one Data cport */
@@ -304,16 +305,30 @@ static int gb_audio_probe(struct gb_bundle *bundle,
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
+	if (size < sizeof(*topology)) {
+		dev_err(dev, "Invalid topology size: %zu\n", size);
+		ret = -EINVAL;
 		goto disable_connection;
 	}
 
+	topology = kzalloc(size, GFP_KERNEL);
+	if (!topology) {
+		ret = -ENOMEM;
+		goto disable_connection;
+	}
+
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

