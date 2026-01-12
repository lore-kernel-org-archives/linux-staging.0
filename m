Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA77C2C21C2
	for <linux-staging@lists.linux.dev>; Mon, 12 Jan 2026 10:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768214362; cv=none; b=ZABmSnodqx9uT7WjpmNYb+z6onbzfxgF60aJQJGWy/WsjNY37OhB9IO73dUrw+AeHRdtkL/j84XSXOBsgrrfHJ4FSJPLrNPO8KZ3cPfOC2SR0NK03D+61JJdwYLdYZTn3iI4UtHoZG2ItvThbDakvQgxu9YXrwYryKzjQYFQzaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768214362; c=relaxed/simple;
	bh=IadvI/igjuonzkmDbp264AdDOGgg6XR+qsM1nE39ReM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pm+uMjxXG1C6OO3V1V78T1kPDxyj5mh/YLv6+v20fSh35RY671srRfNHXJvpQK4jrVKfJn73Iho8gmTCaYavSQCxT9BgXwDs6amKWf7d8kVnZCI3IZ4hW8nSda6eDwhwA6SGl4txvvTL5kQeXlo1f0DdEtN83oH4U3998r4WrZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SErY2IH+; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SErY2IH+"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-81e7477828bso1321374b3a.0
        for <linux-staging@lists.linux.dev>; Mon, 12 Jan 2026 02:39:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768214358; x=1768819158; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8dxF1px319gzp5LleV4H2jlboyE8vZmrw4Yc7He9t+8=;
        b=SErY2IH+Jcy7SXEiFUcXa036OR8oVaw/yoYNbQNy9kGuk/qoVJApajedEi92mHP8tA
         VDa+3d7EvFl7miBLtylBipaMrheE3fs3stIBD5WakL2Fm/m5Sui5rZG20Yrkpf6AGjSr
         zb08QhCEXRkxgK3s48o3DVqNySyURxxRt9lotlQlbbquoQWdqKG/AUX1lP//Ul/z2uf5
         GR8FMpE72PtW2t2Vmre60k+lDRYvuAvcOazmouDYAGXNkRUfKezDN7hxiakTbnlCgbZ1
         ciO8JGagRl1icsVdTsJBZEZdyVONJJaRxLfTvDTfgFYtlQZ4VKNHWQSddJQ4fCmvjR5b
         ScsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768214358; x=1768819158;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8dxF1px319gzp5LleV4H2jlboyE8vZmrw4Yc7He9t+8=;
        b=cIoyzeiYE409vOlVXjz9ubvnhkga90BZFXSvPdeNCbOmhQNukofCQ2/R3zAPKzvvXx
         KRgkJ2SP7xjf96Wr1TKmkskFHKmrA2EgCT/lUtXdqzlQI/H/aHnLm0N4xbBwyGEWO+VX
         QUhx/A9hfoy8FUfnt6oKqdzF/NIvkbAM1uvX0mBz9R6KTGAONaXZblbTavgivYLedJ0s
         pFYBlKgYY206A0MU5UJjEy6HzyfzcYQ5tQDwadSQsNGiD3sV6nHUrc6QKIMp+kfp5W2i
         SzOYvDEoz8htonNurab6+ADuOA9PsZkJYOUG7i1fH+NEcyj0ESV8AWPYLQi+Gx4CnyqM
         YF7w==
X-Forwarded-Encrypted: i=1; AJvYcCXMbd+5s5fkpI20rGXU6g0jJlX0YFxHzsz+VhoXt8vlGMsw069hffMQB9SdfeXRNUiksHxCKvdNTU24u4DQ@lists.linux.dev
X-Gm-Message-State: AOJu0YyifL3pjkx3DDktpMxPxiIgnewe7u28mgd8H8BBJTGKYwbscVWo
	ZcXkZo90VcI1BaaLEKTkkBJd2V5SYzO/NNQSXuHBDjOQxomRAkLMZP4v
