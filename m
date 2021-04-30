Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0170329CA
	for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 07:45:09 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id zg3so22233324ejb.8
        for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 00:45:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mmTLlnaxutpjq4SbPPubfzCaa9R8HdPWxGtl/Jb9hiU=;
        b=PZ91C6J5IbzmZSX2fvjiTZcUxo2IPdsDl2aV1WCjj0KV8ktmGXNE4IK1qX7M1ojKfm
         lhKAJCIW4MpxDQvNn35XF69tyUtJI+Tec3vHrHXy3yXjU8NDa7S42I4hbHo1GNsk3qIm
         1wtfUsyHrnW+DnEUSQRqd3ao8sHfl/2Ruvc8gCjI1xEOkQdnTJ6Cpfczz2nS/yC4/LVY
         XqPnt21W6cW2QfGF1p206prkjVbKCgcOny+D5sm/DqtBbc6A37NlXTmGMKge2H4/mwVC
         BLOJmsaki930Y/JJLVxgLSEbwFLNTW+d6GOl1eW9AMUv1VsT1OoUvWcb/kfjEXvfigIJ
         E6wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mmTLlnaxutpjq4SbPPubfzCaa9R8HdPWxGtl/Jb9hiU=;
        b=t3Qo4lEeBmslzxwZIIbdUbYfORqzsLjzIa9qf9tsyv3rMfrP3ieZLRssVaiK9vrerG
         trFkvm17BmiIwK+Gs7MIAB/8zgwHqGu7LT8QPh6+OfYB0EBCtrnhLJps7gPCru5DI3ps
         F/sxBbtmjLvS1MOB+3GOcoz6hjqYsLJRfIB6efweGZ5CmMOlASDTgGD3hOzilW3xv0Pk
         f7VHr7p1hqMscS+a/TtMumnAm7AHL4FXfhcXZPcx8dk3m/UgB3ahNkGRzFUitadGoHEM
         BGyTwPPMSau2rEf/uyD+wI8P8BC2TNKtCkrOxhFg2MSroqkuaiILZcGm7oa3WTUmUchs
         ZCZg==
X-Gm-Message-State: AOAM531uDeFD9QhOXXcUDGm40VnOe8QOchLrd9iCgRVAY+26MtuvgaZZ
	MdTYgVImlRIEnBwbqJaY/XI=
X-Google-Smtp-Source: ABdhPJxRdEqrlfDzZcNRFNV5BcjA1wAtqT5/0hnDODofhaWOAo37sfUDEpL6lJ7W1iZbTuyBT5Q+bA==
X-Received: by 2002:a17:906:5a83:: with SMTP id l3mr2849949ejq.50.1619768708581;
        Fri, 30 Apr 2021 00:45:08 -0700 (PDT)
Received: from agape ([5.171.81.86])
        by smtp.gmail.com with ESMTPSA id hp29sm1383025ejc.47.2021.04.30.00.45.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Apr 2021 00:45:08 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 38/43] staging: rtl8723bs: remove RT_DISP macro definition
Date: Fri, 30 Apr 2021 09:43:56 +0200
Message-Id: <311b2575ed641cfc36c7e47fd4335e1caa77b1e5.1619768150.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1619768150.git.fabioaiuto83@gmail.com>
References: <cover.1619768150.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove unused RT_DISP macro definition.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/hal/odm_debug.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/odm_debug.h b/drivers/staging/rtl8723bs/hal/odm_debug.h
index c6c62bed5f3c..c7c7865dd7e2 100644
--- a/drivers/staging/rtl8723bs/hal/odm_debug.h
+++ b/drivers/staging/rtl8723bs/hal/odm_debug.h
@@ -85,9 +85,6 @@
 #define ODM_COMP_COMMON				BIT30
 #define ODM_COMP_INIT				BIT31
 
-/*------------------------Export Marco Definition---------------------------*/
-	#define RT_DISP(dbgtype, dbgflag, printstr)
-
 void ODM_InitDebugSetting(struct dm_odm_t *pDM_Odm);
 
 #endif	/*  __ODM_DBG_H__ */
-- 
2.20.1

