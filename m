Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE743177
	for <linux-staging@lists.linux.dev>; Sat, 26 Jun 2021 11:30:29 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id v13so6091942ple.9
        for <linux-staging@lists.linux.dev>; Sat, 26 Jun 2021 04:30:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=17yjFWpV5LaTQXQYRjJtUi+sXaiDlDLeKKNbuSlzlx0=;
        b=kJ+xFniWGC9k9BvWDrq8mM0kge4O65m8573p/mFcdQxFG/DUGRu8fMW3/xD1e1eu4b
         oBcq+24sUrR4k+Kea+mjt20WSpuEyVXsWFnZAUdUO8LVzPgRz+cN5cNBE6JX08HwgUBC
         dyA52EYh1+4ulGt3q3ttsZEGV4d9Wul5h8wQnp17/wE/w12KAGFNuxCar95JCh6n0/vd
         YcUvMI/5w7MKud0eHyCQGe29T5A7IcoKqDy3Yu6qrF3Pk6FX1EW9fZUGlJVUn+a0dRVN
         blk3+hw4dUvHGU3BYljbE76RNn84v4Z1rpNMv2mDZn1FVHMmgAQLDz+kibwnrTkxCjol
         uUmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=17yjFWpV5LaTQXQYRjJtUi+sXaiDlDLeKKNbuSlzlx0=;
        b=t/DfS05nhi4qq7YZsU3eq2H5w4flfAVzmLCE1o8anTGV/9EPFwGNuWvv99BLDkDPYG
         Cwp7f4/P247WkIS5JsmbdNCF55FmikrKNaiqW3WIRqn144sxuGzU5wyszBkuJFEEo7Vn
         5RAuDQGFUto8XlNAYpzVunAatOOCndVMNlmMq2HSc0mSTmyR0SiLN2PXk0jZl6iIcSQr
         f2A14ILdfA9KvsIaqtDCOjKHd03Bu9zwE5IGqektJ7CDvN2XZz7nLGZYQmbbs/pkkJp9
         ijkM+EcHO3PdbAljDPHNp4iVDOY7XxUHa9s2cGKO62sM0E5NhHEJPpcjoUlbpfwRCwVM
         2yjQ==
X-Gm-Message-State: AOAM531wDuFkzLjnjrJIWjiv3UuwP5XEnyu6H1ic9SgRMqGD+0bNOl/v
	FLCc7hPT6oNcVK6LwWh5UFA=
X-Google-Smtp-Source: ABdhPJxXx55UhpU/bj+BcousF2vwV9QT+8tGc0gmZkQioSwjTk1lupLMV+Ch/b1AenNfnKptkWVYIw==
X-Received: by 2002:a17:902:d2c1:b029:122:ef41:c4cc with SMTP id n1-20020a170902d2c1b0290122ef41c4ccmr13285456plc.83.1624707029191;
        Sat, 26 Jun 2021 04:30:29 -0700 (PDT)
Received: from nishal-pc ([183.87.54.190])
        by smtp.gmail.com with ESMTPSA id d2sm7854344pgh.59.2021.06.26.04.30.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Jun 2021 04:30:28 -0700 (PDT)
Date: Sat, 26 Jun 2021 17:00:21 +0530
From: Nishal Kulkarni <nishalkulkarni@gmail.com>
To: Manish Chopra <manishc@marvell.com>, GR-Linux-NIC-Dev@marvell.com,
	Coiby Xu <coiby.xu@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: netdev@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: qlge: Remove unnecessary parentheses around
 references
Message-ID: <YNcPzWXkKkmip95x@nishal-pc>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

This patch fixes checkpatch.pl warning:

CHECK: Unnecessary parentheses around mpi_coredump->mpi_global_header

Signed-off-by: Nishal Kulkarni <nishalkulkarni@gmail.com>
---
 drivers/staging/qlge/qlge_dbg.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/qlge/qlge_dbg.c b/drivers/staging/qlge/qlge_dbg.c
index 37e593f0fd82..66d28358342f 100644
--- a/drivers/staging/qlge/qlge_dbg.c
+++ b/drivers/staging/qlge/qlge_dbg.c
@@ -733,7 +733,7 @@ int qlge_core_dump(struct qlge_adapter *qdev, struct qlge_mpi_coredump *mpi_core
 	}
 
 	/* Insert the global header */
-	memset(&(mpi_coredump->mpi_global_header), 0,
+	memset(&mpi_coredump->mpi_global_header, 0,
 	       sizeof(struct mpi_coredump_global_header));
 	mpi_coredump->mpi_global_header.cookie = MPI_COREDUMP_COOKIE;
 	mpi_coredump->mpi_global_header.header_size =
@@ -1221,7 +1221,7 @@ static void qlge_gen_reg_dump(struct qlge_adapter *qdev,
 {
 	int i, status;
 
-	memset(&(mpi_coredump->mpi_global_header), 0,
+	memset(&mpi_coredump->mpi_global_header, 0,
 	       sizeof(struct mpi_coredump_global_header));
 	mpi_coredump->mpi_global_header.cookie = MPI_COREDUMP_COOKIE;
 	mpi_coredump->mpi_global_header.header_size =
-- 
2.31.1

