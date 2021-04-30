Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1C412F9A
	for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 14:45:09 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id gx5so13549780ejb.11
        for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 07:45:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wlFfMaqoDNDPkcgOlBfijVc+2KkNjpgO1LG6F4L15Ok=;
        b=VUypWzGXPIeKIyeZvU051xpAGSH9BIZsa6WvbHugTaibnlCGfE/EYtXqtM0JtfkE2x
         u1e2v0m7dG/MF3KkX6GeHxV2xDMvMYrkZYyyhXPZ7wuxgNUNkCyCStVMRCA2Jdjk5neA
         40/zoXWx7DGBUpFSXj5przMt/pxKwSTur5oYuzWUFv3/wzRtMrs7+jRbp3IX7SSlPLRm
         iSJZiI41mGfV+a3IhLPwNQ5ecgUSqUrUTpkO2Xu6nYSv0Lbo61EYy4OG5yXJAwap6anL
         v6jehFXkDmfQbYqJo7H61JLGj7FvBu1Ezbesqk03mxY4jICg+IWtSDAQ7rEBVXfxyO27
         hCgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wlFfMaqoDNDPkcgOlBfijVc+2KkNjpgO1LG6F4L15Ok=;
        b=d7lcw/bKPD2zZ20TEAMsy9p0vadNrJOqMZkcacK7StvgRqhg+OJPTymbCIh+GGYwwa
         vV35LARWWZakHZ4DBQ/buWe+IG/PVaP/ydh/1K18G6CMGfRN6LS50QQLv8BaSm5nUHgc
         +yimg0sMdfFfEE5gbipRES9MjfUwB/xDfLiRCEmKBaryK0UjG8fcsouHVQRRrhyBqhSt
         E5yMQBlLdfy+LHTdQiQyLbaYj2DSOjG2vMlOT74fpjgZzR6GmI9GfS2nTiMTcE3BJpkS
         i9LCL6g7F78Z+7zedCSqrndQyMAK7gn+ofw9Ls9vpW/hqozcUeANr343SwTMvydESZ1J
         4W1g==
X-Gm-Message-State: AOAM532Qw/dZH0V1JppGwGmdSocMf1hiZcV8EoZVtzRTiAqye8qQGi58
	cblIarKV+k9VFHPz9RsEGVQ=
X-Google-Smtp-Source: ABdhPJwvP8L/9lDGBkJf6l0/31HTCLHA4VsHgkDwq8lC1Jziq0FpJCNUzYcj6KFz0SeyyvapoBFI2w==
X-Received: by 2002:a17:906:ecf4:: with SMTP id qt20mr4792889ejb.59.1619793908352;
        Fri, 30 Apr 2021 07:45:08 -0700 (PDT)
Received: from agape ([109.52.244.36])
        by smtp.gmail.com with ESMTPSA id nd36sm1987686ejc.21.2021.04.30.07.45.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Apr 2021 07:45:08 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 36/43] staging: rtl8723bs: remove unused DbgPrint macro
Date: Fri, 30 Apr 2021 16:44:06 +0200
Message-Id: <0b1c2cb7087dc4d92a9fc86dd2739e1bad2522fa.1619793406.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1619793405.git.fabioaiuto83@gmail.com>
References: <cover.1619793405.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove unused DbgPrint macro definition.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/hal/odm_debug.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/hal/odm_debug.h b/drivers/staging/rtl8723bs/hal/odm_debug.h
index 5c4412bf6fbd..c6c62bed5f3c 100644
--- a/drivers/staging/rtl8723bs/hal/odm_debug.h
+++ b/drivers/staging/rtl8723bs/hal/odm_debug.h
@@ -86,7 +86,6 @@
 #define ODM_COMP_INIT				BIT31
 
 /*------------------------Export Marco Definition---------------------------*/
-	#define DbgPrint printk
 	#define RT_DISP(dbgtype, dbgflag, printstr)
 
 void ODM_InitDebugSetting(struct dm_odm_t *pDM_Odm);
-- 
2.20.1

