Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8AF43A287
	for <linux-staging@lists.linux.dev>; Wed, 13 Dec 2023 16:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lgK9U9ir"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-551e19beb35so309739a12.0
        for <linux-staging@lists.linux.dev>; Wed, 13 Dec 2023 08:52:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702486334; x=1703091134; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hcU4d4c9EhwDhCpZ+xb05RdkC86nsBALUhVrkSRZ1Dw=;
        b=lgK9U9irTVNq7DoiLmgtae1G3IPhciNZy/ge3i3VFvXrwqa8Br8m/tJG9wSQLQXh2v
         047fzDttA8Y/BRk3gP9DXXaxP+e70BHVoh+L4Mjngy4QP02aB/aH/hiIlSc6yPfI9pTB
         IjE7BPlO5tWsqZya8lqXEdJrl0weY4JjM9mQ6iZCcfpJMJMH5Lry4HTYwhNF/j2teubE
         D4MPxLPoj/Z4yPhyAlhEEG80U1Lf+2aMkBbmsNQxDdintwFSvwPCXdN1NfRrDBJ22lWu
         HqMIGZk5SKmb/5icrOuLMd4L6tzoB2v796nwdGuGn1TputF/V0/jZQiuXsGCIuPxryo9
         Kpfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702486334; x=1703091134;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hcU4d4c9EhwDhCpZ+xb05RdkC86nsBALUhVrkSRZ1Dw=;
        b=CLEJwzrIdaVPWyk63/NhmWsBASxtJAhZS9HF6hyo3PM4EyoEGalu12nBIrCTmDekm2
         RCFnKxyJnrKhJAaftncrKh2NaR0JazVjKXK2cbHfP+EQ4hXZKSiNTu/j3KJXN1pb/IKA
         P6wOLzcZ5aSkvDtE2YbX9Dkq1qUkYkiSzNzzRDLhPT9VvBoyUw5kTp+0AwPFlbB6RO/b
         dbb/TVSrLRs9qm0vg6aMyFNEiFW9r+20+wAWCGXfjlzoMhEeym4ZbKtrf7SKv/2ZpRUJ
         ufy0yqGwSl+yvqFEMnzIQFpVF8aBozJ/zyFP3kWcLjpZgoj/3u2EYeVTiL0d7Oo7Jn9Q
         lQ/A==
X-Gm-Message-State: AOJu0YyyGLIA+JcqOncN+j0e2hDt4ENrvey4V06X9J7M6Z1qdFjVhtic
	87XqB4umMamrXNHvY1Q4k4c=
X-Google-Smtp-Source: AGHT+IGZz7paThhCvZZNDmg/Imt9mXY25GH+sKlIoSMkzIKOa6mluYu0N+JMxL26diY7xzifU3KH4g==
X-Received: by 2002:a50:c189:0:b0:54c:6fc0:483a with SMTP id m9-20020a50c189000000b0054c6fc0483amr8757847edf.2.1702486334020;
        Wed, 13 Dec 2023 08:52:14 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p54a07fa0.dip0.t-ipconnect.de. [84.160.127.160])
        by smtp.gmail.com with ESMTPSA id v1-20020a50d581000000b00550ce74f7eesm4994896edi.67.2023.12.13.08.52.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 08:52:13 -0800 (PST)
Date: Wed, 13 Dec 2023 17:52:12 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 05/10] staging: rtl8192e: Remove constant variable
 forced_short_gi
Message-ID: <fc5711032c658af6ae6c5a7a98c52871c29f8c33.1702406712.git.philipp.g.hortmann@gmail.com>
References: <cover.1702406712.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1702406712.git.philipp.g.hortmann@gmail.com>

ht_info->forced_short_gi is set to 0 and unchanged. Therefore all equations
result accordingly and ht_info->forced_short_gi can be removed.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl819x_HT.h     | 1 -
 drivers/staging/rtl8192e/rtl819x_HTProc.c | 1 -
 drivers/staging/rtl8192e/rtllib_tx.c      | 5 -----
 3 files changed, 7 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_HT.h b/drivers/staging/rtl8192e/rtl819x_HT.h
index 43472b2250c2..e6cd906dc0ac 100644
--- a/drivers/staging/rtl8192e/rtl819x_HT.h
+++ b/drivers/staging/rtl8192e/rtl819x_HT.h
@@ -110,7 +110,6 @@ struct rt_hi_throughput {
 	u8 current_mpdu_density;
 	u8 forced_ampdu_factor;
 	u8 forced_mpdu_density;
-	u8 forced_short_gi;
 	u8 current_op_mode;
 	enum ht_extchnl_offset CurSTAExtChnlOffset;
 	u8 cur_tx_bw40mhz;
diff --git a/drivers/staging/rtl8192e/rtl819x_HTProc.c b/drivers/staging/rtl8192e/rtl819x_HTProc.c
index d424b7729a01..578d9276035f 100644
--- a/drivers/staging/rtl8192e/rtl819x_HTProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_HTProc.c
@@ -527,7 +527,6 @@ void HTInitializeHTInfo(struct rtllib_device *ieee)
 
 	ht_info->cur_short_gi_20mhz = false;
 	ht_info->cur_short_gi_40mhz = false;
-	ht_info->forced_short_gi = false;
 
 	ht_info->current_mpdu_density = ht_info->mpdu_density;
 	ht_info->CurrentAMPDUFactor = ht_info->ampdu_factor;
diff --git a/drivers/staging/rtl8192e/rtllib_tx.c b/drivers/staging/rtl8192e/rtllib_tx.c
index 0fa6f674a844..f7098a2ba8b0 100644
--- a/drivers/staging/rtl8192e/rtllib_tx.c
+++ b/drivers/staging/rtl8192e/rtllib_tx.c
@@ -340,11 +340,6 @@ static void rtllib_query_HTCapShortGI(struct rtllib_device *ieee,
 	if (!ht_info->current_ht_support || !ht_info->enable_ht)
 		return;
 
-	if (ht_info->forced_short_gi) {
-		tcb_desc->bUseShortGI = true;
-		return;
-	}
-
 	if (ht_info->cur_bw_40mhz && ht_info->cur_short_gi_40mhz)
 		tcb_desc->bUseShortGI = true;
 	else if (!ht_info->cur_bw_40mhz && ht_info->cur_short_gi_20mhz)
-- 
2.43.0

