Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F34162C85
	for <linux-staging@lists.linux.dev>; Thu,  4 Nov 2021 02:46:42 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id k2so4382863pff.11
        for <linux-staging@lists.linux.dev>; Wed, 03 Nov 2021 19:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=s8xVEJHnK8mxFBkRIjbEvPg/yF4uFDtZoStxlT1zOic=;
        b=Lgs6paIzU01mGAH7RPWiMaEk8o0nn/ApZouOO4ovvj6fEove/OM4Yn8ns5Pf+tFcIH
         MR58i2GiLwVrmUcfPFvUgnmasMkdWP673eswFO2OLesDVc+7Utu5SU7YoZNl0n9k1zvU
         o9jk8n4aIYm8AzP1FJxzIb3nZ10v6eKGtta+eKtwj1TwkhavgRYy93wG4xzXPjrNCqP8
         MNvFmEHTCtJJGGimFxJJH/O0XSXFbSIJ2E3wnSXrpm1D3QCMvYCo1T/W1ndaI35AjGrX
         LUV9kqj3wC68ep+rAjUwiZ2NRkbrYMCs1/89jHbiEpNUERDfcWbbSHvFzidvTQzR6ZBL
         imaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=s8xVEJHnK8mxFBkRIjbEvPg/yF4uFDtZoStxlT1zOic=;
        b=PiXAfA/ge1ttj4OK3MhgoFnA6nanNwgfxYZ/vMmDjtXQLSFZcvCs4PEcvjgq2fDjm6
         1WEdmH2sO1bMbBLE1ipZkdhVsxbMJQ1Q2t7E1midXPGHVFbqqAmKa6PeOUUr4KKFFmMy
         8N6MKjDFqU5EU/pTvO/82xJYwma7Rs0KNLhl7ePm6KuFyCRTvbUB44x9r+Cx0FCCMJkl
         zi7AfE16IxCVeMacCnQ9gCQ4JDRMRKrMwbkbgS73hMFU809wMRvE/S2RFm/IVjx9Ik57
         p+Fml/S9hN4tCrMv/FKQ19QYhE/fgL8EoIb6+Y8Y5B8AlREKjNOqGsAsDG5K0cyQTXlB
         QpXA==
X-Gm-Message-State: AOAM533ajGOwL5HOaARmBgdK6LTxYEv1JMEsqL5PObqXftNXAUglllw+
	CH5nmmcZ4uOEUp+yWlCcZw8=
X-Google-Smtp-Source: ABdhPJyafy5NH56iOO7yoAI0vwhQrlL9iKtGWTPBBoNlVkrQWjWh1aycOnBLuNGt3QkzgBnKspDLSg==
X-Received: by 2002:a65:684c:: with SMTP id q12mr2299545pgt.125.1635994002350;
        Wed, 03 Nov 2021 19:46:42 -0700 (PDT)
Received: from Sauravs-MacBook-Air.local ([59.95.84.218])
        by smtp.gmail.com with ESMTPSA id w13sm2888687pgm.3.2021.11.03.19.46.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Nov 2021 19:46:42 -0700 (PDT)
Date: Thu, 4 Nov 2021 08:16:35 +0530
From: Saurav Girepunje <saurav.girepunje@gmail.com>
To: Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
	gregkh@linuxfoundation.org, fmdefrancesco@gmail.com,
	saurav.girepunje@gmail.com, straube.linux@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: saurav.girepunje@hotmail.com
Subject: [PATCH] staging: r8188eu: core: remove the function __nat25_timeout
Message-ID: <YYNJPCQ5hX8BTzwy@Sauravs-MacBook-Air.local>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Remove the function __nat25_timeout from rtw_br_ext.c file. This function
can be replace by single statement jiffies - NAT25_AGEING_TIME*HZ.

Signed-off-by: Saurav Girepunje <saurav.girepunje@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_br_ext.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_br_ext.c b/drivers/staging/r8188eu/core/rtw_br_ext.c
index bcd0f9dd64b1..4951f835feaf 100644
--- a/drivers/staging/r8188eu/core/rtw_br_ext.c
+++ b/drivers/staging/r8188eu/core/rtw_br_ext.c
@@ -105,19 +105,10 @@ static int skb_pull_and_merge(struct sk_buff *skb, unsigned char *src, int len)
 	return 0;
 }

-static unsigned long __nat25_timeout(struct adapter *priv)
-{
-	unsigned long timeout;
-
-	timeout = jiffies - NAT25_AGEING_TIME*HZ;
-
-	return timeout;
-}
-
 static int  __nat25_has_expired(struct adapter *priv,
 				struct nat25_network_db_entry *fdb)
 {
-	if (time_before_eq(fdb->ageing_timer, __nat25_timeout(priv)))
+	if (time_before_eq(fdb->ageing_timer, jiffies - NAT25_AGEING_TIME * HZ))
 		return 1;

 	return 0;
--
2.33.0

