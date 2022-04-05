Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0590315CF
	for <linux-staging@lists.linux.dev>; Tue,  5 Apr 2022 06:08:22 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id g20so13625129edw.6
        for <linux-staging@lists.linux.dev>; Mon, 04 Apr 2022 23:08:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9ROXeEvSzaQep2rue/UuQgAQJtln4/qs41ov5tBhK2c=;
        b=IoKqbMUmgOcq6YZ+qyzSLZ1zRJ4ZOpCqXIjOsZeiYJ0/+uSQDxHkpq4eRlwGEk5Nt4
         0QjqSj1tt63etbj+st4KwiFTPbSw0vLmHDD43sSiFEbs7Xxu5igzMIW4bNAhrnwSUj0+
         tbJY75oj22Z0KDNXSnCGyirRJrB23GoyZnuQKMLVeC2W9OuxWi3YljtHxrCrDM3vPe2u
         A6sa3od8nPqiKpuAHMd2wC7LV5qM59qmka5Djqgx1RXhh2hRPyOclGQYqPVmaQJd7+eJ
         yMDR7HPu386E98XkxjqeGn/qehEANyP/5nv5aOB7NqwZc3DpTyUPJjLrS+ZDmH4Spg8p
         0vdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9ROXeEvSzaQep2rue/UuQgAQJtln4/qs41ov5tBhK2c=;
        b=KK1CvY8fpFKIxZShvsr0Ykj9ba3T7gp8tfA71SCa7YrB0YqTtuHqWiYchnIKcpIr6E
         CIlU2LkAuQIP36UOsEZ1U5pZVg9l2Fghxyi4Qp137o4TuOKkZ9glLKhuPcowtnSC9tBj
         RVATx4qZXKolHSr6G3TRUUNwPCnybhaoQxkIX33/6BEb+aiGYqkcNg3eCdeE47ZkJ7Pj
         iuZE0nKOHmYyNRkrcR7TW3/3K/gzEQFIu1VSXhB7m/Q6ayIeUAjN9MEo4bR8MvHxNgFw
         w3vodH92/dX2iQEhrDQ7bmrtUycNQsWcKydJ0VL8OHy1Lm7eSmH4FhfB8ryDlqfXBQG/
         heWg==
X-Gm-Message-State: AOAM532J529dcWfj9a10ITRh/R8kS7LqXQHemtXxI7t4MQvtCInh6kmC
	QgGsvjhnv7+Qcx7Tfxq2Qkk=
X-Google-Smtp-Source: ABdhPJycyQMuNsQT2VEkK5hILonrxPniN2o0a6T3GkmK+k1ebpycGq9Nkackc1KmS2EKNnmXeZwtaw==
X-Received: by 2002:a05:6402:1541:b0:41c:bfb9:d56b with SMTP id p1-20020a056402154100b0041cbfb9d56bmr1860176edx.344.1649138901381;
        Mon, 04 Apr 2022 23:08:21 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abb55.dynamic.kabel-deutschland.de. [95.90.187.85])
        by smtp.gmail.com with ESMTPSA id h5-20020a170906718500b006e7edcda732sm2484538ejk.125.2022.04.04.23.08.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Apr 2022 23:08:21 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH v2 2/2] staging: r8188eu: remove unused macros from ieee80211.h
Date: Tue,  5 Apr 2022 08:08:13 +0200
Message-Id: <20220405060813.8448-3-straube.linux@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220405060813.8448-1-straube.linux@gmail.com>
References: <20220405060813.8448-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unused macros from ieee80211.h.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/include/ieee80211.h | 18 ------------------
 1 file changed, 18 deletions(-)

diff --git a/drivers/staging/r8188eu/include/ieee80211.h b/drivers/staging/r8188eu/include/ieee80211.h
index 8c20363cdd31..bf4ce3cba46f 100644
--- a/drivers/staging/r8188eu/include/ieee80211.h
+++ b/drivers/staging/r8188eu/include/ieee80211.h
@@ -123,24 +123,6 @@ enum NETWORK_TYPE {
 	WIRELESS_11BG_24N = (WIRELESS_11B | WIRELESS_11G | WIRELESS_11_24N),
 };
 
-#define SUPPORTED_24G_NETTYPE_MSK				\
-	 (WIRELESS_11B | WIRELESS_11G | WIRELESS_11_24N)
-
-#define IsSupported24G(NetType)					\
-	((NetType) & SUPPORTED_24G_NETTYPE_MSK ? true : false)
-
-#define IsEnableHWCCK(NetType)					\
-	IsSupported24G(NetType)
-
-#define IsSupportedRxCCK(NetType) IsEnableHWCCK(NetType)
-
-#define IsSupportedTxCCK(NetType)				\
-	((NetType) & (WIRELESS_11B) ? true : false)
-#define IsSupportedTxOFDM(NetType)				\
-	((NetType) & (WIRELESS_11G) ? true : false)
-#define IsSupportedTxMCS(NetType)				\
-	((NetType) & (WIRELESS_11_24N) ? true : false)
-
 struct ieee_param {
 	u32 cmd;
 	u8 sta_addr[ETH_ALEN];
-- 
2.35.1

