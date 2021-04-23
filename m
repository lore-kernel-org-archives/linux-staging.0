Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E207F70
	for <linux-staging@lists.linux.dev>; Fri, 23 Apr 2021 14:58:49 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id c15so39764097wro.13
        for <linux-staging@lists.linux.dev>; Fri, 23 Apr 2021 07:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vK3QxmyEJ/kAAhKM5dk61kp8P7/wFJS5mqiWEFDpYHk=;
        b=q4O46DWrQFNNffaoApkG0va+H+yW1aKCf1ly25izBSn1Ce19n6zgAOEuMHCHDKPvaJ
         cv52vVY1LEJcWFWU6zWnz9fH81g9/YvNlGzNxEblBt4XxDCvk4Q35xujPRPqlMUNyqVm
         DLUaqLZqr3UeoXKSLyWQuwv1KnI3Uft6gwaLwba7bhs65pDDXrF8D4HWXxEnkbMeeyXV
         Ru4sZMkQDUWjsOt8Pl/2v5MNeznHaIlcYk1Q6K0VS19/hjgK7UWozKg/+gqBF9XwW8uE
         jtLSIdkiqOoFQ5vHnXupex8BC1g7PALcQ0B5NYx9hBJnbzBUlU23L6kGUl+VFCauK8qN
         iIiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vK3QxmyEJ/kAAhKM5dk61kp8P7/wFJS5mqiWEFDpYHk=;
        b=FF+vH6JyeJWgp0zg1qtxLDiONMQI1hgrjOKmIviS7EWpT4GDjLa+I4Qsv/xxOmELYA
         VYHIOOEnqHtDlUVmGQxMjJOy7MTT28w/UXtczZ1nEFqXJGbjyxXZ2KHWWg2efLFs0MhU
         DtDUA+08mMq40ifj4XkF7stYd605mhRPYIScsOs4w8sHI+VW525vYviUTSz7RWUshn3z
         mFgQv0IfWZ1ME3m5SaHWfyt6+rj7bSJpzUIlFwGgQWjhuNo+DxM5Tu5VH2xj8rDta9Gh
         yiWGjA/eWy8kKE6kW6AZ7hsXqkGejuFz7hndXnbeAQAhKvvegqfJ8skF+0LPsGy3MBnv
         DRUg==
X-Gm-Message-State: AOAM533pyKewa5nULizNE+6yUC3H4LkwYs34eAcPUzLBlnmzjZsxReMi
	F30CFqYQMoT2S8+dBQvXSDg=
X-Google-Smtp-Source: ABdhPJz6yNPSyEmjK1Z8PkYydHS1u95chhhcoiyU2fl62/TpbeTEn/CTh9J2B4AHPUhI5GcZJEB32Q==
X-Received: by 2002:adf:e8c4:: with SMTP id k4mr5365706wrn.262.1619189928585;
        Fri, 23 Apr 2021 07:58:48 -0700 (PDT)
Received: from agape ([5.171.72.99])
        by smtp.gmail.com with ESMTPSA id l9sm9561642wrz.7.2021.04.23.07.58.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Apr 2021 07:58:48 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 04/49] staging: rtl8723bs: remove unused _DBG_871X_LEVEL macro
Date: Fri, 23 Apr 2021 16:57:55 +0200
Message-Id: <b3ce80406969921cde889f9f082ef9c858c3a3a8.1619189489.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1619189489.git.fabioaiuto83@gmail.com>
References: <cover.1619189489.git.fabioaiuto83@gmail.com>
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

