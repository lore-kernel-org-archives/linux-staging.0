Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 836582FA1
	for <linux-staging@lists.linux.dev>; Fri, 23 Apr 2021 14:59:37 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id n4-20020a05600c4f84b029013151278decso1399359wmq.4
        for <linux-staging@lists.linux.dev>; Fri, 23 Apr 2021 07:59:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JmVSxO1mcykbvIqMdlxGXo0H35C2W5D9ZAmsoCB0GTI=;
        b=OLdxmp9Av/zsk0s5yqwtB/NZ4dyzqW22K1eV1Rxujsq5dYtdFSqEB4IufHB9+ZVNQ/
         5WL3es+6P6s+TqZ/IIDi/lPeX9+chJk2dPJmRR2xYBK20SJlYtiH6ZTPU9Rfpa4HFTIg
         +CMYzdihE9uzV1NwuKF7yrDlFL3HmUpHpQJGiuuuCeBpJN3uQPrgA5ji2tkkz+0MkEbX
         bOr7jB6VMv7aYMV4D6yz2w2wdgGrMw4LWO7jvaAjkWLGxlXQmtKg+2FVDieFogmWevt2
         JJb1RAMY8s6vy0uznCc16VBpG8uwjXPWeuL28E2ACuhA3mcVD9LPO2uVU4/1p/eXi8Mq
         PuXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JmVSxO1mcykbvIqMdlxGXo0H35C2W5D9ZAmsoCB0GTI=;
        b=PfhAhCwx3nJKygff8htX97o1+RhwlM8i3FIKwhcKSdB+H6KZBypOmqHVoUTstvS5lO
         C+7C8+MHBsBkLlPjPYbdxfNnk+YG6E79mabU2It1i2SRJI06UTMMgGqwCaw0gtFr5nLs
         j8FALbKR2xMKmXgku6F6r4cWxuMv/vopHDENSrMEi+/Vb0cQlhVc1svMMnjMHzgTHc7G
         JM7mX6agye+pmkQdO1gSUPLcXZ6NRWSGppsR9923IQv+FoSX9eZ9ekqJNc8fJB2xCdEU
         QNBmTmcvVJ4y996Ta7ccDswC7RgyG1WPNmeFwE1qu19dFTNiQno0nLRAi6MpaMwqSJzN
         cMVg==
X-Gm-Message-State: AOAM532lLhgCpdeFB7965pEsLt9+Jj5LBRTkv5Hx8Aq3EI224bviT/PT
	X8YwZ5/vR6/Iz41SBCQ9JLqR6f2o+qE=
X-Google-Smtp-Source: ABdhPJxkduUPOHFYCC1TaWEO49AfrlnQGaw0jwkhd0Y3LkAsIYb7fAjvw77/b1WubWA16u+BLbm4Gg==
X-Received: by 2002:a1c:64c4:: with SMTP id y187mr6041955wmb.162.1619189976216;
        Fri, 23 Apr 2021 07:59:36 -0700 (PDT)
Received: from agape ([5.171.72.99])
        by smtp.gmail.com with ESMTPSA id z14sm11149597wrt.54.2021.04.23.07.59.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Apr 2021 07:59:35 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 33/49] staging: rtl8723bs: remove unused debug macros tied to _RTL871X_IOCTL_QUERY_C_ definition
Date: Fri, 23 Apr 2021 16:58:24 +0200
Message-Id: <42b01fca3bd206812b42be5716cf35ef5e4f9c80.1619189489.git.fabioaiuto83@gmail.com>
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
_RTL871X_IOCTL_QUERY_C_ definition.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/include/rtw_debug.h | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_debug.h b/drivers/staging/rtl8723bs/include/rtw_debug.h
index 7f84bc03e9c7..be44d72599d3 100644
--- a/drivers/staging/rtl8723bs/include/rtw_debug.h
+++ b/drivers/staging/rtl8723bs/include/rtw_debug.h
@@ -7,7 +7,6 @@
 #ifndef __RTW_DEBUG_H__
 #define __RTW_DEBUG_H__
 
-#define _module_rtl871x_ioctl_query_c_	BIT(18)
 #define _module_rtl871x_pwrctrl_c_			BIT(19)
 #define _module_hci_intfs_c_			BIT(20)
 #define _module_hci_ops_c_			BIT(21)
@@ -25,9 +24,7 @@
 
 #undef _MODULE_DEFINE_
 
-#if defined _RTL871X_IOCTL_QUERY_C_
-	#define	_MODULE_DEFINE_	_module_rtl871x_ioctl_query_c_
-#elif defined _RTL871X_PWRCTRL_C_
+#if defined _RTL871X_PWRCTRL_C_
 	#define	_MODULE_DEFINE_	_module_rtl871x_pwrctrl_c_
 #elif defined _RTW_PWRCTRL_C_
 	#define	_MODULE_DEFINE_	1
-- 
2.20.1