X-Gm-Gg: AY/fxX7GHK6pSAkXozDXgBW04J/jw0aRk3iGq4Ez1UNe8CukRH7ljN/vf3eeE/WZU6Q
	3hJ3N0Qco0DzyUdAni1tCYTGv8cf1ZSUVUqVzPcGOOompzUG3bvb1A7DR/53NwiDZA49yWSrh9L
	m6WMqaUHpBmDLykLwniLLlFbli8SBKN0IVMUdb05ZbYQx4pZOd++TPlMfIl8MU8YBe5uzGid269
	ea/zZNbZkfJT5cNgzClavZEojXbMKVpdUsJqgmjHG8J9Svu6xunTirsE1u7Nyafq6jhcs7Cmatv
	IgaHO5I7ZBf99oJRzfOVHQ8VLq5uTQ4XSMjCxeIJe/5m/ARcQaV13B+2kZToFwG5lx6u1X9pCXh
	BEvL4I7oQDMHG8LMd+4KsAeHyBVy1b2DNYgrbOL14zyY5CTOII4ensl7GZWtNkXMMS5Q8k/q2P1
	f/88nE5ReTnkMExc/hw0UXFeyiZ4gO3A==
X-Google-Smtp-Source: AGHT+IEZN1XNOzjThVCgADBQrSb9BZRXqgTvUuZTBFHr5sGBWS/oZ4gOux7gild0c5LzNioPUIyZ6Q==
X-Received: by 2002:a05:6a00:1ca5:b0:81c:ce40:b29b with SMTP id d2e1a72fcca58-81cce40b605mr10941809b3a.15.1768214358166;
        Mon, 12 Jan 2026 02:39:18 -0800 (PST)
Received: from localhost.localdomain ([103.215.237.209])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81f3909d2cbsm6539877b3a.48.2026.01.12.02.39.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 02:39:17 -0800 (PST)
From: Karthikey Kadati <karthikey3608@gmail.com>
To: andy@kernel.org,
	hansg@kernel.org,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: sakari.ailus@linux.intel.com,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Karthikey Kadati <karthikey3608@gmail.com>
Subject: [PATCH v2 1/2] staging: atomisp: Remove input_system typedefs
Date: Mon, 12 Jan 2026 16:08:47 +0530
Message-ID: <20260112103848.22980-1-karthikey3608@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove input_system_channel_t and input_system_input_port_t typedefs.

Replace usages with struct input_system_channel and

struct input_system_input_port respectively.

Signed-off-by: Karthikey Kadati <karthikey3608@gmail.com>
---
 .../atomisp/pci/isp2401_input_system_global.h | 12 ++--
 .../pci/runtime/isys/src/virtual_isys.c       | 56 +++++++++----------
 drivers/staging/media/atomisp/pci/sh_css.c    |  4 +-
 3 files changed, 35 insertions(+), 37 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/isp2401_input_system_global.h b/drivers/staging/media/atomisp/pci/isp2401_input_system_global.h
index 4aadeb133..bce8aa999 100644
--- a/drivers/staging/media/atomisp/pci/isp2401_input_system_global.h
+++ b/drivers/staging/media/atomisp/pci/isp2401_input_system_global.h
@@ -34,8 +34,7 @@ typedef enum {
 	N_INPUT_SYSTEM_SOURCE_TYPE
 } input_system_source_type_t;
 
