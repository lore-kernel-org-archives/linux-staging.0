Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B70D47F4A
	for <linux-staging@lists.linux.dev>; Mon,  6 May 2024 05:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714975111; cv=none; b=DmG4rOMgNQeNvHkfFFNOvnwEBuaFvw4n83onunkBpQtO3y6KbGIgJ0wgDqHi2nhzZCZ6jIoZ1dhPlNE5lb7CrFGHjv+do5CLdxoG1jiK67Jsm4HplIsjIJGML8pAhEol4msHp6GTT6JmSAlIAkbI6yFqnLkdljDIGqr4DlCpBlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714975111; c=relaxed/simple;
	bh=Qg+oNkKwnd2IUYGxP3VVcbqQZ/khrZhVb1GbWFDn6l8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=LAQg3bq74qb/MRxHfjBTNwN5ZDDv5RzVaHAXzb65TWZhGViNgUk7mcNBD4cXPVTI4RQ8kNxZ0zpFCRGFJgDF6czzlV4TvUb4RWUKHyJUAaqF/yPu4BzdEAQoq3bKPXskroska7iwb7p94VFREr3uwNa3zeyxvaFpTy97cfsPk9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DLMRjBS3; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DLMRjBS3"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2b3646494a8so1142656a91.2
        for <linux-staging@lists.linux.dev>; Sun, 05 May 2024 22:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714975109; x=1715579909; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZUzrEYcxxtjau4TcE/YkY3seNanf+E2axNOscE+yJfw=;
        b=DLMRjBS3mt6l+2iUHdY4aF631kY3n+yykIDIX41dYfkx6g/1Z1yuTs9aPEIV3wkQ7s
         vmn3EaPuD6/IpyZN71cT6Jcg2f1qQhICIn3ap2M8bzJ+NekRKUIwf1vY9jG3uVbndZaH
         I+HoTqVTcWp0bl3svNFCkB8rtbKG2LBevxVUQrx75n23ihvsKX8wUKciMwYdC6qLbgSf
         RKIf8HtXm+Cey+8a454LnIpaNiAnQMJ4Jw7wdrc/fYg5lHaRHmbJGD6SPdJDg8mL1cRi
         lq1sjqw6i1BNnN0pf6jwOMj7+kPa+XUm+JS0UmPBRG2r1JVT7CcsYHtv98BVr8yJ5jRm
         omuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714975109; x=1715579909;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZUzrEYcxxtjau4TcE/YkY3seNanf+E2axNOscE+yJfw=;
        b=jA0AKnltajbFD4SjLJ9B5LzZG2apeI+bJuHkEC1t+8UqC2lsU7lsx8di9e0VznI00K
         cylxir3oMypZwtTWgiLcULXTIP76vPPRXvOcA0DdWoPmtpU+UUavhJ5szVLEjEEsNFOj
         497tj5zT8rgro+p1ntD7rxh+u9FZcITbij1T9+HbK6yRq1d1v7IJdPOde3Jp33ORMpMS
         UK2XSi7gQysnFAJSA8UfXWxPGQJA/FQtN9sxW2Igzah8FFkQX6igOLZx07d/3MIr+QIi
         NcKpIhe6ipKddxixN7tIoTyvTYdjsyM5K7FmBk0iurke48/+1CMYAuHM9O5j/RXeCS5T
         6+pw==
X-Forwarded-Encrypted: i=1; AJvYcCUkOb2gi05xPMltaVLS266Ankv90fn3TG3PMhQCzQyXZild+NKZ7LoOWB6LbY+TifsmXdNjYpk1biyea06ngq0uiHFEasHDktVNyDMvXg==
X-Gm-Message-State: AOJu0YwR22UuK2ka6refoqP3oZ0YxJ7WYUbm7YXsBBDCo725qFbI4Jp1
	WLlRLaV+if4H2EvP/GtvYyo3Z6uiaD+UM8B1Q5VlbfehBfsQ7c6X
X-Google-Smtp-Source: AGHT+IEi69z7mWn7W9ALtpdFofxAgk3jSSRm1Rp19U+XHsUnpB8tkT8NTbFw40g4S7bzrlYBadcC/Q==
X-Received: by 2002:a17:90b:f93:b0:2b2:c84e:9124 with SMTP id ft19-20020a17090b0f9300b002b2c84e9124mr6100790pjb.45.1714975109208;
        Sun, 05 May 2024 22:58:29 -0700 (PDT)
Received: from ubuntukernelserver.. ([110.44.116.44])
        by smtp.gmail.com with ESMTPSA id sx7-20020a17090b2cc700b002a4b2933a7asm9389812pjb.1.2024.05.05.22.58.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 May 2024 22:58:28 -0700 (PDT)
From: Roshan Khatri <topofeverest8848@gmail.com>
To: hdegoede@redhat.com,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	hpa@redhat.com,
	gregkh@linuxfoundation.org
Cc: Roshan Khatri <topofeverest8848@gmail.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: atomisp: Fix spelling mistake in ia_css_debug.c
Date: Mon,  6 May 2024 11:43:18 +0545
Message-Id: <20240506055818.2532-1-topofeverest8848@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

codespell reported misspelled suppress and implicit on ia_css_debug.c.
This patch fixes the misspellings.

Signed-off-by: Roshan Khatri <topofeverest8848@gmail.com>
---
 .../media/atomisp/pci/runtime/debug/src/ia_css_debug.c        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c b/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
index 3e92794555ec..f81e1b1df4e4 100644
--- a/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
+++ b/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
@@ -847,7 +847,7 @@ void ia_css_debug_enable_sp_sleep_mode(enum ia_css_sp_sleep_mode mode)
 	fw = &sh_css_sp_fw;
 	HIVE_ADDR_sp_sleep_mode = fw->info.sp.sleep_mode;
 
-	(void)HIVE_ADDR_sp_sleep_mode;	/* Suppres warnings in CRUN */
+	(void)HIVE_ADDR_sp_sleep_mode;	/* Suppress warnings in CRUN */
 
 	sp_dmem_store_uint32(SP0_ID,
 			     (unsigned int)sp_address_of(sp_sleep_mode),
@@ -1333,7 +1333,7 @@ ia_css_debug_pipe_graph_dump_stage(
 
 	if (stage->stage_num == 0) {
 		/*
-		 * There are some implicite assumptions about which bin is the
+		 * There are some implicit assumptions about which bin is the
 		 * input binary e.g. which one is connected to the input system
 		 * Priority:
 		 * 1) sp_raw_copy bin has highest priority
-- 
2.34.1

