Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93C3F72
	for <linux-staging@lists.linux.dev>; Sat, 17 Jul 2021 14:56:56 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id m2so15572045wrq.2
        for <linux-staging@lists.linux.dev>; Sat, 17 Jul 2021 07:56:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PG9JbnafFmHtkZy14fnZvsQtgBLImOnC9bogzsBO68Q=;
        b=RFsI2ll5+UdyKPuWwUqUUwYxkgBONNzratmatXScsj7NBEZQ/hwCmCQkb7eHYMWiOt
         KqieA9MzQejZlS9vuxs5kGBabrygLCJ+5IOF9tByNu9sZdnl2i0Y75KtEUYGxsztlnTL
         7GPzjRSOuxyhdsAulXehqmDUlqd6K1Tl9qge5kBcmfA+zysS9c76GGNw/GqIgbDl5GBp
         ahsSM/uKJUSt0HyDRSeRuVR+b50Pu80zF5yZjbPQ+5WmHbgcXFL0ojGCYb5375PQYNRo
         vr83ERR/vugkTiHYCtN+S7ge5Tm1DgMYgptmuhYLTvW1wfuoLVn5MtQtPgJD1W8wT6F8
         dHhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PG9JbnafFmHtkZy14fnZvsQtgBLImOnC9bogzsBO68Q=;
        b=fO/dG8FachQOgzeb5yCpXqCSLlRXtjP0s2IUky6U+8DffTnIdyOIlTYf2/EWaHrgME
         9qJX7qpMghmaLS3U+nqrMSyVUvqON04bp1D6eAAJLg4A+SVt5EEpw801HzcNG8J5/p/o
         7he5Ead4Z4GPedsL6COqnSbJwjJ7Fobg+UtiRpalb+hxEWmkPg3lUaAvNvuMjk3TCPsm
         9mEdQT6yCSkVxiQUwaZhrKn3muZvZ4jDVmBZ6YnQm8+uwxVhKrA7idG1EUFgUNhzQyDs
         PBvBzXIMly0qqJRkm0eY5NLoytzc2AYFdMqPaDwcAhJeBKjN91h91Nn2cf4dpgu5CH8h
         2bIw==
X-Gm-Message-State: AOAM532+Q4dP2sXLkHAeGAzLL/xYNMBnGDSKtLji/jRanLY68XzKw+QR
	um8EqBhw8/EQAfhpXK/+opA=
X-Google-Smtp-Source: ABdhPJxuLpdmUtg+RbcD7qLaX/bF8MwSIDA6tL7prxf69xpskJmFbx1jaxkfGG67szTPNz/JbVMBSg==
X-Received: by 2002:a05:6000:180f:: with SMTP id m15mr19173087wrh.388.1626533815015;
        Sat, 17 Jul 2021 07:56:55 -0700 (PDT)
Received: from agape ([5.171.72.101])
        by smtp.gmail.com with ESMTPSA id o5sm9895469wms.43.2021.07.17.07.56.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Jul 2021 07:56:54 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@oracle.com,
	hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 01/10] staging: rtl8723bs: add get_channel cfg80211 implementation
Date: Sat, 17 Jul 2021 16:56:42 +0200
Message-Id: <2f00479d8369b82b590291bb0edf27bc3041b0f0.1626533647.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1626533647.git.fabioaiuto83@gmail.com>
References: <cover.1626533647.git.fabioaiuto83@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

add get_channel cfg80211 implementation to let userspace
programs rely on nl80211 protocol to display channel
information.

Old iw dev output:

phy#0
	Interface wlan0
		ifindex 2
		wdev 0x1
		addr 34:c3:d2:73:eb:c7
		ssid Fabio
		type managed
		txpower 12.00 dBm

Fixed output:

phy#0
	Interface wlan0
		ifindex 2
		wdev 0x1
		addr 34:c3:d2:73:eb:c7
		ssid Fabio
		type managed
	new-->	channel 11 (2462 MHz), width: 20 MHz, center1: 2462 Mhz
		txpower 12.00 dBm

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 .../staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 53 ++++++++++++++++++-
 1 file changed, 52 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
index fd747c8d920e..d198d10ec272 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
@@ -2100,7 +2100,58 @@ void rtw_cfg80211_indicate_sta_disassoc(struct adapter *padapter, unsigned char
 	cfg80211_del_sta(ndev, da, GFP_ATOMIC);
 }
 
+static u8 rtw_get_chan_type(struct adapter *adapter)
+{
+	struct mlme_ext_priv *mlme_ext = &adapter->mlmeextpriv;
+
+	switch (mlme_ext->cur_bwmode) {
+	case CHANNEL_WIDTH_20:
+		if (IsSupportedHT(adapter->registrypriv.wireless_mode))
+			return NL80211_CHAN_HT20;
+		else
+			return NL80211_CHAN_NO_HT;
+	case CHANNEL_WIDTH_40:
+		if (mlme_ext->cur_ch_offset == HAL_PRIME_CHNL_OFFSET_UPPER)
+			return NL80211_CHAN_HT40PLUS;
+		else
+			return NL80211_CHAN_HT40MINUS;
+	default:
+		return NL80211_CHAN_HT20;
+	}
 
+	return NL80211_CHAN_HT20;
+}
+
+static int cfg80211_rtw_get_channel(struct wiphy *wiphy, struct wireless_dev *wdev,
+				    struct cfg80211_chan_def *chandef)
+{
+	struct adapter *adapter = wiphy_to_adapter(wiphy);
+	struct registry_priv *registrypriv = &adapter->registrypriv;
+	enum nl80211_channel_type chan_type;
+	struct ieee80211_channel *chan = NULL;
+	int channel;
+	int freq;
+
+	if (!adapter->rtw_wdev)
+		return -ENODEV;
+
+	channel = rtw_get_oper_ch(adapter);
+	if (!channel)
+		return -ENODATA;
+
+	freq = rtw_ieee80211_channel_to_frequency(channel, NL80211_BAND_2GHZ);
+
+	chan = ieee80211_get_channel(adapter->rtw_wdev->wiphy, freq);
+
+	if (registrypriv->ht_enable) {
+		chan_type = rtw_get_chan_type(adapter);
+		cfg80211_chandef_create(chandef, chan, chan_type);
+	} else {
+		cfg80211_chandef_create(chandef, chan, NL80211_CHAN_NO_HT);
+	}
+
+	return 0;
+}
 
 static netdev_tx_t rtw_cfg80211_monitor_if_xmit_entry(struct sk_buff *skb, struct net_device *ndev)
 {
@@ -2838,7 +2889,7 @@ static struct cfg80211_ops rtw_cfg80211_ops = {
 	.set_pmksa = cfg80211_rtw_set_pmksa,
 	.del_pmksa = cfg80211_rtw_del_pmksa,
 	.flush_pmksa = cfg80211_rtw_flush_pmksa,
-
+	.get_channel = cfg80211_rtw_get_channel,
 	.add_virtual_intf = cfg80211_rtw_add_virtual_intf,
 	.del_virtual_intf = cfg80211_rtw_del_virtual_intf,
 
-- 
2.20.1

