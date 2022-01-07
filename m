Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32D502CA2
	for <linux-staging@lists.linux.dev>; Fri,  7 Jan 2022 10:36:34 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id z9so20372583edm.10
        for <linux-staging@lists.linux.dev>; Fri, 07 Jan 2022 02:36:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xitO4xjFIv/zgFCqMdAhAS+m13rXCyic7Tt7PUde2/Q=;
        b=crItaRL2o606eFxIa6GQ6T4UBho6x/bvAICK5sfH5+O+uV9znymQMOjJ/3IoePhmHC
         G6QRtwXB2NCxYscflVJV3PNRZaSMBc5haRrdPnNJOYO3T+60y1T/idrlimhyoh/GeNVq
         HuNtYrQsCRU+s4U52FT/3t7IHMSbCJpIAOpSuEeNH11Cpne8AV1PFPmKOpBgxdy8tVEL
         HYOLx+kzdQHkGVsLVtR/BOS6pziMP4356R7LPWS97XeyScA9nLXLCWy0pmKq9Q9H/+o1
         vZjB0/ZNkajXJ/hX95TwKrKbkt20J2yQceFkFO9we/ln9Ky+RIvS2suVxcj7VvPOGanY
         TrdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xitO4xjFIv/zgFCqMdAhAS+m13rXCyic7Tt7PUde2/Q=;
        b=QAa/XZA8+tIDMs2b7q79j8GSc/ns8aB2vmtdhtDU1zcR1Q0k/vNED8WXfiRoOiMP9I
         pRWSncPRG68Agh663ubbEzbfvjGTk/4SgspuNE7tuEsLYbJPYk+GL6+VJvUl+jr9dfOj
         GniBa5CfrWrnSeZK2pYDw+yrbsplhjRuMBRGBb46Hor+Qz+AUJYB1HvCk8NpgRHOKVYA
         k2FSaYWnb/XLWLq5hSnYSi80Yc8lC5ONN7z4Wb7ItOU2BfGFUZZ3AOLSPHkJ2ZW/+zRZ
         hsl9dDM7gy+ZmKIl3VlgI6Y+W8q7sy1RtL4nEBgmQ08OumlW0hgRgwadMfDHV/6Kz92b
         1K8Q==
X-Gm-Message-State: AOAM533NqRDVUWnHJg2znpsQnXWcegWAwTbPH+ndze2d4KGwobKJk4LY
	zXGLSltjdoTf0DKK5DpS5yw=
X-Google-Smtp-Source: ABdhPJzstqK4gR59GtrXhCyRcl1bD9SbX/CSDn9IXU6/+QR0GpY++RI35dmLmRBJ6kEGmoC0djTbTw==
X-Received: by 2002:aa7:c7cf:: with SMTP id o15mr61624625eds.176.1641551792646;
        Fri, 07 Jan 2022 02:36:32 -0800 (PST)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::51e2])
        by smtp.gmail.com with ESMTPSA id v8sm1869857edt.10.2022.01.07.02.36.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jan 2022 02:36:32 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 06/19] staging: r8188eu: convert type of return variable in load_firmware()
Date: Fri,  7 Jan 2022 11:36:07 +0100
Message-Id: <20220107103620.15648-7-straube.linux@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220107103620.15648-1-straube.linux@gmail.com>
References: <20220107103620.15648-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The return type of load_firmware() is int. Change the type of the
return variable from s32 to int to match the function return type.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/rtl8188e_hal_init.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
index edb56a9ae283..bd7f3dc5878b 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
@@ -510,7 +510,7 @@ static s32 _FWFreeToGo(struct adapter *padapter)
 
 static int load_firmware(struct rt_firmware *pFirmware, struct device *device)
 {
-	s32 ret = _SUCCESS;
+	int ret = _SUCCESS;
 	const struct firmware *fw;
 	const char *fw_name = "rtlwifi/rtl8188eufw.bin";
 	int err = request_firmware(&fw, fw_name, device);
-- 
2.34.1

