Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DBA22FB2
	for <linux-staging@lists.linux.dev>; Sat, 12 Jun 2021 23:28:36 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id f2so10009922wri.11
        for <linux-staging@lists.linux.dev>; Sat, 12 Jun 2021 16:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XyxS3uRLeBP22eWOKPMEPOGDp/EN+GKy8P3DEi9Mx1I=;
        b=uhSqCr7lRIdAI92onAyj/RbR8//rZU/ByHJQevF4yJD9HQCoCOyTo8qkYjQhxQBIAQ
         uJA5ZCXIf9A/Lf5PVSFERCzSab0Lz9GAy0UxmInoC3uWx4OfHR551V8Cz7vq8QJgCEfg
         ZJgL5TgbD6Azvurf0wo5lsj4NaFYrqq7/kOJMUcZuIMvXyDC0b4VU8B8d/xjYUH2pPcL
         c50qI9Ler/vBGRYk9kmB4dEa34GJGUIHZvsIdTnBYv3Y6Qlba61R3hLJ0qOYXItymWWY
         V1FwSi3ZaG1OTp2ZcRC3QcK6MQ3f9pjfnRtgtkloFa8P954ESfTGSFx6tA04uKwFeF/z
         QbCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XyxS3uRLeBP22eWOKPMEPOGDp/EN+GKy8P3DEi9Mx1I=;
        b=UCyE3tygg+u+4QKY6B1O1XSSrdTHSzZorCJSa2dzJRw1jt14bRV6dNtiLNJTjO3Hj+
         sq5iO3FwsppYknI1t14C/tFKarpOUezh5vfCzpE9Rj3jbC+KF7TcsJ34Bks+jD6DsSyB
         HpV3467afTRE1ubGUT7vK5i8oDh1PqQcMuFfpTTr7BlbL2EHfJ6sKPBynFzfB4seYAes
         nORGX/CQkKGye5A1jtrMN7fQ0UjtQ4idSQLIlc3z95jrFXHTPu8oGubwxidH2kUETim2
         8QOas01USVqULjl2555nT6K4IL6r261fBb/llkeve0fYmk5yGYsIB+kwd0amu3TrXdQL
         I+rg==
X-Gm-Message-State: AOAM53332UAKWOLjG0yravlsCYlwoXZMr+Nk6EHj1bckFAK0ov9ny8n6
	bTbpOm35KHGROKTAiz9IkVV0Zw==
X-Google-Smtp-Source: ABdhPJxYaGugk8yOvv7qMou6Qj6tMc1BJAN3n71pAIStndQUCljXl19QM9QqLNBKx6x4+Al+TjhtAw==
X-Received: by 2002:a5d:5752:: with SMTP id q18mr11093325wrw.419.1623540515192;
        Sat, 12 Jun 2021 16:28:35 -0700 (PDT)
Received: from localhost.localdomain (2.0.5.1.1.6.3.8.5.c.c.3.f.b.d.3.0.0.0.0.6.1.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:df16:0:3dbf:3cc5:8361:1502])
        by smtp.gmail.com with ESMTPSA id e17sm12950606wre.79.2021.06.12.16.28.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Jun 2021 16:28:34 -0700 (PDT)
From: Phillip Potter <phil@philpotter.co.uk>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	linux@roeck-us.net,
	straube.linux@gmail.com,
	martin@kaiser.cx,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: rtl8188eu: convert DBG_88E calls in core/rtw_sta_mgt.c
Date: Sun, 13 Jun 2021 00:28:31 +0100
Message-Id: <20210612232831.1325-1-phil@philpotter.co.uk>
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
 drivers/staging/rtl8188eu/core/rtw_sta_mgt.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8188eu/core/rtw_sta_mgt.c b/drivers/staging/rtl8188eu/core/rtw_sta_mgt.c
index 5af7af5f5a5a..ad1d851a2f69 100644
--- a/drivers/staging/rtl8188eu/core/rtw_sta_mgt.c
+++ b/drivers/staging/rtl8188eu/core/rtw_sta_mgt.c
@@ -113,17 +113,20 @@ u32 _rtw_init_sta_priv(struct sta_priv *pstapriv)
 inline int rtw_stainfo_offset(struct sta_priv *stapriv, struct sta_info *sta)
 {
 	int offset = (((u8 *)sta) - stapriv->pstainfo_buf) / sizeof(struct sta_info);
+	struct net_device *pnetdev = stapriv->padapter->pnetdev;
 
 	if (!stainfo_offset_valid(offset))
-		DBG_88E("%s invalid offset(%d), out of range!!!", __func__, offset);
+		netdev_dbg(pnetdev, "invalid offset(%d), out of range!!!", offset);
 
 	return offset;
 }
 
 inline struct sta_info *rtw_get_stainfo_by_offset(struct sta_priv *stapriv, int offset)
 {
+	struct net_device *pnetdev = stapriv->padapter->pnetdev;
+
 	if (!stainfo_offset_valid(offset))
-		DBG_88E("%s invalid offset(%d), out of range!!!", __func__, offset);
+		netdev_dbg(pnetdev, "invalid offset(%d), out of range!!!", offset);
 
 	return (struct sta_info *)(stapriv->pstainfo_buf + offset * sizeof(struct sta_info));
 }
-- 
2.30.2

