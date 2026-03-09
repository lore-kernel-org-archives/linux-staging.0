Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7D2C33436A
	for <linux-staging@lists.linux.dev>; Mon,  9 Mar 2026 23:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773099116; cv=none; b=ew+nFYm459zNQR2hoaepg4nSuDtsL00rE+/Qvz95XhMbSvk9LjRuBtZtmhjutj8/ybNzItEZtUY+Q7eZIAm9/8PfgvrRn/G5iEI4ZN7ne0q9rku/3MxUcAAELnl/9wVtXssSYIzPbOsC1R2lXgJZuAVl6WB59B7Z1C918SoqBdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773099116; c=relaxed/simple;
	bh=HWD/8sTKShNrFjFF/sHM17yPqUj9gZcfL/XVer4Xy+8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gWVnlYbtrva6XQiAzU/jpGpevOwTn3P4fXXRS3uyHSvEmy6oKYYjbiEmR6ZbKEMX20o3GxgslhGqdcVdXh0vI+E1iqeThVpvs90BgjJh5of2hKKlJssJSVCYj7TMpVnr9DNJ94wku88nrMAyvfmZ95I1gBcQas4WJpNVP05ZZh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ataLnd/5; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ataLnd/5"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4852b81c73aso23582115e9.3
        for <linux-staging@lists.linux.dev>; Mon, 09 Mar 2026 16:31:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773099114; x=1773703914; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Pj8lFQzphkNhufeZdkQn8Epq8hgNrygsCbrbBWJlFR8=;
        b=ataLnd/5RVcyPo36JllYCwRNDrHHtgYEnKGwyPDwUFdQ2mEJtD3pvhmqTgAqA8bnhQ
         Gds1ZGqCmp5Ls9sqpfy7wxNmVn0UzTeKFrw51m+RQzoVsR9jL97hneWE6tygTI+mgFGa
         2enOHcQiH9NT8G86ThoIiWjc0TaL/2eUaWcY5pOuT7Lr1xgCLJnI7QeJIny6KYoUAZHS
         PO3a/jnHwMtrROBM8/SqixPTyaFcJ/0BYYWQ52ZAD/BrCQ+gAAXdTqdNx2Qg58zYb/9y
         VA9Uc2mLRLvKyCTBBJiZ+PkwCfN2QVoYyVprHJpnv1Vd+RS57lmuPR2hvslwWVGBlpLO
         rmKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773099114; x=1773703914;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pj8lFQzphkNhufeZdkQn8Epq8hgNrygsCbrbBWJlFR8=;
        b=gHLreszaOGDUxr2oa+jy0sDkBRHy6cV42TqrYcad5A97sXEM1cxND1Y/ibK9+TUXOC
         OOGWkXJ2JfWA3bLi+8rfjzQqRKkyGrB7tJFac2L9jT/Ao+mpv7gAA1acijIfGUu+sLVo
         W+Xq7lMeLI10ZGHmbD2wGRbE2Usg4k3IXsvLcOGLcJjm2IsuvmpA/I8rHsuNb+1i2ykp
         QhJU9ka+jvHBkHdPMq72+NGgsA8n2BZjp5vhqsp3325BzbHfcM6L8PJQ2sRfUJZHyHkz
         EBHH5LAU5vJeg+HvIPbynNDU5hRsoKzbV2DzutlOOx7KVNzj0XubQ5PqeT9zKMTd5FJM
         R4zg==
X-Forwarded-Encrypted: i=1; AJvYcCXcgBUvLhDNKow7/m3Ft5If8kjEj91IwBjoDYBv9HueOBWi6wfIXfHnWJdjiTWi8vFnmDVj+EqOAmHEQ5Qc@lists.linux.dev
X-Gm-Message-State: AOJu0Yy8K9fmhOqEBVk/7sbRRTysgpLhMNb729uTk/MYZD5OGu3WG0LT
	tQH3l0/isVoUtwFjdJAq3L6YxxPm3qT+fBp5v8WWEObuymPXQRi+lqFt
X-Gm-Gg: ATEYQzz4nkXLSiE9aG/UPytM6Tfidh+2butI8hjc72c+/X1rdcbY3A6CxSdHAmWPrF4
	HbdiDr9qm1EkXwS+qHqRwsW3ldETfX/zg/g+6V6i2n/u4EbDHZkhHyY2H0AQLJG4zTVDuCva/k2
	mRYE1u+n02Q7fYDMIgKXtDwpvE6Y45PqrowCf9PWk9hVcr/baFzOyu8C1k1ZXacKl937kRqUQZB
	x+z3PUTvPyf0AOZTHO9DMjKB7WMgSJW+yTNmBFvn3hO05fqfAOX86RRRAxVfckFa5kqkJy/1LO+
	PwbYzrhI8k8xlfXplepQpzj/EBYOBtwfNn1nXKZ/LrEG8uuyObbVVCQ2eThRpc2wAkZRlBySyEr
	oqJ4yloKFLSiwAcHx7GfIpoC3TN0tcFSOd0rqL01DlpJFjgvAT1ew9fegOVyxai+zYH8dDVdNfy
	Wgvld1PQpqWIe847epuVMS1oNXSY/xnEm7r2GqOA==
X-Received: by 2002:a05:600c:470d:b0:485:389b:ee5f with SMTP id 5b1f17b1804b1-485389bf08bmr105511615e9.2.1773099113688;
        Mon, 09 Mar 2026 16:31:53 -0700 (PDT)
Received: from MSI.vodafone.ultrahub ([83.106.9.93])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485237dd017sm101862535e9.2.2026.03.09.16.31.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 16:31:53 -0700 (PDT)
From: Ayan Mahmood <ayanmahmood249@gmail.com>
To: gregkh@linuxfoundation.org
Cc: ethantidmore06@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ayan Mahmood <ayanmahmood249@gmail.com>
Subject: [PATCH v3] staging: rtl8723bs: fix line length in rtw_pwrctrl.c
Date: Mon,  9 Mar 2026 23:31:35 +0000
Message-ID: <20260309233135.10964-1-ayanmahmood249@gmail.com>
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
v3:
 - Move closing ) { to end of the line instead of the next line as suggested by Ethan Tidmore
v2:
 - Rebase on staging-testing branch as requested


 drivers/staging/rtl8723bs/core/rtw_pwrctrl.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
index 666e241704d9..1aea9ba4f35a 100644
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
 
@@ -359,9 +360,9 @@ void rtw_set_ps_mode(struct adapter *padapter, u8 ps_mode, u8 smart_ps, u8 bcn_a
 			hal_btcoex_LpsNotify(padapter, ps_mode);
 		}
 	} else {
-		if ((PS_RDY_CHECK(padapter) && check_fwstate(&padapter->mlmepriv, WIFI_ASOC_STATE)) ||
-		    ((hal_btcoex_IsBtControlLps(padapter)) && (hal_btcoex_IsLpsOn(padapter)))
-			) {
+		if ((PS_RDY_CHECK(padapter) &&
+		     check_fwstate(&padapter->mlmepriv, WIFI_ASOC_STATE)) ||
+		    ((hal_btcoex_IsBtControlLps(padapter)) && (hal_btcoex_IsLpsOn(padapter)))) {
 			u8 pslv;
 
 			hal_btcoex_LpsNotify(padapter, ps_mode);
@@ -452,7 +453,8 @@ void LPS_Enter(struct adapter *padapter, const char *msg)
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

