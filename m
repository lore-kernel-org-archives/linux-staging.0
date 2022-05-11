Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2237F17DA
	for <linux-staging@lists.linux.dev>; Wed, 11 May 2022 11:32:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1652268759;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=j9CH2v0YXJ3HjUK6dIstavUpY+IdJA0p7lKZyzF8giE=;
	b=GtLDTV5+AatuiR7tXmJP72woHJO1gThb2L2XgHkwc8Sr7vMqx1AR2VM0+cQC6kF37nq/+N
	TmevNqL8h9bqf8fMw2uVuN/yVsMtTz7cFjLq/Y39ZtcRXqqsNpHI87Hdv6vQa6nKLqGofc
	l37oMSIN9bCpu7GpnP2qYrncachR85o=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-607-Nr7TvOzYP9ibfsu5yHA7iQ-1; Wed, 11 May 2022 07:32:36 -0400
X-MC-Unique: Nr7TvOzYP9ibfsu5yHA7iQ-1
Received: by mail-wr1-f69.google.com with SMTP id k29-20020adfb35d000000b0020adc94662dso729215wrd.12
        for <linux-staging@lists.linux.dev>; Wed, 11 May 2022 04:32:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=j9CH2v0YXJ3HjUK6dIstavUpY+IdJA0p7lKZyzF8giE=;
        b=Vlab2aeC/b6ynr7xU139kzmNnwiqWwcRTTmOcrawQ3g0FZXxYR1lwf3oICx6CoLEZB
         6nieDba3PubBC9aC916I9pkwTFoGj3/kyv0p6r3SHCxlRJU08sKY6oYXhtDtuaqwObbF
         qyUJwDG/bTy/IUe2ltkgSZlj1ns3B5Wx6o4qKsWFraEOQeLegsJn8IpavZLadn0e7OZE
         VI9yDdHlZmLixBxY6m+pHr9vpcvjGLUuPVEm8LNRQtr0tySAutQIJ4gC4BzNetNg6CUJ
         krFcmuFgvtGwY1jB591/C+n+3LNs5fi6Gli/HjlC4H/O+Q/+AVWLzmQqtQ4jobUQGcr2
         Yd2A==
X-Gm-Message-State: AOAM53145o1rnLOrLPICmt4d2fAf8GdaqnEdc3PKcLWBaXW+eRu5yWRC
	TfXWyT7aI2zk0lB2gvvvVwUlmv+VO6GHYIxq7GMaOjGBxexkflnRBjvdR4MEtLSRL5ifIv322dA
	bx3wPdyNlEPK0OSct3QxvgM7G8g==
X-Received: by 2002:adf:f747:0:b0:20a:d30a:5f08 with SMTP id z7-20020adff747000000b0020ad30a5f08mr22334006wrp.278.1652268755751;
        Wed, 11 May 2022 04:32:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwgrtdXH49XbKTYGY6jvwa/LsalnhjTRPZOQcdgbrMeYtoBsK3sJMoM3gRNyeWCwdLsXBrWuA==
X-Received: by 2002:adf:f747:0:b0:20a:d30a:5f08 with SMTP id z7-20020adff747000000b0020ad30a5f08mr22333989wrp.278.1652268755534;
        Wed, 11 May 2022 04:32:35 -0700 (PDT)
Received: from minerva.home (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id bd6-20020a05600c1f0600b00394615cf468sm4928533wmb.28.2022.05.11.04.32.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 May 2022 04:32:35 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	Daniel Vetter <daniel.vetter@ffwll.ch>,
	Javier Martinez Canillas <javierm@redhat.com>,
	Helge Deller <deller@gmx.de>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	kernel test robot <lkp@intel.com>,
	Jens Frederich <jfrederich@gmail.com>,
	Jon Nettleton <jon.nettleton@gmail.com>,
	linux-staging@lists.linux.dev,
	Daniel Vetter <daniel.vetter@intel.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Matthew Wilcox <willy@infradead.org>,
	Sam Ravnborg <sam@ravnborg.org>,
	Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
	Zhen Lei <thunder.leizhen@huawei.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	Xiyu Yang <xiyuyang19@fudan.edu.cn>,
	Zheyu Ma <zheyuma97@gmail.com>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH v5 7/7] fbdev: Make registered_fb[] private to fbmem.c
Date: Wed, 11 May 2022 13:32:30 +0200
Message-Id: <20220511113230.1252910-1-javierm@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220511112438.1251024-1-javierm@redhat.com>
References: <20220511112438.1251024-1-javierm@redhat.com>
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
index 265efa189bcc..6cab5f4c1fb3 100644
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
index bbe1e4571899..c563e24b6293 100644
--- a/include/linux/fb.h
+++ b/include/linux/fb.h
@@ -632,16 +632,15 @@ extern int fb_get_color_depth(struct fb_var_screeninfo *var,
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

