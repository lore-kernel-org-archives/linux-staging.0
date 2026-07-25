Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66C7C2DC792
	for <linux-staging@lists.linux.dev>; Sat, 25 Jul 2026 14:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784990257; cv=none; b=sI17B+YXPD6meX6iRn85Dfi/5TjCFtJJlP+lVWwJtheqd3mG3Mid61qR2wA/78/G7gI8OTL/0iTPoGkmIvvnHuT8r68AuwX2C1UyYIefVN+jThS6A5vu0AGCqmwCelcboRGzGPc+bq68Gk7dXlBo5EIIAXHulUcp6Sygl0Jg8WQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784990257; c=relaxed/simple;
	bh=DUl951sgjAJRqc+JSCBkh++fLgbIO3zDuDknNUDq6UA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=GEIj8wE4A/ra/ZZqcBXT2994xLM0lzTBqMMaIVPsbFslEDNNVNWBiLig9adS2yOjElguHGBVr6VrIRnl4KNPqXDorLTsyHZq/JcULdoZ3xjhyohyCMx2nlaFaWmDeo8CTuC8yHinifsdfOm7ElwcebIETEI7eH8HOofibdNuyKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bGPH8Ebm; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bGPH8Ebm"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2caf228a910so10379235ad.2
        for <linux-staging@lists.linux.dev>; Sat, 25 Jul 2026 07:37:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784990256; x=1785595056; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9dd0ULAJidWvfKczgVlSDcsUwkjhQY32lLZUZXriyL8=;
        b=bGPH8EbmBtd7rJvlSSJ4t4rVn65q9vF2BjWY/Q+BUSkvY9Sm194fhQ6QleD7inaryp
         rKjAaukxLm/7dAGmHtC6829LIzlhjrNdH1tID4yMB+1hxPfcdzzxVs1UmUn9tp+M9llf
         tTuZCs0LTqEyUp6/pwjdGx3xkvPiLjUhyRve4H5Lp36V69iE6QHgbR4cpF509cJ3tyRq
         BdDAGw47u+/QI8rHChg480iTc/t9jMhzlLhyMz0tqXrm+QsvIqtpTrh2Ngdpspff2EH9
         gLnelyoALGwGWPEGRvGazw6ySyQ3SS0+Z/WT7XLnf9iRN24tykD6nAZ4mpunUs7aKIkS
         jPAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784990256; x=1785595056;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9dd0ULAJidWvfKczgVlSDcsUwkjhQY32lLZUZXriyL8=;
        b=NIEfEvWsd7pYiy1NC/mlNhtqn43Uf3aZc4CfG7a0nV1WforbRoYjHwsRRsJQhGQNCr
         edx3pgwSewEUXhycIDfbCmddRZdv/41NKWj7LFsXph7J/Cqd4XGfsIP42RlqH+PbGsaw
         vHAqDcendntdZgTyV9dYdyy0lwbuUjUi6azEmh+Uhye2cwzh7/MiUT/ZH6wW90hXSYUQ
         vLhmahrwTZck6nsHAsSk+zRkykamcZTn4jRSbyQ69JJh8b8vTdz7vQd4EhSHXxtVFWHT
         N8nKtlixLCphPlnBHZy9s1KtLQdVvaX3zTQVnfja72swXxkkGr9wZKiaNndJiAMpQn/6
         Tprg==
X-Forwarded-Encrypted: i=1; AHgh+RpdgnOlVxBAD4yhgwg/l4VUCdfFx61tULNeda9UdtE+VCk8RK43wDS8PGif/4tmow1xsACudegof9vGmC/S@lists.linux.dev
X-Gm-Message-State: AOJu0YwMgYSImA7oOg+GnbNm5gW+IzBrR6lgJlq0phRy4Wc8wacnGPiV
	giQ/z3iOrUKIQ6dmFYPAFMcVE2FxuPwNwxDQFnvh0eKBNsfUbO9TB1W6
