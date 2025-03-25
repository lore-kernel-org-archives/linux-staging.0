Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8695D253F11;
	Tue, 25 Mar 2025 09:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742893954; cv=none; b=M1Dy4VvKPZeg+ehLs7pYMi0pMYwEYWbJ89DjHMhu4q8z9Ilx02Zd8YOftI1wGcjECMVY1A1f7lbLq5wy/gRkYlgU5QQKUmJxDLukvMRgmGklv7eIsURLVmEhaojoHpOesvVYpMR1dOwbNg9wVBht6DiJbwd4Xaen9SEnVPj+dDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742893954; c=relaxed/simple;
	bh=Y+R2XUXKPUXHCHG5wKcBEc2R6T2CDrGeZxqUGTT8EXs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HVIMRXltEA5pg6ab34qF2P2XWwVXBkazryt3Ci+o4ZTH8YdRe2B4vnGxO8foewoWcadheGmnU3gVzFDaVSEVMVtC6Aj1Mhk8MDbQZq753mw7xvcRuIyb2c/7C3NLQf3vXJMGIAxLGTyiQ3jiB7H+aT2/xjVBWNElVx+QIXHdsek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m/FAVMzj; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m/FAVMzj"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43cf06eabdaso48864655e9.2;
        Tue, 25 Mar 2025 02:12:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742893951; x=1743498751; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=igKVCuJLDlRqPK4T2ULZyQbzlrghPqNKipcFpBAoGp4=;
        b=m/FAVMzj2+Q/eftE3Korhk3BBxNV/J/GdWYZnd4lOTDwYcDWReGXvNPIZAq0/s5p4M
         Aiu1sEDxAZ2Z+pw6tobTQ8WYS+Z0WqocAHPWX5FmikMoNpVNDHncA9c+mUePoazMhft6
         D/6rRr7lCn+VNIHzz+f9HfwKRF/xVd111EcpvfpLRt3wn+1YvDZB16QJIVcxNZxm7pH+
         1QrmvD0OGwFLTYk0W8I2gTo4Zy87cd+SnOy2UeGdeot8y3j5H/9mYDpPhC/GILqKya/n
         jEavDnQNmngIRGrzWITtQo/lQJacz7fVmXOkFeYqCj9jL2d2JompoFxvcXtym7XInGXe
         diOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742893951; x=1743498751;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=igKVCuJLDlRqPK4T2ULZyQbzlrghPqNKipcFpBAoGp4=;
        b=oAhrmhmONb1o9PdJyk+zqMAN3z/4piv/op9KtHe4i7DWMzk0VxhW2ewehm4Xjmle/y
         OcDvhyD7Gc8Opvcl2peoGsCeJTSGJCAftwaD0u6n1kqq+nQOznmVxG1ifEnqcMr6bteq
         8vfCvKvle+mSw85sjQAxYy/2FbEdiRictNusP/bMt6OQysePx6iRz0gd7/8Gb/ddg4sB
         C86uNL0+15g8s3qWCcumoE59v46PSXU7m/+97a7ZNU6LptXY9rCKz877AQaLiCO9EIWq
         2Kqze0ONGT45Sfdf/vN9ooFhe2zgkSFJC0vYRCJj6QIMJqVD5q6MWGsIK/wdp1VViLY/
         /s3Q==
X-Forwarded-Encrypted: i=1; AJvYcCV/F2gwmqabuZtMcd3CNR31DdM/tlACzPF3UERAdv6XBH/Z2D97OGQxi7gr52A1WU3zD6Wl6lW5H+SH1k3T@lists.linux.dev, AJvYcCXV6OgV7v0HITkauEJFWsR30Y5WadXA9n1oOxbKiml8DWBB44xEiFXWFWcWB/C/Y7ka/Sh6cCaBmpYc@lists.linux.dev
X-Gm-Message-State: AOJu0YzhrLmkLDMWny3xWlnVZtaAx0xp4Lj0eP7ZNxu7Pflft/Sih/Zg
	KUJt4Bf8x84BwmdCMtqTmcjgy0Ml9+MwDyWJqnAdIXnJhaujx/D+GbK4sX8ap9U=
