Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A1333D6A
	for <linux-staging@lists.linux.dev>; Thu, 17 Feb 2022 19:08:05 +0000 (UTC)
Received: by mail-pj1-f50.google.com with SMTP id v4so6524591pjh.2
        for <linux-staging@lists.linux.dev>; Thu, 17 Feb 2022 11:08:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=e/N0Rhhzz5vwAvXJwS8oHDh3H0bU+N1BFIY6++JNrEA=;
        b=I32ZG9aSf+guazsrpIpkMpf9UReyMsE3bpQQZ6ri67ToYEBZCORnXry2tmSi5TjU8J
         382+l2UPVDCC6WMcYhrQ4Ql/C8KnmmSsv4eN0pdwoUq1qX97hUA8y+pJAapfOixKQ08J
         xDyub5BY2k73NG/rjsLLz16hejmske6xZghcN+bObChI4+Pf44Y8Ozd+J561ppOjx8KG
         Wko6+4R9koNHhmnLe/PcG43TKfJBkI8+Iy3Dgj3fpFfZXe90ToFMip+4QGGO0AfHKjMn
         ACq4PbZBwJQOQuhsDZwgyrDhYNvCzkNIzJt3dK9rMHZTA5VcVOUWnxWe3DNrfdJbHG4P
         FQ6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=e/N0Rhhzz5vwAvXJwS8oHDh3H0bU+N1BFIY6++JNrEA=;
        b=cpDJBm5tin11I34cDSAK1mRpangMxevn4hRfN4SkHBZDMA2ggGnvTV85A2eeCdIbDu
         EOAjmnElZDwTPml4AuLzlcm0JqtGZSgQ86l9sgc0IQoGLLElVPCarZpLe6XBybPv+hQh
         PARGetXDFYCtL6rS8r35e3Tm2mBdE68cEjKLnzxjyUh5+ALgCPciNTA6H6obFf8/+Ebr
         7ziVaBUw1Svf1JXO4UMQ1BqZxYIyi5NkHIUQvn5E+8u+4xGaoJ0qnVjkn/4yDsajAQe1
         8FlWmseIuqkmUjz/5/5sY3osOlFKH6uyi+Mt16ZlwoHW2xffzs2xv/jX64dz435uwvRa
         S7eg==
X-Gm-Message-State: AOAM531QEDPpIbcpK+GSDu141U4U/59mbNA6Lb08oSq9KauWu2aDOvD6
	qYIj4wXRJL+So6TVt9pcYzw=
X-Google-Smtp-Source: ABdhPJylnRawVBSxsrWOtnvbZ8+881zQg6NSzIk9BizDTRVi2RHzCfV/Mdkmj6BMxBV3JDIVtD7fHw==
X-Received: by 2002:a17:902:b288:b0:14d:5f1e:4ff3 with SMTP id u8-20020a170902b28800b0014d5f1e4ff3mr4109531plr.24.1645124884621;
        Thu, 17 Feb 2022 11:08:04 -0800 (PST)
Received: from localhost.localdomain ([123.231.106.116])
        by smtp.gmail.com with ESMTPSA id k62sm8707864pga.86.2022.02.17.11.08.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Feb 2022 11:08:04 -0800 (PST)
From: Husni Faiz <ahamedhusni73@gmail.com>
To: pure.logic@nexus-software.ie,
	elder@kernel.org,
	gregkh@linuxfoundation.org
Cc: Husni Faiz <ahamedhusni73@gmail.com>,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: greybus: loopback: Fix Coding Style Error
Date: Fri, 18 Feb 2022 00:37:22 +0530
Message-Id: <20220217190722.44894-1-ahamedhusni73@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Macros with multiple statements should be enclosed in a do - while
block.

Signed-off-by: Husni Faiz <ahamedhusni73@gmail.com>
---
 drivers/staging/greybus/loopback.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/greybus/loopback.c b/drivers/staging/greybus/loopback.c
index 2471448ba42a..33666a49e0a8 100644
--- a/drivers/staging/greybus/loopback.c
+++ b/drivers/staging/greybus/loopback.c
@@ -162,10 +162,12 @@ static ssize_t name##_avg_show(struct device *dev,		\
 }									\
 static DEVICE_ATTR_RO(name##_avg)
 
-#define gb_loopback_stats_attrs(field)				\
-	gb_loopback_ro_stats_attr(field, min, u);		\
-	gb_loopback_ro_stats_attr(field, max, u);		\
-	gb_loopback_ro_avg_attr(field)
+#define gb_loopback_stats_attrs(field)					\
+	do {												\
+		gb_loopback_ro_stats_attr(field, min, u);		\
+		gb_loopback_ro_stats_attr(field, max, u);		\
+		gb_loopback_ro_avg_attr(field)					\
+	} while (0)
 
 #define gb_loopback_attr(field, type)					\
 static ssize_t field##_show(struct device *dev,				\
-- 
2.25.1

