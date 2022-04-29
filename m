Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E585810EB
	for <linux-staging@lists.linux.dev>; Fri, 29 Apr 2022 08:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1651221805;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GpZJ4wX7kOe8KNr9fDnXvQai/0Kn9GYbVZ0gMqgfC8g=;
	b=EeHbs3aSCCzObZh/rw56+Wwp5YUjKd3A6Pp8nd+K2QtXOPYVg8HQhZV30SxXzd4vv/GpVL
	nOSMNqLeB+PmX67cc2IeDFiflxbBYbX6js5aoU4L8WP3ndXl6K4g0+S+wcoUYcfDTT/JzT
	2a6VifPaL1DIffw4JiZZi5r4M/cfY4U=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-394-PbXEQqRpPhO2P1fz6fiJyQ-1; Fri, 29 Apr 2022 04:43:24 -0400
X-MC-Unique: PbXEQqRpPhO2P1fz6fiJyQ-1
Received: by mail-wr1-f70.google.com with SMTP id p10-20020adfaa0a000000b0020c4829af5fso568647wrd.16
        for <linux-staging@lists.linux.dev>; Fri, 29 Apr 2022 01:43:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GpZJ4wX7kOe8KNr9fDnXvQai/0Kn9GYbVZ0gMqgfC8g=;
        b=1Rl0rwzIHw5uDGOVn88FFy+biCnji1O4vcua6V/Il1VfhY4SxNX/W12EV8792fVANz
         OFBGDrxgLXbI8bSKdA7NQ6SDrQLa8mWa/Q+dBasj8VLHzcv3vUvM6CK7KYXE8auGPsQ1
         mGfWOea7f4wr5pQcwTVjxOgPpWQO7ZEibm648KcfWyC9z851/hDgiNBr3MuHsqxyMs6h
         LWVHPGoDlfBMXgqipbTGRYoex7d3Eqh2kWaWYt9BWHjJqzmowItM93iYW/OJLjfK+ROl
         YQsvctK7CLf+8SK7NzOvz2QydiLfNybbdCSv2hFBPCTCHwP/YKUcfSA+9aqcxlmTK7fD
         HCuA==
X-Gm-Message-State: AOAM532OnU+6oZc24DdiDd5qdCMjUL6yfppuW7uLBoi9PraSd9bzljQJ
	D2UcqeeiPvt+XpT3qmG7CttovbXmhghoWP40g3qUynbR/Ub9ZwIUlH6CfkPsEQpg6mwakvdRhHl
	Um+oTF8kVlZe1HgVq4tcSM+b+WQ==
X-Received: by 2002:a05:600c:4ec6:b0:394:1f35:4c69 with SMTP id g6-20020a05600c4ec600b003941f354c69mr1752563wmq.61.1651221802216;
        Fri, 29 Apr 2022 01:43:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwhmIBm7Rgju2BXAxf7jfHuCnxn2Uoy7l4mQ/iKVv2qM/3Q7Bt+zoSMdfHM0/61ANAlGkIsNA==
X-Received: by 2002:a05:600c:4ec6:b0:394:1f35:4c69 with SMTP id g6-20020a05600c4ec600b003941f354c69mr1752548wmq.61.1651221802012;
        Fri, 29 Apr 2022 01:43:22 -0700 (PDT)
Received: from minerva.home ([92.176.231.205])
        by smtp.gmail.com with ESMTPSA id f7-20020a05600c4e8700b00393f1393abfsm7199256wmq.41.2022.04.29.01.43.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Apr 2022 01:43:21 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org,
	Daniel Vetter <daniel.vetter@ffwll.ch>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	kernel test robot <lkp@intel.com>,
	Jens Frederich <jfrederich@gmail.com>,
	Jon Nettleton <jon.nettleton@gmail.com>,
	linux-staging@lists.linux.dev,
	Daniel Vetter <daniel.vetter@intel.com>,
	Javier Martinez Canillas <javierm@redhat.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Helge Deller <deller@gmx.de>,
	Matthew Wilcox <willy@infradead.org>,
	Sam Ravnborg <sam@ravnborg.org>,
	Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
	Zhen Lei <thunder.leizhen@huawei.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	Xiyu Yang <xiyuyang19@fudan.edu.cn>,
	linux-fbdev@vger.kernel.org,
	Zheyu Ma <zheyuma97@gmail.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Changcheng Deng <deng.changcheng@zte.com.cn>
Subject: [RFC PATCH v4 11/11] fbdev: Make registered_fb[] private to fbmem.c
Date: Fri, 29 Apr 2022 10:42:53 +0200
Message-Id: <20220429084253.1085911-12-javierm@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220429084253.1085911-1-javierm@redhat.com>
References: <20220429084253.1085911-1-javierm@redhat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

From: Daniel Vetter <daniel.vetter@ffwll.ch>

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
Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
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
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

(no changes since v1)

 drivers/video/fbdev/core/fbmem.c | 8 ++++++--
 include/linux/fb.h               | 7 +++----
 2 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
index 7583296481b0..1ce5b0f3abd4 100644
--- a/drivers/video/fbdev/core/fbmem.c
+++ b/drivers/video/fbdev/core/fbmem.c
@@ -50,10 +50,14 @@
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
index b781bc721113..208bca693b33 100644
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
2.35.1

