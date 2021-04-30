Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96FAF2F9C
	for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 14:45:12 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id r9so105627864ejj.3
        for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 07:45:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mmTLlnaxutpjq4SbPPubfzCaa9R8HdPWxGtl/Jb9hiU=;
        b=dWVrzNF1Bv0XidauVaYB+aR7ADoOc9MdcZaPGme44ebKpxVUIIyyebuyMphR86kvcI
         R4vlNdTr8TgmXaUr1pz6etJPrXJLdv4jwRbw5Pa+UnA+A8jl26f5NZTMRtzWxnNVpWqE
         rn2wYYbmwFjkN116NX9Qc5ugw0yx02iDO3dLJTVrLrzguTM4+z7r7HtsD1aR9DQ7cd61
         bQRQpIeGCvq+RQcbUvyCic85lCALzYRT7XuGcOdCHP4VuaQIfccQXwgbSzMN1ZxbxIn9
         n61OwGHcu0OFMcKIBsrt+FDCSUWbzEueIGqVY0pW8iOI6vxQTAhtCYf2gToUBWK2MMSY
         2Ysg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mmTLlnaxutpjq4SbPPubfzCaa9R8HdPWxGtl/Jb9hiU=;
        b=RhGQuKGOOzAwzu1i5VWylss8EDjRs2CDOwIWLuo2SYLciylR8eNkQ5WYv6PBoofvcw
         0stqOv8+2s04wNYcMOxKa0Aukt/eSlF4Bag/q+O6ng55DBbm4LetuhlG+F+edAt9oJ4y
         ryblrU/0aqwvD1gf4m0cJPK8dHEWPyCIYIJHE+DZkGyRj9gqH6nnsWpMOlICVKumkNTO
         k/+8cOL5irtqvNUFv5IahPGPzZhdnzKOvpiz7lwx969aCLs0AjpZ8okQQ5++uNmjfhax
         BV6oIedJLZ7Rwh+tzMcWMBxlWQo6hsq++maX2bRW9z0jOjbVZl9PBFL8dZDb5DVJ4KVj
         RcDA==
X-Gm-Message-State: AOAM532RoAxnplVRqUpteIwgeRcms3pNuciyQ7qGg5EXUcMRjQJ2IyZH
	/epqZTxaQG7GPdKlV1GN8zI=
X-Google-Smtp-Source: ABdhPJzGaL6SkLqztt5OCrmuGR+EzIiVgi4XI1zX0RtJ4yzrUbiFVTrKzZGFAdjcxPGuEgg2kvBDYw==
X-Received: by 2002:a17:906:4486:: with SMTP id y6mr4695984ejo.466.1619793911175;
        Fri, 30 Apr 2021 07:45:11 -0700 (PDT)
Received: from agape ([109.52.244.36])
        by smtp.gmail.com with ESMTPSA id i19sm2045855ejd.114.2021.04.30.07.45.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Apr 2021 07:45:10 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 38/43] staging: rtl8723bs: remove RT_DISP macro definition
Date: Fri, 30 Apr 2021 16:44:08 +0200
Message-Id: <24bbaec7c37f73338294b84efe036a8c8cce4f17.1619793406.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1619793405.git.fabioaiuto83@gmail.com>
References: <cover.1619793405.git.fabioaiuto83@gmail.com>
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

