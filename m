Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F294374752
	for <linux-staging@lists.linux.dev>; Mon, 23 Feb 2026 20:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771876851; cv=none; b=QPEuVyBjVijad1Cn+7AZ99/9Mrk+NWHGttsWW5ZouLHdrcQVXvY198ReXHIan8VJ3SagKfQojZLqzzS0tTFcfe+GnMt2OayrqAjaKSBOnHcibsG9gsDPG8EEJ8k5AEwuzn11ihZnVI9IxJlJl/TwMz5Z6j+7mekazR35X9trDY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771876851; c=relaxed/simple;
	bh=PKmdU+qG447jbsphDFAhQkfsaIYc6767WVx1E78yQA4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=I1wGv7K/cYJDBagOS2wGUrkmACboSiFCxJELc8gvFGDI/EOcxXv9KwKG09FgSpfbSCTrQpXVS3Vmq0bCq9eF+GBgmWooCQlSX4Dx0Qw4l1MH/nxj6UflQXYuyHsGEasDvzv/dVCMMmQSWvu5eG13cBARjMTgxTj483EaxI4wWFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZwUOOdpE; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZwUOOdpE"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-4359a316d89so4348358f8f.0
        for <linux-staging@lists.linux.dev>; Mon, 23 Feb 2026 12:00:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771876848; x=1772481648; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yv125EGKHRfysJ3X3Lulm/FjdhCw6fk0IxMK5xEGXqs=;
        b=ZwUOOdpEh9kvGLCr3UzjEeJfjDAdXxjz8exnWJwgem2FmOzDYEwOMsyyYVL2cXN+ED
         fZKbvjJ3jEvtaxbLmLk19UWX/DCaZKS7T5+zAcW6jvJzpzzOisEqWRaEWREo8hAn8Hvw
         ESx6/VDSfTo2igGr2RSwXZvxCi/UshXo5a1wwCpUhL14BqsHx1NxLls0CwxN9reFgdWj
         R1gxJwcn129Pn8Puiek0Li9k58iXEsvyYfa9LcHMIfyXPJl+3/26F2GwI19DjPCxb6zG
         1rljVg294nRz68tp5jyAHpZjqm1GItKAl/8RhFzhIl3L/fTREed16BQ8Y++313ilRLjd
         DW9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771876848; x=1772481648;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yv125EGKHRfysJ3X3Lulm/FjdhCw6fk0IxMK5xEGXqs=;
        b=doCAKjWM1EWHkXjnAib86N6jmQnbZlY0USOJxj6GFFakCS3gNp4S/WM88J4njXulJB
         CdkiNywZIvLT9C/qpZ4l2an4dtK3T7OE2mrirOcmpj9a+rD1TG0ERYWJrhkV6d0Yw8vG
         g4BJRlZRW0ykIORD/LlkWxegtfGUGxGD6meB/nMocYB6wRCkyGHzwEyNh+3eQ3Vn2Hqt
         MgOFHXhpX3onwHtGum/Nd/n3gXHPn4s2wfFVyBoapII1I0sBYRX57L13UpfM4ONB6l4X
         i5osQwY5ixD5+WIihjm5iokE53GmnYTDuZtdTpZ97voEKsbI3v4n70lDtnr8FcuSaDY9
         q/Aw==
X-Forwarded-Encrypted: i=1; AJvYcCUMBX7wKBB98NXo1UTOrEgzgwCKrqbHMjyINFz6X25aCJQqi8ZrBrzcy4mFqwvPkVhqHkvpjf2e7aa2LD/6@lists.linux.dev
X-Gm-Message-State: AOJu0YxLEJ24gchp4ZKR4MsZqhtY+Jm0zegYA1FxML4TkVPzNj4ayQ/Y
	4Hywn72XGqvQU4ymEpkmxRj1B4LQgspE/FR/nc5ysOun4D2BhV5ji5Gx
X-Gm-Gg: ATEYQzzyTFL3UMrFK7q38b9J8r2ozTDtQdreVszs/Tt0Nb3KjUPywdGTwt0b5g+44PU
	5iqdXwYsltkeQguqJv5cen+3JL69S8esuyuB+rjmIIK2V/EM+4/JvDQCo3OOGJuCZM7C3r2rPtu
	4kj1zsKIE2VLYKVCBIh2qvtrM8qqe2fA5lYY65nGdS4IyircSFv1eq1U47SrWB6cA1djuAEPCiM
	ieTdUrZj6ls+RUVJY8Id1OOc9lNxlTnQCsyrtLmZ20mv+sfT4Lp0v6gRp4s/4f2GD5QdyBLQA0p
	HhLFtqf0P63KuuZKa7iLLg6eFmalK/wffFd72J+KA/+g+3Tgucvk/JIjcNW0Bo+w9l/bgxq3mVF
	5bgOj7hHi/TVkvU6d+YSXF+om8KQOi5I0gqZDgHsLA+1RxZ1EQr6cPB+fSgRO4rZQ2d+BRoOMAx
	m08mYHXwVVt8PjM5aho48x18/M5z7tX9pbK+0nG6M=
