Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 981212F9A
	for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 07:45:06 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id r12so103838278ejr.5
        for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 00:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wlFfMaqoDNDPkcgOlBfijVc+2KkNjpgO1LG6F4L15Ok=;
        b=HRrszr5nYMYCpniOomzpgSFfA8wNnO2d7NRcrzhSm0N+CcuBKqLWdlmVrH6mVog0fR
         7K5f49yIWqHFo33xdYaG39D812b7auHvf6zrHtekbaVZ1BM4x41M9ExMiDwgpAkEg/V7
         Thvwxe1EHlh7aI4OGWHPLemccleCiWbntUHJb07Wi4LosKUjI/JyyDSoLL7TgyzkBhUU
         ifFGWKyzdnPLi5GILO7BzVaBAhxrb7ojciebKQH1wvdcplvhxb9iZeCXPet4BCOp8mvR
         0sGhkb0DDuUoY24S+BBD/jPNavucRlnC41bQsVaMupEK6ihubYXftoqW3+BkVz38tn3W
         IC+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wlFfMaqoDNDPkcgOlBfijVc+2KkNjpgO1LG6F4L15Ok=;
        b=pCwShUPl5phee/RzgNuLPudZ4h9bLXF+IoaMc8sg3yUnvFEsUts48eG7tT48APmOjU
         O1kUt0zZTYhKH5I0UfV82xVoE93nXn7GCFoeFqHMzS7bbPRY2/eZOVJ2BJrp9gOYlbRS
         T0/WPrQVukLNOZVX0MpiicgITBsUm9NgMUShoNp9fKjKoGXVEAQDhD4au0+4VEKzR3cm
         2c5ega7X5zDHkk8bVC2Uf74J9yJ363bvyNK4VRFJff27XaPFDLgBWY0rODW6HHwN8Lj7
         aB9jpeEQ4rjAjOHalFwhEYf2LtSVOpMoP9ZbgKpAX7DCBX4PrcRI/3+apJQHaIHOAWk7
         bNiw==
X-Gm-Message-State: AOAM5310yWHp/wbGsdv+u+crf706kaHcNBybhTwfYdJdPtgjR1wnJNuG
	64efw3F224xS/FarIaQpXIs=
X-Google-Smtp-Source: ABdhPJwkCLTaNB/Z+B56sFyyJK1pP9EjVjZBY3Io8sEPyN+wPL29gRYULbToCY+zl7vUO2y6lmY24w==
X-Received: by 2002:a17:906:151a:: with SMTP id b26mr2835193ejd.492.1619768705227;
        Fri, 30 Apr 2021 00:45:05 -0700 (PDT)
Received: from agape ([5.171.81.86])
        by smtp.gmail.com with ESMTPSA id bh14sm1438591ejb.104.2021.04.30.00.45.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Apr 2021 00:45:04 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 36/43] staging: rtl8723bs: remove unused DbgPrint macro
Date: Fri, 30 Apr 2021 09:43:54 +0200
Message-Id: <1344732e30b029b3031eebcb0527159fce034147.1619768150.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1619768150.git.fabioaiuto83@gmail.com>
References: <cover.1619768150.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove unused DbgPrint macro definition.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/hal/odm_debug.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/hal/odm_debug.h b/drivers/staging/rtl8723bs/hal/odm_debug.h
index 5c4412bf6fbd..c6c62bed5f3c 100644
--- a/drivers/staging/rtl8723bs/hal/odm_debug.h
+++ b/drivers/staging/rtl8723bs/hal/odm_debug.h
@@ -86,7 +86,6 @@
 #define ODM_COMP_INIT				BIT31
 
 /*------------------------Export Marco Definition---------------------------*/
-	#define DbgPrint printk
 	#define RT_DISP(dbgtype, dbgflag, printstr)
 
 void ODM_InitDebugSetting(struct dm_odm_t *pDM_Odm);
-- 
2.20.1

