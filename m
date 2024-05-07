Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5AEB4F61D
	for <linux-staging@lists.linux.dev>; Tue,  7 May 2024 05:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715059523; cv=none; b=mDS4t8/K6EovqaUc7hdWA8qNjQBU9oArVj8stf8V05+iqKfuqGoxVS5sH3KVEPh6yzOSg4WY81UDhuCkOnq8xHGBs/LJFzzV2ULed1FUpEIm6dF9nEWG4flCzwEASNi8A5JNRkSrpqPuR28PiEbZspwxLXMcU4PkT2gLS6Z0k4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715059523; c=relaxed/simple;
	bh=Lz9upKnBUWSJCR3radsm+C5q/ZD++lGHXzZbSNDY3Jc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=thLnSrIBIZ6B798XXk0rnSQQxlPw66poijIQ0ayEG4TMVUdydD5aREBtZM7688zl+qD32m0EsrakNCboL7luTc5ZxYa6AzFTAI8EIQBydLTL3RXTpT0EXG4zMumg8TAdCqkgtfSz2xccR/GH0TEpVJ9VeAOojURHHOPw4c0KbYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bCVwBbHL; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bCVwBbHL"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-6f489e64eb3so776797b3a.1
        for <linux-staging@lists.linux.dev>; Mon, 06 May 2024 22:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715059521; x=1715664321; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VotM072PU5f1ynFHubhbSZEV9Z58k4OS4yjrvCyi/KU=;
        b=bCVwBbHLkTf1Kr4VO2HhweUXPmCXBJw6TZ5WGHxZWBZoEganu2e9xyAZDPxRWjeq2p
         PFsbV0JqU9ooAgKGmDThMBnzY0xIpvIobeV/yYBOpvu6YdFfDVRaG1A6Wvw5JjzGFAEO
         3LSIc6pxqvL5HvvPhQlIn8F/wQ0KIsb06h+yfxf8hZ2ocunCJ/MRo4sfA+n5gwuxAzdD
         PLKXO1XnUh79AClA+EMYB1zQtGcaWhgCS3zXzyuDIxZ2oqbXoVfIKk/UZGyTs8XE7Ag7
         aQaZ3T3ziTm3hmGNR2r1E0WYAmrJI5vCH1ZjTAHOqMvdvgQ3KU2Yc9NbRvv8pOIbwc/C
         KhJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715059521; x=1715664321;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VotM072PU5f1ynFHubhbSZEV9Z58k4OS4yjrvCyi/KU=;
        b=XdABAvfXEJX77i1PkfkJpnewD0DGXXfbh4rTwTDpQ69SJeHp/q23J8d7FBFdGPeR4Y
         TGq0N0PxsrEmjsjX2vLWom934SfapiD3v0xwhB8dOZEjZGqSEQvWioSYCPueRp8zzh86
         ijvDg6MLNM4ZILP/Lvy8fPb04BAXE8Kz+i9mPpEKxGkFMkCQcmeZgbx++WvtkhOKY+8S
         JPwSyZJWKepo83oWndCelYyBPdOD0UJixtrH3q9oxM6I7cvHxYprxBY1oFMsJ44258Tz
         9tR5YFHc0fICld2lTruuzKT+6eNG8GrzVOIwPbracVIXLQenBJl1eR7EG20tDiJZjHhp
         PHvg==
X-Forwarded-Encrypted: i=1; AJvYcCVflslCaGc1Hc9+Po+XTAayJMj1GeO+EfEvHqPH2ksbU5wRN1yo05dBOp8vZ2WswXZm5rkEx/HEPDjY9ta++/excx5fttKYDtW0pduglA==
X-Gm-Message-State: AOJu0YweuyxyLwXCpgvY6ZIszTE3IBs72jFKpgUrfcm9UjdrapwDvEDL
	Q+H2uECNe1e6RkMCj/iG8YEivvp6QlelEgnSsKtTVX3tHG6H7D8e
X-Google-Smtp-Source: AGHT+IEXAeBUuXaJ5L39BPGwF3v+uLqY+hCMwjgssXQL5Lk+kDguAle74Rzr9m631YM+fytEf0u6EA==
X-Received: by 2002:a05:6a00:3910:b0:6f3:86ac:5eae with SMTP id fh16-20020a056a00391000b006f386ac5eaemr14548559pfb.28.1715059520934;
        Mon, 06 May 2024 22:25:20 -0700 (PDT)
Received: from ubuntukernelserver.. ([110.44.116.44])
        by smtp.gmail.com with ESMTPSA id it21-20020a056a00459500b006f4401df6c9sm8276063pfb.113.2024.05.06.22.25.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 May 2024 22:25:20 -0700 (PDT)
From: Roshan Khatri <topofeverest8848@gmail.com>
To: hdegoede@redhat.com,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	hpa@redhat.com,
	hverkuil-cisco@xs4all.nl,
	gregkh@linuxfoundation.org
Cc: Roshan Khatri <topofeverest8848@gmail.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: atomisp: Fix spelling mistakes in sh_css_sp.c
Date: Tue,  7 May 2024 11:10:12 +0545
Message-Id: <20240507052512.7296-1-topofeverest8848@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Codespell reported misspelled fields,suppress,separately and offset in
file sh_css_sp.c. This patch fixes the misspellings.

Signed-off-by: Roshan Khatri <topofeverest8848@gmail.com>
---
 drivers/staging/media/atomisp/pci/sh_css_sp.c | 20 +++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css_sp.c b/drivers/staging/media/atomisp/pci/sh_css_sp.c
