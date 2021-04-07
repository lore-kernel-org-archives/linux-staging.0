Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C18C86D0E
	for <linux-staging@lists.linux.dev>; Wed,  7 Apr 2021 06:44:21 +0000 (UTC)
Received: by mail-pj1-f43.google.com with SMTP id x21-20020a17090a5315b029012c4a622e4aso774284pjh.2
        for <linux-staging@lists.linux.dev>; Tue, 06 Apr 2021 23:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Ghbx7FFI/xOaeHs+49tMcMS7V7bwU5Z4Exh4f7xVL44=;
        b=ZHdV5aLw9zBBixfk7lns3j+uLp+fE+jfpBzCQ7bZd5CYr2EuneKFIuLHqTifVnaucL
         zGdPcDW+nNelVgeqB7W8oUdMFsYRpxCrBkIOM8VgAaFX5CXzWK68BSVrTEKrts7X1Yd/
         EamanSujTxwKs4BQr5XQv69wV+v6gstaNlTCKO4E0G/a86co5dtRz0ZCS+1J0V/v6VDi
         YqQwY0uVAAbtBURfKhkp0yl0fE/7M8It5+XQi0t1fWA6q50lvULYRLfdzxIbEU/bX12V
         QyZMUMJNXFT8i5Dztf04m48S8EeXSE9mQCvAp2KUuNguhx5kjLdP0ltHdpMdn7QZSLGZ
         RqzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Ghbx7FFI/xOaeHs+49tMcMS7V7bwU5Z4Exh4f7xVL44=;
        b=HU7jF/b5mn1GAxgIa5fWLR0bgQnDW4viMy0Gto9JMg5fDpuAKB/UAQ97U8A4Q1TBaT
         yeTM/Qvqjs1BZZeMOHDB3pFnA98CoptI+LWnK1bpBNj6i3BRc7Tx6+yQBGb0G988USfL
         D2Kc4VYSMjzCuXgbv4ePeyEMtV5xpxTu7g3o2NO4arpNmoB5pFu4MYbWIchexBqPtyxh
         wbd9yvrV8sozlYHiyNMcYvnr6OT7v2GdExZcvIlT1vKDsUNQDV2MAfca+Tdp6Wi1z6ev
         jZ42Lf2JLhVss5qIGhhXuYaU2Wf0G9XrfwlGdqILc+tl2kiCkl242WwGBg0w2LrSaaY7
         pFUA==
X-Gm-Message-State: AOAM533S24KPnCklPPmvvTQv8fmtpw+J5CKYFa3RvojEmqkzcbIS1cxO
	vMHBU3ZJBa0eBHUdmhC1oeI=
X-Google-Smtp-Source: ABdhPJwMUnBvkzFOlvRo36+9JXfDTHckBHyQhlezB7Mo3oGKjr3aI+4SImJApI+xreybVO67UNt6lA==
X-Received: by 2002:a17:90a:94cc:: with SMTP id j12mr1936031pjw.159.1617777861339;
        Tue, 06 Apr 2021 23:44:21 -0700 (PDT)
Received: from localhost.localdomain ([134.173.248.5])
        by smtp.gmail.com with ESMTPSA id x18sm3809410pfi.105.2021.04.06.23.44.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Apr 2021 23:44:20 -0700 (PDT)
Date: Tue, 6 Apr 2021 23:44:18 -0700
From: Pavle Rohalj <pavle.rohalj@gmail.com>
To: sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v2 31/49] staging: sm750fb: Rename function
 sm750_hw_cursor_setColor to snake case
Message-ID: <453d3058e041eb99492ea0bc85956ecf8cc47129.1617776878.git.pavle.rohalj@gmail.com>
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
sm750_hw_cursor_set_color.

Signed-off-by: Pavle Rohalj <pavle.rohalj@gmail.com>
---
 drivers/staging/sm750fb/sm750.c        | 2 +-
 drivers/staging/sm750fb/sm750_cursor.c | 2 +-
 drivers/staging/sm750fb/sm750_cursor.h | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index b76d3d40969a..d93884f9da7f 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -141,7 +141,7 @@ static int lynxfb_ops_cursor(struct fb_info *info, struct fb_cursor *fbcursor)
 		     ((info->cmap.green[fbcursor->image.bg_color] & 0xfc00) >> 5) |
 		     ((info->cmap.blue[fbcursor->image.bg_color] & 0xf800) >> 11);
 
-		sm750_hw_cursor_setColor(cursor, fg, bg);
+		sm750_hw_cursor_set_color(cursor, fg, bg);
 	}
 
 	if (fbcursor->set & (FB_CUR_SETSHAPE | FB_CUR_SETIMAGE)) {
diff --git a/drivers/staging/sm750fb/sm750_cursor.c b/drivers/staging/sm750fb/sm750_cursor.c
index 0ba80e086415..ac83ead1c5bc 100644
--- a/drivers/staging/sm750fb/sm750_cursor.c
+++ b/drivers/staging/sm750fb/sm750_cursor.c
@@ -73,7 +73,7 @@ void sm750_hw_cursor_set_pos(struct lynx_cursor *cursor, int x, int y)
 	poke32(HWC_LOCATION, reg);
 }
 
-void sm750_hw_cursor_setColor(struct lynx_cursor *cursor, u32 fg, u32 bg)
+void sm750_hw_cursor_set_color(struct lynx_cursor *cursor, u32 fg, u32 bg)
 {
 	u32 reg = (fg << HWC_COLOR_12_2_RGB565_SHIFT) &
 		HWC_COLOR_12_2_RGB565_MASK;
diff --git a/drivers/staging/sm750fb/sm750_cursor.h b/drivers/staging/sm750fb/sm750_cursor.h
index d0ade8e366f4..edfa6a8202cd 100644
--- a/drivers/staging/sm750fb/sm750_cursor.h
+++ b/drivers/staging/sm750fb/sm750_cursor.h
@@ -7,7 +7,7 @@ void sm750_hw_cursor_enable(struct lynx_cursor *cursor);
 void sm750_hw_cursor_disable(struct lynx_cursor *cursor);
 void sm750_hw_cursor_set_size(struct lynx_cursor *cursor, int w, int h);
 void sm750_hw_cursor_set_pos(struct lynx_cursor *cursor, int x, int y);
-void sm750_hw_cursor_setColor(struct lynx_cursor *cursor, u32 fg, u32 bg);
+void sm750_hw_cursor_set_color(struct lynx_cursor *cursor, u32 fg, u32 bg);
 void sm750_hw_cursor_setData(struct lynx_cursor *cursor, u16 rop,
 			     const u8 *data, const u8 *mask);
 void sm750_hw_cursor_setData2(struct lynx_cursor *cursor, u16 rop,
-- 
2.30.2

