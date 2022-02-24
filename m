Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 427C51386
	for <linux-staging@lists.linux.dev>; Thu, 24 Feb 2022 06:41:02 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id q1so889306plx.4
        for <linux-staging@lists.linux.dev>; Wed, 23 Feb 2022 22:41:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ElvpxC59AC+5EE0hm9laYqztd/rBe9KXtd2sk3NCuYA=;
        b=IZqeiiWnye2HrgzIsdHmNw0Rleg0bMGKe/vKXS+rqKaM5kU79Q7U6QvSXTCD4PI9aX
         zZXjFrvQNblcYzSbbyIGCUBRJ+YPXppnvtoDORH8HE4nhJqjUQJyTS1iMpZVUP4P0ElX
         Hoew6Ad2kXyIZNpkcf5oMA2CV3+KhX9nrFa7gmg9jBRGV8bvIIzCG/O2ZUwBMLF3bBh0
         0Aby2+ZiSyHpPPjCgxOrgp8XLSD6VBLbbHYpWxaT0sci4bKk8bOfdh3Z6VxSaOs45wj8
         odLhD5gmhsXXPvACvDyrLLawabmTBKgFx/fRGhpf4pQTgZDWxOzpCz8a4UMQ6tvcihVc
         5+nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ElvpxC59AC+5EE0hm9laYqztd/rBe9KXtd2sk3NCuYA=;
        b=VTVOb3aB3lVUHzy5DQ5Fral58UUUXPiX+sqG1NWvTr0N1eZFZHPBIyM+ujIMNKY9hg
         gsLeY4+wK+mdlsdeaGXxtnAPpOf+QA4RqZJ14iHhLeD86mSMQLQ4DNe2VNJB0z/knrx+
         J11tQIj7QcfE6mTgDw9pSXFrrh3MNxjjKOhxxATVo4niZy7ECFEd16Py7ICXq0htAvxK
         CNmOVhr9Lprq802yBOEMJ/bVokOx666a1xv2Wp7sbyv2IX6EtbH/DllgvuiHSzwEcUf4
         J1QKgjysn3z9k4yM+hS6QGYc+tS7QSUFwHrfg/OUIbwoZcMaQ9EqjqUlTXttrZEfzIP5
         f23A==
X-Gm-Message-State: AOAM532iooSFsi1RrJiwNVyuqCnieewqVOKFU1vyojoQwoQIxw8E87mm
	oIkLJpRYnzZWuWI1JZL+pSY=
X-Google-Smtp-Source: ABdhPJwzsITH29U7YX+Ztw1B5zJQVIHuORmzkcointo7qkrUm5hzfrx49+I9VnSprMuI7GBbF1S+cA==
X-Received: by 2002:a17:902:f681:b0:14f:d22a:d71d with SMTP id l1-20020a170902f68100b0014fd22ad71dmr1178730plg.96.1645684861583;
        Wed, 23 Feb 2022 22:41:01 -0800 (PST)
Received: from tong-desktop.local ([2600:1700:3ec7:421f:47fe:f358:be6:4577])
        by smtp.googlemail.com with ESMTPSA id j12sm1729109pfu.79.2022.02.23.22.41.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Feb 2022 22:41:01 -0800 (PST)
From: Tong Zhang <ztong0001@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Tong Zhang <ztong0001@gmail.com>,
	Kees Cook <keescook@chromium.org>,
	Shaokun Zhang <zhangshaokun@hisilicon.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: dan.carpenter@oracle.com
Subject: [PATCH v2 2/3] staging: rtl8192u: add empty debug functions
Date: Wed, 23 Feb 2022 22:40:30 -0800
Message-Id: <20220224064033.1530924-2-ztong0001@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <YhPI5iDRUpzYWDyY@kroah.com>
References: <YhPI5iDRUpzYWDyY@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add two empty functions to handle the case when CONFIG_IEEE80211_DEBUG
is turned off. These two functions will be used by module init() and
and exit().

Signed-off-by: Tong Zhang <ztong0001@gmail.com>
---
 drivers/staging/rtl8192u/ieee80211/ieee80211.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/staging/rtl8192u/ieee80211/ieee80211.h b/drivers/staging/rtl8192u/ieee80211/ieee80211.h
index ab1e380688ee..68c0bf9a191a 100644
--- a/drivers/staging/rtl8192u/ieee80211/ieee80211.h
+++ b/drivers/staging/rtl8192u/ieee80211/ieee80211.h
@@ -2315,8 +2315,13 @@ int ieee80211_wx_get_freq(struct ieee80211_device *ieee,
 			  union iwreq_data *wrqu, char *b);
 
 /* ieee80211_module.c */
+#ifdef CONFIG_IEEE80211_DEBUG
 int ieee80211_debug_init(void);
 void ieee80211_debug_exit(void);
+#else
+static inline int ieee80211_debug_init(void) { return 0; }
+static inline void ieee80211_debug_exit(void) { }
+#endif
 
 //extern void ieee80211_wx_sync_scan_wq(struct ieee80211_device *ieee);
 void ieee80211_wx_sync_scan_wq(struct work_struct *work);
-- 
2.25.1

