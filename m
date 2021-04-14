Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 982B06D36
	for <linux-staging@lists.linux.dev>; Wed, 14 Apr 2021 18:12:19 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id r9so32819330ejj.3
        for <linux-staging@lists.linux.dev>; Wed, 14 Apr 2021 11:12:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ou9pFz1yt2cBGVMByHH+2tSi6/Zokuu+I/QCR5zN9V0=;
        b=dUeZaVa9qaRoanrYQIlaeGHzZzfQ0rnSDg9Zmwab1KKCNjEHQ77S/NnU0EN9GLt5PA
         EaiNXYFwg+Yj8sIWSQ7vHztzOY5BxVmwXzcqEap/TsE9rbkxHybnkhSkiRKsy9nMLM5L
         zGc1ZtweyvsW/XJs1XEY8eMenPZv25tvbztcSrtjuzABiXwWt+96zFmUk4YDmXWQFA1N
         JMHiz59tBqUj77fEntNehNuPY31uv01gr60NikVTNQA3/2VHJOHfoaTr2TJ+xiB5Y3kL
         29XolHyIbKiGcPnS/mo90FNfQ0OmFqgCZeFCdvaz5ySKQLBd0du42QUI8wfVobs9NI6Q
         5Q6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ou9pFz1yt2cBGVMByHH+2tSi6/Zokuu+I/QCR5zN9V0=;
        b=HzT+od/CTIGKrU/HwVNUUXA2NBrwPAYAmpexwNks+jkRVJQvDOQQz8WvMBDffybROK
         9VBKTmiPWwNvdXM2kwR4Qao2/FGTBhyDoE+VYQCeR5aW1VUVvLz3YOnlT61zfZLt5ngA
         8GBfxVszkcqP0/IEIeFqttZnBV5LKVpUDmh9/UTJAQUI9nyId21Oq/me0J9uujt1WEmO
         Rh+SzAm2sP91TxboJlEUVt0qVKGvKhVikv26UI95e2Sl90pavtGymWy7/NyRk+nbVFlZ
         wGGBfNMX3IKhluShsirMqx2V9oG2hom4EAIq8OQtDjvLi32uEKuQWwrkypQhqHR3OKaF
         X8+A==
X-Gm-Message-State: AOAM531WkNjpTFvdeSuODOgSTd4nJbT9E70wT8kEasls8H44Azt+SnH6
	42jClfkaTIX1zb+y5ij0KFGbsQ==
X-Google-Smtp-Source: ABdhPJxiKs/E9rYKIqmEb8TLijPjyGAl4oRI9fx4KCXVQZ9/5Prl/L3H0P4Lc1mgOHRjnQUZxvaoiA==
X-Received: by 2002:a17:906:1e8e:: with SMTP id e14mr126983ejj.399.1618423938178;
        Wed, 14 Apr 2021 11:12:18 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
        by smtp.gmail.com with ESMTPSA id v1sm279493eds.17.2021.04.14.11.12.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Apr 2021 11:12:17 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Cc: linux-kernel@vger.kernel.org,
	Larry Finger <Larry.Finger@lwfinger.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev
Subject: [PATCH 42/57] staging: rtl8188eu: os_dep: rtw_android: Demote kernel-doc abuse
Date: Wed, 14 Apr 2021 19:11:14 +0100
Message-Id: <20210414181129.1628598-43-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210414181129.1628598-1-lee.jones@linaro.org>
References: <20210414181129.1628598-1-lee.jones@linaro.org>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes the following W=1 kernel build warning(s):

 drivers/staging/rtl8188eu/os_dep/rtw_android.c:56: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst

Cc: Larry Finger <Larry.Finger@lwfinger.net>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/staging/rtl8188eu/os_dep/rtw_android.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8188eu/os_dep/rtw_android.c b/drivers/staging/rtl8188eu/os_dep/rtw_android.c
index f5763a9d70c58..91c51b5583d27 100644
--- a/drivers/staging/rtl8188eu/os_dep/rtw_android.c
+++ b/drivers/staging/rtl8188eu/os_dep/rtw_android.c
@@ -52,7 +52,7 @@ struct android_wifi_priv_cmd {
 	int total_len;
 };
 
-/**
+/*
  * Local (static) functions and variables
  */
 
-- 
2.27.0

