Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 068B63D3D05
	for <linux-staging@lists.linux.dev>; Wed,  3 Jun 2026 12:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780489705; cv=none; b=Fm2cIqR6wdLp/E5HNYXEwiJ5DMa5OhleRjjVoyrrRBN5Wj5gCtAlDmbp2bS+WrEnxXTsnELCLuuHcsRFd9LTjP438JlqlcDzuGao9WwhRhRlv3WwNQ9U5Q8Q/8Fy8EK5rWCyTUda2xCU0/bbVmIwX22JFxYrK1tBSnHtabqZb54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780489705; c=relaxed/simple;
	bh=UTeBI6QGoPmPl2MmCdp28u8qGVMtzm/2Hx+2Y52zySQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=emI/B1UX1DrJP3iGPZRIaY2xVKR7SuKApvie3BYD3mB3KbH3VWYczWiL4Gy+hbqXW1QnmzNKQ7Oef9EpJ87ZgbnvRf+MJyfdM4syzGQFobIje/tky+3YsFU/oLtGXWLnOGTrCpCbQ+TkqIRZt3CxJ3pzShxG69pw7Cz7E4JfuiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MMZ1YJuv; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MMZ1YJuv"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2c0c2c7e0c5so25319545ad.1
        for <linux-staging@lists.linux.dev>; Wed, 03 Jun 2026 05:28:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780489703; x=1781094503; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=g+8EUECEmLbqJRQ27yLo90YIQj1JcoOVZIX3/p3P7sk=;
        b=MMZ1YJuvLhnHHGWFy5tujxI7rCUIJdB99dcw0gIfx2iEM8z51HDq66Yz0+2USxGO5X
         Hv1i9esCxxraZBH8bGpr8oQHFnsn+dzZ66YudB92wE9mNoGHSVN+svXSlu/R5AwdEsFu
         I7uVubVktGTRWY9WvV+xKvN69kYaSJjOVOFaHSsw8C8pUua/dhW7hbTQcR14mUm5zIJ2
         x4SKxCLTKCXKiffC9geDiqwVdYx1RvSUibdcj24iQouFeqPMqYWWLEE6CL0YnqEqDdLj
         WuCcTPhqiUBNvAFiCER3Vs5CD13Qt02LcODx6lZpZy9fEVEIPBtLa5PSmFspxMWhTu9T
         N7nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780489703; x=1781094503;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g+8EUECEmLbqJRQ27yLo90YIQj1JcoOVZIX3/p3P7sk=;
        b=n5qbbI0YdbOhaOKuB/0Gra15dXzqH2iXeDs9RvMPzolZ/i6FmVU7bB3TzlmrLc1Rxo
         SNCq7cI6eqojX2VOT/6wsGo7Nw2vd5g6nNXZHh/SPfoGisIYClG2BCYdBO5X53br+XuL
         UH8W6VcZn/xA92uBKv2rPLKSaULdPu2mqIDsxIdwfT0HSMZ3HAq0zkeuOnG/NEX/DB44
         vmXOaq9JiRr5BjiRGBBIirLJ5j0z3TCVLvTZ6e++QOXTVL9wJ9LaCUrdl4vSONkNsVUN
         3D6FOt4l6WeROJQQ4uNlUfB1aNl5dyMNFyhWTeWkcL80g06QbzDnCNFoYibeICbWy7AR
         GxaQ==
X-Gm-Message-State: AOJu0YwtXpvwsUR0X5yRXuZEeyvvrfL0ZhyvB2ZThC2vj6f/F1RCUqYP
	PCcrtZEwlQZQ2vdakNKkbglIaIZLO7MLmNahQhjk4mSZPCLez14/zRhL
X-Gm-Gg: Acq92OE/Esj+yBFaCSfT+JgGkp/EUYcZpdu16PlOS5h9J9jno8xrzQoADJn321QhlhW
	vDIJuV/Hf6qpQ2wtagRW7jLANe1AI/g1NzE1ptxbTGiXQNg3sIT7BFkb+htXwY2V+94qnknK2lt
	NI22V1MKy97jvtQy3CTEIzX1dh6HD4FLz4C+6mnPsG+J/5h2mqqyjrNMH3W3RfpAyVwebW133Jr
	aGH0SE/TtDVNvj7ktvRe8Pel2OY5YqLzg5EbeVirHgCouzGnlx3nArXBi62e9gLfLZP8WZPSRLY
	w6FuhynjjQE5KjmE4pmu5i4kKIi5QUSAczyYpXxPrsYs7qSsN7T1ByRiH+8HOqz4hHV3Qur4GHC
	OHSR+LqJFKvfpdIssb2TC61QInPY+dRIcdruyT8P8DkqXY2s4L4Mja0UkLkzxQnHfvFSFHUQLXk
	6h6EUsRn9IBjNBBZUcp2KPBJXh37/p4HFUzIjowZ9WktMsVq8cBzvfjL0+wMEO0Q==
X-Received: by 2002:a17:902:e74d:b0:2c0:db23:4c9 with SMTP id d9443c01a7336-2c163fa825dmr32407455ad.20.1780489703200;
        Wed, 03 Jun 2026 05:28:23 -0700 (PDT)
