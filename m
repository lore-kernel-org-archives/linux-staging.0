Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70ADF11702
	for <linux-staging@lists.linux.dev>; Sun, 10 Dec 2023 15:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UZus72hO"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-40c1e8458b9so6039845e9.0
        for <linux-staging@lists.linux.dev>; Sun, 10 Dec 2023 07:26:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702222006; x=1702826806; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=W1A/KEgyt6f82zEHVyS55QzynSt7PFOs4Ej8iQWUE3o=;
        b=UZus72hOWqfmyiAdW0eCcsDELJkEeNJWh68YmyqobBIIiTeG07/nr9YMzo71nzbzeM
         VFYLcJAXJnZ4IKEXRuuMwIVrXmnIAph8xN/cx1G+jr+tO4kfokGq3StCskIfPvC8IUKz
         CEb0XoSisSr8ejTlcN+inpZyZYJuqiId3TN5a79c+PXAqzrtyOcqCvRuEIxr1/R+f899
         PLvpGO7fXQm3DDWkcM9gk3iGY1VSla0moQSSdDJR74lBpMe0WDdYYKy5wvd4hDZz/+JE
         4YyY7RlcSPVnCBhvwXCsKKl416kLwRGTcC5mbG/Kpfdpqt3m41fAocFD7KgSZPsfIodB
         QRGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702222006; x=1702826806;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W1A/KEgyt6f82zEHVyS55QzynSt7PFOs4Ej8iQWUE3o=;
        b=II0UNPDbgSmQ5HVwy0+Uz9zrsteZgms3o5X6FeogPhOnvHRvrbti70B58Dn70YI2WT
         0wA+hHKL1ylrqA0fv6RWSgwqngV34qhBVwGwnhquup/sO2N/wsOLcC8xc9L6ULJ9gxEr
         2Aacux0XYdD52mNcw525bsrPwLyjoklxeNO0584MNCdDKOaXSuuFmx9IUeuw17DN5SiX
         ErMSxVo88oU+9yRBEoyADMeC9soB08qqjFuQWe8aP03ZBZVe8pTuxk8HlC7D0+j651jq
         i6d3PMlU3JoMpR37uzbkBQrWUE2jKG7YDNgSqeXSwWf2JKnLlragC3jIIJeL8vChO53x
         Yuqw==
X-Gm-Message-State: AOJu0YynB58Sy/wENzfSOpHMzmQ5v/dl+UQ3Aq8YcTjs39FVIIn4sfbR
	sVEgOISZ3RL1hkYiXRC/usZAAQ3/y4w=
X-Google-Smtp-Source: AGHT+IG+egokZ4LpUcvK7T07fDpzPhtz85ZEe6LZDMNFDLu9BGAD1guVZLyFzvbqnXFmVFnxHOJrlw==
X-Received: by 2002:a05:600c:524e:b0:40b:2708:2a52 with SMTP id fc14-20020a05600c524e00b0040b27082a52mr4018180wmb.1.1702222006500;
        Sun, 10 Dec 2023 07:26:46 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p54a07fa0.dip0.t-ipconnect.de. [84.160.127.160])
        by smtp.gmail.com with ESMTPSA id t15-20020a05600c198f00b0040c4620b9fasm1534010wmq.11.2023.12.10.07.26.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Dec 2023 07:26:46 -0800 (PST)
Date: Sun, 10 Dec 2023 16:26:44 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 07/10] staging: rtl8192e: Remove variable ForcedAMSDUMode
Message-ID: <ae8ea27e2c3708754b798f09ba43ed50a24b8a55.1702212003.git.philipp.g.hortmann@gmail.com>
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

ForcedAMSDUMode is set to 1 and then never evaluated.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl819x_HT.h     | 1 -
 drivers/staging/rtl8192e/rtl819x_HTProc.c | 1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_HT.h b/drivers/staging/rtl8192e/rtl819x_HT.h
index d249062e7b66..670affe9d57b 100644
--- a/drivers/staging/rtl8192e/rtl819x_HT.h
+++ b/drivers/staging/rtl8192e/rtl819x_HT.h
@@ -115,7 +115,6 @@ struct rt_hi_throughput {
 	u8 current_mpdu_density;
 	u8 forced_ampdu_factor;
 	u8 forced_mpdu_density;
-	enum ht_aggre_mode ForcedAMSDUMode;
 	u8 forced_short_gi;
 	u8 current_op_mode;
 	u8 self_mimo_ps;
diff --git a/drivers/staging/rtl8192e/rtl819x_HTProc.c b/drivers/staging/rtl8192e/rtl819x_HTProc.c
index 0a5885d6c0a0..bedee290e7f5 100644
--- a/drivers/staging/rtl8192e/rtl819x_HTProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_HTProc.c
@@ -513,7 +513,6 @@ void HTOnAssocRsp(struct rtllib_device *ieee)
 					      pPeerHTCap->MPDUDensity);
 	if (ht_info->iot_action & HT_IOT_ACT_TX_USE_AMSDU_8K) {
 		ht_info->current_ampdu_enable = false;
-		ht_info->ForcedAMSDUMode = HT_AGG_FORCE_ENABLE;
 	}
 	ht_info->cur_rx_reorder_enable = ht_info->reg_rx_reorder_enable;
 
-- 
2.43.0

