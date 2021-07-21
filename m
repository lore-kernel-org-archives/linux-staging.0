Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8971A72
	for <linux-staging@lists.linux.dev>; Wed, 21 Jul 2021 13:37:31 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id ga14so3298619ejc.6
        for <linux-staging@lists.linux.dev>; Wed, 21 Jul 2021 06:37:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4pp5qcKSi8QnZSBiJByHnb/g7VBQHYpXJxy4hBmgsRY=;
        b=rkCNtGpSpqqjgeeoXZfosxai3avAZUS2jR+tCg+vj/TpEUkqh0YW2ARnxyMgRt18Mg
         SsgXib3ETJctErY07BXLdFxziNHx6+6fQaZL7RQ9i7UxLWxusEUZ768Lk9qCQ/Ykx7DS
         rtH0u5NbBzHsS+SC3ulPY7K9UGHGd2oDA5NQgcSzkYilYgk1MWXgvfiTY4f+JOQLwFLL
         TAKT72BZ2XoO5w1pS18H5LpeiNu63tSFKWNJlT+uGSbqq6DL6akyVapoUoKYtw65d2Es
         x/6nOcGHuVWxc43gVDO7YrUybRJwscpe51nlt81DUpeemvmAIJGwsWKjDQjIKTmNNPF3
         bClw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4pp5qcKSi8QnZSBiJByHnb/g7VBQHYpXJxy4hBmgsRY=;
        b=S0QjKNam0GfOQ22/XV+dSio7U/faZFXoP/NyCsTiysDb0U+RWE3IJ+jzeXApXvp3dq
         XyWfousLq9Zso1/0FgHrogUDGVwHXg0OFeHhy7gbWaxL/ew7ZiuB4kJOuGcMoVREh3q4
         76Tbfg3ndlPCryZuzSjNSfdO+3ua+kmx3JlR9lQEXz/A2egP0e/vNxMkev1gTzlwiIZM
         Gexi9UVUOTNSMSYe2U+3CFdXbZIHPs/VLae03YQG8U2AjQXJw0xSWskrHpeG3pIRRiSH
         DhiSytWlTa3xM70tjMAqv/cQhrH1mbPYvKmauDz0EKPfYE/Qb/f9wzCmDLa+zuZ4WJA6
         xbgg==
X-Gm-Message-State: AOAM532+wvdSzaDERcKfzqnl3C6JVIXiX/lengRt75dFPpdhE0dNg0tN
	s0c5PsSON71BBv/RHtvCWMs=
X-Google-Smtp-Source: ABdhPJxp74urEDChGi9N6qPtnTSgmwXnrsWnTeGXhxmKQ+cIMRz7K5M4WFeGr6YFu2nYr9RwvZeY/g==
X-Received: by 2002:a17:906:9d17:: with SMTP id fn23mr39568592ejc.191.1626874650052;
        Wed, 21 Jul 2021 06:37:30 -0700 (PDT)
Received: from agape ([5.171.73.45])
        by smtp.gmail.com with ESMTPSA id k8sm10860514edr.92.2021.07.21.06.37.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jul 2021 06:37:29 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 03/16] staging: rtl8723bs: convert function name to snake case
Date: Wed, 21 Jul 2021 15:37:10 +0200
Message-Id: <78bbc5cb8531bc03eccfa2f67ee71979cbfbf12e.1626874164.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1626874164.git.fabioaiuto83@gmail.com>
References: <cover.1626874164.git.fabioaiuto83@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

convert Hal_GetChnlGroup8723B() function name to snake
case.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index 246a5362a54f..a680fc1d4bea 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -2061,7 +2061,7 @@ s32 rtl8723b_InitLLTTable(struct adapter *padapter)
 	return ret;
 }
 
-static void Hal_GetChnlGroup8723B(u8 channel, u8 *group)
+static void hal_get_chnl_group_8723b(u8 channel, u8 *group)
 {
 	if (1  <= channel && channel <= 2)
 		*group = 0;
@@ -2235,7 +2235,7 @@ void Hal_EfuseParseTxPowerInfo_8723B(
 		for (ch = 0 ; ch < CHANNEL_MAX_NUMBER; ch++) {
 			u8 group = 0;
 
-			Hal_GetChnlGroup8723B(ch+1, &group);
+			hal_get_chnl_group_8723b(ch+1, &group);
 
 			if (ch == 14-1) {
 				pHalData->Index24G_CCK_Base[rfPath][ch] = pwrInfo24G.IndexCCK_Base[rfPath][5];
-- 
2.20.1

