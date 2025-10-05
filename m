Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AFB72877D4
	for <linux-staging@lists.linux.dev>; Sun,  5 Oct 2025 16:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759680022; cv=none; b=pESpSVFrqhYAelzfkqZeW+7kYJMAWxmbSHXOckiySwNJPKwHic3+/IvDMC/0qQK6epXsDZLUaLehCm6vYul4hPBr6Vp0jkGXSxXGlv5zr8/uWklHbRHWUNegK4E6c45EkEekmx1L4m+YqDvKEDM0RV4GF8SPcylfjjGw2qyHXU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759680022; c=relaxed/simple;
	bh=KtXar7DZM0l2+GL7nQOIJKmMTbYu5UycVXVuLeg1o74=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r+ahvB2VeSGgrPfGgLuKFEjnozwWn4S6wVbeZsR1xwmOgw3DkWo1EGJSqzV9gw/qXT1FZPZdIPUWGwgmZD5GTOAmpGvzCLJt4V6wgBWF3GwTuG+vRqvyI1ZS1t7dKmULxfmvp+NrRnOJU2/n3U0UBm+3wKMdSXOlQ/AlYB3217E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Os/WQ9LO; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Os/WQ9LO"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-782023ca359so3873490b3a.2
        for <linux-staging@lists.linux.dev>; Sun, 05 Oct 2025 09:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759680020; x=1760284820; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aNEHIKGjr5cFoCF/LF+uK+ZZb0/rQaBUls4FLPZu7hw=;
        b=Os/WQ9LO/1FMPc2BXCAbMSkvvqXO2klOkGQzk/l3HlQYMfTDugSH0zvz5uA2bm4HUl
         gL9Q1nzZdbwOgNkE0M6LLYwOrYSbsXLwZ2L4Iiin8jZrDTOP4gdqjupNGzKlzK9mWEom
         ZE/BnPty7WBdtmnrT8ST8mP19P0nuw6l3ictEoW9sVChEVtbnyufjtFZIU1GQqpS29N/
         MyyrzILTpIXRzgjvq8nWy73FOvjRFzHQHVFOZ+wajh1WNcJp1qYds90ovF7irQCi+91f
         7GMmNdK3J1dcndK8PP2n3RdEb+uCocNvXCUiU8virmo12zUsx1oY62prKQxkD5qq+5Wr
         UoTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759680020; x=1760284820;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aNEHIKGjr5cFoCF/LF+uK+ZZb0/rQaBUls4FLPZu7hw=;
        b=kfsL1Gsr8GFhZoeBVJzotyMyqkOaRlI/GnAiUlQhomNqsye7bXlKIRjJfyvGWqqt0J
         nZdE8LjnEff/gqbwhk+WzTPIMjczbbPbaCDjSo70qmqYQY5KTVrolsRi1TBTQHO2XhmR
         pwj3VA5fG5+v0gAjfwLAElmtCg426e8OwgXXNAKH7yyF26CH6A5espI3bR+8YBohBURU
         nYK2l8WtqvdeGanv+XL5caesH1QoaarUHWH+ZQqY2qzrlY4vRQLNNkenAgnRHEQ0n7Kv
         WsbV54RX2KRv4Zfw73xXukw3tGQ27feXnLO0cgKO/oZr9nfZDYCWTkNRp8kpmpyyT4jm
         76cg==
X-Gm-Message-State: AOJu0YzjM7gv7TYD/9Q/3wUgpMjG/vNZPsakzHk5RTy7YcPF2IfAwl4d
	/Zz2xp8mwNKU7NfQgMm7JI74P2P32iVDvIZRN0eE/UkMQRZRtMDGNujsNKI1/1RpM/M=
X-Gm-Gg: ASbGncss5065cFcNSzff9MOEmjIjVVccB7WphHvypneZuZFTUvgqIp/N/QLUC3xlANw
	A+KUgJkHFDrdYInl+bUNm2FptLgX2+70y2hmV00amqDFPzfz5XsACqWl9Yy6G7ja7i0ZyhMTFNm
	NKQDIFbLKMHpaLvyWJhui3jfa4pvs2jOwpKxseFm1lex0Hf+0vfYNBwzMvyNPGwxnL4T+pn1/Ek
	uGTfi8U8QJ1jB4FfgN4Wub8FzIy7XAgy5umVXCL6YyVwJVF2jRzZpY1iUErUGGXm7xOVrgaDeYh
	z96N/U1DPmIEnYKygpq3a/ZQ8FXXzVoB+gZvcGiFEkbv5bPb1QhBdm3FVpD1Efg7DGM5239Vcoe
	eT663+P6GDNCrFPm32yZmn4SaZuKQUwxR4NdK/kj2TM8Om8c2wRK1AoVIC2Ih
