Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC7345F
	for <linux-staging@lists.linux.dev>; Mon, 22 Mar 2021 13:37:17 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id b9so16824531wrt.8
        for <linux-staging@lists.linux.dev>; Mon, 22 Mar 2021 06:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=f4xBgsiNYuYBw3Qe7/gQVJ1XGu7fyLvEJLZmOJGXWxQ=;
        b=tl0jxZUAo298gv9XUYBA9Wxp48Uh4O0qVwA22GaeTH+UPR1NEHuDvxImejJDG8L2lG
         WZI9/bh9XQOGhOiVUWlj+kH7vMALALXYNMm8d+RuhgSJY9+hqjAol4q5Z5TE1YQFMyHZ
         VyKGB19u6vWLWrzK8FvfL2EOKVzoY+Y6Odnf5LiQRAqnNUKyDYK5RmalfWl79Ta1VAGW
         /A9eCpRnDUxlboKHLY+xpojH2O9PZy1749K3nHsco9lUORpSc7mLplxUjt6aI9MTD+vn
         vvKj/sZQzFZw6ARxa8/V4KcxkqJAdUeDYTrA0koKmG/O0Cw6louexoE/wimkPAE+Egob
         ohaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=f4xBgsiNYuYBw3Qe7/gQVJ1XGu7fyLvEJLZmOJGXWxQ=;
        b=OSkmw9Th2y6AVtE/7wnirC98ewB3FDv8/uAll6Xo+kxptyjdQcZGCDqEWp4317Dd2G
         N2j26EtLsM6rrjvEhFjTW40F+a7E3ouh+4car4ZGq2jqVJGnsZ3rO6RCWoOqfFz5PPH9
         FlENMXftmKInWZdn59XwYj4yk4eK5DwKJzZHUt2UpyKNI9K+9SES+cPi+KdAWs4FUQdc
         lNNioMOl+ZA3okc/mk32pp6ilLzj9cbuoGv6ReSof+ydjMP/irL+sL96RLqLyI43UEBw
         S4FRF7XIuxirEbYWJacmGtQXaqN6oXuq4PvW6lZ5gRDRV5MSylb3iLQm816JamtT7qOz
         CtoQ==
X-Gm-Message-State: AOAM532mpFe4Dium+ZmB+g1piZddyEppIw3JyllRjyZH6/HfDwMkRyWH
	rC50KTQpTPjMtoeL/FkHQ6g=
X-Google-Smtp-Source: ABdhPJzivcvmh7P2t91ZFNvE4VcmrhtjTaswNKF4cNobfqKz83FAWxgwxzrCBMhz0Kocf0s79+gliQ==
X-Received: by 2002:a05:600c:4f03:: with SMTP id l3mr16207844wmq.149.1616420236219;
        Mon, 22 Mar 2021 06:37:16 -0700 (PDT)
Received: from gimli.cesven (93-48-145-141.ip257.fastwebnet.it. [93.48.145.141])
        by smtp.gmail.com with ESMTPSA id d204sm17091770wmc.17.2021.03.22.06.37.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Mar 2021 06:37:16 -0700 (PDT)
From: Marco Cesati <marcocesati@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	linux-staging@lists.linux.dev,
	Dan Carpenter <dan.carpenter@oracle.com>
Subject: [PATCH 07/19] Staging: rtl8723bs: remove useless structs in rtw_mp.h
Date: Mon, 22 Mar 2021 14:37:05 +0100
Message-Id: <20210322133717.17797-8-marcocesati@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210322133717.17797-1-marcocesati@gmail.com>
References: <20210322133717.17797-1-marcocesati@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the following unreferenced struct's in include/rtw_mp.h:

	struct iocmd_struct
	struct rf_reg_param
	struct bb_reg_param

Signed-off-by: Marco Cesati <marcocesati@gmail.com>
---
 drivers/staging/rtl8723bs/include/rtw_mp.h | 17 -----------------
 1 file changed, 17 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_mp.h b/drivers/staging/rtl8723bs/include/rtw_mp.h
index 75171d30bcda..ead63cf09fe0 100644
--- a/drivers/staging/rtl8723bs/include/rtw_mp.h
+++ b/drivers/staging/rtl8723bs/include/rtw_mp.h
@@ -259,23 +259,6 @@ struct mp_priv {
 	u8 *TXradomBuffer;
 };
 
-struct iocmd_struct {
-	u8 cmdclass;
-	u16 value;
-	u8 index;
-};
-
-struct rf_reg_param {
-	u32 path;
-	u32 offset;
-	u32 value;
-};
-
-struct bb_reg_param {
-	u32 offset;
-	u32 value;
-};
-
 #define LOWER	true
 #define RAISE	false
 
-- 
2.30.2

