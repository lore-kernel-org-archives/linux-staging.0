Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C71F2FB6
	for <linux-staging@lists.linux.dev>; Fri, 23 Jul 2021 14:45:02 +0000 (UTC)
Received: by mail-qv1-f43.google.com with SMTP id d3so1428144qvq.6
        for <linux-staging@lists.linux.dev>; Fri, 23 Jul 2021 07:45:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lyXzcFmpwuiVTS5J8uPM1gTaX7CQaa0bCyQcIIiZ/z4=;
        b=Rt7baX36NngI35smAwPkoxyo4/C+PAK8T80wx9i2ftmbznYECbOO03OK4TS3IoR6uc
         vnJuQbzm5VT7BLN2GCqB8+NJAjZ55ho3wxyke3NxVkVW1whHmca5ynZN7S+ajrw9ecmg
         JGyrpbJ/enTwoVPi5naCkX/2UlFTztMp7z4a0FJNW29CMtm4iNjdUiIshfuGFE0LKcZV
         N4CLTAGp4z97ANwLOIIQ/PahhYblXwOgqqqS5Mz+D1w24LHR6xwryC8Xqr+OEC7qEEdL
         IBoFSbdq+nvf7dkrR5vlsyosy9Jxeh7qH9Lh549Kj4/l3WUWXQauPGecUc0UQdXCtqGS
         aJXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lyXzcFmpwuiVTS5J8uPM1gTaX7CQaa0bCyQcIIiZ/z4=;
        b=QtiF6wLcy2aKLtTWwRi1eRz4irwWzXaR2QImy9e6SHBmxvn6+xaCNMKzS2RHBYlASj
         H9hGJXiDn+8p93NEFLXTj0FAtyeHBu2fmL6PYdoQTn5pAZAeCJVZkd1Xn2nj0USUgzLF
         XHUgaWwZ4+vvWKBWgXsDbpRFer9wu9hI0XJHt4+rjZXPoi2mYrt5Fb7Zw4Jd6OJi31cl
         MtBdPP52V7YPAJQzufSVb9ZvvmTyoNdIqclMf5YsSiPsq33v4zaBEYBUsE4PCnGICrS5
         wLqMJuWZKDYv92uHky8CzUC9x0vh4yEljwC7gG8az4DNy8p/Hq1uUusKMoYvUbxcaZ3O
         2JzQ==
X-Gm-Message-State: AOAM533FActNeeXGXi6ZFGXaLoxuaW2gE2+0JZp0N+9711NR3REYmeTw
	6TEjOOkS7x6WBXP+cwfVViyqYg==
X-Google-Smtp-Source: ABdhPJya2YEAoVNOcW3DoOUu8gxqnmjNnF+R4TVZ0MuDYgnYZYR/1YK2MjfAPC5Wd5k4uLRF8o0FhA==
X-Received: by 2002:a0c:be85:: with SMTP id n5mr4962026qvi.59.1627051501628;
        Fri, 23 Jul 2021 07:45:01 -0700 (PDT)
Received: from localhost.localdomain ([12.18.220.71])
        by smtp.gmail.com with ESMTPSA id 100sm3887223qtg.73.2021.07.23.07.45.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jul 2021 07:45:01 -0700 (PDT)
From: Lucas Henneman <lucas.henneman@linaro.org>
To: greg@kroah.com,
	forest@alittletooquiet.net
Cc: lee.jones@linaro.org,
	linux-staging@lists.linux.dev,
	trivial@kernel.org,
	Lucas Henneman <lucas.henneman@linaro.org>
Subject: [PATCH 09/15] staging: vt6655: remove filename from dpc.c
Date: Fri, 23 Jul 2021 10:43:34 -0400
Message-Id: <20210723144340.15787-9-lucas.henneman@linaro.org>
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
have the filename in the file" for dpc.c.

Signed-off-by: Lucas Henneman <lucas.henneman@linaro.org>
---
 drivers/staging/vt6655/dpc.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/vt6655/dpc.c b/drivers/staging/vt6655/dpc.c
index 52214a30e9b6..2d06cecc0307 100644
--- a/drivers/staging/vt6655/dpc.c
+++ b/drivers/staging/vt6655/dpc.c
@@ -3,8 +3,6 @@
  * Copyright (c) 1996, 2003 VIA Networking Technologies, Inc.
  * All rights reserved.
  *
- * File: dpc.c
- *
  * Purpose: handle dpc rx functions
  *
  * Author: Lyndon Chen
-- 
2.25.1

