Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A14DB68
	for <linux-staging@lists.linux.dev>; Sun, 31 Oct 2021 18:35:57 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id t21so10165701plr.6
        for <linux-staging@lists.linux.dev>; Sun, 31 Oct 2021 11:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=FqJ1bvNTk5XEClTe8nnRDg3TVpytraonloSvcp2T6IA=;
        b=eaxZwSdkRuRpn4adOVGygVJzWpGamHn4/HCmwlK8u1El8RbIy7ZnRezkMuubWBPpcz
         akpkE4asMZXM6NFrHA0QAzGB57nD61w5rcZhDj0S+OBFUDF/9wNSweSMSwwIxr4k+gd8
         f3ZTLPHLggPBPIyyUjnqFsnc6xTYAB22Na+ElJ1Rt4aHge/Exe9uVVqpbAD7h2xoJ1GA
         nCnhNGoPHEZnZKjrQVstKVKX/lFtc+/UzC5Xs+MUjO7U1nJ88KCEpO83hVZ3F8VT27v1
         rbCAQ4pumocJeo9SrIMD8y7exFiYCnw8aRNqDOJFVtXPtdJYMt5Tan+bHBpFS62mMOYh
         2QaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=FqJ1bvNTk5XEClTe8nnRDg3TVpytraonloSvcp2T6IA=;
        b=NgGmT7q0T5PbYnwQpMh2BVtf/4oo4nuftUpBThlndem0dVjS6iXGIMt6oqTVvrrvfD
         cGevmyZ5EKbgHev3HGK3dVvTqQMiINjFkjXfCGM7KurySuppFPHUcvFWs3bDRuiBZoSh
         yQ/M4UJVZ2Z/qnP9VmNy7UCzVC5EbqtiyYvD5A/+tPD9SFi2Im4lSg1SgseN97nXwpuM
         mUvwKJCCdfcicY+C0FPsPiYA5HesKGZ/9GLW1/GZpvg+qDoPPxSbk5wHq6RLou997V4w
         X6QrVK6PnZTgSgy+zZISyX9YyCjY168eHLnUoBuqMtY0ouLhJArJOV96kWlEUSqVivpt
         727Q==
X-Gm-Message-State: AOAM530YdjyNtkqD3cPw6bSAeP61RnfwtBIfcjjKxWb941eRDec/wJP/
	3r+vYfFDsoUmKx4RsXtF56c=
X-Google-Smtp-Source: ABdhPJz0oWDcvGvA5XmoLJmdkm15GEd5oPPdgXt4+y6Gj2HMPJpApIV2RAKhHOC71bfTanNaoITMag==
X-Received: by 2002:a17:90b:4b06:: with SMTP id lx6mr32683665pjb.220.1635705357040;
        Sun, 31 Oct 2021 11:35:57 -0700 (PDT)
Received: from Sauravs-MacBook-Air.local ([59.95.84.6])
        by smtp.gmail.com with ESMTPSA id mg12sm391506pjb.10.2021.10.31.11.35.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Oct 2021 11:35:56 -0700 (PDT)
Date: Mon, 1 Nov 2021 00:05:50 +0530
From: Saurav Girepunje <saurav.girepunje@gmail.com>
To: Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
	gregkh@linuxfoundation.org, straube.linux@gmail.com,
	martin@kaiser.cx, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: saurav.girepunje@hotmail.com
Subject: [PATCH] staging: r8188eu: hal: else is not useful after a return
Message-ID: <YX7iBmKKNZfj8Gca@Sauravs-MacBook-Air.local>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In the function rtl8188eu_hal_init() else after the return statement
of the if section is not useful. As if condition is true function will
return from if section, On the other case if condition is false
function will not return and statement after the if section will
execute, So there is no need to have else in this case. Remove the
else after a return statement of the if section.

Signed-off-by: Saurav Girepunje <saurav.girepunje@gmail.com>
---
 drivers/staging/r8188eu/hal/usb_halinit.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/usb_halinit.c b/drivers/staging/r8188eu/hal/usb_halinit.c
index 94a2b3e32fe7..bea5d147b2a1 100644
--- a/drivers/staging/r8188eu/hal/usb_halinit.c
+++ b/drivers/staging/r8188eu/hal/usb_halinit.c
@@ -687,10 +687,11 @@ u32 rtl8188eu_hal_init(struct adapter *Adapter)
 		Adapter->bFWReady = false;
 		haldata->fw_ractrl = false;
 		return status;
-	} else {
-		Adapter->bFWReady = true;
-		haldata->fw_ractrl = false;
 	}
+
+	Adapter->bFWReady = true;
+	haldata->fw_ractrl = false;
+
 	rtl8188e_InitializeFirmwareVars(Adapter);

 	HAL_INIT_PROFILE_TAG(HAL_INIT_STAGES_MAC);
--
2.33.0

