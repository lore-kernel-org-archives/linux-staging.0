Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 425B870
	for <linux-staging@lists.linux.dev>; Sat, 27 Mar 2021 14:24:57 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id k8so8393703wrc.3
        for <linux-staging@lists.linux.dev>; Sat, 27 Mar 2021 07:24:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=W9EXnh/EfbGVwvr6MY60PRrODm9ziLDg93tkWyqzj3g=;
        b=ZA5EGu0ud2zEnuChU6hbdGDHPlPcTMKVLai9ZEbicfP2ug/TgPfTtXGi2UTT7zFGk/
         OakhYOwBFuFpjakEEmukq0JCFY57WfzPGhUnzd3nGNyZxLsjV+qqZgpYNIFhWvz1/rcR
         B8f00qYGitLlPWEF/SHyUZBQy/jcL0YQGSM70m3JtQzu8cq+8gX0Yb+FQ2E5IavJdC45
         mLkuJ4+EmAUSYiCN4nMkUlvWo4sUD9mHTfGrc2eWgI/tM8tUE4fvM473UBV1A2tpnZRr
         5bpxZIFvs2o8Rdcc3EsDSUp5fCjmcYsJ0wZcDlGLQuslqpScPeswPIaxzEYbPdr3MwMU
         WXLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=W9EXnh/EfbGVwvr6MY60PRrODm9ziLDg93tkWyqzj3g=;
        b=SVdIVVIHr+gE+AuOaWJGmWae9Nw/j6AMZ5TjKHqRrdVKWCi2df4uKItsk/zh4CX22r
         guRa0pe43BGL4MNgoHF6/Y1zLkUKAneRXLXge9g+ia2+gSWhaWnleEZs81ySwrnB+ISq
         VuBbmE/4lqobWNTt6nW7NEdAHRIb1yXX4fgmVT1QS+NqWtRM74l19GM8TmWTwrHaR27e
         nKRNUnGZWizDbWmVsLMG2AlLzE08ilH8GLXGlEkuNqe8tOR20vvYd8xGJlT+xvIo0io+
         tH4i6XgqZ1qY/TLTi0qYgqW+c9AID4Hbsx8YpfYwKih00GhLQMEYtv5fqPUiTOpdZjs6
         KZIw==
X-Gm-Message-State: AOAM532ZdGTq8xGgwkYZ88siInU6SAdCMVic3ysNdVbz3Ex+8L6N/PuA
	nMHgRj6a+YFu72wYm5R4KiE=
X-Google-Smtp-Source: ABdhPJymKO2w3lHlkqq+xhsTS2wnQh8r5q2m5GXpR5Tij5oLkjE5xc7nRDB4SjGacK8shEK0mL/Vdw==
X-Received: by 2002:a5d:58fc:: with SMTP id f28mr10776643wrd.180.1616855095899;
        Sat, 27 Mar 2021 07:24:55 -0700 (PDT)
Received: from agape ([151.46.211.242])
        by smtp.gmail.com with ESMTPSA id t8sm20164012wrr.10.2021.03.27.07.24.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Mar 2021 07:24:55 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@oracle.com,
	david.laight@aculab.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH v2 07/20] staging: rtl8723bs: add spaces around operators in include/hal_data.h
Date: Sat, 27 Mar 2021 15:24:06 +0100
Message-Id: <4186cc811caa92fe0625d06b3803e73f424059a6.1616854134.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1616854134.git.fabioaiuto83@gmail.com>
References: <cover.1616854134.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

add spaces around operators in a macro

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/include/hal_data.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/include/hal_data.h b/drivers/staging/rtl8723bs/include/hal_data.h
index 655528ab8c7c..df5c7b747498 100644
--- a/drivers/staging/rtl8723bs/include/hal_data.h
+++ b/drivers/staging/rtl8723bs/include/hal_data.h
@@ -46,7 +46,7 @@ enum rt_ampdu_burst {
 	RT_AMPDU_BURST_8723B	= 7,
 };
 
-#define CHANNEL_MAX_NUMBER		(14+24+21)	/*  14 is the max channel number */
+#define CHANNEL_MAX_NUMBER		(14 + 24 + 21)	/*  14 is the max channel number */
 #define CHANNEL_MAX_NUMBER_2G		14
 #define CHANNEL_MAX_NUMBER_5G		54			/*  Please refer to "phy_GetChnlGroup8812A" and "Hal_ReadTxPowerInfo8812A" */
 #define CHANNEL_MAX_NUMBER_5G_80M	7
-- 
2.20.1

