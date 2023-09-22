Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE95827707
	for <linux-staging@lists.linux.dev>; Fri, 22 Sep 2023 13:29:44 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-40506bfca64so7400675e9.0
        for <linux-staging@lists.linux.dev>; Fri, 22 Sep 2023 06:29:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695389383; x=1695994183; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QkdCAog+xgLVXDuxIQHdYyarWuQwp/PxNXP6mPL61iA=;
        b=kbNVP2aM8O53KRk7Gf1ZaAnOKxiYc1XL7oy9t8DML6liXx6LvElexc7QUej8vvG0uk
         jRz2roSt2Vw/Y+sXpPGNE5O6pOMbbQTKyhdQDtEYMNHEtwmwlbBql02IkspkQt/TNAvh
         t9TI1wRVaI2bl22BsYb3YJjiHi3qLnrQKJvZU2i551UsuUcr2GWKC0SD2PTtR3d1l50g
         JVNalz/zEMJbxbNyaMKvr6inb/nk31gtZb28nMWCqYB6++iI2oVtqbLtSc1rSAlNATE4
         X2w7/KJ50oDD7ASOxPi8Vil2fT/rXhim3S+WqePkLF+OhlMgXurg9UAUCU98NwQYGmUQ
         Kn3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695389383; x=1695994183;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QkdCAog+xgLVXDuxIQHdYyarWuQwp/PxNXP6mPL61iA=;
        b=dgO9HgX3G4a0RcVXuV/JzR+A/7fTDCrvjuHGcGVsvROuiWExS3sbEy/IiusJ4hlYYc
         OZYEstGbnJCyPkgmvrf4+P4z5J4QGr8qMLr3Db4QV77zcMaO7ILQbyPE3Vm1Uig+DxSh
         FpSmuEGz6FFP/1/IySt2j/LXQ6niijlQUux/9T13XXD637u4ZhbcLqGruwxDSCJm6YTt
         L6vE4WJg54ScEceTswco4Ig6/RnBYICGX953HtKMZ2BJNrO5ocyQzM1dPYosbfW6J22r
         R9x5nQJvAEJQ2X9+wIyF9HSJZThd5Yr7pPIhF9qaMYTAcLQhxDT6pmzT0nI1j5oy9RwC
         2jDg==
X-Gm-Message-State: AOJu0YzVI7+J22vWHFxukQESrnSbX35+/b+Ra2pclOvrzG+zXZUL5uHg
	gnDmXWyZEvEhtd8bTePQkRo=
X-Google-Smtp-Source: AGHT+IFPjbiSRkd3GnqcGVlXS3FO5CvkNL2JyplN6eRYlBwsdEoRKvBene65g2Nmjk0YNSrdV8bpvQ==
X-Received: by 2002:a5d:6308:0:b0:31a:ea18:c516 with SMTP id i8-20020a5d6308000000b0031aea18c516mr7268333wru.3.1695389382946;
        Fri, 22 Sep 2023 06:29:42 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p579356c7.dip0.t-ipconnect.de. [87.147.86.199])
        by smtp.gmail.com with ESMTPSA id p16-20020a5d6390000000b0031ffa453affsm4468073wru.17.2023.09.22.06.29.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Sep 2023 06:29:42 -0700 (PDT)
Date: Fri, 22 Sep 2023 15:29:41 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 4/7] staging: rtl8192e: Remove mode IW_MODE_ADHOC from
 rtl_cam.c
Message-ID: <143345585dfcc0e920b2ba5fa614f626ab3ad8ee.1695387832.git.philipp.g.hortmann@gmail.com>
References: <cover.1695387832.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1695387832.git.philipp.g.hortmann@gmail.com>

Remove unsupported mode IW_MODE_ADHOC from rtl_cam.c.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/rtl_cam.c | 61 +++------------------
 1 file changed, 7 insertions(+), 54 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_cam.c b/drivers/staging/rtl8192e/rtl8192e/rtl_cam.c
