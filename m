Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21E13320E
	for <linux-staging@lists.linux.dev>; Fri, 15 Apr 2022 12:10:38 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id t25so9711267edt.9
        for <linux-staging@lists.linux.dev>; Fri, 15 Apr 2022 05:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BF4TCbU6C9xeKRNJJ36SItYcPCun9OHmo5cQ4fb+y9k=;
        b=qjo3DLwg9IXADd5tJrJKtAAdwCMePL5P9soz7DcU1LjaRpFAPwzuc5TpKRkNV21G0F
         0o5SDEmEoL5TTyybVcnMNdCDaYU1wOamNsgmVDeQe2xJ25CLRmscVqizRHa2quGkAqjz
         Mhww8Vr9mbW1R9d9404wXEfaOw+jbDf6ucYc8RCLrkCC4LKo/hcD8Z6IEc0ho3uKOjLN
         xshmY9dTw9We1NCex4sSDpSHb6+2Op0ECQhCg3FbT5OtZl5B5PQHAa5Bm0UA0nkJnHim
         0Dora0lvDuHJ6PXx0LfS8S452/MinMHBx/5ykoclCiM4UB99S5Kpzl/q6R3gIqJEC4xU
         N59w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BF4TCbU6C9xeKRNJJ36SItYcPCun9OHmo5cQ4fb+y9k=;
        b=jlFNWBBfwtWfsNSdssVmQMcTJFJrIlyHpjIfXsxDyUqzGHtVesxRZ7bUVZzXm4NRFb
         wapt3FC2qMeuuBY6Q6MXnNYGDXNAZstLEuLisS2P7e7l3Y/yH+fqhaLAB/srhzCszVZC
         a54zjQDbQKdkSFH8EnPbdjRk8zZo9yTRGaOL2dBCSOmncwPF8pUHLTkmgp4LqzlB6QnS
         VPvlEdxmElUxZBibWg9xpEHAbNDTveYMG4tm6YZPO3hwO8ZqMagV5Xe9h6NIDRAWwr15
         6p2L8zAog9Op0wbPwmyMyEQF2t62RhBx5GTYieqLr4Ai0fXgk4ip6wMTkLC1W/HY3L+u
         Nkzg==
X-Gm-Message-State: AOAM532a4aXXeP/nq6G172C/EPK+bylvUJJIxmCuwDEIavc4oaIZzdgN
	MdOGPIexDmYUHlOxaZB/F0Y=
X-Google-Smtp-Source: ABdhPJyTK4fb4HivgjaWIOeg0Bxb+kDmDFFgJKXoXKFGvf1eYxH9vLx3g9pz8JRMRMFoQZbdtgPUnQ==
X-Received: by 2002:a05:6402:26c7:b0:41b:7aef:bdf6 with SMTP id x7-20020a05640226c700b0041b7aefbdf6mr8074085edd.210.1650024636413;
        Fri, 15 Apr 2022 05:10:36 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abba5.dynamic.kabel-deutschland.de. [95.90.187.165])
        by smtp.gmail.com with ESMTPSA id z22-20020a1709063ad600b006e8867caa5dsm1626114ejd.72.2022.04.15.05.10.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Apr 2022 05:10:36 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH v3 2/8] staging: r8188eu: convert u32 fields of rt_firmware_hdr to __le32
Date: Fri, 15 Apr 2022 14:10:17 +0200
Message-Id: <20220415121023.11564-3-straube.linux@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220415121023.11564-1-straube.linux@gmail.com>
References: <20220415121023.11564-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the u32 fields of struct rt_firmware_hdr to __le32 for
consistency.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
v3:
- this patch was part of patch 1/8 in v2

 drivers/staging/r8188eu/core/rtw_fw.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_fw.c b/drivers/staging/r8188eu/core/rtw_fw.c
index eb4ab11f6b28..7cd08268f3b9 100644
--- a/drivers/staging/r8188eu/core/rtw_fw.c
+++ b/drivers/staging/r8188eu/core/rtw_fw.c
@@ -42,11 +42,11 @@ struct rt_firmware_hdr {
 
 	/*  LONG WORD 2 ---- */
 	__le32		SvnIdx;	/*  The SVN entry index */
-	u32		Rsvd3;
+	__le32		Rsvd3;
 
 	/*  LONG WORD 3 ---- */
-	u32		Rsvd4;
-	u32		Rsvd5;
+	__le32		Rsvd4;
+	__le32		Rsvd5;
 };
 
 static void fw_download_enable(struct adapter *padapter, bool enable)
-- 
2.35.1