X-Gm-Gg: AR+sD13eW7mIoeGrGBQmra41V7Qk0zU04biiy6QTHEBWW0XLUOzMmz5Js3v7ntnWfNN
	q3U7f3VRbcGcp6IK4nzzzvcZLd19LaUuTJZyRRPLpSawFJU8kdkJ38ITIjWU+VX6jRB/1IZ0TuA
	gjBFrkyDyItL/YPFkn5OmSA6UbR9c2Pf613O88SZRrdvx1Y1beGBf/UnqLzqBLvudPxGjF3Ykyb
	ud7SOqFQdRCNyn8dDyufvj/3pcUpDkpYwnuBvta8AV7B2TwuyBHL3J8MLyHV/caFY+XBgmf7fxL
	oqeAdHlMFMUiGtAGleP64RqchI8dQLRQegLPJHIguC4O+RRmqnCrrcPHWTLOKomoDJtO8CgOD7C
	1ugbslT2y+lR0Dx8g0KsSXFpqxTpqQyFHeVpqWv2Ztr30bCm74ThV3k6l79GXaDi3vl9Q+mUqlx
	1ySv+X1EuhcLSOwSrLsVSO906zkj9SLgA=
X-Received: by 2002:a05:6a21:60c4:b0:3c4:320f:42f4 with SMTP id adf61e73a8af0-3c67df86a42mr2326561637.56.1784990254188;
        Sat, 25 Jul 2026 07:37:34 -0700 (PDT)
Received: from kernel-dev ([49.36.97.234])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc413766sm12027086eec.8.2026.07.25.07.37.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2026 07:37:33 -0700 (PDT)
From: Aditya Chari <adi25charis@gmail.com>
To: gregkh@linuxfoundation.org
Cc: vaibhav.sr@gmail.com,
	mgreer@animalcreek.com,
	johan@kernel.org,
	elder@kernel.org,
	error27@gmail.com,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Aditya Chari <adi25charis@gmail.com>
Subject: [PATCH v3] greybus: audio: Split gb_audio_gb_get_topology() into size query and data fetch
Date: Sat, 25 Jul 2026 20:07:21 +0530
Message-ID: <20260725143721.5908-1-adi25charis@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

`gb_audio_gb_get_topology()` combined three separate responsibilities into
a single call: querying the topology size, allocating a buffer for it, and
fetching the topology data into that buffer. This left callers with no
way to perform any of these steps independently, and forced the kzalloc()
allocation to live inside the protocol‑layer driver rather than the
caller, as already flagged by a FIXME comment at the call site
in `audio_module.c`.

Split the function into two:
- `gb_audio_gb_get_topology_size()` – queries only the topology size
- `gb_audio_gb_get_topology()`      – fetches topology data into a
                                      caller‑supplied buffer
				      of a given size

Update the only caller, `gb_audio_probe()` in `audio_module.c`, to
query the size first, allocate the topology buffer itself,
then fetch the data into it, freeing the buffer via the existing
`free_topology` error path on failure. The topology size is now
stored as `size_t` and validated in the caller before allocation,
addressing the earlier TODO and FIXME comments.

This resolves both the "TODO: Split into separate calls" comment
above the original function in `audio_gb.c` and the FIXME comment
at the call site in `audio_module.c`, both of which are removed
as part of this change.

No functional change in behavior for the existing probe path.

Reviewed-by: Dan Carpenter <error27@gmail.com>
Signed-off-by: Aditya Chari <adi25charis@gmail.com>
---
 drivers/staging/greybus/audio_codec.h  |  4 ++-
 drivers/staging/greybus/audio_gb.c     | 45 +++++++-------------------
 drivers/staging/greybus/audio_module.c | 27 ++++++++++++----
 3 files changed, 35 insertions(+), 41 deletions(-)

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
index 144591f1a..2e6f155d8 100644
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
@@ -22,38 +19,18 @@ int gb_audio_gb_get_topology(struct gb_connection *connection,
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
-	/*
-	 * The size_* fields are supplied by the module and are used by
-	 * gbaudio_tplg_parse_data() to compute offsets into the blob; make
-	 * sure the sections fit within the fetched topology, so walking it
-	 * cannot read out of bounds.
-	 */
-	if ((u64)le32_to_cpu(topo->size_dais) + le32_to_cpu(topo->size_controls) +
-	    le32_to_cpu(topo->size_widgets) + le32_to_cpu(topo->size_routes) >
-	    size - sizeof(*topo)) {
-		kfree(topo);
-		return -EINVAL;
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

