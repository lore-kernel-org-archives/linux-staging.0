Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD3BA71
	for <linux-staging@lists.linux.dev>; Thu,  1 Apr 2021 09:22:12 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id kt15so1808851ejb.12
        for <linux-staging@lists.linux.dev>; Thu, 01 Apr 2021 02:22:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3G3s/S8lRMB91e3/ict3UMMhMSDTheEUiSUyBvwqizs=;
        b=N/ajMhfMdO5Dqf7INeWxcn5JZV1txVtnS+0OKtDg4rfps5QzRuuHmxP0ETYwllMNYY
         WT0akmoTcXC4Tyt3/qzfqEJ0+J/L+1FPezk7vX2GuC7VyZByGNaLFwTqKckIIIhzCjv+
         mk8KHo0mbc0/bzU4Xr2XY0lJ8xtIpy8x6Z+E+6oKD6NxYD5pakYb/9QIrNEtBEHhSSo1
         uLRsH+/f4eH/CUSBv3y6nhzO25vPpGEt3+YYOmcnYwZ+ePWzFCT9uMDGIAtRcXGiiRz0
         PLQNin3WoC1jUYENvHpJWosDEixxycUdW5Sg8AEfKQbQDs7U5JhkZ+hnvg3yVEWORWpe
         qBFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3G3s/S8lRMB91e3/ict3UMMhMSDTheEUiSUyBvwqizs=;
        b=eSQULO1mft1pBn0EAl/JUydueDhe6Cm0s5gEcAuYNzYMN5F402eiHqyCEMARuUFgMK
         XjTGGaF5MYkOi8ZlmSvQOyabcRj9xUC9Ku4zvAsAQ/GHDC6j92bMhkLfH10KwtctpTrC
         BGUcVFIM2T+AevmVhieDKszuOeZNQManKx4TOXKwx4Cgm/AhWxjgMwh6PSzy1HH45cOI
         cSZaoFIeHjt0IQQrh9FKT0HGd0gkQbRakoRZn2G+/6jv400AEieDSoRVWyzrMuXtToZK
         kVFp/vR7b2IfMgzENQg5k7+DOE1XypdIPuNXtZ4EZoMreRseTg0KqIp0P8klK7QZIxlt
         5uSg==
X-Gm-Message-State: AOAM530Ts+9+NMTmZHGGHyCeEBYRPvxO80s6z8uctYzB+er1Di9w00K5
	oZIb5kiwwWaxuXt1+JOsdN4=
X-Google-Smtp-Source: ABdhPJz7v5KLPe1jt96WFfq5zX8Hzw37lFfVgjMdf/vqFLp7jPGvTHSEsf5Jits17Qy5ulxqFhvjVw==
X-Received: by 2002:a17:907:75fc:: with SMTP id jz28mr8264546ejc.490.1617268931426;
        Thu, 01 Apr 2021 02:22:11 -0700 (PDT)
Received: from agape ([5.171.80.247])
        by smtp.gmail.com with ESMTPSA id pg2sm2439810ejb.49.2021.04.01.02.22.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Apr 2021 02:22:11 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: joe@perches.com,
	dan.carpenter@oracle.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH 29/49] staging: rtl8723bs: added driver prefix in log messages
Date: Thu,  1 Apr 2021 11:20:59 +0200
Message-Id: <44684b22f5e90e730b64a574d3e6a3e433a2fc5d.1617268327.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1617268327.git.fabioaiuto83@gmail.com>
References: <cover.1617268327.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

added driver prefix in log messages in hal/rtl8723b_hal_init.c

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index df15b9c206f3..da9529054459 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -360,13 +360,14 @@ s32 rtl8723b_FirmwareDownload(struct adapter *padapter, bool  bUsedWoWLANFw)
 
 	rtStatus = request_firmware(&fw, fwfilepath, device);
 	if (rtStatus) {
-		pr_err("Request firmware failed with error 0x%x\n", rtStatus);
+		pr_err("%s Request firmware failed with error 0x%x\n",
+		       DRIVER_PREFIX, rtStatus);
 		rtStatus = _FAIL;
 		goto exit;
 	}
 
 	if (!fw) {
-		pr_err("Firmware %s not available\n", fwfilepath);
+		pr_err("%s Firmware %s not available\n", DRIVER_PREFIX, fwfilepath);
 		rtStatus = _FAIL;
 		goto exit;
 	}
-- 
2.20.1

