Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBE133D3337
	for <linux-staging@lists.linux.dev>; Tue, 30 Jun 2026 16:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782837977; cv=none; b=Ev4AJNp7UBFNfdstEgtb8XtSCfxQAyqzKERySzcIs+t1quJ6Oxp6m80Gmy7pK8na//cE6OMFcbSYqkyJc+RkmR0ZapTHAQYsA/WEG1EH2bdY17gr4bn2g1YPUS71rP799WY2ECp5fsZtorq6baxZAiYDrkU+7nYfmWyqsFd6wAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782837977; c=relaxed/simple;
	bh=tJsTMzKtM2ckujc94qHb7B5O1XskWikXz82K3hR7thA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GHXDle2YNtphNEIxiwuQkmQi1X8SS14WCy55QrGAvB8DxzrtQQ5+wFuMEw8q760kAFn5BXHlpQMrASbbrndL+LqJ1jxhBlWyd7uOhvtUkTvZR3+lMSkr/VqQULlf7Zn9AjPAXyVD5d8eVtTgAoUWExdqDPgSPStO0qIBtLBup1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QfBuB7ac; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QfBuB7ac"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2c7c61b5292so42886385ad.0
        for <linux-staging@lists.linux.dev>; Tue, 30 Jun 2026 09:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782837975; x=1783442775; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HHhIFB/lwAV7YlLBcirT3lG64iGvOufo3zoAL+EAuJg=;
        b=QfBuB7acpoR1M4UGPB6eirRr1Y6IseL2Poic3Nbw57Y90/kI/5Kw5YMVvfiwXg0fVy
         B6X+d2l/z2k4yLzw/Mv/zvryT7XiC/dufXMU2lWXCxLKBvVfhSHfQQVKx1mzOEXLsAMV
         HJDll/xrYwryN0h6Cg8sF7xsOKBPZOdZXej0rY9cjhSIpj40duk8MYzKwiTcRu8C7A1k
         LEr67qb9NiMNbWBgHbcFaJ+kML16I4/D7fBN3H8QV0h5U5XBvrQJYtEC7trYNKsTeHsa
         V0CibY1bm/zQE8ucJiuCtn9sKbGhFYC5rHelyXMXrzmJ+zjNRhxM3tbwUssTx/L15ZEP
         3b/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782837975; x=1783442775;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HHhIFB/lwAV7YlLBcirT3lG64iGvOufo3zoAL+EAuJg=;
        b=VDZgu7cWC4dvvJR8vWEvD+baXPWGqOWMnRZG6ptx+owGLhwPT74nFbF9jVDHGfLpux
         a21ef/XK7ngjv5tQykxOolWCjMLrhmYwWCUDhC1j/HmiWVngirXWPkYJA+SIyVcNsMSm
         pLm1Wz7mOwpG6YypzaaE0U7rCpHQvgC6T8Sy98A33/34WjvXFJkiJNNjHJMzJoVHShyF
         iWtnq3mOpxkkAY090QDjj2Azv7c31N5jatRhyGHfsabsN3JJH0+uSLrjJY9NzoLpd81Z
         39c4hCHiLPSximPv31nFOi9qu9LcwLpi0OYpDyQd3LAlD6lFpzCf6j4n6Hxe2BADIEcj
         iOjg==
X-Forwarded-Encrypted: i=1; AHgh+RpljLkan26rtF69HwLYwj80nQDmkrhxzousppBPDEXbKn0e1pTwbdpdsIN6wuv0Fvq8ovLLdPZFQenP6wEp@lists.linux.dev
X-Gm-Message-State: AOJu0YzXrHOOCjIVL0Oz8FejCW/Dm8BWhAM4XX1XLyMAQbZ/gyIhIVAO
	zr0zlOMaoBaeqzqFffSJ9Z6PecRpxZ9SHf2j/mO3cb5awgApjuhmvzxQ
X-Gm-Gg: AfdE7clrTjytzOgWQsFcA2dkosmVJOEw9i7GZZrOoSE4HlZWBB7wISarQ2qiymOoHly
	ITrGpBb3T9NR8E+ASTUB5ajLw3L9ycUIEu6xuWFFFF86NdkQzte+URVDrH0Z8ZQQmhghxq2M2sJ
	FDGKHPmhqBoeRBTkpClb3lgrZ9kpKKfL2Uqp2GuSPCnGZshSR0ZMogjVEMY788S0elW2B0pDjhk
	XF1cOKiazg9wQsP5G0QUSuRLvv8aW4oal9NtTl59/1yjcTs+03m+oS0QnEaCwAe+AmJT1G3se/q
	evD7BjDn7V6gJOjqNThj82qIEzY9XSzAalF3zbyTqOdJYi9MPf7eVG4i32MYExBXAWf7EQ1Bsrf
	Utb+dYVv1K/UJsckGIVhiWZtKyCrEpVkW3U0OFPDGf6OjVRBcXqxNxV4xM9ft/w5g3Q+xcz+p+o
	GKPbysszNLLX8T+KS6RyFdn3EB/YdPegCi5dpOlUWP6uvDdvLqPVUS7ek=
X-Received: by 2002:a17:903:234d:b0:2ca:2073:3119 with SMTP id d9443c01a7336-2ca2ea1d0dfmr32374435ad.32.1782837974269;
        Tue, 30 Jun 2026 09:46:14 -0700 (PDT)
Received: from kernel-dev.multipass ([49.36.101.14])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca3828b0e7sm17583155ad.47.2026.06.30.09.46.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 09:46:13 -0700 (PDT)
From: adi25charis@gmail.com
To: error27@gmail.com
Cc: vaibhav.sr@gmail.com,
	mgreer@animalcreek.com,
	johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Aditya Chari S <adi25charis@gmail.com>
