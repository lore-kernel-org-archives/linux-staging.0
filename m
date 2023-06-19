Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9776410955
	for <linux-staging@lists.linux.dev>; Mon, 19 Jun 2023 15:10:06 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-51a2661614cso4867006a12.2
        for <linux-staging@lists.linux.dev>; Mon, 19 Jun 2023 08:10:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687187404; x=1689779404;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lQqWKTsadGM4IA7NNaSI9I45VeGk8Yh+tmcH6FyzFNE=;
        b=JHlNw2RyBWoUL/sErR78SZSPa75mtmwBlcmoNP2bL0W7lnYa0ONfKZp6x/l1BbuEer
         9EcXj7B6c/m6LmZ8NwsnvAdPC2hhon2df7Jksh6mpQie0htEKef32nOpk19NN/5GeN7j
         hMp2pqCPGiYrKkYKcKSiiFUhh9z5XR4N9y/zIFmN/y3c3ua4dx4lVPF0f6+42B5yiIrv
         aqS2Gtadueh68UeeKmRcemzyE7fxSMx3ngQkeRl20kUmDq5JhIwwbnG7YxmI0hSbjY4l
         7umb0YWJwMuNeC2CkJS8mofy6ScwCtVN1TIydbXeYuVyZhWiKulydwufiUF9fYFMPwkr
         IRzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687187404; x=1689779404;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lQqWKTsadGM4IA7NNaSI9I45VeGk8Yh+tmcH6FyzFNE=;
        b=Vyiqy5EOS+ri/9RPpVTXLHKbfNsfBKHQoUlAxSM96VB4RT5UncwHzlwkgkgpbXcPIM
         r1+m8aS28HiGY5RYgpmWS21L2uhqUVKO9H7zcGFlnaE0IsWS/y9BGxqYmXM3xUX/utqa
         C3bhAjFjTgopC3FQKE46/RmEMzYDuDPxu+YPiDY1iLNSdH0tK5bw2ZpmKAt3AoJm0EAg
         0h/EmljRcTU67XYOQt4yYYBH958eVWXk8FkjnT8W8m+qvHT6b6J3rAHmUUB7ZLYYXdo3
         smWKJ5UrKr6TWJsWNJS4MKh5NmMkCA9zITxWzFus7KPjgUHlrFAkPA3F8E7NhrTMSbRa
         dIuA==
X-Gm-Message-State: AC+VfDzD2Y4cNR4lbjo1D82ZHlk0gCFv3WQGVPsH4YR7tQ3XWbIquiL5
	eOo3r7FyVQIfwVBhqu5OFwc=
X-Google-Smtp-Source: ACHHUZ5TQwmANF6neAknP5H+AWyJqbwoNg/jyFn+m7PYNFR6ihuE1bqV3XdLZciPiRJQBaskEwaQzw==
X-Received: by 2002:a05:6402:2cd:b0:518:72b8:1fe9 with SMTP id b13-20020a05640202cd00b0051872b81fe9mr6804650edx.25.1687187404670;
        Mon, 19 Jun 2023 08:10:04 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abbd5.dynamic.kabel-deutschland.de. [95.90.187.213])
        by smtp.gmail.com with ESMTPSA id p6-20020a056402044600b0050488d1d376sm13297186edw.0.2023.06.19.08.10.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 08:10:04 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: philipp.g.hortmann@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 1/4] staging: rtl8192e: clean up brace coding style issues
Date: Mon, 19 Jun 2023 17:09:50 +0200
Message-ID: <20230619150953.22484-2-straube.linux@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230619150953.22484-1-straube.linux@gmail.com>
References: <20230619150953.22484-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Clean up brace coding style in if/else statements to improve
readability and clear checkpatch issues.

CHECK: braces {} should be used on all arms of this statement
CHECK: Unbalanced braces around else statement

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 .../staging/rtl8192e/rtl8192e/r8192E_dev.c    |  3 ++-
 .../staging/rtl8192e/rtl8192e/r8192E_phy.c    | 10 +++++---
 drivers/staging/rtl8192e/rtl8192e/rtl_dm.c    |  3 ++-
 drivers/staging/rtl8192e/rtl8192e/rtl_ps.c    |  3 ++-
 drivers/staging/rtl8192e/rtl8192e/rtl_wx.c    |  4 +--
 drivers/staging/rtl8192e/rtllib_softmac.c     | 25 +++++++++++--------
 drivers/staging/rtl8192e/rtllib_softmac_wx.c  |  4 +--
 7 files changed, 30 insertions(+), 22 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
