Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C17570
	for <linux-staging@lists.linux.dev>; Sat, 27 Mar 2021 14:24:45 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id g25so4415449wmh.0
        for <linux-staging@lists.linux.dev>; Sat, 27 Mar 2021 07:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qPyy7/lZ8Cg/+Dzl8fbK+ayIcd2lL4l3eej3var3e0U=;
        b=h207w138afGw+fknV7MJ45zlGKaBJ3ImdE1IizLksOinUn11h2UQ6H+RAyoP+y27ze
         xt1Xc7PNf1zLR/0VYDdK4JWCvEWb8KH6lMM9bI95+O9z9CbwFZYJVfyHDoQygbAJF4vC
         YUig3igKTREgDyj79ptlVMap8p0maZHmv+C2OgeUzOvdOWkWm9QqkjA96o6JYACEDtsi
         yQ/pHrnz9x+OKcREK15h+t7Ng0yoTqu7VvP0v89bO2cUFerCul5Hsp9mKxn6aGAwQwTe
         ZPZYghEcZEA2CJ+SR85+4MmLbVVJunlDNe6ybpkVtBBeHc4suuSAnUqqQ7PrJD882ihw
         gNLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qPyy7/lZ8Cg/+Dzl8fbK+ayIcd2lL4l3eej3var3e0U=;
        b=mDKjP0qviyN6/cxaqqRyqba1XloMiPpd8pPpBbvwL9/bZTzNDrH/t/0+Ft0V/9sDOz
         8hR0JtECOSU4gTdCcqskcU1DF0Z+iuF29fcOHV8wv+tmefiUI/vEOjGZMmoVSrGILk5A
         XIah76O/Ge+ufho+0msXxCLifMETjfzdsNq977m/hYN1mjgxprKZoSU4hAKWpwFj650Y
         HB12mI7IrBV6AeIwdu4DR8KlXnsac6ylztGegrf1n6CLetFes8Yk7SccvujlU/bR0fy4
         icdbQRff9sR3pfMi/Lf9djZHU96GkMifHSqEzHHhTlfL2n2AYXEF75juI7HbJXNxAFxR
         iM7g==
X-Gm-Message-State: AOAM532hDuAOsIo6SdCw61qCj61ySzdaXX2eAptsGTSAMuaMNyGmjXNc
	ElyfEqUdu/WfhWha33/SSsI=
X-Google-Smtp-Source: ABdhPJw4g+4xgLvEl60eZ9ZLbdDQXDd6Bgi/yJh7hvDtNDuyMZlzFjbKmAOVU5yrz5SkgL0F7XXYgw==
X-Received: by 2002:a1c:7415:: with SMTP id p21mr17778160wmc.187.1616855083686;
        Sat, 27 Mar 2021 07:24:43 -0700 (PDT)
Received: from agape ([151.46.211.242])
        by smtp.gmail.com with ESMTPSA id g9sm18742235wrp.14.2021.03.27.07.24.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Mar 2021 07:24:43 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@oracle.com,
	david.laight@aculab.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH v2 02/20] staging: rtl8723bs: put parentheses on macro with complex values in include/hal_com.h
Date: Sat, 27 Mar 2021 15:24:01 +0100
Message-Id: <3d187b860c3a104b00e97543390b2bbe3f2caa24.1616854134.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1616854134.git.fabioaiuto83@gmail.com>
References: <cover.1616854134.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fix the following checkpatch warning:

ERROR: Macros with complex values should be enclosed in parentheses
187: FILE: drivers/staging/rtl8723bs/include/hal_com.h:187:
+#define PageNum_128(_Len)
                (u32)(((_Len)>>7) + ((_Len)&0x7F ? 1:0))

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/include/hal_com.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/include/hal_com.h b/drivers/staging/rtl8723bs/include/hal_com.h
index dc023dd17534..55f9caee6610 100644
--- a/drivers/staging/rtl8723bs/include/hal_com.h
+++ b/drivers/staging/rtl8723bs/include/hal_com.h
@@ -180,7 +180,7 @@ enum rt_media_status {
 #define TX_SELE_NQ			BIT(2)		/*  Normal Queue */
 #define TX_SELE_EQ			BIT(3)		/*  Extern Queue */
 
-#define PageNum_128(_Len)		(u32)(((_Len)>>7) + ((_Len)&0x7F ? 1:0))
+#define PageNum_128(_Len)		((u32)(((_Len)>>7) + ((_Len)&0x7F ? 1:0)))
 
 u8 rtw_hal_data_init(struct adapter *padapter);
 void rtw_hal_data_deinit(struct adapter *padapter);
-- 
2.20.1

