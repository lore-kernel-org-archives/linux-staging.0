Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2ACB23A3
	for <linux-staging@lists.linux.dev>; Tue, 12 Apr 2022 18:58:03 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id bh17so39146394ejb.8
        for <linux-staging@lists.linux.dev>; Tue, 12 Apr 2022 11:58:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lAx29rsGmYrRtuHSy3SVZVdgmsTmcr+upgwDNcDWyIo=;
        b=d/LLJuopT/ZXleD5Fypemy5GCidPE/yQ3zRgnu/aZKx5k3Klc9MpAZzhask9BMzhBT
         sCKZoHwr70psALNIRMJvYcTa1SCN/U0W8mR2akyTRHA9nmIQ2XyzdS8PJpRFrilBgWi+
         0gAjsLkDpaSiuFDmDvcUu94KOJpc+cPpWXVimiRWYyC5J7ndkDeDI+rvoKCuyU10g3A/
         tI03ffvzjGfvpaZDRgMGtI/z3e+/1RuyQeoFV3FBPLBsXhxOi3/Qdj3fKkRIoxfkuiUU
         /SgxlzxJhKLCNLGRML1xdqjIgl1Fyb1N9x/X6gSohH1/T/a3WJBi+ROfde2wJgZaVoyI
         93VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lAx29rsGmYrRtuHSy3SVZVdgmsTmcr+upgwDNcDWyIo=;
        b=0CI/uhixWJdmqs6K1rxGfLGFpz5dQf+9+TjT/NzzT+izOrS7KlZe4YfbpDTytTAz0X
         nHRy+wu1FgArDPKZLQ6h1B64f+4vP8XxUC6WDIHGwV6T5a3h4At7BpQbIYFTgl+1a5x1
         a6o6WQ3ePUjIjXZRVsEp35FkGLTphPem5+oh/1/e0f4+kq2rmvInkGekxkApJEZhXyEQ
         aWx00Q5Lbl7aub8gzASSQqT7vdpC2uRKr3+hRRtnmJRWCnGPu29n4QC9+e1kdoxF07Te
         iakSlm5YpsSWNOFWwqLvZ0kx1blf+XSg/9a5q7hMVt6K55u556RkFjAO4UnJXRD5ithd
         dc0A==
X-Gm-Message-State: AOAM532cg0IlL4OO1rFrfQyCPbhiPNLtiQpLqTn/YZtsmd43AYfKcHyx
	BL3J1dOAxbIlpCxZ460vbbUBAhRkU6c=
X-Google-Smtp-Source: ABdhPJyl2n5ClHnRWbhDGJ7VenGf6szL1MzoI3o26vEmOqEjj4TfphLwUj6MYAqpfNuQ1Z/YAJ2rpw==
X-Received: by 2002:a17:907:7242:b0:6da:b561:d523 with SMTP id ds2-20020a170907724200b006dab561d523mr34491209ejc.118.1649789882375;
        Tue, 12 Apr 2022 11:58:02 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abb6b.dynamic.kabel-deutschland.de. [95.90.187.107])
        by smtp.gmail.com with ESMTPSA id q22-20020a170906771600b006cf8a37ebf5sm13443482ejm.103.2022.04.12.11.58.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Apr 2022 11:58:01 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 1/6] staging: r8188eu: correct macro spelling mistake
Date: Tue, 12 Apr 2022 20:57:49 +0200
Message-Id: <20220412185754.8695-2-straube.linux@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220412185754.8695-1-straube.linux@gmail.com>
References: <20220412185754.8695-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct a macro spelling mistake in rtw_fw.c.

MAX_REG_BOLCK_SIZE -> MAX_REG_BLOCK_SIZE

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_fw.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_fw.c b/drivers/staging/r8188eu/core/rtw_fw.c
index 7a0997b9bac5..0905384bafc7 100644
--- a/drivers/staging/r8188eu/core/rtw_fw.c
+++ b/drivers/staging/r8188eu/core/rtw_fw.c
@@ -4,7 +4,7 @@
 #include <linux/firmware.h>
 #include "../include/rtw_fw.h"
 
-#define MAX_REG_BOLCK_SIZE	196
+#define MAX_REG_BLOCK_SIZE	196
 #define FW_8188E_START_ADDRESS	0x1000
 #define MAX_PAGE_SIZE		4096
 
@@ -82,7 +82,7 @@ static int block_write(struct adapter *padapter, void *buffer, u32 buffSize)
 	u8 *bufferPtr	= (u8 *)buffer;
 	u32	i = 0, offset = 0;
 
-	blockSize_p1 = MAX_REG_BOLCK_SIZE;
+	blockSize_p1 = MAX_REG_BLOCK_SIZE;
 
 	/* 3 Phase #1 */
 	blockCount_p1 = buffSize / blockSize_p1;
-- 
2.35.1

