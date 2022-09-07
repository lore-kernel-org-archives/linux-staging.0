Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0789B89D9
	for <linux-staging@lists.linux.dev>; Wed,  7 Sep 2022 22:44:18 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id bj12so33636530ejb.13
        for <linux-staging@lists.linux.dev>; Wed, 07 Sep 2022 15:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=xJNlqeNd/xrr04Dfw5ABivBa4Akc5EG+Lwtk/YFuHVc=;
        b=lYb1dK+7UqpkUWaY+4E2VuAdHXPTP7pVSZx8UVTuB34kgV8YQqPI/sUojy9bPydShz
         ITmZwacH05i14Cec5Dmpe3qdSP4sbZ8yUPQAq/Lpk7biy1rV0kfwyvoaVwCheGe+P/7F
         kcBWwn774jQX9l8q7XzDMq/MstWQiY4a0NZMo0QCjQ1ZLADJcMOSj1OHCmtkNZvGbnMi
         DDe+P3x2Jfj9yqB3L0Q5Fw936CmXeH2/4i/0ojrSUeng25GhDen8lZ8nkZmVtMR06Tg5
         1TtGhI/RefHuKq5MTBciDuWNBZfNT0qE8EWlRdbasdq/NKd/LoKqXeovcjsfgzJrnFEN
         2s8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=xJNlqeNd/xrr04Dfw5ABivBa4Akc5EG+Lwtk/YFuHVc=;
        b=3yUFQEMaf4vrRYFl4pXl+z7PZGrenri9xo+KnJTVe8wxGjU44Lh4HHlY8+bNklTbzJ
         4Mj4I1Wrd4PjlQstXmKZedV068GM3BKsNBGGei6Mc323iS7w9Sn1A89cBqypdqvHC011
         3EtveWuIIMMQk/rD1shGo9c1eWl1RGii+TkkLVEEZnQ+YQaGqfSeDJ9mPbVjXTlRJYRv
         1t1WYvZKFtBXW7YzQi6h0sQLHnsrYFMYtGLPnSfkHXKP74c+GXqgeikhl8oYm8PTt7+S
         xH27J2cPnNB7oCVHgWk6N6sCR5a8NhYLnmkC9t0tLzczSl/edSMBhYpcNQlfclxkfv/S
         qJRQ==
X-Gm-Message-State: ACgBeo0rhDeN9Isw5/yLN9FMUPNqpDm+5Tbt6tXKWglAOOSjCZhs6rYd
	xG6d5xkX/s32tshUcCAvvk4=
X-Google-Smtp-Source: AA6agR4toEulMdoZCpOhHeaqawYckf6oKqbG0HnoiZHRq63ET2WrQq/jt6MxOwlevNSagZbT4yjD+w==
X-Received: by 2002:a17:907:a06b:b0:771:aa05:e108 with SMTP id ia11-20020a170907a06b00b00771aa05e108mr1743919ejc.167.1662590657195;
        Wed, 07 Sep 2022 15:44:17 -0700 (PDT)
Received: from xws.localdomain ([37.120.217.162])
        by smtp.gmail.com with ESMTPSA id x3-20020a170906148300b0073d83f80b05sm384829ejc.94.2022.09.07.15.44.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Sep 2022 15:44:16 -0700 (PDT)
From: Maximilian Luz <luzmaximilian@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Bingbu Cao <bingbu.cao@intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Maximilian Luz <luzmaximilian@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] ipu3-imgu: Fix NULL pointer dereference in imgu_subdev_set_selection()
Date: Thu,  8 Sep 2022 00:44:09 +0200
Message-Id: <20220907224409.3187482-1-luzmaximilian@gmail.com>
X-Mailer: git-send-email 2.37.3
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Calling v4l2_subdev_get_try_crop() and v4l2_subdev_get_try_compose()
with a subdev state of NULL leads to a NULL pointer dereference. This
can currently happen in imgu_subdev_set_selection() when the state
passed in is NULL, as this method first gets pointers to both the "try"
and "active" states and only then decides which to use.

