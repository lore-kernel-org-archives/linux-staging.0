Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF3972FA1
	for <linux-staging@lists.linux.dev>; Fri, 23 Apr 2021 14:59:35 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id z6so8398197wmg.1
        for <linux-staging@lists.linux.dev>; Fri, 23 Apr 2021 07:59:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RLOdNZ/idN2fC5170Bm5seBXbd2GYVgAZ5BDCqnR19c=;
        b=aod7+aPNiNKQAMp0W2plcRzk8x31djc5622YBkgxfjyMSqtcUqvCCiDQzPmmPCskvT
         eIjHX1JI/ENQyVezzC1KeaHFqG6Cauifv6mkamS1K+PF/Yqx8SL8e84y+aFiTQONunrB
         kwPMtVOKSrmAvRmKsiRFwDe/+ca6s29btZVXwAS4JfbewoFHgupiJ33g63zWOd5DiCl0
         WBzPPPfqw5LxfX+6uMLQcsnhOdzDra0EKRs9Oy8woEFtV9d0viz1adOZ93sFqDWxOUhu
         VzzIagbiAj4T+zpCp8hokdYiwLthidQHjK4fDckPZJiiRDwC0g70PVC/FDqzcHXT1lpm
         d6YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RLOdNZ/idN2fC5170Bm5seBXbd2GYVgAZ5BDCqnR19c=;
        b=J2XtKhg9BmyjjJequrFF6V8cErjYsVSc3kAdnbjxliaP+8eEYRMtdqWM2sn0sCI1H5
         +leDeLkyVz7WqPqzH1pM+dmkC7gaNQtZtTvtjRnTZku3SyZPklfePQG5q+7qrqwx8yfg
         PcLixGXzomsOhItdWhCSK4LJFWNhjaiPGLb3PIq1uCW5wFpYieGF9i4P3TjCUlo87fIa
         BNRFme7rqJedDU8sRWreNW29YlNZ2hhszPjY7VvBVa0iDZiP2NmOPT/R3xNaGc+G3/c7
         RJGpsJrJqvAeYlY7/Ok0rRtkSaIbzYEAl7sFAdZAflkk7RH0pq00MYphZ1er6L5uoM+f
         XPqQ==
X-Gm-Message-State: AOAM531j6yDBq6SdlxHIhRSx7yzvXS8FfZiLO31XmQ7kfNKFYeHfvM9c
	0UJRx4MPvyQlHOlg+GPSU9M=
X-Google-Smtp-Source: ABdhPJxQwwfWTy9bI4BHrXeCngvD4Sxiknfc5S9lQoPOc5ozpOoQfLoKJbDjEgfnkMPoHtF01c25bA==
X-Received: by 2002:a05:600c:4ca3:: with SMTP id g35mr4698508wmp.16.1619189974410;
        Fri, 23 Apr 2021 07:59:34 -0700 (PDT)
Received: from agape ([5.171.72.99])
        by smtp.gmail.com with ESMTPSA id i4sm9884907wrx.56.2021.04.23.07.59.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Apr 2021 07:59:34 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 32/49] staging: rtl8723bs: remove unused debug macros tied to _RTL871X_IOCTL_SET_C_ definition
Date: Fri, 23 Apr 2021 16:58:23 +0200
Message-Id: <2c8bb6a90d94b91056edfcfb26aaae112ad1402d.1619189489.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1619189489.git.fabioaiuto83@gmail.com>
References: <cover.1619189489.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove unused debug macros tied to
 _RTL871X_IOCTL_SET_C_ definition.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/include/rtw_debug.h | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_debug.h b/drivers/staging/rtl8723bs/include/rtw_debug.h
index 501155c8c9cf..7f84bc03e9c7 100644
--- a/drivers/staging/rtl8723bs/include/rtw_debug.h
+++ b/drivers/staging/rtl8723bs/include/rtw_debug.h
@@ -7,7 +7,6 @@
 #ifndef __RTW_DEBUG_H__
 #define __RTW_DEBUG_H__
 
-#define _module_rtl871x_ioctl_set_c_		BIT(17)
 #define _module_rtl871x_ioctl_query_c_	BIT(18)
 #define _module_rtl871x_pwrctrl_c_			BIT(19)
 #define _module_hci_intfs_c_			BIT(20)
@@ -26,9 +25,7 @@
 
 #undef _MODULE_DEFINE_
 
-#if defined _RTL871X_IOCTL_SET_C_
-	#define	_MODULE_DEFINE_	_module_rtl871x_ioctl_set_c_
-#elif defined _RTL871X_IOCTL_QUERY_C_
+#if defined _RTL871X_IOCTL_QUERY_C_
 	#define	_MODULE_DEFINE_	_module_rtl871x_ioctl_query_c_
 #elif defined _RTL871X_PWRCTRL_C_
 	#define	_MODULE_DEFINE_	_module_rtl871x_pwrctrl_c_
-- 
2.20.1

