Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B7296D0E
	for <linux-staging@lists.linux.dev>; Wed,  7 Apr 2021 06:44:07 +0000 (UTC)
Received: by mail-pg1-f177.google.com with SMTP id l76so12263111pga.6
        for <linux-staging@lists.linux.dev>; Tue, 06 Apr 2021 23:44:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=JESl8F7HZRw0LoSc8TBdM56g5Q/RrwjjChVRu++BC7M=;
        b=pIeW7733ZNniiFIlG+mz0goVz0YILC2Er9C5Kut4+DkulhA/X+gIrSoG3evHTxVokF
         pcUIKMTiw0pXAkteWkRJ7yeZ0Nwsb4ZNCGUVj94/+ohk6f2TP35et6CAw6vp4Z9UfCCE
         97nGNlFpim7JyIHyz3r2ERQVLFLLvudS/AGNEe9YY3mVHRSQ6y28z+9v1Jz+bM6LNRgU
         nHd36/plfVjrJHzzeYHerr2UrNmq8/cO22oSJOkxy7rvHvRX7x/89skw+L7hDvkFctxq
         MYYfL2dLtEAjcNijKHLxcLBraaTyiVhCTladZ2CfxDO8cso7Q4/c3xXBX7f+GyZm2U1a
         vWKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=JESl8F7HZRw0LoSc8TBdM56g5Q/RrwjjChVRu++BC7M=;
        b=nHioJOiEv8lVckBuygLxHXMNKT8XG3JNlRTYQ0vUuCkJ4pk/Mw6MfosGT8XtbucQM9
         8dQTp3VmkUhDG8ru0/GqAwt2X5wWo9dj2hgu7wH845+/Q/VjQFdFGK6F68sHXNf4yPEf
         KnrZ+IWP+IJaM2iSQWnlrxCB6EH67gs8cOb3XncNInkB9Rl9r0xEcj7ZGCVudFXXTa+q
         TaPChQbpVZV+VwywhvnpN51+XYhZuKDgz+rSJDAjAGpOgfOtpplqTN2Bkcun8LGh75sY
         pMCL2dQnrRmnEDjs9f0gyyGd9L38qPyoGTmP2MUyhwil+HtLaPeTDnJhFv3D6tCh89Li
         vhzQ==
X-Gm-Message-State: AOAM531wJxrN3A6sI+gRQiroQ6J8CQ+qZhUpFhiXxqqnNQ4UNMc1Es+P
	ANfKmpnPBTgop+xGdalwTBc=
X-Google-Smtp-Source: ABdhPJyOtpgRhE/HbBiaHc+S7qKnzFbedlYfn3+0kIirv2faj+coYPXBXXmjEEtZxcdNqmo5b2P4PA==
X-Received: by 2002:a63:5466:: with SMTP id e38mr1939318pgm.172.1617777846646;
        Tue, 06 Apr 2021 23:44:06 -0700 (PDT)
Received: from localhost.localdomain ([134.173.248.5])
        by smtp.gmail.com with ESMTPSA id y2sm20296657pgp.2.2021.04.06.23.44.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Apr 2021 23:44:06 -0700 (PDT)
Date: Tue, 6 Apr 2021 23:44:04 -0700
From: Pavle Rohalj <pavle.rohalj@gmail.com>
To: sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v2 30/49] staging: sm750fb: Rename function
 sm750_hw_cursor_setPos to snake case
Message-ID: <64e2d34d1aada4b5ea77afa11019422f3fcb7229.1617776878.git.pavle.rohalj@gmail.com>
References: <cover.1617776878.git.pavle.rohalj@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1617776878.git.pavle.rohalj@gmail.com>

Fix "Avoid CamelCase" checkpatch.pl checks for the function
sm750_hw_cursor_set_pos.

Signed-off-by: Pavle Rohalj <pavle.rohalj@gmail.com>
---
 drivers/staging/sm750fb/sm750.c        | 2 +-
 drivers/staging/sm750fb/sm750_cursor.c | 2 +-
 drivers/staging/sm750fb/sm750_cursor.h | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index eeba12f4b267..b76d3d40969a 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -125,7 +125,7 @@ static int lynxfb_ops_cursor(struct fb_info *info, struct fb_cursor *fbcursor)
 					fbcursor->image.height);
 
 	if (fbcursor->set & FB_CUR_SETPOS)
-		sm750_hw_cursor_setPos(cursor,
+		sm750_hw_cursor_set_pos(cursor,
 				       fbcursor->image.dx - info->var.xoffset,
 				       fbcursor->image.dy - info->var.yoffset);
 
diff --git a/drivers/staging/sm750fb/sm750_cursor.c b/drivers/staging/sm750fb/sm750_cursor.c
index d5ef40b8bc8e..0ba80e086415 100644
--- a/drivers/staging/sm750fb/sm750_cursor.c
+++ b/drivers/staging/sm750fb/sm750_cursor.c
@@ -64,7 +64,7 @@ void sm750_hw_cursor_set_size(struct lynx_cursor *cursor, int w, int h)
 	cursor->h = h;
 }
 
-void sm750_hw_cursor_setPos(struct lynx_cursor *cursor, int x, int y)
+void sm750_hw_cursor_set_pos(struct lynx_cursor *cursor, int x, int y)
 {
 	u32 reg;
 
diff --git a/drivers/staging/sm750fb/sm750_cursor.h b/drivers/staging/sm750fb/sm750_cursor.h
index edeed2ea4b04..d0ade8e366f4 100644
--- a/drivers/staging/sm750fb/sm750_cursor.h
+++ b/drivers/staging/sm750fb/sm750_cursor.h
@@ -6,7 +6,7 @@
 void sm750_hw_cursor_enable(struct lynx_cursor *cursor);
 void sm750_hw_cursor_disable(struct lynx_cursor *cursor);
 void sm750_hw_cursor_set_size(struct lynx_cursor *cursor, int w, int h);
-void sm750_hw_cursor_setPos(struct lynx_cursor *cursor, int x, int y);
+void sm750_hw_cursor_set_pos(struct lynx_cursor *cursor, int x, int y);
 void sm750_hw_cursor_setColor(struct lynx_cursor *cursor, u32 fg, u32 bg);
 void sm750_hw_cursor_setData(struct lynx_cursor *cursor, u16 rop,
 			     const u8 *data, const u8 *mask);
-- 
2.30.2

