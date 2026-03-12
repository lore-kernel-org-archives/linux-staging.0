Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D125C38AC76
	for <linux-staging@lists.linux.dev>; Thu, 12 Mar 2026 21:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773349694; cv=none; b=XiJSkqQcBcRLPK4ddm7dQ34TQVnaVMz48RzWLLKOXV4MOBYpwcCnZedjo50U2SC3sAyLrZfCdLTE1CteRzkkABkicy2ZDFu2EVjfx39ag9EGgyEuhLiYKbbVjRcRkX/Df0Y9XMVmSz7k85/5FWaVjZ9pK9ok+qvpVFT1W6mUI8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773349694; c=relaxed/simple;
	bh=Jjwjji6DmEzsKUJGV1tPw2Ii7Kk/TrFt/sH+6mxjuqc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=C2onUZDFDhYR6PTgBCWUO6klNWzKYz0wdiA4IAbaizWenMcBQgteJTp/It+zjV1xXAoTzQ8/8SS32FVnceegBcf2kHCOYHHVniO2yYqhk/DYuCUItEXGxzBC8FPyc9Sud5uLtDeA3vjCeDj0ymU7IE8VKGLzdA2hh+N/roVUpT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PBKhVW1l; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PBKhVW1l"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-c73ba417c6eso601389a12.3
        for <linux-staging@lists.linux.dev>; Thu, 12 Mar 2026 14:08:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773349691; x=1773954491; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aoiNnbva39sA99NFKzTTm7yA6pujKxmE8bLsycQv4JI=;
        b=PBKhVW1l7gD2u9eaPCvdXl6f0UfYJBSEs6OUxNMqUNluNwa1oLAZLfiixgOoLzyH53
         s7E+7HzO+Jp4NFYANbRLZeE0/j3xPtVBtOCsr+ErQTnz1DUlUmA78b3YhEMl1rSFb5d+
         bqUtt13pIexNwGKG0saDyThxUOejrz1jP4ghxtsLSlz9+tcCssSuowYK9xp/6jlUtmZk
         +F0pVJQ4xQ3xAXaWtwcRc7pcH1U54SAnpMu1L9eWd27lPJ7ijou3I5ZnuyCayZVG9F0/
         9DKtW56eDYp6j/GFKFiIf6cDetCAIdE0y2BnrB6LFStTgNnNnInvvepDV1MoBGDiAoHm
         0jOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773349691; x=1773954491;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aoiNnbva39sA99NFKzTTm7yA6pujKxmE8bLsycQv4JI=;
        b=mn5sT/5LbbbKpdEjyr8SJAAuM9HUs9ZwOo5HccqobgOn+Vp0A0NeFfqQrwMrgITMEm
         zAWHqVO+qdQArrETivmHfXjo3EenZNHrruaFXKk2taRwvzV8zRXGfeM6ZSuobZ+LSZ6F
         1wnBe6cMnzRLtYZ40VsrFOfa9SQEPr3XCd/RzA9mqRVMC81vdXXYfNCpNtagZWZLy+FB
         0bPkE3KZO6pdUkAjpJ4I5YqkI2gXAhNkKdIy3/bbm3H40uuR6jg6/IqNQTKJ3pgREKAF
         6/EngIy63UBHZP7/HgAvcP1zASHj36Dd5TWVZ9BttK3lTyZN1uqdC7Md7/tRdMNc27Bp
         zfLQ==
X-Forwarded-Encrypted: i=1; AJvYcCXVrKBhw7tE3eE28xCjxVhQiZzz7qwXAvbC+AVPFzzxL+duobrXH3V1RJc2r/dj14eZsYMWtBE6sNoOD1cY@lists.linux.dev
X-Gm-Message-State: AOJu0Yy31iggxXF+Am8yCMYI5FKj1vmi/QGugl2v6S2H1qaT8fi4ApUB
	79ykuTs+ejqWpLOo1Mvkyec5vLvqU7jcniIFRQ+bsEatfvti5dC2zJJs
X-Gm-Gg: ATEYQzxWYXEweD+UO758ZETThq1SBcxp0TNhaeFvipM1FptM3ILQkCbIvrv9SM7OEEJ
	/Pyo8puts/fNSTfZktxT2OBj4fQ74kqH+1pGaMssMUgJiiBr2ktbBTdAhcpgVknlOTaAHf1fNKf
	CTeZSL1F28hZb0SAsB2WNSkDvyc5m5o9OjPnXe44+TOZBShymZ12eu+QS1ER5/kEscO8XIypSuA
	hhjK1ukrTUmA5JhQ2L4QXDenJkhbI2kPSYwC0JwRKceGYhJqz1OSAUiPayLv/omlxfqAnltZnbW
	P70+CTxB9twYcdtv94XcVlWn8tIUgqH1M61bO6yYTTruUwd/6a3dAhzKs1KtrCZ28t5SCNDqJnf
	fb6FqHs1rOiop8XptnGwWf6eNLt8v40KcSvZ6RH3bXgP7s74v3XtnoUrTFwMrVIVi68uKkMXEdz
	nCq3I/jDowKNOKSlm/VMuu9BEaHL9ut/qGykW8opgeX71iN0JHJ3PK3Kq2iScxPTkwDh/qjnRkF
	y2neqYq52VqCdF+LoptOtdliMfDDCsdZ7ua
X-Received: by 2002:a17:903:ac7:b0:2ae:3bb2:a8c0 with SMTP id d9443c01a7336-2aecac850e4mr7392925ad.44.1773349690898;
        Thu, 12 Mar 2026 14:08:10 -0700 (PDT)
Received: from starpt-K55VD.. (2001-b011-7803-1632-e2bc-8e41-031c-dc56.dynamic-ip6.hinet.net. [2001:b011:7803:1632:e2bc:8e41:31c:dc56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aeae376653sm68389985ad.81.2026.03.12.14.08.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 14:08:10 -0700 (PDT)
From: Lin YuChen <starpt.official@gmail.com>
To: andy@kernel.org,
	hansg@kernel.org,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: sakari.ailus@linux.intel.com,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	starpt.official@gmail.com
Subject: [PATCH] staging: media: atomisp: use kmalloc_array() for sh_css_blob_info
Date: Fri, 13 Mar 2026 05:08:01 +0800
Message-Id: <20260312210801.8416-1-starpt.official@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the open-coded multiplication in kmalloc() with kmalloc_array()
to provide overflow protection and improve code readability.

Signed-off-by: Lin YuChen <starpt.official@gmail.com>
---
 drivers/staging/media/atomisp/pci/sh_css_firmware.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css_firmware.c b/drivers/staging/media/atomisp/pci/sh_css_firmware.c
index 57ecf5549c23..88757076c950 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_firmware.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_firmware.c
@@ -253,9 +253,9 @@ sh_css_load_firmware(struct device *dev, const char *fw_data,
 	sh_css_num_binaries = file_header->binary_nr;
 	/* Only allocate memory for ISP blob info */
 	if (sh_css_num_binaries > NUM_OF_SPS) {
-		sh_css_blob_info = kmalloc(
-		    (sh_css_num_binaries - NUM_OF_SPS) *
-		    sizeof(*sh_css_blob_info), GFP_KERNEL);
+		sh_css_blob_info =
+			kmalloc_array((sh_css_num_binaries - NUM_OF_SPS),
+				      sizeof(*sh_css_blob_info), GFP_KERNEL);
 		if (!sh_css_blob_info)
 			return -ENOMEM;
 	} else {
-- 
2.34.1

