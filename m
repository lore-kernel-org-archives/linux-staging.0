Received: from mail-lr2-f35.google.com (mail-lr2-f35.google.com [74.125.230.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10ABB40DB43
	for <linux-staging@lists.linux.dev>; Sat, 26 Sep 2026 12:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790427133; cv=none; b=acCF/h9RNloTCl3Hvenim+jpF7qFyxhb3GbAd+X9JKKv8HwBUbBDX7ImQmInw+8AyEM+GKvKdWc7Ud+Pz6QaI8eifrRZCoV4WvVHNVT8RzQfKz7hIAaUK0QMhwgzZ2EHA5SejRMotYyWOrdAe0Z6b2MU4tpqEO/PMSzHsI8+c0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790427133; c=relaxed/simple;
	bh=eTZ5DuYzgMC3w2K2nFxa/0/HtaOZqMC32yW/8AXoJMo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bx6DXgGuOlrV4bS66BfjGkEGw+xvN+lLIsESAnvfsny+ud5mbI1JpcM0AioqeP/3MNAKwTiuZGoxVcKapTE0WeSgsAt1WdwCzu5nwdPj2yVOj5CgMd8ovEm2lOyQ0d4JYJVEZ2XLU+O9huoH39ahHbi/3WDngfJCjdqMInmWUZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nf60wPTL; arc=none smtp.client-ip=74.125.230.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nf60wPTL"
Received: by mail-lr2-f35.google.com with SMTP id 38308e7fff4ca-3a658b1f7b7so7698011fa.1
        for <linux-staging@lists.linux.dev>; Sat, 26 Sep 2026 05:52:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790427128; x=1791031928; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tv2uFM2roW3vT6//4Rn+XK2lNgMX3NDBuOtw2y4SaN4=;
        b=nf60wPTLrzfjPZeNuIbXWqKw6ppas6OZ5xRJtNhLkVFK6aboLcQaFAaJ7ZOt4Znduk
         uNQzovjKBuve6oRYdBTaVThrOlhxF0jd7DutaYewcXuYCv1NabuR0sGEvjcEoGorLNnT
         M8x8lCBOzzH93r8S/b8oYatvuzEEt8NDQaoqoxrhjYaIM5X5dvvAPQ2a1Hmd6+tXWYSE
         5SMFL778zhLx9jNds2Cm1aDzwUJaP2uHyF2yqEE+H34XKL6Ixj4gp0sDR/wYoKsXJ5Da
         ZiahNOby/8u+N/3bnXktx6iCWAtQJNylVycnf+214/AgPeAmD9JdeksYvOmjeKEai0TZ
         J/AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790427128; x=1791031928;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tv2uFM2roW3vT6//4Rn+XK2lNgMX3NDBuOtw2y4SaN4=;
        b=ieejfJNHACbrQ1YbXi2oIp83/5gfwppLW8t3x13pvTp/K7Xr1gk52WREitXM0O5JqU
         t0lIMKhmpquy02oKZoVpVxk8T7aU2zOINx2vmoNOnj9IdjeoMTdhDoy0+STfmeR0CMXE
         pudJKEwGPL1RJz14NC4Uz0sik9kQpG0HJDIuSVJ8fwK8uKOV5Il2rrsqaGVsCQ6/oXD3
         qujsEB6ubi3HLi3597S8vjqLX/eKyqXFLJot6x2DZzlYYB5F2DMqO+95AJENfLkqDUtm
         HxaE7NOfm0nJDG0GFfupWs8v2tJvcihoOMB8SRDBfWU0pWg/osCY9gi5isWWmblyhT83
         ul/Q==
X-Gm-Message-State: AFuF++mQxNhZ1hUpdQYEhyFj7kxv1RyPTYYbzKuzVbiw3iIOy3Tl7F+c
	qDGFrSGPKGXDXJ9qJ0v4N1sl6joci5ermGYHyyNp0nj/HBA2QDl8zdzk
X-Gm-Gg: AYBFou0bGGIOy3Ij0T/6z3v6pWpuuoND8TfH4VoC1v/AILEkkxsHdwGRsi/BxiZ742U
	f3dVYxFHzhPEdXr1cyo8+0mTg9S0f3Txa8MoDf0aYgVTmBjzZh1qya/fTEEaDD2dyDVCmscsFVO
	b2SKsBkasFeFwrtADpPs/y9el/5NaP3W21yrU9Nu9KCvAy8E1XUh3pdu8LWd77T+KZKB51stOjv
	+QZCj9AlZ0niC3Pc9vT7CznZ9HcbqWfQmKeb+nqMPkUlMXeDwlnDVN7yxrGt1pySCfUKJEaL+Am
	u7jsD6V+DX1HfJTUPqHfWOFvprHO9VPBt3zYjySGTidWfNAdNwhtsiEq9cPq5scnLrNNgO6JsON
	5JqJS6xuOfdf4qBF39eD8fEe777nziMDYXsUht9oTRNCBAKc70PwFQhg0m7mcPYgmSkveYVeUXg
	A4868uyBK5b+P57ThHaJe0WYQFStM5nIQGunXicerIA1EGu51NW8a2N3LEVDWrN9f6zSRWU5wuu
	08nbCSrnL2/OsT7CKvDWemjv+itYw1urWHPQKjoaSh9RzVx/g==
X-Received: by 2002:a05:651c:2212:b0:3a6:6282:563e with SMTP id 38308e7fff4ca-3a662825decmr192391fa.4.1790427127350;
        Sat, 26 Sep 2026 05:52:07 -0700 (PDT)
Received: from Hedgehog.. (broadband-188-32-185-163.ip.moscow.rt.ru. [188.32.185.163])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a64b436408sm13731261fa.3.2026.09.26.05.52.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 05:52:06 -0700 (PDT)
From: Artem Shelenko <artem.shelenko@gmail.com>
X-Google-Original-From: Artem Shelenko <Artem.Shelenko@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: rtl8723bs: use unsigned int in HAL interface
Date: Sat, 26 Sep 2026 15:51:50 +0300
Message-ID: <20260926125150.161466-1-Artem.Shelenko@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The rtl8723bs TODO asks to convert remaining unusual variable types.

Replace uses of the uint typedef with unsigned int in rtw_hal_init()
and rtw_hal_deinit(), including their local status variables and
declarations. uint is a typedef for unsigned int, so this does not
change behavior.

Assisted-by: LLM
Signed-off-by: Artem Shelenko <Artem.Shelenko@gmail.com>
---
 drivers/staging/rtl8723bs/hal/hal_intf.c     | 8 ++++----
 drivers/staging/rtl8723bs/include/hal_intf.h | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_intf.c b/drivers/staging/rtl8723bs/hal/hal_intf.c
index 1443875d1..67b21b777 100644
--- a/drivers/staging/rtl8723bs/hal/hal_intf.c
+++ b/drivers/staging/rtl8723bs/hal/hal_intf.c
@@ -27,9 +27,9 @@ static void rtw_hal_init_opmode(struct adapter *padapter)
 	rtw_setopmode_cmd(padapter, networkType, false);
 }
 
-uint rtw_hal_init(struct adapter *padapter)
+unsigned int rtw_hal_init(struct adapter *padapter)
 {
-	uint status;
+	unsigned int status;
 	struct dvobj_priv *dvobj = adapter_to_dvobj(padapter);
 
 	status = rtl8723bs_hal_init(padapter);
@@ -54,9 +54,9 @@ uint rtw_hal_init(struct adapter *padapter)
 	return status;
 }
 
-uint rtw_hal_deinit(struct adapter *padapter)
+unsigned int rtw_hal_deinit(struct adapter *padapter)
 {
-	uint status = _SUCCESS;
+	unsigned int status = _SUCCESS;
 	struct dvobj_priv *dvobj = adapter_to_dvobj(padapter);
 
 	status = rtl8723bs_hal_deinit(padapter);
diff --git a/drivers/staging/rtl8723bs/include/hal_intf.h b/drivers/staging/rtl8723bs/include/hal_intf.h
index 7b6311652..b43a9c86a 100644
--- a/drivers/staging/rtl8723bs/include/hal_intf.h
+++ b/drivers/staging/rtl8723bs/include/hal_intf.h
@@ -175,8 +175,8 @@ typedef s32 (*c2h_id_filter)(u8 *c2h_evt);
 #define	RX_PNOWakeUp			0x55
 #define	AP_WakeUp			0x66
 
-uint rtw_hal_init(struct adapter *padapter);
-uint rtw_hal_deinit(struct adapter *padapter);
+unsigned int rtw_hal_init(struct adapter *padapter);
+unsigned int rtw_hal_deinit(struct adapter *padapter);
 void rtw_hal_stop(struct adapter *padapter);
 void rtw_hal_set_hwreg(struct adapter *padapter, u8 variable, u8 *val);
 void rtw_hal_get_hwreg(struct adapter *padapter, u8 variable, u8 *val);

base-commit: 8444548bd905f22093729065408284a6b46f7eee
-- 
2.43.0

