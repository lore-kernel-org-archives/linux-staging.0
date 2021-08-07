Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96A6B70
	for <linux-staging@lists.linux.dev>; Sat,  7 Aug 2021 10:23:57 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id ca5so20440500pjb.5
        for <linux-staging@lists.linux.dev>; Sat, 07 Aug 2021 03:23:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=yH4hz4BZgvksEYgE0/fFmqtyEvctv5FaZMZGgBgGT5w=;
        b=Li9fDITftwBhbcaHAmtOxaLB3RtvYq8BDWL+o5aTQMeSASjEUvJZlReE6tw3IP+f9n
         BzJ19KXu1dLaoWo0qfEsvev4aXFcJu/OqJdEskAtYJd2ZAZzzuhSte3N/qIW9BHiDpji
         i17KDURt6CsUGc4Iv3qcsuot7rPrMGFg19swjMxKV7H5TdV56iUjCPy6D3L7D3xSYeFm
         FO0NDMeUceGEEqRE/mF87RiMeYpSAY84V/9LgmTI/QxyrUdnG6cOVQqO2NZd86hw4Rrz
         8jSyQuNGyhL4n3WJ1ULl50XhdpVBU3m82Ak7l8MpKesfsDWTsFbX4OFVQRv0IL2XHxva
         kjag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yH4hz4BZgvksEYgE0/fFmqtyEvctv5FaZMZGgBgGT5w=;
        b=C6FHVeKJZ1tmPs9QRlnJJA2cWmCwC3ovpTS12BwQY/2vUa1EK+pF+kK0TxbF3m+3+n
         3KeDYCQCtFhIL2otIR2TCSmRA0sQ185md6pFcsAzEHKwh5fsBCmZfzKiFZLja9Ppw1Qw
         NaNZ8fNKDmQvor97REWKdIbXQRLfSdu6I4mScI83SIxpxtGBVavzk5+P2W6tJCm8KBhP
         Kc2HAdgoimk3DSRjuwrneheCtB5jTU9I57oOSKpXcMhEO4HumQ9jgqJ6jnq1v4GJ1wfL
         Ti8tdHWJuYvcyY9m3ep2XKOT13HZQZi/Avhpbvwn/Axfp9Da6XmyTpFU/EIf7fZ34HO1
         eHWg==
X-Gm-Message-State: AOAM531RWA/N6EVFsfrkS5byItK1UGVY/mulrJeLamHzxef0Tu9FZmIR
	mkEWwXMWXENWz7nAr0pXvRY=
X-Google-Smtp-Source: ABdhPJwOeO7xjrdqoBaztlrOsgqVYIOyRF3lx7R733dgCanNaJIHuLaN8yyQHUGUQk4gY5BID+niWA==
X-Received: by 2002:a17:90b:f10:: with SMTP id br16mr14585311pjb.76.1628331837181;
        Sat, 07 Aug 2021 03:23:57 -0700 (PDT)
Received: from user.. ([106.212.234.168])
        by smtp.gmail.com with ESMTPSA id d17sm13290717pfn.110.2021.08.07.03.23.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Aug 2021 03:23:56 -0700 (PDT)
From: Saurav Girepunje <saurav.girepunje@gmail.com>
To: gregkh@linuxfoundation.org,
	Larry.Finger@lwfinger.net,
	saurav.girepunje@gmail.com,
	insafonov@gmail.com,
	straube.linux@gmail.com,
	martin@kaiser.cx,
	will+git@drnd.me,
	dan.carpenter@oracle.com,
	apais@linux.microsoft.com,
	yashsri421@gmail.com,
	fabioaiuto83@gmail.com,
	marcocesati@gmail.com,
	ross.schm.dev@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] staging: rtl8192e: rtl8192e: rtl_core: remove unused global variable
Date: Sat,  7 Aug 2021 15:52:31 +0530
Message-Id: <20210807102232.6674-4-saurav.girepunje@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210807102232.6674-1-saurav.girepunje@gmail.com>
References: <20210807102232.6674-1-saurav.girepunje@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unused global variable channels from rtl_core.c

Signed-off-by: Saurav Girepunje <saurav.girepunje@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
index e85d9c2cdc96..dffae61b517b 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
@@ -23,7 +23,6 @@
 #include "rtl_pm.h"
 
 int hwwep = 1;
-static int channels = 0x3fff;
 static char *ifname = "wlan%d";
 
 
@@ -2642,8 +2641,6 @@ MODULE_FIRMWARE(RTL8192E_DATA_IMG_FW);
 
 module_param(ifname, charp, 0644);
 module_param(hwwep, int, 0644);
-module_param(channels, int, 0644);
 
 MODULE_PARM_DESC(ifname, " Net interface name, wlan%d=default");
 MODULE_PARM_DESC(hwwep, " Try to use hardware WEP support(default use hw. set 0 to use software security)");
-MODULE_PARM_DESC(channels, " Channel bitmask for specific locales. NYI");
-- 
2.30.2

