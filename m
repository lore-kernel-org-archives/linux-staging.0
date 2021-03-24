Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88DB171
	for <linux-staging@lists.linux.dev>; Wed, 24 Mar 2021 12:45:12 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id x13so24293191wrs.9
        for <linux-staging@lists.linux.dev>; Wed, 24 Mar 2021 05:45:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=afFr5Gs6ZpGKNGSQ7ScWgWNW1d4wNUZC+zuO9wM1BUQ=;
        b=mOsyozCh5p/ybhAP3JNgXQeh06M3Z8mIENXggEo52f1AjkrTJk+EvwWQL6Ycb6rOh8
         D5CUdYfnP9dUi1y+LvgJ8s040Yl4KwLIHIAjoCe69lG0Ym1k5aqKxenEuv2ytXOmyeGR
         e+01Bowr3E1lAg19vuhNn0SayVLDWcvLNiwS/8ScO3VWpfpwtz0cFgY2Nv+PD0wcr4nV
         Cz5ggkO5QfcfHzh6ZzM2ymmDJgnCnAsKRXETuTjcTC6Qp5/inpXAwI18W9U39uOLNpYS
         vgLgr36EHbRrR4tGRCdQmnPGlQ0T7uH6mslvWQO8onPJG8td9GGFxKhMh0XhOX5KzpRx
         9gqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=afFr5Gs6ZpGKNGSQ7ScWgWNW1d4wNUZC+zuO9wM1BUQ=;
        b=IhtYS7PLtWPEMXUw/Qd/+rA5qzhOQ2qizlY2Cqjk74BKwqSLtpFvHNl+dMbVVpErcp
         jtNpQhjtBB+u+rgCKGea42G1KFhby7vZJpxVHnlqRjrs9FYpzFvjDaUZh/QyWdFOyMyE
         coOBrDUKXPFzapfQtl6TewEkwIAK88dqeWYwVII++pJRKfM6Ql0M+gqNv4Nc7not7FnD
         kgGQW67P5siNy0J+UqP9qaHqDPB4ZTvs6gGr/O4h6Ob8PE3xQUWLJUVCkes8RVRLezZr
         PmCNrwdqQDMr2eLqAWds3zv/laPPKx+A7xJtHcTzEToOIwQgEils9jkaH4Oi4865gTm7
         DxEA==
X-Gm-Message-State: AOAM532aGgEp2QrWuv2oFQoVerG3ROK+7IQMB9jCevzdqyX27sEJbjx2
	W/VLAZLMEca0kvOWa7R6acQ=
X-Google-Smtp-Source: ABdhPJy3JeiT1aczP5pTg99Mag/FYdGt8zdElipB52iTyu26OAP8Dlqnlavw/KLEUTE42teAFuFAgQ==
X-Received: by 2002:a5d:58ce:: with SMTP id o14mr3409436wrf.4.1616589911067;
        Wed, 24 Mar 2021 05:45:11 -0700 (PDT)
Received: from gimli.home (93-48-145-141.ip257.fastwebnet.it. [93.48.145.141])
        by smtp.gmail.com with ESMTPSA id s20sm2324005wmj.36.2021.03.24.05.45.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 05:45:10 -0700 (PDT)
From: Marco Cesati <marcocesati@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	linux-staging@lists.linux.dev
Subject: [PATCH 26/33] Staging: rtl8723bs: remove named enums in odm_interface.h
Date: Wed, 24 Mar 2021 13:44:49 +0100
Message-Id: <20210324124456.25221-27-marcocesati@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210324124456.25221-1-marcocesati@gmail.com>
References: <20210324124456.25221-1-marcocesati@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the following unnecessary enum definition in
hal/odm_interface.h:

	enum odm_h2c_cmd

Signed-off-by: Marco Cesati <marcocesati@gmail.com>
---
 drivers/staging/rtl8723bs/hal/odm_interface.h | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/odm_interface.h b/drivers/staging/rtl8723bs/hal/odm_interface.h
index 8159bbd06c22..4ee5903c41b5 100644
--- a/drivers/staging/rtl8723bs/hal/odm_interface.h
+++ b/drivers/staging/rtl8723bs/hal/odm_interface.h
@@ -39,13 +39,4 @@ ODM_REG(DIG, _pDM_Odm)
 #define ODM_REG(_name, _pDM_Odm)	_cat(_name, _pDM_Odm->SupportICType, _reg)
 #define ODM_BIT(_name, _pDM_Odm)	_cat(_name, _pDM_Odm->SupportICType, _bit)
 
-enum odm_h2c_cmd {
-	ODM_H2C_RSSI_REPORT = 0,
-	ODM_H2C_PSD_RESULT = 1,
-	ODM_H2C_PathDiv = 2,
-	ODM_H2C_WIFI_CALIBRATION = 3,
-	ODM_MAX_H2CCMD
-};
-
-
 #endif	/*  __ODM_INTERFACE_H__ */
-- 
2.30.2

