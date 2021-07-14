Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4D6170
	for <linux-staging@lists.linux.dev>; Wed, 14 Jul 2021 15:11:18 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id l17-20020a05600c1d11b029021f84fcaf75so4143117wms.1
        for <linux-staging@lists.linux.dev>; Wed, 14 Jul 2021 08:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PG9JbnafFmHtkZy14fnZvsQtgBLImOnC9bogzsBO68Q=;
        b=UJHtGb+LwT0zy+L/w6Ws5+yY2JPkV63zglgb0IsBrakD8/DQb3oxW+jfRfWRXeV3sA
         XuNeWFY/VynF2aMjgD5Biww9AGapOiJEkICLuGz5j405P5GZu5eOEgDotEoo+DnXl4sP
         n1kbLVclzkqmbyaW06cUJON9PY169JskS/PexQZeC89o0IgwO2MsHYGGct4yE7vq6DW5
         y3ZRkLdKfEpaaxyIbyGUjl390RvQlcbsC+eIOyZjPZngiMiL3GLMB9mGC8bOS8d/p8VY
         NhuvpyP1O1lCl+IdeGFn5NfwOu0VbJsB39Jf5SO/MiQZyPSWBJB13sAnGH4m+NavqlrP
         zczw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PG9JbnafFmHtkZy14fnZvsQtgBLImOnC9bogzsBO68Q=;
        b=NPFTimO0kVcohooItNYaD0UeEYZT9zAOpFiH6PrB3Y969mfprmSi2a86cvkYNpgKeJ
         zW70dFRYCcgvyFn7axnS+uD8OYmkBuCryzIuqihGi/j9QaaSKjulgiJvSr3BNGdgpjji
         E3NKVyZrvZwX4l0JUQViNgTwZgzkLJlnpkrIirKTkNwi9r25W8LfpugibQWk/mBmqCGq
         AQx0qmd0G5PBkbhPcs2wZZz3AtXUINwPB7b5NMULFf8O/+2l1idyvFBtIeY/HECdbNpY
         ddEJINvDYsI+PvRXXzjpVjw7EmnjVu+Tu4IMePMuHBTb2aPxRg1cNMT4Ed82lklYgeLv
         DNVQ==
X-Gm-Message-State: AOAM530lM4zjsQN2W2ILuEytMLvsbL3UwWJ0KBsyV+hxve2h9HwCzRCQ
	dWaH6BFKkYJN/yPS60UXAbG2KR1TWsU=
X-Google-Smtp-Source: ABdhPJycD2OfxuPLYOiMg17H0K8RT5chzlF2QRpfN7l5Bx119sJzeU/7EJNbS6Q57qu5ONnRtiNZfQ==
X-Received: by 2002:a1c:7706:: with SMTP id t6mr11833020wmi.36.1626275477293;
        Wed, 14 Jul 2021 08:11:17 -0700 (PDT)
Received: from agape ([5.171.72.142])
        by smtp.gmail.com with ESMTPSA id c125sm6610982wme.36.2021.07.14.08.11.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jul 2021 08:11:17 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] staging: rtl8723bs: add get_channel cfg80211 implementation
Date: Wed, 14 Jul 2021 17:11:12 +0200
Message-Id: <2f00479d8369b82b590291bb0edf27bc3041b0f0.1626275102.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1626275102.git.fabioaiuto83@gmail.com>
References: <cover.1626275102.git.fabioaiuto83@gmail.com>
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