X-Received: by 2002:a05:6000:1a8a:b0:436:3563:499c with SMTP id ffacd0b85a97d-4396f14c9bfmr15966473f8f.8.1771876847774;
        Mon, 23 Feb 2026 12:00:47 -0800 (PST)
Received: from localhost.localdomain ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970c00e8bsm17975577f8f.15.2026.02.23.12.00.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 12:00:45 -0800 (PST)
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
To: vaibhav.sr@gmail.com,
	mgreer@animalcreek.com
Cc: johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: greybus: move topology allocation to codec probe
Date: Mon, 23 Feb 2026 20:59:35 +0100
Message-ID: <20260223195939.71151-1-azpijr@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The FIXME in gb_audio_probe noted that memory allocation for the
topology should happen within the codec driver rather than the
greybus helper.

Move the size-check and kzalloc from audio_gb.c to audio_module.c
and update the function signature of gb_audio_gb_get_topology to
accept the pointer. This clarifies ownership of the allocated memory.

Signed-off-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>
---
 drivers/staging/greybus/audio_gb.c     | 33 +++-----------------------
 drivers/staging/greybus/audio_module.c | 29 ++++++++++++++++++----
 2 files changed, 27 insertions(+), 35 deletions(-)

diff --git a/drivers/staging/greybus/audio_gb.c b/drivers/staging/greybus/audio_gb.c
index 9d8994fdb41a..4037b3bf1e9f 100644
--- a/drivers/staging/greybus/audio_gb.c
+++ b/drivers/staging/greybus/audio_gb.c
@@ -8,38 +8,11 @@
 #include <linux/greybus.h>
 #include "audio_codec.h"

-/* TODO: Split into separate calls */
 int gb_audio_gb_get_topology(struct gb_connection *connection,
-			     struct gb_audio_topology **topology)
+			     struct gb_audio_topology *topology)
 {
-	struct gb_audio_get_topology_size_response size_resp;
-	struct gb_audio_topology *topo;
-	u16 size;
-	int ret;
-
-	ret = gb_operation_sync(connection, GB_AUDIO_TYPE_GET_TOPOLOGY_SIZE,
-				NULL, 0, &size_resp, sizeof(size_resp));
-	if (ret)
-		return ret;
-
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
-
-	return 0;
+	return gb_operation_sync(connection, GB_AUDIO_TYPE_GET_TOPOLOGY,
+			NULL, 0, topology, le16_to_cpu(topology->size));
 }
 EXPORT_SYMBOL_GPL(gb_audio_gb_get_topology);

diff --git a/drivers/staging/greybus/audio_module.c b/drivers/staging/greybus/audio_module.c
index 12c376c477b3..8efb720c3f30 100644
--- a/drivers/staging/greybus/audio_module.c
+++ b/drivers/staging/greybus/audio_module.c
@@ -240,6 +240,8 @@ static int gb_audio_probe(struct gb_bundle *bundle,
 	struct gbaudio_data_connection *dai, *_dai;
 	int ret, i;
 	struct gb_audio_topology *topology;
+	struct gb_audio_get_topology_size_response size_resp;
+	u16 size;

 	/* There should be at least one Management and one Data cport */
 	if (bundle->num_cports < 2)
@@ -304,13 +306,30 @@ static int gb_audio_probe(struct gb_bundle *bundle,
 	}
 	gbmodule->dev_id = gbmodule->mgmt_connection->intf->interface_id;

-	/*
-	 * FIXME: malloc for topology happens via audio_gb driver
-	 * should be done within codec driver itself
-	 */
-	ret = gb_audio_gb_get_topology(gbmodule->mgmt_connection, &topology);
+	ret = gb_operation_sync(gbmodule->mgmt_connection,
+				GB_AUDIO_TYPE_GET_TOPOLOGY_SIZE, NULL, 0,
+			&size_resp, sizeof(size_resp));
+	if (ret)
+		goto disable_connection;
+
+	size = le16_to_cpu(size_resp.size);
+	if (size < sizeof(*topology)) {
+		ret = -ENODATA;
+		goto disable_connection;
+	}
+
+	topology = kzalloc(size, GFP_KERNEL);
+	if (!topology) {
+		ret = -ENOMEM;
+		goto disable_connection;
+	}
+
+	topology->size = cpu_to_le16(size);
+
+	ret = gb_audio_gb_get_topology(gbmodule->mgmt_connection, topology);
 	if (ret) {
 		dev_err(dev, "%d:Error while fetching topology\n", ret);
+		kfree(topology);
 		goto disable_connection;
 	}

--
2.53.0

