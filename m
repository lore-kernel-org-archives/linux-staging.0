Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38FDD2FB3
	for <linux-staging@lists.linux.dev>; Fri, 23 Jul 2021 14:45:03 +0000 (UTC)
Received: by mail-qk1-f174.google.com with SMTP id 190so1532911qkk.12
        for <linux-staging@lists.linux.dev>; Fri, 23 Jul 2021 07:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+rDx7AW8w6lsRejB1ADIxF0GfpzY9ITULtK38JCHUMQ=;
        b=MXsniuTM8zhOI8eUJnLZqiEiDaRnbe0m+6veHKHhCce/8SQ1SEu9b+G5a96XNV6DX5
         2QP4h/cHJUSGYDVre0woNuwZbe2o2urxMsY3FD/9wauFDSP4Uw84Ikm0k9y/hGYTixsh
         N6ioGuDqAf9PzylDXOaHfUAyTGOrzE4wQX0oWPiyHV0F+ydmYgUcsEtxFuGDV/dg3809
         hOQujOOhZe8cIIlkQvJFeC5FFSmDUGI8P0hW/HjNX1l1r0Dghdr8+dEU9MuW/xviPa+Y
         nHxV7dnPjqi9uieLPFHsG7NgahsHOFDI8U1Zfuot5rFmdgaNeqFjErJB06VaIqZ0DW6I
         ygeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+rDx7AW8w6lsRejB1ADIxF0GfpzY9ITULtK38JCHUMQ=;
        b=UULjNgn7pYNrGAy1TDfVnSPk2E6EcgA06p7e/ZIEAj68gETejQOH7SBHnCfDeDLNHh
         WlsfIOlloYs5cweDr+30QD2sUReGomQu2+rSzKBD+dimpPiTWKkyh1LYCaAZUl8Y2m5/
         bk6whvh6TCo/bJFApYJI9tX8gulxvL0WojT42FDPfz3g0q03f1pZI+Yv9QwnSPdW4c6B
         7UCERSqZCq3HYwKjHQNL+oT/eb/1Y4afhvJR4BIcpbkKC9+gIrW1tjqMem7v5TWmE7Z9
         sHqbtpIeZ3TeWgxJZncDttd3RZ4/iRMKXt9INZC+mse/TnmJABXu8yKy+IXhbjdtIo3n
         Fekw==
X-Gm-Message-State: AOAM530Zf7hXXK4aB59WDYRaCBkA05cazCJ7PUlKfD+6cIuV9X9OOz08
	qKMLDLbii0llw1wqPzN8kstVGQ==
X-Google-Smtp-Source: ABdhPJzeRCjHpWvJ/Mm2JkUEV8JyrLOMLQOr5VVOZTs49e1AEFEe2UfBdaLC6TTZBOIvMkQb2LHOQw==
X-Received: by 2002:a37:d86:: with SMTP id 128mr4808233qkn.299.1627051502348;
        Fri, 23 Jul 2021 07:45:02 -0700 (PDT)
Received: from localhost.localdomain ([12.18.220.71])
        by smtp.gmail.com with ESMTPSA id 100sm3887223qtg.73.2021.07.23.07.45.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jul 2021 07:45:01 -0700 (PDT)
From: Lucas Henneman <lucas.henneman@linaro.org>
To: greg@kroah.com,
	forest@alittletooquiet.net
Cc: lee.jones@linaro.org,
	linux-staging@lists.linux.dev,
	trivial@kernel.org,
	Lucas Henneman <lucas.henneman@linaro.org>
Subject: [PATCH 10/15] staging: vt6655: remove filename from dpc.h
Date: Fri, 23 Jul 2021 10:43:35 -0400
Message-Id: <20210723144340.15787-10-lucas.henneman@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210723144340.15787-1-lucas.henneman@linaro.org>
References: <20210723144340.15787-1-lucas.henneman@linaro.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch resolves checkpatch's warning, "It's generally not useful to
have the filename in the file" for dpc.h.

Signed-off-by: Lucas Henneman <lucas.henneman@linaro.org>
---
 drivers/staging/vt6655/dpc.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/vt6655/dpc.h b/drivers/staging/vt6655/dpc.h
index eac67794cc49..40364c0ab7f6 100644
--- a/drivers/staging/vt6655/dpc.h
+++ b/drivers/staging/vt6655/dpc.h
@@ -3,8 +3,6 @@
  * Copyright (c) 1996, 2003 VIA Networking Technologies, Inc.
  * All rights reserved.
  *
- * File: dpc.h
- *
  * Purpose:
  *
  * Author: Jerry Chen
-- 
2.25.1

