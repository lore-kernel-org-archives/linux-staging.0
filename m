Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com [209.85.215.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 073153793D9
	for <linux-staging@lists.linux.dev>; Mon,  9 Feb 2026 13:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770645443; cv=none; b=NbR5GOdnDh2JiXnxpogXnhvFUOw2y+7eF6K9ZU5vhsvX52QEYwdCJn87E6TsWkrAxoDzeJo/xtNq6wCzbEVdYo1uXnxSHYK5Lzg1KRmUGaLWDvix/GmEBl/XcGcHkJDtwcAov50iuUKXuOjgSIOqebtiT3ynrnGdslmqaO7G8iU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770645443; c=relaxed/simple;
	bh=iGhhjjJs+s1Ah+V7ivZow4oJHRXO0o2RtPrKfOZyuow=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OC4K6VC9fep2X2CwcLaMUip6K5mI24kcIaFJsYWoolXZWc40CfDoUyeNdRSdZ/M6yt+J1Txo8HBtMR7KD6kMFogEEYVC4MGNwmUhF2xOxVjUhP+aLazw8eDHoas1CmIfWHZdh3aOgPJQhzXqRvYKCqaG/9L1dOn+s3ckbZVKt5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lkm8O8pg; arc=none smtp.client-ip=209.85.215.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lkm8O8pg"
Received: by mail-pg1-f196.google.com with SMTP id 41be03b00d2f7-c6c67bc8b9eso1752669a12.1
        for <linux-staging@lists.linux.dev>; Mon, 09 Feb 2026 05:57:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770645442; x=1771250242; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=r79carKhU9SJM27BLT6kiyLph+5RAI9QjCUOkCO2w44=;
        b=lkm8O8pg3iuLoIH6xQsp64EboQG2g5+J4b4A0zNg/v4Y1YCXt06C9pSNm0UkjEL8Lc
         TCv02NwXmq1unSTF6IxD+L1j5+UGFQVtqdLEAAWPjcS7oSeJU+vGSRQfhzytN1qUzEV3
         UQsROspj3nZiQx9x4ZN2Kd4Avl5HmHJ3uKJOZoYlhEAFVfJnjKNXbW0I8iIIS+SNugMt
         hw5wrYXu+B4bWKegKfCeHrWdQhT+ZezY85efm7fckC+Hu90o3kqKhvIprbXq3NM1UPGk
         ur8X0fFoXLPYsyAPhE/9rZcHtz5acsAgH1I3xwbEEfz69jHJSnGot4aLFZFkzi+pWcaG
         KtCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770645442; x=1771250242;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r79carKhU9SJM27BLT6kiyLph+5RAI9QjCUOkCO2w44=;
        b=BD5lchR4/7nbCfd5K5omvuenWUT5uzqoGQAguyzT5PRMi/ckQdMtd7QMV5FcxEwxLD
         GcJlEqlyhjfy67OWYE56SxqggeSOhdj1FwqNoxll4fohfopVsK/+5zFmDLI5G7QXZ4ur
         lCUuOqNyPbfEgnJXQPOlUlKsk0J5u8Y9+kr3l3jwkpVra5vFhhsvV6gPjkK5AXCVrC1U
         a2hDjTDzXOnE/VnHyiAZ9fvUy26HW22d4yYARyIU7WPaP+73IqNQ0osOLIDIIZMQxrEv
         6Pm2MVkkkZlMJ9y0mKFTfWN5v7l6ZOqYQCoAwBixqYK9sBEdRQzgmr4EzVkuVRZFwoZb
         7TAg==
X-Forwarded-Encrypted: i=1; AJvYcCWz+wldyxCFesnTqYVmTjoC98g3q5t5ipNAFxIrZiadc7iPL5oEucYH8xtKUJympGTsdGKlDaGaExZIz1bo@lists.linux.dev
X-Gm-Message-State: AOJu0YzfLbtH+ze0n/4sgRndkqR4LyXCtcaAOQ5bxiahLEmfxHKZyXpb
	VpgKvIRnAtskXeYV993U2sYkXF29OpF+d49tA2A9Y0gZXogQqNl/5UcT
X-Gm-Gg: AZuq6aJAOYU2rIebnCat6CYaJGtco0dLucCd9EbS23yBrfXF6YFbRsg4bk7buhK4CWx
	pi6PywaOwR1Ak2+GGy7iJ+6KcBQyLleRvBjiwMUvK2Nn8g6U5YBQ03oW2ma7xwrKRNoLYSoCAiM
	7uNnfkkNDX58Xtk9SYTFOzJo2rMEEoMIzM1HMg26PnAPAxL8EP1MDcucb8KS0AKag7K5+GFCvLt
	nsG47uioBCm3S74GgzBbj+/oDLULmPGaYxr0/vticzas0t3d7jCak8qAxVZsc+k12d1BnvwWARN
	qVW+6hb+XKk8SctRg1wi9DaVC7wbFUgK0LUK0vdD07KoSD6SFkuhlSU5LOOiseJwyglPdtXCH6r
	1tyrRhQFVTn1hm/ts2IhwqqBCEyyY0kcP4c6Csg2RxFA0gioucwJcNW6uAwFUPXE3RKsAk6x3dr
	RC
X-Received: by 2002:a17:902:d4c4:b0:2a0:d629:903c with SMTP id d9443c01a7336-2a9516f888amr120987755ad.30.1770645442189;
        Mon, 09 Feb 2026 05:57:22 -0800 (PST)
Received: from deadibone.. ([118.141.233.34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8244166f6dfsm11008905b3a.2.2026.02.09.05.57.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 05:57:21 -0800 (PST)
From: Ethan Lam <ethanlxkernel@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: sakari.ailus@linux.intel.com,
	andy@kernel.org,
	hverkuil@kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ethan Lam <ethanlxkernel@gmail.com>
Subject: [PATCH] staging: media: atomisp: fix block comment style
Date: Mon,  9 Feb 2026 21:57:14 +0800
Message-ID: <20260209135714.48216-1-ethanlxkernel@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixed block comment style warning by checkpatch.pl

Signed-off-by: Ethan Lam <ethanlxkernel@gmail.com>
---
 drivers/staging/media/atomisp/pci/atomisp_cmd.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index 3a4eb4f6d3be..d53f2015014b 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -1380,8 +1380,11 @@ static void atomisp_update_grid_info(struct atomisp_sub_device *asd,
 	if (atomisp_css_get_grid_info(asd, pipe_id))
 		return;
 
-	/* We must free all buffers because they no longer match
-	   the grid size. */
+	/*
+	 * We must free all buffers because they no longer match
+	 * the grid size.
+	 */
+
 	atomisp_css_free_stat_buffers(asd);
 
 	err = atomisp_alloc_css_stat_bufs(asd, ATOMISP_INPUT_STREAM_GENERAL);
-- 
2.43.0

