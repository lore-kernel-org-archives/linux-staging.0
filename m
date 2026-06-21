Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFA37326927
	for <linux-staging@lists.linux.dev>; Sun, 21 Jun 2026 10:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782038536; cv=none; b=IGDKtnL4SEMIlJFasIhcBB0KYG+82Ni9IIl9wJPtOK6X2PEmDnCWGP8VWG9iVZOIi8pik1X/RR6db9YA5WO5A2thRSx3aMdvl5GnFVNRVDkGTn0Cwc5jva6On5T+5oU5YVxeCX1Al2QYiNpkZBdGZJPr35heL/tpc7A/dmUVqVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782038536; c=relaxed/simple;
	bh=EvSZuU9i0PT06PJx+HBgF7CXJWxirmpUOmj3UGT+5MU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ec/nXpDVi/iXrk6pyNDkxPKbYHYjfyThMKCCCT/SzGT34+HmkPKPpvVfYDzpEUlLMQdIEdTBlOhTQN9vY/xSqtcvk5+ut1KpIL3BTC64/jHKnyM3H+VTt8+nLDuD2aFGPlSolGBugqT8faGV51fPg4D9sUEeo/PObOBL2VWB2oQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FWcv9+I+; arc=none smtp.client-ip=209.85.128.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FWcv9+I+"
Received: by mail-wm1-f67.google.com with SMTP id 5b1f17b1804b1-4924f8db066so3039735e9.2
        for <linux-staging@lists.linux.dev>; Sun, 21 Jun 2026 03:42:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782038531; x=1782643331; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9yZQk1tBzNY157C1Blhx/o/UNNnKcdwVjFXqBef/QG8=;
        b=FWcv9+I+nKecyV2jHGxqV/lP7IoftrKoI6V0mMQ7biCpXFBvC3I6vBZmBdp5W+YFLX
         Cbri9CXDYZ8trkC5YSYHYcF+aVztw23qoHSSjhn5QvE3/wfOdEbere3+92JzCfaowwyI
         WAp0opetcsY7LzFpqmGFBtxrd3qIXDQj9RqFuUIDyj3BdfIcfG9i0NHEG8mRPFmqe56e
         BQWeJjxaziTKPqzZSPe4sfCXaMr2T9mwwAw8iNObhRBDBUowpvPaNrd/pEH4/oGqLRop
         Kz2hnN+1sHnLeBacilXB7fmjG8xMZRiGQzoLWcEdhbdSkhN+dCzkDYul9xdKOIazdD07
         o6EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782038531; x=1782643331;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9yZQk1tBzNY157C1Blhx/o/UNNnKcdwVjFXqBef/QG8=;
        b=czs2zK0yhBFChrXWznVtMfaE3i8cJLW93ywm9gzMSyOwDhFOBz/GQuzBuyVAAbUBgQ
         k4HUKIYPKlH7rpTcj/ch4RMlXgOwS7dIFOvzkMHEGt4nEa2F5+GZJ3Dq/2eKFRKTNSvG
         sN6tj7orljlOwTdXLcdjSi+uQDqbszNYeRmq07uQuhS3BfDWay3/G6VGAagEq8ha9lbo
         6YpgI3Bx5CJUob8/HAr6BuJFCPcVaFRqkLAAjUWcwyQJbEWfXrZkKyZO53z+sDCLMYUi
         iJkri/N4zUfLJIPxsSVQUazJqh1blwsUpHt30beunJSxeqE5EfHE0Z7qyUd3TxPLW1zq
         wnxQ==
X-Gm-Message-State: AOJu0YzMPpHQdJN4juNeQeqXL7cUcrzrsnOaoQXCAG6DGVwLck/FNVcx
	DsaU4uOfs9egFFw9meI19xOHljbIWjEMkCl4HL/bY20vnP6ANwCT6QnEY9O9TVtUCw8wjSIf
