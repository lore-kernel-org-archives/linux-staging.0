Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D73326E0D
	for <linux-staging@lists.linux.dev>; Fri,  6 Oct 2023 16:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gc8rmRdF"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-313e742a787so1447210f8f.1
        for <linux-staging@lists.linux.dev>; Fri, 06 Oct 2023 09:13:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696608822; x=1697213622; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=42iuHwuqbkZujSXR+0sYzIY5CpxMUDYyAkkaO/7JfyI=;
        b=gc8rmRdFqU98c4oyNe8pJ8nKKz4qtBI8aFdIBK1s37owBBLHIpim7JUytwulnaIBlq
         QjspLL5jRXvBXR60IMepnWW4XVq1+lI258wZOyhAKnKyGbZqpOLTMCn0Soz8zeIynuBx
         zDY1FrFqmkCRLqSgPiaYV8XNPrroypIsOUO0t2xW3cq+3kGTs0oqjJsG5dSZwrcLw00/
         +SHVixBQ/plaO/YMRm1td0woWMl4sWofPl6dR6AsW1G8Opy4xS6RzxKWJGgVptzoUOPL
         drtaBna9c1mMNrHglKRpPC6a1Ffg5hbZospIq10u0n76WG3kfApKyqb4oYn5neasKo9h
         yWlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696608822; x=1697213622;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=42iuHwuqbkZujSXR+0sYzIY5CpxMUDYyAkkaO/7JfyI=;
        b=PhIV/n8XfJeYm4gffh2WEXOh6FvKbM9MDm/YVccEiwuUMfkXlZ9dd0kJYPAcjrJOab
         m2VCeHQ6hSkank1iKeT4LqODGEpwaQsFCkQ4deW/yDgvS4+m27srqscjvYbQSHlByvmJ
         67DKr+B3axvtfwO3//ZSZQ1151S0+IkC1F+XXnyulRq6SziiXfrxoZ1RaWhSjckrrpay
         r1iA/KP4PLGOiCD/eoeEf5k3FsV1S8MyGG1WalC3SipZzcJAN/gNuu5hjE6ECPLIlIiP
         tnQf0Wg4t7eatgJ0BRQALwXrZYr/wSp5L6qBgIhM6obTeYqRxGHqhTaF8W5fgbvQbJAs
         7V6Q==
X-Gm-Message-State: AOJu0YwOXMELQq77X8wBoxGK7JdxHP/a0q7WqKvnKaFYNuOKNV/rP39e
	orSMT23/QYKou1Ph9d2DTFs=
X-Google-Smtp-Source: AGHT+IFWlJEd5lcJuO7NBXcmyzk/NQufpyDojp9c/24EWOp99ni3EczYohi8bG69H5WqdF1FOhglbQ==
X-Received: by 2002:adf:e641:0:b0:320:a4e:acf5 with SMTP id b1-20020adfe641000000b003200a4eacf5mr5026301wrn.34.1696608822284;
        Fri, 06 Oct 2023 09:13:42 -0700 (PDT)
Received: from localhost.localdomain ([2001:818:e906:400:b2bc:40c:b83d:9c16])
        by smtp.gmail.com with ESMTPSA id s4-20020a5d6a84000000b00327bf4f2f14sm1944289wru.88.2023.10.06.09.13.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Oct 2023 09:13:41 -0700 (PDT)
From: Ricardo Lopes <ricardoapl.dev@gmail.com>
To: manishc@marvell.com,
	GR-Linux-NIC-Dev@marvell.com,
	coiby.xu@gmail.com,
	gregkh@linuxfoundation.org
Cc: netdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] staging: qlge: Replace strncpy with strscpy
Date: Fri,  6 Oct 2023 17:12:24 +0100
Message-ID: <20231006161240.28048-1-ricardoapl.dev@gmail.com>
X-Mailer: git-send-email 2.41.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reported by checkpatch:

WARNING: Prefer strscpy, strscpy_pad, or __nonstring over strncpy

Signed-off-by: Ricardo Lopes <ricardoapl.dev@gmail.com>
---
v2: Redo changelog text

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

