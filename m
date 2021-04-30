Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AB112F9C
	for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 14:58:03 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id n25so10886014edr.5
        for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 07:58:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jMN4zuhUHvB3cXnh9Uh5ILIZdfR0r9cSa/aL/onWxjs=;
        b=M4so35V9e6pXbfA5i2+DQ4FzZ0sd0sCQtzTPA1x2FL94sf8Y16CTjHMBzIZsyEYPyr
         hiiq8+4ncAD/bN2OVT6mqmvchJumirbal5ANDQktGkchNDKo9qOZfWbSs6eK6X2BvyXu
         2f6hdjN2oZgf7mlBvH33veMWHvDNfWfesgl3i2gi9fceO5kKLYmx4KqKNYQoVricglmF
         Ek9hc6bTCzKjeZJ+9An7lik10uGlZKurLZxKb0QVTnpRIZ5KWmYVmDDKvQHYSDqAkgAx
         Ad15WfQpOdJViYgNyNUNSd7h6Zd1GeVY/5lr7ta1Gk/leLLXz0dzEGpsxJMymVjUbb80
         CrSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jMN4zuhUHvB3cXnh9Uh5ILIZdfR0r9cSa/aL/onWxjs=;
        b=nFRC0bKHUTMnw7+W1vlmMiCtIRXcQdcefzwUcQgzSr1BBhVKkMhxXZGRCrFD3MITNW
         6nh/P9IwKs4ZXPIkd7NPveUALiuJC5RZB0T4ArNApMk9XN+XIZH0Uhhy1mdO1cIrXTSt
         eELTq8jceiJFsxDhrJZx6qTf3YiSs6FC049aoSqtwSgtAtZcHKemh+zc3R+k9IEVpZkl
         hzio/cuCVPBLNEebDGjD6fr//akIcORzT/SqZXK44MW+yXIdIZV2XeieHFNbrel2E9Bs
         McvqbZ21nhiMsHHZ2cwmu6JKtUldRy9k+zfu0LTBjBQLxtna20hiIFxtAPEoVTAsslCD
         ld3A==
X-Gm-Message-State: AOAM531zFwBWcACIbCLkB+Ax47uZaXWFbe0/DgNkYaJa72wuWbZm+uO4
	BMyMVIbMYjLk+r2o+ko//4TV71kERDA=
X-Google-Smtp-Source: ABdhPJyCgdf1UNKS1T/v6bMP5wgdU1JKS/rGDVNAWPz6bCLMdDLtnxLqq+WqF1nh9W9j2KMOhYBpvg==
X-Received: by 2002:a17:907:e87:: with SMTP id ho7mr4729992ejc.2.1619794671844;
        Fri, 30 Apr 2021 07:57:51 -0700 (PDT)
Received: from agape ([109.52.244.36])
        by smtp.gmail.com with ESMTPSA id e5sm2155884ejq.85.2021.04.30.07.57.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Apr 2021 07:57:51 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 27/43] staging: rtl8723bs: remove BTC_PRINT_F macro definition
Date: Fri, 30 Apr 2021 16:56:49 +0200
Message-Id: <503423caee1cc2b7a8fe321e0efb546556f2887f.1619794331.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1619794331.git.fabioaiuto83@gmail.com>
References: <cover.1619794331.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove unused BTC_PRINT_F macro definition.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/hal/HalBtcOutSrc.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/hal/HalBtcOutSrc.h b/drivers/staging/rtl8723bs/hal/HalBtcOutSrc.h
index 36636ad62aac..9c9ad29870e2 100644
--- a/drivers/staging/rtl8723bs/hal/HalBtcOutSrc.h
+++ b/drivers/staging/rtl8723bs/hal/HalBtcOutSrc.h
@@ -115,7 +115,6 @@ extern u32 		GLBtcDbgType[];
 /*  The following is for dbgview print */
 #if DBG
 #else
-#define BTC_PRINT_F(dbgtype, dbgflag, printstr)		 no_printk printstr
 #endif
 
 struct btc_board_info {
-- 
2.20.1

