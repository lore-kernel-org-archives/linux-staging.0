Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87F686D32
	for <linux-staging@lists.linux.dev>; Wed, 14 Apr 2021 18:12:18 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id r9so32819255ejj.3
        for <linux-staging@lists.linux.dev>; Wed, 14 Apr 2021 11:12:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kpF2D6lcCQKzXa0gi0zcEEwxlAaXoFqEUGWLqoobvuM=;
        b=TMChDObI251LbBAzFu73+KQvOpttCqxvvR2/cV6soZxQ5gbC7xe2bcLch1L9YSdZLc
         f7oHwMb2LNNBM+KNDsU9vvh3NviWlTtUEWOmAL311ROm+fiIqsjjXcEWg1eT7EHqQPbp
         NYKGVXtpBzXWL1sD2jUwGI7c8PBHfLVD9Y7cJyav6q/7gUsXReRgc0bdqY89Apf7Gkba
         MJkESv4WL+LlsDOE5NAFiaDmpMaVvew5rzO7wvIVGPNJ/m/ucxJy1IDh5hR/mh1aejP4
         qMuQza8pmGwCSNecJFDyRl2l6TYNVuO8emtRoVyIFyRu2O9aSWhU5v5gzmjeoCvBXrr2
         9eUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kpF2D6lcCQKzXa0gi0zcEEwxlAaXoFqEUGWLqoobvuM=;
        b=egclqB43ZjLJuunxnZMHJarF5dcTRoN6Twir70D6wSaBLiOU7qleQKo2USw0LZ79gc
         GNkfcZJkNNbx+pzoDBGXRum3n+8zy5g6R34sPsjigQP0XO0aW0LE8oybuaB60d3FNAL8
         +HvtXWHJYM19bKGeGY6uBFenRTzs7Az90cITXWIc3YD6MsHs5UOPs+iwWnZNSWRSz8Tb
         mXGnt6kLgF+YGaDbUMtMY8anoK63hD5um02o9CsBB4JgOlYDvRlFXjLsSkmcOVZr6I6S
         vcpNgeDJ5PPzvQvMgGL2S56xYgdmrm+Tw1T/b3Ydu69r/FC2zcfT7upbgcOvKYQ0HHoG
         X3hw==
X-Gm-Message-State: AOAM532EzP7gmkrsWXzYeH08b8pmqdqFqlULdnqaf3Pinquam2kblG0B
	xP8wJMGLs3W/fideLaQxzg3Cog==
X-Google-Smtp-Source: ABdhPJyTSFFjtRZgu3vEZZdMDeytL5hTBBBwwQ6RA2nexvyX2Vaz35YbBgCn5uZzcuKhgMTERy9u6w==
X-Received: by 2002:a17:906:a449:: with SMTP id cb9mr175498ejb.118.1618423937108;
        Wed, 14 Apr 2021 11:12:17 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
        by smtp.gmail.com with ESMTPSA id v1sm279493eds.17.2021.04.14.11.12.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Apr 2021 11:12:16 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Cc: linux-kernel@vger.kernel.org,
	Larry Finger <Larry.Finger@lwfinger.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev
Subject: [PATCH 41/57] staging: rtl8188eu: os_dep: mon: Demote non-conforming kernel-doc headers
Date: Wed, 14 Apr 2021 19:11:13 +0100
Message-Id: <20210414181129.1628598-42-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210414181129.1628598-1-lee.jones@linaro.org>
References: <20210414181129.1628598-1-lee.jones@linaro.org>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes the following W=1 kernel build warning(s):

 drivers/staging/rtl8188eu/os_dep/mon.c:21: warning: Function parameter or member 'skb' not described in 'unprotect_frame'
 drivers/staging/rtl8188eu/os_dep/mon.c:21: warning: Function parameter or member 'iv_len' not described in 'unprotect_frame'
 drivers/staging/rtl8188eu/os_dep/mon.c:21: warning: Function parameter or member 'icv_len' not described in 'unprotect_frame'
 drivers/staging/rtl8188eu/os_dep/mon.c:75: warning: Function parameter or member 'dev' not described in 'rtl88eu_mon_recv_hook'
 drivers/staging/rtl8188eu/os_dep/mon.c:75: warning: Function parameter or member 'frame' not described in 'rtl88eu_mon_recv_hook'
 drivers/staging/rtl8188eu/os_dep/mon.c:108: warning: Function parameter or member 'dev' not described in 'rtl88eu_mon_xmit_hook'
 drivers/staging/rtl8188eu/os_dep/mon.c:108: warning: Function parameter or member 'frame' not described in 'rtl88eu_mon_xmit_hook'
 drivers/staging/rtl8188eu/os_dep/mon.c:108: warning: Function parameter or member 'frag_len' not described in 'rtl88eu_mon_xmit_hook'

Cc: Larry Finger <Larry.Finger@lwfinger.net>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/staging/rtl8188eu/os_dep/mon.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8188eu/os_dep/mon.c b/drivers/staging/rtl8188eu/os_dep/mon.c
index 73b9599fe0dc5..9b40de7d39e72 100644
--- a/drivers/staging/rtl8188eu/os_dep/mon.c
+++ b/drivers/staging/rtl8188eu/os_dep/mon.c
@@ -14,7 +14,7 @@
 #include <rtw_xmit.h>
 #include <mon.h>
 
-/**
+/*
  * unprotect_frame() - unset Protected flag and strip off IV and ICV/MIC
  */
 static void unprotect_frame(struct sk_buff *skb, int iv_len, int icv_len)
@@ -65,7 +65,7 @@ static void mon_recv_encrypted(struct net_device *dev, const u8 *data,
 		netdev_info(dev, "Encrypted packets are not supported");
 }
 
-/**
+/*
  * rtl88eu_mon_recv_hook() - forward received frame to the monitor interface
  *
  * Assumes that the frame contains an IV and an ICV/MIC, and that
@@ -96,7 +96,7 @@ void rtl88eu_mon_recv_hook(struct net_device *dev, struct recv_frame *frame)
 		mon_recv_encrypted(dev, data, data_len);
 }
 
-/**
+/*
  * rtl88eu_mon_xmit_hook() - forward trasmitted frame to the monitor interface
  *
  * Assumes that:
-- 
2.27.0

