Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D84272FB6
	for <linux-staging@lists.linux.dev>; Sat, 18 Sep 2021 09:25:06 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id l18-20020a05600c4f1200b002f8cf606262so11727689wmq.1
        for <linux-staging@lists.linux.dev>; Sat, 18 Sep 2021 02:25:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CJYLNkpD2oLEZhMe2V2yp/Hy0smx9hVqOX2DDPaz9/M=;
        b=DC/XyPEbsDlZaFITonycHO6pphZKVYFRejc9uVaQvGrgMriMuYdVV4iJ7Ilbo/0msM
         5xBPrg7ml9tdEmcsQAuuvHCwpXsQDy+qyPnHK2l6duk1mRHilECpL+6SBODdrD6EtMFI
         qfIcVK4uh5WTs9thl5UHDfwWuLBsO/fSAYHHvWfHJXj61mGYR6N3IgbWcBU762to03yA
         +9Z4Y4wrqYSl61shWNVyxtEMzDBx/iNC8Vhkv8q61gfB3sx69xHDgLfQhHMcSzxSEtDj
         C/qtNqrhU/+RNg+Dc+IXrYHpgIPRlLyKT41pyRMH99HGJGOXtsqnaruPgRh/LpAuu9YM
         nbjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CJYLNkpD2oLEZhMe2V2yp/Hy0smx9hVqOX2DDPaz9/M=;
        b=bTcjSUiIglkOZvRAaMJutmZ1ZgdNUuKmkmg+15yHMoS925uE+R2+JzKamoUTPbgIpv
         4zRVXo7u3+PPYOyeH2X1GCaqXa+ru0nAZuQ9up1SzAPB1GqUnlWqgTK5D2sh5DcpBz8/
         m+5hiNSSblyZibllzz41jq2S5mAt9WZGT71gTg7yhFKZZRT3kWn5D/jWer5wjeWND+jn
         iaeiUPjwhxjQdugszm4Xh8qWdN0dY3FTsCn89Hj9fjRSMab/CLZwCLUgz7ih3v+D0pia
         L3oqQyhOTOk4dDA2JeHZK5hLTBZfjdb9ZnkXGwjE1zj2Dd4oMNkQAVUfDL6gcOzQHFku
         1nng==
X-Gm-Message-State: AOAM5318+7JvyE5aPuVFwj4wcftiPZ12aPujlVt9ZVQvJww3llrtLUCh
	x4AvWczi/PRTk5SLH8DnzBd7QpydVObpqA==
X-Google-Smtp-Source: ABdhPJw6tAn9YmXXQsSaQ/AQQhaq1nzCQMk8BQJtjqKZ0O2NV1vJvG7m07763ft9wS7xGC9me0qMrA==
X-Received: by 2002:a7b:c107:: with SMTP id w7mr14767682wmi.91.1631957105264;
        Sat, 18 Sep 2021 02:25:05 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::ae40])
        by smtp.gmail.com with ESMTPSA id 5sm4233742wmb.37.2021.09.18.02.25.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Sep 2021 02:25:04 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH v2 01/12] staging: r8188eu: remove comments from odm_interface.h
Date: Sat, 18 Sep 2021 11:24:32 +0200
Message-Id: <20210918092443.8724-2-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210918092443.8724-1-straube.linux@gmail.com>
References: <20210918092443.8724-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In order to make further cleanup easier to review remove some
unnecessary comments from odm_interface.h

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 .../staging/r8188eu/include/odm_interface.h   | 22 -------------------
 1 file changed, 22 deletions(-)

diff --git a/drivers/staging/r8188eu/include/odm_interface.h b/drivers/staging/r8188eu/include/odm_interface.h
index 95e0303c28b8..efc2ca069a3d 100644
--- a/drivers/staging/r8188eu/include/odm_interface.h
+++ b/drivers/staging/r8188eu/include/odm_interface.h
@@ -4,29 +4,11 @@
 #ifndef	__ODM_INTERFACE_H__
 #define __ODM_INTERFACE_H__
 
-/*  */
-/*  =========== Constant/Structure/Enum/... Define */
-/*  */
-
-/*  */
-/*  =========== Macro Define */
-/*  */
-
 #define _reg_all(_name)			ODM_##_name
 #define _reg_ic(_name, _ic)		ODM_##_name##_ic
 #define _bit_all(_name)			BIT_##_name
 #define _bit_ic(_name, _ic)		BIT_##_name##_ic
 
-/*  _cat: implemented by Token-Pasting Operator. */
-
-/*===================================
-
-#define ODM_REG_DIG_11N		0xC50
-#define ODM_REG_DIG_11AC	0xDDD
-
-ODM_REG(DIG,_pDM_Odm)
-=====================================*/
-
 #define _reg_11N(_name)			ODM_REG_##_name##_11N
 #define _reg_11AC(_name)		ODM_REG_##_name##_11AC
 #define _bit_11N(_name)			ODM_BIT_##_name##_11N
@@ -38,10 +20,6 @@ ODM_REG(DIG,_pDM_Odm)
 		_func##_11AC(_name)					\
 	)
 
-/*  _name: name of register or bit. */
-/*  Example: "ODM_REG(R_A_AGC_CORE1, pDM_Odm)" */
-/*         gets "ODM_R_A_AGC_CORE1" or "ODM_R_A_AGC_CORE1_8192C",
- *	   depends on SupportICType. */
 #define ODM_REG(_name, _pDM_Odm) _cat(_name, _pDM_Odm->SupportICType, _reg)
 #define ODM_BIT(_name, _pDM_Odm) _cat(_name, _pDM_Odm->SupportICType, _bit)
 
-- 
2.33.0

