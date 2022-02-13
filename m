Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDF767A
	for <linux-staging@lists.linux.dev>; Sun, 13 Feb 2022 17:59:47 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id w20so8819841plq.12
        for <linux-staging@lists.linux.dev>; Sun, 13 Feb 2022 09:59:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vIubIh4Wyz3tsOI6MEDUxASpEp1n/qqp0RW8fAkp5Is=;
        b=chKJoCnSwiXQNcGxobfzewsPGvPFqJUpAT2ZrYWsolWYBwA+6W62D22Y8Qlu24bZHX
         X0GZHtgvFuX70WlB6W00XcMg2/naTQ5YfyJh+MguS0Gy69ehw7GO2xes/BzxRQoW/KnI
         /t2z4uazgmAR1VWgRCdLTpaZhFcksnFW1T6yfWfWcGKCYgAeUKxQ+n3pAO5PpL6KidKj
         BxqlFpZ66CJzklIjEFyGZ+Z2b3VKx1sz/Mvg5k6rqkwS5P5yxYpMqxI2+gglsykXcEfd
         GRIYekN5GnniOLY31Oebx59qgR5s9x7hykD6keUccMXY6/IyskYkxJv+d1ufqOpvH2ZZ
         SKFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vIubIh4Wyz3tsOI6MEDUxASpEp1n/qqp0RW8fAkp5Is=;
        b=Wv54Gkc3GaaZB5KI5WYnfNLYdz//HyMTMMi+yt1cNYvXgHcjohTb5jhacnI0Xy9+7M
         gqgxuKLbe9EL6j4Oa4odnSH/jVgMMlnwdoj7n+2kfnYGXCb98zoiP+FIS2fGOeDsoID1
         WMNR3OO1XJwK3qsjdmLdWg4Y7mTujsBZLCnYukavab451M9Fjq1COnoDRYL1tnJQLFOy
         DCQamNNwPBTQs6V/Cq+Rufk4bZuVL3u+OjfTVjAkr+6u8x9luSm3ML63EFM6mmb+ebTo
         Wq0pj0atopQHQRVbEgCyAO92BqtHACDGydxilk/asLE8U8A7jJl44zm76H/RGpirkG26
         YI2w==
X-Gm-Message-State: AOAM532mKzzbU7n21vbdGQsOvtIOZ8N7OTcynSVby3IA+W89Zfsj/Q+W
	DodXTowlkVQFm4uac5B4BPs=
X-Google-Smtp-Source: ABdhPJyOObH9yXI4jZ3v/ZC0hv+bvvh9z8jtq9XqPQ8W6mQH9O0JMQWaoSvRIkaKjflfd/ycLnchmg==
X-Received: by 2002:a17:902:ce81:: with SMTP id f1mr10614856plg.35.1644775187074;
        Sun, 13 Feb 2022 09:59:47 -0800 (PST)
Received: from localhost.localdomain ([103.85.9.185])
        by smtp.gmail.com with ESMTPSA id me18sm8446066pjb.39.2022.02.13.09.59.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Feb 2022 09:59:46 -0800 (PST)
From: Vihas Makwana <makvihas@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Straube <straube.linux@gmail.com>,
	Martin Kaiser <martin@kaiser.cx>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Vihas Makwana <makvihas@gmail.com>
Subject: [PATCH] staging: r8188eu: mark _rtw_free_sta_priv as void
Date: Sun, 13 Feb 2022 23:04:26 +0530
Message-Id: <20220213173424.39935-1-makvihas@gmail.com>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

_rtw_free_sta_priv() always returns _SUCCESS and it's return value
isn't checked either.
So it makes sense to mark it as void instead of u32.

Signed-off-by: Vihas Makwana <makvihas@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_sta_mgt.c | 4 +---
 drivers/staging/r8188eu/include/sta_info.h | 2 +-
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_sta_mgt.c b/drivers/staging/r8188eu/core/rtw_sta_mgt.c
index de5406a58..79b49a13f 100644
--- a/drivers/staging/r8188eu/core/rtw_sta_mgt.c
+++ b/drivers/staging/r8188eu/core/rtw_sta_mgt.c
@@ -117,7 +117,7 @@ inline struct sta_info *rtw_get_stainfo_by_offset(struct sta_priv *stapriv, int
 	return (struct sta_info *)(stapriv->pstainfo_buf + offset * sizeof(struct sta_info));
 }
 
-u32	_rtw_free_sta_priv(struct	sta_priv *pstapriv)
+void _rtw_free_sta_priv(struct	sta_priv *pstapriv)
 {
 	struct list_head *phead, *plist;
 	struct sta_info *psta = NULL;
@@ -147,8 +147,6 @@ u32	_rtw_free_sta_priv(struct	sta_priv *pstapriv)
 
 		vfree(pstapriv->pallocated_stainfo_buf);
 	}
-
-	return _SUCCESS;
 }
 
 struct	sta_info *rtw_alloc_stainfo(struct sta_priv *pstapriv, u8 *hwaddr)
diff --git a/drivers/staging/r8188eu/include/sta_info.h b/drivers/staging/r8188eu/include/sta_info.h
index 24b125431..23f6a85bf 100644
--- a/drivers/staging/r8188eu/include/sta_info.h
+++ b/drivers/staging/r8188eu/include/sta_info.h
@@ -344,7 +344,7 @@ static inline u32 wifi_mac_hash(u8 *mac)
 }
 
 extern u32	_rtw_init_sta_priv(struct sta_priv *pstapriv);
-extern u32	_rtw_free_sta_priv(struct sta_priv *pstapriv);
+extern void _rtw_free_sta_priv(struct sta_priv *pstapriv);
 
 #define stainfo_offset_valid(offset) (offset < NUM_STA && offset >= 0)
 int rtw_stainfo_offset(struct sta_priv *stapriv, struct sta_info *sta);
-- 
2.30.2

