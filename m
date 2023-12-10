Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCDA511702
	for <linux-staging@lists.linux.dev>; Sun, 10 Dec 2023 15:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BBLHIR9W"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-40c32e205fcso4745135e9.1
        for <linux-staging@lists.linux.dev>; Sun, 10 Dec 2023 07:26:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702221980; x=1702826780; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fHHEx4HhN/ZzvVnFKWTOzaSwu+z7Yx7t+wmiq/WZcOk=;
        b=BBLHIR9WpGQ2n+w8mFv6FQyuoNBD/WTwg5dUeLBYnVsAi9FJjP99uxXAPIprXgQcFZ
         eG+D/jviBcbd1ECaLqSThd/IbDQJjugOT4H4jcyp18ImNvxStMy7Bqotj8JULMlRimlY
         6KqVQymueYAEkkqbBc9C4JDrUsD550U/LQAckawfNrAuNQgxS0pHwrtaTWGCcnlAPWpd
         EBDDAxegHHWVW6axhXjueA63JrtbysQGEd6EkOwuAx+HRoyUJoJCnvOMq57If88jIr4/
         NNJCK/bZwxjWhRaQ6FOkXYmzcagHXD2jpVCHRSS2dzN22gsN7v0IwANyr/LTBTXvWuj/
         tDAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702221980; x=1702826780;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fHHEx4HhN/ZzvVnFKWTOzaSwu+z7Yx7t+wmiq/WZcOk=;
        b=MR8GZvKvlxIw8FMg2VICU3fnG5ACFPWkyUo3jyYE1aoxJw2jTAaUBctF2xDykGsaxU
         wyuaAQRegwoQeSYJZw/bJ8uiYrGA5hRIn6c9NNtaKIB4hJ7RyvkmJMOIL3iAyByfK1vP
         Kfz72xLv3Yq1S4JiZazqjjtTNNaPFi42IQ0U5KK9qLmyFZ5RIa/1XEdlD/9QjVoS+I9k
         HvDDUCA5Jnn+Kbczx4zly+hJZ9AOqJjWpcs7MuDZBwaSuuRfDn783Z9r/wqHSHw9zF42
         761HAC7r42JHNc50jtxiDjEoaV1UlAd21JJip+iCg4Jf383htYbWzaj8+DgHqVQZQXJU
         Rb0w==
X-Gm-Message-State: AOJu0Yyc/ghdvuxcNSQaMvhYP3M6b02nu2C3VDYv2lAFcw96BeFY5Us2
	e/WFySL/Zfb0+2WDvcoxXQM=
X-Google-Smtp-Source: AGHT+IFOsbIAp+/L+GqcUlyiseulJCLY2ArDFGZzJbFClxY3Zhcm+QVMnFMsDiUIRwD7wi0XpNvs0A==
X-Received: by 2002:a05:600c:1c86:b0:3fe:d637:7b25 with SMTP id k6-20020a05600c1c8600b003fed6377b25mr4069911wms.0.1702221979935;
        Sun, 10 Dec 2023 07:26:19 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p54a07fa0.dip0.t-ipconnect.de. [84.160.127.160])
        by smtp.gmail.com with ESMTPSA id jg8-20020a05600ca00800b0040b54335d57sm12141082wmb.17.2023.12.10.07.26.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Dec 2023 07:26:19 -0800 (PST)
Date: Sun, 10 Dec 2023 16:26:18 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 03/10] staging: rtl8192e: Remove variable
 ht_info->reg_supp_cck
Message-ID: <2c9be9efb1c0608a7fc2658d813b9adbc1185db1.1702212003.git.philipp.g.hortmann@gmail.com>
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

ht_info->reg_supp_cck is set to 1 and unchanged. Therefore all equations
result accordingly and ht_info->reg_supp_cck can be removed.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl819x_HT.h     | 1 -
 drivers/staging/rtl8192e/rtl819x_HTProc.c | 8 ++------
 2 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_HT.h b/drivers/staging/rtl8192e/rtl819x_HT.h
index bbfdfb79c6f2..6556c5df958d 100644
--- a/drivers/staging/rtl8192e/rtl819x_HT.h
+++ b/drivers/staging/rtl8192e/rtl819x_HT.h
@@ -99,7 +99,6 @@ struct rt_hi_throughput {
 	u8 cur_short_gi_40mhz;
 	u8 reg_short_gi_20mhz;
 	u8 cur_short_gi_20mhz;
-	u8 reg_supp_cck;
 	u8 bCurSuppCCK;
 	enum ht_spec_ver ePeerHTSpecVer;
 	struct ht_capab_ele SelfHTCap;
diff --git a/drivers/staging/rtl8192e/rtl819x_HTProc.c b/drivers/staging/rtl8192e/rtl819x_HTProc.c
index f81d9ba9c9f5..7acc8b4c11c4 100644
--- a/drivers/staging/rtl8192e/rtl819x_HTProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_HTProc.c
@@ -74,8 +74,6 @@ void ht_update_default_setting(struct rtllib_device *ieee)
 	ht_info->reg_short_gi_20mhz = 1;
 	ht_info->reg_short_gi_40mhz = 1;
 
-	ht_info->reg_supp_cck = 1;
-
 	ht_info->amsdu_max_size = 7935UL;
 	ht_info->amsdu_support = 0;
 
@@ -281,7 +279,7 @@ void HTConstructCapabilityElement(struct rtllib_device *ieee, u8 *posHTCap,
 	pCapELE->RxSTBC			= 0;
 	pCapELE->DelayBA		= 0;
 	pCapELE->MaxAMSDUSize = (MAX_RECEIVE_BUFFER_SIZE >= 7935) ? 1 : 0;
-	pCapELE->DssCCk = (pHT->reg_supp_cck ? 1 : 0);
+	pCapELE->DssCCk = 1;
 	pCapELE->PSMP = 0;
 	pCapELE->LSigTxopProtect = 0;
 
@@ -480,9 +478,7 @@ void HTOnAssocRsp(struct rtllib_device *ieee)
 				     ((pPeerHTCap->ShortGI40Mhz == 1) ?
 				     true : false) : false);
 
-	ht_info->bCurSuppCCK = ((ht_info->reg_supp_cck) ?
-			       ((pPeerHTCap->DssCCk == 1) ? true :
-			       false) : false);
+	ht_info->bCurSuppCCK = ((pPeerHTCap->DssCCk == 1) ? true : false);
 
 	ht_info->bCurrent_AMSDU_Support = ht_info->amsdu_support;
 
-- 
2.43.0

