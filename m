Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3E646F
	for <linux-staging@lists.linux.dev>; Wed, 31 Mar 2021 09:41:06 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id b16so21519788eds.7
        for <linux-staging@lists.linux.dev>; Wed, 31 Mar 2021 02:41:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3T+uihbktGxCHfya3V10ZruR755TNbcOJbAcg/SlH5o=;
        b=vO/WaxegyYlFIAJlXYmcdyX9Ec0hVZkfuOJRv0klzn1PLxd3tYOkkv231csYoHHKDj
         QYMlbkwW+k468cz648+S6A5Uny5M2M9Eyf4O2jQXELHHFNXAtqzz0dMdxSNAedNtxZmk
         qiywXwwaTdowRjtmhmHy1inVbpktAplFAHUN4z0qScXOsEI0mOiHMqZW5nhNFve9q3Oy
         gBd9IJpoiFAzYHq0WwFcaMz1xKkLoArSve15jtL2Jx6e7VYU61vsOmaNrYtfIEmtk8v8
         VUgvzN95uXGoBxYjMdxLxk15WoEPs1nkIJUDc3NRyEXVYMgWU5gcD6hJSWV0crdXYBnw
         2k/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3T+uihbktGxCHfya3V10ZruR755TNbcOJbAcg/SlH5o=;
        b=uZZsqubFeavZOALOC/yGYMZW8zEXz0nl5aFW18d5n3uwcE/wVtKEx6UQS5ADm8iL5J
         DZHeEu6++Ny1Fenc8oHlaJ/+1nyE7lOK9UmlDcAOWpkdMG63mPijIVOdq0feqr9irpWo
         Gz3gOVjIgW20GQkspYvAgQzHtaweZ8LAOoDXATsx9kYCyrPBIv9TkHmr/b0HZggdQQQh
         bAfKgIFO1G/rgPR8G07aJUEj/2j3m40X0cyxidmwSpE7FzFoTqNUGW+NpHt5XmbJTirJ
         KpDX9DUhqHtqtiILpw7kExkiAkTayFlepvsULEvuVtZvnQgSVMMsBCdZjWpWO8DHNiAz
         ETTQ==
X-Gm-Message-State: AOAM531SMzN1uPiiDArZFsra9Nel04cKdvFyUsIKSijK3pNiDjhCbgYf
	XY6Oyni3FrXtDaZXMTZE6qY=
X-Google-Smtp-Source: ABdhPJxYO2lJsYKznmw5Uu+G4Ss5CUlnPQDrMBsxw3eKUC4sX15NQzQu1DLcWFJSho/m/SJ03HHRRQ==
X-Received: by 2002:aa7:c398:: with SMTP id k24mr2571101edq.61.1617183665329;
        Wed, 31 Mar 2021 02:41:05 -0700 (PDT)
Received: from agape ([5.171.73.44])
        by smtp.gmail.com with ESMTPSA id q10sm1106653eds.67.2021.03.31.02.41.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Mar 2021 02:41:05 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: joe@perches.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH 28/40] staging: rtl8723bs: remove commented RT_TRACE calls in hal/HalPhyRf_8723B.c
Date: Wed, 31 Mar 2021 11:39:56 +0200
Message-Id: <31ddc52964bfcb5facc5b65a9ee287e8714bff7f.1617183374.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1617183374.git.fabioaiuto83@gmail.com>
References: <cover.1617183374.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove commented RT_TRACE calls in hal/HalPhyRf_8723B.c

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c b/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
index 12f0e3601531..c36513812d9d 100644
--- a/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
+++ b/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
@@ -1847,7 +1847,6 @@ void PHY_IQCalibrate_8723B(
 				bResult = FAIL;
 				break;
 			}
-			/* RT_TRACE(_module_mp_, _drv_notice_, ("Switch to S1 TxIQC(offset, data) = (0x%X, 0x%X)\n", offset, data)); */
 			PHY_SetBBReg(pDM_Odm->Adapter, offset, bMaskDWord, data);
 		}
 
@@ -1864,7 +1863,6 @@ void PHY_IQCalibrate_8723B(
 				bResult = FAIL;
 				break;
 			}
-			/* RT_TRACE(_module_mp_, _drv_notice_, ("Switch to S1 RxIQC (offset, data) = (0x%X, 0x%X)\n", offset, data)); */
 			PHY_SetBBReg(pDM_Odm->Adapter, offset, bMaskDWord, data);
 		}
 
@@ -1950,7 +1948,6 @@ void PHY_IQCalibrate_8723B(
 			}
 		}
 	}
-/* 	RT_TRACE(COMP_INIT, DBG_LOUD, ("Release Mutex in IQCalibrate\n")); */
 
 	for (i = 0; i < 4; i++) {
 		RegE94 = result[i][0];
-- 
2.20.1

