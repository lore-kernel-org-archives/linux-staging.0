Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B3DA6D0E
	for <linux-staging@lists.linux.dev>; Tue, 18 May 2021 12:41:25 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id a4so10099849wrr.2
        for <linux-staging@lists.linux.dev>; Tue, 18 May 2021 05:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ldAI2BEKXxmJwnRzX0pdIQjXTGeWN2MbcUVMx3/xOUs=;
        b=O5FmbtkdFv+oxMelevJi0tWdjn++hJ44o/jcC2ZARwh5sLYFn/lBlDfzF0XNMlknGC
         4oengB49L5SsD1PCzBRJUNCWqKKGU7W8K5jmQ0+jZ8Je+iEByHJnSUzoKFoBAqCZ7jJQ
         JheLx6ziP873975yjnVewJo7F9qgF2qp/5Tf7VyddT2ZVykln/d6yMPEJezmBC5KoRMJ
         FDFMHzr1T23wTcwGR7T3lIXTVw2NsqSnAD2GXe8b0dblFIFQhoA1tlmccGF5nZ7NPQUm
         7oxaAWpvnYIEX1aMh+9JO9Lofgt3Nx/w/ELjJyMhDtPOXS7lYpscDGScCov/uX+Kgcji
         ZmXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ldAI2BEKXxmJwnRzX0pdIQjXTGeWN2MbcUVMx3/xOUs=;
        b=M/cvPV/Z4NxVwdWUyV2oIcsPHIy0DGBVAvLWlnRPbh25xthJX+cjnd4wpVZMbTVx+H
         A5qc1Fo9aWjbwMZ7lNrzxb1eHhaqPb78hxlCzHEjAfl2AinVbmyDEL1NtyRGD7PkFOjz
         z82oS/Cp/O5kXwed9WokOl0SdjHrKxCfPjQOFeRe4ddA9BGDXiVjvlM2MXfOs8DkrZ9w
         wDgSWpi2v33IBdkRU1c8kbBrGSmQ0EbeIwrHi5lcurQvovSMAxI6yUn+6CNQcj6POzd5
         OcSjj/ufNq+dERBoRpVIZOVu6FyYrEHYpAwviayqtJ9lWoKkU+l2Cq+grZk0LAqBB95V
         CJ2w==
X-Gm-Message-State: AOAM530SfyiodPoR0BYb47noPrnlwz1k3fFlzuCrggvo0KyaSBxtikdI
	IABGnT/3SNWI6DN4x/02VPasWQ==
X-Google-Smtp-Source: ABdhPJwfe0oVtQR6+PwolxvP1DrBzzzVAuvX50itJs00RINjQWwDB1/8Aby8FoFAtrGLlYghJslkrQ==
X-Received: by 2002:adf:e484:: with SMTP id i4mr6694239wrm.117.1621341684097;
        Tue, 18 May 2021 05:41:24 -0700 (PDT)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id z3sm1677239wrq.42.2021.05.18.05.41.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 May 2021 05:41:23 -0700 (PDT)
From: Corentin Labbe <clabbe@baylibre.com>
To: gregkh@linuxfoundation.org,
	mchehab@kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	mjpeg-users@lists.sourceforge.net,
	Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH 5/5] staging: media: zoran: change asm header
Date: Tue, 18 May 2021 12:41:13 +0000
Message-Id: <20210518124113.1823055-5-clabbe@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210518124113.1823055-1-clabbe@baylibre.com>
References: <20210518124113.1823055-1-clabbe@baylibre.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As asked by checkpatch, convert a asm/xxx header to a linux one.

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 drivers/staging/media/zoran/zr36050.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/zoran/zr36050.c b/drivers/staging/media/zoran/zr36050.c
index 8bb101fa18bc..c62af27f2683 100644
--- a/drivers/staging/media/zoran/zr36050.c
+++ b/drivers/staging/media/zoran/zr36050.c
@@ -16,7 +16,7 @@
 #include <linux/wait.h>
 
 /* I/O commands, error codes */
-#include <asm/io.h>
+#include <linux/io.h>
 
 /* headerfile of this module */
 #include "zr36050.h"
-- 
2.26.3

