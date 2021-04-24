Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91AAF71
	for <linux-staging@lists.linux.dev>; Sat, 24 Apr 2021 09:03:30 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id p6so44011720wrn.9
        for <linux-staging@lists.linux.dev>; Sat, 24 Apr 2021 02:03:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=H3UavRC9eYgkj+4cOfjLIrmnA6AzYdpwCwf/ShfW9hQ=;
        b=XEgDLRgZRZayaU+w9go4KUuXejwHt4ngSj/gdCgquH7wNF3Nrm7VxC2NFKHRf5jImv
         0O+OEhinorkuF8NKK3oVsT2/Wl7oqAqOCjhdQsdjo3te8DA1PHK49af2oPEEsMJwFRnC
         VUS9PSyCdAkkPFx/m1vgUxEFOXd/AUmLLacEpVuqUK8uHUylmf9Dah5PG9YI5qNoqGvS
         P5kfqdv5HaKkFD9X53h6NVH1qqs2XPst/5KQRo2T83x3oY9Ia0uYvVDQJNdQmpn33k7S
         kqhN8Cb5Wp6pCZUWWqf5D9H9+Yh3dNdSLXIqQ998EXFvH7c5SxZ/vcRRkYhr2lPjIo3K
         EPww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=H3UavRC9eYgkj+4cOfjLIrmnA6AzYdpwCwf/ShfW9hQ=;
        b=NMnkwCuv5WSvMwkuIIB8Z7A2umfcWRfjPhKCpSzJ5/J97lD6quFlsIuwsR17pL8DGk
         hFBIGfSWxi4nlF2T2dU3rufB/wrY5KPMOKqm90LDwyhy0ktqM5Bp5hwQvjH5awnQpF12
         KFiwDvQnvGmgwhpVVf3AHIo11cyjI2LwnX8qhB/J8NjeQYvri17pHv/MRh5UnqwTcZDX
         4z9eTC0JiqhNeQ1jtsFX3pJoJ8A+97TcNd4uOfNO9tLTIZ34tD14FeJX4NjQk6YVS1Aq
         JCMS2GiPPGA+Zf5JvVsMLjwnBdbFn03KDt7EUvRIpVVe+QL2LefC9afcB1uMfpixctF9
         zrsQ==
X-Gm-Message-State: AOAM533ZM3AJO0pB0gvAdRQG2IIuw1AsZfl9MXC5/MGeuCghQDWAX8iX
	0MePUOnC1aHQnGV3OX3KpSc=
X-Google-Smtp-Source: ABdhPJxmZoFsCzvzeD5LiWto+xbsg88T15gUf7i7yrq7cLhB2AiuFo1ZQCcCltqbO6pQ1Pee2m1AdA==
X-Received: by 2002:a5d:564a:: with SMTP id j10mr9977556wrw.108.1619255009220;
        Sat, 24 Apr 2021 02:03:29 -0700 (PDT)
Received: from agape ([5.171.80.252])
        by smtp.gmail.com with ESMTPSA id b12sm13430800wrn.18.2021.04.24.02.03.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Apr 2021 02:03:28 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: joe@perches.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 32/50] staging: rtl8723bs: remove unused debug macros tied to _RTL871X_IOCTL_C_ definition
Date: Sat, 24 Apr 2021 11:02:15 +0200
Message-Id: <216def2b5e244490debe86aafdc23cabc32f3c1e.1619254603.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1619254603.git.fabioaiuto83@gmail.com>
References: <cover.1619254603.git.fabioaiuto83@gmail.com>
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

