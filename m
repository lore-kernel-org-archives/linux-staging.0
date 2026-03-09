Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 340C026AA91
	for <linux-staging@lists.linux.dev>; Mon,  9 Mar 2026 20:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773087688; cv=none; b=HCY6sZo7fDnFVjMk+dGxj8i/Y30ulIVkpBC3T7ZkgnktE3ALa+UNFceo+VZSisgm3iO3q1uutOThvGtC32pjB34Yeo3MdF8N7m9hrqyZyHa8nc4E8MkugJsJNHOaZA2LirgKfXWZOy6b86wm76whqqkMAyZop2hnMNXPlaPITAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773087688; c=relaxed/simple;
	bh=1DgTY7I7ENMFAivcY5/F4jpfv/tFvskb+H35fCp8kco=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=m/N90GJv2nRjJ+Llyn/ePTvvZpa3NSlNb5W0aXJD+3l4E4cpXGbanHMIC7rmDnV63lnlnrHf1CibYXqS7rhX8QtXZWMeTTLXcIMOcyL6zbfrWa8uAav6wH05IC/ENX4IgBlAjtoHwo4JSlwp3kpg3pkb7x1LGSVyGEfvoxRIG8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S4o7Jw6m; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S4o7Jw6m"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4853aec185aso13013985e9.1
        for <linux-staging@lists.linux.dev>; Mon, 09 Mar 2026 13:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773087685; x=1773692485; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=phty4xm/zpnkkdBbgp3JWEAJG7kFxrAMmPHymiUH2Lk=;
        b=S4o7Jw6m4lKMPakXg5LDb20zltmd1cEGwgU4WkFot6i7ZQQzMmOLnFWCx8BbsPWWzA
         5zNAxXfyFDQHloEXw28Io5FCkRalbaOlJtAcUjEQMtjFN2U1lxutoFPjbowiAY0MVigx
         syQwS0WerY7DjrH/RFS1ZCAh/cVvZtG3IpgjxqE4sN2eyysU5kup7mRsSsxYOwrDpwNX
         ouOs/gACifqBQyy/rhuokmB4xiaN+dBCYuqHU0m8lxjdKL97edsobLJOeJMYZwdn6wyp
         9G5pM0hqamLXIRnEhQg1jFTmMGDa/kctTblwIJF1k5zm87i8USEoyO9zd6sRzYr+3Kt3
         3K9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773087685; x=1773692485;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=phty4xm/zpnkkdBbgp3JWEAJG7kFxrAMmPHymiUH2Lk=;
        b=bqXXwMXeX91aIBj3QAxshgpDlZp+A6eMXNXDOQDyIOzhrxtFO5gPhE4jbM4fSq73Ax
         sZLzVmszXO0kGPbSCm8cKfpC6RBOrNH6kpHmAumx9CMI5LF/2sePyb8RoinZo73ih3oQ
         5VFy47+Qo0oI03YqJBeAmFJDaGdbGmDvQFncwWnEHG+hts9IbWt8GZaaob7Th6UqeUiS
         mcP6JE27WRf1phNaCMS9+LPaq1VldcLSKgpCZ8UI6Zjw8iFMLWtTFb/6aR13F3gfZjYE
         0zQ0bIu08v39DJ8miP5OV1zNVV9K0RCdjzzgy/YjlIx009HpUVu6V1u+RfH6Ni+OTZsG
         KFYw==
X-Forwarded-Encrypted: i=1; AJvYcCVwvPYxJn1dda2xypwZWLL7Wgc7OieN165sYrFuI0lqXiIpOTCUMkV73tYasTeZ0d3ZIRFuVizvB1l/p+Uq@lists.linux.dev
X-Gm-Message-State: AOJu0Yw8mgegX8ifGPUklGX0ZIQbSqrFk/YVTxFNOOIYXX71y9ArevLa
	S7aZCrm8e0gMGT8k6JuuOgelUjYNr1QBlOmfN7E+Q73RBenBVh06ibUUzJ2+Wh69
