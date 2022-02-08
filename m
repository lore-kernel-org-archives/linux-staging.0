Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3113D2C80
	for <linux-staging@lists.linux.dev>; Tue,  8 Feb 2022 21:09:00 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id v12so616734wrv.2
        for <linux-staging@lists.linux.dev>; Tue, 08 Feb 2022 13:09:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4RkUIVbtXWLMhEgVRprjRhLI7qLO2cMyCi+EhjvzZFw=;
        b=hTk5ijDHDMgQxKkA9BUrH0F2len3i2uKxb473Xdpw5iK2wSxC9XmwvSbp7bYW0PLPk
         QbKh5k1BSr/Tz0jA06DfQZya1UO90srY53nLsu9F38wakMDiTM36Bhv99fd2QZrbuYGF
         DdQESgBxjgKfPc9w3F9JFaETCMViCRldl1gyk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4RkUIVbtXWLMhEgVRprjRhLI7qLO2cMyCi+EhjvzZFw=;
        b=ec7098CNhtX2G0V4xIYrDNZzaZiC7cAaO4//p+fFTtpWCR+X7xt6yiY8MJq+GVTBSH
         YdMLI8yTxhdWKfcNs9xInJR1CsODAAJDsoNaQK0LaEwGROQ5wBSRW5YOe5v5HdX2AgyP
         jIe4E+rqSzfk4m80hsFXlw2RUIjZzqZtDz7d8sZ4yDLs9QiBVkihn9AUYXXoxCeZiAHq
         oNYDZV8SgYy5fXw1YLjqZKE7X0yO7Juvq+w/jL5oI6uKJ4GPfTS/1STk4YK5DVKiNAUx
         lHO1b+y/yKscUg5fetAry5UhbfoIRIStjb2jt8giBVOH7bdbO5Ymv9R0CsSTXrewweg+
         y9Pw==
X-Gm-Message-State: AOAM533SjquFprpiRLd54smNR+SaDUnn1oGjsfvj8PLtJWcRCJbzyliJ
	PoYzVBZp+vL9cdwWaPid5d9bxQ==
X-Google-Smtp-Source: ABdhPJyIfpRc7ZB9NjqbdIphlUwlwXNT2L6vdvwdr3OEGArxXf4a6YivXer2aDFvbp3CRI9pZL06XA==
X-Received: by 2002:a5d:47af:: with SMTP id 15mr5049471wrb.88.1644354538519;
        Tue, 08 Feb 2022 13:08:58 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id o14sm3033561wmr.3.2022.02.08.13.08.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Feb 2022 13:08:58 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
	linux-fbdev@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>,
	Daniel Vetter <daniel.vetter@ffwll.ch>,
	kernel test robot <lkp@intel.com>,
	Jens Frederich <jfrederich@gmail.com>,
	Jon Nettleton <jon.nettleton@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	Daniel Vetter <daniel.vetter@intel.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Helge Deller <deller@gmx.de>,
	Matthew Wilcox <willy@infradead.org>,
	Sam Ravnborg <sam@ravnborg.org>,
	Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
	Zhen Lei <thunder.leizhen@huawei.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	Xiyu Yang <xiyuyang19@fudan.edu.cn>,
	Zheyu Ma <zheyuma97@gmail.com>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH v2 19/19] fbdev: Make registered_fb[] private to fbmem.c
Date: Tue,  8 Feb 2022 22:08:24 +0100
Message-Id: <20220208210824.2238981-20-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220208210824.2238981-1-daniel.vetter@ffwll.ch>
References: <20220208210824.2238981-1-daniel.vetter@ffwll.ch>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Well except when the olpc dcon fbdev driver is enabled, that thing
digs around in there in rather unfixable ways.

Cc oldc_dcon maintainers as fyi.

v2: I typoed the config name (0day)

Cc: kernel test robot <lkp@intel.com>
Cc: Jens Frederich <jfrederich@gmail.com>
Cc: Jon Nettleton <jon.nettleton@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Helge Deller <deller@gmx.de>
Cc: Matthew Wilcox <willy@infradead.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Cc: Zhen Lei <thunder.leizhen@huawei.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Xiyu Yang <xiyuyang19@fudan.edu.cn>
Cc: linux-fbdev@vger.kernel.org
Cc: Zheyu Ma <zheyuma97@gmail.com>
Cc: Guenter Roeck <linux@roeck-us.net>
---
 drivers/video/fbdev/core/fbmem.c | 8 ++++++--
 include/linux/fb.h               | 7 +++----
 2 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
index 6f6f7a763969..6f0eb596a2cd 100644
--- a/drivers/video/fbdev/core/fbmem.c
+++ b/drivers/video/fbdev/core/fbmem.c
@@ -49,10 +49,14 @@
 static DEFINE_MUTEX(registration_lock);
 
 struct fb_info *registered_fb[FB_MAX] __read_mostly;
-EXPORT_SYMBOL(registered_fb);
-
 int num_registered_fb __read_mostly;
+#if IS_ENABLED(CONFIG_FB_OLPC_DCON)
+EXPORT_SYMBOL(registered_fb);
 EXPORT_SYMBOL(num_registered_fb);
+#endif
+#define for_each_registered_fb(i)		\
+	for (i = 0; i < FB_MAX; i++)		\
+		if (!registered_fb[i]) {} else
 
 bool fb_center_logo __read_mostly;
 
diff --git a/include/linux/fb.h b/include/linux/fb.h
index 23b19cf8bccd..afaa1474a283 100644
--- a/include/linux/fb.h
+++ b/include/linux/fb.h
@@ -623,16 +623,15 @@ extern int fb_get_color_depth(struct fb_var_screeninfo *var,
 extern int fb_get_options(const char *name, char **option);
 extern int fb_new_modelist(struct fb_info *info);
 
+#if IS_ENABLED(CONFIG_FB_OLPC_DCON)
 extern struct fb_info *registered_fb[FB_MAX];
+
 extern int num_registered_fb;
+#endif
 extern bool fb_center_logo;
 extern int fb_logo_count;
 extern struct class *fb_class;
 
-#define for_each_registered_fb(i)		\
-	for (i = 0; i < FB_MAX; i++)		\
-		if (!registered_fb[i]) {} else
-
 static inline void lock_fb_info(struct fb_info *info)
 {
 	mutex_lock(&info->lock);
-- 
2.34.1

