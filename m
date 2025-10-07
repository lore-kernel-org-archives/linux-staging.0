Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C3412D7809
	for <linux-staging@lists.linux.dev>; Tue,  7 Oct 2025 09:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759828427; cv=none; b=tH4uvdzZqGQJRXz0aMdF3dh5tC3mjMoC3ISJ6wzOOvNLyBgFcYy+TygSzidy1MUi9SwFuvspKkZICKXI4wGaYFfDvJdDayamvK9W61zb+MaLQYYgSA1L2IfUWoXgvwoiKV+lvuoILhMc7zVkOX56xX49r5c4M4VJ4qTHGLFmOsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759828427; c=relaxed/simple;
	bh=H/UgL4VVfV8j6In49ISHZnc15XoHZHlSo1QR/T+B/r0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cXzfWp9r5G5C4oh4latfAkseDK1BcR2ztwlz+6kLA2ioWHRTFeVd0CdAYEXAGVa6tSTUoyFFv8KmaX3+WGv1EDnj1I0Hb0pbrc8ILFl07cSpJhObsgsm/OxLN7fhwsu0MITd8s2bcddSjwMqTydy/gDk4ffpreN2S03odTt2jVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rq1/CVhn; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rq1/CVhn"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7835321bc98so5745719b3a.2
        for <linux-staging@lists.linux.dev>; Tue, 07 Oct 2025 02:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759828425; x=1760433225; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=opAzYnuvyQ0YBSNx1xW1h2lQ5m+q74fF74UQplgI5Os=;
        b=Rq1/CVhnRciDTiUUw1VxQ4JcdXs59MVNrYTLl0Je6D+fyEm7PrRj7+fER5QTx7o09Y
         3kmbVhGXzdZYXIqwJWj4iC/TK4MwlOsewrynSDdNnLHHVskrD03kn0M/tz5d3DW7S5lJ
         3jfccW0B4lR06NwYUGJiaKUy7ugR4ITeXLz5L0YqOksDRXB6Kbw+G/5Xa6HvTe+Ew2EA
         E8F6CF7j+qUFXiPpqyrS/gybcuza6juAho64/GKQnPB0iQsMMPnbd8IIV0N+L+T/CYTn
         OmxXM4NwfECQSohCbBdgnglMlF+oGZ9IfayGZtXFFVACX7JR1MQVhvubx5rXezrsO1TU
         Omtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759828425; x=1760433225;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=opAzYnuvyQ0YBSNx1xW1h2lQ5m+q74fF74UQplgI5Os=;
        b=AKvnlkOHkO8CwyvX/ASJxZHFEd6PBPVV/PF4fR7eqrN0Cxaf0UCoXqcZkZZkDJncvG
         tPL5gGoRh5csGeeA9l2B2xt3ZSRwXckeIzFS7P+M/z8uaMoeRGPxyhU7ikeQCpTjD9JL
         BybMhCr4NH/5+H7ovYe92cadJA8ONWr3fYueREQ4dZ3O9l+JDy/9K1elK+SHqM2lhTfg
         KljjeY2IfZb1XkourMivfmX6GuZ4Er6KiRLrbVdUXiNSTaaIyW0NZpGFoNIR7JVg9xf7
         LUyX5+L32kQaq0I2HN5/SLsmLEbml5EfekLQYiAyjkTiac89Z+4L5txMAdSe7JWyqGlk
         q0rA==
X-Gm-Message-State: AOJu0YySdB4v3sGWRdcMO91fRIf2JQZQL5djn7WtmkfjE+Jktg3IWQG2
	1EEwweTzlUN7vfrX0zxvd9rqbIHAGULFUmeU9O/Wb6HKltOxzQJ63uQH
X-Gm-Gg: ASbGncvAsuTz2RDtzFeDz9crv4crXYB5piCLlDY3UhZ9A7f6UQ4Mujip2b55Jtl1z40
	YZ2kH+/HRcx7M2xmoUc86h2JJzHxEDmoydP/UbGqA8xOJ61uFXFKi3Wc/1BpyZg5S7UPnf1t0hQ
	qOCaWkpUU86E/t424UMQeYfdRnwwOe1M5bS4wvPjYKtmYz4vvRpwB/eVxmJ9HP9+NokPGLippOU
	oR6jY4NOqC6nBRX1KbidOgqCl1UrmfTARvSzpJTpbsyjDah9w+V0trE9pTnZ57uZJGvmuqRKCff
	V6iGEeglvy2U+a7nRtCmdicmjOkoxQddQdJ11zmulnRdFV8cRAoYYDk6n1hSMJo8EOMf/YASwNx
	238bOzOQQv2qlb536yzEWC1tTLIkLKWZ9UI85ioFi48tocZU6B8e4RzD5s8uC
