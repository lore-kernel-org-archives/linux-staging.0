Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 060BC71
	for <linux-staging@lists.linux.dev>; Sat, 24 Apr 2021 09:03:54 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id m9so37938579wrx.3
        for <linux-staging@lists.linux.dev>; Sat, 24 Apr 2021 02:03:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rCpiiCQz4n2K9iobxaVb23hXxM/13FWIKgaoFavgS9Q=;
        b=BIf/Rognnm34C02Z28qf991UuikYFjyn96QushrO1E3l7bgqs8Rv6xNo51X0iIa2A8
         J9I/XMWDFY2fYMAa8HrbUeRhWuDgT7nEdH1HwA1Gcxuw5AfXqYrGEV2Bye05i4mLCSbC
         S5o8JF7kD7upLRSAVpga62f/UmJr/tKSdBUW/Cu+s3wK0DfpHrzFP4/M+W22KzB1se8V
         aJ/BGumwxj73CZX3FK8+kRfyFWsiZVvaGeePbwE41ip82es10CXu+M6IVf1xzhBAzkhr
         KXjVfBA2/3pQ+q7nt/PhMQDvEffeC+fgFDDzKV5j00RMH46yiZahH2haOzCkDvctpS1P
         sezw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rCpiiCQz4n2K9iobxaVb23hXxM/13FWIKgaoFavgS9Q=;
        b=TuAjpKfqGkfyfQwlTnXGjCxFAszzB4nnjjKYJwEvCqGeHx0yaslUgmEOjyBSVj5y32
         Y6h5K23v3FMndY3hvsjoLAjnf5ZXLV6g4sIE3ZPX8jzotBxrGYpJiOWbPDfk55AYlaJA
         a781pxMzJ26hJkm5qPm4jVypHVS9QHY7ylGzYZbP6w9hnbXo6doZJ9nf6+SVw3Stsp6k
         2YWfTzQ0rUE9lIj6EoM6lhZ447kfanEqaMjtjBKKg8sIO7AC1Or7H2nFzasspdx982dh
         rLZlzT9tPSo25jG2X37CxPq9V3DtCfJyNHjr0AjQ4GHoE1aAwtQzbzgsZ9nTFVJ3hZQY
         vcYA==
X-Gm-Message-State: AOAM532iyTgjPK67xLQBoPlX5rFBNGSbP66oPxVcYqEJFhqvc9g5mT5v
	CbDTlA5FQuXd3M+6v8LEYYgzLWSY8O2lPA==
X-Google-Smtp-Source: ABdhPJxGPC4ApYau7PQBxhEYUbjlKjECjmNiAPpfp5fyU9UuIZVQGiaB4iYnjISGEnuelwQpmY+yng==
X-Received: by 2002:a5d:460b:: with SMTP id t11mr10042424wrq.310.1619255032723;
        Sat, 24 Apr 2021 02:03:52 -0700 (PDT)
Received: from agape ([5.171.80.252])
        by smtp.gmail.com with ESMTPSA id p3sm767511wmc.9.2021.04.24.02.03.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Apr 2021 02:03:52 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: joe@perches.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 46/50] staging: rtl8723bs: remove unused debug macro definitions
Date: Sat, 24 Apr 2021 11:02:29 +0200
Message-Id: <02f0a7ad7ad00dbafeaee1796f62f8f2e921d772.1619254603.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1619254603.git.fabioaiuto83@gmail.com>
References: <cover.1619254603.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove unused debug macro definitions.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/include/rtw_debug.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_debug.h b/drivers/staging/rtl8723bs/include/rtw_debug.h
index cde4b1d6a4b7..ad96fe1de971 100644
--- a/drivers/staging/rtl8723bs/include/rtw_debug.h
+++ b/drivers/staging/rtl8723bs/include/rtw_debug.h
@@ -7,11 +7,8 @@
 #ifndef __RTW_DEBUG_H__
 #define __RTW_DEBUG_H__
 
-#define	_module_rtl8192c_xmit_c_ BIT(28)
-#define _module_hal_xmit_c_	BIT(28)
 #define _module_efuse_			BIT(29)
 #define _module_rtl8712_recv_c_		BIT(30)
-#define _module_rtl8712_led_c_		BIT(31)
 
 #undef _MODULE_DEFINE_
 
-- 
2.20.1

