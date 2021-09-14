Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B14AC3FD0
	for <linux-staging@lists.linux.dev>; Tue, 14 Sep 2021 14:31:13 +0000 (UTC)
Received: by mail-pg1-f181.google.com with SMTP id 17so12904833pgp.4
        for <linux-staging@lists.linux.dev>; Tue, 14 Sep 2021 07:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=w0OnMvsDVskt5GO6UPoyhHQ+fQZFdSjePNVx2sNQE/o=;
        b=WoiotpieTT+jVVeokS5GLYFcwyaC45SPW/UM4a76quzE/R4aR7TmMNDfidSmrxdpHh
         sZ9kL+wPjdNPRlPVREHitomHTBrgxmtpBfqtkVvUFqJF31V9t+ycbishWeQoPS/n0q1g
         Frn5c0tiwOf/FIyoZB0U9WftFGpMiaiReHbyzKjB3oAvha00x4VuJUU6sTK/2TfYg1zo
         0MO7gckoCZbKjgjDULwGJmXL5u4eO97dvuuxM3DXlsPqVtUUA4D+B/5VU+dJHbeXrXzk
         qHzxGujsX7DtZc6KFXY07TvBMWUgdV/BSXQuqR1w803PGtdjRrYdhtbj0TYesQqWertd
         1MUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=w0OnMvsDVskt5GO6UPoyhHQ+fQZFdSjePNVx2sNQE/o=;
        b=6aX5L8tImnWfb2R9cH4jtZNuH//PpyB96qjn82RDkBI1fz6V1peYkP6SS7LOPuhLsI
         DAneqRb6CLUl2kZykavXVx/ooBg2LzWTd5XdpYWDkWzxqu12BXJHYFdYUJqoSy23CarJ
         xppG7DcmA4I5i9pLFSIJU22KNAnqTBsrAo0WknLFkg+LZ7KtDUuc7N8bX+cp+T6Vlj8z
         uHPgcEG/7wjxHKYVjfNShFGrdrqGe3zROo/CCLa15sWO9JesXC0wtToA6asKxOkBipAj
         jsM6As+FAcCa/Gixb7RiWcbe1XpqytKI09ThL013ShrXHPKI4FDz1yNsuNAy3fCyCjAv
         bysA==
X-Gm-Message-State: AOAM5305aXo4cxqU4fBeUET6H8kStBk9ndbbPrTYRefRl/lZRC5PpRU5
	FCT23+nzDevKy8k81yboyzQ=
X-Google-Smtp-Source: ABdhPJx+1bKb7b1nUkHsmCbarE6xqR+X/fKwp0fj/jnKlt7HW9AigaevdLjwlFuIs+zsRpahzX20Og==
X-Received: by 2002:a63:7a0e:: with SMTP id v14mr15821775pgc.466.1631629873230;
        Tue, 14 Sep 2021 07:31:13 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:1c26:79fe:c0f6:4118:85fb:d7f6])
        by smtp.gmail.com with ESMTPSA id p16sm10365073pfw.66.2021.09.14.07.31.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Sep 2021 07:31:12 -0700 (PDT)
From: Srivathsa Dara <srivathsa729.8@gmail.com>
To: jerome.pouiller@silabs.com,
	gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Srivathsa Dara <srivathsa729.8@gmail.com>
Subject: [PATCH] staging: wfx: sta: Fix 'else' coding style warning
Date: Tue, 14 Sep 2021 20:01:06 +0530
Message-Id: <20210914143107.18436-1-srivathsa729.8@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix 'else is not generally useful after a break or return' checkpatch
warning

Signed-off-by: Srivathsa Dara <srivathsa729.8@gmail.com>
---
 drivers/staging/wfx/sta.c | 23 +++++++++++------------
 1 file changed, 11 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/wfx/sta.c b/drivers/staging/wfx/sta.c
index aceb18a1f54b..23c0425e3929 100644
--- a/drivers/staging/wfx/sta.c
+++ b/drivers/staging/wfx/sta.c
@@ -169,19 +169,18 @@ static int wfx_get_ps_timeout(struct wfx_vif *wvif, bool *enable_ps)
 			if (wvif->vif->bss_conf.assoc && wvif->vif->bss_conf.ps)
 				dev_info(wvif->wdev->dev, "ignoring requested PS mode");
 			return -1;
-		} else {
-			/* It is necessary to enable PS if channels
-			 * are different.
-			 */
-			if (enable_ps)
-				*enable_ps = true;
-			if (wvif->wdev->force_ps_timeout > -1)
-				return wvif->wdev->force_ps_timeout;
-			else if (wfx_api_older_than(wvif->wdev, 3, 2))
-				return 0;
-			else
-				return 30;
 		}
+		/* It is necessary to enable PS if channels
+		 * are different.
+		 */
+		if (enable_ps)
+			*enable_ps = true;
+		if (wvif->wdev->force_ps_timeout > -1)
+			return wvif->wdev->force_ps_timeout;
+		else if (wfx_api_older_than(wvif->wdev, 3, 2))
+			return 0;
+		else
+			return 30;
 	}
 	if (enable_ps)
 		*enable_ps = wvif->vif->bss_conf.ps;
-- 
2.25.1

