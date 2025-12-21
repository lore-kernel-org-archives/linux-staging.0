Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B88B2264CB
	for <linux-staging@lists.linux.dev>; Sun, 21 Dec 2025 19:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766346207; cv=none; b=kPpZU6VRUqdHNo073bMX3g/sYIEeStcUwWZBm4lI4fZ2ginmFyBDb5bT1l+6gDVXNCU5rqcWbgVFpMYy3cN0/XZE2uQWcdCJ/y0lY5kZK6z+bt46+DGMj300tPkk7vm2du9OYIukrKTiNYwyfl7ikbCzwpYrVXdi4ly5CcG9QJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766346207; c=relaxed/simple;
	bh=8MkiJ9l3gXf26l7eUhu+fHGq0DUPEJX+5VB55TLN1bk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jsL1uXkOxmxDrtUHkECafVhaZc3o12P2WG1pvS/doxQmOrWnGDFq2Kn8tH70Va7KsP8KfAkQIKLq0exrRswW+G49Yd0GZvK/+kOvlbM3GFZftetCwIxjxpL0D1qLU7lyuZn5Hvy0suFbCZvAFZoUnLRJFeOJvRnY2Ap1NC/foWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y2tHd/xa; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y2tHd/xa"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b736ffc531fso597531066b.1
        for <linux-staging@lists.linux.dev>; Sun, 21 Dec 2025 11:43:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766346204; x=1766951004; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jxh4QQw2NyKDdmoVRlV29xSMRqLITbJdSU7eZMok6SE=;
        b=Y2tHd/xaeD+FBcDNjnAIGAvNHvZmBCtBOX5AnhnYJ8EuEz7LlR85O1zqwvAvq0rA5P
         Ri48bae6E3qjIhMAzfDwyD05FuzNmDKSbwuDPugnHeDZHfq+Xb6e46ePtryvM53jk5Oy
         H1dF9SGyC0wmtss+Dx+bBsLmurtz0Bg49SjRIlVLnXpHC8qYqOpVbWIV2/SQPmWmgn35
         K2ocNq8ZTwlgZZ68RllDGqa7bqO2Gh6nwGpvADng3l2SsgnY2wpEAiqm+HlQHFXe+Ge/
         iXzFblXp+kexuUrb08o6KixViRG3HMyUzprbePsIyeuojtyJahDx4nM0kTNymyjxwfiS
         5oWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766346204; x=1766951004;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jxh4QQw2NyKDdmoVRlV29xSMRqLITbJdSU7eZMok6SE=;
        b=VSTUm7rXpksmOoqIDqt14mTLpONC6dOlxw4Ym7K0aqrxg1Vl2QVtuF8L+r2JAzAyy0
         fcz8C+f+Kl+vR3Hg0Wn+s2GvXofZ20VibzRfl5anyu/oKEEP6/qvsGuqgYULcnq9V+ta
         oNRrGiCsg4q5Nt0ExIUthgf8RU7GWLss+zO/hlQYvkkz4peUmJeIbJPtFhGGpMPP0nma
         rz4rWAdhmkdl4HmO5X31F4vFgyHlh736SR4TKtE4iIF8+b7gyricuTSTPeZ6JbyQffYi
         siwNkibusigDv5yWdIyf0Ai5m31R0kuxsgW9dKMY15B2tUhSf156T2jIrNl/dDBiiIJ6
         rBUA==
X-Gm-Message-State: AOJu0Yzx4U7YwbgaDpSX68oYaH9Xrl12DafT8Dtv8qTljAlhPKrQsTvc
	rXmu6kp2W2LGBq5TcavDTkovK+9oCpF08qxSGO+Jqek/OzMRj0IqSdKq
X-Gm-Gg: AY/fxX5dFYfajU9L9IOZnh8RdRVMNAbNdizZ6YBRZWx0W9OYjyMcUO0R+8xNQyWPTkU
	qWA6UiFNZsxDa5ASxGRReY7EeihDzZRbb4p8q1NB+bzZywmYmoCyMnh2peA7BLrvkgouCPZt4bZ
	9+x9p8SJcKe2Z1dW3kXlZmQ/6sOxaa2cpfh9AVmuhuXehQManUhz8cubfXN9bMl9l7wC6ROqv78
	WMnwuo15FbDwasDiN2jKt0Syaon9dnOgG2PlXN+HwMasJHU95ZuYKoH5B6Fi0nc75EB/tlmQy8C
	kM7SluywFXpN4eHbREOqPz6DsgClkfzwO+cHekse2d9dVzuq3zU8v5plqAaSpPIgwFiWf1GQ9C7
	0Yt9blB5NIcs5CgaYTbICP2Nvr4uEfkxUdzCEDF0ADaIIApXCO7Tsz7TnhKjAWSSiSzSjCQCd31
	WPmzRKIsNGvndSYF/YKseVw7jeFXeMuA==
