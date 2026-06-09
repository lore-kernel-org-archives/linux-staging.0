Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25848411663
	for <linux-staging@lists.linux.dev>; Tue,  9 Jun 2026 21:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781041878; cv=none; b=ej5WY0ZmwaQRaMv/DzdrKK8PYNxUkwbSYZHix6pKuvJjDYKvh9639bb+900YmAzbKCqxodFYMUuFYBQ8oHTdzK7COYZ+aLjU9vlzlXI33qSD1td/AG1mCcsBuBwpAZFs/FCDVN+y1kqN1pTx2deqwCNj7gwM6o0ke2RH2SuMAnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781041878; c=relaxed/simple;
	bh=p36HzU3EV5swZvzF5zBhSQ0fqA1uncigLkCmH+53DG0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CireMIfEouRlnIM0Rmi7PvFsgw/MuTDrp8+lak+crcO7s7fvy4BOF3UAgSHCzC6QXjkwg+SfLdHH3RtTcG8EuT7QfrkNVqp6wV49R1ch4IztrZst8RnhvLfGntMVgKyXt4/w8jFxQCfFPbH0/Eb0suxBV9nT8uxb2Y7Kl3JSQUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CmaSgt3t; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CmaSgt3t"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-307d0405e07so1840402eec.1
        for <linux-staging@lists.linux.dev>; Tue, 09 Jun 2026 14:51:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781041876; x=1781646676; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Z3QatkkKnRVkIu7a4iw4icQQ1TQtBwhBS/0N8pK2Zwc=;
        b=CmaSgt3tKUO8ptqwVE9jN+8ZmqZ9KW/gMbJ85YYp1fJG7j8yphODU5r/GhPEliVuSF
         TgsJmE92BxcwZzGuzgavPHGrl74nUPok1hqgyGCn2DBinujkShYz0SCsM+UL1faFwR5t
         T64tcOb53zKKUaM/zMPXenE2Du2Gofp605BoMWveEpczg4nuSkKrOU8RMvSUC1/mYkrE
         lkbvbHWEpZx8F3ThRUKYnhJhgXxpS16fupCPlL50G0Cy+wkjDrQK5PgH1srMCvv01Emr
         iGY2erIrcc7cjKm9/vROAEJCetN2eQ3gt9xUYOkR46p9xPo3EIyFmd6lGoOAkESAYu9K
         Uahg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781041876; x=1781646676;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z3QatkkKnRVkIu7a4iw4icQQ1TQtBwhBS/0N8pK2Zwc=;
        b=iadNQTIkr92JpCnVRxnNArPeBCQTZFFsFisIuOFU37AFbfIVRk0y1PDgpLWdVp2AE4
         WR4myxs5kduw/TsQSkIGc64JIitK6/nAWy8M6tFEdWdStfgYedioShANuyjJA5HsQL1c
         LkIP9fQl1sVNtRLA8vrt1uP671nkh4mHSQdOkmXoMMNd2EkSvZbXcCewWMk6dfhIWCAq
         6qv00eFXheCEfom+im7dq20cup3O7d+ZHvVyPVWjA+k8AJ82PATbu66iSjdggnU5REed
         ot+39QtDv/qZd8gwTx2WDCBpEMFNyKUY2xx6HQAx4J09eXrIN5z6uzI97fn3JQL5wsom
         4ttA==
X-Forwarded-Encrypted: i=1; AFNElJ93MAvmla85shBnGtnHFp19I4dsqE/JY36SwvIM0iDS67l0ODpoPUkgBFV/Qa2jV31ZeLW4oZbIUWozQlhv@lists.linux.dev
X-Gm-Message-State: AOJu0Yx3maQuLOhCy9XqRmqb77pd0jEX2GIF1vYGUVrn6ev/bw+0nzVN
	g+3EPmBABGsrLD71VMhLvUbamCwkk+Oqen0qZT/7pwm1OwvycrJYI10Ifh8JaMiC
X-Gm-Gg: Acq92OFH5YsEG/ZZjwAQMLWfpJkEUeWcpfi4N3cXyKqYyPJ+9XenU1qr3zVj6WGOFmX
	0E4JCLTdtRBtQd70N9zLtxnWMqU57zaRJCK616amimPZDwemTMTOdFwQdHkWXSUQtCPxToF17an
	sGUgMeDhw6PfcwdYFDHY2I8moWY6DhgN0yjWDCyyxKraOFuBYq336UZPfVKTDMShpIYIGpQemua
	eB7qqVrrmU1RTZOIUfSao+8nUHf3lxDZMB4XPGTr8jDNRWtHdIu/ffDCflZXcTaUj86EIKXkYmt
	w1/gawl8DMZWm08vNrb/tXZ+zbM7Lur9vpx1UJ4KGEUPdJ2G80Me/fzuM3deqwKXlUVvhhY0Gnv
	mJc+2nFhvRs2dFAprkym93OqrAt4X9wJcoogIL3PlVrIy4ee9JiyoLvCbWMfTg1716HwBM+JXnY
	wzvLSEHIT5RsNOcEjmue5NQGknzlLE7ctwtRoG3fMDCAuMJ8j8D2nLRm99t6P0fMtg+dD5fW+cZ
	85HUExt4r6BuWtR
X-Received: by 2002:a05:7300:ca4:b0:304:885f:2db0 with SMTP id 5a478bee46e88-3077b22a7demr14331120eec.20.1781041876135;
        Tue, 09 Jun 2026 14:51:16 -0700 (PDT)
Received: from localhost.localdomain ([2804:14d:4c64:82a2:f671:db74:6740:62ca])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074df48671sm23293005eec.24.2026.06.09.14.51.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 14:51:15 -0700 (PDT)
From: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
To: andy@kernel.org,
	hansg@kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org,
	feng@innora.ai
Cc: ~lkcamp/patches@lists.sr.ht,
	linux-kernel-mentees@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH] staging: media: atomisp: use kvmalloc_objs() in make_histogram()
Date: Tue,  9 Jun 2026 18:46:31 -0300
Message-ID: <20260609215110.118860-1-rodrigo.gobbi.7@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace kvmalloc() with multiply with kvmalloc_objs(), which handles
the size multiplication internally with overflow checking, silenting
checkpatch warn.

Signed-off-by: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
---
Hi, all,
There is a ongoing effort like this for other files from atomisp
at [1], yet, it is not covering the same file.
Tks and regards.

[1] https://lore.kernel.org/all/20260413112904.98864-1-feng@innora.ai/
---
 drivers/staging/media/atomisp/pci/sh_css_metrics.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css_metrics.c b/drivers/staging/media/atomisp/pci/sh_css_metrics.c
index edf473dd86ca..d3ae737f1764 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_metrics.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_metrics.c
@@ -59,16 +59,13 @@ make_histogram(struct sh_css_pc_histogram *histogram, unsigned int length)
 		return;
 	if (histogram->run)
 		return;
-	histogram->run = kvmalloc(length * sizeof(*histogram->run),
-				  GFP_KERNEL);
+	histogram->run = kvmalloc_objs(*histogram->run, length);
 	if (!histogram->run)
 		return;
-	histogram->stall = kvmalloc(length * sizeof(*histogram->stall),
-				    GFP_KERNEL);
+	histogram->stall = kvmalloc_objs(*histogram->stall, length);
 	if (!histogram->stall)
 		return;
-	histogram->msink = kvmalloc(length * sizeof(*histogram->msink),
-				    GFP_KERNEL);
+	histogram->msink = kvmalloc_objs(*histogram->msink, length);
 	if (!histogram->msink)
 		return;
 
-- 
2.48.1

