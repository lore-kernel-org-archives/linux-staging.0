Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C3DB33A9E1
	for <linux-staging@lists.linux.dev>; Tue,  4 Aug 2026 06:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785826245; cv=none; b=jKnsAPL2+sZW9PHktERE0wifiOFI6UkDx1TNGv4f3/qhbZI+Hn/7sLvtTCQRCf0U/MEVrs8mRlI0EzwKB98GQtutVWLjQ/4SRnAs5n+Y3NNcty9eVLqXk5tNRUnNFAMHly9l1mgbaVcY5DKMNUoKSP5F4W3o3hltBenQgH+6Q/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785826245; c=relaxed/simple;
	bh=rXyB+1irwhVeWiJAQGSDea7U40ZmahLRgRkJoEcnBvg=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=EFZpAFyMSEqJqzHZxUbyZmz9FiCWpsrn17Yhoy9E1UvTSVogf43w0HR2lZuxHLLsiC9tN4AW+pTufEP3LcIwP1ZksOLxGsIIhWVkJqniJK5HX5QnbkH+1dZZW2r8/YkO+tPjIPBmXUGaZSO2JbRjf5ggXTpPzE+/FO08GpOZ9+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=X2W3wiFk; arc=none smtp.client-ip=220.197.32.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="X2W3wiFk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=yw
	ZH1SamwBdIMammxvAO6M1kziFu9kFWVh6GhfG1RfI=; b=X2W3wiFkkud2RBIccF
	nFuLbKQVuI2odlaUWj1tL6oENFmfFtzpX8NpdXv/OEavi9WOd91fUesfI52nQGL9
	T0PVFuOpwVpYX+hDXdpZQbCpFMAp8b27Q0dJIErWLiiuIH8SkEJOpfdsYYOIkWrQ
	WwkMKwgTLZSTpsYG3tVf9f01g=
Received: from ubuntu (unknown [])
	by gzsmtp1 (Coremail) with UTF8SMTPA id Mc8vCgD3U8Uki3FqbBjcAg--.10644S2;
	Tue, 04 Aug 2026 14:48:05 +0800 (CST)
From: Wu Yifan <nickwu13@yeah.net>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev
Subject: [PATCH] staging: rtl8723bs: remove extra blank lines
Date: Tue,  4 Aug 2026 06:48:04 +0000
Message-ID: <20260804064804.9205-1-nickwu13@yeah.net>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:Mc8vCgD3U8Uki3FqbBjcAg--.10644S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Ww18WF4UGF4Utr4UCF47twb_yoW8WFWrpF
	sYkayDAa1UKF1UAF4kt3y8AFWFka4xG3yIkry3tw1rKasrJr1IqFyFka4Utr1UWrWfAw1D
	KF47tr4fWw13WFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRUUUUUUUUU=
X-CM-SenderInfo: 5qlfy4rxrtq5hhdkh0dhw/1tbiIgXiMWpxiyXHDAAA3K

Remove the redundant blank lines in os_intfs.c to comply with the
kernel coding style. No functional changes.

Signed-off-by: Wu Yifan <nickwu13@yeah.net>
---
 drivers/staging/rtl8723bs/os_dep/os_intfs.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/os_intfs.c b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
index f31196f54..b4f5628e4 100644
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
-- 
2.53.0

