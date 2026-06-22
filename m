Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 749963161BF
	for <linux-staging@lists.linux.dev>; Mon, 22 Jun 2026 16:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782145508; cv=none; b=gAeBIpsYPWvGLubH3Bdi1w8v8+YoTjGvjH+9YQNjwkCxGVoCKklQXQYRD9pvo/w2hl3TyVUEzf7mTPW6mTOaAtrxfkT7Z5AtQgHpjVWporZKtZ7cv49lM3DaaE7C0YG3U4ofR4iQpjHp9Qbn/NEJjcCLVyrRmBpeH33FdIUbl7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782145508; c=relaxed/simple;
	bh=kT23+lxjnde8FvcYO6qS/pTthbTdy7e/c6VMWoHgPx0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Kkz86uzvnq4gPGkIa+WYowXLI7dAwFTRNHdvbV06N4EvcHosw5FoNeiUrDGF+hu+FlWDUYNOR9fRSzGgHDZD8Fb9oyKlCHMU7YCadAL37yEZul9BnTNz9jG5IBuSrDKklP/g7x/kh4pnnIst+rqpmiB4KFvFTLEExYV1LO2YCX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sJ4YZjiE; arc=none smtp.client-ip=209.85.221.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sJ4YZjiE"
Received: by mail-wr1-f65.google.com with SMTP id ffacd0b85a97d-45ef779c1c2so3566589f8f.1
        for <linux-staging@lists.linux.dev>; Mon, 22 Jun 2026 09:25:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782145506; x=1782750306; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=W0xzwaD3n16ABP1iHhHW1UsbKHqxtIHiJIXNMhDpIZk=;
        b=sJ4YZjiEZ9oZdQcbrAyqTDuoDhzaqnkn8EaFn8KMT0ZMXgW3U8YRz1SFdbTr/3X6u8
         w0ioZ+RdyuMMqh28VOCENGxNMJaT3jypk4udWILEnkbFI91W4DXKF47hIqzokPOVlnfl
         LMQeyJXS57XMdkmNQq3+XsGShqfi4adAngKENY5hHbXpb+FzNXz1TDOXQ/xkiJHgNPk5
         BaqyCzqHe7xsdjJfA12PtyuhuNEGt7C7VnaWR1qTHSkt6eErDCHyR+Pb5XNQLR2scZXW
         KKPS1nl/lRIWWCtPtIF9t8inSaPF6jReBBSlKqvPlVzQ3jzex21dcoduvjCX8moW3AdN
         Uvgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782145506; x=1782750306;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W0xzwaD3n16ABP1iHhHW1UsbKHqxtIHiJIXNMhDpIZk=;
        b=IJCoB4hsv4FbguzoZIyNSkW+gPO1t3pdmvtnuemIomVnA+7/QOcIW5Heb99HAXcoKE
         Vye7juGSwkjINQH7csIFw8/68lJjNRBmfs8Tutlyr7vEC1KoZALJ61hNdpZs0Q896k1s
         jz14mBk6C5LhC9KsEuC54Hmb8991+Sq35spzP6U+BfjSY9JkDzrDNy4Wvu0mSoUgU4Ug
         APHAP3xTpQ6uvhYUg0yS7JvYbmIFZj4+sDX3O4lTx4qmdEt6obOnAyr7MmpkfDCAMY0O
         gLNzReGCy9gqWJ090czhKAVrdRMa87UMfza68s9igwUtM5TkgPeI3IVTc4G6rhcx+md6
         hOhw==
X-Gm-Message-State: AOJu0Yxl/PzbDPThn3/eJIGETnQ3b57+r+Bhmray70edzTSM+CnjQiUM
	0ouDbi/ImXwBWugmG0qsuay3H2S7Grh/HVGWuW448fQxMUdl3iUKFDlJUQ606HvxWYii3g==
X-Gm-Gg: AfdE7cmlxSaCIkRMG3gXNlS8AAGEoOMTZVkyrRiwRoBaJWjol5TzZmD9jk6j8l+w3CJ
	Zgg/caeItResGkarHTigITBmQTrBZqYaVHP5NlQ2sLFJ+mCgUqYecaI5j59tL/txWWcQr4+Toor
	IHFgX40W74bcv/CmCAC9Nhebv28nV4emvMG6suToemLV+741xvb2+ZTcRgJYHxFfGCodlho57Ey
	6nJO/4QkVFxBMklezNCKXx+ppAmACUk6itC8JkvqgMxQUxwIDHHi66BGoMwYPg6qPt9UIbQRTP0
	JwSwoYPh7q6q3yIIHE7O+SxlVaOjVHWCy+4+VEzjTcvBx0K/YGfeCEqRBUY53b6T+ipCg88aY+5
	hgz4KT+tYwlvwABui+C/SfViuvVI5d7BAp9m6uljG04PD4/I5OdgqQ0VJM0tm+xeudp5n2JexRW
	aL/epfuBRVEQ==
