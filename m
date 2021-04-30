Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B92042F9A
	for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 14:45:03 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id i24so23351810edy.8
        for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 07:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oXNpztwSPie87ZGBOUIq/Wsi+dyDvcyo8iFcSTDhBAs=;
        b=it3wxcs4z3lCcDg9KH0JPpS7cY+24Jp2wtkMEnjN8IEaYUh8fsJnz85RUOIvpf+nVy
         chTVdAb3ylt4rNn8qGNQ29+NRTuaSa/js9hAjEzgVBTrBd8b/WZ0IHurzPp/V9sLcBVE
         f0bNG0PA9EP3YzDnFHg7wvYkdkbXdl1JLlRLa4c6Q0zSK23fUMUkT3X6olevdtIG3erI
         VV+MtXmTKh1h32OhH20bJS9LMLH3VFMXVKtV2PRTthzCltUKtyP1U5k85v7fLVptyZh5
         M5q3Z1HW/zvvnCKynkG5BSLfql4weHQeoDR0rUWhkqQ4cCF6Dq6qw2Jn5dwLdEAC4XhH
         MZkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oXNpztwSPie87ZGBOUIq/Wsi+dyDvcyo8iFcSTDhBAs=;
        b=hOW0snsRF6r4SikaCC+o2jtCTJ7k+1rZgkTlp8yPLwMpxGoizIMHo3c0n266yg2VwM
         Tqe76jkbPiv9XTRL/T473mbqICGyNu2V04wZ2WgEub8d5FD4LB3L7vDvSu/8Lqy4E0fQ
         4217Ulss5sqBLF1Mba0qLrcVKgUs3tIKYWeLYmOr2e7BLMaYso7tNSZfDwkTac8I8EsZ
         IOegQldAkotb67Y3J41Yr3KMjCjATNacnrHSEj2HyB4isbgQXj4OUsu7AOn3r6P4x3Ij
         Od/hUNLJxEIIN0tygaTFlz9rdcv/55nksgA6BYzeCDcS65atGniBrXLfyi3jbS0FzNDz
         FtzA==
X-Gm-Message-State: AOAM531RmRthM1fg2t6eTKxz3MVgkVRWVlP/ZTDCdkSt88oLqhpRxWwt
	umlya+7ODUGAaKt+1LQlSuI=
X-Google-Smtp-Source: ABdhPJxzuIEWNywo9Wz+PZyLnlRDvD6ajM+z5KebZgnINBBheAnlk1auIlVeO1IFsA4bpCnsxjjHhQ==
X-Received: by 2002:aa7:ce17:: with SMTP id d23mr6377068edv.47.1619793902398;
        Fri, 30 Apr 2021 07:45:02 -0700 (PDT)
Received: from agape ([109.52.244.36])
        by smtp.gmail.com with ESMTPSA id g11sm1456923edt.35.2021.04.30.07.45.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Apr 2021 07:45:02 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 32/43] staging: rtl8723bs: remove obsolete GLBtcDbgType array declarations
Date: Fri, 30 Apr 2021 16:44:02 +0200
Message-Id: <83cc0a8d2128e3d22a385d247667fb4865612507.1619793406.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1619793405.git.fabioaiuto83@gmail.com>
References: <cover.1619793405.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove obsolete GLBtcDbgType declarations for it was intended
for private debug facilities.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/hal/HalBtcOutSrc.h | 1 -
 drivers/staging/rtl8723bs/hal/hal_btcoex.c   | 1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/HalBtcOutSrc.h b/drivers/staging/rtl8723bs/hal/HalBtcOutSrc.h
index f2793d5d9a30..c5444f965699 100644
--- a/drivers/staging/rtl8723bs/hal/HalBtcOutSrc.h
+++ b/drivers/staging/rtl8723bs/hal/HalBtcOutSrc.h
@@ -83,7 +83,6 @@ enum {
 	BTC_MSG_ALGORITHM	= 0x1,
 	BTC_MSG_MAX
 };
-extern u32 		GLBtcDbgType[];
 
 /*  following is for BTC_MSG_INTERFACE */
 #define INTF_INIT	BIT0
diff --git a/drivers/staging/rtl8723bs/hal/hal_btcoex.c b/drivers/staging/rtl8723bs/hal/hal_btcoex.c
index fd26187a976a..da545c4eaac0 100644
--- a/drivers/staging/rtl8723bs/hal/hal_btcoex.c
+++ b/drivers/staging/rtl8723bs/hal/hal_btcoex.c
@@ -17,7 +17,6 @@ struct btc_coexist GLBtCoexist;
 static u8 GLBtcWiFiInScanState;
 static u8 GLBtcWiFiInIQKState;
 
-u32 GLBtcDbgType[BTC_MSG_MAX];
 static u8 GLBtcDbgBuf[BT_TMP_BUF_SIZE];
 
 struct btcdbginfo { /* _btcoexdbginfo */
-- 
2.20.1

