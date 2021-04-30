Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1263C2F9A
	for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 14:57:31 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id y26so3354199eds.4
        for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 07:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8g9oz5Ic1TCmyXqC+DaCK2PY+uamXld+Xrd0WiL5ARM=;
        b=VNnsSkqa3C2GF+kuQHpxyJtcU9VBgWTDsq7gFixF7D+6UNwn7hl7xWfiPDg3Qwe1si
         Cv5UEWeizDJ/GonRJtl2ypfzMbRuLeBJEpHBzK2Sr7cEixza6Y19IczfxyYzff41S4DI
         L8IYhAu0fMhzNc9JlHvnpSzhfeh2XRUhG56DIz+HCF+YrRzIQ2IXFNCcBmd1LLlAy4Jv
         29bNmBtaymWHVLn5fXJAbWA1voGs1/NTEb8HCQdll+c7pQGnS7NYUJxcBrGbMx6MCbHs
         1rlWKU/kUW12X263NkBRx/hXVg+a42g8Pm9hQIxXHltmNM9OzwF5j2vMCVDcsto/L2HA
         RY1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8g9oz5Ic1TCmyXqC+DaCK2PY+uamXld+Xrd0WiL5ARM=;
        b=VXpqFgLP1UqiDgW7vLoGPDZcUPxc51qPjS3efqHyXMXtfl/BFgvldAAHb0XZgxKDJT
         +dSeLIMNzaygSWYmuCRVQ0bbWLag0hSLCYtnhc1vWmuMsWvlvla+hfDqE28tbEnN5b4m
         uqz1TjlgS0io1NRWI2827eBFK4rETQvXc7U8QV8qwUk+btKr7fqY025qOk6kQ/yOcSKY
         BQaR6mXdSMSOsk2OsJE8WOVpG4tg0LY96tYsKU4J2KzGO1Giui0SssCpaDZvhNF/AbMz
         eBy3uWXY5vClnQMoItFoVA8Yj+UXvrSMAs9wN/PVL/PareK/0nAWMH+7AvRmKwA8df64
         kV/Q==
X-Gm-Message-State: AOAM532n+qzMP7YahC5ocYf7JsLU63m/y79/q86pFZOURSeQnp18oUkA
	Z39d8Q6bczu8zq3tlM65KNw=
X-Google-Smtp-Source: ABdhPJwECoN8d9kjaWkC4rRv8kqHXqoQJEQYyNydwPtr4a0D2fwx5Obv0enK5Ej7nHLeEKh2XG6UHw==
X-Received: by 2002:a05:6402:26c9:: with SMTP id x9mr6330651edd.322.1619794649635;
        Fri, 30 Apr 2021 07:57:29 -0700 (PDT)
Received: from agape ([109.52.244.36])
        by smtp.gmail.com with ESMTPSA id b8sm2164704ejc.29.2021.04.30.07.57.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Apr 2021 07:57:29 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 14/43] staging: rtl8723bs: remove unused ODM_dbg_exit macro
Date: Fri, 30 Apr 2021 16:56:36 +0200
Message-Id: <84b76bc814f44e3b2da92318b05f101f59cf0889.1619794331.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1619794331.git.fabioaiuto83@gmail.com>
References: <cover.1619794331.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove unused ODM_dbg_exit macro definition.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/hal/odm_debug.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/hal/odm_debug.h b/drivers/staging/rtl8723bs/hal/odm_debug.h
index 7c9a87fb8e51..c359eabebb67 100644
--- a/drivers/staging/rtl8723bs/hal/odm_debug.h
+++ b/drivers/staging/rtl8723bs/hal/odm_debug.h
@@ -97,7 +97,6 @@
 
 #if DBG
 #else
-#define ODM_dbg_exit()					do {} while (0)
 #endif
 
 void ODM_InitDebugSetting(struct dm_odm_t *pDM_Odm);
-- 
2.20.1

