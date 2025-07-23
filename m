Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4C1C18E1F
	for <linux-staging@lists.linux.dev>; Thu, 24 Jul 2025 03:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753327076; cv=none; b=etF6JdudALYKUGsRBOzQlksMXoj6Cg+LlSvRn3lajy2q5I9uAVhUTRUqCgl0J2gT/26YqyruvWB9Vf+H64fZTJtrJh2wwAR5wE38QTX/XJ5IJ4UdMXa1zrNH4pbqnVvZYRTONBjxLfqzEQN9dMvKut/vxu3Rb9/DFbr2/C03yyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753327076; c=relaxed/simple;
	bh=QTkkDJTPCTOX/PBqhLvE73FsUJC/VYLEVVtFobyeEfo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OujN7OzEcY7+QDXWmt3jBO2Vonjv5c7L0fIc1OfmRknrOFua8F1CsJg69sYH9/8oI5Kf8hqdW9zjhcJmp48TbuvWHn9I44SdVpzsulNuxUzBWMHDGVpoHyvY6VnuXO51SLUPawKGEW76A/KlRC3rq1FNXNS8UnHLLY0gjj/jTZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O6x1yieZ; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O6x1yieZ"
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-6fd0a3cd326so6380086d6.1
        for <linux-staging@lists.linux.dev>; Wed, 23 Jul 2025 20:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753327073; x=1753931873; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XAljfrVbCQMP4OjU7vXlw+3foLy1g0TZyrn3Si/4cH4=;
        b=O6x1yieZCObnlMDFCDSkVjfbVUXSNr+/SKoIYEFUY2aqA1HJBPkNLftIXEQnXOx7rq
         o3q3BKsvxGUtSwMoXlBkzoX6b9u9tcOOYA4MiKES7S61W1QXoCFOGZdYtqMArT8T2Efr
         HFEIAgpyoTGhHLhrdwCKhrO52niNjc4IKcfjdYLQpXvXXG3iB+c6MHz8WkOZY5tVHKGr
         HQfGqr+FbM4NuxdxbqIjm/HoqWUHZSpq2M+H8NK4KB6qBaSzXGuGYvIIHZU5KFZ4R3aZ
         pqDpP2T3peuR+MwYGV8zOS6lgxS6iX+xuxZZ8kNcQY2R+5D3SG9gmjQAYlDJkMAevkqb
         puuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753327073; x=1753931873;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XAljfrVbCQMP4OjU7vXlw+3foLy1g0TZyrn3Si/4cH4=;
        b=fyzmf69iHAPFh+3YSUUUYSBLJtKET+6Sf8HysOfp8CxbaWMPZt28UdASCOubNHg6VR
         fO8HDpGnEe3eoQoiPvzJygGPPzs/H841AFBocVY2p5egVp4L+NY/pYUKdCT8nWEcaRbv
         3+cITYozpl3pYPmO57BGULcO3rMVNhf7rqA8LM0h+sHfnCoJoKt9HAqfBuZgZ8/s8vcM
         Q7Lsk/RN+ToY+U32bUjUS59CJoyWVl3kW3oVB1YwGfSGlJTAkwbfJyoVo1ecIcnmhDBS
         wbU2YFvR2rEzZp2k8S4yD1OHCwEL98teQPVXqHzjULJfooslhFVA3f8QLniPFYsrrzqX
         zwEg==
X-Forwarded-Encrypted: i=1; AJvYcCV+f/7vIDFUSexmHOJFdzHsepCylONfMLUNWYQKUWz+nIYhkTqM10mqJKmF3FcUC2j/MoPABVSTGtm3psex@lists.linux.dev
X-Gm-Message-State: AOJu0YwzMMN269+ONaxjci77nm393YSbZSTX137HhnRbX84hO6tlSGoh
	fGFta70k6OcLxbgLpuSCoDjxvvwLJxYsM/2EByCnDhC9g6fZRYrr0OECrhyEZuUy7XWBAw==
X-Gm-Gg: ASbGnctmrvgwd6URnXpak7CbjRjp8XmSIHaXV/nwcokBlu4ugoq0cARWF+HEe6RZWSL
	/9h059EUIDID8/qD0Svm27AnJsKCya3Bvfcz4pYwwjMEmhAgEYby8GkGoDqypOKxTtw/237D+rJ
	VEhmk7Js8ZB2T+dzD3f29znIiueafUjYTf9S62PXkvS1UtrWvYygT20SVNrIOFDCeE2gcgjabn1
	6BPRsZp5GCDAM8oZF3njgdAzBdECh+ZdanvZCQMhH0xY059fmBo7fCRXmpgJ6Gc3q+qahxCYmf/
	7rHLs1s359VfmROBdWeq4JiAZaam+vzg9Tf7V5NvSQWeZYt9ypmwfh1skEaGq199TRytSdeX7up
	txLg2ue4QEHj6YzJ1wvZ+/RL/ykFi61byNHiankVgd+ZmdfUu1Ik+XmcJnjip8SPc/Y4Vw/p+SA
	==
