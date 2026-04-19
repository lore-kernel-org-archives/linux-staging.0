Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 864BC1E8320
	for <linux-staging@lists.linux.dev>; Sun, 19 Apr 2026 07:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776583333; cv=none; b=T2m/HFkFq4gLj94pKNacLRAYlKxUn/HOd07P9IJpVrbk404IKC/YAcM4ut2dhDTBl/rhmvwMzKFLqhuf37iuR4vSwgiWsC1FKUhhjWfm993t4gpQSXbRbZ6WHlfZfFbURhVpYYvVp0IuCA5RMNAUYhoFmj+1z8L/kKIKlaFDvZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776583333; c=relaxed/simple;
	bh=w//z3/W8YrcweYcSC/aZqPycSH0Vp78ejavVIpnuIiA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dpc9G5yrHbn2gSRLDlaIYJsr20UfDgpsoAw62kjk7yy18Sgg8/fbS8HZZdWL+U1f94ks0J7b928WoOjjXf0bEnVeao3ZLFJBxg+DM6PS2iJ7K6MU/MdH2XudfXQSEj+5IEAnd/XCyINChHk5GI5EjyzaV2aAU1W87msxpHsgIeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ThSqW1Tn; arc=none smtp.client-ip=74.125.224.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ThSqW1Tn"
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-64937edbc9eso1681156d50.2
        for <linux-staging@lists.linux.dev>; Sun, 19 Apr 2026 00:22:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776583331; x=1777188131; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8O9YCvI6D5iqQp6q490uTCpq1laMRxVBCmCIRIoilo0=;
        b=ThSqW1TnfURyKnjbEytJutOeceIREB5fbrQMPLo45zU3t3MwN+hcvYrrt0jJ5cnhwj
         b14RlBOuUnPhk46PNerCOQX00X3aw6CAh8atR/7WObGBWLod44ntmwGiepGU9G54rrmK
         F9ROOqDt8Vxje/OG5QrQxuOG88o4PytRu8AroIGPHoE54wiFKDVZbM/h91o/jdy7DnNP
         oC9OCuMVIHrP27lfaddQYURJSamA6XAkss6dHrX2OIjGTvTHDkorf9Cm7vJrvNS2YolG
         lkzWiv/OEWlD0+eeqWOi032DqRMSiGhbsJoJoLJvlgP2q1Rdn9dFL2Pz4FOsyHMuiyeg
         0Y+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776583331; x=1777188131;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8O9YCvI6D5iqQp6q490uTCpq1laMRxVBCmCIRIoilo0=;
        b=Euk7WKChb66T4Kbo7TF27g1yQJ2dvLCwiHkWkJ5Fmv/i3nLPNK31ZY3utRwJ5s/67u
         6cC7TKohuIOQEQ9qB0KWpYqiCalVr4JlSCowtjKxFkfACIYb7m0IIWyoIY9QFiRf42Ht
         zmCXPn5zLzDqoWOVjRQ9MuRylyKoUxu6tDpV5knFaUuK9XH+Miz+jJfRVvwtSWQ66OD2
         0wN1sONIddMWFzciAwvG7Zt229TYJFJjxf25kedFjX712nh8LdyxADbnZjFST7zDnbJm
         8d7867V0aLr/+j6QRrr8pu0upaDVnUNEjzE8Y4rBA3+qFm5vAgcLp/TxUNtp1ykOJ0Da
         UA/g==
X-Gm-Message-State: AOJu0YyI/eFcA40FkRHuESbbdmQFEeHRoi/fAWzSPwBN4LC5xCsdlwKT
	bPIELeVHMLfvVRdFbBcI76RkMAM+wfHh4QE/aH64zmRheBABKuA650g5
