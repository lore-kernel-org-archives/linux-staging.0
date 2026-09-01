Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34A1442C4FA
	for <linux-staging@lists.linux.dev>; Tue,  1 Sep 2026 15:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788276150; cv=none; b=FvKN+BlPdD4FvIa8iaWlFV22/Pkm0g7bErLs87R/yPYdJVppgpeDGvV02u5R8uID/69myRwEdtIASd3KgBPCYr9+aGdpX6TYE420BxixKI6vhkOPrzSwkTlpv4iTnYo7x54vtODzu7VW/8hkuBZLYJyBNJ+JVBbnti2+CDto4/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788276150; c=relaxed/simple;
	bh=45hdTDUeNS+Ujbv5tKPSyFxUokDuaQ2QCyO7h77sfQ8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iH+Np6Sp+cA8FHr3dln8ouEA8+iOTma154wH9QORbMT2hF1AaYU8kucqOS74uTw9fXymNU4LH3LKvHP3YjEK97yyXkNZAW+ONTZIb9nxb3dzecjpu652CmHzzCO03kOLjsBqLJEWhBbbOzdZfivelgyA7KfHyplq+ZP4xlPsVHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lyOEocxa; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lyOEocxa"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4954a9e8490so7633065e9.1
        for <linux-staging@lists.linux.dev>; Tue, 01 Sep 2026 08:22:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788276147; x=1788880947; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=n6EVCXJ1tmjiqwFVXXEhhtOumXmmMcs1NKnV3QIYUhM=;
        b=lyOEocxaAx0vtGy+73vIL21ibx0czJfI+BviIoDkmWgo8b1T5vYpWL6evF1vjP4MAy
         OjnqM1KqpvxF6YUP88UDHBT4xFB/Ud4wY4bmh7yRHDk2kDSJq1iVLIRPb3ikP5xXIvK/
         tuAoiYHVnJqZk4FcBesx5yn8dsIIozJplDAEQP1WEmA3EChwbrDkgF1dxhtv/BowRMR+
         uhh5gpbZj+oUzdfM1KMqwQamcB26RIgaiKMEYQnltc/yrk9QFOpjSwE8HiqkxUzA3VPW
         04iFCGR6mkUxqJnZREF6jPh0y2D3/uqmbQqsaadqaYz+pW7M2x7zFLvqbs4qe/ZE6rPL
         lRYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788276147; x=1788880947;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n6EVCXJ1tmjiqwFVXXEhhtOumXmmMcs1NKnV3QIYUhM=;
        b=Q25T29Du/PipT2IcrGoxJZFNA1crGkoq9maXkHbndJKZf4ANH49Z8SQesdq/sZX+w0
         KVobIeI2ArdXHIB3lViFKcyawG6lo7Ear1W2bPBwu3E0tGxX01AwRa+EOfdGWr3oeU/1
         fWvL1D9buGSPJh13mngAIlmHWPQXz0FVKapEs6ZHpT5V9efBzxh/RZiUAiJj96YqgufO
         fW9fSbTW+tBMSLcMEO+uT2HBXCQvm4/sUJSTvH0UZKPdRqwW2ysjz1j/s872AKFxQbzn
         JvT1pYptUE29rdkSwGw8VOo7DMNvdj2a8hlRlLQkI54z+IugogVMzTGQ12VQORRBQEeq
         mvIg==
X-Gm-Message-State: AFuF++lVL6zplmMljfF1tD6yoDWFFxqJc06mcxOkWKaxc0yh0oQfdAnU
	0WImkD7x0vTt1gZJ06n6ueLlMzlv469hkOhKtduFeXsu43yrVHQt8vYF