X-Google-Smtp-Source: AGHT+IH0Xi6QX34wK33uFsruT6XEcZ2GkCDm8OpGSqZvNf7vocGfys3dHjIUDaAFqUilWev4P+Ey/g==
X-Received: by 2002:a05:6a00:3d51:b0:781:2320:5a33 with SMTP id d2e1a72fcca58-78c98d5d5a9mr17484592b3a.9.1759828425410;
        Tue, 07 Oct 2025 02:13:45 -0700 (PDT)
Received: from Deathstar.anonymous ([172.56.42.228])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78b01f9cda9sm14941784b3a.13.2025.10.07.02.13.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 02:13:44 -0700 (PDT)
From: Rohan Tripathi <trohan2000@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Rohan Tripathi <trohan2000@gmail.com>
Subject: [PATCH v3 6/6] staging: rtl8723bs: wrap long comments in rtw_ap.c
Date: Tue,  7 Oct 2025 05:13:03 -0400
Message-ID: <20251007091303.491115-6-trohan2000@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251007091303.491115-1-trohan2000@gmail.com>
References: <20251007091303.491115-1-trohan2000@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This patch fixes instances of comment lines in rtw_ap.c that exceeded the
recommended 80–100 character limit. The affected comments were reflowed
to span multiple lines, each starting with " * " as per kernel coding
style guidelines.

These are coding style cleanups only. No functional changes.

Signed-off-by: Rohan Tripathi <trohan2000@gmail.com>
---
v3: fixed space after *
v2: one comment had a * with no space after it
---
 drivers/staging/rtl8723bs/core/rtw_ap.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ap.c b/drivers/staging/rtl8723bs/core/rtw_ap.c
index 121b9db76711..b12b53a8b3be 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ap.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ap.c
@@ -655,9 +655,12 @@ void start_bss_network(struct adapter *padapter)
 	cur_bwmode = CHANNEL_WIDTH_20;
 	cur_ch_offset = HAL_PRIME_CHNL_OFFSET_DONT_CARE;
 
-	/* check if there is wps ie, */
-	/* if there is wpsie in beacon, the hostapd will update beacon twice when stating hostapd, */
-	/* and at first time the security ie (RSN/WPA IE) will not include in beacon. */
+	/*
+	 * check if there is wps ie,
+	 * if there is wpsie in beacon,
+	 * the hostapd will update beacon twice when stating hostapd,
+	 * and at first time the security ie (RSN/WPA IE) will not include in beacon.
+	 */
 	if (!rtw_get_wps_ie(pnetwork->ies + _FIXED_IE_LENGTH_,
 			    pnetwork->ie_length - _FIXED_IE_LENGTH_, NULL, NULL))
 		pmlmeext->bstart_bss = true;
@@ -835,7 +838,8 @@ int rtw_check_beacon_data(struct adapter *padapter, u8 *pbuf,  int len)
 	memcpy(pbss_network->mac_address, myid(&padapter->eeprompriv), ETH_ALEN);
 
 	/* beacon interval */
-	p = rtw_get_beacon_interval_from_ie(ie);/* ie + 8;	8: TimeStamp, 2: Beacon Interval 2:Capability */
+	/* ie + 8;	8: TimeStamp, 2: Beacon Interval 2:Capability */
+	p = rtw_get_beacon_interval_from_ie(ie);
 	/* pbss_network->configuration.beacon_period = le16_to_cpu(*(unsigned short*)p); */
 	pbss_network->configuration.beacon_period = get_unaligned_le16(p);
 
@@ -1114,7 +1118,7 @@ int rtw_check_beacon_data(struct adapter *padapter, u8 *pbuf,  int len)
 	/*  update AP's sta info */
 	update_ap_info(padapter, psta);
 
-	psta->state |= WIFI_AP_STATE;		/* Aries, add, fix bug of flush_cam_entry at STOP AP mode , 0724 */
+	psta->state |= WIFI_AP_STATE;
 	rtw_indicate_connect(padapter);
 
 	pmlmepriv->cur_network.join_res = true;/* for check if already set beacon */
-- 
2.50.1