index cd7f5a3fecaa..9da89290c954 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_sp.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_sp.c
@@ -1038,7 +1038,7 @@ sh_css_sp_init_stage(struct ia_css_binary *binary,
 	if (binary->info->sp.pipeline.mode == IA_CSS_BINARY_MODE_PREVIEW &&
 	    (binary->vf_downscale_log2 > 0)) {
 		/* TODO: Remove this after preview output decimation is fixed
-		 * by configuring out&vf info fiels properly */
+		 * by configuring out&vf info fields properly */
 		sh_css_sp_stage.frames.out[0].info.padded_width
 		<<= binary->vf_downscale_log2;
 		sh_css_sp_stage.frames.out[0].info.res.width
@@ -1333,7 +1333,7 @@ bool sh_css_write_host2sp_command(enum host2sp_commands host2sp_command)
 			      host2sp_command)
 			      / sizeof(int);
 	enum host2sp_commands last_cmd = host2sp_cmd_error;
-	(void)HIVE_ADDR_host_sp_com; /* Suppres warnings in CRUN */
+	(void)HIVE_ADDR_host_sp_com; /* Suppress warnings in CRUN */
 
 	/* Previous command must be handled by SP (by design) */
 	last_cmd = load_sp_array_uint(host_sp_com, offset);
@@ -1351,7 +1351,7 @@ sh_css_read_host2sp_command(void)
 	unsigned int HIVE_ADDR_host_sp_com = sh_css_sp_fw.info.sp.host_sp_com;
 	unsigned int offset = (unsigned int)offsetof(struct host_sp_communication, host2sp_command)
 	/ sizeof(int);
-	(void)HIVE_ADDR_host_sp_com; /* Suppres warnings in CRUN */
+	(void)HIVE_ADDR_host_sp_com; /* Suppress warnings in CRUN */
 	return (enum host2sp_commands)load_sp_array_uint(host_sp_com, offset);
 }
 
@@ -1359,7 +1359,7 @@ sh_css_read_host2sp_command(void)
  * Frame data is no longer part of the sp_stage structure but part of a
  * separate structure. The aim is to make the sp_data struct static
  * (it defines a pipeline) and that the dynamic (per frame) data is stored
- * separetly.
+ * separately.
  *
  * This function must be called first every where were you start constructing
  * a new pipeline by defining one or more stages with use of variable
@@ -1372,7 +1372,7 @@ sh_css_init_host2sp_frame_data(void)
 	/* Clean table */
 	unsigned int HIVE_ADDR_host_sp_com = sh_css_sp_fw.info.sp.host_sp_com;
 
-	(void)HIVE_ADDR_host_sp_com; /* Suppres warnings in CRUN */
+	(void)HIVE_ADDR_host_sp_com; /* Suppress warnings in CRUN */
 	/*
 	 * rvanimme: don't clean it to save static frame info line ref_in
 	 * ref_out, and tnr_frames. Once this static data is in a
@@ -1551,7 +1551,7 @@ ia_css_pipe_set_irq_mask(struct ia_css_pipe *pipe,
 	 * - different assert for Linux and Windows
 	 */
 
-	(void)HIVE_ADDR_host_sp_com; /* Suppres warnings in CRUN */
+	(void)HIVE_ADDR_host_sp_com; /* Suppress warnings in CRUN */
 
 	IA_CSS_LOG("or_mask=%x, and_mask=%x", or_mask, and_mask);
 	event_irq_mask.or_mask  = (uint16_t)or_mask;
@@ -1580,7 +1580,7 @@ ia_css_event_get_irq_mask(const struct ia_css_pipe *pipe,
 	struct sh_css_event_irq_mask event_irq_mask;
 	unsigned int pipe_num;
 
-	(void)HIVE_ADDR_host_sp_com; /* Suppres warnings in CRUN */
+	(void)HIVE_ADDR_host_sp_com; /* Suppress warnings in CRUN */
 
 	IA_CSS_ENTER_LEAVE("");
 
@@ -1630,7 +1630,7 @@ sh_css_sp_start_isp(void)
 	if (sp_running)
 		return;
 
-	(void)HIVE_ADDR_sp_sw_state; /* Suppres warnings in CRUN */
+	(void)HIVE_ADDR_sp_sw_state; /* Suppress warnings in CRUN */
 
 	/* no longer here, sp started immediately */
 	/*ia_css_debug_pipe_graph_dump_epilogue();*/
@@ -1669,7 +1669,7 @@ ia_css_isp_has_started(void)
 {
 	const struct ia_css_fw_info *fw = &sh_css_sp_fw;
 	unsigned int HIVE_ADDR_ia_css_ispctrl_sp_isp_started = fw->info.sp.isp_started;
-	(void)HIVE_ADDR_ia_css_ispctrl_sp_isp_started; /* Suppres warnings in CRUN */
+	(void)HIVE_ADDR_ia_css_ispctrl_sp_isp_started; /* Suppress warnings in CRUN */
 
 	return (bool)load_sp_uint(ia_css_ispctrl_sp_isp_started);
 }
@@ -1724,7 +1724,7 @@ sh_css_sp_set_dma_sw_reg(int dma_id,
 	sw_reg =
 	    sh_css_sp_group.debug.dma_sw_reg;
 
-	/* get the offest of the target bit */
+	/* get the offset of the target bit */
 	bit_offset = (8 * request_type) + channel_id;
 
 	/* clear the value of the target bit */
-- 
2.34.1

