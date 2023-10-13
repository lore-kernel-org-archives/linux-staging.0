Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED84F12B7F
	for <linux-staging@lists.linux.dev>; Fri, 13 Oct 2023 14:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y4eZZ3n2"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-406aaccb41dso7012205e9.0
        for <linux-staging@lists.linux.dev>; Fri, 13 Oct 2023 07:43:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697208229; x=1697813029; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=w8SaTIPv9bZSjFBzeO1OYPVCHSjabEYQBQuyencb7Ig=;
        b=Y4eZZ3n2cZcPj/JDIqvqbtEg8C1qseCgugCNdfUBp8MzI7OE4GtoM298T1+GGEsJFc
         XfNlHzuFNLzxisc6KoDXkMLycCG0F3BoHHbuGaYFM0cKnzVEn3jPOoO4qLn30J1XYfbS
         LnQR/aFUgNMIv7Q/SsepBg97piwvX/v2IqILOLm9MbXSVTuptg2XxgS19AXGNT2LYFoq
         0fbEd1ew1CUnABNQz0sM/ZbjCxCWimLFn8UlOmxil/MF7rJzIk51FfKd3Ju7C0qYfFQQ
         S/M7EwgB7rZbMXHh2XhGUTqtLdOUPnP4gWJLvZB4IVGFK3wX8AMbyAbGD/1e9FJhpCWG
         X3JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697208229; x=1697813029;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w8SaTIPv9bZSjFBzeO1OYPVCHSjabEYQBQuyencb7Ig=;
        b=KP1MMincTrwtnGYfuceEgesMyADRAC31v1vAPkz/p0liV3imiXAFim60btb2m/6Spb
         enk3mgkIFvsPkeBZCSTAKsUz4W/C//42sFxdHJsTLnqn9OZa+F67/HWvdhpKwehcgxgM
         +TVrm1HHA+PyIGBkC9+PkbNrMaLhmcxKXytMW5MXlKY58vI1jiGPqDNcJx1wugBq0Zp8
         9dcTJXDqaeHnU9fu5uHaUXNFjxR3ytv6+lFYDUcB1nJOyIE9lGcl4Sprt9KO5rQ42B09
         IC22G4WS0W+f7Yj4+P80BAaArzhx0KtMCcAJzI4Tq5HBEgq5e+JcslOzFr/wAiSYB52G
         3tSA==
X-Gm-Message-State: AOJu0YwCmtxbottLmoNle/rCQ6NRNmWnm2EU6tOYjjk+CvpQuqziqnny
	3jh2JvEmXsCqvCZhrmEwuR8=
X-Google-Smtp-Source: AGHT+IFwtt0CK9XdJ5BjERuoJ4zOPy+UTgy0+12btgC+iqHiQaBZg/OqTFwXi3H2W8zuotSwgh5e9A==
X-Received: by 2002:a05:600c:511d:b0:401:b53e:6c3e with SMTP id o29-20020a05600c511d00b00401b53e6c3emr24393440wms.1.1697208228764;
        Fri, 13 Oct 2023 07:43:48 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p579356c7.dip0.t-ipconnect.de. [87.147.86.199])
        by smtp.gmail.com with ESMTPSA id s16-20020a05600c45d000b004063cced50bsm324486wmo.23.2023.10.13.07.43.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Oct 2023 07:43:48 -0700 (PDT)
Date: Fri, 13 Oct 2023 16:43:46 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 1/6] staging: rtl8192e: Remove unchanged variable
 dig_enable_flag
Message-ID: <24a9245840093c5a14124f9fc896433c7d85d18c.1697127817.git.philipp.g.hortmann@gmail.com>
References: <cover.1697127817.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1697127817.git.philipp.g.hortmann@gmail.com>

Remove variable dig_enable_flag as its value is set to 1 at
initialization. No further writes to dig_enable_flag are done. The
equations result accordingly. Remove dead code.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/rtl_dm.c | 11 -----------
 drivers/staging/rtl8192e/rtl8192e/rtl_dm.h |  1 -
 2 files changed, 12 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
index 01abe1e48468..bbd18b6cc252 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
@@ -913,8 +913,6 @@ static void _rtl92e_dm_dig_init(struct net_device *dev)
 {
 	struct r8192_priv *priv = rtllib_priv(dev);
 
-	dm_digtable.dig_enable_flag	= true;
-
 	dm_digtable.dig_algorithm = DIG_ALGO_BY_RSSI;
 
 	dm_digtable.dig_algorithm_switch = 0;
@@ -941,9 +939,6 @@ static void _rtl92e_dm_dig_init(struct net_device *dev)
 
 static void _rtl92e_dm_ctrl_initgain_byrssi(struct net_device *dev)
 {
-	if (!dm_digtable.dig_enable_flag)
-		return;
-
 	if (dm_digtable.dig_algorithm == DIG_ALGO_BY_FALSE_ALARM)
 		_rtl92e_dm_ctrl_initgain_byrssi_false_alarm(dev);
 	else if (dm_digtable.dig_algorithm == DIG_ALGO_BY_RSSI)
@@ -976,9 +971,6 @@ static void _rtl92e_dm_ctrl_initgain_byrssi_driver(struct net_device *dev)
 	u8 i;
 	static u8	fw_dig;
 
-	if (!dm_digtable.dig_enable_flag)
-		return;
-
 	if (dm_digtable.dig_algorithm_switch)
 		fw_dig = 0;
 	if (fw_dig <= 3) {
@@ -1007,9 +999,6 @@ static void _rtl92e_dm_ctrl_initgain_byrssi_false_alarm(struct net_device *dev)
 	struct r8192_priv *priv = rtllib_priv(dev);
 	u8 i;
 
-	if (!dm_digtable.dig_enable_flag)
-		return;
-
 	if (dm_digtable.dig_algorithm_switch) {
 		dm_digtable.dig_state = DM_STA_DIG_MAX;
 		for (i = 0; i < 3; i++)
diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.h b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.h
index 5ae2bf467158..faf08763c340 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.h
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.h
@@ -50,7 +50,6 @@
 
 /*------------------------------Define structure----------------------------*/
 struct dig_t {
-	u8		dig_enable_flag;
 	u8		dig_algorithm;
 	u8		dig_algorithm_switch;
 
-- 
2.42.0

