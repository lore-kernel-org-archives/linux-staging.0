Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38B112FA1
	for <linux-staging@lists.linux.dev>; Fri, 23 Apr 2021 14:59:34 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id c15so39766135wro.13
        for <linux-staging@lists.linux.dev>; Fri, 23 Apr 2021 07:59:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=H3UavRC9eYgkj+4cOfjLIrmnA6AzYdpwCwf/ShfW9hQ=;
        b=kTOsVHOq1s5zMJFF4mVaYw8YWClsd1EVdE2bXGU1IcITD4jLQd1mTvndPJIFMHLNGz
         TRBRZHYvPL5jgl6ED3bjqIH/4PhZWTBY0VRDFg7WKzBFRKb4Xe/Zeqx27e4nAv6m4BMR
         24u4VAt0wGonPjGjacH7UAnvaD3or3dWX61spM6ws2fERW+zZ03C+p6FU/6sC0olwPKi
         S3QJ/AdvX16fh3Y9U27EVB5/IPzxkn3K4NI23EF+iWoOg2LfK+QpU1w8IntobW0QOyhq
         IAL8NZlXxEMVgGElLyUWvftmt9VRvkAOptx/57r1elnvBh38A7mciQnu9A6iVat0FXn3
         kYQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=H3UavRC9eYgkj+4cOfjLIrmnA6AzYdpwCwf/ShfW9hQ=;
        b=OBGI457py5MoFB6icZ06bStbjBCg59T5UNR4lGjIufaAm8bZ+zbPjCD3HAIckZFykW
         d5iSzi08wMUt3mBlBMRww8z5AW1SHKYc/x/NaYQLy89HGjp61Z8zIAfq42RWkbnOJ7dU
         yvq63w1h1CI1L6O393qrpRMF/e7m8aGzNWRMVO6x//9jDECOyXXrntY3Wokb7/t0d+/3
         LZKF8z6XZ2k2Afzu8D2KnLzF+W/uLbUmxpjF3yJcVr5E0ZrhBUJQ/QsVVYCu04eDNtAv
         8VvJ+3oalxu3d9/conNt4SuzDz9RwTLaYZREUvKvw24SfNADrLWmo3pImdZITkMQZMVo
         yBgw==
X-Gm-Message-State: AOAM532Kch66dWsNutcy2PFJdlOip1UMObtWmipPiUyoNN2f385fvyAU
	q1zdS0eBXcyNvidIx0RTXzGhoSPnOFk=
X-Google-Smtp-Source: ABdhPJzXdI+q3OKBxStBphCjYlWUJ0mG15YP3Ll/nzYNCy/kg1r7dCEVh+jW4a9KqbSTBAueNvLyuQ==
X-Received: by 2002:a5d:47af:: with SMTP id 15mr5361300wrb.234.1619189972838;
        Fri, 23 Apr 2021 07:59:32 -0700 (PDT)
Received: from agape ([5.171.72.99])
        by smtp.gmail.com with ESMTPSA id 3sm13304464wma.45.2021.04.23.07.59.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Apr 2021 07:59:32 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 31/49] staging: rtl8723bs: remove unused debug macros tied to _RTL871X_IOCTL_C_ definition
Date: Fri, 23 Apr 2021 16:58:22 +0200
Message-Id: <ad84cfbc3722fd2124c4a610b3bc7c7113b8b60d.1619189489.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1619189489.git.fabioaiuto83@gmail.com>
References: <cover.1619189489.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove unused private debug macros tied to
_RTL871X_IOCTL_C_ definition.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/include/rtw_debug.h | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_debug.h b/drivers/staging/rtl8723bs/include/rtw_debug.h
index 4146acb1cbb2..501155c8c9cf 100644
--- a/drivers/staging/rtl8723bs/include/rtw_debug.h
+++ b/drivers/staging/rtl8723bs/include/rtw_debug.h
@@ -7,7 +7,6 @@
 #ifndef __RTW_DEBUG_H__
 #define __RTW_DEBUG_H__
 
-#define _module_rtl871x_ioctl_c_		BIT(16)
 #define _module_rtl871x_ioctl_set_c_		BIT(17)
 #define _module_rtl871x_ioctl_query_c_	BIT(18)
 #define _module_rtl871x_pwrctrl_c_			BIT(19)
@@ -27,9 +26,7 @@
 
 #undef _MODULE_DEFINE_
 
-#if defined _RTL871X_IOCTL_C_
-	#define	_MODULE_DEFINE_	_module_rtl871x_ioctl_c_
-#elif defined _RTL871X_IOCTL_SET_C_
+#if defined _RTL871X_IOCTL_SET_C_
 	#define	_MODULE_DEFINE_	_module_rtl871x_ioctl_set_c_
 #elif defined _RTL871X_IOCTL_QUERY_C_
 	#define	_MODULE_DEFINE_	_module_rtl871x_ioctl_query_c_
-- 
2.20.1

