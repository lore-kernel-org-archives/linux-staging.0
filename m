Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 473DA70
	for <linux-staging@lists.linux.dev>; Wed, 24 Mar 2021 12:44:55 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id a132-20020a1c668a0000b029010f141fe7c2so1133096wmc.0
        for <linux-staging@lists.linux.dev>; Wed, 24 Mar 2021 05:44:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ObzjOu2jFIxT85YP5gKR5+U0ty2U8Mlsks8+XZdNt44=;
        b=tffEcXNua3OF+Pyb5BSGLAYMvR2lK09vdjIaaVyAvSXLpupHphfwpG4+xSQij9+bfc
         UEUyb8bAqj2JPCxtoWwvsESojbbM2C2Ex4HyChtmORcUojnAGZYLYTUoNpYrHQUcgeQD
         B7GGJm5Zl18GhPEjZ2JYwjzRJbAlIdS0WCSbRCuWpF3uWGH2fWxe57jqoqldqJPAgbbA
         ro+pXlN7KzoKLhEi0ISrzNVMOj+/KzyxaNyXBFDAMp0S4HTdF5bOF15oECnVE5YMXz7E
         TpP+g297oTE1hLNwpdYbHTqHV6Aek6VGYSXUMGF3T95A+wKXGS4NdeBkJrDLA2cXCm+s
         Hf3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ObzjOu2jFIxT85YP5gKR5+U0ty2U8Mlsks8+XZdNt44=;
        b=BQGN5ELStREM9pzfDRTb8C2X4glFvYWswg04HlRDwDexrvvrQeWUQUwIQWqYnXunHv
         OspxqIoT+RFQ8GOtMyL2cAeWN3TOmckOSaF3TwlW5t11KpJYrwvmmABbx1EGZSLyJVH/
         IEzu56HvSYmLISr4B8e7FnRNf0cavRHoQdg+XFPNqjGs7B5LnxDpZjcMAdUr06oh5BsO
         xxQkXvqGQlVJfgS2IohFvMp3tTqDQ80r2cVtyZnZgDj43AqOduY5yDGQBSGCnBq5WLxo
         6CyDTYjZUSxqg3gHw/mx3ih9QFeb9U5lOT3+9YE37xRuJZhYqE03hPSK1/n2N3Dryovq
         u4fg==
X-Gm-Message-State: AOAM530p+wGRApe9n614LVZjVOCmMN1OCFbhMa+NQc53u0Io62eLtCUX
	JK3uDukf1DJXamtSW7OQ7pU=
X-Google-Smtp-Source: ABdhPJwPB5jMkGoT9yDXEizy7Fui9CezUvQEVICXvn76jRTcCFz+Uq9Q7+k6RgwLq6cVM+k+O8FpNw==
X-Received: by 2002:a05:600c:1553:: with SMTP id f19mr2769712wmg.33.1616589893785;
        Wed, 24 Mar 2021 05:44:53 -0700 (PDT)
Received: from gimli.home (93-48-145-141.ip257.fastwebnet.it. [93.48.145.141])
        by smtp.gmail.com with ESMTPSA id s20sm2324005wmj.36.2021.03.24.05.44.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 05:44:53 -0700 (PDT)
From: Marco Cesati <marcocesati@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	linux-staging@lists.linux.dev
Subject: [PATCH 07/33] Staging: rtl8723bs: remove named enums in rtw_ht.h
Date: Wed, 24 Mar 2021 13:44:30 +0100
Message-Id: <20210324124456.25221-8-marcocesati@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210324124456.25221-1-marcocesati@gmail.com>
References: <20210324124456.25221-1-marcocesati@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the following unnecessary enum names in
include/rtw_ht.h:

	enum aggre_size_e
	enum rt_ht_inf0_capbility
	enum rt_ht_inf1_capbility

Signed-off-by: Marco Cesati <marcocesati@gmail.com>
---
 drivers/staging/rtl8723bs/include/rtw_ht.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_ht.h b/drivers/staging/rtl8723bs/include/rtw_ht.h
index fb321d20d276..e3f353fe1e47 100644
--- a/drivers/staging/rtl8723bs/include/rtw_ht.h
+++ b/drivers/staging/rtl8723bs/include/rtw_ht.h
@@ -37,7 +37,7 @@ struct ht_priv {
 
 };
 
-enum aggre_size_e {
+enum {
 	HT_AGG_SIZE_8K = 0,
 	HT_AGG_SIZE_16K = 1,
 	HT_AGG_SIZE_32K = 2,
@@ -48,7 +48,7 @@ enum aggre_size_e {
 	VHT_AGG_SIZE_1024K = 7,
 };
 
-enum rt_ht_inf0_capbility {
+enum {
 	RT_HT_CAP_USE_TURBO_AGGR = 0x01,
 	RT_HT_CAP_USE_LONG_PREAMBLE = 0x02,
 	RT_HT_CAP_USE_AMPDU = 0x04,
@@ -59,7 +59,7 @@ enum rt_ht_inf0_capbility {
 	RT_HT_CAP_USE_AP_CLIENT_MODE = 0x80,	/*  AP team request to reserve this bit, by Emily */
 };
 
-enum rt_ht_inf1_capbility {
+enum {
 	RT_HT_CAP_USE_VIDEO_CLIENT = 0x01,
 	RT_HT_CAP_USE_JAGUAR_BCUT = 0x02,
 	RT_HT_CAP_USE_JAGUAR_CCUT = 0x04,
-- 
2.30.2

