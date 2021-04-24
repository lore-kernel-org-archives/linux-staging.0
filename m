Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47D1E71
	for <linux-staging@lists.linux.dev>; Sat, 24 Apr 2021 09:02:45 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id r7so38680899wrm.1
        for <linux-staging@lists.linux.dev>; Sat, 24 Apr 2021 02:02:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vK3QxmyEJ/kAAhKM5dk61kp8P7/wFJS5mqiWEFDpYHk=;
        b=aSqkcTD1MBNSxHVEflx3Cc2Ng72YamIFkOHC6F1H6VNu+T1pu1sidBhjvWc2t4YcB1
         TAONYeh7YNW2EqS7ZHKfvdZJIxYukcX2hknimdr7J8ropJWhDcV5ibv8ZL7FIDrW28bI
         mLKHxS77tflgRx46VHpaIDW0a3PJTacoctIFgR3asPn4XkJt9umb1HCRYDVHb5yr/eGz
         q6wUwRaGTvKj28WnuRgFUgs7PQ4ygSS1hPFkI8MhGOc7QP/mMOK/Euj8vzqGi5LM9xk1
         zns+OoKktUXOstmXqpXSatS/06S993fHeaC2i3HU8e/ZwzDv7Cewf+zZtAJRrBi+3G4H
         abHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vK3QxmyEJ/kAAhKM5dk61kp8P7/wFJS5mqiWEFDpYHk=;
        b=P2jIRpHue4aDJQGt1LaEp/RmJy1kCKrT8oxVurJvJxTUhURKKFKOUWu+CnsGlh0TSA
         fDQALcs22P16PI5wlHtHB9WJzcNTMB0UegOwkJstcEHB1YqI31VFl7Wn9/xblPAYfxAz
         mF3yPUz0EqURcaomtWwTcLMuqc0KcTxpxjswfn4tiPNnL/pRL+E+H0yZeVlMj0N2cNML
         v+YU1go74D7OR32GeWay2x518rzbRysLpjTcddoHdv5J3LDff05YCnzgTd1iZbVwiC4b
         C7srIncLLQNrcSh+eISITY3EWjaTgAvHlRtZnEnhAGEg6j/jS2LsyCl8s611Qd6YGo9G
         rA+g==
X-Gm-Message-State: AOAM530j6YCUs0H+O1Ms7KH7iTHG3ReRMTs5PekgjSpEpXdC/Ok+yMS6
	/3tATsp3lfuK+16nrgQ2HYs=
X-Google-Smtp-Source: ABdhPJzTzbWqAjrG6MtNiFLG4UcKdH2q1gkOWLaE0PNBKxP5xzls41Av6F9KFM0D3TJrrJgHw0SSlA==
X-Received: by 2002:adf:ef8b:: with SMTP id d11mr9619707wro.107.1619254963938;
        Sat, 24 Apr 2021 02:02:43 -0700 (PDT)
Received: from agape ([5.171.80.252])
        by smtp.gmail.com with ESMTPSA id b14sm12556480wrf.75.2021.04.24.02.02.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Apr 2021 02:02:43 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: joe@perches.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 05/50] staging: rtl8723bs: remove unused _DBG_871X_LEVEL macro
Date: Sat, 24 Apr 2021 11:01:48 +0200
Message-Id: <83ff6acd438ad2107a9a1c9446cabb22a6c77f0a.1619254603.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1619254603.git.fabioaiuto83@gmail.com>
References: <cover.1619254603.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove unused _DBG_871X_LEVEL macro,
after DBG_871X_SEL deletion.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/include/rtw_debug.h | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_debug.h b/drivers/staging/rtl8723bs/include/rtw_debug.h
index fbae0d3b168c..fdd5933a3d5a 100644
--- a/drivers/staging/rtl8723bs/include/rtw_debug.h
+++ b/drivers/staging/rtl8723bs/include/rtw_debug.h
@@ -144,18 +144,6 @@
 
 #if defined(_dbgdump)
 
-/* without driver-defined prefix */
-#undef _DBG_871X_LEVEL
-#define _DBG_871X_LEVEL(level, fmt, arg...)	   \
-	do {\
-		if (level <= GlobalDebugLevel) {\
-			if (level <= _drv_err_ && level > _drv_always_) \
-				_dbgdump("ERROR " fmt, ##arg);\
-			else \
-				_dbgdump(fmt, ##arg);\
-		} \
-	} while (0)
-
 #define RTW_DBGDUMP NULL /* 'stream' for _dbgdump */
 
 #endif /* defined(_dbgdump) */
-- 
2.20.1