The same issue has been addressed for imgu_subdev_get_selection() with
commit 30d03a0de650 ("ipu3-imgu: Fix NULL pointer dereference in active
selection access"). However the issue still persists in
imgu_subdev_set_selection().

Therefore, apply a similar fix as done in the aforementioned commit to
imgu_subdev_set_selection(). To keep things a bit cleaner, introduce
helper functions for "crop" and "compose" access and use them in both
imgu_subdev_set_selection() and imgu_subdev_get_selection().

Fixes: 0d346d2a6f54 ("media: v4l2-subdev: add subdev-wide state struct")
Cc: stable@vger.kernel.org # for v5.14 and later
Signed-off-by: Maximilian Luz <luzmaximilian@gmail.com>
---
 drivers/staging/media/ipu3/ipu3-v4l2.c | 57 +++++++++++++++-----------
 1 file changed, 34 insertions(+), 23 deletions(-)

diff --git a/drivers/staging/media/ipu3/ipu3-v4l2.c b/drivers/staging/media/ipu3/ipu3-v4l2.c
index ce13e746c15f..e530767e80a5 100644
--- a/drivers/staging/media/ipu3/ipu3-v4l2.c
+++ b/drivers/staging/media/ipu3/ipu3-v4l2.c
@@ -188,6 +188,28 @@ static int imgu_subdev_set_fmt(struct v4l2_subdev *sd,
 	return 0;
 }
 
+static struct v4l2_rect *
+imgu_subdev_get_crop(struct imgu_v4l2_subdev *sd,
+		     struct v4l2_subdev_state *sd_state, unsigned int pad,
+		     enum v4l2_subdev_format_whence which)
+{
+	if (which == V4L2_SUBDEV_FORMAT_TRY)
+		return v4l2_subdev_get_try_crop(&sd->subdev, sd_state, pad);
+	else
+		return &sd->rect.eff;
+}
+
+static struct v4l2_rect *
+imgu_subdev_get_compose(struct imgu_v4l2_subdev *sd,
+			struct v4l2_subdev_state *sd_state, unsigned int pad,
+			enum v4l2_subdev_format_whence which)
+{
+	if (which == V4L2_SUBDEV_FORMAT_TRY)
+		return v4l2_subdev_get_try_compose(&sd->subdev, sd_state, pad);
+	else
+		return &sd->rect.bds;
+}
+
 static int imgu_subdev_get_selection(struct v4l2_subdev *sd,
 				     struct v4l2_subdev_state *sd_state,
 				     struct v4l2_subdev_selection *sel)
@@ -200,18 +222,12 @@ static int imgu_subdev_get_selection(struct v4l2_subdev *sd,
 
 	switch (sel->target) {
 	case V4L2_SEL_TGT_CROP:
-		if (sel->which == V4L2_SUBDEV_FORMAT_TRY)
-			sel->r = *v4l2_subdev_get_try_crop(sd, sd_state,
-							   sel->pad);
-		else
-			sel->r = imgu_sd->rect.eff;
+		sel->r = *imgu_subdev_get_crop(imgu_sd, sd_state, sel->pad,
+					       sel->which);
 		return 0;
 	case V4L2_SEL_TGT_COMPOSE:
-		if (sel->which == V4L2_SUBDEV_FORMAT_TRY)
-			sel->r = *v4l2_subdev_get_try_compose(sd, sd_state,
-							      sel->pad);
-		else
-			sel->r = imgu_sd->rect.bds;
+		sel->r = *imgu_subdev_get_compose(imgu_sd, sd_state, sel->pad,
+						  sel->which);
 		return 0;
 	default:
 		return -EINVAL;
@@ -223,10 +239,9 @@ static int imgu_subdev_set_selection(struct v4l2_subdev *sd,
 				     struct v4l2_subdev_selection *sel)
 {
 	struct imgu_device *imgu = v4l2_get_subdevdata(sd);
-	struct imgu_v4l2_subdev *imgu_sd = container_of(sd,
-							struct imgu_v4l2_subdev,
-							subdev);
-	struct v4l2_rect *rect, *try_sel;
+	struct imgu_v4l2_subdev *imgu_sd =
+		container_of(sd, struct imgu_v4l2_subdev, subdev);
+	struct v4l2_rect *rect;
 
 	dev_dbg(&imgu->pci_dev->dev,
 		 "set subdev %u sel which %u target 0x%4x rect [%ux%u]",
@@ -238,22 +253,18 @@ static int imgu_subdev_set_selection(struct v4l2_subdev *sd,
 
 	switch (sel->target) {
 	case V4L2_SEL_TGT_CROP:
-		try_sel = v4l2_subdev_get_try_crop(sd, sd_state, sel->pad);
-		rect = &imgu_sd->rect.eff;
+		rect = imgu_subdev_get_crop(imgu_sd, sd_state, sel->pad,
+					    sel->which);
 		break;
 	case V4L2_SEL_TGT_COMPOSE:
-		try_sel = v4l2_subdev_get_try_compose(sd, sd_state, sel->pad);
-		rect = &imgu_sd->rect.bds;
+		rect = imgu_subdev_get_compose(imgu_sd, sd_state, sel->pad,
+					       sel->which);
 		break;
 	default:
 		return -EINVAL;
 	}
 
-	if (sel->which == V4L2_SUBDEV_FORMAT_TRY)
-		*try_sel = sel->r;
-	else
-		*rect = sel->r;
-
+	*rect = sel->r;
 	return 0;
 }
 
-- 
2.37.3

