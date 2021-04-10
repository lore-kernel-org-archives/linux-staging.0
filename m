Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CECDA71
	for <linux-staging@lists.linux.dev>; Sat, 10 Apr 2021 02:12:52 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id nh5so3756849pjb.5
        for <linux-staging@lists.linux.dev>; Fri, 09 Apr 2021 19:12:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=WGt33fyzs9vaRoy1gnWqTwImiQXUTfb1a9wEvlX+v/4=;
        b=cCUx/8TwT17qk8zeQrZ9Qtp+w7FhtWgrLg246MkazYfJi77Tp7oAxqrbS/PicqPNr0
         lVMJbEizklYWV7f0ff1S+h2hMm19PdfEiFZF1nKNMux1PksBfyBZknOrSO58mHt5DxYN
         cxTTKMVRlmS8uL1BcLKNlSPOuSEbjaGzcEyp2PqQ7+DZICjKssAGMoW5WcdJDdtrw3r+
         3CMS9Hf9rl2tZYWZF/Q6PZzzb8t77b9UW1cVFibNecvPmS3+Maay6Fy0jXKb7hObayDI
         A6wQ8iMEMkwUV7AWB5dfPWcvIzlJSWluoEsVAFMiaztX1QrzZUwAR0z3g3aJ7yUsOxZn
         Oxyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=WGt33fyzs9vaRoy1gnWqTwImiQXUTfb1a9wEvlX+v/4=;
        b=jBGH1mrY1WP8exclX5J0aHUlIAOPhGuSufLugnvX3nlXYxce45b6OXAHEwZakkaoEu
         6ZPovCGLgIEPQ4u7Egngqt5kWq71XwmROqqr3seJqowN9BtvMkJUzVgN2Oc9syQz+dYl
         9X32eHJS6iPZaaavGMbSq8i3UWK/U7UpioyeqyvpwCmgDY1C5n4/p0MSjEVjJ03D4WJb
         2pg64yVHfds7IXRGyIKDJd7Eg3+CAZDExOUuebhxiGQ2wX8g5USeuD9338sqAtJQQR6N
         50LGzMR5y/fGmvPmeY0pBxBrGrB5UrZFEVQRg3wA+sauGGq4HJV4UxtExOZorM6WJ5+m
         rT4Q==
X-Gm-Message-State: AOAM530Baks6w0AnP+ZlQl2/whAZkvRf8+3YdWq/9EYAlvINolJllMgZ
	LKy4lPy07SqyzZ/tpSpti/c=
X-Google-Smtp-Source: ABdhPJyb358NYQKZqWdsSp5glOG9T653mysoNaLWGEv4nACSePa6ZkgA+PmOGY1JqY0xsWPtNtcTBg==
X-Received: by 2002:a17:902:bd4b:b029:e6:a4a1:9d8b with SMTP id b11-20020a170902bd4bb02900e6a4a19d8bmr16124572plx.56.1618020772346;
        Fri, 09 Apr 2021 19:12:52 -0700 (PDT)
Received: from kali ([103.141.87.254])
        by smtp.gmail.com with ESMTPSA id y15sm4227966pgi.31.2021.04.09.19.12.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Apr 2021 19:12:51 -0700 (PDT)
Date: Sat, 10 Apr 2021 07:42:46 +0530
From: Mitali Borkar <mitaliborkar810@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy-kernel@googlegroups.com, mitali_s@me.iitr.ac.in
Subject: [PATCH 1/3] staging: rtl8192e: replace comparison to NULL by boolean
Message-ID: <YHEJngq5MHBEspGY@kali>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Replaced comparison to NULL by boolean expressions
(here used boolean negations). This improves readability of code.
Reported by checkpatch.

Signed-off-by: Mitali Borkar <mitaliborkar810@gmail.com>
---
 drivers/staging/rtl8192e/rtl819x_HTProc.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_HTProc.c b/drivers/staging/rtl8192e/rtl819x_HTProc.c
index 65202dd53447..0b1e92f17805 100644
--- a/drivers/staging/rtl8192e/rtl819x_HTProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_HTProc.c
@@ -276,7 +276,7 @@ void HTConstructCapabilityElement(struct rtllib_device *ieee, u8 *posHTCap,
 	struct rt_hi_throughput *pHT = ieee->pHTInfo;
 	struct ht_capab_ele *pCapELE = NULL;
 
-	if ((posHTCap == NULL) || (pHT == NULL)) {
+	if ((!posHTCap) || (!pHT)) {
 		netdev_warn(ieee->dev,
 			    "%s(): posHTCap and pHTInfo are null\n", __func__);
 		return;
@@ -357,7 +357,7 @@ void HTConstructInfoElement(struct rtllib_device *ieee, u8 *posHTInfo,
 	struct rt_hi_throughput *pHT = ieee->pHTInfo;
 	struct ht_info_ele *pHTInfoEle = (struct ht_info_ele *)posHTInfo;
 
-	if ((posHTInfo == NULL) || (pHTInfoEle == NULL)) {
+	if ((!posHTInfo) || (!pHTInfoEle)) {
 		netdev_warn(ieee->dev,
 			    "%s(): posHTInfo and pHTInfoEle are null\n",
 			    __func__);
@@ -397,7 +397,7 @@ void HTConstructInfoElement(struct rtllib_device *ieee, u8 *posHTInfo,
 void HTConstructRT2RTAggElement(struct rtllib_device *ieee, u8 *posRT2RTAgg,
 				u8 *len)
 {
-	if (posRT2RTAgg == NULL) {
+	if (!posRT2RTAgg) {
 		netdev_warn(ieee->dev, "%s(): posRT2RTAgg is null\n", __func__);
 		return;
 	}
@@ -420,7 +420,7 @@ static u8 HT_PickMCSRate(struct rtllib_device *ieee, u8 *pOperateMCS)
 {
 	u8 i;
 
-	if (pOperateMCS == NULL) {
+	if (!pOperateMCS) {
 		netdev_warn(ieee->dev, "%s(): pOperateMCS is null\n", __func__);
 		return false;
 	}
@@ -453,7 +453,7 @@ u8 HTGetHighestMCSRate(struct rtllib_device *ieee, u8 *pMCSRateSet,
 	u8		mcsRate = 0;
 	u8		availableMcsRate[16];
 
-	if (pMCSRateSet == NULL || pMCSFilter == NULL) {
+	if (!pMCSRateSet || !pMCSFilter) {
 		netdev_warn(ieee->dev,
 			    "%s(): pMCSRateSet and pMCSFilter are null\n",
 			    __func__);
-- 
2.30.2

