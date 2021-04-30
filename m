Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64D3D2F9A
	for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 14:58:11 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id d14so19168615edc.12
        for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 07:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mmTLlnaxutpjq4SbPPubfzCaa9R8HdPWxGtl/Jb9hiU=;
        b=j0YTVWc/INk9q8Jh7pY9pgiAZz1xGLKrZEEj0yE/3pCx8oQPecKgpLbGhbYsOJ7pKJ
         JjRKuEWs5ZclMDFlh+B4lPfz1dXDKibhW6k3XOrG74bsMItQIVWP3tnQnlvZYBQZIqOh
         HR4udTG4O5oKFc9UODEufZRoFPjD1cXt0RcEExUYcF8R9rYEAm+IF0VPDvlBFtTM+ofJ
         IXIw1FsG49FgBWIIA5bBBW1QsrQQoQgbxGtua9HS/DWsGrpdN7y1l0/iUU8/wjpEd9eB
         DGtMSlT4o0hFL2RreDUTOHhhfDOR7CaNAJtuoooS6SJ7pDxqL2N1nF4QoMceoi7MMNgd
         p17g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mmTLlnaxutpjq4SbPPubfzCaa9R8HdPWxGtl/Jb9hiU=;
        b=A6YmpMzc7b738TvPjgJEjswoUz4mNqfxP2QledNKN87HENwkxPsJqVo0GZKb7sUj2y
         A07iwjOP2KkRmoc2UOTFDDfQMCq32b++J1M+okbECEes0M/7nsR8nLC+V/ltKBAe/vPp
         93QmU1p6zeB1f0DN/0KHUKjFVRIHxzq5jwpdlCmKDd9gFp0qHemv/uOLETAMSmBsqFEb
         rV/NSq0sLHQOSxZtb9rkcR7dB5IeM2VgF9Cqss5xzgvi86hCyv6H6oFowvQgzTwM0m7s
         4BNLhRaUeVjSUg8SNcOegOuGYrwh5Fu8Uv7+pN08l7opI5vrK10XPJbMndefbOM16Adb
         JxRg==
X-Gm-Message-State: AOAM5310RyD4XED1BU9bOUOpdML/dC914SwtI6QzDB2h684rqSQkquTU
	vL52Fo+HjhHCEQXGSlxl4XY=
X-Google-Smtp-Source: ABdhPJzPEFffmEaM53ijOk3DOoKZhxBKSkOEVb26hkRVFEGpJ+wWAAcA/6714TJf3e+h0Vk1HBz1Hw==
X-Received: by 2002:a05:6402:254c:: with SMTP id l12mr6362027edb.278.1619794688963;
        Fri, 30 Apr 2021 07:58:08 -0700 (PDT)
Received: from agape ([109.52.244.36])
        by smtp.gmail.com with ESMTPSA id ch30sm1445519edb.92.2021.04.30.07.58.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Apr 2021 07:58:08 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 38/43] staging: rtl8723bs: remove RT_DISP macro definition
Date: Fri, 30 Apr 2021 16:57:00 +0200
Message-Id: <8983c3077979830aec02427ed895507213b38f95.1619794331.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1619794331.git.fabioaiuto83@gmail.com>
References: <cover.1619794331.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove unused RT_DISP macro definition.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/hal/odm_debug.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/odm_debug.h b/drivers/staging/rtl8723bs/hal/odm_debug.h
index c6c62bed5f3c..c7c7865dd7e2 100644
--- a/drivers/staging/rtl8723bs/hal/odm_debug.h
+++ b/drivers/staging/rtl8723bs/hal/odm_debug.h
@@ -85,9 +85,6 @@
 #define ODM_COMP_COMMON				BIT30
 #define ODM_COMP_INIT				BIT31
 
-/*------------------------Export Marco Definition---------------------------*/
-	#define RT_DISP(dbgtype, dbgflag, printstr)
-
 void ODM_InitDebugSetting(struct dm_odm_t *pDM_Odm);
 
 #endif	/*  __ODM_DBG_H__ */
-- 
2.20.1