X-Gm-Gg: AeBDiet+snfOsZq0X2bheQdrhujUGqaxt7ofge0P3692nm405Eeic5DGeG0wdeKhqwM
	SS/IQ7ecH10Hm8rmnZoFcIGDQ+8svfipiqBEwdpw86Dijcqhi75NZSzmX9kE7UvP3+T+v3wJx5Z
	mYvfY4WDhynI8TBjuQZg/AxaUCC6bMvYIOHo4K5TZW1kuWXhlJN80v+ULfpNg9ZdA9X73zAk+JV
	GfonUMhRd8kGd8hRY6esN+gSwAeJtHAWLPM9wQfG8SKobfOcy99eyCuwm5O3p4qvnYP/Hg+ge23
	INHs4RLpt6hvZlosKwnJCO1Eyxy/dRlFAwjuO0PiF5nTgjyi5k6k3Kvxx3gHlNDNKCvESimM1Io
	UYM4xjM1YIcdX/Hm8/2hsuzBGtCkbxzfxwup75QHqAZRp2Fg2Qn6WXHQ3yiS4w3gIDLmyZplZW9
	IAWOO4HQem0hSksPQTie1cqkt/y+jDQuEEEXqLuOc6toCONw==
X-Received: by 2002:a05:690e:419c:b0:64c:a4ab:e4dd with SMTP id 956f58d0204a3-653107edd75mr6868094d50.1.1776583331533;
        Sun, 19 Apr 2026 00:22:11 -0700 (PDT)
Received: from archlinux ([185.140.161.214])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-65314ed1150sm3341152d50.18.2026.04.19.00.22.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2026 00:22:10 -0700 (PDT)
From: Nikolay Kulikov <nikolayof23@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	Nikolay Kulikov <nikolayof23@gmail.com>
Subject: [PATCH 06/11] staging: rtl8723bs: remove wrapper rtw_hal_dm_init()
Date: Sun, 19 Apr 2026 10:19:32 +0300
Message-ID: <20260419072034.19824-7-nikolayof23@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260419072034.19824-1-nikolayof23@gmail.com>
References: <20260419072034.19824-1-nikolayof23@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unnecessary wrapper and call rtl8723b_init_dm_priv() function
directly to simplify code.

Signed-off-by: Nikolay Kulikov <nikolayof23@gmail.com>
---
 drivers/staging/rtl8723bs/hal/hal_intf.c     | 5 -----
 drivers/staging/rtl8723bs/include/hal_intf.h | 2 --
 drivers/staging/rtl8723bs/os_dep/os_intfs.c  | 2 +-
 3 files changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_intf.c b/drivers/staging/rtl8723bs/hal/hal_intf.c
index 43b9bf9712c8..4448082c14da 100644
--- a/drivers/staging/rtl8723bs/hal/hal_intf.c
+++ b/drivers/staging/rtl8723bs/hal/hal_intf.c
@@ -7,11 +7,6 @@
 #include <drv_types.h>
 #include <hal_data.h>
 
-void rtw_hal_dm_init(struct adapter *padapter)
-{
-	rtl8723b_init_dm_priv(padapter);
-}
-
 static void rtw_hal_init_opmode(struct adapter *padapter)
 {
 	enum ndis_802_11_network_infrastructure networkType = Ndis802_11InfrastructureMax;
diff --git a/drivers/staging/rtl8723bs/include/hal_intf.h b/drivers/staging/rtl8723bs/include/hal_intf.h
index e7cfb255f8f6..721501ca3b02 100644
--- a/drivers/staging/rtl8723bs/include/hal_intf.h
+++ b/drivers/staging/rtl8723bs/include/hal_intf.h
@@ -181,8 +181,6 @@ typedef s32 (*c2h_id_filter)(u8 *c2h_evt);
 #define	RX_PNOWakeUp			0x55
 #define	AP_WakeUp			0x66
 
-void rtw_hal_dm_init(struct adapter *padapter);
-
 uint rtw_hal_init(struct adapter *padapter);
 uint rtw_hal_deinit(struct adapter *padapter);
 void rtw_hal_stop(struct adapter *padapter);
diff --git a/drivers/staging/rtl8723bs/os_dep/os_intfs.c b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
index bd42795fb1a2..0467c87619ca 100644
--- a/drivers/staging/rtl8723bs/os_dep/os_intfs.c
+++ b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
@@ -674,7 +674,7 @@ u8 rtw_init_drv_sw(struct adapter *padapter)
 
 	rtw_init_pwrctrl_priv(padapter);
 
-	rtw_hal_dm_init(padapter);
+	rtl8723b_init_dm_priv(padapter);
 
 	return _SUCCESS;
 
-- 
2.53.0

