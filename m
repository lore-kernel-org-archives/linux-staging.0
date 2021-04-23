Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C962C2FA1
	for <linux-staging@lists.linux.dev>; Fri, 23 Apr 2021 14:58:57 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id h4so39663165wrt.12
        for <linux-staging@lists.linux.dev>; Fri, 23 Apr 2021 07:58:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9vp7TMpUXQWMqR3/UFW+ck6WgnuYX1oYQ9RhzEKAEBI=;
        b=F9Ury378KBUIEdGTqlKjeKYIrNEICi2NQdglru8UgdUZGvdK4jEXflSrT4WSa5A5Z2
         gANOfwTPcN1xtrHZs9MrZ0V+hosr3MGCEbueml2O9BGyXS+fvXpi4spsj9S2PofBdDpF
         UpeP+uY7kL1aRMwiHCHe4tT4ex4UspHuhq5Jl2FnTFoEUG1xYtkjk/MIbyKxWDGYj7uf
         qC0b3zO3/+qekB9B0iUu2REQoAcpWf5TzmWIIuJqXubscgYlNbn5wVUKFe2U8RT72DHM
         KrVVxvol9j9+km5+6oNkekDO6OiBQgVAdJd1zBYIrR2bohVIROzyunIrVEDFRc2yKEGK
         MeLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9vp7TMpUXQWMqR3/UFW+ck6WgnuYX1oYQ9RhzEKAEBI=;
        b=g8cp4HGXNnwHiFVR78lKF2acJS3TTZgO3ZtCsDIj+cX5fcXy0A3x/cv46qDrEBAJK0
         kJJRTQhi/OePj537dJvtzasf+XkZoPn1nCk3ljSvHfyHMFxbKgZuXac5XRufQak/dTX7
         jWtuYrpEdEsIDUCa0eANRqxcjpJn8K0H92YcuJdQA2hfdLHPpQ7kUBa8+ypB4Wt+6w/o
         FfP+TXUbLuQNl69D2z8SwahEAvtIxVy0GMMsrXedJ80gJykqFLFeAu2HMVVY4K7LituS
         Pjf0Yyutsd9wu10GBV+dxfP+AJQACjqhmHeeAvyFBw7GGxQKty46gJR813mC+etC4cBQ
         Wf4w==
X-Gm-Message-State: AOAM5304qMGDwXGg/TSSr9UOT5axJZ0tdNAFtnnF26cvoq5XaEbVSlwr
	syHfkFYFqQ+kTYN9ftpooKlpVNM6GJI=
X-Google-Smtp-Source: ABdhPJxDjD0T4qfYoGMZ8KqqRWFpercu8+Z+ZrEIOD72JHhHMJnsdsnT/8UfRQxHmx0/XxZvz3eWVQ==
X-Received: by 2002:adf:e607:: with SMTP id p7mr5199119wrm.381.1619189936471;
        Fri, 23 Apr 2021 07:58:56 -0700 (PDT)
Received: from agape ([5.171.72.99])
        by smtp.gmail.com with ESMTPSA id s14sm9045432wrm.51.2021.04.23.07.58.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Apr 2021 07:58:56 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 09/49] staging: rtl8723bs: remove all defs related to _dbgdump macro
Date: Fri, 23 Apr 2021 16:58:00 +0200
Message-Id: <666e88b9ef847519a5731c9b4ef18def6d4a2933.1619189489.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1619189489.git.fabioaiuto83@gmail.com>
References: <cover.1619189489.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove obsolete _dbgdump macro definition, undef and
empty conditional code block.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/include/rtw_debug.h | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_debug.h b/drivers/staging/rtl8723bs/include/rtw_debug.h
index c7e8187ca7f5..2232a1014528 100644
--- a/drivers/staging/rtl8723bs/include/rtw_debug.h
+++ b/drivers/staging/rtl8723bs/include/rtw_debug.h
@@ -131,21 +131,13 @@
 	#define	_MODULE_DEFINE_	_module_efuse_
 #endif
 
-#undef _dbgdump
-
 #ifndef _RTL871X_DEBUG_C_
 	extern u32 GlobalDebugLevel;
 	extern u64 GlobalDebugComponents;
 #endif
 
-#define _dbgdump printk
-
 #define DRIVER_PREFIX "RTL8723BS: "
 
-#if defined(_dbgdump)
-
-#endif /* defined(_dbgdump) */
-
 void mac_reg_dump(struct adapter *adapter);
 void bb_reg_dump(struct adapter *adapter);
 void rf_reg_dump(struct adapter *adapter);
-- 
2.20.1

