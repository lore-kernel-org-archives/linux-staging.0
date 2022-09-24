Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 623077B
	for <linux-staging@lists.linux.dev>; Sat, 24 Sep 2022 22:04:16 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id f20so4465128edf.6
        for <linux-staging@lists.linux.dev>; Sat, 24 Sep 2022 15:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date;
        bh=5ShNoZDO8ydETxB9mYC1OvRn1beeWW7Y5cevQl95GTY=;
        b=l68pO3oYHNtKxiJtZK4fTPCeEdDkQAenYaxtgNdGhWvmCatMbCbs44DEBqyz+eVWkN
         0lCMYKKbLXb7/Nk41cpgSO/wYFT0Yvb6vYbhiaNPXMoqAcZdI0jat/o+3tScyCyMVSdM
         CNXTBz1ceyBmbdIYqMZZWztg7QYkEFcKg3dSOwTRK2ciZ+zbZpPWDhfn60GTMFlm/Lml
         KIiMPQqLXdROzAHg9VsA9B0oVDW2hI8b+IaoFHLlSdXzOOjZm0r4ymW1W4oOfiCl8sqz
         5ReUgxAS047n806Kybk++8DhaTpw5PctqvXh3bB+uvWFYUOpkRtbagXcK0Us2o1fGRzX
         NTBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=5ShNoZDO8ydETxB9mYC1OvRn1beeWW7Y5cevQl95GTY=;
        b=DVCjEU6ml1D7ydpaiuXT3i234ELsn24HKpQLwcE17V2sW2L4HLTZOwW28p3PPase2l
         bQvdr+aSG62f/HR73I/umQSYGg0S+bqfJ6w8tfZtPNh17IR9AoGtSPWmmekhk6GUnQm3
         dbOM/2Bz5FyCnokdI8P1qEfKRmvqiZaFvWeV+BjeRgCAFAJCL01wLJuJBrig53SNQ0xA
         pyczFBmgYmsaRz0DXF8XH/827Tk11u83YJt4ntbmZBOapGkDvcFN0UJPW9eBCSOvZmEh
         TYAetwt0KFKbZ8QDS4xV4WHex2+kDOdAAlH/nDGzNgp+pW7YYLx2g/Rq8e57Mq+n6Q58
         oKEw==
X-Gm-Message-State: ACrzQf2t2A0Wj+X15CB0l2cNasOF0/9yZrBYARtspKcQ/38EsV+aOavC
	ToMVNC0voN6VfFV0FIdAol0=
X-Google-Smtp-Source: AMsMyM6pF/ldjDvnbVpC4MmYH09KUzGKe08Tu6Fi70sjsrNC/Q3jYv1xOdJF/wCZrCFni8VCx7v9WQ==
X-Received: by 2002:a05:6402:2690:b0:452:3a85:8b28 with SMTP id w16-20020a056402269000b004523a858b28mr14731102edd.158.1664057054680;
        Sat, 24 Sep 2022 15:04:14 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p57ba2cf5.dip0.t-ipconnect.de. [87.186.44.245])
        by smtp.gmail.com with ESMTPSA id ed6-20020a056402294600b0045722259584sm498468edb.86.2022.09.24.15.04.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Sep 2022 15:04:14 -0700 (PDT)
Date: Sun, 25 Sep 2022 00:04:12 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 09/10] staging: rtl8192e: Rename CurrentMPDU...,
 ForcedAMPDU... and ForcedMPDU...
Message-ID: <4fb37ad6dab9addccf99a41a861220840c123e9b.1664055213.git.philipp.g.hortmann@gmail.com>
References: <cover.1664055213.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1664055213.git.philipp.g.hortmann@gmail.com>

