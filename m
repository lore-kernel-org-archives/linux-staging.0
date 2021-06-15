Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6472A72
	for <linux-staging@lists.linux.dev>; Tue, 15 Jun 2021 11:45:44 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id ba2so48897480edb.2
        for <linux-staging@lists.linux.dev>; Tue, 15 Jun 2021 04:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7jrpi+t4sVD1nYvrQmw+SBUyW0PXTVnWtUAU8H138ng=;
        b=FG53mXxub3xZBLj0vJOM1Ndtjrx1Hr8RSDgtXWMdP2zav657MXOBB06v/0bbfBX+zv
         BgzphCXrpJmZNu9i71RtsjLN8sQa1MTHtajSoHKGvMXHiVYhRe8UO30XiGswpxrcc9GJ
         ruljlLy5n/TlWdboufAxTQB3tRDU8H+sA3x5MiocLtfYDuS3VDmLb0WtJ0osCTUghMmL
         wB6fiiEEoyzfXTV+hNcP9kxqbQFU5yCa/DJ6tprN8l3lwYVxWhwhsQkMAwxVqYVvHr2f
         PDP9KM2+3tHR7/tx0xFQFWx+xakjZzoVAvofT/kh+E2YekLv1Vqcj4injPBfT6SLCZOF
         EIYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7jrpi+t4sVD1nYvrQmw+SBUyW0PXTVnWtUAU8H138ng=;
        b=AePrtt5TYkmmxWgSFNpZDfRt6lgnn3kl38rp5mGB4K91Ll3iU4ULuwPBiNRJMsqnUf
         HZ/Fu2+NRzHySUp7ORFmij/Z92/7B0k143DVH20lLoLOn9pylft8zyVYCH8Ew2q33GYH
         Q3CtVS2Xpdd0yILh31GcTEoONmMwcOHi6ll8BRvfoEvRhShiBpLPDfiZi4vUX1OdkDv0
         RKsvXYLiORiZYnBf7KqxlLOJ8hEUqpbwQ7w7bkOTjh9hk86jfIsICjojenT4qnr/Pw6B
         TkDxRecjyHLmWH4Dv42aUacl6VhA06th84APKe1GMqwJlesbwSc453j3ywM66+IHrvOo
         XbLw==
X-Gm-Message-State: AOAM533zjh5tQygwwvzKAym90H2Cnidrahmuzuu1u5cxuabtrzawurxj
	GwV0mV8SJLyTaFhsbmsS6jE=
X-Google-Smtp-Source: ABdhPJxK4PT9BOtXrU8Y9e5VHM1CGzwOmSRj37nkLhrzJkzNPPGpgptmWdiYoKMTzoDLUHAwUI9xpQ==
X-Received: by 2002:a05:6402:14d5:: with SMTP id f21mr23544838edx.307.1623757543071;
        Tue, 15 Jun 2021 04:45:43 -0700 (PDT)
Received: from agape ([5.171.72.142])
        by smtp.gmail.com with ESMTPSA id w17sm9952726ejk.112.2021.06.15.04.45.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jun 2021 04:45:42 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/8] staging: rtl8723bs: remove unneeded comments
Date: Tue, 15 Jun 2021 13:45:32 +0200
Message-Id: <4c1ea0e7ddceebba1afe1485662c204db5dfa9c7.1623756906.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1623756906.git.fabioaiuto83@gmail.com>
References: <cover.1623756906.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove unneeded comments in include/autoconf.h

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/include/autoconf.h | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/autoconf.h b/drivers/staging/rtl8723bs/include/autoconf.h
index aeb9479d1327..4b2cf86b8aa4 100644
--- a/drivers/staging/rtl8723bs/include/autoconf.h
+++ b/drivers/staging/rtl8723bs/include/autoconf.h
@@ -4,15 +4,6 @@
  * Copyright(c) 2007 - 2012 Realtek Corporation. All rights reserved.
  *
  ******************************************************************************/
-
-/*
- * Automatically generated C config: don't edit
- */
-
-/*
- * Functions Config
- */
-
 #ifndef CONFIG_WIRELESS_EXT
 #error CONFIG_WIRELESS_EXT needs to be enabled for this driver to work
 #endif
@@ -39,6 +30,3 @@
  * Platform dependent
  */
 #define WAKEUP_GPIO_IDX	12	/* WIFI Chip Side */
-
-/* define DBG_XMIT_BUF */
-/* define DBG_XMIT_BUF_EXT */
-- 
2.20.1