index 944cc73fb2b6..14b48cacfbbd 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_cam.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_cam.c
@@ -33,11 +33,6 @@ void rtl92e_enable_hw_security_config(struct net_device *dev)
 	     (priv->rtllib->auth_mode != 2)) {
 		SECR_value |= SCR_RxUseDK;
 		SECR_value |= SCR_TxUseDK;
-	} else if ((ieee->iw_mode == IW_MODE_ADHOC) &&
-		   (ieee->pairwise_key_type & (KEY_TYPE_CCMP |
-		   KEY_TYPE_TKIP))) {
-		SECR_value |= SCR_RxUseDK;
-		SECR_value |= SCR_TxUseDK;
 	}
 
 	ieee->hwsec_active = 1;
@@ -157,29 +152,14 @@ void rtl92e_cam_restore(struct net_device *dev)
 		}
 
 	} else if (priv->rtllib->pairwise_key_type == KEY_TYPE_TKIP) {
-		if (priv->rtllib->iw_mode == IW_MODE_ADHOC) {
-			rtl92e_set_key(dev, 4, 0,
-				       priv->rtllib->pairwise_key_type,
-				       (const u8 *)dev->dev_addr, 0,
-				       (u32 *)(&priv->rtllib->swcamtable[4].key_buf[0]));
-		} else {
-			rtl92e_set_key(dev, 4, 0,
-				       priv->rtllib->pairwise_key_type,
-				       MacAddr, 0,
-				       (u32 *)(&priv->rtllib->swcamtable[4].key_buf[0]));
-		}
-
+		rtl92e_set_key(dev, 4, 0,
+			       priv->rtllib->pairwise_key_type,
+			       MacAddr, 0,
+			       (u32 *)(&priv->rtllib->swcamtable[4].key_buf[0]));
 	} else if (priv->rtllib->pairwise_key_type == KEY_TYPE_CCMP) {
-		if (priv->rtllib->iw_mode == IW_MODE_ADHOC) {
-			rtl92e_set_key(dev, 4, 0,
-				       priv->rtllib->pairwise_key_type,
-				       (const u8 *)dev->dev_addr, 0,
-				       (u32 *)(&priv->rtllib->swcamtable[4].key_buf[0]));
-		} else {
-			rtl92e_set_key(dev, 4, 0,
-				       priv->rtllib->pairwise_key_type, MacAddr,
-				       0, (u32 *)(&priv->rtllib->swcamtable[4].key_buf[0]));
-			}
+		rtl92e_set_key(dev, 4, 0,
+			       priv->rtllib->pairwise_key_type, MacAddr,
+			       0, (u32 *)(&priv->rtllib->swcamtable[4].key_buf[0]));
 	}
 
 	if (priv->rtllib->group_key_type == KEY_TYPE_TKIP) {
@@ -192,19 +172,6 @@ void rtl92e_cam_restore(struct net_device *dev)
 					       (u32 *)(&priv->rtllib->swcamtable[EntryId].key_buf[0]));
 			}
 		}
-		if (priv->rtllib->iw_mode == IW_MODE_ADHOC) {
-			if (priv->rtllib->swcamtable[0].bused) {
-				rtl92e_set_key(dev, 0, 0,
-					       priv->rtllib->group_key_type,
-					       CAM_CONST_ADDR[0], 0,
-					       (u32 *)(&priv->rtllib->swcamtable[0].key_buf[0]));
-			} else {
-				netdev_warn(dev,
-					    "%s(): ADHOC TKIP: missing key entry.\n",
-					    __func__);
-				return;
-			}
-		}
 	} else if (priv->rtllib->group_key_type == KEY_TYPE_CCMP) {
 		MacAddr = CAM_CONST_BROAD;
 		for (EntryId = 1; EntryId < 4; EntryId++) {
@@ -215,19 +182,5 @@ void rtl92e_cam_restore(struct net_device *dev)
 					       (u32 *)(&priv->rtllib->swcamtable[EntryId].key_buf[0]));
 			}
 		}
-
-		if (priv->rtllib->iw_mode == IW_MODE_ADHOC) {
-			if (priv->rtllib->swcamtable[0].bused) {
-				rtl92e_set_key(dev, 0, 0,
-					       priv->rtllib->group_key_type,
-					       CAM_CONST_ADDR[0], 0,
-					       (u32 *)(&priv->rtllib->swcamtable[0].key_buf[0]));
-			} else {
-				netdev_warn(dev,
-					    "%s(): ADHOC CCMP: missing key entry.\n",
-					    __func__);
-				return;
-			}
-		}
 	}
 }
-- 
2.42.0