Rename variable CurrentMPDUDensity to current_mpdu_density,
ForcedAMPDUFactor to forced_ampdu_factor and ForcedMPDUDensity to
forced_mpdu_density to avoid CamelCase which is not accepted by
checkpatch.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl819x_HT.h     | 6 +++---
 drivers/staging/rtl8192e/rtl819x_HTProc.c | 8 ++++----
 drivers/staging/rtl8192e/rtllib_tx.c      | 6 +++---
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_HT.h b/drivers/staging/rtl8192e/rtl819x_HT.h
index 6b3f280407a3..3d5dc60d2912 100644
--- a/drivers/staging/rtl8192e/rtl819x_HT.h
+++ b/drivers/staging/rtl8192e/rtl819x_HT.h
@@ -131,11 +131,11 @@ struct rt_hi_throughput {
 	u8				AMPDU_Factor;
 	u8				CurrentAMPDUFactor;
 	u8				MPDU_Density;
-	u8				CurrentMPDUDensity;
+	u8 current_mpdu_density;
 
 	enum ht_aggre_mode ForcedAMPDUMode;
-	u8				ForcedAMPDUFactor;
-	u8				ForcedMPDUDensity;
+	u8 forced_ampdu_factor;
+	u8 forced_mpdu_density;
 
 	enum ht_aggre_mode ForcedAMSDUMode;
 	u16				ForcedAMSDUMaxSize;
diff --git a/drivers/staging/rtl8192e/rtl819x_HTProc.c b/drivers/staging/rtl8192e/rtl819x_HTProc.c
index 1ef5c04914af..a038a8c1504f 100644
--- a/drivers/staging/rtl8192e/rtl819x_HTProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_HTProc.c
@@ -597,9 +597,9 @@ void HTOnAssocRsp(struct rtllib_device *ieee)
 		}
 	}
 	if (pHTInfo->MPDU_Density > pPeerHTCap->MPDUDensity)
-		pHTInfo->CurrentMPDUDensity = pHTInfo->MPDU_Density;
+		pHTInfo->current_mpdu_density = pHTInfo->MPDU_Density;
 	else
-		pHTInfo->CurrentMPDUDensity = pPeerHTCap->MPDUDensity;
+		pHTInfo->current_mpdu_density = pPeerHTCap->MPDUDensity;
 	if (pHTInfo->iot_action & HT_IOT_ACT_TX_USE_AMSDU_8K) {
 		pHTInfo->bCurrentAMPDUEnable = false;
 		pHTInfo->ForcedAMSDUMode = HT_AGG_FORCE_ENABLE;
@@ -643,7 +643,7 @@ void HTInitializeHTInfo(struct rtllib_device *ieee)
 
 	pHTInfo->bCurrent_AMSDU_Support = false;
 	pHTInfo->nCurrent_AMSDU_MaxSize = pHTInfo->nAMSDU_MaxSize;
-	pHTInfo->CurrentMPDUDensity = pHTInfo->MPDU_Density;
+	pHTInfo->current_mpdu_density = pHTInfo->MPDU_Density;
 	pHTInfo->CurrentAMPDUFactor = pHTInfo->AMPDU_Factor;
 
 	memset((void *)(&(pHTInfo->SelfHTCap)), 0,
@@ -801,7 +801,7 @@ void HTUseDefaultSetting(struct rtllib_device *ieee)
 		pHTInfo->bCurrentAMPDUEnable = pHTInfo->bAMPDUEnable;
 		pHTInfo->CurrentAMPDUFactor = pHTInfo->AMPDU_Factor;
 
-		pHTInfo->CurrentMPDUDensity = pHTInfo->CurrentMPDUDensity;
+		pHTInfo->current_mpdu_density = pHTInfo->current_mpdu_density;
 
 		HTFilterMCSRate(ieee, ieee->Regdot11TxHTOperationalRateSet,
 				ieee->dot11HTOperationalRateSet);
diff --git a/drivers/staging/rtl8192e/rtllib_tx.c b/drivers/staging/rtl8192e/rtllib_tx.c
index c8a8fad35cb5..e307020580a0 100644
--- a/drivers/staging/rtl8192e/rtllib_tx.c
+++ b/drivers/staging/rtl8192e/rtllib_tx.c
@@ -315,7 +315,7 @@ static void rtllib_tx_query_agg_cap(struct rtllib_device *ieee,
 		if (ieee->iw_mode == IW_MODE_INFRA) {
 			tcb_desc->bAMPDUEnable = true;
 			tcb_desc->ampdu_factor = pHTInfo->CurrentAMPDUFactor;
-			tcb_desc->ampdu_density = pHTInfo->CurrentMPDUDensity;
+			tcb_desc->ampdu_density = pHTInfo->current_mpdu_density;
 		}
 	}
 FORCED_AGG_SETTING:
@@ -325,8 +325,8 @@ static void rtllib_tx_query_agg_cap(struct rtllib_device *ieee,
 
 	case HT_AGG_FORCE_ENABLE:
 		tcb_desc->bAMPDUEnable = true;
-		tcb_desc->ampdu_density = pHTInfo->ForcedMPDUDensity;
-		tcb_desc->ampdu_factor = pHTInfo->ForcedAMPDUFactor;
+		tcb_desc->ampdu_density = pHTInfo->forced_mpdu_density;
+		tcb_desc->ampdu_factor = pHTInfo->forced_ampdu_factor;
 		break;
 
 	case HT_AGG_FORCE_DISABLE:
-- 
2.37.3

