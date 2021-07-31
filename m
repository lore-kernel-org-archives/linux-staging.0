Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8183F3486
	for <linux-staging@lists.linux.dev>; Sat, 31 Jul 2021 00:24:06 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id m12so8553531wru.12
        for <linux-staging@lists.linux.dev>; Fri, 30 Jul 2021 17:24:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FFK35TeNRCpJMMYpkUlLwh47HmF6IKjwmwo/sLbCW6w=;
        b=Lcg6BS7xI8uhI3Hfr1t1Z/fJuTqnIkWoXPP6ShMFwd9Sa5lAcskHPByd8V3usudexi
         pD15J5QVnQnw7tZAyWYjjXbDhqI9ptabQYGwn3ukbZaLc2D/M9fAgNwfabeK1y8GwUZ/
         oowYho3n9yodsGvi1uTjqngydqY4jqTRlNICZvIJWgWC3oizO2LE8PtPgxaiWj2c+sNB
         17a2x+vVdqtrIdFV5asjJ3aBhliiscyT4bxru3QO7SS5uVvt3b+0Wm6CIII7RLP4VhTQ
         opjCbJn8e7tdtv0MqZEe0kSnNW3tLa3Jn/h+ZVJdqnJ8Sa5oqrEWLmSREjU916DXZ+dx
         EDmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FFK35TeNRCpJMMYpkUlLwh47HmF6IKjwmwo/sLbCW6w=;
        b=oJZHnOh2x/PzxxM4xQ9YdbxLttKi/nvM4HaeHNRWt5Sajp+atHS5vsil7Bld0NF5LX
         miBqU/tyvrbha6/EPLptGOOhZ3AN1tvTPnZeiRA8sB0AcJWi4KrmgP4HBUL5iFCq3X4i
         bXKd2LAnoP0PlJmdx9dIjiKd4R/rK6Fym4Pvu+NHw2xD6xZApg10x/PA40J0rd26ziOk
         bZTALA6mbc24nkNnFbdUg3hY0LRGujKwwqQuq8yKwPR2qHaIdE8/vkgmaLhe5DyuHl9p
         smlW+WonIxEOyX/n9PSH/KW2Pru7CySk2khs0QGCX9XUBCyMq8CePaYyRlq4ZzI3nKeb
         E5Iw==
X-Gm-Message-State: AOAM5336pSshoUYCgJ0blZyfNSjhVBl/5uuGIE5qBOhYoUB92b5vYp/o
	TtkgDsUc5i+8WfBvx2N2/LzpeNrI+O2nhf+wWWQ=
X-Google-Smtp-Source: ABdhPJzTaUA1lm0JfchlHpP/OENTOhTIcZW5LRPh9cFpvrS+a4KHUCzMVYWJXahOlz9VQ3djsw1r2g==
X-Received: by 2002:adf:ef85:: with SMTP id d5mr5861323wro.372.1627691044950;
        Fri, 30 Jul 2021 17:24:04 -0700 (PDT)
Received: from localhost.localdomain (3.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.6.1.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:df16::3])
        by smtp.gmail.com with ESMTPSA id x9sm3236011wmj.41.2021.07.30.17.24.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jul 2021 17:24:04 -0700 (PDT)
From: Phillip Potter <phil@philpotter.co.uk>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 13/14] staging: r8188eu: remove DbgPrint and RT_PRINTK macro definitions
Date: Sat, 31 Jul 2021 01:23:52 +0100
Message-Id: <20210731002353.68479-14-phil@philpotter.co.uk>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210731002353.68479-1-phil@philpotter.co.uk>
References: <20210731002353.68479-1-phil@philpotter.co.uk>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove DbgPrint and RT_PRINTK macro definitions from include/odm_debug.h,
as they are called from nowhere and are therefore superfluous. Also
remove comment in core/rtw_xmit.c referring to DbgPrint so that future
confusion is prevented.

Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
---
 drivers/staging/r8188eu/core/rtw_xmit.c     | 1 -
 drivers/staging/r8188eu/include/odm_debug.h | 4 ----
 2 files changed, 5 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_xmit.c b/drivers/staging/r8188eu/core/rtw_xmit.c
index 7ecffadcb61f..c87ecf59b232 100644
--- a/drivers/staging/r8188eu/core/rtw_xmit.c
+++ b/drivers/staging/r8188eu/core/rtw_xmit.c
@@ -670,7 +670,6 @@ static s32 xmitframe_addmic(struct adapter *padapter, struct xmit_frame *pxmitfr
 				rtw_secmicsetkey(&micdata, psecuritypriv->dot118021XGrptxmickey[psecuritypriv->dot118021XGrpKeyid].skey);
 			} else {
 				if (!memcmp(&stainfo->dot11tkiptxmickey.skey[0], null_key, 16)) {
-					/* DbgPrint("\nxmitframe_addmic:stainfo->dot11tkiptxmickey == 0\n"); */
 					/* rtw_msleep_os(10); */
 					return _FAIL;
 				}
diff --git a/drivers/staging/r8188eu/include/odm_debug.h b/drivers/staging/r8188eu/include/odm_debug.h
index 38b07664b07c..c71d890ac552 100644
--- a/drivers/staging/r8188eu/include/odm_debug.h
+++ b/drivers/staging/r8188eu/include/odm_debug.h
@@ -64,10 +64,6 @@
 #define ODM_COMP_INIT					BIT31
 
 /*------------------------Export Marco Definition---------------------------*/
-#define DbgPrint	pr_info
-#define RT_PRINTK(fmt, args...)				\
-	DbgPrint( "%s(): " fmt, __func__, ## args);
-
 void ODM_InitDebugSetting(struct odm_dm_struct *pDM_Odm);
 
 #endif	/*  __ODM_DBG_H__ */
-- 
2.31.1

