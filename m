Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C6545A1F
	for <linux-staging@lists.linux.dev>; Thu, 10 Mar 2022 18:54:12 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id c25so6046249edj.13
        for <linux-staging@lists.linux.dev>; Thu, 10 Mar 2022 10:54:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=+GKPSxW4cNki208y/w00BF5kx4t2q8L46kkM5x45TI0=;
        b=pQbaUEGfrERczS2pCOxY3UNGzPFedNhiJcY3/WcVkc9K/vWUp+52AUDewlsmnzVfXl
         Bs+LdpPiDCAW4mZxmtZZoZVb9WRWjyRy2H+RYI1Imcvzu18o/Qhoe9tSCl5N7XPNMGfW
         Ns+pAEcE3CcIWAMiOGnsQxSUAaB6zELHI9wrcqQrWgd3jKjoyyqrRKOpExB4oDHBrQBi
         WQH9T7SEhNQTDTr2+nKr6qHoPJsc0kTg2JaCJ8RPDNSxrzmqg1AzS1/dGYzeZSQQUh1e
         ZhPTVyCsop0fktpIzAlAkWNN7Nq9LINMHDrRZTHxOeZvN1tNViqeEi2SM2/AulaL96rj
         ShbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=+GKPSxW4cNki208y/w00BF5kx4t2q8L46kkM5x45TI0=;
        b=D/ZtKDPF87LqRXEv1D5ZoF8Q/olUxGT2dCkvFiTmK4NNVWf19G/UeUmM265BiD9wuw
         MvlaiG7cAaUd9FuLaUHjcLgzDzEdwDXKMHAa5hhdRDBYYTU0vEf3PSYI/93jVlSpSET5
         N57Yk75JaMpEo/MdVY2a1XR3sdYJpBzAtA2PKa7iNfGAFeO8ioqIQBaFcWVdaJispEst
         ZiZCS/T2SWkTLBlnn2iOSp7EPh0tWGkqSufgAj2g/fy2QO4BXnjFljkZOVs/Mup9YGSl
         fO1qa6krdAwgJIhSlF9LP6mjnbkPQLwaS8nxrUtLC+nk2zIlNUtba5BWHj0Yy0hNkFTP
         A8Bg==
X-Gm-Message-State: AOAM532+zvQmJRREwTgf3mBIyE2qPjl5u9TFqsOP6C/DVsH6bnZ28/c/
	NpM+BXibM8nHuYY5sCyn1RM=
X-Google-Smtp-Source: ABdhPJz9OrVccP71AZ3hFVy8nO8cpDfHSNQ2etR/VINdEz8fII9jbQc75NKArtCY5YA0yQce/SunAA==
X-Received: by 2002:aa7:c244:0:b0:416:46b:6237 with SMTP id y4-20020aa7c244000000b00416046b6237mr5581924edo.139.1646938450887;
        Thu, 10 Mar 2022 10:54:10 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p57935aa6.dip0.t-ipconnect.de. [87.147.90.166])
        by smtp.gmail.com with ESMTPSA id m24-20020a170906161800b006d420027b63sm2063209ejd.18.2022.03.10.10.54.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Mar 2022 10:54:10 -0800 (PST)
Date: Thu, 10 Mar 2022 19:54:07 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 1/5] staging: vt6656: Remove unused rf_type in channel.c
Message-ID: <99af8605af8d348c6b60553c54149ad55da0e3b6.1646935331.git.philipp.g.hortmann@gmail.com>
References: <cover.1646935331.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1646935331.git.philipp.g.hortmann@gmail.com>

Remove rf_type that supports 5GHz band.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/vt6656/channel.c | 96 ++------------------------------
 1 file changed, 6 insertions(+), 90 deletions(-)

diff --git a/drivers/staging/vt6656/channel.c b/drivers/staging/vt6656/channel.c
index eb2d52e6420b..aca003031995 100644
--- a/drivers/staging/vt6656/channel.c
+++ b/drivers/staging/vt6656/channel.c
@@ -38,17 +38,6 @@ static struct ieee80211_rate vnt_rates_bg[] = {
 	{ .bitrate = 540, .hw_value = RATE_54M },
 };
 