X-Received: by 2002:a05:6000:41cb:b0:46a:6474:83a8 with SMTP id ffacd0b85a97d-46a647488b9mr917641f8f.40.1782145505705;
        Mon, 22 Jun 2026 09:25:05 -0700 (PDT)
Received: from fedora ([212.253.214.17])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46666c579d4sm28551010f8f.28.2026.06.22.09.25.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 09:25:05 -0700 (PDT)
From: Serhat Kumral <serhatkumral1@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	lgs201920130244@gmail.com,
	error27@gmail.com,
	Serhat Kumral <serhatkumral1@gmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>
Subject: [PATCH v2] staging: rtl8723bs: simplify rtw_spt_band_alloc
Date: Mon, 22 Jun 2026 19:09:47 +0300
Message-ID: <20260622160947.7970-1-serhatkumral1@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function only supports NL80211_BAND_2GHZ and falls through to
exit for any other band. Replace the n_channels and n_bitrates local
variables with the compile-time constants RTW_2G_CHANNELS_NUM and
RTW_G_RATES_NUM directly.

Use simple addition in kzalloc() instead of chained size_add() calls,
since the sizes are derived from compile-time constants and cannot
overflow. Replace the intermediate alloc_sz variable accordingly.

Remove the redundant second band check before the init calls, as
the early exit at the top of the function guarantees that only the
2GHz case can reach that point.

No functional change intended.

Suggested-by: Dan Carpenter <dan.carpenter@linaro.org>

Signed-off-by: Serhat Kumral <serhatkumral1@gmail.com>
---
 .../staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 31 +++++++------------
 1 file changed, 12 insertions(+), 19 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
index 1484336d7..dfc44ebb7 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
@@ -110,33 +110,26 @@ static struct ieee80211_supported_band *rtw_spt_band_alloc(
 	)
 {
 	struct ieee80211_supported_band *spt_band = NULL;
-	int n_channels, n_bitrates;
-	size_t alloc_sz;
+	size_t channels_sz, bitrate_size;
 
-	if (band == NL80211_BAND_2GHZ) {
-		n_channels = RTW_2G_CHANNELS_NUM;
-		n_bitrates = RTW_G_RATES_NUM;
-	} else {
+	if (band != NL80211_BAND_2GHZ)
 		goto exit;
-	}
 
-	alloc_sz = sizeof(*spt_band);
-	alloc_sz = size_add(alloc_sz, array_size(n_channels, sizeof(struct ieee80211_channel)));
-	alloc_sz = size_add(alloc_sz, array_size(n_bitrates, sizeof(struct ieee80211_rate)));
-	spt_band = kzalloc(alloc_sz, GFP_KERNEL);
+	channels_sz = array_size(RTW_2G_CHANNELS_NUM, sizeof(struct ieee80211_channel));
+	bitrate_size = array_size(RTW_G_RATES_NUM, sizeof(struct ieee80211_rate));
+
+	spt_band = kzalloc(sizeof(*spt_band) + channels_sz + bitrate_size, GFP_KERNEL);
 	if (!spt_band)
 		goto exit;
 
-	spt_band->channels = (struct ieee80211_channel *)(((u8 *)spt_band) + sizeof(struct ieee80211_supported_band));
-	spt_band->bitrates = (struct ieee80211_rate *)(((u8 *)spt_band->channels) + sizeof(struct ieee80211_channel) * n_channels);
+	spt_band->channels = (void *)spt_band + sizeof(*spt_band);
+	spt_band->bitrates = (void *)spt_band + sizeof(*spt_band) + channels_sz;
 	spt_band->band = band;
-	spt_band->n_channels = n_channels;
-	spt_band->n_bitrates = n_bitrates;
+	spt_band->n_channels = RTW_2G_CHANNELS_NUM;
+	spt_band->n_bitrates = RTW_G_RATES_NUM;
 
-	if (band == NL80211_BAND_2GHZ) {
-		rtw_2g_channels_init(spt_band->channels);
-		rtw_2g_rates_init(spt_band->bitrates);
-	}
+	rtw_2g_channels_init(spt_band->channels);
+	rtw_2g_rates_init(spt_band->bitrates);
 
 	/* spt_band.ht_cap */
 
-- 
2.54.0

