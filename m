Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43BD871
	for <linux-staging@lists.linux.dev>; Sat, 24 Apr 2021 09:03:32 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id m5so486672wmf.1
        for <linux-staging@lists.linux.dev>; Sat, 24 Apr 2021 02:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RLOdNZ/idN2fC5170Bm5seBXbd2GYVgAZ5BDCqnR19c=;
        b=Brxc2zhbr5SLSYkNjRsmPqwmdBWvb5SfwfKjg0wDmEUfvHP5sxTCAroeTYMgxbwEeh
         vjjRqTQCpHi32a9mYtZ1f7CK1zMem7fUVe4k3NPtp/1Dme3IbbLahcMJWTAFmRQ5l+yx
         Wb77eAniAf1wwMBHvPoa99wYaHQyR4to0AXOtHQD2ayusj5WAMAyR4HVyfQQnfQ60nBi
         AqiZ8b5ljJgNwwsN+OyorlR/g4tRbbbodxlIjIlZh99RBeHkP1cGLNvI5UI4hBTfsLJk
         efFVCTtBhpFZ8MAFw0Qx4VhEkO/n3M/Q5I8woVSBrv9oiYXBfK/h2GEfOAT8a3e+SM7K
         qxlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RLOdNZ/idN2fC5170Bm5seBXbd2GYVgAZ5BDCqnR19c=;
        b=HWcjGs4lauIemhplv3RSpXbm/LrE9dkZD2xVFhBtClhZnBkhZ6qB/AjY+HvnEvEqKr
         XXdvS095rbOxO+1tT0Oig0BywM9tVwKl8mrekcmqN0aUT1VkrzxVBZbUFYMzHr/eqzIg
         4bCgp5xdp9PDEMAJpIUWQ2i+P+WabH2p0Lg6V5ZWy0Gzi8N5BDEXnDuE9yU7KKoqx7jq
         0AWbtoKDyTuf6hweYhgHXKqhaqEmMwCvVHTjTlm76fk2qp2T20lbZn0DIvkgYZMwLH8y
         X6X0cqZ5m7BlROYfRqv78oOojJDvr9bJ4UmO7pNS1fP2TZHl+zTjfzCYgHFor0AjLFTw
         v1RA==
X-Gm-Message-State: AOAM531xq0VNwUbGeIYvgSt73TdPRKUCLncfKqsKDkuAEkqmjSGJk4uD
	XNzsFPGJzFQM7m/UrYoWqAs=
X-Google-Smtp-Source: ABdhPJwrLyO6cdvvqY8+IeqmgjqM3g2VhyMC+tdYkZ5wqfP2vSxz8bs61/wdY256itHJHyWVJcjhRw==
X-Received: by 2002:a1c:a54a:: with SMTP id o71mr8697594wme.172.1619255010874;
        Sat, 24 Apr 2021 02:03:30 -0700 (PDT)
Received: from agape ([5.171.80.252])
        by smtp.gmail.com with ESMTPSA id o62sm38514561wmo.3.2021.04.24.02.03.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Apr 2021 02:03:30 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: joe@perches.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 33/50] staging: rtl8723bs: remove unused debug macros tied to _RTL871X_IOCTL_SET_C_ definition
Date: Sat, 24 Apr 2021 11:02:16 +0200
Message-Id: <f21423d909f1c2b95cac10a715ea49af76b776b1.1619254603.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1619254603.git.fabioaiuto83@gmail.com>
References: <cover.1619254603.git.fabioaiuto83@gmail.com>
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

