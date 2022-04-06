Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AF0733D4
	for <linux-staging@lists.linux.dev>; Wed,  6 Apr 2022 17:22:38 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id g20so3470446edw.6
        for <linux-staging@lists.linux.dev>; Wed, 06 Apr 2022 10:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CwqBXDz668FHAz4y6CpGiuk9ISChfbzhgCaR+tulTMk=;
        b=EvHMKCFZCZDfyLJTYvlmtVf5grd8BgJpV5V6KZJqOS53R1pGZ7CNR6kyTy6ChuiW9Y
         XuQCu3tDeJo74DAXUvqIxMt11hXqmHTfV7wO8zIJLxeVHuZcVUFFlGTdUrXi/RhJNDei
         PYSWVg2NF80s7l8CPVv1U2RvjUVMcpzWOgvk686K91f15MO/SNTimslRG6g8cPzhD3EX
         MZ7EUYPPjkxNMV5xHSN4bQoEDNC106BbPvZz2V9fjzojEkXJODCxERoV/1BD76fVIrGX
         uygIWzW38kj/1lQ+DCHNsIvIl9p/3ulb8nSVy8pgA/zP64I7sq608GyVOt2QU/NFG+zf
         wPig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CwqBXDz668FHAz4y6CpGiuk9ISChfbzhgCaR+tulTMk=;
        b=gIp4yYuvNB5FeNusJuZ6UH7AlzZ+fhW274vA98Y4956hVmvpW3a9gvVT16iOiMWgs6
         ccitdJpxG6ign0QBPzXuXc1Ul5CyjVULTJYDIReMSJP/Gjh05yzAUo2tVzv9OHd/u+Tj
         srMZh8+C315EnKMqdITt2GD+USw62RrGrRBrSIqTY+lPAO0BimUddvIY0ogG83GE/ovF
         dItCDqCR9OdEfDCBPlNuW17JvtVch5qTIZydNsNAQYcq3sGdCZ6H/5Cs2jdX4P4piXTV
         cAzwQky+CmYKG4Gc7vjbojvBPAYA6KqF03NZ0wdufcDLTChxGVhJE997g7nubKkK4e/F
         Q+qA==
X-Gm-Message-State: AOAM531Lj3YhNzFUGAFMJJ/HTXdImMtcQzk2t6nKODocy9CvZ9UcnM+h
	O+n95KD+VkPNXFK/UUQmhD8=
X-Google-Smtp-Source: ABdhPJxEA2MeNQtB5aPt+y7Y43evp/8rgGqQFSwINva8bP39DtlmAZlA+iBJeLY9vUpK9mLfxAYcEQ==
X-Received: by 2002:a05:6402:5146:b0:415:fd95:6afa with SMTP id n6-20020a056402514600b00415fd956afamr10007508edd.200.1649265756888;
        Wed, 06 Apr 2022 10:22:36 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abb55.dynamic.kabel-deutschland.de. [95.90.187.85])
        by smtp.gmail.com with ESMTPSA id da19-20020a056402177300b00413583e0996sm7912730edb.14.2022.04.06.10.22.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Apr 2022 10:22:36 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH v2 2/5] staging: r8188eu: use round_up() instead of _RND4()
Date: Wed,  6 Apr 2022 19:22:16 +0200
Message-Id: <20220406172219.15565-3-straube.linux@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220406172219.15565-1-straube.linux@gmail.com>
References: <20220406172219.15565-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use in-kernel round_up() instead of custom _RND4().

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
v2: no changes

 drivers/staging/r8188eu/core/rtw_cmd.c          | 2 +-
 drivers/staging/r8188eu/include/osdep_service.h | 8 --------
 2 files changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_cmd.c b/drivers/staging/r8188eu/core/rtw_cmd.c
index ecd0488c439b..4977a0b99415 100644
--- a/drivers/staging/r8188eu/core/rtw_cmd.c
+++ b/drivers/staging/r8188eu/core/rtw_cmd.c
@@ -264,7 +264,7 @@ int rtw_cmd_thread(void *context)
 			goto post_process;
 		}
 
-		pcmd->cmdsz = _RND4((pcmd->cmdsz));/* _RND4 */
+		pcmd->cmdsz = round_up(pcmd->cmdsz, 4);
 
 		memcpy(pcmdbuf, pcmd->parmbuf, pcmd->cmdsz);
 
diff --git a/drivers/staging/r8188eu/include/osdep_service.h b/drivers/staging/r8188eu/include/osdep_service.h
index 56e5cbfec1f1..388c22751d09 100644
--- a/drivers/staging/r8188eu/include/osdep_service.h
+++ b/drivers/staging/r8188eu/include/osdep_service.h
@@ -96,14 +96,6 @@ static inline void flush_signals_thread(void)
 
 #define _RND(sz, r) ((((sz)+((r)-1))/(r))*(r))
 
-static inline u32 _RND4(u32 sz)
-{
-	u32	val;
-
-	val = ((sz >> 2) + ((sz & 3) ? 1: 0)) << 2;
-	return val;
-}
-
 static inline u32 _RND8(u32 sz)
 {
 	u32	val;
-- 
2.35.1

