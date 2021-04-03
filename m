Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 447576D09
	for <linux-staging@lists.linux.dev>; Sat,  3 Apr 2021 18:09:10 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id b14so11716171lfv.8
        for <linux-staging@lists.linux.dev>; Sat, 03 Apr 2021 11:09:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=iakHsUyxM+lHRQnNUqoKM3RMjlnWm90jWJwLczQ8GBc=;
        b=REKzfIMSxu75FMS0vPW083LBOEofNy1L0DSWLf2a5noReX7W/17BBYn2NrTC0THspE
         uVRT++z4G1WbGhksXMAYh9pfZRKgkXifeWLYrNGgCE79MSjchNSejsM95AizztVWTWlO
         cq8TvFGubvdRS8uwy/ZfOjIMGk0u4KINn/b9ilOX7wLYNkcqXPRXuGoWtGjJtndZWhzr
         xUlsavfgmE6Aa2gQZkmmk3/w/bXXtZ+fVwp4L6nV68jXlyTuvVpwV1OyHX38P7jX/OOe
         XFJNrg6USY2ytR5P84BXIP2W+sOqdPKXqKATR9CizWC6jWP1aLdcbOwQB9nrLpbt14p3
         gbsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=iakHsUyxM+lHRQnNUqoKM3RMjlnWm90jWJwLczQ8GBc=;
        b=nKW86j9pWgqmoSQkQL1c4VXX4hPigTeWWf5zdXckdZ+hO1+Iw0FYh1WvL5K2STLJpy
         DY4a/ZQI0NpzR6aAZ79BXyoHCEnN7DyG54mg1Qsh6mkCv3kh/dk1n4NI5fqDZwiWiwtP
         iSIMxIbnkIAVy4sP55pc3q/pGz7O05MQ0woE0VcnPUChLBC1xGYgXb8ss3o6/MOIJJF1
         jC6CHfjwm3yGiWCunpRp5SgXAfX4NejA5P8E11aXvQS/mJ/bmEkUie6WzNRfwWHCtjEP
         DHAwHBdvhxqs8XtWGB1znEQD5T7P+PyFTFWzrrS8m+cTEnG8V8hLIBhzU/DMMJDVQNoT
         IVAg==
X-Gm-Message-State: AOAM533tIQztuXIwtX7RGNGSb7VT8AjKEpbV/ZedxgZCZLMaRDrTnJJM
	WWRgP4EQvNlh+ivSoyyZVps=
X-Google-Smtp-Source: ABdhPJxGKURadwPZE/A9QsTdOLUm5Sj8YjsPuCUpvktkrQE6uZl+lC0Io13dd5dN+A2uyhQs0zjbbg==
X-Received: by 2002:a19:501b:: with SMTP id e27mr12726473lfb.584.1617473348592;
        Sat, 03 Apr 2021 11:09:08 -0700 (PDT)
Received: from zhans ([37.151.32.231])
        by smtp.gmail.com with ESMTPSA id b28sm1204452lfo.219.2021.04.03.11.09.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Apr 2021 11:09:08 -0700 (PDT)
Date: Sun, 4 Apr 2021 00:09:07 +0600
From: Zhansaya Bagdauletkyzy <zhansayabagdaulet@gmail.com>
To: clabbe@baylibre.com, mchehab@kernel.org, gregkh@linuxfoundation.org
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com
Subject: [PATCH 7/7] staging: media: zoran: Rename 'He' to 'he'
Message-ID: <9982cf0d54cb0677519aa7f14d931fba65e023d3.1617472411.git.zhansayabagdaulet@gmail.com>
References: <cover.1617472411.git.zhansayabagdaulet@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1617472411.git.zhansayabagdaulet@gmail.com>

Rename variable 'He' to 'he' to eliminate camelcase.
Reported by checkpatch.pl.

Signed-off-by: Zhansaya Bagdauletkyzy <zhansayabagdaulet@gmail.com>
---
 drivers/staging/media/zoran/zoran_device.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/zoran/zoran_device.c b/drivers/staging/media/zoran/zoran_device.c
index 007d8855178e..cf788d9cd1df 100644
--- a/drivers/staging/media/zoran/zoran_device.c
+++ b/drivers/staging/media/zoran/zoran_device.c
@@ -295,7 +295,7 @@ static void zr36057_set_vfe(struct zoran *zr, int video_width, int video_height,
 	unsigned int disp_mode;
 	unsigned int vid_win_wid, vid_win_ht;
 	unsigned int hcrop1, hcrop2, vcrop1, vcrop2;
-	unsigned int wa, we, ha, He;
+	unsigned int wa, we, ha, he;
 	unsigned int X, Y, hor_dcm, ver_dcm;
 	u32 reg;
 
@@ -344,10 +344,10 @@ static void zr36057_set_vfe(struct zoran *zr, int video_width, int video_height,
 	disp_mode = !(video_height > BUZ_MAX_HEIGHT / 2);
 	vid_win_ht = disp_mode ? video_height : video_height / 2;
 	Y = DIV_ROUND_UP(vid_win_ht * 64 * 2, tvn->ha);
-	He = (vid_win_ht * 64) / Y;
+	he = (vid_win_ht * 64) / Y;
 	ver_dcm = 64 - Y;
-	vcrop1 = (tvn->ha / 2 - He) / 2;
-	vcrop2 = tvn->ha / 2 - He - vcrop1;
+	vcrop1 = (tvn->ha / 2 - he) / 2;
+	vcrop2 = tvn->ha / 2 - he - vcrop1;
 	v_start = tvn->v_start;
 	v_end = v_start + tvn->ha / 2;	// - 1; FIXME SnapShot times out with -1 in 768*576 on the DC10 - LP
 	v_start += vcrop1;
-- 
2.25.1

