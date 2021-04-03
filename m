Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FF835F
	for <linux-staging@lists.linux.dev>; Sat,  3 Apr 2021 18:09:09 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id w28so11726937lfn.2
        for <linux-staging@lists.linux.dev>; Sat, 03 Apr 2021 11:09:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=t734qKFGEnK5lkG+XHQ0j+jWOw9AOKU33SnUXzxrOfc=;
        b=mumJUhAKfW3EP3MOaJUdPWSFLHx0uAxrQz96weLn6d2EfT3wYFUbF4Mn0mM/0xcC+K
         m9x4U39GnJla0U/tzOs6f6hhPJa0aAu3sugMwgDpv7YhrHeqkp1TDGvs0nCqJ5FfjBDp
         OIwQZsFS+pkHg5qSf0zKu4AQSOUmraiMoE7tWcUjCqSBBdwzNsuaK3aj0MvflwMECIbH
         2pP85gEuB0QVNekDuJ7e1GnrV30wLrTRFR8ip3NlTjUwAFdBBjfDOHIYzNCdEVWFcIIU
         3scQmAp5A9m/h+AwN4a2w6U8Egc0AZWftrMjmRutK0xySgxZFC1qsgaOOKFrk2g23i8j
         GLCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=t734qKFGEnK5lkG+XHQ0j+jWOw9AOKU33SnUXzxrOfc=;
        b=k8lPv61af5k4mYGg4I3cH7eacm3zQWNlqaBWTDAHQnOLGmE7V/bUIOk6GzYo2Kdzal
         BCuIiIHigwWYopolZ9Uoca5eqqkCOQeOx/BBUqiuoy7C+7lE9OctjaG7vzGVuc8cglyI
         736ec/cJFLbqT5gzm8r4HTrPLbjpEoHpNMD3Syb3jCVx8Dx6OklnboCZKtmSmT/5B86X
         wEU0mhYWqBAwWfSQW/MBBJKsPRn36zNeRX+yLJ01c8Mp8RIKZ6aCxtEMnA+2qLP+ybjw
         DqkJbo/4JFb6IDI1NB4DWcW8xw49xvZ8q4qUQ8D5V5KWXus92BiI2OZr9UHv9eV0W1l3
         lZqA==
X-Gm-Message-State: AOAM532nPEFisRekvPKSfykJ51vwJRVGgDtOSK7MeaVST2W2pIkZ61fI
	nTBkj1KLrbwPk7cdFX2s4cF47vZgxQ6tOYVM
X-Google-Smtp-Source: ABdhPJyDlbd9fyIJLSZJFUjYG3XWJAT2ng0brqoSAVUhOnopJBJcD0EcH5sIK8CfC/t8QS82TNjWkg==
X-Received: by 2002:ac2:47e5:: with SMTP id b5mr12410427lfp.476.1617473347482;
        Sat, 03 Apr 2021 11:09:07 -0700 (PDT)
Received: from zhans ([37.151.32.231])
        by smtp.gmail.com with ESMTPSA id v20sm1272136ljh.105.2021.04.03.11.09.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Apr 2021 11:09:07 -0700 (PDT)
Date: Sun, 4 Apr 2021 00:09:05 +0600
From: Zhansaya Bagdauletkyzy <zhansayabagdaulet@gmail.com>
To: clabbe@baylibre.com, mchehab@kernel.org, gregkh@linuxfoundation.org
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com
Subject: [PATCH 6/7] staging: media: zoran: Rename 'We' to 'we'
Message-ID: <128bc601bb3787470e0d2599af07766575c6c2a0.1617472411.git.zhansayabagdaulet@gmail.com>
References: <cover.1617472411.git.zhansayabagdaulet@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1617472411.git.zhansayabagdaulet@gmail.com>

Rename variable 'We' to 'we' to eliminate camelcase.
Reported by checkpatch.pl.

Signed-off-by: Zhansaya Bagdauletkyzy <zhansayabagdaulet@gmail.com>
---
 drivers/staging/media/zoran/zoran_device.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/zoran/zoran_device.c b/drivers/staging/media/zoran/zoran_device.c
index 49e0efcc0062..007d8855178e 100644
--- a/drivers/staging/media/zoran/zoran_device.c
+++ b/drivers/staging/media/zoran/zoran_device.c
@@ -295,7 +295,7 @@ static void zr36057_set_vfe(struct zoran *zr, int video_width, int video_height,
 	unsigned int disp_mode;
 	unsigned int vid_win_wid, vid_win_ht;
 	unsigned int hcrop1, hcrop2, vcrop1, vcrop2;
-	unsigned int wa, We, ha, He;
+	unsigned int wa, we, ha, He;
 	unsigned int X, Y, hor_dcm, ver_dcm;
 	u32 reg;
 
@@ -318,10 +318,10 @@ static void zr36057_set_vfe(struct zoran *zr, int video_width, int video_height,
 	/* horizontal */
 	vid_win_wid = video_width;
 	X = DIV_ROUND_UP(vid_win_wid * 64, tvn->wa);
-	We = (vid_win_wid * 64) / X;
+	we = (vid_win_wid * 64) / X;
 	hor_dcm = 64 - X;
-	hcrop1 = 2 * ((tvn->wa - We) / 4);
-	hcrop2 = tvn->wa - We - hcrop1;
+	hcrop1 = 2 * ((tvn->wa - we) / 4);
+	hcrop2 = tvn->wa - we - hcrop1;
 	h_start = tvn->h_start ? tvn->h_start : 1;
 	/* (Ronald) Original comment:
 	 * "| 1 Doesn't have any effect, tested on both a DC10 and a DC10+"
-- 
2.25.1

