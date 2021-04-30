Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9C622F9C
	for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 07:44:42 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id w3so103869445ejc.4
        for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 00:44:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ACO+R08CoyLCjvDMxXLNgD1Yym9DyLgjQx6IL72eiqo=;
        b=tWiDGuDbhFAKUMoViFJxdR5bHQffLCvchSsSHNdwinlbPbpv9GxoGJKcPFMqTDfuiN
         iB8y1T57/tbWrteViDc6MYKrD77tA+dKr4rAOQN1QuoeiIH0NzI1UJVmL7gi92cUGlRz
         HZmAL0DFW2KHhDThPUwMdfg1tkiapNSBceUePvo95QnF/fZQiYIKzVOq3Uj7EwaXuZct
         u4Z2JDg0Oji7l6MRNpmPUUX7OxGQUUEhnWktJPp4foew83aTLOi6zSy5SoCi5eKyla9l
         AsBw3fIUa/73FX7zMrXCZh8vRexkIPIzHnMqwgjOzwUOI/ouAV5LmtukHdiyMPmzgoXm
         TmCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ACO+R08CoyLCjvDMxXLNgD1Yym9DyLgjQx6IL72eiqo=;
        b=B6AwRk4BtzkfH2lXgjKZW2PZUjJrU/yDBR7flouclHuLD4bw8sJxpuUyWpqZn/DXAO
         FrbABjrp9dJOvyhHoaMrmmu8ROrprUYUBCt4Q2hcb0krgwzsdW20PYqkMjPmb9iUPQsf
         nKwbtPijI2bS3ZLDmPYf6If+1udVR1xKHjubxvOhFpet9GtfRgBZkZV05CmCv307MNan
         pAbZDC52NxfbtdMmhB9h4gA159gqcZnW7v31GXDAV+7xJZQV49SvbhHTgedfLJP3Utnr
         RXG8ypLWFqXsR/fI3oMoOpxLXWMUZ36Og54MLdy0LQx8tja6PGEJA3TTfKRcGNi5NN1x
         bMnw==
X-Gm-Message-State: AOAM531XypxREiwRqzkrbKT65snijVTNPUka/MvzJiy3WQAia3N5tvQZ
	zkHrcTk75zfW4sKdAs8a+4lV/HZj8v/hjA==
X-Google-Smtp-Source: ABdhPJx0sQJ7Fi3DypK72XiEF+xCUqJp/gpWoghAFIaK+MCDOWzImNhgI2uMxiejinoIFsS7X9rA3A==
X-Received: by 2002:a17:906:4119:: with SMTP id j25mr2776538ejk.459.1619768681466;
        Fri, 30 Apr 2021 00:44:41 -0700 (PDT)
Received: from agape ([5.171.81.86])
        by smtp.gmail.com with ESMTPSA id p4sm1449886ejr.81.2021.04.30.00.44.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Apr 2021 00:44:41 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 22/43] staging: rtl8723bs: remove braces around single statement in if block
Date: Fri, 30 Apr 2021 09:43:40 +0200
Message-Id: <67181871aa04d5aba0ec93ce4247bb181be51fd0.1619768150.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1619768150.git.fabioaiuto83@gmail.com>
References: <cover.1619768150.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fix following post-commit hook checkatch issue:

WARNING: braces {} are not necessary for single statement blocks
21: FILE: drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c:609:
+				if (!bBtHsOn) {
 					algorithm =
		BT_8723B_1ANT_COEX_ALGO_PANEDR_HID;
 				}

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c b/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c
index 57579d7eab71..911d753e51f6 100644
--- a/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c
+++ b/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c
@@ -606,9 +606,9 @@ static u8 halbtc8723b1ant_ActionAlgorithm(struct btc_coexist *pBtCoexist)
 				pBtLinkInfo->bPanExist &&
 				pBtLinkInfo->bA2dpExist
 			) {
-				if (!bBtHsOn) {
+				if (!bBtHsOn)
 					algorithm = BT_8723B_1ANT_COEX_ALGO_PANEDR_HID;
-				}
+
 			}
 		}
 	}
-- 
2.20.1

