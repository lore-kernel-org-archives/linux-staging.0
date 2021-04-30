Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DE822F9A
	for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 07:44:22 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id n25so9410344edr.5
        for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 00:44:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EkTXw+UrM2wYCxNZsOy4gcxyM1XqC056VTNVEgdSP/k=;
        b=L9aA3onk70KoVbG2n75lGBuKAbNhxRELftVnnCcSvhnPfPHkLpexNQwNacrYxuXGVu
         0Mxe0CzFIFDpKJ5dTUgNtzhu4Wl455874LfM9oh3u+RU+Ok/ETyUdpTVKmQOJvMZ9cyH
         3JyiSKYBVRiK3JmfyHpfTw9jtjwCL3e1JlPjyNqcSI6sG5++AXpgk2IzVBVmxx5jAidb
         fJSmtozcGEATD2BDLTk2v+RpwHE5bzoBsBQIjSkEVA/msS1rIId49EhQ8w4iJMUiMS0N
         5csNI8Akw5tYNV0wKGIzdx0lVt9AP7O79DEBmUaHQFPm8MNa50p9nAu+9HGa1sBVYNgw
         5ErQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EkTXw+UrM2wYCxNZsOy4gcxyM1XqC056VTNVEgdSP/k=;
        b=cfcTEXtG0h113xpRdpr6cdn58g/Oox18LPtS2+Ldg8O4W7jOQJpPCdsU2deAnTzwd2
         L+zEEtmvR4XOpTN2kffczJqeN5OyU54ffFlDOKZ3mZAu/rsyaX6QdG0h5LRlk+L3iZIT
         pfe9cZzTK8JVemV/cmIuRgogzuSnvm0yhYvv8GM7iZTgR+yoXHXOAu3EPNLbcxnj8ozL
         0wW0PE9cPP8T9xYc9NSXSZS3uudmxYpBshD9MCmQphDrVLa1JrnVRpSE6uv0lAT+apaa
         dYENtqfu0f0iQzvUc+AwMibtcBwzoFZrBNkjgzfQRbBXQqXBcJXiPm8mjaKZ6k0y0UZG
         GBAQ==
X-Gm-Message-State: AOAM532nUGXMm6SAPPKsb/Y5m/il78ksNfh6/A8UUVYvc2o3CDVxWUDg
	Ml9PhKS++IIIhyKECbIDy91GdeBis8XF3w==
X-Google-Smtp-Source: ABdhPJzc8i1HpHmQIZfv9whW3viy851DplciIVEPliAlOXlfl+TtMQQsscoQ2K9RhKPZ36GO6sI0QA==
X-Received: by 2002:a05:6402:617:: with SMTP id n23mr4205035edv.45.1619768661243;
        Fri, 30 Apr 2021 00:44:21 -0700 (PDT)
Received: from agape ([5.171.81.86])
        by smtp.gmail.com with ESMTPSA id m2sm654691edc.10.2021.04.30.00.44.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Apr 2021 00:44:20 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 10/43] staging: rtl8723bs: remove unused ODM_RT_ASSERT macro
Date: Fri, 30 Apr 2021 09:43:28 +0200
Message-Id: <59052a164bba7c68c471a9c7761633dc99c1ebfe.1619768150.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1619768150.git.fabioaiuto83@gmail.com>
References: <cover.1619768150.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove unused ODM_RT_ASSERT macro declarations.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/hal/odm_debug.h | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/odm_debug.h b/drivers/staging/rtl8723bs/hal/odm_debug.h
index 09e8bfec7664..b4fc247242fe 100644
--- a/drivers/staging/rtl8723bs/hal/odm_debug.h
+++ b/drivers/staging/rtl8723bs/hal/odm_debug.h
@@ -96,20 +96,6 @@
 #endif
 
 #if DBG
-#define ODM_RT_ASSERT(pDM_Odm, expr, fmt)\
-	do {\
-		if (!expr) {\
-			DbgPrint("Assertion failed! %s at ......\n", #expr);\
-			DbgPrint(\
-				"      ......%s,%s, line =%d\n",\
-				__FILE__,\
-				__func__,\
-				__LINE__\
-			);\
-			RT_PRINTK fmt;\
-			ASSERT(false);\
-		} \
-	} while (0)
 #define ODM_dbg_trace(str) { DbgPrint("%s:%s\n", __func__, str); }
 
 #define ODM_PRINT_ADDR(pDM_Odm, comp, level, title_str, ptr)\
@@ -129,7 +115,6 @@
 		} \
 	} while (0)
 #else
-#define ODM_RT_ASSERT(pDM_Odm, expr, fmt)		no_printk fmt
 #define ODM_dbg_enter()					do {} while (0)
 #define ODM_dbg_exit()					do {} while (0)
 #define ODM_dbg_trace(str)				no_printk("%s", str)
-- 
2.20.1

