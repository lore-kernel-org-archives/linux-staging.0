Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 731DB6D37
	for <linux-staging@lists.linux.dev>; Wed, 14 Apr 2021 18:12:12 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id m3so24832131edv.5
        for <linux-staging@lists.linux.dev>; Wed, 14 Apr 2021 11:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=AbvipOBdj1fS79gt/BVri7gSSSf64nN6WvRK9WjmasA=;
        b=tr4qJHvkYmiP/Nh59JAk+KfHZsduv2K5R2CMIBEFqPxAZEk37r3oad0kXphTXhaD5h
         afvWTEvB0Udn7BqPmeD021FssYxUnuaYmJ75qNjzm5bMCrS6YYK1O9Fvi9vS36mEzhUn
         2EIDunirwih2seUD6FzVftp7GiQGzBD6VRHMwVgX8Nto0e4zG8kcVHLw5mQlpOutSU69
         LlNB/BUyJTm//xK4csSQhVmPTCMDrzesww/KIFXALw2DS/0G06NZTVbyeCFSaq319S3/
         wNJnQeYNt85nrau53CBVesYsTm/LvgzHhahJC0Ih7QHU5IXwE/77QUwldoxP3rcAqLGz
         6vCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AbvipOBdj1fS79gt/BVri7gSSSf64nN6WvRK9WjmasA=;
        b=sDSSbIwRm7W6QI3qy5+RAgxQfJACy8OmyLs00ujItGzl2fYC+tp3w7zAfpqTpMwm6P
         Pp56dk9K6rTDNces4kzHzLJw+pvcvgD/EJWZxH0VrqYX1+JqPaMVJv4+6nYjVkqnoE9e
         0YhGZl6iWoGyvEH7w2glCd/3+BARG0etwmyXTOVNys0ZBXPBUD9T4cPYV+5LUlL2HDQS
         5AFPYVNvf1E5m5Y9rYp4BuHr6Qym9HzxOG235qS1uD5DJzgqzOZJJQxqRd2sSwlA3g9m
         bGgvtzzgIMh5mr9SugNr/ytOBa5QQdupCctpPahjWWC5LxxNSLLyPFB4p3niql9OIXXR
         YF4Q==
X-Gm-Message-State: AOAM530g5UDuDSpQ2dV/oi3fW1Wcr1rfMprm8wVlGFZ1upxlYkWeHeHI
	MsDM4SBqoH0kI5hz1L184XKEmg==
X-Google-Smtp-Source: ABdhPJyVuf0KAEN1KRQkxMp9ZUndl7p+vuxDlvKE6jrftSd+XRYn2BnUt3A0IqefD1lWrVIwczHfpA==
X-Received: by 2002:a05:6402:4244:: with SMTP id g4mr201587edb.204.1618423931050;
        Wed, 14 Apr 2021 11:12:11 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
        by smtp.gmail.com with ESMTPSA id v1sm279493eds.17.2021.04.14.11.12.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Apr 2021 11:12:10 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Cc: linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andrey Shvetsov <andrey.shvetsov@k2l.de>,
	linux-staging@lists.linux.dev
Subject: [PATCH 35/57] staging: most: dim2: hal: Demote non-conformant kernel-doc headers
Date: Wed, 14 Apr 2021 19:11:07 +0100
Message-Id: <20210414181129.1628598-36-lee.jones@linaro.org>
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
Cc: Lee Jones <lee.jones@linaro.org>
Cc: Andrey Shvetsov <andrey.shvetsov@k2l.de>
Cc: linux-staging@lists.linux.dev
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/staging/most/dim2/hal.c  | 4 ++--
 drivers/staging/qlge/qlge_main.c | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/most/dim2/hal.c b/drivers/staging/most/dim2/hal.c
index 30112413f20a0..65282c2768628 100644
--- a/drivers/staging/most/dim2/hal.c
+++ b/drivers/staging/most/dim2/hal.c
@@ -96,9 +96,9 @@ static int dbr_get_mask_size(u16 size)
 }
 
 /**
- * Allocates DBR memory.
+ * alloc_dbr() - Allocates DBR memory.
  * @size: Allocating memory size.
- * @return Offset in DBR memory by success or DBR_SIZE if out of memory.
+ * Returns: Offset in DBR memory by success or DBR_SIZE if out of memory.
  */
 static int alloc_dbr(u16 size)
 {
diff --git a/drivers/staging/qlge/qlge_main.c b/drivers/staging/qlge/qlge_main.c
index c9dc6a852af4a..55a04ca9307c1 100644
--- a/drivers/staging/qlge/qlge_main.c
+++ b/drivers/staging/qlge/qlge_main.c
@@ -1389,7 +1389,7 @@ static void qlge_categorize_rx_err(struct qlge_adapter *qdev, u8 rx_err,
 	}
 }
 
-/**
+/*
  * qlge_update_mac_hdr_len - helper routine to update the mac header length
  * based on vlan tags if present
  */
@@ -2235,7 +2235,7 @@ static void qlge_vlan_mode(struct net_device *ndev, netdev_features_t features)
 	}
 }
 
-/**
+/*
  * qlge_update_hw_vlan_features - helper routine to reinitialize the adapter
  * based on the features to enable/disable hardware vlan accel
  */
-- 
2.27.0

