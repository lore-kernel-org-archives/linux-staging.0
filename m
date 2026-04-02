Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 233B03CD8AB
	for <linux-staging@lists.linux.dev>; Thu,  2 Apr 2026 12:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775132634; cv=none; b=oIAWc0ttUN7DB+XLFhE4cDBfQzMdglDlK1Kt7ziAkvoj4HRppArPzkSmo6MgFmGvBSk5rze7AtdWbB//ahUQDoMDz4ygrqfnXAkctfnHrgTfrtN5RVv2S2FwEEKYuwCIZczCjHs5/Hkx7TMu0BoLeVMpUJfXCFU5cqlTSmY94Ao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775132634; c=relaxed/simple;
	bh=CiazWmmi6vMLPLWIeEGthiISVK90JbaZcBdoKBCyeMI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BskkTuNmsU98/5VKAe59+04MYquKZxEpTWGGW9iG0bOtG/SVctQGIr+uF0K2qsYsnPz991g4ein5PhtHEZBZRe0qSmov01UEnAh3OB7E8GypeZifvx7QB0EdECGZ3YpFGKUklHdCBNqI05n3UbCS//wg0ghvxR3uhsM34KO/BdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fkj/zUIm; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fkj/zUIm"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b9a0762ed5fso127470766b.1
        for <linux-staging@lists.linux.dev>; Thu, 02 Apr 2026 05:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775132631; x=1775737431; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=93MKXho5CihfBi64XHlp856AFQOutHeNOOS2UatSKRs=;
        b=Fkj/zUImM3rxJKecsJgCr0ulvKqAMko053tobaF/IbJ8OE4MU3Ko/Kgdqkv4uZVzPU
         Zw/gPKUVH9cWSIxbQge5M4mobsozygZkOM0/2XV2KSC+6I5cnO7KWa52EzqOpQugOOJs
         sKBcGqO563T1BdBpi590jLdhQQLgdbY3JIencR6jGENieU/1edWLL4vVowGOCprvbJQt
         Me85Grmxuc2xR+Y6izeUv2t4D9OgVeJ7NNxoYkXdtcOmhrHmbaJ8Y8BM6MjD66r9XwXT
         0IkoB51+gtxxq3JfRyftQOk62MAPxcV3/Rta2YXtppzp0AoeV/KcORS7VVd3K1Gczut2
         WAGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775132631; x=1775737431;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=93MKXho5CihfBi64XHlp856AFQOutHeNOOS2UatSKRs=;
        b=Ys/nhb82lQpT877g3+jID6rZJxHTxodHbYzQaQK3VVnlcJHIZw6eOlxCRwoRc36DSo
         EmGSXLxM4DSF2I2r7jcvKVE80chz/YcPIu2O2GZ24HdfoE9sGiiwt/ULhlu4ANdAkqqU
         FmwNVLg5OlBg1QfE6qS9CqgW6Z/mc+qkBbct92EmVkp5iee3PFuVhfCAwyF1liqbkQDA
         /yOjmoLBQh2sHQJfvKLIoTDobV3Fxi7IxvIzAmw09lEcWT7GBq4ccg8X40PPg7oiZe3g
         81/hQSUfa/W2/aQWqRBtc0vlFxThBIqPaC30PmHnD2RQ8sxhaiCq2nnTKQH7ojQ/l/eR
         inew==
X-Forwarded-Encrypted: i=1; AJvYcCWFQi3cL9f0GYqLsrWjZltqTFWOAG7umaOyOkfTHIjQnB6sE8eaPEHRNO8OJnQ/bPpFl2OOZ1TDGMcBi2Pa@lists.linux.dev
X-Gm-Message-State: AOJu0Ywuxlochemj7ps5DOV4WwJyxZ9Yn2pnlzoU/pOt2WoJEZPCy2TX
	XwHWArK5WAwWRqiPFmQbrfYHFgUHt+moH7sPRnyiS/0D7pqBSgjQ2Kdr
X-Gm-Gg: ATEYQzxA2q7WDe4G0NrdBtu24a3L1N3o/mn4UTD32Tq4dbTh91RbHXetNGOUdHcI2aB
	U2Fq392S4aFMCKd6KlWmfONBf2VdLPv2uQ39YMlnzf86tFNZsOf3nR1Fh9h3KzvzfhRGmNUDRLu
	G/2S+dHm5tUAXDFyAt148Gg3spV+06J7vOec2PV/rBvRWLAMot9ug61qB+/tqxJPPSMi/LCMWy0
	48+N+UsWNqEEmZWyIWfiuqryI8Kx7I2suHhR4yGbIJoHbpibsxo4Bz0JLI3LjqOJ8URKrOlANV6
	DRIKMTBW64BSOxc/2Us1G72H8p8UE5LdGIoGT76S7WJkCe4GC4bYMSN5FHN/liSf0zZGOqoyWL5
	tA4fX6R+NkImZX4wIUnyc1kchoEwL480VLXbuo6CxNPjagiDAK2CM0M5ZhofXj5fg96cE6Fxdkk
	kf1S6GUwsOxYMq4WPCWLFppY1qG9MEqC9F3wDtkFq8oVtmVrS5KgXLwNeNXYrPBDJ+z9dhoeTL0
	5pNIKCzB5297IkKYBRRPU6CxIJcI5fYCZAxeS6mOZPdSXRr500ep2GqAGcJUiDdm5zmPa9QmvGd
	CODKl8mNOUK86q48zXrb6fDGJRf/C3r6OyLcyDpogZ9klyTGpTn5KfuUgQYI2QPlWfHPWhQvdRA
	BSh1PpIHFr/0rFQk9
X-Received: by 2002:a17:907:97d3:b0:b9b:e7b3:a257 with SMTP id a640c23a62f3a-b9c46fedbebmr95671466b.21.1775132631230;
        Thu, 02 Apr 2026 05:23:51 -0700 (PDT)
Received: from cs-280612103108-default.europe-west4-a.c.od237066db22328bb-tp.internal (253.119.12.34.bc.googleusercontent.com. [34.12.119.253])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66e02d4500asm658588a12.10.2026.04.02.05.23.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 05:23:50 -0700 (PDT)
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org,
	andy@kernel.org,
	gregkh@linuxfoundation.org
Cc: sakari.ailus@linux.intel.com,
	grondon@gmail.com,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Joshua Crofts <joshua.crofts1@gmail.com>
Subject: [PATCH v2] staging: atomisp: fix alignment in function signature
Date: Thu,  2 Apr 2026 12:23:33 +0000
Message-ID: <20260402122333.1336-1-joshua.crofts1@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix alignment checks in function signatures

Signed-off-by: Joshua Crofts <joshua.crofts1@gmail.com>
---
v2:
- Rebased patch onto the staging-next branch to resolve CI merge conflict.
- No functional changes to the code.

 drivers/staging/media/atomisp/pci/atomisp_fops.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_fops.c b/drivers/staging/media/atomisp/pci/atomisp_fops.c
index c7aef066f2..c51d04af6c 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_fops.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_fops.c
@@ -96,8 +96,8 @@ static int atomisp_buf_init(struct vb2_buffer *vb)
 }
 
 static int atomisp_q_one_metadata_buffer(struct atomisp_sub_device *asd,
-	enum atomisp_input_stream_id stream_id,
-	enum ia_css_pipe_id css_pipe_id)
+					 enum atomisp_input_stream_id stream_id,
+					 enum ia_css_pipe_id css_pipe_id)
 {
 	struct atomisp_metadata_buf *metadata_buf;
 	enum atomisp_metadata_type md_type = ATOMISP_MAIN_METADATA;
-- 
2.47.3

