Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BF0A2FB2
	for <linux-staging@lists.linux.dev>; Sun, 13 Jun 2021 10:24:59 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id y13-20020a1c4b0d0000b02901c20173e165so3153770wma.0
        for <linux-staging@lists.linux.dev>; Sun, 13 Jun 2021 03:24:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0uZe4Gb8RbiHzh9aX3JNtyj1EP8IiYb1JXDb3skPcRg=;
        b=TsFqo0b+ZC8Hss/+xRaYhtnmBjSaKIu2wMEPeZAMdBROXkowSGMLC+EpX3Im+nZeOS
         pGGhSjP4zbibSzucewpgN+wlYT0n9z3noBOakrmV6ucAw8i3omXjrsb23L8WrJh2KDQB
         iT2u95HDYCbdp2BQDsZXEV79UILfxAM5wLSM8/vL6Obi/avo1XBtF8rJXCVngOv33wLE
         MEYgVh0w7BCntBYUaBtgB2ROArQrYKWs4p20WcTVGU6B9VWOt5UX0bt65g6482aWbh4F
         i3QHLpl9N1VhM6z8d+kwVoGtNWDLwmhHBY82YggEkPcDFAU+NKFH9emN0xmQFwq8aI30
         EAVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0uZe4Gb8RbiHzh9aX3JNtyj1EP8IiYb1JXDb3skPcRg=;
        b=MhoVwdu3rSTZV6fisGOJsz4IVLoyKJNdJFn9717Z1NkZSacvOgBxKKJDULNsWpdseN
         ZJWw7tQKnMZZiQwpwP6npwWkrF6J0C5I5939NKcMic543eCX4JbK8JYrzbu8AniUHL1g
         weFMdoV+iL69+Upl73Yd4XufmKMQ9zq8W+n4LsVZVZE5dNhogoHlWgdbB1XP3gojz5BP
         OLvyZMp8gnmsZOcMmpnnMTViHahXolwxSXwQNnJzJN8lIjChe99t1OIrvI+pXVRUBZ3Z
         EpVqB6TmwotoyUTfPWc5ePmAYtpjDDjaodJV2X78N82ZKziQfyO5t7FfyBUGTDj+h7s0
         M0mw==
X-Gm-Message-State: AOAM530rvuujRi+xOUCO/0Ab3FAoyhPFEC3bjzF/taQ/v1GE4FxC21Yj
	Z7vbzLvGBroKdT714N8J9qyE7w==
X-Google-Smtp-Source: ABdhPJytHxEfDxRHMx3D0IEINcZnzEF1ZbDJnS4549pdElKTUCxc3CMKfYseq20GEcraNbYfpwvqwA==
X-Received: by 2002:a05:600c:190f:: with SMTP id j15mr4904943wmq.37.1623579897829;
        Sun, 13 Jun 2021 03:24:57 -0700 (PDT)
Received: from localhost.localdomain (2.0.5.1.1.6.3.8.5.c.c.3.f.b.d.3.0.0.0.0.6.1.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:df16:0:3dbf:3cc5:8361:1502])
        by smtp.gmail.com with ESMTPSA id u16sm14028654wru.56.2021.06.13.03.24.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Jun 2021 03:24:57 -0700 (PDT)
From: Phillip Potter <phil@philpotter.co.uk>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	linux@roeck-us.net,
	martin@kaiser.cx,
	straube.linux@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	joe@perches.com
Subject: [PATCH v2] staging: rtl8188eu: convert DBG_88E calls in core/rtw_sta_mgt.c
Date: Sun, 13 Jun 2021 11:24:54 +0100
Message-Id: <20210613102454.7480-1-phil@philpotter.co.uk>
X-Mailer: git-send-email 2.30.2
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert both calls to the DBG_88E macro in core/rtw_sta_mgt.c into
netdev_dbg calls. The DBG_88E macro is unnecessary, as visibility of
debug messages can be controlled more precisely by just using debugfs.
It is important to keep these messages still, as they are displayable
via a kernel module parameter when using DBG_88E.

Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
---

V2:
* Incorporated newlines for format strings, as suggested by Joe Perches.

---
 drivers/staging/rtl8188eu/core/rtw_sta_mgt.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8188eu/core/rtw_sta_mgt.c b/drivers/staging/rtl8188eu/core/rtw_sta_mgt.c
index 5af7af5f5a5a..16bbba6247f4 100644
--- a/drivers/staging/rtl8188eu/core/rtw_sta_mgt.c
+++ b/drivers/staging/rtl8188eu/core/rtw_sta_mgt.c
@@ -113,17 +113,20 @@ u32 _rtw_init_sta_priv(struct sta_priv *pstapriv)
 inline int rtw_stainfo_offset(struct sta_priv *stapriv, struct sta_info *sta)
 {
 	int offset = (((u8 *)sta) - stapriv->pstainfo_buf) / sizeof(struct sta_info);
+	struct net_device *pnetdev = stapriv->padapter->pnetdev;
 
 	if (!stainfo_offset_valid(offset))
-		DBG_88E("%s invalid offset(%d), out of range!!!", __func__, offset);
+		netdev_dbg(pnetdev, "invalid offset(%d), out of range!!!\n", offset);
 
 	return offset;
 }
 
 inline struct sta_info *rtw_get_stainfo_by_offset(struct sta_priv *stapriv, int offset)
 {
+	struct net_device *pnetdev = stapriv->padapter->pnetdev;
+
 	if (!stainfo_offset_valid(offset))
-		DBG_88E("%s invalid offset(%d), out of range!!!", __func__, offset);
+		netdev_dbg(pnetdev, "invalid offset(%d), out of range!!!\n", offset);
 
 	return (struct sta_info *)(stapriv->pstainfo_buf + offset * sizeof(struct sta_info));
 }
-- 
2.30.2

