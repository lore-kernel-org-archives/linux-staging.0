Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B491811702
	for <linux-staging@lists.linux.dev>; Sun, 10 Dec 2023 15:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DnFPMlCM"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-40c2655da63so5703105e9.1
        for <linux-staging@lists.linux.dev>; Sun, 10 Dec 2023 07:26:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702221992; x=1702826792; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5+7aTaTlcaG6uppnc5wOD9WJR1BJWGY5PIIBacZp7LI=;
        b=DnFPMlCMC1Vhegc7vnq1lffq/oKCwmjmXJWe4nCoHN28C8opIR+vCJK6K+SkSxZ667
         dxkRME9K4jjm9Wz7fJotMDo+S/BTjoZbuGr5e+1MRZaF2ME9hqnPCiLc2sNuzofz7Z7A
         CO+Cf8YoO0yiAWKn/oaB2Qob6Xnquuft9UyeYlw8zCS2fAfF4cStkeIMQrfCEJ9jQPmT
         GqMC4CBKNR1xkt5SxIV65P7GHRU57pSuJ3bWQoj/2bcpeEoYmYLnGm2QSqYH96tipdZ4
         D0GL4iGTVUo98iS7zxv84m4h0sZU3GKN7ez0QG+D5nPOMa3uFg9dRWOcWzDXmYcypXx6
         NbxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702221992; x=1702826792;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5+7aTaTlcaG6uppnc5wOD9WJR1BJWGY5PIIBacZp7LI=;
        b=E0hmP1L0NjQ1rsptUwCQikO++hf63s7eZZQHn53pZSllR1b5126oywCeG7RoJHiRQP
         N9/o0TVM3LzpTBSGAFvRZyvb5QwHVBTbsvXOO1DlfF4Fqcxtxr/VczX5JO0/AFz0KE2v
         D/qTgkrfmpYELACUOXCmGd7OdsFLBSWtRdIHQmMHrecH3Pxw9l8jV4tVqV32h06yCv3f
         2xkKO3gyKbrS2Ryf5hB2YanwcBvvFSn5kEXe0vfazKaLIbd2RwZLHr/rXdNrffj7jb/b
         EwFoGePZQvyPhP6VjdetH7sex0W9K2T+10ks0zc2wPnv4evwbKkaDKzaeN45O3G6T8Yq
         zb/w==
X-Gm-Message-State: AOJu0Ywsf7HaDSiRxrlVICaWWzT3ECsTABfEIVK7YmEfLJgtzZtDPgw1
	5hZqTNhLGsl4qZPrpwfBsHLYPbZE53M=
X-Google-Smtp-Source: AGHT+IEIz5F2RMVOcsuKSimCj3U2AYWR3DKo626ZvJedo1stLVJcI1Wd5pxDlCOLi2BsG8Imgh7etw==
X-Received: by 2002:a05:600c:35d6:b0:405:358c:ba75 with SMTP id r22-20020a05600c35d600b00405358cba75mr4026078wmq.0.1702221991724;
        Sun, 10 Dec 2023 07:26:31 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p54a07fa0.dip0.t-ipconnect.de. [84.160.127.160])
        by smtp.gmail.com with ESMTPSA id o3-20020a05600c4fc300b004042dbb8925sm12148980wmq.38.2023.12.10.07.26.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Dec 2023 07:26:31 -0800 (PST)
Date: Sun, 10 Dec 2023 16:26:30 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 05/10] staging: rtl8192e: Remove variable
 ht_info->reg_short_gi_40mhz
Message-ID: <255039e0cb27582a98a0b86340dfe88f14c08a76.1702212003.git.philipp.g.hortmann@gmail.com>
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

ht_info->reg_short_gi_40mhz is set to 1 and unchanged. Therefore all
equations result accordingly and ht_info->reg_short_gi_40mhz can be
removed.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl819x_HT.h     | 1 -
 drivers/staging/rtl8192e/rtl819x_HTProc.c | 6 +-----
 2 files changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_HT.h b/drivers/staging/rtl8192e/rtl819x_HT.h
index 8a4bd389004a..0664eb86bada 100644
--- a/drivers/staging/rtl8192e/rtl819x_HT.h
+++ b/drivers/staging/rtl8192e/rtl819x_HT.h
@@ -95,7 +95,6 @@ struct rt_hi_throughput {
 	u8 enable_ht;
 	u8 current_ht_support;
 	u8 cur_bw_40mhz;
-	u8 reg_short_gi_40mhz;
 	u8 cur_short_gi_40mhz;
 	u8 cur_short_gi_20mhz;
 	u8 bCurSuppCCK;
diff --git a/drivers/staging/rtl8192e/rtl819x_HTProc.c b/drivers/staging/rtl8192e/rtl819x_HTProc.c
index ed9b3db1a393..0a5885d6c0a0 100644
--- a/drivers/staging/rtl8192e/rtl819x_HTProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_HTProc.c
@@ -71,8 +71,6 @@ void ht_update_default_setting(struct rtllib_device *ieee)
 {
 	struct rt_hi_throughput *ht_info = ieee->ht_info;
 
-	ht_info->reg_short_gi_40mhz = 1;
-
 	ht_info->amsdu_max_size = 7935UL;
 	ht_info->amsdu_support = 0;
 
@@ -471,9 +469,7 @@ void HTOnAssocRsp(struct rtllib_device *ieee)
 				 true : false);
 
 	ht_info->cur_short_gi_20mhz = ((pPeerHTCap->ShortGI20Mhz == 1) ? true : false);
-	ht_info->cur_short_gi_40mhz = ((ht_info->reg_short_gi_40mhz) ?
-				     ((pPeerHTCap->ShortGI40Mhz == 1) ?
-				     true : false) : false);
+	ht_info->cur_short_gi_40mhz = ((pPeerHTCap->ShortGI40Mhz == 1) ? true : false);
 
 	ht_info->bCurSuppCCK = ((pPeerHTCap->DssCCk == 1) ? true : false);
 
-- 
2.43.0

