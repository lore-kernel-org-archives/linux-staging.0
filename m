Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E3EC6D36
	for <linux-staging@lists.linux.dev>; Wed, 14 Apr 2021 18:12:16 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id u21so32812927ejo.13
        for <linux-staging@lists.linux.dev>; Wed, 14 Apr 2021 11:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mUdWG5FHd5Fjvw6Pjugvqx1bowREGQJryGXXbFCODjY=;
        b=bef+djPOXAmMm+4YcLddwLCZztLyc5xpFhwEpXQdZhXfbgSd0FOTQQgWDYaEhx3qPH
         y/FrG5UUQjevdrMM7KLkaL2NfobH7e5trnpK5hamEQMCMo5wxYIUMOIdMNh8JjwD91Vw
         jcZ8NcHMHA8+ayrM/+mVLkoI3VEyrB4voyxH1OkKFB/kSnyr03+l1BuwBMUeGuWQtRzC
         Lih1N9lBHMUt0oyx4q1fZMkmy80nhqkwShe74VgIeyw6BEjI1+UNU4m0BjLUpc4ox5dX
         xomWtBSkduDzUhqBxS6nZ7K0GF4Vz2bDG61Oz9JmB5bnFOIya/OQU4+1R4J9Y58s0kgk
         w4JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mUdWG5FHd5Fjvw6Pjugvqx1bowREGQJryGXXbFCODjY=;
        b=exJiCcnmYn5P1fAQBw8if4Jb1jC+n+OYPUe+mYDvtK7UVtTFGc4saQ+tuhmXp45YjL
         CTILltk2KUGfF+ofNyVajP4ATUlMAqaWNh5bd0/yq/6i6J+40a4u4WGB8rQpySXOQO5a
         ZYZ/FjJ9EdFtt6ZTfaF7xEjRQZgz2I46y+KbI3GnMvyF/8nsQ7k4v189MrPN6pNn9GdB
         m25oMjRVpYkVSEZ6qxhaAMXInPUhKcuZAU6t046MKUnMkYPAy8ra8uJDzSobn7ARzaJW
         pPyMNSWVoH45ryFv+wo7oArDGledVoD59HKmfAwqoaqbrJ0l8eV3sGFizu+AcT1BjPpg
         Gxbg==
X-Gm-Message-State: AOAM533ioB/7oC6xrsDpEKhA4G2Apk0uVBU3+ewzh1lyAoUEKHiUgPBd
	IW4EA/ckUvV+CvrmZGuN+aKztQ==
X-Google-Smtp-Source: ABdhPJyrMRu92D4/Iqh4o8OUE9hog0NW3b4dYOXYcT57SYq9MZdMAjJN/N65etNA89kbasxgPwnDLg==
X-Received: by 2002:a17:906:7206:: with SMTP id m6mr135829ejk.281.1618423935084;
        Wed, 14 Apr 2021 11:12:15 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
        by smtp.gmail.com with ESMTPSA id v1sm279493eds.17.2021.04.14.11.12.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Apr 2021 11:12:14 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Cc: linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev
Subject: [PATCH 39/57] staging: rtl8723bs: core: rtw_ieee80211: Fix incorrectly named function
Date: Wed, 14 Apr 2021 19:11:11 +0100
Message-Id: <20210414181129.1628598-40-lee.jones@linaro.org>
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

 drivers/staging/rtl8723bs/core/rtw_ieee80211.c:889: warning: expecting prototype for ieee802_11_parse_elems(). Prototype was for rtw_ieee802_11_parse_elems() instead

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/staging/rtl8723bs/core/rtw_ieee80211.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
index d8513acf4911c..e341789954b99 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
@@ -875,7 +875,7 @@ static int rtw_ieee802_11_parse_vendor_specific(u8 *pos, uint elen,
 }
 
 /**
- * ieee802_11_parse_elems - Parse information elements in management frames
+ * rtw_ieee802_11_parse_elems - Parse information elements in management frames
  * @start: Pointer to the start of IEs
  * @len: Length of IE buffer in octets
  * @elems: Data structure for parsed elements
-- 
2.27.0