X-Google-Smtp-Source: AGHT+IGMaoS2TN/vrjr4g20wygLTfR/K95in9/Al1VF4gv+iGx1fxXLgraUVzRNWvs/TzpAp/LgS5A==
X-Received: by 2002:a05:6214:21e9:b0:6fb:f03:6b24 with SMTP id 6a1803df08f44-7070069c990mr78773656d6.40.1753327073341;
        Wed, 23 Jul 2025 20:17:53 -0700 (PDT)
Received: from ax1.localdomain (c-69-136-155-163.hsd1.mi.comcast.net. [69.136.155.163])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-7070fca2597sm6671566d6.64.2025.07.23.20.17.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 20:17:53 -0700 (PDT)
From: "A.T. Jefferies" <alextjefferies@gmail.com>
To: thierry.reding@gmail.com,
	jonathanh@nvidia.com,
	skomatineni@nvidia.com,
	luca.ceresoli@bootlin.com,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	"A.T. Jefferies" <alextjefferies@gmail.com>
Subject: [PATCH] staging: media: tegra-video: use BIT() macro instead of shift
Date: Wed, 23 Jul 2025 23:17:57 +0000
Message-ID: <20250723231757.15443-1-alextjefferies@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace two instances of (1 << X) with BIT(X) in tegra20.c to follow
kernel coding style guidelines and improve clarity. The BIT() macro
also ensures proper type handling for larger shifts.

Signed-off-by: A.T. Jefferies <alextjefferies@gmail.com>
---
 drivers/staging/media/tegra-video/tegra20.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/staging/media/tegra-video/tegra20.c
index 7b8f8f810b35..1473f1b1f203 100644
--- a/drivers/staging/media/tegra-video/tegra20.c
+++ b/drivers/staging/media/tegra-video/tegra20.c
@@ -42,7 +42,7 @@
 #define       VI_INPUT_BT656				BIT(25)
 #define       VI_INPUT_YUV_INPUT_FORMAT_SFT		8  /* bits [9:8] */
 #define       VI_INPUT_YUV_INPUT_FORMAT_UYVY		(0 << VI_INPUT_YUV_INPUT_FORMAT_SFT)
-#define       VI_INPUT_YUV_INPUT_FORMAT_VYUY		(1 << VI_INPUT_YUV_INPUT_FORMAT_SFT)
+#define       VI_INPUT_YUV_INPUT_FORMAT_VYUY		BIT(VI_INPUT_YUV_INPUT_FORMAT_SFT)
 #define       VI_INPUT_YUV_INPUT_FORMAT_YUYV		(2 << VI_INPUT_YUV_INPUT_FORMAT_SFT)
 #define       VI_INPUT_YUV_INPUT_FORMAT_YVYU		(3 << VI_INPUT_YUV_INPUT_FORMAT_SFT)
 #define       VI_INPUT_INPUT_FORMAT_SFT			2  /* bits [5:2] */
@@ -73,7 +73,7 @@
 #define       VI_OUTPUT_H_DIRECTION			BIT(19)
 #define       VI_OUTPUT_YUV_OUTPUT_FORMAT_SFT		17
 #define       VI_OUTPUT_YUV_OUTPUT_FORMAT_UYVY		(0 << VI_OUTPUT_YUV_OUTPUT_FORMAT_SFT)
-#define       VI_OUTPUT_YUV_OUTPUT_FORMAT_VYUY		(1 << VI_OUTPUT_YUV_OUTPUT_FORMAT_SFT)
+#define       VI_OUTPUT_YUV_OUTPUT_FORMAT_VYUY		BIT(VI_OUTPUT_YUV_OUTPUT_FORMAT_SFT)
 #define       VI_OUTPUT_YUV_OUTPUT_FORMAT_YUYV		(2 << VI_OUTPUT_YUV_OUTPUT_FORMAT_SFT)
 #define       VI_OUTPUT_YUV_OUTPUT_FORMAT_YVYU		(3 << VI_OUTPUT_YUV_OUTPUT_FORMAT_SFT)
 #define       VI_OUTPUT_OUTPUT_BYTE_SWAP		BIT(16)
-- 
2.50.0

