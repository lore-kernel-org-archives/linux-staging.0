Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E63D157E84
	for <linux-staging@lists.linux.dev>; Tue, 27 Feb 2024 22:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709071855; cv=none; b=A5pSbJ0kErjgy0a4Jh+O7Ss2iy5iAa2hTIcMF6P6Mtl8XlzfG+AYWMM88m5lbhcKehRZPF2JUBG4cIaGlvcJqjk0Od5RDIYkvNMGStAQCPBL6LJABbZ2lMlRm2O9Ty4S/eygW2EGuT2NawpfNPFywTkVhucf/bLd5TcFzM3lToM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709071855; c=relaxed/simple;
	bh=ZLpd/FTiTFzHnfpWMzTXSPkcqYPvkCAzdFD9LpcTNSI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VRViLyAFEzlgDenwxKKJPtn6swJzM5x99r2WJqKX5Dvk1rmEh2nWwsJMc6s+HDIl2Ks3RAEeoQ24Zqe39G06TeIvQf13Ki94nDJNL59JDc9kY87sRWLhUqChnVQ1K6Hia674XqoVuBqlYaWEQjklEntJn+Y1FBX6vd5sll50Ggk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C7B9Suf5; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C7B9Suf5"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-412b272799aso1795695e9.3
        for <linux-staging@lists.linux.dev>; Tue, 27 Feb 2024 14:10:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709071852; x=1709676652; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=56OYpxv+7Sg0fmYSpVc7Gnw4S4WJ/wpnYoYBTxSpZBc=;
        b=C7B9Suf5/gcpxdkpJgfmZ+/dSpp6w7FwDUz4ixFzDMgi5FWHpBpUkkj8R2dv4M+Lx4
         TRxLILYPnnk45H0YQa1/O1rkdR5tCjay+IBTEJQp9LqzmntEg9Xvh7FADT6w1gIe76zE
         3tmCgd2eZbLE7vlSCCegIL24KN59EzN/CB317ZsM6hGLvnoCYkwa6I8cjtbFcR7soTJJ
         VWFdHYg3uAMgrJCmDhp4VYZ5IRNF/9S/C3nfFAN9hHjfgThoKFC/CN2qIiODXIunO/cq
         trllETN1HI2RsI+C19BECb6VMmoDv6iZhkvJw4bCLcFJwr04YyeXDW96e7jXaCTOmFD6
         Aeug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709071852; x=1709676652;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=56OYpxv+7Sg0fmYSpVc7Gnw4S4WJ/wpnYoYBTxSpZBc=;
        b=EqoCIT77aMWLZxf2JHGQOBz2p7wjuv0HPDBWDm7yx5zrnsITCQ8q88oDQg8WTJpbkU
         opdaf9Fk5IoPRNf6pD1Titu9sLYYPpD+oaR8NFRzRdLj3tbr2dEeqJvnD/2hqWtqBMzS
         bonA77Jh+UVNNt/rt3MeC3xOMVIgcqSIL9ysG0xs2bEa2KItJ6DYzxR+tCIyAzxO9a/n
         ie93cy+ekUnrm0gtuKWGlzw6IknLokM8vAO+T4g3OWWqIUbdgGhI7ROkufhHFAlBt9ZI
         19YyTtWbgepgCdlGiBonqspqdArU7YGJ9rtPgs1r///l2OnOZVh34iwiMCa4+Dq+cLAx
         siEA==
X-Gm-Message-State: AOJu0Yy9zv7C0qedE1DX86K27nCdh3UQBeeyziWTU8UijTNK8LH3xF4d
	0VI6jDbtjisu/JMngqTTz8t1bfUexoAHtFOUJp8Ov6yFUmNme8dW
X-Google-Smtp-Source: AGHT+IHgPMJZmLwhDrz4UIT1yJut/ieKa6GrcqGnCzDoy8/Ahz90hV1a1K0FUpu6/qr6TdNFGieWPQ==
X-Received: by 2002:adf:f58d:0:b0:33d:4f6d:de84 with SMTP id f13-20020adff58d000000b0033d4f6dde84mr7765794wro.6.1709071852037;
        Tue, 27 Feb 2024 14:10:52 -0800 (PST)
Received: from YOGA.local ([2a06:c701:736b:f200:73a5:2235:8954:9b7c])
        by smtp.gmail.com with ESMTPSA id q2-20020adfab02000000b0033cf5094fcesm12562384wrc.36.2024.02.27.14.10.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Feb 2024 14:10:51 -0800 (PST)
From: Shahar Avidar <ikobh7@gmail.com>
To: gregkh@linuxfoundation.org,
	luca.ceresoli@bootlin.com,
	benjamin.tissoires@redhat.com,
	elder@linaro.org,
	andriy.shevchenko@linux.intel.com,
	robh@kernel.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/5] staging: pi433: Remove the unused FREQUENCY define
Date: Wed, 28 Feb 2024 00:10:42 +0200
Message-Id: <20240227221043.532938-5-ikobh7@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240227221043.532938-1-ikobh7@gmail.com>
References: <20240227221043.532938-1-ikobh7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

FREQUENCY is not being used, delete its comment.

Signed-off-by: Shahar Avidar <ikobh7@gmail.com>
---
 drivers/staging/pi433/rf69.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/pi433/rf69.h b/drivers/staging/pi433/rf69.h
index 52e43a909b03..e63e87fd6cce 100644
--- a/drivers/staging/pi433/rf69.h
+++ b/drivers/staging/pi433/rf69.h
@@ -11,8 +11,6 @@
 #include "rf69_enum.h"
 #include "rf69_registers.h"
 
-/* NOTE: Modifying FREQUENCY value impacts CE certification */
-#define FREQUENCY	433920000	/* Hz */
 #define FIFO_SIZE	66		/* bytes */
 #define FIFO_THRESHOLD	15		/* bytes */
 
-- 
2.34.1

