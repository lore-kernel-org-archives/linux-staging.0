Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B24A1DA38
	for <linux-staging@lists.linux.dev>; Mon,  2 Oct 2023 17:53:12 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-9ae3d7eb7e0so517714766b.0
        for <linux-staging@lists.linux.dev>; Mon, 02 Oct 2023 10:53:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696269190; x=1696873990; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BFQQ8VYOAr6qNDG5scul8J1mas0KU5lvrUkFm3jfx9c=;
        b=XqsTSeeeuh5O1eh7NpOzZTh/29dp+goCVJ3jqehubyipzBrj9C8kOrJvQ08gJ0PFha
         7uRVbCXAFrVAdpaj+ZiDO5BRybwCKyeUt0ijZ2Zrv5GvCWOmNbmEIUU2+dWxGSW9aSq+
         sAe+VJJJmrN/gcNpYWStkflWZaaaNF++mMsYKlXZ8OpulmE8Wi/qRHYosRkmRdE7jOpx
         ewNiV5aTcOxDwp65XWbj0bsa8IbH0Va7Ry/f3GViDkqpE0R1kdRnZ6nHYpDKzVxwPM+r
         YLtFSY9sqGAK9lxF3MV3S1r0vXzUND55GxFhOpS8kqzawnbL744mcyzcGX4XQzxtb7LF
         bHJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696269190; x=1696873990;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BFQQ8VYOAr6qNDG5scul8J1mas0KU5lvrUkFm3jfx9c=;
        b=S2ma0Jl/me6jc7VFy0RUA5Vg/VIwRhC3EnBVJulHeRHMFxQFLz4JsratRdYf22Rjap
         WHSAx7lkKt+x84SQpKnnF5hAUCdsKilN6BTDDWUY+fQIJubXLvemD3nWi3rClmM2ITDI
         aXlIoOHxRoSOA7Rh1tNHwqbDhPFYq2GDZekjQWJjUUeEntOpYooPFJfbprlPaVmgc2zo
         E5zcgiboOagx71WEBiehOFWm1ZI5VV1gTg/Afw5Z+Cgg8WGNc41ScSz0RN4fKocusaF9
         fkaOEj7Xi20uLEmk67suxfrEP6QArqph6TJnf/4PSvWG4MBfCBSWgovmxRNl/mSQObqe
         6RLg==
X-Gm-Message-State: AOJu0YwZEUqsE3mbrjHk9eZv/6r28zUaT5hsrO0iFmy4s/qjsEHohIst
	vfDZxbtpN0TMPt7hJOuYpVY=
X-Google-Smtp-Source: AGHT+IGMa7Qaxlb1KlygBwVlzi54kQa7AeduKFnqNbPLRX9y8enMpw6ICJzR7bnbu6L2qmOZH/0yCQ==
X-Received: by 2002:a17:906:25d:b0:9b2:bf2d:6b65 with SMTP id 29-20020a170906025d00b009b2bf2d6b65mr11389311ejl.4.1696269190437;
        Mon, 02 Oct 2023 10:53:10 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p579356c7.dip0.t-ipconnect.de. [87.147.86.199])
        by smtp.gmail.com with ESMTPSA id k5-20020a1709062a4500b009934b1eb577sm17589605eje.77.2023.10.02.10.53.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Oct 2023 10:53:10 -0700 (PDT)
Date: Mon, 2 Oct 2023 19:53:08 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 1/8] staging: rtl8192e: Remove unused function
 rtl92e_dm_backup_state()
Message-ID: <104b248b35b4fda560056fc4ab4ac230dea98d3f.1696266964.git.philipp.g.hortmann@gmail.com>
References: <cover.1696266964.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1696266964.git.philipp.g.hortmann@gmail.com>

rtl92e_dm_backup_state() is unused. Remove dead code.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/rtl_dm.c | 19 -------------------
 drivers/staging/rtl8192e/rtl8192e/rtl_dm.h |  1 -
 2 files changed, 20 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
index c29bc85f9577..5217ace3f140 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
@@ -973,25 +973,6 @@ static void _rtl92e_dm_bb_initialgain_restore(struct net_device *dev)
 	rtl92e_set_bb_reg(dev, UFWP, bMaskByte1, 0x1);
 }
 
-void rtl92e_dm_backup_state(struct net_device *dev)
-{
-	struct r8192_priv *priv = rtllib_priv(dev);
-	u32 bit_mask = bMaskByte0;
-
-	priv->bswitch_fsync  = false;
-
-	if (dm_digtable.dig_algorithm == DIG_ALGO_BY_RSSI)
-		return;
-
-	rtl92e_set_bb_reg(dev, UFWP, bMaskByte1, 0x8);
-	priv->initgain_backup.xaagccore1 = rtl92e_get_bb_reg(dev, rOFDM0_XAAGCCore1, bit_mask);
-	priv->initgain_backup.xbagccore1 = rtl92e_get_bb_reg(dev, rOFDM0_XBAGCCore1, bit_mask);
-	priv->initgain_backup.xcagccore1 = rtl92e_get_bb_reg(dev, rOFDM0_XCAGCCore1, bit_mask);
-	priv->initgain_backup.xdagccore1 = rtl92e_get_bb_reg(dev, rOFDM0_XDAGCCore1, bit_mask);
-	bit_mask  = bMaskByte2;
-	priv->initgain_backup.cca = (u8)rtl92e_get_bb_reg(dev, rCCK0_CCA, bit_mask);
-}
-
 static void _rtl92e_dm_dig_init(struct net_device *dev)
 {
 	struct r8192_priv *priv = rtllib_priv(dev);
diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.h b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.h
index 01587e2fec65..9085a6454cbc 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.h
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.h
@@ -179,7 +179,6 @@ void    rtl92e_dm_txpower_tracking_wq(void *data);
 void rtl92e_dm_cck_txpower_adjust(struct net_device *dev, bool binch14);
 
 void    rtl92e_dm_restore_state(struct net_device *dev);
-void    rtl92e_dm_backup_state(struct net_device *dev);
 void    rtl92e_dm_init_edca_turbo(struct net_device *dev);
 void    rtl92e_dm_rf_pathcheck_wq(void *data);
 void rtl92e_dm_init_txpower_tracking(struct net_device *dev);
-- 
2.42.0

