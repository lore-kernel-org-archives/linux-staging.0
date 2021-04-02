Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFA036D09
	for <linux-staging@lists.linux.dev>; Fri,  2 Apr 2021 17:31:00 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id x16so5300178wrn.4
        for <linux-staging@lists.linux.dev>; Fri, 02 Apr 2021 10:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=D4NOQ40eCPg8Q1I8p5bQHujhK6KmyMiT4frAX1MUQD8=;
        b=HZN/9/DZYsG6zjpWQCoPqvBmoZ4KmMdeGa8DFpBMAGiwKf3TpAJW12Ejftnrks3Tvg
         NriT2pw+Mr56vsDj7/joHpQ+M7ye4S73x3B0+J4mfhB7P5u8wkVDqKwwqsXI7NvlLpaL
         ifxKAxI6eoOk7QQDmwGvhHAs5uxnrL4I2e0BcI3aCJbCKsvhtB0ZO35iZL9Zq5ZTDIAZ
         6eCQfLzQ9fKAvP2uBUDeGqUV8+MqiHGHViDJb3PcIrbRz8Tyk5JHPoFKmZssMJsjlUfv
         uVRhKhFD/tgyEfrahh8CPZ46mej4jD6miMtrMgD8ocw910dqHKyKa/vqplpHNhXE8FF9
         4Fog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=D4NOQ40eCPg8Q1I8p5bQHujhK6KmyMiT4frAX1MUQD8=;
        b=CNrCUgEpjYLFTtsiWSDoFE7JmwCIWkv9wve8zxTFDFzpyTTGX+gBagMK7yhnefmLFx
         /TDwO1H+bu8Cimwo4pcW3t4AjSj4wAfeEW5edunlp9zGKiKh1Oua2tA7g14RrChF19HV
         Mx4h7Qz78FXkH6QHEsQMKyMDZANGsBf8BwdPZo18vU+CoMUuhhyA8qNnNw+CY8S6PFj0
         5CCsHYH/+fGCT/pc2q2dKYIvRU9nePEal6GEORYddDOyfl4pYT6BkYBH0slhGTjYTQjZ
         m/TtYGLH5ATNMRIcAJeZoex3ccZeo3/fO5OGdbnpZbzg9+y4QAo+JAFYI20AOjVSBfl7
         GxVQ==
X-Gm-Message-State: AOAM530ldKUslEdzDLgds0jaU5uFVlhQZUfAZBUq6xVfdOQv0iPps8BB
	8QytsDH0UYV5Xjf5UTBqpU4=
X-Google-Smtp-Source: ABdhPJyHBteSMSS1GvLMoC6NMmXrYImukKgkkVPK4nB0tfGzSEqODUKQcj6Uuf/dohSelfvk7kRH4w==
X-Received: by 2002:adf:8b5b:: with SMTP id v27mr16264402wra.153.1617384659544;
        Fri, 02 Apr 2021 10:30:59 -0700 (PDT)
Received: from agape ([5.171.81.4])
        by smtp.gmail.com with ESMTPSA id h8sm15260375wrt.94.2021.04.02.10.30.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Apr 2021 10:30:59 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@oracle.com,
	joe@perches.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH v2 26/30] staging: rtl8723bs: place constant on the right side of the test
Date: Fri,  2 Apr 2021 19:30:08 +0200
Message-Id: <39a8bed986ba0e6ff1968d5c77214e627323af36.1617384172.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1617384172.git.fabioaiuto83@gmail.com>
References: <cover.1617384172.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fix posst-commit checkpatch issues:

WARNING: Comparisons should place the constant on the right
side of the test
40: FILE: drivers/staging/rtl8723bs/core/rtw_ioctl_set.c:71:
+			if (_SUCCESS != ret)

WARNING: Comparisons should place the constant on the right
side of the test
69: FILE: drivers/staging/rtl8723bs/core/rtw_ioctl_set.c:122:
+					if (_SUCCESS != ret)

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_ioctl_set.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c b/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
index d4920d7d2452..f8c7dcb7ab7d 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
@@ -68,7 +68,7 @@ u8 rtw_do_join(struct adapter *padapter)
 		) {
 			/*  submit site_survey_cmd */
 			ret = rtw_sitesurvey_cmd(padapter, &pmlmepriv->assoc_ssid, 1, NULL, 0);
-			if (_SUCCESS != ret)
+			if (ret != _SUCCESS)
 				pmlmepriv->to_join = false;
 
 		} else {
@@ -119,7 +119,7 @@ u8 rtw_do_join(struct adapter *padapter)
 				) {
 					/* DBG_871X("rtw_do_join() when   no desired bss in scanning queue\n"); */
 					ret = rtw_sitesurvey_cmd(padapter, &pmlmepriv->assoc_ssid, 1, NULL, 0);
-					if (_SUCCESS != ret)
+					if (ret != _SUCCESS)
 						pmlmepriv->to_join = false;
 
 				} else {
-- 
2.20.1

