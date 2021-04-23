Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05B722FA1
	for <linux-staging@lists.linux.dev>; Fri, 23 Apr 2021 14:59:01 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id z6so8397137wmg.1
        for <linux-staging@lists.linux.dev>; Fri, 23 Apr 2021 07:59:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EXy+IJQRVDR3sYe4/6l8EGuC3E4LyBPWu4+9MmcXFm8=;
        b=H+WtiIRvwNbzkw/+dTERd3TXZBOyJZ7z8tt92shh/Bm5qfMSIkpBeQwzSxrevg5IrL
         UdT6yCECljn4RkI/qHkzXQQS+bR7ml32EqYGv0c3CDAw2J32hAaYyp5sBC7Zh07ReQBs
         cyqEQEPYZ09XTYQ0+iSk3fAKfuhVWdkyDhk+df1pmidi+eq1/0B9A161I8D23266aeQ5
         DEDPvTqnQmkWSihI+HeePUUCeE0/ySApS5z5d9dbFLWkLLiUmnjdGZ7D8RvwO5dNoAAq
         VqjPyyEZzRvnje7rDPuryMwh1QQG4R07zdWzAhQSJCa5kP+WoCT91X/nMfI6Mmpehnga
         TSUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EXy+IJQRVDR3sYe4/6l8EGuC3E4LyBPWu4+9MmcXFm8=;
        b=DAisOr4s0Czvg9/lan/kbDBHI8yiOrP0wK9W1bkMr3HIPWKq3TIPT8nCde9bUeNVFv
         fSidgLKf9I39plVWBpVVsXvTRmg/BURUp6hrPOMXfs3NguksAQYvmuY6NdsamH62jur8
         +wq5Q6OjI/3we50/FTSlYzVbpQH5IGMDIXscq8e/uTPzQmldOPBv6CniY/4j7oQQJTff
         TzkyNr0Um6Re1rtvMESVRlstG/KOK8ytcyAEX+NcJbYGShnGCzKHM/4MP9Gru9ArnI78
         YpZ5JzKk3eAH4LozjziX2hs5Yblh+pAZet9cauiBC0MYvyeKN36KOeFRvV5mK6Jm/meF
         1Hfg==
X-Gm-Message-State: AOAM531pgoXG/c2TPoCzDRCqZarCiYofnP50Ocwyom7wqP4caeKWdl8j
	19wSAZosdtXfNKOwK1ozbuM=
X-Google-Smtp-Source: ABdhPJxPIU0EF9AqLbCzh5mh7Gh1ia8X4cRyCAPwnG3iYpwPfYbvnpSUBjJ+mkgkGAh6vqkl9WMidw==
X-Received: by 2002:a05:600c:3790:: with SMTP id o16mr4743289wmr.174.1619189939707;
        Fri, 23 Apr 2021 07:58:59 -0700 (PDT)
Received: from agape ([5.171.72.99])
        by smtp.gmail.com with ESMTPSA id z17sm9552436wro.1.2021.04.23.07.58.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Apr 2021 07:58:59 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 11/49] staging: rtl8723bs: remove unneeded header file
Date: Fri, 23 Apr 2021 16:58:02 +0200
Message-Id: <e57a0c829c5bb83e7a58887b3720e454770340f3.1619189489.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1619189489.git.fabioaiuto83@gmail.com>
References: <cover.1619189489.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove unneeded header file.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/include/rtw_debug.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_debug.h b/drivers/staging/rtl8723bs/include/rtw_debug.h
index 579724e8fc2f..acf4deacd3a7 100644
--- a/drivers/staging/rtl8723bs/include/rtw_debug.h
+++ b/drivers/staging/rtl8723bs/include/rtw_debug.h
@@ -7,8 +7,6 @@
 #ifndef __RTW_DEBUG_H__
 #define __RTW_DEBUG_H__
 
-#include <linux/trace_seq.h>
-
 #define _drv_always_		1
 #define _drv_emerg_			2
 #define _drv_alert_			3
-- 
2.20.1

