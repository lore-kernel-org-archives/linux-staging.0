Received: from mail-oa1-f67.google.com (mail-oa1-f67.google.com [209.85.160.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 474D817FB;
	Wed,  6 Apr 2022 08:31:19 +0000 (UTC)
Received: by mail-oa1-f67.google.com with SMTP id 586e51a60fabf-df02f7e2c9so2138387fac.10;
        Wed, 06 Apr 2022 01:31:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CbQxzsG90z/JAl+WL+UN3YQnw6GKHPn4W6/z3zTcYNI=;
        b=bDK9rgrwMdYaTfZncsYLB1OVeHWvUHfcWrQ29VZ53/xLdP9LJ/OUGh0tLfPFxFFQai
         2xffbgBMJ0tckWZWmopgZS1PXHBHn8STAgZA4Hs0m3IGNqNDPd9u7tIzJ0mC3gVtrzbT
         yU6RIx91qw4kbbOcSni4Vy8hOCVbyKPnQZx5v1PghB8gkpf9A5z1WK7ZZOrOCNeeu2nS
         AolCaBhaYTvWEJOOVNa0ifJGteo17plWdV8adfWQGFzOq9ko1ZrnmYlwUuUxDZpdIEEo
         3AXQaLsqUVQwvNpxFVFLasmTbCIasrvyxMa/B9iwL+tZXrCyHXqYdc5456WvTaQx1T+V
         +o8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CbQxzsG90z/JAl+WL+UN3YQnw6GKHPn4W6/z3zTcYNI=;
        b=FnHEysyCpTlS6dYWP5FDHcvh6lYn8VRoduaR6ezxLKJEl94/Ut+8lv1fXp8guIE2pX
         JaR4oraLZ6j+m9KxsKdbJ+L4Qga4BuCWgHbYZQHUa18Kf3jEMcMtIA7j5sLo0+rtKGn1
         r8K0vliA7q16BhpcM58E629gmPE+UYUPVQsLXQqje/2kFaRpCRo9/aDR3q6ikyu/RZeX
         x0jnTwj087Q9/347H49Wijn+EphWJ8D9mV3SPqVilotFBXtM8I9QlGGTjZM73H1kxOkk
         i/iRcwYJ3oLr+np29Pyz9uM97KCzLSn/ZFr/L2FIZUg5ikaGAZHZ1k/rQd3/aA0k8N3D
         cjQQ==
X-Gm-Message-State: AOAM530D51JftoittCAoG+N3tRAewpQKDLYgRk/HKAgRr4x7oxvDBwEl
	iu5Zwm3N6hw3EHz7J00Uzgw=
X-Google-Smtp-Source: ABdhPJzeu6rL8xM16P/CSl2BL/IvijdU41KyHbFI7UbHBlymYBFyb1IXHhHDomzTCEjCCDRTNA5u6Q==
X-Received: by 2002:a05:6870:610d:b0:e1:f70a:9e8a with SMTP id s13-20020a056870610d00b000e1f70a9e8amr3517070oae.120.1649233878429;
        Wed, 06 Apr 2022 01:31:18 -0700 (PDT)
Received: from bertie ([172.58.102.145])
        by smtp.gmail.com with ESMTPSA id n6-20020a9d6f06000000b005b266e43c92sm6534725otq.73.2022.04.06.01.31.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Apr 2022 01:31:18 -0700 (PDT)
From: Rebecca Mckeever <remckee0@gmail.com>
To: outreachy@lists.linux.dev
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Rebecca Mckeever <remckee0@gmail.com>
Subject: [PATCH 1/4] staging: r8188eu: format comments in drivers/net style
Date: Wed,  6 Apr 2022 03:30:57 -0500
Message-Id: <bd7960acafb871c17ef733cd98b37294f38ad3fb.1649233201.git.remckee0@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <cover.1649233201.git.remckee0@gmail.com>
References: <cover.1649233201.git.remckee0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Format comments according to the Linux kernerl coding style
for drivers/net so they do not need to be reformatted after
this driver is accepted into the drivers/net tree.

Suggested-by: Larry Finger <Larry.Finger@lwfinger.net>
Signed-off-by: Rebecca Mckeever <remckee0@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_cmd.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_cmd.c b/drivers/staging/r8188eu/core/rtw_cmd.c
index 9b53b92c6795..9f5ece52bd39 100644
--- a/drivers/staging/r8188eu/core/rtw_cmd.c
+++ b/drivers/staging/r8188eu/core/rtw_cmd.c
@@ -11,8 +11,7 @@
 #include "../include/rtw_mlme_ext.h"
 #include "../include/rtl8188e_dm.h"
 
-/*
- * Caller and the rtw_cmd_thread can protect cmd_q by spin_lock.
+/* Caller and the rtw_cmd_thread can protect cmd_q by spin_lock.
  * No irqsave is necessary.
  */
 
@@ -96,8 +95,7 @@ static void _rtw_free_cmd_priv(struct cmd_priv *pcmdpriv)
 	}
 }
 
-/*
- * Calling Context:
+/* Calling Context:
  *
  * rtw_enqueue_cmd can only be called between kernel thread,
  * since only spin_lock is used.
@@ -317,8 +315,7 @@ int rtw_cmd_thread(void *context)
 	return 0;
 }
 
-/*
- * rtw_sitesurvey_cmd(~)
+/* rtw_sitesurvey_cmd(~)
  *	### NOTE:#### (!!!!)
  *	MUST TAKE CARE THAT BEFORE CALLING THIS FUNC, YOU SHOULD HAVE LOCKED pmlmepriv->lock
  */
-- 
2.32.0