index 7683853e7c46..e5925899402c 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
@@ -765,8 +765,9 @@ void rtl92e_link_change(struct net_device *dev)
 				;
 			else
 				priv->receive_config = reg |= RCR_CBSSID;
-		} else
+		} else {
 			priv->receive_config = reg &= ~RCR_CBSSID;
+		}
 
 		rtl92e_writel(dev, RCR, reg);
 	}
diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
index 7b0da55fa7aa..24180670ea0b 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
@@ -39,8 +39,9 @@ void rtl92e_set_bb_reg(struct net_device *dev, u32 dwRegAddr, u32 dwBitMask,
 		BitShift = _rtl92e_calculate_bit_shift(dwBitMask);
 		NewValue = (OriginalValue & ~dwBitMask) | (dwData << BitShift);
 		rtl92e_writel(dev, dwRegAddr, NewValue);
-	} else
+	} else {
 		rtl92e_writel(dev, dwRegAddr, dwData);
+	}
 }
 
 u32 rtl92e_get_bb_reg(struct net_device *dev, u32 dwRegAddr, u32 dwBitMask)
@@ -163,10 +164,10 @@ void rtl92e_set_rf_reg(struct net_device *dev, enum rf90_radio_path eRFPath,
 
 			_rtl92e_phy_rf_fw_write(dev, eRFPath, RegAddr,
 						New_Value);
-		} else
+		} else {
 			_rtl92e_phy_rf_fw_write(dev, eRFPath, RegAddr, Data);
+		}
 		udelay(200);
-
 	} else {
 		if (BitMask != bMask12Bits) {
 			Original_Value = _rtl92e_phy_rf_read(dev, eRFPath,
@@ -175,8 +176,9 @@ void rtl92e_set_rf_reg(struct net_device *dev, enum rf90_radio_path eRFPath,
 			New_Value = (Original_Value & ~BitMask) | (Data << BitShift);
 
 			_rtl92e_phy_rf_write(dev, eRFPath, RegAddr, New_Value);
-		} else
+		} else {
 			_rtl92e_phy_rf_write(dev, eRFPath, RegAddr, Data);
+		}
 	}
 }
 
diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
index adb6f12c89d8..37c275cac40b 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
@@ -622,8 +622,9 @@ static void _rtl92e_dm_tx_power_tracking_callback_tssi(struct net_device *dev)
 				} else if (priv->rtllib->current_network.channel != 14 && priv->bcck_in_ch14) {
 					priv->bcck_in_ch14 = false;
 					rtl92e_dm_cck_txpower_adjust(dev, priv->bcck_in_ch14);
-				} else
+				} else {
 					rtl92e_dm_cck_txpower_adjust(dev, priv->bcck_in_ch14);
+				}
 			}
 
 			if (priv->cck_present_attn_diff <= -12 ||
diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_ps.c b/drivers/staging/rtl8192e/rtl8192e/rtl_ps.c
index 5ecade840d75..1c49d5da68eb 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_ps.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_ps.c
@@ -219,8 +219,9 @@ void rtl92e_leisure_ps_enter(struct net_device *dev)
 
 			if (priv->rtllib->ps == RTLLIB_PS_DISABLED)
 				_rtl92e_ps_set_mode(dev, RTLLIB_PS_MBCAST | RTLLIB_PS_UNICAST);
-		} else
+		} else {
 			psc->LpsIdleCount++;
+		}
 	}
 }
 
diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c b/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c
index 4436442b56dd..b680757cfcf6 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c
@@ -568,9 +568,9 @@ static int _rtl92e_wx_set_frag(struct net_device *dev,
 	if (priv->hw_radio_off)
 		return 0;
 
-	if (wrqu->frag.disabled)
+	if (wrqu->frag.disabled) {
 		priv->rtllib->fts = DEFAULT_FRAG_THRESHOLD;
-	else {
+	} else {
 		if (wrqu->frag.value < MIN_FRAG_THRESHOLD ||
 		    wrqu->frag.value > MAX_FRAG_THRESHOLD)
 			return -EINVAL;
diff --git a/drivers/staging/rtl8192e/rtllib_softmac.c b/drivers/staging/rtl8192e/rtllib_softmac.c
index 7494c7e6fff6..a47614c837ce 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac.c
@@ -809,8 +809,9 @@ static struct sk_buff *rtllib_probe_resp(struct rtllib_device *ieee,
 		erpinfo_content = 0;
 		if (ieee->current_network.buseprotection)
 			erpinfo_content |= ERP_UseProtection;
-	} else
+	} else {
 		erp_len = 0;
+	}
 
 	crypt = ieee->crypt_info.crypt[ieee->crypt_info.tx_keyidx];
 	encrypt = ieee->host_encrypt && crypt && crypt->ops &&
@@ -1383,9 +1384,9 @@ static void rtllib_associate_step1(struct rtllib_device *ieee, u8 *daddr)
 
 	skb = rtllib_authentication_req(beacon, ieee, 0, daddr);
 
-	if (!skb)
+	if (!skb) {
 		rtllib_associate_abort(ieee);
-	else {
+	} else {
 		ieee->link_state = RTLLIB_ASSOCIATING_AUTHENTICATING;
 		netdev_dbg(ieee->dev, "Sending authentication request\n");
 		softmac_mgmt_xmit(skb, ieee);
@@ -1408,9 +1409,9 @@ static void rtllib_auth_challenge(struct rtllib_device *ieee, u8 *challenge,
 
 	skb = rtllib_authentication_req(beacon, ieee, chlen + 2, beacon->bssid);
 
-	if (!skb)
+	if (!skb) {
 		rtllib_associate_abort(ieee);
-	else {
+	} else {
 		c = skb_put(skb, chlen + 2);
 		*(c++) = MFIE_TYPE_CHALLENGE;
 		*(c++) = chlen;
@@ -1439,9 +1440,9 @@ static void rtllib_associate_step2(struct rtllib_device *ieee)
 
 	ieee->softmac_stats.tx_ass_rq++;
 	skb = rtllib_association_req(beacon, ieee);
-	if (!skb)
+	if (!skb) {
 		rtllib_associate_abort(ieee);
-	else {
+	} else {
 		softmac_mgmt_xmit(skb, ieee);
 		mod_timer(&ieee->associate_timer, jiffies + (HZ / 2));
 	}
@@ -1583,11 +1584,12 @@ inline void rtllib_softmac_new_net(struct rtllib_device *ieee,
 				net->ssid_len = net->hidden_ssid_len;
 				ssidbroad = 1;
 			}
-		} else
+		} else {
 			ssidmatch =
 			   (ieee->current_network.ssid_len == net->ssid_len) &&
 			   (!strncmp(ieee->current_network.ssid, net->ssid,
 			   net->ssid_len));
+		}
 
 		/* if the user set the AP check if match.
 		 * if the network does not broadcast essid we check the
@@ -2536,8 +2538,9 @@ static void rtllib_start_ibss_wq(void *data)
 			ieee->current_network.rates[3] =
 				 RTLLIB_BASIC_RATE_MASK | RTLLIB_CCK_RATE_11MB;
 
-		} else
+		} else {
 			ieee->current_network.rates_len = 0;
+		}
 
 		if (ieee->modulation & RTLLIB_OFDM_MODULATION) {
 			ieee->current_network.rates_ex_len = 8;
@@ -3119,10 +3122,10 @@ void notify_wx_assoc_event(struct rtllib_device *ieee)
 		return;
 
 	wrqu.ap_addr.sa_family = ARPHRD_ETHER;
-	if (ieee->link_state == MAC80211_LINKED)
+	if (ieee->link_state == MAC80211_LINKED) {
 		memcpy(wrqu.ap_addr.sa_data, ieee->current_network.bssid,
 		       ETH_ALEN);
-	else {
+	} else {
 		netdev_info(ieee->dev, "%s(): Tell user space disconnected\n",
 			    __func__);
 		eth_zero_addr(wrqu.ap_addr.sa_data);
diff --git a/drivers/staging/rtl8192e/rtllib_softmac_wx.c b/drivers/staging/rtl8192e/rtllib_softmac_wx.c
index be82f0a655e8..783948fd67ca 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac_wx.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac_wx.c
@@ -231,9 +231,9 @@ int rtllib_wx_set_rts(struct rtllib_device *ieee,
 			     struct iw_request_info *info,
 			     union iwreq_data *wrqu, char *extra)
 {
-	if (wrqu->rts.disabled || !wrqu->rts.fixed)
+	if (wrqu->rts.disabled || !wrqu->rts.fixed) {
 		ieee->rts = DEFAULT_RTS_THRESHOLD;
-	else {
+	} else {
 		if (wrqu->rts.value < MIN_RTS_THRESHOLD ||
 				wrqu->rts.value > MAX_RTS_THRESHOLD)
 			return -EINVAL;
-- 
2.41.0

