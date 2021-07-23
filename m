Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C29C2FB3
	for <linux-staging@lists.linux.dev>; Fri, 23 Jul 2021 14:45:05 +0000 (UTC)
Received: by mail-qk1-f182.google.com with SMTP id z24so1558735qkz.7
        for <linux-staging@lists.linux.dev>; Fri, 23 Jul 2021 07:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QuaGzglFU1GXR8Q2esHJ4OTYfCxH9zIXnP0+lc0e3Kw=;
        b=F7L774aK3fcIIShkoA8x0sv4NY2Nv0ziyi0O1fci6e98wyt1Rp7gepR1MOyA9D99g5
         muY3awzF1muGOm6oKMRDpq9NWfNwyDTIlgMb+Ss0y/tQFeZubELNG0sqHQWyr2M+trwf
         8OGkZUDdpZ01fwOatpEFo0QyuBwPhnyA92iIwH6KtA1ripfsvVKf17TKDUK2JzExqx08
         b9G3XcCopJaFsact4QDudaURQSXkaT22d8VSFRBrbOImN29j4BzUjMidEZHaB5kUNbVc
         bI1kh8wR6Jvk1pejlXeKZM39LU8jZIP+RUrano5mI85zYkWQh/wt9L+7JGBAdkgD0/gl
         wvFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QuaGzglFU1GXR8Q2esHJ4OTYfCxH9zIXnP0+lc0e3Kw=;
        b=oPYc+0nKV3kOcpcIwxSt1mSYqVtCDKWixz0mo5cnlu+ml3zfH/FB72+8Wf9mqmBTUa
         dTAL3+IvMERclxA4P6fvPOkw/U2jJs2/X1WxOJBd64oNNI3CjpCPL/0LLJ4Go0uFHct/
         lZxXl1dm7xksxrMc7v7MbJrSpzvIng602tNnaOoyPC3RH+fWbM0izQ7cxUKHFsj5fAYs
         iLabKASK8+Ob8BrP1ZjGc9d60zDREJWr72keAZrI7kcMt+15v2r67+2XT2xmW1nbjTAy
         NiglY/aLDVVlGecoCvcdYXz0hIXmluQCi5FI1HO5PnyiQkiEGTFe51MY0AOrM2z9j57q
         nVRQ==
X-Gm-Message-State: AOAM531pNAq6tyU4XqEe9CXTQVCrzMShekZhTdUlUkNtWWAVb7ykjtCr
	c4VqvFUyRiUv5adVuoNzBKqIug==
X-Google-Smtp-Source: ABdhPJyVx/OImaP+cYmb9JgR3Jp5cPP/KFlEYW9jCIoNO5u/JHSP/nXIqI586VDwiJ3YzUmY72HhLQ==
X-Received: by 2002:a37:9a0e:: with SMTP id c14mr4842312qke.398.1627051504266;
        Fri, 23 Jul 2021 07:45:04 -0700 (PDT)
Received: from localhost.localdomain ([12.18.220.71])
        by smtp.gmail.com with ESMTPSA id 100sm3887223qtg.73.2021.07.23.07.45.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jul 2021 07:45:03 -0700 (PDT)
From: Lucas Henneman <lucas.henneman@linaro.org>
To: greg@kroah.com,
	forest@alittletooquiet.net
Cc: lee.jones@linaro.org,
	linux-staging@lists.linux.dev,
	trivial@kernel.org,
	Lucas Henneman <lucas.henneman@linaro.org>
Subject: [PATCH 12/15] staging: vt6655: remove filename from key.h
Date: Fri, 23 Jul 2021 10:43:37 -0400
Message-Id: <20210723144340.15787-12-lucas.henneman@linaro.org>
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
have the filename in the file" for key.h.

Signed-off-by: Lucas Henneman <lucas.henneman@linaro.org>
---
 drivers/staging/vt6655/key.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/vt6655/key.h b/drivers/staging/vt6655/key.h
index 9347776fa3a5..d88da9dfb5c3 100644
--- a/drivers/staging/vt6655/key.h
+++ b/drivers/staging/vt6655/key.h
@@ -3,8 +3,6 @@
  * Copyright (c) 1996, 2003 VIA Networking Technologies, Inc.
  * All rights reserved.
  *
- * File: key.h
- *
  * Purpose: Implement functions for 802.11i Key management
  *
  * Author: Jerry Chen
-- 
2.25.1

