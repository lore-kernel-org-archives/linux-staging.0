Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9DBA2F9A
	for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 07:44:12 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id q6so22234881edr.3
        for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 00:44:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iaLBLpH1bRJTkz16FdRyEIFEY11hvtpkxH7HSb/2I3Y=;
        b=ufIAW6qRw+IA2RpZfT2f3DQvRlscC2HVXeXgI2PO6Y9ze/bpdPAuY+nIzmbtUHQF2t
         XAh+JJaO1Sov75y8DTHaRh5jToN3YU7r1Utja7muGzQj2+DhFU5h6IDcdEvcxqy2G327
         j13M1nGP1K/rH37mvisDi3X0/xN3TaSNMXJHxnmpWNTMdp9h31vtpUmD47a7SQ9W8EQz
         7uzcznl4T/sxmUI+UW+pHYuiiGwv/JTnR1MAppbt3n+ip0gd9mkrHCPDkzRW3wf2FAkn
         VbirTK2UbMG/EsKEFV24SkdLeBDVpwngJt+od5vTTpM6q8JuhuYd9wv8nnYQTPrtOzJ2
         iEsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iaLBLpH1bRJTkz16FdRyEIFEY11hvtpkxH7HSb/2I3Y=;
        b=VqaKTFkjSPD77VYdar3HC6/7mWTWcTTgNpqH+leCG7ZkBRSNC/64p8ghxnXHEVPgN/
         N7f9ZC6MOMyilnKBz1wfFRUFBjkXHeZBehg6+/sjwha6S53rmbud+T5ACPqf951e/+tE
         WZFVXL3VDn5XoBiC1h0b6tHicvfh27cuWwpzh7BT+XWeRKUuoIM5v78bwz6Ejop47J/J
         VpvMXfYtF8mr6K+PVzEbM+lnQvVvWcoq96Hx1wA0q21g7VdAuliF2wjS0r3InufvH66B
         bEaz3eaK0TcvOUfjK0Az1TBTn85thz73ddeTkxq84k+CwvqQZl80iDF2cX4waHYz3dZM
         983A==
X-Gm-Message-State: AOAM532uRCT2DDZ9MHGqPyHEla28kLOZfGXiHMj7Cf/pElVBHB0QLvae
	ifPeMD+JIh6ZOyiECHxX0ZIV3gEPn3BNtQ==
X-Google-Smtp-Source: ABdhPJxYe9GTHG+HnO9RLlPtInwomwT/e/wwWc73hRW5at5cmZx2BA9foZUkHidBXUhmhXM3XW62EQ==
X-Received: by 2002:a05:6402:5113:: with SMTP id m19mr4249524edd.78.1619768651339;
        Fri, 30 Apr 2021 00:44:11 -0700 (PDT)
Received: from agape ([5.171.81.86])
        by smtp.gmail.com with ESMTPSA id bu8sm671926edb.77.2021.04.30.00.44.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Apr 2021 00:44:10 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 04/43] staging: rtl8723bs: remove empty .c source file
Date: Fri, 30 Apr 2021 09:43:22 +0200
Message-Id: <64216680513f7876ea26bf95481c2ef35d7cf60a.1619768150.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1619768150.git.fabioaiuto83@gmail.com>
References: <cover.1619768150.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove empty .c source file

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/hal/odm_PathDiv.c | 9 ---------
 1 file changed, 9 deletions(-)
 delete mode 100644 drivers/staging/rtl8723bs/hal/odm_PathDiv.c

diff --git a/drivers/staging/rtl8723bs/hal/odm_PathDiv.c b/drivers/staging/rtl8723bs/hal/odm_PathDiv.c
deleted file mode 100644
index 1a2e367bb306..000000000000
--- a/drivers/staging/rtl8723bs/hal/odm_PathDiv.c
+++ /dev/null
@@ -1,9 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/******************************************************************************
- *
- * Copyright(c) 2007 - 2011 Realtek Corporation. All rights reserved.
- *
- ******************************************************************************/
-
-#include "odm_precomp.h"
-
-- 
2.20.1

