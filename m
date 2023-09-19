Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF7588814
	for <linux-staging@lists.linux.dev>; Tue, 19 Sep 2023 17:13:48 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-68fcb4dc8a9so5431047b3a.2
        for <linux-staging@lists.linux.dev>; Tue, 19 Sep 2023 10:13:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695143628; x=1695748428; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FAKzLNN3omo5G3t3Q3Z+5ZUsB2vHt2IaB13wVcXMzUY=;
        b=dfHV/P1Xln1PZlj4jcr24zKWG7uEGqZ1lR9WHJYf46nRQgY3py7dV5HPBDSCYSc+lx
         yu4JV46YWG2uCjR/41He+1EuT1X2Xaccbl/oSCkCvL9bPr61L3fmU4lGQa5OJScJap6y
         fpSaCOMlsLLKlzDW46qdQGtNetSROJ/MdkT5EtqOG3BGA24JX9SBY506Vlawi17UpIQr
         i5Pk2X8YilvgGsyjCjleZxAWXrj5NUttsthyHAOsLdXsOaiHnPIJM5GHocKb8/17egx0
         zHQCcCLJHCTXFQIYov8cfu9TWXJNVDy6xEEEVS/MDFT0S5WK7I/Suq/M97iKPT/1XM8h
         nacg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695143628; x=1695748428;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FAKzLNN3omo5G3t3Q3Z+5ZUsB2vHt2IaB13wVcXMzUY=;
        b=iIbLlUUhitVbG7NGDHBWB/9hoHc80TNz0J0XimqAQhKXN3K3wzFf1zDDuYs/GGvq6X
         ORYOR8wufxwMn/ip0UnkBnH7Eyd99/eJQTV+E5pQiJ2HTDQPrfSecwgpdKTMZoSQHJ9H
         iaLG+LlUVva/jZYqyHDvhwDjY4plsRBknIbWUikq+lfbu7ntijD+u0WjGCVQfB/6BfbX
         SlRio/DVMM35xlihBY+b9NNgWwdiAiUspngo1tYP1lmfhuAB1SlohO5EVDo5EinuRa4h
         d2HFRvgs3harpy8fVg5cq9wROYNg0Ljd42NoHzEUgBOLtYivAzpBTjzxBImrxi735ocY
         /BoA==
X-Gm-Message-State: AOJu0YwO69HIJc/Paw/6Y7upg+ZdZvIQMKXUTmWoBo0DqIa9DLaHa8s1
	rQIb1AqrMrCPKVdW7TpLxZA=
X-Google-Smtp-Source: AGHT+IGHUgpZNkGcerRxIQonBsC68jysMiuSJ4sYngrVhWaMEyYWAr5f46q5AZlWt5045G6dEdB1dA==
X-Received: by 2002:a05:6a00:18a9:b0:68f:cdf3:dd54 with SMTP id x41-20020a056a0018a900b0068fcdf3dd54mr347622pfh.9.1695143627910;
        Tue, 19 Sep 2023 10:13:47 -0700 (PDT)
Received: from [192.168.31.134] ([117.243.68.251])
        by smtp.gmail.com with ESMTPSA id u9-20020a62ed09000000b0068fe39e6a46sm8769599pfh.112.2023.09.19.10.13.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Sep 2023 10:13:47 -0700 (PDT)
Message-ID: <7bad2536-087e-9ecd-36a5-b243e0b3e1e9@gmail.com>
Date: Tue, 19 Sep 2023 22:43:42 +0530
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH] staging: rtl8723bs: hal: Fix codespell-reported spelling
 mistakes
Content-Language: en-US
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20230917134940.2746-1-bragathemanick0908@gmail.com>
From: Bragatheswaran Manickavel <bragathemanick0908@gmail.com>
In-Reply-To: <20230917134940.2746-1-bragathemanick0908@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 17/09/23 19:19, Bragatheswaran Manickavel wrote:
 >They are appear to be spelling mistakes,
 >Initially identified in a codespell report and never been addressed so 
far.
 >
 >./rtl8723b_phycfg.c:156: Threre ==> There, three
 >./rtl8723b_phycfg.c:283: Condig ==> Config
 >./rtl8723b_phycfg.c:328: Tranceiver ==> Transceiver
 >
 >Signed-off-by: Bragatheswaran Manickavel <bragathemanick0908@gmail.com>
 >---
 > drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c | 6 +++---
 > 1 file changed, 3 insertions(+), 3 deletions(-)
 >
 >diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c 
b/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c
 >index a3bff27af523..7764896a04ea 100644
 >--- a/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c
 >+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c
 >@@ -153,7 +153,7 @@ static u32 phy_RFSerialRead_8723B(
 >  * @Data:    The new register Data in the target bit position
 >  *            of the target to be read
 >  *
 >- * .. Note::    Threre are three types of serial operations:
 >+ * .. Note::    There are three types of serial operations:
 >  *        1. Software serial write
 >  *        2. Hardware LSSI-Low Speed Serial Interface
 >  *        3. Hardware HSSI-High speed
 >@@ -280,7 +280,7 @@ void PHY_SetRFReg_8723B(
 >
 >
 > 
/*-----------------------------------------------------------------------------
 >- * PHY_MACConfig8192C - Condig MAC by header file or parameter file.
 >+ * PHY_MACConfig8192C - Config MAC by header file or parameter file.
 >  *
 >  * Revised History:
 >  *  When        Who        Remark
 >@@ -325,7 +325,7 @@ static void phy_InitBBRFRegisterDefinition(struct 
adapter *Adapter)
 >     pHalData->PHYRegDef[RF_PATH_A].rfHSSIPara2 = 
rFPGA0_XA_HSSIParameter2;  /* wire control parameter2 */
 >     pHalData->PHYRegDef[RF_PATH_B].rfHSSIPara2 = 
rFPGA0_XB_HSSIParameter2;  /* wire control parameter2 */
 >
 >-    /*  Tranceiver Readback LSSI/HSPI mode */
 >+    /*  Transceiver Readback LSSI/HSPI mode */
 >     pHalData->PHYRegDef[RF_PATH_A].rfLSSIReadBack = 
rFPGA0_XA_LSSIReadBack;
 >     pHalData->PHYRegDef[RF_PATH_B].rfLSSIReadBack = 
rFPGA0_XB_LSSIReadBack;
 >     pHalData->PHYRegDef[RF_PATH_A].rfLSSIReadBackPi = 
TransceiverA_HSPI_Readback;
 >

Gentle remainder

Thanks,
Bragathe
