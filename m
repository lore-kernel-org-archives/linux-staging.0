Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2564829422
	for <linux-staging@lists.linux.dev>; Thu,  5 Oct 2023 19:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ST/sIUVW"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-406618d080eso12618705e9.2
        for <linux-staging@lists.linux.dev>; Thu, 05 Oct 2023 12:15:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696533320; x=1697138120; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aT0LmIsvnpX1kglnb6ckTRuS7J+F7V3HjLnCaWyOAWA=;
        b=ST/sIUVWcFJVgKyesNL//jGeb88Hub/5lwQkgZJwk3Qf6fAjHJ5zTmi8caD+v8e8qj
         fQvePGMvajiO8lUsMEtPgEDvyfgA0p5JZurTduBVIBwORppSOux//tX3ACcdoQH2QW1y
         Zu0hCAsi5fp4UjG1IATrSpHr56TY/GI6H60k59H9QY8t6LiIbKf7hAhZZS4BGTt9YPBD
         j0c9UhhNxY+Y/T3KHEaQS4Mg67DxvZYOHvnD+VINFwLY49lXwr11V/HKVUqKL116EoNu
         iI3Ao9ion/wDCM4kmKRBpUXhjt6bd8ZIfQQpY0T6LJlUaLOrO3t/mhFBSJ5uvH0jK76j
         /QDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696533320; x=1697138120;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aT0LmIsvnpX1kglnb6ckTRuS7J+F7V3HjLnCaWyOAWA=;
        b=RBIJDOyDYPK3Fx6Hc/jKLyVaF2A72QRdgRwOH0ZigxRW6astNDcdjtMsieC/hrMDGt
         9eYEKaatY6A/rjQWKHFl0z9p5vepdKwCnoZSGmRQ6Io+9vLY9ESdqbzB8CYbY0aJ9z1c
         MVOHSMi81QYVRQyGDx3SgcpK/YQCJaGclQu+9Rb7xzc82TS88SFAiAzPp6gp7R0u5FD6
         VMkDu2mT3dgvItWXco4aVv5XoF/eWOGWvPDJCA/tHuRQ2n8kLr/kTPGBczQ7q0Jg7Atw
         PDzK/5UNd98cA7HLga4FTFz3Dx03RWyXVZ1d78W2Oac0BToVgU9MI+Ext5vL1r7JbsTu
         GYeQ==
X-Gm-Message-State: AOJu0YyJBb2sovqzQ4CZ6RaT4HS+8lYjxmS86ZD1nfdvrcuyCJQjP++0
	U/DUtaftrG5hpgoVmB1b6sE=
X-Google-Smtp-Source: AGHT+IEhZPgfkx8mQXQXOTrcuxb3QDkXOODotGOIc9va7MNCtseyZWgXnTuij5CEQYcIdxu+L4NXdw==
X-Received: by 2002:a1c:721a:0:b0:405:1baf:cedf with SMTP id n26-20020a1c721a000000b004051bafcedfmr5855968wmc.24.1696533319961;
        Thu, 05 Oct 2023 12:15:19 -0700 (PDT)
Received: from localhost.localdomain ([2001:818:e906:400:b2bc:40c:b83d:9c16])
        by smtp.gmail.com with ESMTPSA id 19-20020a05600c025300b00401d8181f8bsm4407235wmj.25.2023.10.05.12.15.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Oct 2023 12:15:19 -0700 (PDT)
From: Ricardo Lopes <ricardoapl.dev@gmail.com>
To: manishc@marvell.com,
	GR-Linux-NIC-Dev@marvell.com,
	coiby.xu@gmail.com,
	gregkh@linuxfoundation.org
Cc: netdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: qlge: Replace strncpy with strscpy
Date: Thu,  5 Oct 2023 20:14:55 +0100
Message-ID: <20231005191459.10698-1-ricardoapl.dev@gmail.com>
X-Mailer: git-send-email 2.41.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Avoid read overflows and other misbehavior due to missing termination.

Reported by checkpatch:

WARNING: Prefer strscpy, strscpy_pad, or __nonstring over strncpy

Signed-off-by: Ricardo Lopes <ricardoapl.dev@gmail.com>
---
 drivers/staging/qlge/qlge_dbg.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/qlge/qlge_dbg.c b/drivers/staging/qlge/qlge_dbg.c
index c7e865f51..5f08a8492 100644
--- a/drivers/staging/qlge/qlge_dbg.c
+++ b/drivers/staging/qlge/qlge_dbg.c
@@ -696,7 +696,7 @@ static void qlge_build_coredump_seg_header(struct mpi_coredump_segment_header *s
 	seg_hdr->cookie = MPI_COREDUMP_COOKIE;
 	seg_hdr->seg_num = seg_number;
 	seg_hdr->seg_size = seg_size;
-	strncpy(seg_hdr->description, desc, (sizeof(seg_hdr->description)) - 1);
+	strscpy(seg_hdr->description, desc, sizeof(seg_hdr->description));
 }
 
 /*
@@ -737,7 +737,7 @@ int qlge_core_dump(struct qlge_adapter *qdev, struct qlge_mpi_coredump *mpi_core
 		sizeof(struct mpi_coredump_global_header);
 	mpi_coredump->mpi_global_header.image_size =
 		sizeof(struct qlge_mpi_coredump);
-	strncpy(mpi_coredump->mpi_global_header.id_string, "MPI Coredump",
+	strscpy(mpi_coredump->mpi_global_header.id_string, "MPI Coredump",
 		sizeof(mpi_coredump->mpi_global_header.id_string));
 
 	/* Get generic NIC reg dump */
@@ -1225,7 +1225,7 @@ static void qlge_gen_reg_dump(struct qlge_adapter *qdev,
 		sizeof(struct mpi_coredump_global_header);
 	mpi_coredump->mpi_global_header.image_size =
 		sizeof(struct qlge_reg_dump);
-	strncpy(mpi_coredump->mpi_global_header.id_string, "MPI Coredump",
+	strscpy(mpi_coredump->mpi_global_header.id_string, "MPI Coredump",
 		sizeof(mpi_coredump->mpi_global_header.id_string));
 
 	/* segment 16 */
-- 
2.41.0