X-Gm-Gg: AfdE7cl78mCPxeCTF64q0quAv6Rpa4zVRSxTbNoZ33ITdFoFXmK+36H5MrLa5Mjo8TL
	GWVx+5hOPzFAdyitdC40SePzCQEZTm0ROYfETSYYsC+Mo0W0Xxn7i5BWk/qVGd45jyvyqD+Z9Xe
	vW7qYVNKxr8sl8dyQiqghTwZUYrdH7So8T7mU70haB2AkFRPaNBYDFLJaAm/qfmaZgRzkfI1leL
	yUUEQwnCtPtvqjRVx6rLcjDnaRPHhQRRVZcbx1evzTzVsAS1XwQDRN/+KPe6BNrdTNbTsD2PDFY
	Z8N2XT9HCwXSprLrs8XmzZxsfmfSfBsbq3/ULmVVfiHQXZ66jlCi6WyURAtuoX39nIkhPtltOwK
	Pcsgo8LroiL4f36TkpacvYTzca943BqFLs7A8K8gWtIqyKUwO1LS5l5SHJsu1drd2DL42CybcIT
	430CYbSw==
X-Received: by 2002:a05:600c:5290:b0:490:bcf6:469f with SMTP id 5b1f17b1804b1-49242189b1cmr148138055e9.0.1782038530928;
        Sun, 21 Jun 2026 03:42:10 -0700 (PDT)
Received: from fedora ([212.253.214.17])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4923fc47720sm340690915e9.0.2026.06.21.03.42.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jun 2026 03:42:10 -0700 (PDT)
From: Serhat Kumral <serhatkumral1@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Serhat Kumral <serhatkumral1@gmail.com>
Subject: [PATCH 1/3] staging: rtl8723bs: remove multiple blank lines
Date: Sun, 21 Jun 2026 13:40:56 +0300
Message-ID: <20260621104058.7408-1-serhatkumral1@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove multiple blank lines in os_intfs.c to conform to the
Linux kernel coding style guidelines.
This fixes the checkpatch.pl warnings:
CHECK: Please don't use multiple blank lines

Signed-off-by: Serhat Kumral <serhatkumral1@gmail.com>
---
 drivers/staging/rtl8723bs/os_dep/os_intfs.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/os_intfs.c b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
index f31196f54..a545c3338 100644
--- a/drivers/staging/rtl8723bs/os_dep/os_intfs.c
+++ b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
@@ -18,7 +18,6 @@ static int rtw_chip_version;
 static int rtw_rfintfs = HWPI;
 static int rtw_lbkmode;/* RTL8712_AIR_TRX; */
 
-
 static int rtw_network_mode = Ndis802_11IBSS;/* Ndis802_11Infrastructure;infra, ad-hoc, auto */
 /* struct ndis_802_11_ssid	ssid; */
 static int rtw_channel = 1;/* ad-hoc support requirement */
@@ -143,7 +142,6 @@ module_param(rtw_wifi_spec, int, 0644);
 module_param(rtw_antdiv_cfg, int, 0644);
 module_param(rtw_antdiv_type, int, 0644);
 
-
 module_param(rtw_hw_wps_pbc, int, 0644);
 
 static uint rtw_max_roaming_times = 2;
@@ -238,7 +236,6 @@ static void loadparam(struct adapter *padapter, struct net_device *pnetdev)
 	registry_par->lowrate_two_xmit = (u8)rtw_lowrate_two_xmit;
 	registry_par->low_power = (u8)rtw_low_power;
 
-
 	registry_par->wifi_spec = (u8)rtw_wifi_spec;
 
 	registry_par->channel_plan = (u8)rtw_channel_plan;
@@ -335,7 +332,6 @@ static unsigned int rtw_classify8021d(struct sk_buff *skb)
 	return dscp >> 5;
 }
 
-
 static u16 rtw_select_queue(struct net_device *dev, struct sk_buff *skb,
 			    struct net_device *sb_dev)
 {
@@ -633,7 +629,6 @@ void rtw_reset_drv_sw(struct adapter *padapter)
 	rtw_set_signal_stat_timer(&padapter->recvpriv);
 }
 
-
 u8 rtw_init_drv_sw(struct adapter *padapter)
 {
 	int res;
@@ -891,7 +886,6 @@ static int  ips_netdrv_open(struct adapter *padapter)
 	return _FAIL;
 }
 
-
 int rtw_ips_pwr_up(struct adapter *padapter)
 {
 	return ips_netdrv_open(padapter);
-- 
2.54.0

