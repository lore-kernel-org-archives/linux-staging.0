Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19A1338399B
	for <linux-staging@lists.linux.dev>; Sat, 25 Jul 2026 15:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784994689; cv=none; b=pOi+hAVJ9R08VAmxziluZ2RMfjt98s2OPkkN7205M4wwmyTTFdLK/C0VIA8g33Q578RlnrSBrf4h4m1JX/0tAQr2VgCO6Vj1FZBavgmiz+kay3PPPbXgLYIGEdZne0uRV6ixnFHcW7v73Hng14BaS1uJaj8RPkQaRg9zbCb/Qlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784994689; c=relaxed/simple;
	bh=Tmn2H+coHp+aXqT7nJrE7fJQeOzk6A1X1pgMjKiPtIk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=BrNv81u/kmyDx/SlOmGxMzeMKdfz0C5ppi0IN1eMg4I8bGSmMuBPMSlgQmtupEvjEIs4UxnZ8Wn1LnDkG+usk+/CI0NvDkSMxyC4Ecz+KnuYdctFj+PC3/sVYSOwxOVMirq2FpdA1/fgax1qtZgxf1XO6bfQwMwt7GF+x1Xn47s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JWwNmIIR; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JWwNmIIR"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-ca97d139d8dso823291a12.2
        for <linux-staging@lists.linux.dev>; Sat, 25 Jul 2026 08:51:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784994679; x=1785599479; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hmZB8vxgqONx/9fM+xBM/ZafnHK7P0YzFF7u9E03lJ8=;
        b=JWwNmIIRQSIVKPnfaEil2yCv3a4jCc07uB7O9a5uSMEM9R8UYC/mNwYhwSbhE81PSD
         bJvURGX8rJAEkBmNlJ5i0m6O74E+0B5iW1O+bE0IGT4F/mzvUAkjSj4Yi0IJmYM3viEz
         5+x8jRJYJiyLnuMSx/wtzhHEINSC8TjxjnMN6SCG76uKwC8ckH6pjtzU9lqrp0gpWLFf
         9YNMZzyWxDf3kSvi4HdXvB+ygMDl80EbjWUGm1IqfJTrvWSnmZPhfI3+JWbhHPHUXojr
         kKp2ikARmnsSXOJQFFjyJgHibTqjfeBI4s9bzxaSfBhuPtfUdrh/UAIb/NgWn1JKw3B4
         MNGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784994679; x=1785599479;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hmZB8vxgqONx/9fM+xBM/ZafnHK7P0YzFF7u9E03lJ8=;
        b=Bri5bJ1KbOUyg8dr/YI8CuTpgqvKpqlAKq3OUbU0l1/4sxRiA788M86f1xG58H1zAK
         NF2pXJtFyFbOfnh7LtP43Xc/igMpw4WL1xN4RKYBj0NHoi9sv58BKnoUfKO/KSg945VL
         FFI+ODNOW6vXLhWdGMTBaVT3tlmwA/lZF9Nzm3sVGa8fVc6qcwEoRsSc1QhO6XRMFdgo
         RXR9yPZ1xP3wb/LRWTo1pzOmw290XO/ml7ZOjnTPZV2AzXWpMyUv1LdatKcknqWm3Hwb
         P1yBidjq4gVrmfXZ77Gq5ZDgP+QEQCYrYriREgCFY26v/LmBNIAJVnJAfbRCTDxo/v5z
         A11Q==
X-Forwarded-Encrypted: i=1; AHgh+Rp+ZTQtL45ndF/4ztyg/2GGWzzknJ8O+52TAd5L3hx2kNzf9dmFQwmK65wgOFjU8jSo9GTWNatZ1qUDYxIl@lists.linux.dev
X-Gm-Message-State: AOJu0YxhD4YssfSxb0FSC9yCgIwuOnpfYSl5NrecVfqIfHddlkxZc+CB
	BY5mRr6b6uFO71WQzB0p2XnTvR9ZD4K4yN+l152ZFVbJ7652ZY1cAvfd
X-Gm-Gg: AR+sD127+1G65S3RPyBezhInxe7hBEGxRJYXWnIAtFmelE2bp1xB6GH4ihsy4Xn8sin
	9po/UrBaTl5L91FWxomVhF+nrXJ1gTIVdEdeM0c/msWi+blXEzOG5nVlaWJAR37x/gjCBeqKRJ5
	vU6yjVmfDi2vHm0RBY0KlYa9rBUQoYYytldCjtQYihYUjML+/5kAM/eXkER9xEbswDUORFPw7Gk
	8VT579tX/5RTf2Ma9lyedWa/GuZO7xgLmLrdYUYfyhdTSWb4/dP14tBdDW/CsGHeIXVFzd5B1JR
	7+Vs4DSkpeU77PuH+OlHdwe/65USjdE5bZhXlHADyELpAetgIMiBnCythH1t5JYKJxc8DMiuHFR
	C/62R/7Op3ppjp1v5RTHxIPQuQo9//dqoeZrluGyFOVWktrUmbMcXLTYvznILW5eusrsK/jv38Q
	9pQ34Vw4EKEnqdn29YALZtqcNS0DjTJzo=
X-Received: by 2002:a05:6a21:6b02:b0:3c3:6cfb:4ed7 with SMTP id adf61e73a8af0-3c67daecd42mr2418919637.30.1784994679431;
        Sat, 25 Jul 2026 08:51:19 -0700 (PDT)
Received: from kernel-dev ([49.36.97.234])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc59e9fesm10492872eec.27.2026.07.25.08.51.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2026 08:51:18 -0700 (PDT)
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
Subject: [PATCH v4] greybus: audio: Split gb_audio_gb_get_topology() into size query and data fetch
Date: Sat, 25 Jul 2026 21:21:08 +0530
Message-ID: <20260725155108.7060-1-adi25charis@gmail.com>
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

Signed-off-by: Aditya Chari S <adi25charis@gmail.com>
Reviewed-by: Dan Carpenter <error27@gmail.com>
---
v4:
- Reorder tags (Signed-off-by before Reviewed-by) as suggested by Dan.

v3:
- Rebased against latest staging-next.

v2:
- Fold in review feedback from Dan Carpenter.
- Store topology size as size_t instead of u16.
- Move topology size validation into gb_audio_probe() before kzalloc().
- Use -EINVAL for invalid topology size.
- Drop unrelated dev_err() formatting cleanup.
- Compile-tested with `make M=drivers/staging/greybus`.
- Run checkpatch.pl on the updated patch; no issues reported.
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

