Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3060D139E;
	Fri, 28 Oct 2022 06:37:27 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id v130-20020a1cac88000000b003bcde03bd44so5750087wme.5;
        Thu, 27 Oct 2022 23:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YB6oy9iPyQ2yGCx//M3l9HQNOZr7fMRdXmEHN9vRGxs=;
        b=ezCj8/pgbobEx97CDTJE8wIGRua7WNHJQfvq//ylU1KfxosyT8seGSaf6ThKBvPq9T
         F0YFLmtTHQlSceaoFI4PsTxZC/AJD/7s/ImXMxsTVeZ/xNcTjPSNOO5CY5AKoSwv9dnT
         Syjo8scfL++LpWrAp+KgxGjnda4fdytYDOORZ2GOpkGZSRff06Kd+Yzr5StN59W8MFm/
         DsSH6v4wTsiES4x8/4twyFmgqL7XqMyKufwizOdLt/uga6VvrttVWT+29OerYoVWWrp7
         prZ7wDb8PfwKQdfS64NVEaOjepOnxBS+TTnTG+yJNkX72g/H/5V6O2Vc75GiDKqYR+g7
         Bpow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YB6oy9iPyQ2yGCx//M3l9HQNOZr7fMRdXmEHN9vRGxs=;
        b=IyJDJj2Mjcsw7eQCyslCGS469gi6A9EpssSrxobrqHlqHET1osHq4VA4vnBrasD/Xe
         P+3J/CMtLPsjRIU97qZWnjj4VnBK1zB05RzpFo5IQMgbTA/HVUXTQLhDlAzYmWlc4nX6
         M3O1eo9puURrtxd3t/thjr6zhifmu+aX+JQv1aHhvTT8TFmWI0ctWePWt+jEAwgQfBxx
         MofjtaDyo7acGzirlyI78P95l6lI09LKv4gM8szJUvBJFKdOkNHsntDAHziGntdxpKYb
         46JeqaX2WzFXxEnLNISUQ1/NNTtmK3X2BOGDQ8QqgmbWlk0/wkMYCdlVPe6PJfU4ZGLs
         7E7A==
X-Gm-Message-State: ACrzQf1Tel65n72KmC8IXuUzR/XkrdEWjvN6/ly156pm7/OOy1425Lsl
	e0GItuoyvoYBC5Xy6Bq3/UleTAzzi1ezcBb7
X-Google-Smtp-Source: AMsMyM4M7GKIug3hAEXg65ElbagdSwb96RaEvcC5UiLOrayiTaiYvA03SiL1oDMMDZwG4Oz+tQlvKw==
X-Received: by 2002:a05:600c:46c7:b0:3c6:f3e6:1f13 with SMTP id q7-20020a05600c46c700b003c6f3e61f13mr8231687wmo.62.1666939045369;
        Thu, 27 Oct 2022 23:37:25 -0700 (PDT)
Received: from rdm ([41.75.189.203])
        by smtp.gmail.com with ESMTPSA id 4-20020a05600c26c400b003b31c560a0csm3218041wmv.12.2022.10.27.23.37.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Oct 2022 23:37:25 -0700 (PDT)
Date: Fri, 28 Oct 2022 09:37:11 +0300
From: UMWARI JOVIAL <umwarijovial@gmail.com>
To: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, outreachy@lists.linux.dev
Subject: [PATCH] Remove Unnecessary typecast of c90 int constant
Message-ID: <20221028063711.GA35659@rdm>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

According to Linux kernel coding style.

Reported by checkpatch:
WARNING: Unnecessary typecast of c90 int constant - '(int)2.412e8' could be '2.412e8'
WARNING: Unnecessary typecast of c90 int constant - '(int)2.487e8' could be '2.487e8'

Signed-off-by: UMWARI JOVIAL <umwarijovial@gmail.com>
---
 drivers/staging/rtl8192e/rtllib_softmac_wx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib_softmac_wx.c b/drivers/staging/rtl8192e/rtllib_softmac_wx.c
index fdf867a5dd7a..4fc4fb25d8d6 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac_wx.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac_wx.c
@@ -41,8 +41,8 @@ int rtllib_wx_set_freq(struct rtllib_device *ieee, struct iw_request_info *a,
 
 	/* if setting by freq convert to channel */
 	if (fwrq->e == 1) {
-		if ((fwrq->m >= (int)2.412e8 &&
-		     fwrq->m <= (int)2.487e8)) {
+		if ((fwrq->m >= 2.412e8 &&
+		     fwrq->m <= 2.487e8)) {
 			int f = fwrq->m / 100000;
 			int c = 0;
 
-- 
2.25.1

