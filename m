Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA4B22F9A
	for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 14:57:24 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id u3so27005338eja.12
        for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 07:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EkTXw+UrM2wYCxNZsOy4gcxyM1XqC056VTNVEgdSP/k=;
        b=X5QnQ04dxENC/9z7tTKzI0IbZbHdHArKrQ0Ks6NiStIML8kju0MVmGe44k7Tb6fzQY
         fb1qpf5NWvIUJse8ZfEamIqIG6vHB3qQVb8xOaKc6YNygRb/EQdobgTB+VltHxgTy0sC
         SbrBiTC1U4PCW1SVEF/DxLNP0M1UuV782/mQIDDM75W6M9nloonjhaOavtMDn7ddS0qr
         Dx4gCy2zbGgMRQ4HsgfBoJy0LoyZTL/k541+sfAmR40rxtW57rFiJsh2SxaCx1kumoDR
         gfoYNlO2bhukt/sSk+yUtHDTWIyNgcWG5dJDdmxQ9GecotIYoof4EB6l3wdD+EW/4W6F
         zf8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EkTXw+UrM2wYCxNZsOy4gcxyM1XqC056VTNVEgdSP/k=;
        b=hAXRPcFtjh46ccNhdicSlvKaVzfc/W5vp7c2QDIuORoyp8TQu3QbUvfdH+c4I9C3O/
         d0AE9yA7FwMHRrMbJjJqe78HEsvoM51qNgbEfy3FTXSx3e08h8GaX4YwQSUEVdbVaDCX
         9SEjNMMTSmJV39mYwF1hGClAy8fKCjcACF0w+PDUZUdoIcOqA3YHKOiSxAplP82pnVkS
         K3iTK1eZKO2U9+GjwVUkyHNjb9dSlE/mY+IgO1cHEeyJz5+rmdRAf2zsc4lUyGShS8mW
         j5cd+Q3pEUsmILkG/ZihVX58MqVEW1gTNsZDmx8KWRsbtev8T0XSv08HTAC2H+ZJspaB
         ws2w==
X-Gm-Message-State: AOAM531VDfHbKgw9PnVKIk5ebT2kuLx/BEmUCtYq4nOuPnLeefxyKloU
	FoHy07fhNhPWka+0EA907Tc=
X-Google-Smtp-Source: ABdhPJyVEwtVXoXqxZYwzK6RL7nlFaENTyDhGG7jrbisQylq+WGn3fvprsRJOGQmL/SYCHuU83LQ0Q==
X-Received: by 2002:a17:907:2cc2:: with SMTP id hg2mr4614544ejc.62.1619794643347;
        Fri, 30 Apr 2021 07:57:23 -0700 (PDT)
Received: from agape ([109.52.244.36])
        by smtp.gmail.com with ESMTPSA id eb9sm2065310ejc.96.2021.04.30.07.57.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Apr 2021 07:57:22 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 10/43] staging: rtl8723bs: remove unused ODM_RT_ASSERT macro
Date: Fri, 30 Apr 2021 16:56:32 +0200
Message-Id: <4d9fd27f60d1ef4bf8384d411885d05c6d40768e.1619794331.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1619794331.git.fabioaiuto83@gmail.com>
References: <cover.1619794331.git.fabioaiuto83@gmail.com>
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

