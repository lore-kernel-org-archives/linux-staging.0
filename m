Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5173471
	for <linux-staging@lists.linux.dev>; Thu,  1 Apr 2021 09:22:28 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id ap14so1906664ejc.0
        for <linux-staging@lists.linux.dev>; Thu, 01 Apr 2021 02:22:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Cioluv068BWZZVTvNHvrKSQdGLCkCRUED0iLUEaae4k=;
        b=maMGbFbPgCASSoP74O4yPmcKf4MekE7OFkLCMIx1QpfLio1Igm3fMKUFPLpvPeqenV
         04KyokBUXiEsK9TfY3OEjs/Hi9Txfb1lSvnYcwHqTnoIgcFt+FE5WSrYA054isYNf3jp
         VAMSaVF3ONOBub3aoYHVnaIB85N+nP9cZefR4U1Hi3xqQSBhhBXWx3wb3ClYMXvzs7uy
         bEiewIb7MaPQr8huKr0MoAFLXlHvg/qWzspu68Qc9PQaWUsUP/0vqHwjK9/xNGkbKn/N
         CgvdH35Olh2jS4BsbudBQE42Q3eGdZCG49jbNsPZXZNIZeoaKzFua1NvPZyvatp+Fitj
         A9rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Cioluv068BWZZVTvNHvrKSQdGLCkCRUED0iLUEaae4k=;
        b=tAqRBquvWWikpVSPFmTFHNZW55ewj/eW2IRuXhIgr6ICJhTcXJj0Z/KTuuNeIlmKxC
         loiEYqqmvyNpWSY+kRoQzYuOgjtxGlPtVgIzPZBR2mHuOlZmBjeuB4M1XlDlS30639vw
         NQYTqR3i/10t+5/nug9xX/1FBgtwfnUmuZhaTckohhU/hd9QiEM8uPp3d7M9jcOaBfCj
         KhnHog4aOH/tIZ9w+NaleT58zGkCyuvtjP5TWKBl28SYqlwX9TKgm2IXHrsTVf4LjI/m
         B4u2ACpbRzLNAigO2w+XJzR1Pv68Fk9yATrufvjZooXMioLrhWJ4VomKCms1m2+yJ1e6
         NMxQ==
X-Gm-Message-State: AOAM531iAfvRWrGoIzb8qLmRVtVkq5KGBYjnpjQ8HqFWvszez/YebS+5
	28lggvSEezcBAKx/lWDChO7Qc+fvk89wgQ==
X-Google-Smtp-Source: ABdhPJywMlrN3FDTsaanhNjH/JEXVZKQA4XgiS0n/jqSCG4Hux5Aswt3QF4s15OjEUN5Fbu0UqzbZA==
X-Received: by 2002:a17:907:629e:: with SMTP id nd30mr8009320ejc.407.1617268946925;
        Thu, 01 Apr 2021 02:22:26 -0700 (PDT)
Received: from agape ([5.171.80.247])
        by smtp.gmail.com with ESMTPSA id x21sm3146032eds.53.2021.04.01.02.22.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Apr 2021 02:22:26 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: joe@perches.com,
	dan.carpenter@oracle.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH 39/49] staging: rtl8723bs: remove commented RT_TRACE calls in hal/rtl8723b_rf6052.c
Date: Thu,  1 Apr 2021 11:21:09 +0200
Message-Id: <409119d376fc53a6a73a096891773c0612e6df35.1617268327.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1617268327.git.fabioaiuto83@gmail.com>
References: <cover.1617268327.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove commented RT_TRACE calls in hal/rtl8723b_rf6052.c

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/hal/rtl8723b_rf6052.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_rf6052.c b/drivers/staging/rtl8723bs/hal/rtl8723b_rf6052.c
index 73b47f053549..38228b46b1ee 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_rf6052.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_rf6052.c
@@ -74,7 +74,6 @@ void PHY_RF6052SetBandwidth8723B(
 		break;
 
 	default:
-		/* RT_TRACE(COMP_DBG, DBG_LOUD, ("PHY_SetRF8225Bandwidth(): unknown Bandwidth: %#X\n", Bandwidth)); */
 		break;
 	}
 
@@ -153,7 +152,6 @@ static int phy_RF6052_Config_ParaFile(struct adapter *Adapter)
 
 	ODM_ConfigRFWithTxPwrTrackHeaderFile(&pHalData->odmpriv);
 
-	/* RT_TRACE(COMP_INIT, DBG_LOUD, ("<---phy_RF6052_Config_ParaFile()\n")); */
 	return _SUCCESS;
 }
 
-- 
2.20.1