Received: from SGN-LDSENG.tasernet.com ([2405:4800:5cc3:11a:1ac0:4dff:fe8b:4a69])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16609df63sm23746135ad.40.2026.06.03.05.28.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 05:28:22 -0700 (PDT)
From: Cong Nguyen <congnt264@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Cong Nguyen <congnt264@gmail.com>
Subject: [PATCH] staging: rtl8723bs: remove unused network_type_in_use field
Date: Wed,  3 Jun 2026 19:28:06 +0700
Message-Id: <20260603122806.1330145-1-congnt264@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The network_type_in_use member of struct wlan_bssid_ex is write-only:
nothing in the driver ever reads it. It is assigned in three places,
none of which feed anything:

  - collect_bss_info() hard-codes it to Ndis802_11OFDM24 for every
    parsed beacon/probe response, regardless of the network's actual
    band or rates (it is even wrong for 5 GHz APs, which the same
    function explicitly handles).
  - rtw_check_beacon_data() and rtw_update_registrypriv_dev_network()
    derive it from the wireless mode via a switch, but the result is
    likewise never consumed.

The live PHY classification the driver actually acts on is kept in
wlan_network.network_type (the WIRELESS_11x value), so this NDIS-era
field is redundant.

struct wlan_bssid_ex is an internal structure passed by pointer through
the driver command queue; it is never serialized to firmware or onto
the air (the wire data lives in ies[]), so dropping a member is
layout-safe as long as the module is rebuilt as a whole.

enum ndis_802_11_network_type existed only to type this field, so
remove it as well. No functional change.

Signed-off-by: Cong Nguyen <congnt264@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_ap.c         | 15 ---------------
 drivers/staging/rtl8723bs/core/rtw_mlme.c       | 16 ----------------
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c   |  2 --
 drivers/staging/rtl8723bs/include/wlan_bssdef.h | 11 +----------
 4 files changed, 1 insertion(+), 43 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ap.c b/drivers/staging/rtl8723bs/core/rtw_ap.c
index 4b4012411011..9a0bc06df6ad 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ap.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ap.c
@@ -1056,21 +1056,6 @@ int rtw_check_beacon_data(struct adapter *padapter, u8 *pbuf,  int len)
 	if (p && ie_len > 0)
 		pHT_info_ie = p;
 
-	switch (network_type) {
-	case WIRELESS_11B:
-		pbss_network->network_type_in_use = Ndis802_11DS;
-		break;
-	case WIRELESS_11G:
-	case WIRELESS_11BG:
-	case WIRELESS_11G_24N:
-	case WIRELESS_11BG_24N:
-		pbss_network->network_type_in_use = Ndis802_11OFDM24;
-		break;
-	default:
-		pbss_network->network_type_in_use = Ndis802_11OFDM24;
-		break;
-	}
-
 	pmlmepriv->cur_network.network_type = network_type;
 
 	pmlmepriv->htpriv.ht_option = false;
diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index ddfc56f0253d..587246668a0b 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -2127,22 +2127,6 @@ void rtw_update_registrypriv_dev_network(struct adapter *adapter)
 
 	pdev_network->rssi = 0;
 
-	switch (pregistrypriv->wireless_mode) {
-	case WIRELESS_11B:
-		pdev_network->network_type_in_use = (Ndis802_11DS);
-		break;
-	case WIRELESS_11G:
-	case WIRELESS_11BG:
-	case WIRELESS_11_24N:
-	case WIRELESS_11G_24N:
-	case WIRELESS_11BG_24N:
-		pdev_network->network_type_in_use = (Ndis802_11OFDM24);
-		break;
-	default:
-		/*  TODO */
-		break;
-	}
-
 	pdev_network->configuration.ds_config = (pregistrypriv->channel);
 
 	if (cur_network->network.infrastructure_mode == Ndis802_11IBSS)
diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index 5f00fe282d1b..1235d43789c8 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -3971,8 +3971,6 @@ u8 collect_bss_info(struct adapter *padapter, union recv_frame *precv_frame, str
 		memcpy(bssid->supported_rates + i, (p + 2), len);
 	}
 
-	bssid->network_type_in_use = Ndis802_11OFDM24;
-
 	if (bssid->ie_length < 12)
 		return _FAIL;
 
diff --git a/drivers/staging/rtl8723bs/include/wlan_bssdef.h b/drivers/staging/rtl8723bs/include/wlan_bssdef.h
index 812a68394268..f2e1c0834ffc 100644
--- a/drivers/staging/rtl8723bs/include/wlan_bssdef.h
+++ b/drivers/staging/rtl8723bs/include/wlan_bssdef.h
@@ -23,14 +23,6 @@ struct ndis_802_11_ssid {
 	u8  ssid[32];
 };
 
-enum ndis_802_11_network_type {
-	Ndis802_11FH,
-	Ndis802_11DS,
-	Ndis802_11OFDM5,
-	Ndis802_11OFDM24,
-	Ndis802_11NetworkTypeMax    /*  not a real type, defined as an upper bound */
-};
-
 /*
 	FW will only save the channel number in DSConfig.
 	ODI Handler will convert the channel number to freq. number.
@@ -65,7 +57,7 @@ struct ndis_80211_var_ie {
 /* Length is the 4 bytes multiples of the sum of
  * ETH_ALEN + 2 +
  * sizeof (struct ndis_802_11_ssid) + sizeof (u32) +
- * sizeof (long) + sizeof (enum ndis_802_11_network_type) +
+ * sizeof (long) +
  * sizeof (struct ndis_802_11_conf) + sizeof (NDIS_802_11_RATES_EX) + ie_length
  *
  * Except for ie_length, all other fields are fixed length. Therefore, we can
@@ -159,7 +151,6 @@ struct wlan_bssid_ex {
 	struct ndis_802_11_ssid  ssid;
 	u32  privacy;
 	long  rssi;/* in dBM, raw data , get from PHY) */
-	enum ndis_802_11_network_type  network_type_in_use;
 	struct ndis_802_11_conf  configuration;
 	enum ndis_802_11_network_infrastructure  infrastructure_mode;
 	NDIS_802_11_RATES_EX  supported_rates;
-- 
2.25.1