-typedef struct input_system_channel_s input_system_channel_t;
-struct input_system_channel_s {
+struct input_system_channel {
 	stream2mmio_ID_t	stream2mmio_id;
 	stream2mmio_sid_ID_t	stream2mmio_sid_id;
 
@@ -55,8 +54,7 @@ struct input_system_channel_cfg_s {
 	isys2401_dma_port_cfg_t	dma_dest_port_cfg;
 };
 
-typedef struct input_system_input_port_s input_system_input_port_t;
-struct input_system_input_port_s {
+struct input_system_input_port {
 	input_system_source_type_t	source_type;
 
 	struct {
@@ -141,9 +139,9 @@ struct virtual_input_system_stream_s {
 								Must be unique within one CSI RX
 								and lower than SH_CSS_MAX_ISYS_CHANNEL_NODES */
 	u8 enable_metadata;
-	input_system_input_port_t	input_port;
-	input_system_channel_t		channel;
-	input_system_channel_t		md_channel; /* metadata channel */
+	struct input_system_input_port	input_port;
+	struct input_system_channel		channel;
+	struct input_system_channel		md_channel; /* metadata channel */
 	u8 online;
 	s8 linked_isys_stream_id;
 	u8 valid;
diff --git a/drivers/staging/media/atomisp/pci/runtime/isys/src/virtual_isys.c b/drivers/staging/media/atomisp/pci/runtime/isys/src/virtual_isys.c
index e6c11d5f7..291b2fb33 100644
--- a/drivers/staging/media/atomisp/pci/runtime/isys/src/virtual_isys.c
+++ b/drivers/staging/media/atomisp/pci/runtime/isys/src/virtual_isys.c
@@ -26,28 +26,28 @@
 static bool create_input_system_channel(
     isp2401_input_system_cfg_t	*cfg,
     bool			metadata,
-    input_system_channel_t	*channel);
+    struct input_system_channel	*channel);
 
 static void destroy_input_system_channel(
-    input_system_channel_t	*channel);
+    struct input_system_channel	*channel);
 
 static bool create_input_system_input_port(
     isp2401_input_system_cfg_t		*cfg,
-    input_system_input_port_t	*input_port);
+    struct input_system_input_port	*input_port);
 
 static void destroy_input_system_input_port(
-    input_system_input_port_t	*input_port);
+    struct input_system_input_port	*input_port);
 
 static bool calculate_input_system_channel_cfg(
-    input_system_channel_t		*channel,
-    input_system_input_port_t	*input_port,
+    struct input_system_channel		*channel,
+    struct input_system_input_port	*input_port,
     isp2401_input_system_cfg_t		*isys_cfg,
     input_system_channel_cfg_t	*channel_cfg,
     bool metadata);
 
 static bool calculate_input_system_input_port_cfg(
-    input_system_channel_t		*channel,
-    input_system_input_port_t	*input_port,
+    struct input_system_channel		*channel,
+    struct input_system_input_port	*input_port,
     isp2401_input_system_cfg_t		*isys_cfg,
     input_system_input_port_cfg_t	*input_port_cfg);
 
@@ -89,8 +89,8 @@ static void release_be_lut_entry(
     csi_rx_backend_lut_entry_t	*entry);
 
 static bool calculate_prbs_cfg(
-    input_system_channel_t		*channel,
-    input_system_input_port_t	*input_port,
+    struct input_system_channel		*channel,
+    struct input_system_input_port	*input_port,
     isp2401_input_system_cfg_t		*isys_cfg,
     pixelgen_prbs_cfg_t		*cfg);
 
@@ -99,7 +99,7 @@ static bool calculate_fe_cfg(
     csi_rx_frontend_cfg_t		*cfg);
 
 static bool calculate_be_cfg(
-    const input_system_input_port_t	*input_port,
+    const struct input_system_input_port	*input_port,
     const isp2401_input_system_cfg_t	*isys_cfg,
     bool				metadata,
     csi_rx_backend_cfg_t		*cfg);
@@ -110,13 +110,13 @@ static bool calculate_stream2mmio_cfg(
     stream2mmio_cfg_t		*cfg);
 
 static bool calculate_ibuf_ctrl_cfg(
-    const input_system_channel_t	*channel,
-    const input_system_input_port_t	*input_port,
+    const struct input_system_channel	*channel,
+    const struct input_system_input_port	*input_port,
     const isp2401_input_system_cfg_t	*isys_cfg,
     ibuf_ctrl_cfg_t			*cfg);
 
 static bool calculate_isys2401_dma_cfg(
-    const input_system_channel_t	*channel,
+    const struct input_system_channel	*channel,
     const isp2401_input_system_cfg_t	*isys_cfg,
     isys2401_dma_cfg_t		*cfg);
 
@@ -263,7 +263,7 @@ ia_css_isys_error_t ia_css_isys_stream_calculate_cfg(
 static bool create_input_system_channel(
     isp2401_input_system_cfg_t	*cfg,
     bool			metadata,
-    input_system_channel_t	*me)
+    struct input_system_channel	*me)
 {
 	bool rc = true;
 
@@ -324,7 +324,7 @@ static bool create_input_system_channel(
 }
 
 static void destroy_input_system_channel(
-    input_system_channel_t	*me)
+    struct input_system_channel	*me)
 {
 	release_sid(me->stream2mmio_id,
 		    &me->stream2mmio_sid_id);
@@ -336,7 +336,7 @@ static void destroy_input_system_channel(
 
 static bool create_input_system_input_port(
     isp2401_input_system_cfg_t		*cfg,
-    input_system_input_port_t	*me)
+    struct input_system_input_port	*me)
 {
 	csi_mipi_packet_type_t packet_type;
 	bool rc = true;
@@ -410,7 +410,7 @@ static bool create_input_system_input_port(
 }
 
 static void destroy_input_system_input_port(
-    input_system_input_port_t	*me)
+    struct input_system_input_port	*me)
 {
 	if (me->source_type == INPUT_SYSTEM_SOURCE_TYPE_SENSOR) {
 		release_be_lut_entry(
@@ -429,8 +429,8 @@ static void destroy_input_system_input_port(
 }
 
 static bool calculate_input_system_channel_cfg(
-    input_system_channel_t		*channel,
-    input_system_input_port_t	*input_port,
+    struct input_system_channel		*channel,
+    struct input_system_input_port	*input_port,
     isp2401_input_system_cfg_t		*isys_cfg,
     input_system_channel_cfg_t	*channel_cfg,
     bool metadata)
@@ -480,8 +480,8 @@ static bool calculate_input_system_channel_cfg(
 }
 
 static bool calculate_input_system_input_port_cfg(
-    input_system_channel_t		*channel,
-    input_system_input_port_t	*input_port,
+    struct input_system_channel		*channel,
+    struct input_system_input_port	*input_port,
     isp2401_input_system_cfg_t		*isys_cfg,
     input_system_input_port_cfg_t	*input_port_cfg)
 {
@@ -613,8 +613,8 @@ static void release_be_lut_entry(
 }
 
 static bool calculate_prbs_cfg(
-    input_system_channel_t		*channel,
-    input_system_input_port_t	*input_port,
+    struct input_system_channel		*channel,
+    struct input_system_input_port	*input_port,
     isp2401_input_system_cfg_t		*isys_cfg,
     pixelgen_prbs_cfg_t		*cfg)
 {
@@ -632,7 +632,7 @@ static bool calculate_fe_cfg(
 }
 
 static bool calculate_be_cfg(
-    const input_system_input_port_t	*input_port,
+    const struct input_system_input_port	*input_port,
     const isp2401_input_system_cfg_t	*isys_cfg,
     bool				metadata,
     csi_rx_backend_cfg_t		*cfg)
@@ -677,8 +677,8 @@ static bool calculate_stream2mmio_cfg(
 }
 
 static bool calculate_ibuf_ctrl_cfg(
-    const input_system_channel_t	*channel,
-    const input_system_input_port_t	*input_port,
+    const struct input_system_channel	*channel,
+    const struct input_system_input_port	*input_port,
     const isp2401_input_system_cfg_t	*isys_cfg,
     ibuf_ctrl_cfg_t			*cfg)
 {
@@ -759,7 +759,7 @@ static bool calculate_ibuf_ctrl_cfg(
 }
 
 static bool calculate_isys2401_dma_cfg(
-    const input_system_channel_t	*channel,
+    const struct input_system_channel	*channel,
     const isp2401_input_system_cfg_t	*isys_cfg,
     isys2401_dma_cfg_t		*cfg)
 {
diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
index 73bd87f43..ec4d15ffe 100644
--- a/drivers/staging/media/atomisp/pci/sh_css.c
+++ b/drivers/staging/media/atomisp/pci/sh_css.c
@@ -665,7 +665,7 @@ static bool sh_css_translate_stream_cfg_to_input_system_input_port_id(
 	return rc;
 }
 
-static bool sh_css_translate_stream_cfg_to_input_system_input_port_type(
+static bool sh_css_translate_stream_cfg_to_struct input_system_input_portype(
     struct ia_css_stream_config *stream_cfg,
     ia_css_isys_descr_t	*isys_stream_descr)
 {
@@ -852,7 +852,7 @@ static bool sh_css_translate_stream_cfg_to_isys_stream_descr(
 			    "sh_css_translate_stream_cfg_to_isys_stream_descr() enter:\n");
 	rc  = sh_css_translate_stream_cfg_to_input_system_input_port_id(stream_cfg,
 		isys_stream_descr);
-	rc &= sh_css_translate_stream_cfg_to_input_system_input_port_type(stream_cfg,
+	rc &= sh_css_translate_stream_cfg_to_struct input_system_input_portype(stream_cfg,
 		isys_stream_descr);
 	rc &= sh_css_translate_stream_cfg_to_input_system_input_port_attr(stream_cfg,
 		isys_stream_descr, isys_stream_idx);
-- 
2.43.0

