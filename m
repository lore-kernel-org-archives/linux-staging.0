Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1507330F938
	for <linux-staging@lists.linux.dev>; Tue, 23 Jun 2026 10:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782209168; cv=none; b=Sk+R3dabCUY0xce7bm0poN5Ym62lnAxe7Pyj/q8u255wIAhJjblPF8WiojgVHQiF2IUUD8s42zewC4mQpGTPZ+2izIc6yKOg0Cr+FsBmA2QtqI1JJm4z259DnnZShjz14B7ZbYfcJzYbdjqGsmf7VrwlqKX/0UBy2ZhI+lQqfi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782209168; c=relaxed/simple;
	bh=gVx2icD4/QXkFO6v0BPx3vUsKt8sO9clhh5Pl5/cZ7c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JNfKIzLn5kqffnCCqMVXYGAtGSaXdfSSuS6MJPwt3vc4SkakHDKGl41gir3Tm1JDQO/+ST9prtILudpkI7RiBmB7MzP3AC9TZ1LOgeXLwebY9rLnSO8ZTWQahdZPgMo3ufbDoykc25jbWDjjtOD9w5DqSeo0EOaMqMIsZ5FWvII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aw85dqTJ; arc=none smtp.client-ip=209.85.221.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aw85dqTJ"
Received: by mail-wr1-f68.google.com with SMTP id ffacd0b85a97d-45fd464d51fso3225211f8f.3
        for <linux-staging@lists.linux.dev>; Tue, 23 Jun 2026 03:06:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782209164; x=1782813964; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=74FpPkUr+DrsqE7gvecMQLr9ZvvUTzrdpe0vjTjQ3Ls=;
        b=aw85dqTJxNEPo1Auj6x4crvl+gmWzn5mKEBnq4BOaJWd8ZtK2KvjKV9ADAAqMyF10C
         H772/4RvRAUpYTFs6snq9w4IjnUdsqHcwG4+jC3vOhNrIxUoayX5ZagFq28ij+jdWS3o
         c15KaimBknItkPzkMgid5mYGxupMJQD4OTgyBfxUaaY32SXGjkPJKZysGspG3TUhP78P
         PtRtaV9DdwcnNPgqdvWmVfc3imsmyjpcfBAvlWv3Z2qBzzv3b4Du6Ru5NXIYlNZ2Yd8r
         DTgxaaI5D959CU6m5Jlnu/POcJtxGa/Uyf0tKOPUllnrKRVhU1EaCrwHobyAYL+gTbLH
         aGzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782209164; x=1782813964;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=74FpPkUr+DrsqE7gvecMQLr9ZvvUTzrdpe0vjTjQ3Ls=;
        b=HFJx9HJdGn9WZFaHjiyksIi5G141ozEu/jcujPqtgrTLKoRl+V0mIt2cwjUBVuPZ2Y
         7bgGuPz3i1AhMQLuQIZTXJjHI55XnPbtt6bSNh0CYGaOgPR4CjBbw7GUJj2dZh95DrNo
         t33iRvb6nny1AD8DIgVHV24iPZmxCgSvIDSfD25AtEqX3rSMf7T7MVLKmKjR5SQV3LSy
         0LHzKc64DiLdB3aqV6jERS9L9BS6umKF8OR13Mi3eLeu2gLtzBr9n+EadO4WpyRd9GEi
         w0VO9Kv09Xik33RIb754nCeRNk15/NAMZzpbrMLyD8iv7yz8IwLyo0MsDz6CODFKp+l3
         zKHg==
X-Gm-Message-State: AOJu0YwexHZPkEYoBZ4u3kTqJJN97DknT5AmavuK737QDBejkwlx+yBg
	ezQjxRLx8vnoxTYTHfzmOZH2ekaIL6v4mgqNmonsEhVTykQNcVkHYiPwo8nVgwvpVrhfRg==
X-Gm-Gg: AfdE7ckcSpF6ZCeSaKxZz+sXpUvg/kG5wRQpx1XcYFWKR24WNOFhKEaj83qpaY0s8YD
	ogn3zheOu8+4BSCIZw2CIZmI0BzNzCrI4Td3oVMDYN31pHYOBaZYfg0ZsgDSf2Gh+/nrSxkIgxo
	cuC6gV9/BuMWbgUn+Bs4lUY1GVJ6auxiQbEy7ZsPU+WSauD/v1PODIGg1E0z6f9pYlLsI/cFcck
	B1zgP7LSiEnsxzguLyaxhxdudUnfd+G2e0Q5tAfdPAm30YRBZSusTxMCPO/8KvF4UthlHXvbS1L
	02xPsxD48ti0bR3dB2IwV3oNrzMFHBqiDWEpVeJLIjeqOBmedHTf9lJHFfhGykFTgEW/NWJsTXc
	y3K79LQowaP21TWSzxeTNViCIXtcUMN1UeTE9+Bu+picavnmyATWdHolYmwpBV2M7Sof9UKHiS8
	PbT/6q/MkRNw==
X-Received: by 2002:a05:6000:2581:b0:45e:e5d1:8a72 with SMTP id ffacd0b85a97d-46add3713f5mr3619511f8f.28.1782209164270;
        Tue, 23 Jun 2026 03:06:04 -0700 (PDT)
Received: from fedora ([212.253.214.17])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-466648c698dsm36936714f8f.16.2026.06.23.03.06.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 03:06:03 -0700 (PDT)
From: Serhat Kumral <serhatkumral1@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	lgs201920130244@gmail.com,
	error27@gmail.com,
	Serhat Kumral <serhatkumral1@gmail.com>
Subject: [PATCH v2 1/2] staging: rtl8723bs: remove multiple blank lines
Date: Tue, 23 Jun 2026 13:05:34 +0300
Message-ID: <20260623100535.5752-1-serhatkumral1@gmail.com>
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
Changes in v2:
 - Dropped the third patch of the v1 series (msleep to usleep_range conversion) 
   based on feedback from Dan Carpenter.

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

