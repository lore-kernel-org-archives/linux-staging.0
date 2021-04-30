Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 325D12F9C
	for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 14:44:49 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id zg3so24042084ejb.8
        for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 07:44:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ACO+R08CoyLCjvDMxXLNgD1Yym9DyLgjQx6IL72eiqo=;
        b=ocEkSnt1xRxERdJb6RqywUM0s63yy7RUipSN3iA3L2FpfMdusWHFh0ty839Ub5schM
         1dZ7di3cFygAx/fJjCOl6Sq3ZO8qiUhNQK2yP9a7LwFRJ4Kf5Hgj9gCQbkrAKbDUZpab
         QgBVxZC6SnJILYVm+pluJP6VAoXQxrC37dCKiKyfYsO/b96rczLf33R0FcK+K9D8xyoO
         rgPxTjaTz8NEdzTEqDujbK3m5EEtjGMcRJY4qF0/XKyYsFZhOs98tBeoYdlmJT46cdzA
         uG7HW/E6j3v+2Bp3ZU5RxXQy9rm/s9zWJSfHr7ms3Y333uvBywiZzSXPGqtrpdLsxlD/
         MT7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ACO+R08CoyLCjvDMxXLNgD1Yym9DyLgjQx6IL72eiqo=;
        b=g7VLBOp8g/695M3suuODbdine/En0iMwoqLwIq4xgd4AntSejXMybUqbKuliHZLcq3
         oZyY66DQFwwAv1uV/FemRms5UO70StFprfg7Nhtho7MSCW7ZNt1+mc/5C1NILla/+8ki
         MIHcj3tGVVn9JP2i+0EAOT8a1kih54fiQUsnHccdsUzcO/JRapn/Op1eosYa3jwa0+/A
         QNKqlMLuETSurr/cBVqAlF6VLFn17MsHZgr1Cmy1CBqd301SuDtJibSAZeKPmtHuKHEC
         eFeq9L832nlD279djCzKqX/98h9tRYwXe2nWpDEFhXcbiWwbHx+liMIwiSz7Df5QOgr/
         3Shw==
X-Gm-Message-State: AOAM5335jmWCX5+sfXTebeOxTV8rcamocu4cXexSx9FRF0yUpOGQRa1y
	qeKDeIS7aAXl/lHzpXZZkn+Ds2Nsw1s=
X-Google-Smtp-Source: ABdhPJyzFLjtYzogS9E6jpp4fhbusewpqxLRg9JWqwHkde0c0UprUGv/RwjESNrSTf2Ad+q3IXp5Sg==
X-Received: by 2002:a17:906:1dd3:: with SMTP id v19mr4696425ejh.4.1619793887824;
        Fri, 30 Apr 2021 07:44:47 -0700 (PDT)
Received: from agape ([109.52.244.36])
        by smtp.gmail.com with ESMTPSA id x20sm1404347edd.58.2021.04.30.07.44.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Apr 2021 07:44:47 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 22/43] staging: rtl8723bs: remove braces around single statement in if block
Date: Fri, 30 Apr 2021 16:43:52 +0200
Message-Id: <c8a29e711f071926b0aec7dcfda970e3225219d2.1619793406.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1619793405.git.fabioaiuto83@gmail.com>
References: <cover.1619793405.git.fabioaiuto83@gmail.com>
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

