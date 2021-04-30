Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2B3B2F9A
	for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 14:57:32 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id j28so18964700edy.9
        for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 07:57:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Y6sZe3osaLDDSPNYI5JYp+0cY5GbbYZW8NCqEYTYFpk=;
        b=ZJzofE0NNuKbONIigmFF0JVfpGh+R5hX/IzBidzyuFDn10LGL6FjfbaoOHLoymPCK5
         CUdy+Dr4jX4GWehV2E7XN60l5TLBVN/XAYYa2H9PYsQZrr/a9pouMBpi64lD+j5rxm+f
         YMPUrqu8oF+3bpybdDOhxPZHFBfpHfq9T8wGJ5qIsxPRGzjAx357IzHugRwi3DX7rCBq
         CNNrdHschaagMI/OR5Bky+RL5Dg2IZzBwMyu8HwGt0/FyiFIhHXpUtkB93bzDirCnLhh
         fqCipELToemNe4EuqDiQvdlWvZJcMiDySkYL757tX7l9rZ16z0tIzSevFXlJHcNWade6
         ZOhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Y6sZe3osaLDDSPNYI5JYp+0cY5GbbYZW8NCqEYTYFpk=;
        b=m3W9rx2yxB/z29VUbHsRVAV6RXQr4V8MZ50Ss10k+iFqTK5YYeLDWZSVdUoJ15xrLv
         7IdoaAVBeJZK5zqgHLuHCaETPvybVx1TQKcbSHnE5GuRg+GOVtsp0q9qPG/CnHVRAwsv
         jczAEGM4KywQd1hPMtSIO2ZrjPG3AQclldvzm/CSdmj37w9rcjGl2mKIpWMCQyh8khZ0
         cC36DdRWdW4H8CFrjSzcLlwt30zF2Y0h4eCcZ8wQHcZmb68FCGDwCBRZ2oeYX9KAi4Qz
         pAceYBbI5pUQGEvO9YDATBHKIt7LjCByAMCsn3A9HlzihZmsze3znsgvxSfPMVGLAOWe
         SY0w==
X-Gm-Message-State: AOAM530zFU1qjMkPRoTcwdAhxV914ufPAoHqxgcJiHtmSbeGHy5mK0lk
	hmcAV0hUC7zJgAnX54BmvWw=
X-Google-Smtp-Source: ABdhPJxOyHqhJwlXhFGFifdR9Naz9OS82vDud9nrSMsxaI+cMdzLQoMAaRaHUtmSKZXn+1ZbK+/nQA==
X-Received: by 2002:aa7:db95:: with SMTP id u21mr6461563edt.152.1619794651336;
        Fri, 30 Apr 2021 07:57:31 -0700 (PDT)
Received: from agape ([109.52.244.36])
        by smtp.gmail.com with ESMTPSA id w13sm1547883edx.80.2021.04.30.07.57.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Apr 2021 07:57:30 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 15/43] staging: rtl8723bs: remove empty ifdef block
Date: Fri, 30 Apr 2021 16:56:37 +0200
Message-Id: <e30ccbe6cf20069e1a24a7a150d0b6241a7b57f8.1619794331.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1619794331.git.fabioaiuto83@gmail.com>
References: <cover.1619794331.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove empty ifdef block

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/hal/odm_debug.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/odm_debug.h b/drivers/staging/rtl8723bs/hal/odm_debug.h
index c359eabebb67..8ae9948fb0c6 100644
--- a/drivers/staging/rtl8723bs/hal/odm_debug.h
+++ b/drivers/staging/rtl8723bs/hal/odm_debug.h
@@ -95,10 +95,6 @@
 	#define ASSERT(expr)
 #endif
 
-#if DBG
-#else
-#endif
-
 void ODM_InitDebugSetting(struct dm_odm_t *pDM_Odm);
 
 #endif	/*  __ODM_DBG_H__ */
-- 
2.20.1