Subject: [PATCH v2] staging: greybus: audio: split gb_audio_gb_get_topology()
Date: Tue, 30 Jun 2026 22:16:02 +0530
Message-ID: <20260630164602.37663-1-adi25charis@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <akOy6ORYkzHxodYU@stanley.mountain>
References: <akOy6ORYkzHxodYU@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Aditya Chari S <adi25charis@gmail.com>

Split gb_audio_gb_get_topology() into two functions:
gb_audio_gb_get_topology_size() to fetch the topology size, and
gb_audio_gb_get_topology() to fetch the topology data into a
caller-provided buffer. This moves buffer allocation out of the
audio_gb protocol helper and into gb_audio_probe(), where it
belongs, addressing a long-standing FIXME.

Signed-off-by: Aditya Chari S <adi25charis@gmail.com>
---
v2:
- Store size as size_t instead of u16, per Dan Carpenter.
- Move the size validation (size < sizeof(*topology)) out of
  gb_audio_gb_get_topology() and into gb_audio_probe(), before
  the kzalloc(), per Dan Carpenter.
- Fix dev_err() format strings so %d is no longer printed first;
  put it at the end of the message instead, per Dan Carpenter.

Compile-tested with `make M=drivers/staging/greybus modules`.
All modified files (audio_codec.h, audio_gb.c, audio_module.c)
compile without errors or warnings. checkpatch.pl --no-tree passes
clean on all three files.
---
 drivers/staging/greybus/audio_codec.h  |  4 ++--
 drivers/staging/greybus/audio_gb.c     |  7 ++-----
 drivers/staging/greybus/audio_module.c | 12 +++++++++---
 3 files changed, 13 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/greybus/audio_codec.h b/drivers/staging/greybus/audio_codec.h
index be5a2a86b..b45cd257d 100644
--- a/drivers/staging/greybus/audio_codec.h
+++ b/drivers/staging/greybus/audio_codec.h
@@ -179,9 +179,9 @@ void gbaudio_unregister_module(struct gbaudio_module_info *module);
 
 /* protocol related */
 int gb_audio_gb_get_topology_size(struct gb_connection *connection,
-				  u16 *size);
+				  size_t *size);
 int gb_audio_gb_get_topology(struct gb_connection *connection,
-			     struct gb_audio_topology *topology, u16 size);
+			     struct gb_audio_topology *topology, size_t size);
 int gb_audio_gb_get_control(struct gb_connection *connection,
 			    u8 control_id, u8 index,
 			    struct gb_audio_ctl_elem_value *value);
diff --git a/drivers/staging/greybus/audio_gb.c b/drivers/staging/greybus/audio_gb.c
index e6356643d..2e6f155d8 100644
--- a/drivers/staging/greybus/audio_gb.c
+++ b/drivers/staging/greybus/audio_gb.c
@@ -9,7 +9,7 @@
 #include "audio_codec.h"
 
 int gb_audio_gb_get_topology_size(struct gb_connection *connection,
-				  u16 *size)
+				  size_t *size)
 {
 	struct gb_audio_get_topology_size_response size_resp;
 	int ret;
@@ -26,11 +26,8 @@ int gb_audio_gb_get_topology_size(struct gb_connection *connection,
 EXPORT_SYMBOL_GPL(gb_audio_gb_get_topology_size);
 
 int gb_audio_gb_get_topology(struct gb_connection *connection,
-			     struct gb_audio_topology *topology, u16 size)
+			     struct gb_audio_topology *topology, size_t size)
 {
-	if (size < sizeof(*topology))
-		return -ENODATA;
-
 	return gb_operation_sync(connection, GB_AUDIO_TYPE_GET_TOPOLOGY, NULL, 0,
 				 topology, size);
 }
diff --git a/drivers/staging/greybus/audio_module.c b/drivers/staging/greybus/audio_module.c
index 1163cf093..806533f03 100644
--- a/drivers/staging/greybus/audio_module.c
+++ b/drivers/staging/greybus/audio_module.c
@@ -239,7 +239,7 @@ static int gb_audio_probe(struct gb_bundle *bundle,
 	struct gb_audio_manager_module_descriptor desc;
 	struct gbaudio_data_connection *dai, *_dai;
 	int ret, i;
-	u16 size;
+	size_t size;
 	struct gb_audio_topology *topology;
 
 	/* There should be at least one Management and one Data cport */
@@ -307,7 +307,13 @@ static int gb_audio_probe(struct gb_bundle *bundle,
 
 	ret = gb_audio_gb_get_topology_size(gbmodule->mgmt_connection, &size);
 	if (ret) {
-		dev_err(dev, "%d:Error while fetching topology size\n", ret);
+		dev_err(dev, "Error while fetching topology size: %d\n", ret);
+		goto disable_connection;
+	}
+
+	if (size < sizeof(*topology)) {
+		dev_err(dev, "Invalid topology size: %zu\n", size);
+		ret = -ENODATA;
 		goto disable_connection;
 	}
 
@@ -319,7 +325,7 @@ static int gb_audio_probe(struct gb_bundle *bundle,
 
 	ret = gb_audio_gb_get_topology(gbmodule->mgmt_connection, topology, size);
 	if (ret) {
-		dev_err(dev, "%d:Error while fetching topology\n", ret);
+		dev_err(dev, "Error while fetching topology: %d\n", ret);
 		goto free_topology;
 	}
 
-- 
2.53.0

