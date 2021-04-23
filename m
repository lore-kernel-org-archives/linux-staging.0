Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CA6070
	for <linux-staging@lists.linux.dev>; Fri, 23 Apr 2021 15:00:01 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id k4-20020a7bc4040000b02901331d89fb83so1391253wmi.5
        for <linux-staging@lists.linux.dev>; Fri, 23 Apr 2021 08:00:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=W/TJrGDj05Z5uJLXQBzCdRgNPqtzRz59d+0oYJlq47g=;
        b=M/G+u2eAVb66uZ6uPLMa7JVEFc/VlZSxwEun4bYzU8pctXVzR0l1D/uakACu6kcvDk
         gWrmG8wS8bHJqRPKZPuDR0HFx+veyaR7nDKI7imS8YIDWftKM2KUOMNhHmFry0AsG+jB
         SY0juGFAPmkn1L+fp+jAl1mFmP7UmwZS0+jaqQGhnk3it6Y6fFveawzHCC7xAjt45BAO
         VAVodtv088CyvXj4WG1IcrcOttjA8NI96vPL9fjjj0m7La0cXOHgNfN1HvRjA54daNEP
         I1s7J+0bcQ6Nqxp+l6dMQVn2wjMv5ByvG7xSQMVJfOB/FDrS54qNOOEEuA3gDBBM5ugg
         5q0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=W/TJrGDj05Z5uJLXQBzCdRgNPqtzRz59d+0oYJlq47g=;
        b=o2/qk7j/pe7Q7qPx367cd52/yaLRwXhAaTdunME1AVniivfQXsir82JIDdRFou7zBR
         Q+9WWS1c2VhU7nPw2eGufCsR8eYP7J/PlG3Df5h2dhAhTsDuF8FmF/bwN3Nra+2DG99D
         yVDte/2uEMQ4E216YaFTD6vzmlA03n6zR1YOS8ldk1201EHvYFt1+peOIAGxpCZICig3
         Tajw4BtI0qwFXFhJ3B+mTyTfdTYq+B2G1sOL9OqVVtX9m17fN3hEwcPx2mYQACoUb56C
         6Wwq9es142J4vZNfNk/X+NCYY2Ni6FdR9YIL0NX8F+xWqyD7VLZmvtAy0n1zKJ+beJB2
         Z7Jw==
X-Gm-Message-State: AOAM531jBk0DoBEn35siwOJXo9ht2rsfaQzWsqvOkpAx/SEPJ4CYssog
	kVfVmUXj7wjmg71JswW8p/TGgHQ6RTo=
X-Google-Smtp-Source: ABdhPJyfpHJpr8wB56AVdcaIDqjelwuCdW1B04lxIGTzRcBqoeh1S6m3MCBEtPe9t04gzdYNlrpmbg==
X-Received: by 2002:a1c:f313:: with SMTP id q19mr4703267wmq.142.1619189999774;
        Fri, 23 Apr 2021 07:59:59 -0700 (PDT)
Received: from agape ([5.171.72.99])
        by smtp.gmail.com with ESMTPSA id f1sm9394567wru.60.2021.04.23.07.59.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Apr 2021 07:59:59 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 47/49] staging: rtl8723bs: remove unsed debug macros tied to no particular code debug
Date: Fri, 23 Apr 2021 16:58:38 +0200
Message-Id: <8a0e98c54988c5abf0669e261a6dc4eda63e4be1.1619189489.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1619189489.git.fabioaiuto83@gmail.com>
References: <cover.1619189489.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove unused debug macros tied to no particular code debug

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/include/rtw_debug.h | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_debug.h b/drivers/staging/rtl8723bs/include/rtw_debug.h
index 6b657190b124..c9f53c08efbb 100644
--- a/drivers/staging/rtl8723bs/include/rtw_debug.h
+++ b/drivers/staging/rtl8723bs/include/rtw_debug.h
@@ -11,11 +11,7 @@
 
 #undef _MODULE_DEFINE_
 
-#if defined _RTL8192C_XMIT_C_
-	#define	_MODULE_DEFINE_	1
-#elif defined _RTL8723AS_XMIT_C_
-	#define	_MODULE_DEFINE_	1
-#elif defined _RTL8712_RECV_C_
+#if defined _RTL8712_RECV_C_
 	#define	_MODULE_DEFINE_	_module_rtl8712_recv_c_
 #elif defined _RTL8192CU_RECV_C_
 	#define	_MODULE_DEFINE_	_module_rtl8712_recv_c_
-- 
2.20.1

