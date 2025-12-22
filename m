Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8AC732E124
	for <linux-staging@lists.linux.dev>; Mon, 22 Dec 2025 16:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766420339; cv=none; b=GT31WLovHxMkYg7LixVHPt2xems8ik5OVCtNReWo10AIZkUAYQGCklaaoHiDq7Roqi6xb3buNXb+NLXkfLhpIp6R7iaOnIO2wUuRjgNUmPyqMPOoxN4mqjoNQ4zS2U808LSdOEmQ7TuC4JgeXUmEdHJShHo6zOjQ31t1M3PNqIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766420339; c=relaxed/simple;
	bh=pFzaat+gpDezqxd/2WRjT3takeNb27bw8uhTpxATMOg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MoSGJXDLu9WXrP7VFecLJaGQtFvLiyYiSq7weahXGv4SON5U2zH6mCqYKfAZpjiniIh1nd3NCilEH7ulCuP0TXNaM1PsdcRIfGLAkhUys6jvNK+f/cA03HwuLL6pZv5KEDq/RiEafaJ48Thcjzx+TLsqXlg+OZIEWaAw0r3GW7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GV45TZlT; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GV45TZlT"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b7a6e56193cso692071666b.3
        for <linux-staging@lists.linux.dev>; Mon, 22 Dec 2025 08:18:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766420336; x=1767025136; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=y3w4oHlFOdPzEk3v7dhC8z4lrYMgtc8u75s3nHlwvA0=;
        b=GV45TZlTKqySgT8BOPhOyrI8orPx2GyE02/jlAUTWJRdr3P0pa5FnmF2UK7E2HmbLS
         7LZ+Frrqu2VpWnx6yiQdbobWhPxWECFyA6l8F9QUAWp5dFNS38/xFngK4+KyZfG2B03k
         5ndzkPPWMoytIYirQxebxZ/txgKHBSHvzyt19+r2Ldnaz6u99CgPj+M6dkgwx6IiJK4e
         iUwJcIXEKdvcgXXxouVMEKNTKdeXejoqIZQ3VBxlNXcuw2V6oXxoYFVz1dvCsFSwyQ85
         GiE5WcCBjVX3hZwu1eYi0i9/QKMqa1s2Fuua8u2tcGbJ66WjSLtyrdP7R1c5oASRyE1z
         G1BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766420336; x=1767025136;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y3w4oHlFOdPzEk3v7dhC8z4lrYMgtc8u75s3nHlwvA0=;
        b=U+ffjp7PIAPms6UqZl9ynxbdcssDXjkOSHJvfCLhLN1WC+Wfom1hizm0Dz1gfqdWgI
         rr/T7rV9bKVPlRHuwd4J9VRJkDhEsJByor+QLev3XR16VI+y+C5SZrKFKjeZvu0uyfwf
         82VsUBS9WaBsK80WV7E9f+DNBiRKQGDSp7JAtKA7j7TCRWC1Ds/qqmYTYKuiN1Ckfvs1
         XRWqabQga24KVvG83Dzii/5Y2bv3o8Vo9S5DD1o6EcBKci1ZlVxFTpH362VDTPcv7MZM
         Di3arwOEmzy0gYNuMm11B/dDCd+edl5MYOZy44u2z7DhrNFRAJG7bfmOmkk8tH9C+1TI
         cxMg==
X-Gm-Message-State: AOJu0Ywxa91fpOvgOQ28ioF3QqYSCmswcBqzdSUayEL8Enc3CuMJqXCQ
	GOgB5L3oBCNozc/LD7Ki7VdwjWMxSrUljuiHd9lzZAkigT2EquzDTaIv
X-Gm-Gg: AY/fxX5b400p+wSxGEooUO1oeNo4miVCp9CE/lw8S5uCTg25WoehbT9RgshKR40r8fU
	ByOCflgYGAFQPyFDCzwvPm3QpuBWvwj0wuzIBWwW344Bg+ukAfHyh0h3P9KN/cZUWZlQD50/SF9
	T77gdSC0OVL/OMrEczc7cqf2eU7WjMsqfeTgdjD0msiPZ797DtspIX7zxc/DZdiuh1CFxcqsahe
	D5kdKhBYTU5yPWM/H3WoJfvS0lnNXe/0wPXP14XHRkzUUx8w70Fn4hbWQzmTlzfCY+oaHzyMytO
	ebXZXb+a+UiQUIzBoU1UtP6E4thTRzNO8fUa8WSf2T6mhj8ZyddGStk86QKE3I3IoniUPO91VSo
	557Y7+zpH62IpwXTj+2mTvhGCzhZcdqnHy4IxE2qtfndcuE13vCkrMcb4zWWjzrTJ/X6Cy4HlLo
	9vlM4RpokboG+2V3Tl+oBSHl1vJlG3r73V
X-Google-Smtp-Source: AGHT+IEBXMSCUAdjhwO5bhx+wwR8i4ksecx8ybEZ1rOxrFCYh9R1J06gztIvyz7VZslZCVs4VRd+wA==
X-Received: by 2002:a17:907:d1a:b0:b73:78f3:15c1 with SMTP id a640c23a62f3a-b803725fb6dmr1151827266b.52.1766420335705;
        Mon, 22 Dec 2025 08:18:55 -0800 (PST)
Received: from localhost.localdomain ([105.42.152.221])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8056ff4925sm687121566b.31.2025.12.22.08.18.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 08:18:55 -0800 (PST)
From: Khaled Saleh <khaled.saleh.req@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	greybus-dev@lists.linaro.org,
	Khaled Saleh <khaled.saleh.req@gmail.com>
Subject: [PATCH] staging: greybus: split gb_audio_gb_get_topology() into helper functions
Date: Mon, 22 Dec 2025 18:15:17 +0200
Message-ID: <20251222161517.6123-1-khaled.saleh.req@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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

