Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E2D83FC3
	for <linux-staging@lists.linux.dev>; Sat, 11 Sep 2021 13:27:20 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id g16so6887367wrb.3
        for <linux-staging@lists.linux.dev>; Sat, 11 Sep 2021 06:27:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/E326Yc6yFUXw1Tspc0wWzMpp1fhY8mdy8EsD4ltwtA=;
        b=KxWIlqN+wTN7CyKQYswpgn4TJ4GH2N1Tzb7hyjVg0ocMngv+RFe6Ci0kYMpteuVOQi
         D5YPj6kPyerBz/jTtGEvMq/j4uNmwtCTKgjz4rcUIzGYknMEJEY/M9Z9bsF490kFTVIy
         G42sRRgfamJATNlaa9BJ+bd7SSyWIVX9z3sxUFznTRXAY60mgYRVTy87rlUJS60G3234
         ixMoreQpy4aDh7EkZMwqMyi9T1wI7w86tlXHI2SXKC9w++1WHuTbuy9sPKbsO0/OV8c4
         35YSX6fJjqYudrXNU8TkiIluVl9VOjIgYRC8WAYjQW5/PnoQAY6p/4ow0ydVOFKNTfYi
         TROg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/E326Yc6yFUXw1Tspc0wWzMpp1fhY8mdy8EsD4ltwtA=;
        b=dplL1nwWZ5X1qKHUreB/CsmZ2wbEPpiFZU4PVU9AWNGpBLIAgT1EUOORhD2UeVmne2
         sadMWZpkDHq9o1epkaZS/x3bU7XzoqKbXxZmn5rTG0xLUWb3cgesZKlBpZPnasU+anxI
         OCiGtdRImbOvf3dHsEWJDltgk+TQ/RYZUdmJKUvRuLLmuoprvGUtpHyQR4Yg1wTkT2lG
         08DKPVobDoGWNRLxOHG8zSwwSNoPbpqJIOaEwYGCAlqYUXLHSHU//BCm5kHd6bqdc8qh
         56bz98ybteZ96Le1uhHzdznW5XPWwjDP7Dx+80ZJhc2Avu0v5j8fb7yrvX9zwm/KON+B
         VC1Q==
X-Gm-Message-State: AOAM532HNsEnyKMu1OoyWRtwkjx8ZSOlOn0wYQDeW9Xyq5nq394KS1Of
	en1J083dD9yd1saXxHQvXeNlAIaOlHykaQ==
X-Google-Smtp-Source: ABdhPJyucqwoJrP88tzKeZSD/a7ZdplTSUB54kYJTAlIJ0XxKMB7wK0JhtfC4N3Owxm34WdqVYAgRw==
X-Received: by 2002:adf:f543:: with SMTP id j3mr3175831wrp.287.1631366839074;
        Sat, 11 Sep 2021 06:27:19 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::ae40])
        by smtp.gmail.com with ESMTPSA id 48sm1770253wrc.14.2021.09.11.06.27.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Sep 2021 06:27:18 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 16/18] staging: r8188eu: remove unused prototype ODM_InitializeTimer()
Date: Sat, 11 Sep 2021 15:26:33 +0200
Message-Id: <20210911132635.30369-17-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210911132635.30369-1-straube.linux@gmail.com>
References: <20210911132635.30369-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function prototype ODM_InitializeTimer() is not used, remove it.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/include/odm_interface.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/staging/r8188eu/include/odm_interface.h b/drivers/staging/r8188eu/include/odm_interface.h
index 2b103aecd859..c7784f540e7d 100644
--- a/drivers/staging/r8188eu/include/odm_interface.h
+++ b/drivers/staging/r8188eu/include/odm_interface.h
@@ -99,10 +99,6 @@ void ODM_delay_us(u32 us);
 
 void ODM_sleep_ms(u32 ms);
 
-void ODM_InitializeTimer(struct odm_dm_struct *pDM_Odm,
-			 struct timer_list *pTimer, void *CallBackFunc,
-			 void *pContext, const char *szID);
-
 void ODM_CancelTimer(struct odm_dm_struct *pDM_Odm, struct timer_list *pTimer);
 
 #endif	/*  __ODM_INTERFACE_H__ */
-- 
2.33.0

