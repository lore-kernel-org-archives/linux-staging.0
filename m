Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D26D268
	for <linux-staging@lists.linux.dev>; Mon,  8 Nov 2021 04:11:33 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id o14so14936216plg.5
        for <linux-staging@lists.linux.dev>; Sun, 07 Nov 2021 20:11:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=+r5v0Qkb9CskeIUp24NWApH4et+2cF4LENwGR9mkgPI=;
        b=ksG9H0mH9ezpfVFJemUARGntpLmJtB5sxcqfrOAB/mZdHKhslGOm+2IuFcHiDsOECb
         EYJ+OKS+sZX/WgZpFpz25MEQ/2OIZJw7yeFTy+cDwhN7o3Tq/iEx0QYIeAtQH1D8IIOB
         IbbIsDVMOANo9VjiHIxLJe9XsstPt1CeZrirXXbygFhIEva4C+JNDVwfh0N6WlwnO4Pw
         pgsxH0RNYxGDn2mCwKAzBi6IZJAOl7fiAbN8vDxi9zuLe8ZhKPmVrnsrh1bmu+WP0lYc
         7VnB+IThKaCJJ/Goz4R0rlPd70PAF3UXzaxD/NsMFSJWLb28zPv6I/tNaLE1dz8KKpUP
         8YlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=+r5v0Qkb9CskeIUp24NWApH4et+2cF4LENwGR9mkgPI=;
        b=MOXwk1LvgirQVonaCzc85E0zVmSxc+CrW7DyqBxTbUgbjd3RYCiSm9cPt5+VWV+7gs
         BpUe9jqVl3cqf4lAsdnOH1NPdC3GAj1vPPncvqLLnR9bpzfijidi1VEj5ydw8ZAcNTt9
         J6UZU/KABN4yFh7LI5GNfBTyu47cvKp5DfjMlWQo9SBVODmYYKxJ2118xww6436QJPH1
         2xt1wItgywP4DOXksnrTB3ujx/WSwaq6YBamqs8AazdM6bIbAwKX4YRZFDgZO/k69bdU
         Bdb1iRn6muUnoqmc6JixrXHWjgz8oHEoe7CgKLKrwpyNcYN+LmrqXN44QeRH8VjJ9AMA
         knOA==
X-Gm-Message-State: AOAM530LylHKxG6Wz8435BrLjcY08Dh9ngPg/8VpTsgb8nWXZhm62TQo
	NVEyZ9gICP+yD7tKXv2Gyik=
X-Google-Smtp-Source: ABdhPJz53C1GxcDNgZIQ7AHrcxpnC9yV4l2D8vHmUQak4AX6drOI3HDoe3B/rpg3QyRbNSkIcxCXlA==
X-Received: by 2002:a17:90a:eb03:: with SMTP id j3mr48831736pjz.149.1636344693335;
        Sun, 07 Nov 2021 20:11:33 -0800 (PST)
Received: from Sauravs-MacBook-Air.local ([59.88.109.27])
        by smtp.gmail.com with ESMTPSA id k1sm5684400pfu.31.2021.11.07.20.11.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Nov 2021 20:11:32 -0800 (PST)
Date: Mon, 8 Nov 2021 09:41:22 +0530
From: Saurav Girepunje <saurav.girepunje@gmail.com>
To: gregkh@linuxfoundation.org, kuba@kernel.org, lee.jones@linaro.org,
	saurav.girepunje@gmail.com, nathan@kernel.org, clrrm@isep.ipp.pt,
	johan@kernel.org, dinghao.liu@zju.edu.cn,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: saurav.girepunje@hotmail.com
Subject: [PATCH] staging: rtl8192u: remove the if condition without effect
Message-ID: <YYijapuGOmObwM3S@Sauravs-MacBook-Air.local>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In function rtl8192_adapter_start priv->pFirmware->firmware_status
is assign to FW_STATUS_0_INIT just after assignment variable is
again get check for same value. Therefore if condition will be
always be true. So remove the if condition ,else if section and
else section which will never get execute.

Signed-off-by: Saurav Girepunje <saurav.girepunje@gmail.com>
---
 drivers/staging/rtl8192u/r8192U_core.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/staging/rtl8192u/r8192U_core.c b/drivers/staging/rtl8192u/r8192U_core.c
index 726d7ad9408b..f5d9e81f4ac7 100644
--- a/drivers/staging/rtl8192u/r8192U_core.c
+++ b/drivers/staging/rtl8192u/r8192U_core.c
@@ -2666,14 +2666,7 @@ static bool rtl8192_adapter_start(struct net_device *dev)
 	/* config CPUReset Register */
 	/* Firmware Reset or not? */
 	read_nic_dword(dev, CPU_GEN, &dwRegRead);
-	if (priv->pFirmware->firmware_status == FW_STATUS_0_INIT)
-		dwRegRead |= CPU_GEN_SYSTEM_RESET; /* do nothing here? */
-	else if (priv->pFirmware->firmware_status == FW_STATUS_5_READY)
-		dwRegRead |= CPU_GEN_FIRMWARE_RESET;
-	else
-		RT_TRACE(COMP_ERR,
-			 "ERROR in %s(): undefined firmware state(%d)\n",
-			 __func__,   priv->pFirmware->firmware_status);
+	dwRegRead |= CPU_GEN_SYSTEM_RESET; /* do nothing here? */

 	write_nic_dword(dev, CPU_GEN, dwRegRead);
 	/* config BB. */
--
2.33.0

