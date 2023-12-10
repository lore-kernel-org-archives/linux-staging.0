Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B79BD11702
	for <linux-staging@lists.linux.dev>; Sun, 10 Dec 2023 15:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mQrQwk5T"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-40c317ba572so5641885e9.0
        for <linux-staging@lists.linux.dev>; Sun, 10 Dec 2023 07:26:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702222000; x=1702826800; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=x27vCUpD2eYMWgYKl63p6rruFTypQyGCnQHgn4PVIcE=;
        b=mQrQwk5TrRUKcIgHSt3rGPgVQApM/nyVDLuFZME15cIF7vTdrw4eXO3dlYrAjx2HW7
         Jy8kK3M/vV7j4m/YiKIv0coO3QelSqgZOgm03VkhYo3teXvWomeR/e9kpXWjG64opIRK
         bjMWYQtxRYhqkXMyECSt2DdOYnJmgxaPg+CwdDeHtZf0RbQtuEFtix1cq8gKW9KgnH1I
         lSUK7Gq7zVWQ6BM7yDr7JjMje2Pdut2TaGGhhQMsvwJN6VtfOL/kO8Xn1vD0pTgmPCwS
         WxxLwm5fcyEbzv6wvTbMppU1WkqvIiwMwgrbUxVtT0r7wjKbgUBT6nArvDqmaUMC6Lid
         UZoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702222000; x=1702826800;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x27vCUpD2eYMWgYKl63p6rruFTypQyGCnQHgn4PVIcE=;
        b=ntQgthXxJFZS1pKZ1YUmfXm1tGccJdiLar8n5jqTDfazkKcITwuia0+MYu6gGZK9G5
         Bih/LO/Vs2qZcGkUU+o/G0U82AXLx2JQFZjQpViXmIWm2jID+N7zaMvW0Pqn9uhe/NcP
         AfxBBJBLkmExwEq//Eir67k2nOnASbXSPaqra5v27vwo6dsMNOC93VWNY7vhPE5/ePIN
         avbJSP7I4wNaAjx91JLnactOVMKgdW7v1j5eSj+bI6MbAFgOZ7m6QYx2G47VQWpW2ATr
         8qu0Ewf890szPvzDHPAdLj94XiXhfUhIHrOAYaUJHgm/J+loavrsRVWORPq8mPYDUXzO
         RR3g==
X-Gm-Message-State: AOJu0Yw1OR67/XvE+B6aCAfXnh0gPorxZyu1057zpitEXHEJEHCabYLo
	qJw5Ey9VbAhTr7z3c3PE95w=
X-Google-Smtp-Source: AGHT+IF31uLVQkwuqXW9FQ67nNYdTNzAXw9J7VWuE5x35tRZB11V4Tbb2i9IxCBKrUs7L/0zp2zzbA==
X-Received: by 2002:a05:6000:4026:b0:333:50f2:5757 with SMTP id cp38-20020a056000402600b0033350f25757mr3500662wrb.5.1702221999797;
        Sun, 10 Dec 2023 07:26:39 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p54a07fa0.dip0.t-ipconnect.de. [84.160.127.160])
        by smtp.gmail.com with ESMTPSA id g9-20020a5d4889000000b0033609584b9dsm6265939wrq.74.2023.12.10.07.26.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Dec 2023 07:26:39 -0800 (PST)
Date: Sun, 10 Dec 2023 16:26:38 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 06/10] staging: rtl8192e: Remove variable ForcedAMPDUMode
Message-ID: <5bf740a2da78ec3b54249a30cbee70301b37e7eb.1702212003.git.philipp.g.hortmann@gmail.com>
References: <cover.1702212003.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1702212003.git.philipp.g.hortmann@gmail.com>

ForcedAMPDUMode is set to 0 and unchanged. Therefore all equations result
accordingly and ForcedAMPDUMode can be removed. As a result label
FORCED_AGG_SETTING is unused and can be removed as well.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl819x_HT.h |  1 -
 drivers/staging/rtl8192e/rtllib_tx.c  | 21 ++-------------------
 2 files changed, 2 insertions(+), 20 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_HT.h b/drivers/staging/rtl8192e/rtl819x_HT.h
index 0664eb86bada..d249062e7b66 100644
--- a/drivers/staging/rtl8192e/rtl819x_HT.h
+++ b/drivers/staging/rtl8192e/rtl819x_HT.h
@@ -113,7 +113,6 @@ struct rt_hi_throughput {
 	u8 CurrentAMPDUFactor;
 	u8 mpdu_density;
 	u8 current_mpdu_density;
-	enum ht_aggre_mode ForcedAMPDUMode;
 	u8 forced_ampdu_factor;
 	u8 forced_mpdu_density;
 	enum ht_aggre_mode ForcedAMSDUMode;
diff --git a/drivers/staging/rtl8192e/rtllib_tx.c b/drivers/staging/rtl8192e/rtllib_tx.c
index a2ae68cc13f5..0fa6f674a844 100644
--- a/drivers/staging/rtl8192e/rtllib_tx.c
+++ b/drivers/staging/rtl8192e/rtllib_tx.c
@@ -303,13 +303,13 @@ static void rtllib_tx_query_agg_cap(struct rtllib_device *ieee,
 			} else if (!ts->disable_add_ba) {
 				TsStartAddBaProcess(ieee, ts);
 			}
-			goto FORCED_AGG_SETTING;
+			return;
 		} else if (!ts->using_ba) {
 			if (SN_LESS(ts->tx_admitted_ba_record.ba_start_seq_ctrl.field.seq_num,
 				    (ts->tx_cur_seq + 1) % 4096))
 				ts->using_ba = true;
 			else
-				goto FORCED_AGG_SETTING;
+				return;
 		}
 		if (ieee->iw_mode == IW_MODE_INFRA) {
 			tcb_desc->ampdu_enable = true;
@@ -317,23 +317,6 @@ static void rtllib_tx_query_agg_cap(struct rtllib_device *ieee,
 			tcb_desc->ampdu_density = ht_info->current_mpdu_density;
 		}
 	}
-FORCED_AGG_SETTING:
-	switch (ht_info->ForcedAMPDUMode) {
-	case HT_AGG_AUTO:
-		break;
-
-	case HT_AGG_FORCE_ENABLE:
-		tcb_desc->ampdu_enable = true;
-		tcb_desc->ampdu_density = ht_info->forced_mpdu_density;
-		tcb_desc->ampdu_factor = ht_info->forced_ampdu_factor;
-		break;
-
-	case HT_AGG_FORCE_DISABLE:
-		tcb_desc->ampdu_enable = false;
-		tcb_desc->ampdu_density = 0;
-		tcb_desc->ampdu_factor = 0;
-		break;
-	}
 }
 
 static void rtllib_query_ShortPreambleMode(struct rtllib_device *ieee,
-- 
2.43.0

