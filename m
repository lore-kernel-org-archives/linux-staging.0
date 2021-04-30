Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CE492F9A
	for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 14:44:41 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id i3so57233131edt.1
        for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 07:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DZ9GqwS1PPNPtRn+ut+6mZGIBFXs5PoH/wfecY65hmw=;
        b=Iz2Oj01s64NJ60zI0ggXwISxptC7FWWdcm/+QMU1n/vA4bmq5tPG6MvUZkbpnf1rgm
         e9ee2jOWbwtxvk/3i59ox0yWSOMbfMTvszSyB4+Akic1gFiaJZWGdr1TYgk05OC1qDrZ
         DImXL5IRIIqWkoRz/DAWErVOU2MUmUhwgT9A3VUOCbfggvi3/6GFTf1jBCsW8TPdaK4t
         cZkNfgKxF6kpfcrfY/EpWarP4Dx4fIut+yhV+8gPWQWBD/NYM/WGw3y+Fbg+bZhnQCCZ
         t7ipcDsjhEYCu3gehuq2jMN6mRB7JwfM9zBAl2v9xp6AWQZfu5WUJnKzK1P4/Bw5bJh4
         gTPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DZ9GqwS1PPNPtRn+ut+6mZGIBFXs5PoH/wfecY65hmw=;
        b=AOI+0z78kmQ2Kex2pPg951Sc7G9IPK1WcvGXJGMeCvaCM/GfbpC1TEawN3gotv7vMT
         yu4iOyn/Cgwxjv8kF0DjyoYN4RtL2zJCe8UnLJpLGXP6S30yDMfnxdvokSZ7S1YN1F4l
         5CePxgb04TEPHOeJFed9VHs6Py5aaxhifSlnmoL2oTDl+MiuN1GWE5JDS62HOarQex+d
         37bdzaDsTXxkN+lExtKNrHWJjU8B7ASy7GYRtiOR0U29zFyj7XwT26+6appICNQK6O4g
         mRgSbV2shUpN8PvSbZ09jsjezbjmzXSaD2vOs5Boyo7vpZAJ4z3jDUR7vkBvZTwuFKZ3
         cTrw==
X-Gm-Message-State: AOAM532RtoquEMDG+lEgFZ0hpGHetqZaYIf8XQ55Dfy3veSdpnBkoxFZ
	1QOdmtcagj4SVjaQlT8NtDuefJIgdXg=
X-Google-Smtp-Source: ABdhPJx+1mkyvBoNk54GXq+Nypg65Ym0B/INFGBsg543s0TSONV62OVWk4U/6sUgyCJPKyaadHcNkg==
X-Received: by 2002:aa7:c9cf:: with SMTP id i15mr6563047edt.4.1619793879980;
        Fri, 30 Apr 2021 07:44:39 -0700 (PDT)
Received: from agape ([109.52.244.36])
        by smtp.gmail.com with ESMTPSA id z17sm2086460ejc.69.2021.04.30.07.44.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Apr 2021 07:44:39 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 17/43] staging: rtl8723bs: remove empty #ifndef block
Date: Fri, 30 Apr 2021 16:43:47 +0200
Message-Id: <6acb4774f795431fa2acf4ba8719ba91b5c37f67.1619793405.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1619793405.git.fabioaiuto83@gmail.com>
References: <cover.1619793405.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove empty ifndef block.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/hal/odm_debug.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/odm_debug.h b/drivers/staging/rtl8723bs/hal/odm_debug.h
index 78b9b4548dcb..3faf4da42bd7 100644
--- a/drivers/staging/rtl8723bs/hal/odm_debug.h
+++ b/drivers/staging/rtl8723bs/hal/odm_debug.h
@@ -91,9 +91,6 @@
 		DbgPrint("%s(): " fmt, __func__, ## args)
 	#define RT_DISP(dbgtype, dbgflag, printstr)
 
-#ifndef ASSERT
-#endif
-
 void ODM_InitDebugSetting(struct dm_odm_t *pDM_Odm);
 
 #endif	/*  __ODM_DBG_H__ */
-- 
2.20.1

