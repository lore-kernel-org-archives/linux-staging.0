Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 383A6377000
	for <linux-staging@lists.linux.dev>; Fri, 17 Jul 2026 16:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784304927; cv=none; b=iH0Unqg3ATeXSfjjZkztTuPz7OquKrNSFU2xa2JYj5xefZEoxfd1HxfNNgZyq3KK2AI7kAzuBmPoojOFzn/I2wXv13Eaz//oGHml9eXipSVM6rl+gWg5jQQZmdliCkrjs/q9yMYkC4SIJ7hhYdY+WfQAnMt7H5P9zVJoDf6Xc24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784304927; c=relaxed/simple;
	bh=3zImIYXLiKT4q6PpcAKK+PZ4G7fsWWk2cE2Bl8EBVxM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Lwv5QBoxiuVLFdYInC3phQrwI9sfMAB8mhWpLBnWJYtq2z3b+X9vim3doITMyUmUPt7YsrZf3+Y4yoCgk9tmMNwI4Ggw6joV9zX2YKWNc7d4TIs0N7DZ7djeYYIUEs+HWy0lPLeaaHZPTe9vpFp4WWxbyGudkN6Dgdu/meas034=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hFQ9gZme; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hFQ9gZme"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-4758bd3731bso1554585f8f.0
        for <linux-staging@lists.linux.dev>; Fri, 17 Jul 2026 09:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784304923; x=1784909723; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LZHW/38ICNcakcfMw1kjAmwJ8fiAmMI+UWsjBTBRZ9Y=;
        b=hFQ9gZmex9hG+ee3aShuE4MwMCK8MJDDz4P3HgQWx6oeE/2PykqUXaSyoUprz7mmyy
         wyID+IHsFIyqQ/Q+s+MZIIHvOMHOh3SM8EMUpKkpnkvC6XlKsqX+0vbkM0bvQOXmUUJp
         2K/u7KqaEpID2sMZPfEoxHq/XGJhfSwwGagcBR0p1ntxMnEvFBqvVNIjTyUzDR+gXkZA
         PpShaNwN2o+aRNIZWNJLsgDvrIXLCPPYAZAm5HtGf3RFCIOB0Mim2Skrb4fs4UwAzbx1
         35c80piEowLwT8+QKqFLZm7L9g+zgFo64/N+4Y29zGFephrBbr9YS2AZGSp4SR2cZNID
         gq+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784304923; x=1784909723;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LZHW/38ICNcakcfMw1kjAmwJ8fiAmMI+UWsjBTBRZ9Y=;
        b=RFK59AoQYrYA54p3bCSDudrmmy1qw/++hBmEZreGxukCm1dLDnurOYd3AciRFITSJr
         Gn+ZHuU7tZKnnLPIr5brh9XfUdVoNZPtBq+UdItn+agxS6t0NdwOUw1moUdRypk8bw4b
         xz8HqMasEox++QRuaXA8+i3bQMOoIX9c0C0cAvFV/wTysFmcpHa/ozjX2FGYlNS/muxh
         BeWjqowBTXxV5oHy0PWC1nt9o7VVnwZ0UmgLI3cBPDDReVXsviCaeri4ol8vsyjzaPLg
         EzSmHez5GtntGcyhIsl7xzPa6gFMgYp2e1AZChsdR8339HTxuPz5VPZ5+9ns1paWpPKw
         1+bQ==
X-Gm-Message-State: AOJu0YxvvdUTGMFicUQI60FqCdC986qFKN//TvLvFiBL2dG9XpnxOMfF
	geezTzDh0UGeNwEt9T5n0mq6VJF6zAwTs6Iggj/BTwYDwicaGPNEoljQ
X-Gm-Gg: AfdE7cku9LhKz6XsMC3HWJHd+rS0n07W02Eu4MOcM6Ry8FPVXSP8/l7UneDA7ddr2Bi
	7D5GHsfJBlBw608dYGNTCtmioXLrzfoj7nCu2SQ86J6BjzR++WfopJmgP5tCbRf1JyBgzJPtmiI
	xRRvgnTWYd9Bq4at+4e1mG/Qa3nsKnVLigC9txyjB+bPHVwsFAT2w2xfF35YF0xAmeR+E443BEw
	pgya903ewQ9iCRjbSjQU4H/CIwPMylnzpMo3sr0sGc9Ey5g2oQ8N0iOcXW784Els1Hvu3GQfUAR
	4otT9/jSbdBgm0abdI6e0TDZ9TXldilVXI2SgXr+6XMZoIRd8f+0X50jmx5OMbiTERoTY2yI8Q8
	s9X1wC3EcvIyc/A4BvqePgkxBaf7RZPaWEs6wSyQxXnz7lpJZbs6sslufaLJgeLLFAvmqXFv7VE
	6Xdn9FqUSkEMLaVp2vIL/Hg+AtadwsMov38A/Jxi1FOhUdQkPayDVVpPyXnTQdGHiJK7I=
