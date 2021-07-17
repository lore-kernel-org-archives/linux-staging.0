Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2781E2FAE
	for <linux-staging@lists.linux.dev>; Sat, 17 Jul 2021 14:57:06 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id u8-20020a7bcb080000b02901e44e9caa2aso7611534wmj.4
        for <linux-staging@lists.linux.dev>; Sat, 17 Jul 2021 07:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tkGUfOrzJrq03bJ94d60KH9BEKG2dNakYwWHuVXNqwE=;
        b=lCNNe3OjZxP5P54VFC1ZhVafrOkqYEtoL01Sw5T6qMakle6EOip53JBVBwsA+29YrG
         +1t8J8kxyIB99J6dl28QmI2XN2L8uX8qyDJg/jl0aO0CLNU+UD30iUiU/q47zvbjjkEJ
         P8DQQQQTfYGzXbbG2HF1Kiq6LfOmYcnmqoBcOL2Kmm5HU8manyZVCyiVOghUSSO84udQ
         TrrrzMiE4nV9Djvd37jo1Sm+vQ/KYv0/x+SJ/pVw7Vf30thn/Xo+K0zCOD/42dYtppBx
         49UqBJ1RrFHjxs2g/86AmhPr31vDxH4ORELgwlsaD+fXEZ62fUSeJVOmg8XjCoqM/Sre
         sCZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tkGUfOrzJrq03bJ94d60KH9BEKG2dNakYwWHuVXNqwE=;
        b=tQNjlMeIBYByCbxrOUeCwkC0/HeK+Rs2FEjtYOFGwFk3oft8H3izf8RtR9oEmKHECP
         e7+ub42skqks+ojLzQKTVtmbCjOXFyiLRc4U8LdE5Jtj2rmbuVi8PsrfevmjLEYI++g7
         oFtAaCBeOpI+fslKNYB9iVMyDeWJRpZ/T/YV1ijysrz4ePfVL4Xt76fj0s77gf1PIG7o
         O8lC1LlmOyQEtyvvo/epuJFKu6sGP9hWwRKKXvwfwR7hdMlh8kTs1KDY4QAUJUUr9o+T
         r2b+o+ZNYkJVocJ40IrEfOZR2o+v+h/R/GQVBP7X8m3fNqtDZZNumOemaBfV+u7eXIkp
         XOXA==
X-Gm-Message-State: AOAM533V34SpaHoLL8RqAl+NIBQfU7jGM+NLDNj4BFXDTF1Pa7t2vr4k
	XvwNTuhi5wDs4J3EYyFfnJE=
X-Google-Smtp-Source: ABdhPJypmgEFcxEUiiJFN6Q95kDh4Imz7D+CHEl3T6cnYmHUZ6oLJen25XNYgd3sIvOrC6i9POa5NQ==
X-Received: by 2002:a7b:ca45:: with SMTP id m5mr16836386wml.46.1626533824674;
        Sat, 17 Jul 2021 07:57:04 -0700 (PDT)
Received: from agape ([5.171.72.101])
        by smtp.gmail.com with ESMTPSA id v21sm14404005wml.5.2021.07.17.07.57.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Jul 2021 07:57:04 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@oracle.com,
	hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 08/10] staging: rtl8723bs: remove unused macros in include/ieee80211.h
Date: Sat, 17 Jul 2021 16:56:49 +0200
Message-Id: <c50cba3974772347888bd55085b1e5e44ef0687d.1626533647.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1626533647.git.fabioaiuto83@gmail.com>
References: <cover.1626533647.git.fabioaiuto83@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove unused macros in include/ieee80211.h

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/include/ieee80211.h | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/ieee80211.h b/drivers/staging/rtl8723bs/include/ieee80211.h
index f29b7a92d9ac..9fa79146c39a 100644
--- a/drivers/staging/rtl8723bs/include/ieee80211.h
+++ b/drivers/staging/rtl8723bs/include/ieee80211.h
@@ -158,15 +158,7 @@ enum network_type {
 
 #define is_supported_24g(net_type) ((net_type) & SUPPORTED_24G_NETTYPE_MSK ? true : false)
 
-#define IsEnableHWCCK(net_type) is_supported_24g(net_type)
-#define IsEnableHWOFDM(NetType) (((NetType) & (WIRELESS_11G|WIRELESS_11_24N)) ? true : false)
-
-#define IsSupportedRxCCK(NetType) IsEnableHWCCK(NetType)
-#define IsSupportedRxOFDM(NetType) IsEnableHWOFDM(NetType)
-#define IsSupportedRxHT(NetType) IsEnableHWOFDM(NetType)
-
 #define IsSupportedTxCCK(NetType) (((NetType) & (WIRELESS_11B)) ? true : false)
-#define IsSupportedTxOFDM(NetType) (((NetType) & (WIRELESS_11G) ? true : false)
 #define is_supported_ht(net_type) (((net_type) & (WIRELESS_11_24N)) ? true : false)
 
 struct ieee_param {
-- 
2.20.1

