Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 848EB6D32
	for <linux-staging@lists.linux.dev>; Wed, 14 Apr 2021 18:12:11 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id h10so24796266edt.13
        for <linux-staging@lists.linux.dev>; Wed, 14 Apr 2021 11:12:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=suKchik7fkxJsbWv0EpdrzPIlTn55sc8L3ee+Nqts2M=;
        b=WbF8UtvVwzmb8yK9F48/oZ18yLEt+5DscFf7bjt1wb5liGXY1me+3cJVwo1CO6j7XM
         HTdApphufLPFEzdvn6mETHm/W9DMRq6pfn3ume7QKnNsRKXITu3iBcYtsFg+X9+IRAAp
         yWGzi52MMRmELdUDOMv9sni74jRBx+Ui0pkaJ/DiZ8+UYGXtPNmVQopQMRxQ+CPGHsZ0
         lshBmBgTdvMSmxrPYr4H6tD4XJCPz4vK8GCwbmE9rEFh0stk8JLaXkaSAJhrYPWQzFuU
         FMVtpxFNIlv2r8FbPqo4ZPohHX3XvK1tSpKk3qrKR5Z3nXrMUjIOLsu2yL0bepoEYerQ
         eLbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=suKchik7fkxJsbWv0EpdrzPIlTn55sc8L3ee+Nqts2M=;
        b=CqdPQGrWk0t2T5C8JiDIPXP9BGz7Mzy+ptM2sAW9eyoBPnYzqdvb/zjzfWNIcadoiG
         0Ar8fRk80BpQw0OiJU1vDvM9P1HjsI6Jow+h4oadz4O65b7sJmi02+GdIDYZ2tP+cyd/
         zV9ul2+BqvZNOxsj9ZAeF+SQrJlPm9ynRn7AYtCoBA4yO4+f+NWyZm4D+udcgLl6fu+5
         6TRO5N6S81BwAHp5jAWJEemWI4wnvAAqspPFMh3ZCEFCYM1l/jfgETLj5Fn7SVUYG0y1
         RsLYQ1qpho2RQhQv3t+m14V9kx0JcWbhmxH6w3QMCeftYkjwV49sZQ6fXbyVIEWVvobB
         KWeA==
X-Gm-Message-State: AOAM532mAHVEH29XN8mtmPPZaXDWhmIZjZ+AjH/GQBwaq4EJrN1+lII8
	0XIB+yemml+x3e4SpWEUFy5wdUKKKJ3HoQ==
X-Google-Smtp-Source: ABdhPJxxaB7vg1VjWvnPfy0wQUMVRVTj6ZRbGFyi+lt8dP7Hv7ivz583lG85OuY/Dix8Q18eUEw+Kw==
X-Received: by 2002:aa7:cd7b:: with SMTP id ca27mr189673edb.354.1618423930097;
        Wed, 14 Apr 2021 11:12:10 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
        by smtp.gmail.com with ESMTPSA id v1sm279493eds.17.2021.04.14.11.12.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Apr 2021 11:12:09 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Cc: linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andrey Shvetsov <andrey.shvetsov@k2l.de>,
	linux-staging@lists.linux.dev
Subject: [PATCH 34/57] staging: most: dim2: hal: Fix one kernel-doc header and demote two non-conforming ones
Date: Wed, 14 Apr 2021 19:11:06 +0100
Message-Id: <20210414181129.1628598-35-lee.jones@linaro.org>
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

 drivers/staging/most/dim2/hal.c:99: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
 drivers/staging/most/dim2/hal.c:788: warning: Function parameter or member 'buf_size' not described in 'dim_norm_isoc_buffer_size'
 drivers/staging/most/dim2/hal.c:788: warning: Function parameter or member 'packet_length' not described in 'dim_norm_isoc_buffer_size'
 drivers/staging/most/dim2/hal.c:788: warning: expecting prototype for Retrieves maximal possible correct buffer size for isochronous data type(). Prototype was for dim_norm_isoc_buffer_size() instead
 drivers/staging/most/dim2/hal.c:802: warning: Function parameter or member 'buf_size' not described in 'dim_norm_sync_buffer_size'
 drivers/staging/most/dim2/hal.c:802: warning: Function parameter or member 'bytes_per_frame' not described in 'dim_norm_sync_buffer_size'
 drivers/staging/most/dim2/hal.c:802: warning: expecting prototype for Retrieves maximal possible correct buffer size for synchronous data type(). Prototype was for dim_norm_sync_buffer_size() instead

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Andrey Shvetsov <andrey.shvetsov@k2l.de>
Cc: linux-staging@lists.linux.dev
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/staging/most/dim2/hal.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/most/dim2/hal.c b/drivers/staging/most/dim2/hal.c
index 39e17a7d2f24b..30112413f20a0 100644
--- a/drivers/staging/most/dim2/hal.c
+++ b/drivers/staging/most/dim2/hal.c
@@ -97,7 +97,7 @@ static int dbr_get_mask_size(u16 size)
 
 /**
  * Allocates DBR memory.
- * @param size Allocating memory size.
+ * @size: Allocating memory size.
  * @return Offset in DBR memory by success or DBR_SIZE if out of memory.
  */
 static int alloc_dbr(u16 size)
@@ -778,7 +778,7 @@ void dim_service_mlb_int_irq(void)
 	writel(0, &g.dim2->MS1);
 }
 
-/**
+/*
  * Retrieves maximal possible correct buffer size for isochronous data type
  * conform to given packet length and not bigger than given buffer size.
  *
@@ -792,7 +792,7 @@ u16 dim_norm_isoc_buffer_size(u16 buf_size, u16 packet_length)
 	return norm_isoc_buffer_size(buf_size, packet_length);
 }
 
-/**
+/*
  * Retrieves maximal possible correct buffer size for synchronous data type
  * conform to given bytes per frame and not bigger than given buffer size.
  *
-- 
2.27.0