X-Received: by 2002:a05:6000:41f0:b0:460:d18:865c with SMTP id ffacd0b85a97d-47f5a4182c4mr10396577f8f.1.1784304923018;
        Fri, 17 Jul 2026 09:15:23 -0700 (PDT)
Received: from koolguy.fritz.box (dslb-088-074-245-227.088.074.pools.vodafone-ip.de. [88.74.245.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f66df025csm3252526f8f.0.2026.07.17.09.15.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 09:15:22 -0700 (PDT)
From: Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>
Subject: [PATCH v2 2/4] staging: rtl8723bs: wrap line over 100 characters
Date: Fri, 17 Jul 2026 16:13:27 +0000
Message-ID: <20260717161329.3400-3-fliegbert2@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260717161329.3400-1-fliegbert2@gmail.com>
References: <20260715171634.1550-1-fliegbert2@gmail.com>
 <20260717161329.3400-1-fliegbert2@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix checkpatch warning by wrapping the lines.

Signed-off-by: Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c     |  3 ++-
 drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c      | 12 ++++++++----
 drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c |  3 ++-
 3 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index 57f0403ff5bf..216990e9dcc8 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -3720,7 +3720,8 @@ unsigned int send_beacon(struct adapter *padapter)
 			 !padapter->bSurpriseRemoved &&
 			 !padapter->driver_stopped);
 
-	} while (false == bxmitok && issue < 100 && !padapter->bSurpriseRemoved && !padapter->driver_stopped);
+	} while (false == bxmitok && issue < 100 && !padapter->bSurpriseRemoved &&
+		 !padapter->driver_stopped);
 
 	if (padapter->bSurpriseRemoved || padapter->driver_stopped)
 		return _FAIL;
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c b/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
index 0790209a3a8f..d2b44ad60a4c 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
@@ -639,9 +639,11 @@ void rtl8723b_download_rsvd_page(struct adapter *padapter, u8 mstatus)
 				/*  check rsvd page download OK. */
 				rtw_hal_get_hwreg(padapter, HW_VAR_BCN_VALID, (u8 *)(&bcn_valid));
 				poll++;
-			} while (!bcn_valid && (poll % 10) != 0 && !padapter->bSurpriseRemoved && !padapter->driver_stopped);
+			} while (!bcn_valid && (poll % 10) != 0 && !padapter->bSurpriseRemoved &&
+				 !padapter->driver_stopped);
 
-		} while (!bcn_valid && DLBcnCount <= 100 && !padapter->bSurpriseRemoved && !padapter->driver_stopped);
+		} while (!bcn_valid && DLBcnCount <= 100 && !padapter->bSurpriseRemoved &&
+			 !padapter->driver_stopped);
 
 		if (padapter->bSurpriseRemoved || padapter->driver_stopped) {
 		} else {
@@ -897,8 +899,10 @@ void rtl8723b_download_BTCoex_AP_mode_rsvd_page(struct adapter *padapter)
 			/*  check rsvd page download OK. */
 			rtw_hal_get_hwreg(padapter, HW_VAR_BCN_VALID, &bcn_valid);
 			poll++;
-		} while (!bcn_valid && (poll % 10) != 0 && !padapter->bSurpriseRemoved && !padapter->driver_stopped);
-	} while (!bcn_valid && (DLBcnCount <= 100) && !padapter->bSurpriseRemoved && !padapter->driver_stopped);
+		} while (!bcn_valid && (poll % 10) != 0 && !padapter->bSurpriseRemoved &&
+			 !padapter->driver_stopped);
+	} while (!bcn_valid && (DLBcnCount <= 100) && !padapter->bSurpriseRemoved &&
+		 !padapter->driver_stopped);
 
 	if (bcn_valid) {
 		struct pwrctrl_priv *pwrctl = adapter_to_pwrctl(padapter);
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index bb66ab008e3c..6d75cc8fa566 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -189,7 +189,8 @@ static s32 polling_fwdl_chksum(
 	do {
 		cnt++;
 		value32 = rtw_read32(adapter, REG_MCUFWDL);
-		if (value32 & FWDL_ChkSum_rpt || adapter->bSurpriseRemoved || adapter->driver_stopped)
+		if (value32 & FWDL_ChkSum_rpt || adapter->bSurpriseRemoved ||
+		    adapter->driver_stopped)
 			break;
 		yield();
 	} while (jiffies_to_msecs(jiffies-start) < timeout_ms || cnt < min_cnt);
-- 
2.54.0