X-Google-Smtp-Source: AGHT+IGkIfh0VwS6BbVacOE2kQwJxWv5qp/5Cxbpal1MiVKjNto7RZRca4sUvWddiXaTy/fN+uPhCw==
X-Received: by 2002:a17:907:75c3:b0:b80:3fb7:f3a8 with SMTP id a640c23a62f3a-b803fb7f6f6mr581892766b.63.1766346203667;
        Sun, 21 Dec 2025 11:43:23 -0800 (PST)
Received: from localhost.localdomain ([105.39.61.76])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8045a086fasm653170066b.70.2025.12.21.11.43.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Dec 2025 11:43:23 -0800 (PST)
From: Khaled Saleh <khaled.saleh.req@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	greybus-dev@lists.linaro.org,
	khaled <khaled.saleh.req@gmail.com>
Subject: [PATCH] staging: greybus: split gb_audio_gb_get_topology() into helper functions
Date: Sun, 21 Dec 2025 21:42:00 +0200
Message-ID: <20251221194200.3734-1-khaled.saleh.req@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: khaled <khaled.saleh.req@gmail.com>

The gb_audio_gb_get_topology() function performs multiple distinct
operations: retrieving the topology size, allocating the topology buffer,
and fetching the topology data. A TODO comment in the file notes that
this logic should be split into separate calls.

Introduce helper functions for each step and update
gb_audio_gb_get_topology() to use them.

This improves readability and maintainability without changing behavior.

Signed-off-by: Khaled Saleh <khaled.saleh.req@gmail.com>
---
 drivers/staging/greybus/audio_gb.c | 47 +++++++++++++++++++++++-------
 1 file changed, 36 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/greybus/audio_gb.c b/drivers/staging/greybus/audio_gb.c
index 9d8994fdb41a..0d5109ec14f6 100644
--- a/drivers/staging/greybus/audio_gb.c
+++ b/drivers/staging/greybus/audio_gb.c
@@ -9,36 +9,61 @@
 #include "audio_codec.h"
 
 /* TODO: Split into separate calls */
+static int gb_audio_topology_get_size(struct gb_connection *connection, u16 *size)
+{
+	struct gb_audio_get_topology_size_response resp;
+	int ret;
+
+	ret = gb_operation_sync(connection,
+				GB_AUDIO_TYPE_GET_TOPOLOGY_SIZE,
+				NULL, 0,
+				&resp, sizeof(resp));
+	if (ret)
+		return ret;
+
+	*size = le16_to_cpu(resp.size);
+
+	return 0;
+}
+
+static struct gb_audio_topology *gb_audio_topology_alloc(u16 size)
+{
+	if (size < sizeof(struct gb_audio_topology))
+		return NULL;
+
+	return kzalloc(size, GFP_KERNEL);
+}
+
+static int gb_audio_topology_fetch(struct gb_connection *connection,
+				   struct gb_audio_topology *topo, u16 size)
+{
+	return gb_operation_sync(connection,
+				 GB_AUDIO_TYPE_GET_TOPOLOGY,
+				 NULL, 0,
+				 topo, size);
+}
 int gb_audio_gb_get_topology(struct gb_connection *connection,
 			     struct gb_audio_topology **topology)
 {
-	struct gb_audio_get_topology_size_response size_resp;
 	struct gb_audio_topology *topo;
 	u16 size;
 	int ret;
 
-	ret = gb_operation_sync(connection, GB_AUDIO_TYPE_GET_TOPOLOGY_SIZE,
-				NULL, 0, &size_resp, sizeof(size_resp));
+	ret = gb_audio_topology_get_size(connection, &size);
 	if (ret)
 		return ret;
 
-	size = le16_to_cpu(size_resp.size);
-	if (size < sizeof(*topo))
-		return -ENODATA;
-
-	topo = kzalloc(size, GFP_KERNEL);
+	topo = gb_audio_topology_alloc(size);
 	if (!topo)
 		return -ENOMEM;
 
-	ret = gb_operation_sync(connection, GB_AUDIO_TYPE_GET_TOPOLOGY, NULL, 0,
-				topo, size);
+	ret = gb_audio_topology_fetch(connection, topo, size);
 	if (ret) {
 		kfree(topo);
 		return ret;
 	}
 
 	*topology = topo;
-
 	return 0;
 }
 EXPORT_SYMBOL_GPL(gb_audio_gb_get_topology);
-- 
2.43.0