X-Gm-Gg: AR+sD11qShusE/jYvVWalU76rSG1sVKt1i0TtmTlAaXPompYwmV6nb0vYCSzQ41XGQy
	LfT4+JkHA1yQsOi/nR/zRu2v/kyEbGmW5OagBVDduy2Sha3u7LsEnaqJWnVvEsYOSd/JwFSUjoe
	aBScmJZPk4GE0+gKowJU4UWCRTanr00TnV3WCtH6P7A50bkj10CNZMgirvoQNQzAsdCSZ/vNVno
	fhJyg9ZrfQT83UCHTxXSLkocKSR4a7EjeXyGgvBnYEh1hWYX320kz5AmkvZhXInMRomSvYp2TMA
	vvD0aTQgBHXL/N30ep5P9lGGjQ9ctIA4+faUkopDhnSEk46iu7bwwMj7MQCnw10pnYA4uC5P4tt
	OllOe3pAQYTL3QDe+KtuCCq1c9+VoyOmbMznOjltorf9m+xw/r8nJSeN07QSWfLOI3UOQblVkn9
	PQ4czC44ZT6DjH0YKpUAVxGhFcKqGJAwfA1hSeBLpXovZrgBIAHI7pQ2/wIFUFBXV0R/cldX4oQ
	SwxCTx5WrhXeXiW
X-Received: by 2002:a05:600c:4e90:b0:49c:ced9:ab7f with SMTP id 5b1f17b1804b1-49cdd60df3cmr88005315e9.8.1788276147270;
        Tue, 01 Sep 2026 08:22:27 -0700 (PDT)
Received: from localhost.localdomain ([195.149.108.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdce171c3sm77910305e9.8.2026.09.01.08.22.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 08:22:26 -0700 (PDT)
From: Svyatoslav Nikolenko <nsvatoslav515@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Svyatoslav Nikolenko <nsvatoslav515@gmail.com>
Subject: [PATCH] staging: rtl8723bs: Remove unused ifname module parameter
Date: Tue,  1 Sep 2026 18:21:44 +0300
Message-ID: <20260901152144.5978-1-nsvatoslav515@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the ifname module parameter and the corresponding ifname field in
struct registry_priv. Hardcode the default "wlan%d" interface name format
string directly in rtw_drv_register_netdev().

Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Svyatoslav Nikolenko <nsvatoslav515@gmail.com>
---
 drivers/staging/rtl8723bs/include/drv_types.h | 2 --
 drivers/staging/rtl8723bs/os_dep/os_intfs.c   | 9 +--------
 2 files changed, 1 insertion(+), 10 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/drv_types.h b/drivers/staging/rtl8723bs/include/drv_types.h
index 552d0c5fa47f..5837c51ac2f5 100644
--- a/drivers/staging/rtl8723bs/include/drv_types.h
+++ b/drivers/staging/rtl8723bs/include/drv_types.h
@@ -151,8 +151,6 @@ struct registry_priv {
 
 	u8 enable80211d;
 
-	u8 ifname[16];
-
 	u8 notch_filter;
 
 	/* define for tx power adjust */
diff --git a/drivers/staging/rtl8723bs/os_dep/os_intfs.c b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
index dd0c5fc813c8..ade4576ea033 100644
--- a/drivers/staging/rtl8723bs/os_dep/os_intfs.c
+++ b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
@@ -109,10 +109,6 @@ static int rtw_80211d;
 static int rtw_qos_opt_enable;/* 0: disable, 1:enable */
 module_param(rtw_qos_opt_enable, int, 0644);
 
-static char *ifname = "wlan%d";
-module_param(ifname, charp, 0644);
-MODULE_PARM_DESC(ifname, "The default name to allocate for first interface");
-
 char *rtw_initmac;  /*  temp mac address if users want to use instead of the mac address in Efuse */
 
 module_param(rtw_initmac, charp, 0644);
@@ -256,8 +252,6 @@ static void loadparam(struct adapter *padapter, struct net_device *pnetdev)
 
 	registry_par->enable80211d = (u8)rtw_80211d;
 
-	strscpy(registry_par->ifname, ifname, sizeof(registry_par->ifname));
-
 	registry_par->notch_filter = (u8)rtw_notch_filter;
 
 	registry_par->reg_enable_tx_power_limit = (u8)rtw_tx_pwr_lmt_enable;
@@ -784,9 +778,8 @@ int rtw_drv_register_netdev(struct adapter *if1)
 {
 	struct dvobj_priv *dvobj = if1->dvobj;
 	struct adapter *padapter = dvobj->padapters;
-	char *name = if1->registrypriv.ifname;
 
-	return _rtw_drv_register_netdev(padapter, name);
+	return _rtw_drv_register_netdev(padapter, "wlan%d");
 }
 
 static int _netdev_open(struct net_device *pnetdev)
-- 
2.47.3

