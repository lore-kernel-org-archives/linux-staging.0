Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8864663C6
	for <linux-staging@lists.linux.dev>; Thu,  8 Jun 2023 06:52:38 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5164c5bd369so58147a12.1
        for <linux-staging@lists.linux.dev>; Wed, 07 Jun 2023 23:52:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686207157; x=1688799157;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TQKW2CDMPBC9N1g2gyQZv/XRpd7ea6cV/0jZn5MOSfA=;
        b=eaxc9/pqjJc6kK1znYKJlr/yH7bGWBt1ysV7mIagQF/Hz+gCfmlLOp5OocMMBG/dfD
         vPW41/fiLorEDUeSh1J2cmBvF6udX1SqsD9QAwG0PKo4QkybO2Q0HzycLMtn+uA2/Jzg
         mdVzGdIvK1CLrkwUp+bIoTwRgCo+jGYHCMF8bo+G8wTvZTDwzQClDcGmh+2q9DgmryUZ
         wLcVsJHqMQA4IsBOh5ufv3xwoddzXta0zypK8jp7OlSnLxcM3lzRbZ4JPNxUTlklis9D
         sbsdxOc18C1NGcCh4eynCpA0D+XC+gqNEQ/bl2dRnTjfjBX8S2X7xWqsVUBGrAEitcg/
         ZbIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686207157; x=1688799157;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TQKW2CDMPBC9N1g2gyQZv/XRpd7ea6cV/0jZn5MOSfA=;
        b=H6QPMnZsw/0mooN2hJcK90sacNmPKu0Gv2X669BHdDIzEEhXL8B1TqNT2+0LMMT/uE
         mEPCn/VgMGQVsqlEXgt+ubkOz0KthmbWb7p938d/yMnlwDacxdLJIDPP+OCV7RSPiDhp
         +tNuxZn1m/0WBX4Z7ptWRwN/YsLAka30kuSKbEyS2Apx1kbZrH0JF+UShiZnkufemhjz
         e5mrHtmNU0AHxkkVFd2vrQ9U0ty3LwvvPzJnu0b4uQhx6pA2711oShy7wVQbwgUGM3uO
         9a1vxzbJifzmQMx9XGQM2/94TCHfBPFWUDlQdLBIbmtKDvBURXoKtobgYBTVan9AoKaI
         vrKg==
X-Gm-Message-State: AC+VfDwoKxSsY6ODpwkQn9hFBtym6DJG7Gql/tCICGLUZcXjgQvZhW8L
	U421yLN/KeZ0058DNrKMo6UglU1zAho=
X-Google-Smtp-Source: ACHHUZ7Xiaird4DXuqMeoKDCwKMqKPOplVzbQVoSl1A/rYo8+gtQcAZyOYekDg1rL5Ph9GS3SdWjdQ==
X-Received: by 2002:a05:6402:2810:b0:516:a044:b6d8 with SMTP id h16-20020a056402281000b00516a044b6d8mr4205357ede.4.1686207156787;
        Wed, 07 Jun 2023 23:52:36 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p57ba2e0b.dip0.t-ipconnect.de. [87.186.46.11])
        by smtp.gmail.com with ESMTPSA id g16-20020aa7d1d0000000b0050bc4600d38sm182287edp.79.2023.06.07.23.52.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jun 2023 23:52:36 -0700 (PDT)
Date: Thu, 8 Jun 2023 08:52:34 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] staging: rtl8192e: Use standard api to calculate channel
 to frequency
Message-ID: <c3a94a403d04ba810cffff8afa734a94a218a4e9.1686166624.git.philipp.g.hortmann@gmail.com>
References: <cover.1686166624.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1686166624.git.philipp.g.hortmann@gmail.com>

Use ieee80211_channel_to_freq_khz() to calculate channel to frequency to
omit proprietary code.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/rtl_wx.c   |  6 ++++--
 drivers/staging/rtl8192e/rtllib.h            |  2 --
 drivers/staging/rtl8192e/rtllib_softmac_wx.c | 13 ++-----------
 3 files changed, 6 insertions(+), 15 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c b/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c
index 8b656980ee25..3346c4d72c3e 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c
@@ -342,9 +342,11 @@ static int _rtl92e_wx_get_range(struct net_device *dev,
 
 	for (i = 0, val = 0; i < 14; i++) {
 		if ((priv->rtllib->active_channel_map)[i + 1]) {
+			s32 freq_khz;
+
 			range->freq[val].i = i + 1;
-			range->freq[val].m = rtllib_wlan_frequencies[i] *
-					     100000;
+			freq_khz = ieee80211_channel_to_freq_khz(i + 1, NL80211_BAND_2GHZ);
+			range->freq[val].m = freq_khz * 100;
 			range->freq[val].e = 1;
 			val++;
 		}
diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index cdd7fdc5befe..87e9169214f6 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -2049,8 +2049,6 @@ void TsStartAddBaProcess(struct rtllib_device *ieee,
 void RemovePeerTS(struct rtllib_device *ieee, u8 *Addr);
 void RemoveAllTS(struct rtllib_device *ieee);
 
-extern const long rtllib_wlan_frequencies[];
-
 static inline const char *escape_essid(const char *essid, u8 essid_len)
 {
 	static char escaped[IW_ESSID_MAX_SIZE * 2 + 1];
diff --git a/drivers/staging/rtl8192e/rtllib_softmac_wx.c b/drivers/staging/rtl8192e/rtllib_softmac_wx.c
index 6fd2e94d5f8a..d6d90e6ba2d3 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac_wx.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac_wx.c
@@ -15,15 +15,6 @@
 
 #include "rtllib.h"
 #include "dot11d.h"
-/* FIXME: add A freqs */
-
-const long rtllib_wlan_frequencies[] = {
-	2412, 2417, 2422, 2427,
-	2432, 2437, 2442, 2447,
-	2452, 2457, 2462, 2467,
-	2472, 2484
-};
-EXPORT_SYMBOL(rtllib_wlan_frequencies);
 
 int rtllib_wx_set_freq(struct rtllib_device *ieee, struct iw_request_info *a,
 			     union iwreq_data *wrqu, char *b)
@@ -83,8 +74,8 @@ int rtllib_wx_get_freq(struct rtllib_device *ieee,
 
 	if (ieee->current_network.channel == 0)
 		return -1;
-	fwrq->m = rtllib_wlan_frequencies[ieee->current_network.channel - 1] *
-		  100000;
+	fwrq->m = ieee80211_channel_to_freq_khz(ieee->current_network.channel,
+						NL80211_BAND_2GHZ) * 100;
 	fwrq->e = 1;
 	return 0;
 }
-- 
2.40.1