X-Google-Smtp-Source: AGHT+IFbMORClUNlmsaxwc+iSakePmH0AYcYLMYlHYqIgx//Yq0c6ae7Wsjba298dMnFASZdc0YnMQ==
X-Received: by 2002:a05:6a00:23d5:b0:782:5ca1:e1c with SMTP id d2e1a72fcca58-78c98cb698fmr11694812b3a.21.1759680020289;
        Sun, 05 Oct 2025 09:00:20 -0700 (PDT)
Received: from Deathstar.anonymous ([172.56.42.228])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78b01fb3d95sm10145241b3a.32.2025.10.05.09.00.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Oct 2025 09:00:19 -0700 (PDT)
From: Rohan Tripathi <trohan2000@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Rohan Tripathi <trohan2000@gmail.com>
Subject: [PATCH 2/4] staging: rtl8723bs: split long comments in rtw_ap.c
Date: Sun,  5 Oct 2025 11:59:18 -0400
Message-ID: <20251005155920.381334-3-trohan2000@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251005155920.381334-1-trohan2000@gmail.com>
References: <20251005155920.381334-1-trohan2000@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch splits overly long comments that exceeded 100 characters
into multiple shorter lines, following kernel coding style guidelines.

This is a coding style cleanup only. No functional changes.

Signed-off-by: Rohan Tripathi <trohan2000@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_ap.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ap.c b/drivers/staging/rtl8723bs/core/rtw_ap.c
index 93ab0015ca89..2c906c1137bf 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ap.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ap.c
@@ -391,7 +391,9 @@ void update_bmc_sta(struct adapter *padapter)
 
 		memset((void *)&psta->sta_stats, 0, sizeof(struct stainfo_stats));
 
-		/* psta->dot118021XPrivacy = _NO_PRIVACY_;//!!! remove it, because it has been set before this. */
+		/* psta->dot118021XPrivacy = _NO_PRIVACY_;
+		 * remove it, because it has been set before this.
+		 */
 
 		/* prepare for add_RATid */
 		supportRateNum = rtw_get_rateset_len((u8 *)&pcur_network->supported_rates);
@@ -655,7 +657,10 @@ void start_bss_network(struct adapter *padapter)
 	cur_ch_offset = HAL_PRIME_CHNL_OFFSET_DONT_CARE;
 
 	/* check if there is wps ie, */
-	/* if there is wpsie in beacon, the hostapd will update beacon twice when stating hostapd, */
+	/* if there is wpsie in beacon,
+	 *the hostapd will update beacon
+	 *twice when stating hostapd,
+	 */
 	/* and at first time the security ie (RSN/WPA IE) will not include in beacon. */
 	if (!rtw_get_wps_ie(pnetwork->ies + _FIXED_IE_LENGTH_,
 			    pnetwork->ie_length - _FIXED_IE_LENGTH_, NULL, NULL))
@@ -835,7 +840,10 @@ int rtw_check_beacon_data(struct adapter *padapter, u8 *pbuf,  int len)
 	memcpy(pbss_network->mac_address, myid(&padapter->eeprompriv), ETH_ALEN);
 
 	/* beacon interval */
-	p = rtw_get_beacon_interval_from_ie(ie);/* ie + 8;	8: TimeStamp, 2: Beacon Interval 2:Capability */
+	p = rtw_get_beacon_interval_from_ie(ie);
+	/* ie + 8;
+	 * 8: TimeStamp, 2: Beacon Interval 2:Capability
+	 */
 	/* pbss_network->configuration.beacon_period = le16_to_cpu(*(unsigned short*)p); */
 	pbss_network->configuration.beacon_period = get_unaligned_le16(p);
 
@@ -1127,7 +1135,8 @@ int rtw_check_beacon_data(struct adapter *padapter, u8 *pbuf,  int len)
 	/*  update AP's sta info */
 	update_ap_info(padapter, psta);
 
-	psta->state |= WIFI_AP_STATE;		/* Aries, add, fix bug of flush_cam_entry at STOP AP mode , 0724 */
+	psta->state |= WIFI_AP_STATE;
+	/* Aries, add, fix bug of flush_cam_entry at STOP AP mode , 0724 */
 	rtw_indicate_connect(padapter);
 
 	pmlmepriv->cur_network.join_res = true;/* for check if already set beacon */
-- 
2.50.1

