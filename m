Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 176D071
	for <linux-staging@lists.linux.dev>; Sat, 24 Apr 2021 09:03:59 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id x5so385079wrv.13
        for <linux-staging@lists.linux.dev>; Sat, 24 Apr 2021 02:03:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Rd5Skrnm1vG8IFRdylWE6XpRaE/YvS+Wl0BTfIy1QHc=;
        b=ozK0lX2wtNAycHUDWCVuYqTbJMngH9apRulBK6FOUaO12gAjEFbqGJr+IGl4EcgHD+
         qciEHWfTp76ht0eKNhhuJ5MEhcisA31s2YryVVecQVkCkwcJqpTZTj8//18ScUjuVlPB
         dqMGRUu6Bu8BHNWNCP7ldxl9b4l/Ub3qlNfConfewJ1mCd1qFdtK7xXCpC2bVQkYoglq
         pTvdijloSxuIVYis4jS5QXqi5vJD7YPIY9vgWGlNo2rIhOnBBj+Ddzd2k3UiNJdoJxwt
         SgEGmQn5+FGzJ/FdLv9Qhz6cDS4/cF44WQT1iER90R2dMQx0EAXqAVVupFfROAYUby7x
         wBhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Rd5Skrnm1vG8IFRdylWE6XpRaE/YvS+Wl0BTfIy1QHc=;
        b=hkknfMDHshGQDCCi9JWPayFNKPqo/lXdha4/BJDjb8j1EP493+2zpjDhT+u+7OjOCP
         tyv9WThK0f8czVRYMhDQFUnD/8ndKxT/yQ4s97kBO3Q82BORveomIuSiH8HOVMxceCQy
         35c4zG4l2kT6gNHenj1/6gbyEa+HGjn0HOHgnk0DaAvWEE6Qh1HlkyVU703a80Cf9vtI
         b0tVGP4Q3+Vo/uNcllxqdL5U8Tml+3CaW2xWK+klFL85brtxnJPmCY9rKbbHt7KGZ5BO
         aDJI9fbRVi14mE7vw0eO9VIxj5MR0F8/Y2+Zc+iVQ5PfCgABVyXZzob97yEIpCBcBN76
         ms/w==
X-Gm-Message-State: AOAM530v7TtPNLmwlelVdkQpDPOmopocjl3nqgf3D1Jo2OpcKbOPxUPZ
	Iq718wtA0OKY1ZJeQG0ZAjo=
X-Google-Smtp-Source: ABdhPJzpikNzw5yythw0nY19FXLqeEtffu9LBFqGLpq0n9SSadbJz8XrwkSNOWsggxRjM4MV4Tu64w==
X-Received: by 2002:adf:8b02:: with SMTP id n2mr9522850wra.259.1619255037747;
        Sat, 24 Apr 2021 02:03:57 -0700 (PDT)
Received: from agape ([5.171.80.252])
        by smtp.gmail.com with ESMTPSA id p18sm11490944wrs.68.2021.04.24.02.03.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Apr 2021 02:03:57 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: joe@perches.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 49/50] staging: rtl8723bs: remove last unused debug macros
Date: Sat, 24 Apr 2021 11:02:32 +0200
Message-Id: <3baf120a9e99d087968e8db55e2b1c33ae5c5e8a.1619254603.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1619254603.git.fabioaiuto83@gmail.com>
References: <cover.1619254603.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove last unused debug macros.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/include/rtw_debug.h | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_debug.h b/drivers/staging/rtl8723bs/include/rtw_debug.h
index c9f53c08efbb..189f02a8300a 100644
--- a/drivers/staging/rtl8723bs/include/rtw_debug.h
+++ b/drivers/staging/rtl8723bs/include/rtw_debug.h
@@ -7,18 +7,6 @@
 #ifndef __RTW_DEBUG_H__
 #define __RTW_DEBUG_H__
 
-#define _module_rtl8712_recv_c_		BIT(30)
-
-#undef _MODULE_DEFINE_
-
-#if defined _RTL8712_RECV_C_
-	#define	_MODULE_DEFINE_	_module_rtl8712_recv_c_
-#elif defined _RTL8192CU_RECV_C_
-	#define	_MODULE_DEFINE_	_module_rtl8712_recv_c_
-#elif defined _RTL871X_MLME_EXT_C_
-	#define _MODULE_DEFINE_	_module_mlme_osdep_c_
-#endif
-
 #define DRIVER_PREFIX "RTL8723BS: "
 
 void mac_reg_dump(struct adapter *adapter);
-- 
2.20.1

