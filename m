Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC6D73FC0
	for <linux-staging@lists.linux.dev>; Sat, 18 Sep 2021 09:58:00 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id s24so9132906wmh.4
        for <linux-staging@lists.linux.dev>; Sat, 18 Sep 2021 02:58:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=G3L7UCaBvWad8+27dGs+IVJ3mC7af2HpF3EaDWIxm5w=;
        b=duqVs66A83TsK8E3/YGRQqAq4WCnVULKCjVZjsBs36npCIIXbt6dZUy7PbokWqbzuM
         Ezllb9BrRpvJJA/0P82KKR0jC2Oa1gGH9GPGntXTYsxa/374jffhD7MxrIOEYq3xISwn
         ZVfrYVnesqKATSiTWi7yfo7+rm0ONuRSSHdGzsK8dib1Wkr7UKu4efBqzxQiuQjv7uFM
         qAeNnU+dgtIcEBi800gEj0/0HRkmYfkPTrkMsPF5NsOjdqQpJ4XAHkF0wuaUjBbaWbx5
         JMiFWDzUP1CQRP5nEsmx3AwLha1e+JwAgzZx9TfbQuRIr0cxxBN8cmda92dtlbzQ2y+T
         ASfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=G3L7UCaBvWad8+27dGs+IVJ3mC7af2HpF3EaDWIxm5w=;
        b=fLOP3GZm7s9lGbC7SJvYW19pdjujhcZtc8LUhWNM8cQoA2dvYJbL+VZIOoCW6BVrXK
         wyNsWwYJJAqqQaEwDpzA3txZEWbv47uN8gnxpvZSGrlV4T503W9Uq0FsUFxoAyUKp4gN
         zFX/Qev62chuaN8D/X29Hj9Cxbij0Felh1PM4grSYa4CIETyv6SmFAVwwCT6vieLhjA3
         lq2lGtB5RazvnDztxnHK2sX/WYRuUChdjNlAonaIKTK2uPbl4KSd2c1f+ObqQ9cQfUdL
         C36MUZ/g00F/GotoIX21eLBtbyLQ+K5FWCZgT/Joa+UNQoFKRpatU9KlbWVZQeJ6aUfh
         U3IA==
X-Gm-Message-State: AOAM531iSYp3hj7CthFgk0HR9JPVfwwr/zblpzcneh6irGxyLe+oFPa5
	zHyj1Y/D7LYOUToe7Hphuzw=
X-Google-Smtp-Source: ABdhPJxhHDNMxpVa0IF16fDZRjZGH4ydTY9Y45cD7TMUUU3PRlnxouDadSXEbvYkcvRQONdbpXBWEA==
X-Received: by 2002:a7b:c107:: with SMTP id w7mr14878939wmi.91.1631959079212;
        Sat, 18 Sep 2021 02:57:59 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::ae40])
        by smtp.gmail.com with ESMTPSA id o26sm13013287wmc.17.2021.09.18.02.57.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Sep 2021 02:57:58 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 4/8] staging: r8188eu: remove unused struct rf_shadow
Date: Sat, 18 Sep 2021 11:57:23 +0200
Message-Id: <20210918095727.13591-5-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210918095727.13591-1-straube.linux@gmail.com>
References: <20210918095727.13591-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unused struct rf_shadow.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/rtl8188e_rf6052.c | 21 -------------------
 1 file changed, 21 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/rtl8188e_rf6052.c b/drivers/staging/r8188eu/hal/rtl8188e_rf6052.c
index 2fffe42e97c0..2dcfbb008914 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_rf6052.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_rf6052.c
@@ -29,27 +29,6 @@
 #include "../include/drv_types.h"
 #include "../include/rtl8188e_hal.h"
 
-/*---------------------------Define Local Constant---------------------------*/
-/*  Define local structure for debug!!!!! */
-struct rf_shadow {
-	/*  Shadow register value */
-	u32 Value;
-	/*  Compare or not flag */
-	u8 Compare;
-	/*  Record If it had ever modified unpredicted */
-	u8 ErrorOrNot;
-	/*  Recorver Flag */
-	u8 Recorver;
-	/*  */
-	u8 Driver_Write;
-};
-
-/*---------------------------Define Local Constant---------------------------*/
-
-/*------------------------Define global variable-----------------------------*/
-
-/*------------------------Define local variable------------------------------*/
-
 /*-----------------------------------------------------------------------------
  * Function:    PHY_RF6052SetBandwidth()
  *
-- 
2.33.0

