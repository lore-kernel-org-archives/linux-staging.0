Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C897270
	for <linux-staging@lists.linux.dev>; Fri, 23 Apr 2021 14:59:57 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id i21-20020a05600c3555b029012eae2af5d4so1397405wmq.4
        for <linux-staging@lists.linux.dev>; Fri, 23 Apr 2021 07:59:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rCpiiCQz4n2K9iobxaVb23hXxM/13FWIKgaoFavgS9Q=;
        b=ELWrR2ZuwBKahpByxdc2iD2psYXGXrE1IMAt5LjDvvsABmjmhs7YfEd7bqEgpt/Rz8
         ITnNVROT/Vw3medKBriweN2pyDvJ67o4Sngp5vV+g+maOA/KGMj7v58lNOKEXQ+V1aYK
         dN8aOJ1JJyYGDI4MNq+Lz5ReDN9xERQCpnd4T/q200wE5LlcFlLQYDxQpJWLbWSJd8LA
         qEbtB40X0EIB9q8Ic9KCwWxd1pS6BTn8nSBawZ5+GB/WUGpiyF33xi9Jp/ZoYh+SUdz2
         MBqN1MHMbm5s190JF0jz7JsSX4KRQTeX+5IxcFeULFyZN9IuXNX9mK1xJ1rBpuZHPdXQ
         Z4LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rCpiiCQz4n2K9iobxaVb23hXxM/13FWIKgaoFavgS9Q=;
        b=ou6QRdV0+7FbgNjEGY+sc41cIZ8xrBV0cRdHvFPA924E/yYnGXNnINtKH7DYCv94zi
         Xr2sGKPu2u3ysXOoCoHF336tI7MWbK2ubxlbjHB8YvoxCVKCjP50SWDyUo3zbtluf564
         tYWyUPEELX6AQB8urJE0CZFx9gKBtgJsE2zTrXqSmuboVZOWXXPziJS1/JhDIoTUi57P
         8bOPC7a1EpT+BWXvQEc9XSihVrCifC8cl+TjIvKgFg8JVy8ryaiSNfqNIq4Uj6aX2eim
         cesP/o6YrnMHupzAMKQ+CKm4prLG3nBnE0wHofZA6+yiTmHxM9nO9a/QWRuVNw/BNx5r
         bwRA==
X-Gm-Message-State: AOAM531NBNJjOJVbuhvGc+BKlnIAPmUrHOalYxPSaFNe6qpeiNKwFe0+
	xWGkFiok2cAHY3ExdS5atbM=
X-Google-Smtp-Source: ABdhPJxbrrsVdRWSqhZiA19ZmY3z0UHlKWFQdPQ3G6Jp9RkuuMXQVU6MibDcUd/2Ngl8em1PvmpSnA==
X-Received: by 2002:a7b:c1cc:: with SMTP id a12mr4699087wmj.97.1619189996430;
        Fri, 23 Apr 2021 07:59:56 -0700 (PDT)
Received: from agape ([5.171.72.99])
        by smtp.gmail.com with ESMTPSA id 3sm13305985wma.45.2021.04.23.07.59.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Apr 2021 07:59:56 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 45/49] staging: rtl8723bs: remove unused debug macro definitions
Date: Fri, 23 Apr 2021 16:58:36 +0200
Message-Id: <56208b7232cd36058aec931cb1d7037c9c9b63fb.1619189489.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1619189489.git.fabioaiuto83@gmail.com>
References: <cover.1619189489.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove unused debug macro definitions.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/include/rtw_debug.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_debug.h b/drivers/staging/rtl8723bs/include/rtw_debug.h
index cde4b1d6a4b7..ad96fe1de971 100644
--- a/drivers/staging/rtl8723bs/include/rtw_debug.h
+++ b/drivers/staging/rtl8723bs/include/rtw_debug.h
@@ -7,11 +7,8 @@
 #ifndef __RTW_DEBUG_H__
 #define __RTW_DEBUG_H__
 
-#define	_module_rtl8192c_xmit_c_ BIT(28)
-#define _module_hal_xmit_c_	BIT(28)
 #define _module_efuse_			BIT(29)
 #define _module_rtl8712_recv_c_		BIT(30)
-#define _module_rtl8712_led_c_		BIT(31)
 
 #undef _MODULE_DEFINE_
 
-- 
2.20.1

