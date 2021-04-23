Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 292CE2FA1
	for <linux-staging@lists.linux.dev>; Fri, 23 Apr 2021 14:59:24 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id s7so48627309wru.6
        for <linux-staging@lists.linux.dev>; Fri, 23 Apr 2021 07:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XYEtVs71demyjHNP7zVoWDRnn91iokd22i1cMtV03Xk=;
        b=dTFDOVUhCQy/HyZI45D/BRGsGYn7pPNKhW0rjzitmxWCiHZGwjhGtsYbP0KvpSZjFG
         ia9lz7GVujnpkyw+xpAAYjXvhBdbh1BVf1cvMhN2tG6bnIovqsk6JA3CCzOIP2Y956hH
         /4ZzsC/hMFx7RdFzpxz32qCeVYyLHX+tsdG2FlKgamN4xvIP1i6/A4nf30qyZbztwPOi
         FwbEgMmE6KyWaC4xNZaaENRLi1mG48n+RdWOrH6ihEmpjHtquXQz03VcQWBosYZHqKQt
         2wZgGoX3Rm5s1rw3pG3kxBQjHtoyiPUeH9NuqfaueM4swuXrM7mpYfZ9L1bY6lzHDJV0
         ny/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XYEtVs71demyjHNP7zVoWDRnn91iokd22i1cMtV03Xk=;
        b=aai99qqIIOvSg1dAwWfOzthE/ierRM8lXCVfvfZTqGmPZ6v0SEpWa1AhEnbG6p1ajB
         uHH5KGWkEAdmIA9NKxnTEERAeXtr7U9kubRcC5UHsVPzf/tI+SFbiroJIj8cDt0UUpDo
         QP6PpJWI6KXrUH1xdIgDtve8J40Ds5GQdI+Do4Zy3R1K8w2AUMOdWWx9DGaCeagNKV0i
         cgS2fmG+6ZTm0qCSthVvhMSmBhsrE0+Fg4zTH/Bb1xmisZ4pJXfy2Xkqpfccm4SxkIBA
         hGobrB8asBRQ2/22wcE2f1AiYM0Zrja9KXcYPxwczRQdCGrw7Re0St/tRIvy/QOqV+N5
         OSLg==
X-Gm-Message-State: AOAM530j4215uD1vCVUA4AmkrQprYHi8FcViSoCL0HdVst46blnu0Sfq
	PtsW1iR7NPECf7a8quUfwmUkzZK6fgU=
X-Google-Smtp-Source: ABdhPJwR972YNryguem4qNYhTf7ipjU9t2KZfvCsg+GRcCleP6kgvUTGKZiRZDwYpKiEulOAARcF0w==
X-Received: by 2002:a05:6000:18ae:: with SMTP id b14mr5259719wri.211.1619189962771;
        Fri, 23 Apr 2021 07:59:22 -0700 (PDT)
Received: from agape ([5.171.72.99])
        by smtp.gmail.com with ESMTPSA id 2sm10781344wmi.19.2021.04.23.07.59.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Apr 2021 07:59:22 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 25/49] staging: rtl8723bs: remove obsolete _IO_OSDEP_C_ debug macro definition
Date: Fri, 23 Apr 2021 16:58:16 +0200
Message-Id: <a2d3a6e3523b06ab706d3c137a9703705dabc1c7.1619189489.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1619189489.git.fabioaiuto83@gmail.com>
References: <cover.1619189489.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove _IO_OSDEP_C_ debug macro definition
untied to any tracing component.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/include/rtw_debug.h | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_debug.h b/drivers/staging/rtl8723bs/include/rtw_debug.h
index 7206fdfbe12d..470edb0b655b 100644
--- a/drivers/staging/rtl8723bs/include/rtw_debug.h
+++ b/drivers/staging/rtl8723bs/include/rtw_debug.h
@@ -7,7 +7,6 @@
 #ifndef __RTW_DEBUG_H__
 #define __RTW_DEBUG_H__
 
-#define _module_io_osdep_c_		BIT(10)
 #define _module_os_intfs_c_			BIT(11)
 #define _module_rtl871x_security_c_		BIT(12)
 #define _module_rtl871x_eeprom_c_			BIT(13)
@@ -33,9 +32,7 @@
 
 #undef _MODULE_DEFINE_
 
-#if defined _IO_OSDEP_C_
-	#define _MODULE_DEFINE_	_module_io_osdep_c_
-#elif defined _OS_INTFS_C_
+#if defined _OS_INTFS_C_
 	#define	_MODULE_DEFINE_	_module_os_intfs_c_
 #elif defined _RTW_SECURITY_C_
 	#define	_MODULE_DEFINE_	_module_rtl871x_security_c_
-- 
2.20.1