-static struct ieee80211_rate vnt_rates_a[] = {
-	{ .bitrate = 60,  .hw_value = RATE_6M },
-	{ .bitrate = 90,  .hw_value = RATE_9M },
-	{ .bitrate = 120, .hw_value = RATE_12M },
-	{ .bitrate = 180, .hw_value = RATE_18M },
-	{ .bitrate = 240, .hw_value = RATE_24M },
-	{ .bitrate = 360, .hw_value = RATE_36M },
-	{ .bitrate = 480, .hw_value = RATE_48M },
-	{ .bitrate = 540, .hw_value = RATE_54M },
-};
-
 static struct ieee80211_channel vnt_channels_2ghz[] = {
 	{ .center_freq = 2412, .hw_value = 1 },
 	{ .center_freq = 2417, .hw_value = 2 },
@@ -66,50 +55,6 @@ static struct ieee80211_channel vnt_channels_2ghz[] = {
 	{ .center_freq = 2484, .hw_value = 14 }
 };
 
-static struct ieee80211_channel vnt_channels_5ghz[] = {
-	{ .center_freq = 4915, .hw_value = 15 },
-	{ .center_freq = 4920, .hw_value = 16 },
-	{ .center_freq = 4925, .hw_value = 17 },
-	{ .center_freq = 4935, .hw_value = 18 },
-	{ .center_freq = 4940, .hw_value = 19 },
-	{ .center_freq = 4945, .hw_value = 20 },
-	{ .center_freq = 4960, .hw_value = 21 },
-	{ .center_freq = 4980, .hw_value = 22 },
-	{ .center_freq = 5035, .hw_value = 23 },
-	{ .center_freq = 5040, .hw_value = 24 },
-	{ .center_freq = 5045, .hw_value = 25 },
-	{ .center_freq = 5055, .hw_value = 26 },
-	{ .center_freq = 5060, .hw_value = 27 },
-	{ .center_freq = 5080, .hw_value = 28 },
-	{ .center_freq = 5170, .hw_value = 29 },
-	{ .center_freq = 5180, .hw_value = 30 },
-	{ .center_freq = 5190, .hw_value = 31 },
-	{ .center_freq = 5200, .hw_value = 32 },
-	{ .center_freq = 5210, .hw_value = 33 },
-	{ .center_freq = 5220, .hw_value = 34 },
-	{ .center_freq = 5230, .hw_value = 35 },
-	{ .center_freq = 5240, .hw_value = 36 },
-	{ .center_freq = 5260, .hw_value = 37 },
-	{ .center_freq = 5280, .hw_value = 38 },
-	{ .center_freq = 5300, .hw_value = 39 },
-	{ .center_freq = 5320, .hw_value = 40 },
-	{ .center_freq = 5500, .hw_value = 41 },
-	{ .center_freq = 5520, .hw_value = 42 },
-	{ .center_freq = 5540, .hw_value = 43 },
-	{ .center_freq = 5560, .hw_value = 44 },
-	{ .center_freq = 5580, .hw_value = 45 },
-	{ .center_freq = 5600, .hw_value = 46 },
-	{ .center_freq = 5620, .hw_value = 47 },
-	{ .center_freq = 5640, .hw_value = 48 },
-	{ .center_freq = 5660, .hw_value = 49 },
-	{ .center_freq = 5680, .hw_value = 50 },
-	{ .center_freq = 5700, .hw_value = 51 },
-	{ .center_freq = 5745, .hw_value = 52 },
-	{ .center_freq = 5765, .hw_value = 53 },
-	{ .center_freq = 5785, .hw_value = 54 },
-	{ .center_freq = 5805, .hw_value = 55 },
-	{ .center_freq = 5825, .hw_value = 56 }
-};
 
 static struct ieee80211_supported_band vnt_supported_2ghz_band = {
 	.channels = vnt_channels_2ghz,
@@ -118,45 +63,16 @@ static struct ieee80211_supported_band vnt_supported_2ghz_band = {
 	.n_bitrates = ARRAY_SIZE(vnt_rates_bg),
 };
 
-static struct ieee80211_supported_band vnt_supported_5ghz_band = {
-	.channels = vnt_channels_5ghz,
-	.n_channels = ARRAY_SIZE(vnt_channels_5ghz),
-	.bitrates = vnt_rates_a,
-	.n_bitrates = ARRAY_SIZE(vnt_rates_a),
-};
-
 void vnt_init_bands(struct vnt_private *priv)
 {
 	struct ieee80211_channel *ch;
 	int i;
 
-	switch (priv->rf_type) {
-	case RF_AIROHA7230:
-	case RF_VT3342A0:
-	default:
-		ch = vnt_channels_5ghz;
-
-		for (i = 0; i < ARRAY_SIZE(vnt_channels_5ghz); i++) {
-			ch[i].max_power = VNT_RF_MAX_POWER;
-			ch[i].flags = IEEE80211_CHAN_NO_HT40;
-		}
-
-		priv->hw->wiphy->bands[NL80211_BAND_5GHZ] =
-						&vnt_supported_5ghz_band;
-		fallthrough;
-	case RF_AL2230:
-	case RF_AL2230S:
-	case RF_VT3226:
-	case RF_VT3226D0:
-		ch = vnt_channels_2ghz;
-
-		for (i = 0; i < ARRAY_SIZE(vnt_channels_2ghz); i++) {
-			ch[i].max_power = VNT_RF_MAX_POWER;
-			ch[i].flags = IEEE80211_CHAN_NO_HT40;
-		}
-
-		priv->hw->wiphy->bands[NL80211_BAND_2GHZ] =
-						&vnt_supported_2ghz_band;
-		break;
+	ch = vnt_channels_2ghz;
+	for (i = 0; i < ARRAY_SIZE(vnt_channels_2ghz); i++) {
+		ch[i].max_power = VNT_RF_MAX_POWER;
+		ch[i].flags = IEEE80211_CHAN_NO_HT40;
 	}
+	priv->hw->wiphy->bands[NL80211_BAND_2GHZ] =
+					&vnt_supported_2ghz_band;
 }
-- 
2.25.1