X-Gm-Gg: ATEYQzynZGHdm5QOSk/tp/oXvOxy8UKOH1pPNcgUAZ2iJEk10xPbaDGjeDfc2oKsqY0
	7YrcDtQoyyt9nfy/rFTqPOvHPPMrsilYWtAI700a9K/BweM1UJ6GLbTpMzxKiXlxjirPYW65q3i
	AzCTrgnFeB2JSCWdS0/hrymzBuFaOsZsuDPacGDS2n3qvETaNo66haSk2r5yzOqrjXilhT0dXJr
	qnKZVjzBjA8ImYxyUnY/kDoBOrMnmSKIgV6MO2r+FnOVvAqi/p2GL/Ij86bjyr2cF1JJ+rsaGFc
	WNdEsz+P0jsz/tMxVpQTs8c6nirHlhN2ptWOZdi3Ryr2CQyBO5mXLu4EXdZ3GOAsWJhlKg7Uwbl
	3KtgPWk/65tYBkgjLKaj/QJCBeoIDuPW9o6f4+YPSrpHCG7Bifx9DW37+230yM2m7bAZvgz9k08
	QOltuLwHStjSPH3h7TdpzeAFQWJ2fALt8+DmWU+w==
X-Received: by 2002:a05:600c:154f:b0:485:4135:5c92 with SMTP id 5b1f17b1804b1-48541355cdcmr23898075e9.0.1773087685391;
        Mon, 09 Mar 2026 13:21:25 -0700 (PDT)
Received: from MSI.vodafone.ultrahub ([83.106.9.93])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dae2ba06sm31217364f8f.24.2026.03.09.13.21.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 13:21:24 -0700 (PDT)
From: Ayan Mahmood <ayanmahmood249@gmail.com>
To: gregkh@linuxfoundation.org
Cc: ethantidmore06@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ayan Mahmood <ayanmahmood249@gmail.com>
Subject: [PATCH v2] staging: rtl8723bs: fix line length in rtw_pwrctrl.c
Date: Mon,  9 Mar 2026 20:21:18 +0000
Message-ID: <20260309202118.10589-1-ayanmahmood249@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refactor lines exceeding 100 characters in rtw_pwrctrl.c to
comply with kernel coding style as noted in the driver TODO.

Signed-off-by: Ayan Mahmood <ayanmahmood249@gmail.com>
---
v2:
 - Rebase on staging-testing branch as requested

 drivers/staging/rtl8723bs/core/rtw_pwrctrl.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
index 666e241704d9..568b4301b7cb 100644
--- a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
+++ b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
@@ -331,7 +331,8 @@ static u8 PS_RDY_CHECK(struct adapter *padapter)
 	return true;
 }
 
-void rtw_set_ps_mode(struct adapter *padapter, u8 ps_mode, u8 smart_ps, u8 bcn_ant_mode, const char *msg)
+void rtw_set_ps_mode(struct adapter *padapter, u8 ps_mode,
+		     u8 smart_ps, u8 bcn_ant_mode, const char *msg)
 {
 	struct pwrctrl_priv *pwrpriv = adapter_to_pwrctl(padapter);
 
@@ -359,7 +360,8 @@ void rtw_set_ps_mode(struct adapter *padapter, u8 ps_mode, u8 smart_ps, u8 bcn_a
 			hal_btcoex_LpsNotify(padapter, ps_mode);
 		}
 	} else {
-		if ((PS_RDY_CHECK(padapter) && check_fwstate(&padapter->mlmepriv, WIFI_ASOC_STATE)) ||
+		if ((PS_RDY_CHECK(padapter) &&
+		     check_fwstate(&padapter->mlmepriv, WIFI_ASOC_STATE)) ||
 		    ((hal_btcoex_IsBtControlLps(padapter)) && (hal_btcoex_IsLpsOn(padapter)))
 			) {
 			u8 pslv;
@@ -452,7 +454,8 @@ void LPS_Enter(struct adapter *padapter, const char *msg)
 			if (pwrpriv->pwr_mode == PS_MODE_ACTIVE) {
 				scnprintf(buf, sizeof(buf), "WIFI-%s", msg);
 				pwrpriv->bpower_saving = true;
-				rtw_set_ps_mode(padapter, pwrpriv->power_mgnt, padapter->registrypriv.smart_ps, 0, buf);
+				rtw_set_ps_mode(padapter, pwrpriv->power_mgnt,
+						padapter->registrypriv.smart_ps, 0, buf);
 			}
 		} else
 			pwrpriv->LpsIdleCount++;
-- 
2.43.0

