Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C53C2F4A
	for <linux-staging@lists.linux.dev>; Sat,  5 Mar 2022 21:32:06 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id r10so17635232wrp.3
        for <linux-staging@lists.linux.dev>; Sat, 05 Mar 2022 13:32:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=6UZ/MpVxQQe0WGfPdM9RkSy+enCWjxgD5uwVrrDdFnQ=;
        b=WN4G5XTEARjxlnBz+MybGKIAyjG/qtmxcwSd+NhcoamE2IfiCW1l2uBeAMgCWZ7IBz
         0mnFXYOZBTt0AQUP2NfJ3zW3MjtG/CK/36pjENs5a7HmXXgq7fbnJTksZl36LBHXhjlW
         vNOIlBAOTR7ICgy70f/Mj5XzMV0fci59jOd+JeIE1LoPwpIcq7v2E4d1J5sjlyo2fUTq
         lb+NDW53fV/1HNCiuoq2AP3ik3tiuJXNFFWSQjJa7RZOQBDCXqaw7oi9CoDWZe3wiqPu
         zM803FNY2SAahg29Om9jB5C6IsjyuXiKI9fwtfEM3v5Ac95H5yYE56XhSTTtKfM80OSp
         zIPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=6UZ/MpVxQQe0WGfPdM9RkSy+enCWjxgD5uwVrrDdFnQ=;
        b=gnct0LmG0Zxt5SQjDPNmCiHdTjk8DFLTAgg+QHPZcHvFkVULw+pA1ViWuhibt7tuvA
         rKc4DHrlKJkj+QulxczucX0bacgxU6EXB69Ud6+YS+Ndj2zxv9SNXWI/76FDuNbOCUEF
         eQ32p5MWxf8t42lJQRMRqIWysTaWlV8VkuLOjf8AMByQ25S2b9XNzuYey+t+iwA+zZ3d
         nuKRBVghQK33X46gmF0VbgL3gyVYHOAoDqNbTErIrlhA+oJtjjm9Ci+WdgRb/jE5+XHC
         dqPhs8sawCC0hEyBhzi29Rj3fV+CNZndedELFF4sDXOalXSQxGcfuoDsAQLm8FQaWi0F
         M5sQ==
X-Gm-Message-State: AOAM530FD/K5vd2MUjZyJFlOe1/NSSSh3dybCN3dOjRcgkDPNqoKMOvl
	7Woz5Q10sLMjh7LpIOtqIow=
X-Google-Smtp-Source: ABdhPJx/pGAO+jaXXCVJKaEwM+jVLaJ1h0UPyKYKCQ4yRY+mzjgc6//G8DjW6YvUdmI0kak30pYNlw==
X-Received: by 2002:a05:6000:186d:b0:1e8:49fc:69ce with SMTP id d13-20020a056000186d00b001e849fc69cemr3442992wri.80.1646515925361;
        Sat, 05 Mar 2022 13:32:05 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p57935aa6.dip0.t-ipconnect.de. [87.147.90.166])
        by smtp.gmail.com with ESMTPSA id y10-20020adfee0a000000b001f0639001ffsm9662098wrn.9.2022.03.05.13.32.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Mar 2022 13:32:05 -0800 (PST)
Date: Sat, 5 Mar 2022 22:32:03 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] staging: vt6655: Remove unused byRFType in channel.c
Message-ID: <3724590188e72e8f531fe03c2821c5d3d08e2e29.1646512837.git.philipp.g.hortmann@gmail.com>
References: <cover.1646512837.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1646512837.git.philipp.g.hortmann@gmail.com>

Remove byRFType that support 5GHz band.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/vt6655/channel.c | 85 +-------------------------------
 1 file changed, 1 insertion(+), 84 deletions(-)

diff --git a/drivers/staging/vt6655/channel.c b/drivers/staging/vt6655/channel.c
index e37c8e35a45b..abe867814dc8 100644
--- a/drivers/staging/vt6655/channel.c
+++ b/drivers/staging/vt6655/channel.c
@@ -25,17 +25,6 @@ static struct ieee80211_rate vnt_rates_bg[] = {
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
@@ -53,51 +42,6 @@ static struct ieee80211_channel vnt_channels_2ghz[] = {
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
-
 static struct ieee80211_supported_band vnt_supported_2ghz_band = {
 	.channels = vnt_channels_2ghz,
 	.n_channels = ARRAY_SIZE(vnt_channels_2ghz),
@@ -105,13 +49,6 @@ static struct ieee80211_supported_band vnt_supported_2ghz_band = {
 	.n_bitrates = ARRAY_SIZE(vnt_rates_bg),
 };
 
-static struct ieee80211_supported_band vnt_supported_5ghz_band = {
-	.channels = vnt_channels_5ghz,
-	.n_channels = ARRAY_SIZE(vnt_channels_5ghz),
-	.bitrates = vnt_rates_a,
-	.n_bitrates = ARRAY_SIZE(vnt_rates_a),
-};
-
 static void vnt_init_band(struct vnt_private *priv,
 			  struct ieee80211_supported_band *supported_band,
 			  enum nl80211_band band)
@@ -129,23 +66,7 @@ static void vnt_init_band(struct vnt_private *priv,
 
 void vnt_init_bands(struct vnt_private *priv)
 {
-	switch (priv->byRFType) {
-	case RF_AIROHA7230:
-	case RF_UW2452:
-	case RF_NOTHING:
-	default:
-		vnt_init_band(priv, &vnt_supported_5ghz_band,
-			      NL80211_BAND_5GHZ);
-		fallthrough;
-	case RF_RFMD2959:
-	case RF_AIROHA:
-	case RF_AL2230S:
-	case RF_UW2451:
-	case RF_VT3226:
-		vnt_init_band(priv, &vnt_supported_2ghz_band,
-			      NL80211_BAND_2GHZ);
-		break;
-	}
+	vnt_init_band(priv, &vnt_supported_2ghz_band, NL80211_BAND_2GHZ);
 }
 
 /**
@@ -179,10 +100,6 @@ bool set_channel(struct vnt_private *priv, struct ieee80211_channel *ch)
 	 * it is for better TX throughput
 	 */
 
-	if (priv->byRFType == RF_AIROHA7230)
-		RFbAL7230SelectChannelPostProcess(priv, priv->byCurrentCh,
-						  ch->hw_value);
-
 	priv->byCurrentCh = ch->hw_value;
 	ret &= RFbSelectChannel(priv, priv->byRFType,
 				ch->hw_value);
-- 
2.25.1

