Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 855FD2F9A
	for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 07:44:27 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id r9so103823463ejj.3
        for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 00:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rmk90qSfuSLmAzINt8x7JaHcuQoCwpmT2qAtZaxL5BQ=;
        b=rERfYBX0hrL5IfMOb1PqTc4berZCqBq9x2tO4CjX2DLnEKmr5828UkVPfDgwpt1sBK
         xIAyupBn265KdGbI8pM5cyXEpKSMfD6ZWTuXeS72nnGpaqdALaxZMIQ4kcCgu4gGU098
         wJ5o7bLXSmMv8gk6DsqP2waisYavIv+BuNaOv+1gu+6DDHz0CNlJ9L7NUGz4Ce8LeWJs
         Ler3RRN2Js80nGfg5jOQlmR480Px7Mv7FhyaXZz5o6i5u366pUmUZSNhfa5rbKuREn+1
         +eRMLJZvRS85zKZcSg+tNmmDZ6CHQKuG348wTJWLjsVe7jdv53608v3RSt6J79A+hiI7
         VtEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rmk90qSfuSLmAzINt8x7JaHcuQoCwpmT2qAtZaxL5BQ=;
        b=JnLH6QmQTWG8S7Kmuy7zb829kSZPWZavhmR8L8k79Nm9vzvTkqs7X/iX9NWJWX0pbm
         JlJabAuo7DnAFTBIujqTPnJy/9BRmCFmo4NJFs9QvmXNDGrDIFTBWr5PJDg6Kdsddura
         BMoyuiqWE855Dvx+Nkxg/tAddvfRCaK9sJw/brjTznvnzNTOf6IcMVrShDw1QDMhAtyO
         Xcwdaj0/HsGGJBtxmVtPqylL6U8CV0bbqldXW50i5fTJ8c8R/SnAZ10QFbDmFMqbKNnJ
         9OjNnWEYcwoablhqQGajoQ1N6JsyVz1v300KJqLllS9ELyaoqBcE8U0XZ0A9+e//Qrre
         0xrQ==
X-Gm-Message-State: AOAM5308AYtV3JKe8aYT68gnpVo4niMU++spVDSJSy/zF74Z7Gqs7/wc
	aH7tb7KYNYeb/qf+kZaD4ww=
X-Google-Smtp-Source: ABdhPJzTHYO6dnSb5+l2Z4aG/VGkbhCHMo4Vtd/qGVQ9j1JemydFsAVwZV5Re+/cNahUWjuH6fxxgw==
X-Received: by 2002:a17:906:2616:: with SMTP id h22mr2905494ejc.126.1619768666139;
        Fri, 30 Apr 2021 00:44:26 -0700 (PDT)
Received: from agape ([5.171.81.86])
        by smtp.gmail.com with ESMTPSA id w13sm633778edc.81.2021.04.30.00.44.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Apr 2021 00:44:25 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 13/43] staging: rtl8723bs: remove unused ODM_dbg_enter
Date: Fri, 30 Apr 2021 09:43:31 +0200
Message-Id: <9f31d5685462f7f5d69956fdafb3611727a3f9a2.1619768150.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1619768150.git.fabioaiuto83@gmail.com>
References: <cover.1619768150.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove unused ODM_dbg_enter macro definition.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/hal/odm_debug.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/hal/odm_debug.h b/drivers/staging/rtl8723bs/hal/odm_debug.h
index cd68c583699a..7c9a87fb8e51 100644
--- a/drivers/staging/rtl8723bs/hal/odm_debug.h
+++ b/drivers/staging/rtl8723bs/hal/odm_debug.h
@@ -97,7 +97,6 @@
 
 #if DBG
 #else
-#define ODM_dbg_enter()					do {} while (0)
 #define ODM_dbg_exit()					do {} while (0)
 #endif
 
-- 
2.20.1

