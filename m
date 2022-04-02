Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com [209.85.167.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3467F1363;
	Sat,  2 Apr 2022 08:51:21 +0000 (UTC)
Received: by mail-oi1-f196.google.com with SMTP id e4so5075299oif.2;
        Sat, 02 Apr 2022 01:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dsvg2OPb+FuOq6QpPd6PmHwu11pbVJX0wlikRs5/Wus=;
        b=RGOfLxghPwV+kPX7AQTR+zDf/CJEWHKRESbsvHUIpiBM6PEga0LCzHFs66cHxpzgKm
         jsvZLVPrNUTRm9n52Qz8RmGluY2lEVgCxoko5jofqv3ei1S9+m9iOOmQuxP8GBZPaxQX
         YCOLiVl9utI4JNC9PuBKgqa6Ynmy5nwIlJloCA+DwI4Pf8n1oWzWz+u0aMfOpLIuRGje
         POK1WBHC+bKlEVFdyqS7U7YsAWSKOnNtTecYR830P3bwcWQCGH8NmZ29MoHBMtTDn/mx
         OORf/gDhMe1uKP0C96pbWUUWdE8WP3ak5JdiTaS5luhJIje71/O4hXJFXhKbm7tUMiMH
         UCaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dsvg2OPb+FuOq6QpPd6PmHwu11pbVJX0wlikRs5/Wus=;
        b=iR6euCXYSzwKu1PCayWNSmqJj8G5CqSnaoNqDYq9S8NKpIPqLAyx3VITuMcRm9QLtk
         x5EnQ29T276SVU8axwenr30rmzAswmbRkPRCv49QhXVhVHla7UXOac5wEJhudlnZZf9F
         +z1kbVkSwoXDbM9vF+qsyDA/p5udAx3XeHg2ObTHLM1fuqVVGgZOmMMlIqM41gBqJrfj
         oh91q1VnXtVUJooJuD01YI5njwfUJhQ68YmkQS5LbXxGXemX0DdF2IoyZ93s9LmCkbut
         4nn2j7fpTN1TXqNyOXclENvmIU/h+RZf0pVPyITUAi4HVfXxgyA5Pei9HxSQqIYYuvtj
         +YWQ==
X-Gm-Message-State: AOAM5336f3USsMIWu+qZktz2ZyXosKVvZfsqqdS+1Os/1f3hfIgn5ODS
	fjrqdBPEvlKDC+B3oSnOx17mCmb7YQTK2w==
X-Google-Smtp-Source: ABdhPJwoPr/yNxlNco+MBnjGbe6z2GYhCoF34vsMysOvLuORVPIv7QjCe6vQqUcHd8o8Nyro437AZw==
X-Received: by 2002:a05:6808:1883:b0:2da:3ed2:68cf with SMTP id bi3-20020a056808188300b002da3ed268cfmr6561466oib.204.1648889480241;
        Sat, 02 Apr 2022 01:51:20 -0700 (PDT)
Received: from bertie (072-190-140-117.res.spectrum.com. [72.190.140.117])
        by smtp.gmail.com with ESMTPSA id q11-20020a4a330b000000b003289cbe97c6sm2057675ooq.13.2022.04.02.01.51.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Apr 2022 01:51:19 -0700 (PDT)
From: Rebecca Mckeever <remckee0@gmail.com>
To: outreachy@lists.linux.dev
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Rebecca Mckeever <remckee0@gmail.com>
Subject: [PATCH 4/6] staging: r8188eu: format block comments
Date: Sat,  2 Apr 2022 03:50:46 -0500
Message-Id: <0387f3df49d89c17acf96cf072e70c98e81e58f7.1648888462.git.remckee0@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <cover.1648888461.git.remckee0@gmail.com>
References: <cover.1648888461.git.remckee0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add ' * ' or ' ' to beginning of block comment lines
to conform to Linux kernel coding style.

Reported by checkpatch:

WARNING: Block comments use * on subsequent lines

Signed-off-by: Rebecca Mckeever <remckee0@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_cmd.c | 29 +++++++++++++-------------
 1 file changed, 14 insertions(+), 15 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_cmd.c b/drivers/staging/r8188eu/core/rtw_cmd.c
index 2e135bbd836a..0c659b40aa1c 100644
--- a/drivers/staging/r8188eu/core/rtw_cmd.c
+++ b/drivers/staging/r8188eu/core/rtw_cmd.c
@@ -12,9 +12,9 @@
 #include "../include/rtl8188e_dm.h"
 
 /*
-Caller and the rtw_cmd_thread can protect cmd_q by spin_lock.
-No irqsave is necessary.
-*/
+ * Caller and the rtw_cmd_thread can protect cmd_q by spin_lock.
+ * No irqsave is necessary.
+ */
 
 static int _rtw_init_cmd_priv(struct cmd_priv *pcmdpriv)
 {
@@ -97,14 +97,13 @@ static void _rtw_free_cmd_priv(struct cmd_priv *pcmdpriv)
 }
 
 /*
-Calling Context:
-
-rtw_enqueue_cmd can only be called between kernel thread,
-since only spin_lock is used.
-
-ISR/Call-Back functions can't call this sub-function.
-
-*/
+ * Calling Context:
+ *
+ * rtw_enqueue_cmd can only be called between kernel thread,
+ * since only spin_lock is used.
+ *
+ * ISR/Call-Back functions can't call this sub-function.
+ */
 
 static int _rtw_enqueue_cmd(struct __queue *queue, struct cmd_obj *obj)
 {
@@ -319,10 +318,10 @@ int rtw_cmd_thread(void *context)
 }
 
 /*
-rtw_sitesurvey_cmd(~)
-	### NOTE:#### (!!!!)
-	MUST TAKE CARE THAT BEFORE CALLING THIS FUNC, YOU SHOULD HAVE LOCKED pmlmepriv->lock
-*/
+ * rtw_sitesurvey_cmd(~)
+ *	### NOTE:#### (!!!!)
+ *	MUST TAKE CARE THAT BEFORE CALLING THIS FUNC, YOU SHOULD HAVE LOCKED pmlmepriv->lock
+ */
 u8 rtw_sitesurvey_cmd(struct adapter  *padapter, struct ndis_802_11_ssid *ssid, int ssid_num,
 	struct rtw_ieee80211_channel *ch, int ch_num)
 {
-- 
2.32.0