X-Gm-Gg: ASbGncuTqvXp65Xb1LuvyKeKp2xgj6DukXln8ooaw29VwarQcU9qmJ9C+10RGFv0KcO
	zZ+zY8cydirQZy4wdiHZDzNhExeFSxtxqmzj8rzZcXR0g2zKwr89U4q4e2xeW94D1BPF82OS04m
	RWqSzb4Qpr29zEKQ+r8ocpVks6qjt+g2BAYFiRKzUdQEPA/HkfQHdLK1eZwLoCKv2rM9aaZ2ZzS
	qwBoIxmTlgczdUGlXAt+6a1NnGitdDwoLq9UiCO3qQmACfJ3DsJrpBPadCShYFStm+CKTCs7Vh1
	GEWT3zjtl13mqFyPOFBd0AMapinPanO3qloU2cl3Oq7J0wCiiGsw
X-Google-Smtp-Source: AGHT+IGleKR5b6dcwSh19AN+MK7Lis1Bbe772oF9njIxdXkUMy0EbYz85aMlNWr739QKERhf8IKk9Q==
X-Received: by 2002:a05:600c:1ca0:b0:43c:fd72:f039 with SMTP id 5b1f17b1804b1-43d58c9a7b1mr120065965e9.11.1742893950565;
        Tue, 25 Mar 2025 02:12:30 -0700 (PDT)
Received: from pc.. ([197.155.71.138])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d4fd9decbsm144187305e9.27.2025.03.25.02.12.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Mar 2025 02:12:29 -0700 (PDT)
From: Erick Karanja <karanja99erick@gmail.com>
To: gregkh@linuxfoundation.org,
	outreachy@lists.linux.dev
Cc: philipp.g.hortmann@gmail.com,
	davidzalman.101@gmail.com,
	vivek6429.ts@gmail.com,
	viro@zeniv.linux.org.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Erick Karanja <karanja99erick@gmail.com>
Subject: [PATCH] staging: rtl8723bs: Rename variable supportRateNum
Date: Tue, 25 Mar 2025 12:12:20 +0300
Message-ID: <20250325091220.38601-1-karanja99erick@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename the variable `supportRateNum` to `support_rate_num` to adhere to
Linux kernel coding standards by using snake_case instead of CamelCase.

Fixes checkpatch.pl warning:
    CHECK: Avoid CamelCase: <supportRateNum>

Signed-off-by: Erick Karanja <karanja99erick@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_ap.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ap.c b/drivers/staging/rtl8723bs/core/rtw_ap.c
index 50022bb5911e..5124260602c8 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ap.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ap.c
@@ -370,7 +370,7 @@ void add_RATid(struct adapter *padapter, struct sta_info *psta, u8 rssi_level)
 void update_bmc_sta(struct adapter *padapter)
 {
 	unsigned char network_type;
-	int supportRateNum = 0;
+	int support_rate_num = 0;
 	unsigned int tx_ra_bitmap = 0;
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
@@ -396,9 +396,9 @@ void update_bmc_sta(struct adapter *padapter)
 		/* psta->dot118021XPrivacy = _NO_PRIVACY_;//!!! remove it, because it has been set before this. */
 
 		/* prepare for add_RATid */
-		supportRateNum = rtw_get_rateset_len((u8 *)&pcur_network->supported_rates);
+		support_rate_num = rtw_get_rateset_len((u8 *)&pcur_network->supported_rates);
 		network_type = rtw_check_network_type((u8 *)&pcur_network->supported_rates,
-						      supportRateNum,
+						      support_rate_num,
 						      pcur_network->configuration.ds_config
 		);
 		if (is_supported_tx_cck(network_type)) {
@@ -893,7 +893,7 @@ int rtw_check_beacon_data(struct adapter *padapter, u8 *pbuf,  int len)
 	);
 	if (p) {
 		memcpy(supportRate, p + 2, ie_len);
-		supportRateNum = ie_len;
+		support_rate_num = ie_len;
 	}
 
 	/* get ext_supported rates */
@@ -904,11 +904,12 @@ int rtw_check_beacon_data(struct adapter *padapter, u8 *pbuf,  int len)
 		pbss_network->ie_length - _BEACON_IE_OFFSET_
 	);
 	if (p) {
-		memcpy(supportRate + supportRateNum, p + 2, ie_len);
-		supportRateNum += ie_len;
+		memcpy(supportRate + support_rate_num, p + 2, ie_len);
+		support_rate_num += ie_len;
 	}
 
-	network_type = rtw_check_network_type(supportRate, supportRateNum, channel);
+	network_type = rtw_check_network_type(supportRate, support_rate_num,
+					      channel);
 
 	rtw_set_supported_rate(pbss_network->supported_rates, network_type);
 
-- 
2.43.0

