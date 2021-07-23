Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 399342FB3
	for <linux-staging@lists.linux.dev>; Fri, 23 Jul 2021 14:45:04 +0000 (UTC)
Received: by mail-qk1-f172.google.com with SMTP id t66so1624723qkb.0
        for <linux-staging@lists.linux.dev>; Fri, 23 Jul 2021 07:45:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=AfWzcQZKf6Ey2zhSzagfdEPJJDQ3OrJ62u5Gn0PH4Nw=;
        b=S2BEsDhUui6evIvD+Skdv4A17d4bAd+6kUkM7LFFRXdzi9Gnwsga2lVT+K1RkPwu6p
         UznRFQ0zrqf4jbAUZruhDZzxfpfC6E4yEFUBCimQk5bGL2QTJAMa9wxccYlu1EEJp9+a
         4w61FgttjFcH/iCXQNAm21SfUcldfPY3ElMmggQ3Ok5syuvpy38hXCt1tNb8zSjFz+jQ
         mw9HwOGsdKGsnZyGsrk7QIvbmA+3LeleIT6xZ1jDLN8QUyhYF23j/gMoIWc+s/Ytkq4K
         BzKlsIrjHzqdGdpWtnRFgPYIClxwh+c4GIrV9hbgQvBBfQmFAPRAwBYJAmawTyZhgKqB
         Lo/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AfWzcQZKf6Ey2zhSzagfdEPJJDQ3OrJ62u5Gn0PH4Nw=;
        b=jTPL+XsdwMed1UxXCtH9YdwQQKFQaDx2jnM6xL+oj9puzBf8EXEZHXdF6zUfhCtQ3U
         qDljK3on//QGRD9KoEsJ91S9ofdQfq96qBXwLxlA/hfPZ9E+x1/d3pWVkiPspVFukU+l
         QgKVbcRD88FBb3RqMvh6ba3wQhmV//AtK/FkRuASF/s/OB17A3rWQjppc9wzCvRAj8Xl
         WiQNoAwlIAQfUJQBdUBCsC8hkl40APXppZXSFxF4EWfKOkRiFFopfepodnCcEr+UZkxU
         WjD5farY7QhvNhby0aeJBjPNHF+oEt5NmIhmiRB0ub0/Y6cl0/1Z8sYxKcedkhm9YLmU
         bWuA==
X-Gm-Message-State: AOAM530be554a6Gr7FYJmwJBzaX2fjc7kRq+yVvF+eh5hywvB/WdpwCH
	Ju8Lyf3dwnXa2z6BlCQDJlH1AQ==
X-Google-Smtp-Source: ABdhPJx6vvogb3Yr09wTMq/0Auct/80EQlbv+q4S2xY4nV/Wo0kT8kja/1AiuqjCl+bj0DQBkh4v/w==
X-Received: by 2002:a37:c207:: with SMTP id i7mr4888372qkm.216.1627051503327;
        Fri, 23 Jul 2021 07:45:03 -0700 (PDT)
Received: from localhost.localdomain ([12.18.220.71])
        by smtp.gmail.com with ESMTPSA id 100sm3887223qtg.73.2021.07.23.07.45.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jul 2021 07:45:02 -0700 (PDT)
From: Lucas Henneman <lucas.henneman@linaro.org>
To: greg@kroah.com,
	forest@alittletooquiet.net
Cc: lee.jones@linaro.org,
	linux-staging@lists.linux.dev,
	trivial@kernel.org,
	Lucas Henneman <lucas.henneman@linaro.org>
Subject: [PATCH 11/15] staging: vt6655: remove filename from key.c
Date: Fri, 23 Jul 2021 10:43:36 -0400
Message-Id: <20210723144340.15787-11-lucas.henneman@linaro.org>
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
have the filename in the file" for key.c.

Signed-off-by: Lucas Henneman <lucas.henneman@linaro.org>
---
 drivers/staging/vt6655/key.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/vt6655/key.c b/drivers/staging/vt6655/key.c
index 94665ddc36a5..20881cf2f394 100644
--- a/drivers/staging/vt6655/key.c
+++ b/drivers/staging/vt6655/key.c
@@ -3,8 +3,6 @@
  * Copyright (c) 1996, 2003 VIA Networking Technologies, Inc.
  * All rights reserved.
  *
- * File: key.c
- *
  * Purpose: Implement functions for 802.11i Key management
  *
  * Author: Jerry Chen
-- 
2.25.1

