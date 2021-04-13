Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BEA471
	for <linux-staging@lists.linux.dev>; Tue, 13 Apr 2021 14:10:51 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id p6so9907700wrn.9
        for <linux-staging@lists.linux.dev>; Tue, 13 Apr 2021 07:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KltcSRDP7X3Yfu3VWFhrzHyopiix35MMmWdtK3KZ1EE=;
        b=CRgfq8FTkXFHrs5B9IshafQuRK7Z+orJ77vQ+QoJo4K+N8ZAyL9wGghM1YsYgBeapq
         Cihil2w6hTs3oJKbzuL2gs1ioGaMM0RKYeMI+7XOtvbIzrGRefF5sRf3s2JU35kvkNX5
         bOkI4Z6jf0o+ELdBR94AAGImgB78ThNLe5tMBVQ1Dd/ZwETXxblZXNfjMbZYWjD8jzyf
         ZWaYQoTJhjS2bv0bTuSnefvOu7P0kNbJx6k+sa2uI6KFGnUIy+0LcDbohJ3+yOz88NMb
         6cUTWILTIVOK2wgyzHrUncqOxbHu8ih5fl8WrOt9s2RK6UmMvlBpGnYLM4A9FWqED1sN
         iN+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KltcSRDP7X3Yfu3VWFhrzHyopiix35MMmWdtK3KZ1EE=;
        b=a2IIXqdUDZTwd6gUmMszwTm8ph0PjVcunNnKIz3IPsIDelIFGVACHIo3U1inwEoI4e
         JFo//U7wEPlmdn/IkceLxUS7EW2mNsrcncQghDIbcqZhMludjrTzE92FGdzyHIkX4AhF
         Jqs18BcHZTD81FPVrrLkwO3ZKn5hh/n3lmnPy0sVbG0p+0LXKkEpUaC2M1K9STa4jHbK
         6jCOxPtegKUBh2aISsNAbUq9xQO10OjdDO+fxMawKUxw2gtNNr2DbOW9Z+aLMyCm85Io
         bF2tlEYL+tCSjafjUEXXHciaFwflSuRVHdNHgpWSYw3f6RWHu98udnlj2TOdkZ0itKXD
         EONg==
X-Gm-Message-State: AOAM533ZA2qoAUwx8YFlRQlQ9r2zj8MQosWlh7Yx5jTV3Hrj3n0K1XrT
	qPbl6jWp572Jg1W7OsDzX88=
X-Google-Smtp-Source: ABdhPJxbByITxA1Mm1H0RKdUh+zCeKbEJVVFVdAEsWGFWd78HtlSBmBlIGoeHujOzKeRrMdNRKJV5w==
X-Received: by 2002:a5d:6d0f:: with SMTP id e15mr36634018wrq.218.1618323050179;
        Tue, 13 Apr 2021 07:10:50 -0700 (PDT)
Received: from agape ([5.171.81.171])
        by smtp.gmail.com with ESMTPSA id m15sm19392261wrp.96.2021.04.13.07.10.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Apr 2021 07:10:49 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: 
Cc: julia.lawall@inria.fr,
	joe@perches.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/7] staging: rtl8723bs: remove two unused functions
Date: Tue, 13 Apr 2021 16:10:38 +0200
Message-Id: <4d241b4cbc0c081a1d31d615b5069a223b2b7e7b.1618322367.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1618322367.git.fabioaiuto83@gmail.com>
References: <cover.1618322367.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove dump_drv_version() and dump_log_level() function
definitions and prototypes.

These two functions incapsulate DBG_871X_SEL_NL macro which
does a raw printk call (something to avoid in a driver).
The DBG_871X_SEL_NL seq_printf usage
is never triggered. So we remove dump_drv_version() which
is no more used and dump_log_level() which was never used.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_debug.c    | 10 ----------
 drivers/staging/rtl8723bs/include/rtw_debug.h |  3 ---
 2 files changed, 13 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_debug.c b/drivers/staging/rtl8723bs/core/rtw_debug.c
index d3ee7b7f6fde..324c7e5248f8 100644
--- a/drivers/staging/rtl8723bs/core/rtw_debug.c
+++ b/drivers/staging/rtl8723bs/core/rtw_debug.c
@@ -14,16 +14,6 @@ u32 GlobalDebugLevel = _drv_err_;
 
 #include <rtw_version.h>
 
-void dump_drv_version(void *sel)
-{
-	DBG_871X_SEL_NL(sel, "%s %s\n", "rtl8723bs", DRIVERVERSION);
-}
-
-void dump_log_level(void *sel)
-{
-	DBG_871X_SEL_NL(sel, "log_level:%d\n", GlobalDebugLevel);
-}
-
 void sd_f0_reg_dump(void *sel, struct adapter *adapter)
 {
 	int i;
diff --git a/drivers/staging/rtl8723bs/include/rtw_debug.h b/drivers/staging/rtl8723bs/include/rtw_debug.h
index 7747e90bd1cc..f1b37d511f27 100644
--- a/drivers/staging/rtl8723bs/include/rtw_debug.h
+++ b/drivers/staging/rtl8723bs/include/rtw_debug.h
@@ -192,9 +192,6 @@
 
 #endif /* defined(_dbgdump) */
 
-void dump_drv_version(void *sel);
-void dump_log_level(void *sel);
-
 void sd_f0_reg_dump(void *sel, struct adapter *adapter);
 
 void mac_reg_dump(void *sel, struct adapter *adapter);
-- 
2.20.1

