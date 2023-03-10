Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 209DE848E
	for <linux-staging@lists.linux.dev>; Fri, 10 Mar 2023 21:00:09 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id qa18-20020a17090b4fd200b0023750b675f5so11130717pjb.3
        for <linux-staging@lists.linux.dev>; Fri, 10 Mar 2023 13:00:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678482009;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=q6GnZtplQ2eYXRZ7Eqjp8dQFR1RkpD5CGahdpyXeNqY=;
        b=hvvRti159HwG983WAFD9cg/Q+vPgm/A6r1WGbQ3hSy9BVssznTvfGzQxxPivNi4/PK
         GKMcM2X09W0GIb2hcLSCXKBnU+3MuzlubH5ubd0knRWv7Udjqsvshx44kfEvPjPBaD6A
         lK4uNxo3z8N6Fi4hXGsr3K1OHCKMls/GXzS2hzQBAP8yIYiRj2iL6oFXA3YGOftxMqP4
         xn152SkN5FXQombDrGbRLnS8wc2kwB3GWjj5vO+rEV2yRktMSg6pLSimMt3bpHzQvbF9
         K2UIXikCFTT5oEKgE3hrmJ+D4ibh7NkA4cKYeE+DZMLWD09T/K9X89BXFT+Sj//cxNfp
         fZlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678482009;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q6GnZtplQ2eYXRZ7Eqjp8dQFR1RkpD5CGahdpyXeNqY=;
        b=cacD6ks8pGOEasFWK2e/TSTXMtXvL3mEgpErg6qlRY8k2b5UCgz9BZiv8Hi75c2YfH
         EFECXxsRcqRXmDaQMQcBklmikA1Cnb4/cAMOMtc8lJQ7jVaPeHUqoKv3oGJfGJeXvz9j
         8MUiD9B++g7wxRA6sU+e/RflpybGQXoas5Phtb89Ok6xx3x1BNiutzHam+zsRFA3vAFL
         ikKtZke++GocZ3JHJs9qSRxUsFusXxkWo3edLyZQ6k4htvfJOsRWxbIb3WG0robZT4sP
         QMXhyd5CI4Z9s2uHfH84lgci9dzs08O9iceSZrDPje7wnJ2YmmkxktWba9+2+BUw4tiM
         RUIw==
X-Gm-Message-State: AO0yUKXffEp1+9tB0NpxMmX8szPU7smA0EG+frw296lbV7JCsMy6JSY9
	abVGigQLmSMa16wXu7UZxE0=
X-Google-Smtp-Source: AK7set+y6cRpGriOc7P0HPlO2MJiWMLSMne0+BAIS7AohPCLfKcVriitHH8trxbYnblNAoobiAzShA==
X-Received: by 2002:a17:902:7605:b0:19a:f02c:a06d with SMTP id k5-20020a170902760500b0019af02ca06dmr23586110pll.29.1678482009204;
        Fri, 10 Mar 2023 13:00:09 -0800 (PST)
Received: from craechal ([20.230.228.239])
        by smtp.gmail.com with ESMTPSA id la7-20020a170902fa0700b0019f0eb301f6sm375711plb.241.2023.03.10.13.00.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 13:00:08 -0800 (PST)
Received: by craechal (Postfix, from userid 1000)
	id 0D4C57F66; Fri, 10 Mar 2023 21:00:08 +0000 (UTC)
From: Archana <craechal@gmail.com>
To: drv@mailo.com,
	linux-staging@lists.linux.dev,
	gregkh@linuxfoundation.org
Cc: Archana <craechal@gmail.com>
Subject: [PATCH 1/2] staging: wlan-ng: remove unnecessary kfree statements
Date: Fri, 10 Mar 2023 20:59:16 +0000
Message-Id: <20230310205917.2161-1-craechal@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function uses goto free_result in rest of its implementation.

Signed-off-by: Archana <craechal@gmail.com>
---
 drivers/staging/wlan-ng/prism2fw.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/wlan-ng/prism2fw.c b/drivers/staging/wlan-ng/prism2fw.c
index 02a2191d5c4d..98ed9bb9192c 100644
--- a/drivers/staging/wlan-ng/prism2fw.c
+++ b/drivers/staging/wlan-ng/prism2fw.c
@@ -1008,12 +1008,11 @@ static int writeimage(struct wlandevice *wlandev, struct imgchunk *fchunk,
 	rstmsg = kzalloc(sizeof(*rstmsg), GFP_KERNEL);
 	rwrmsg = kzalloc(sizeof(*rwrmsg), GFP_KERNEL);
 	if (!rstmsg || !rwrmsg) {
-		kfree(rstmsg);
-		kfree(rwrmsg);
 		netdev_err(wlandev->netdev,
 			   "%s: no memory for firmware download, aborting download\n",
 			   __func__);
-		return -ENOMEM;
+		result = -ENOMEM;
+		goto free_result;
 	}
 
 	/* Initialize the messages */
-- 
2.34.1

