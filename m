Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 633AB1DEFE9
	for <linux-staging@lists.linux.dev>; Wed,  3 Dec 2025 01:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764725566; cv=none; b=TkMqcBjJaMx+DB4C7Px0u7XHWyRnO6I9QTdc2glcfpKB4x5DMVJRbdlmcpUY/zrfKgUwW9+KzLOr3RmxibnvediEHp7tPvyVJB9LaGUDBDzZ/FmQpfHnx4jj6EUIuwDzn+M7QtxBu9fqwsbx1TAc5DnDEW1Pt2EcmsFRwXiVMGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764725566; c=relaxed/simple;
	bh=HdqN0TjGIINEFptm7Nvl1znQRgZDb6swtYIHkRRlvIY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KKVgy92+ZVoD1GkBj4UgnWumNgJbvi3O08DtNwHvmXA4lE0QVumKXdBavZ2s1AZlTXJE9ED500MsEYVxsSL8gj+uzGrjyWZsUpeWZAFgnoioXtKl/z6NRnDhgJ+0j+JkuKSfwatpoNJu3O9IYf4pxGkOX48G36Tmcni6r/5Dros=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h2IwD8EL; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h2IwD8EL"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-477a219dbcaso56289645e9.3
        for <linux-staging@lists.linux.dev>; Tue, 02 Dec 2025 17:32:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764725563; x=1765330363; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eTOcccqrFLWwThaWdKzVQ7M4eJzuu19XG8wwoiIcr+k=;
        b=h2IwD8EL9uDyGu4rLMS6gkd69H/WiIWahUatiJreb6km3uZfPfoMvRuPLMCO+ITjl+
         loob9gEgEitb4E3N3TDO7thlUJ2EvCKSCqcD8byo0ejYFMMG6/v7LssS/zUeQVTGbdAX
         yjEdDjrqZKW8XHwsacFmHYe6QYa2kNK/LL0FTZlnMPLAcr1zsUX2cJy8yO1VXgdQzC2Y
         12QHdIheW1oOdmVIZfeDUz5PV7uokJhxgpFTqdfs8HpTVHwVNnuQLvTT6v7mNX4Uj92u
         I/4q0vaOfnMB+J0YiohmCKrX1tMZd11OhQqOedVryV0Y6qNbHC6n3t3aIe6YJjNqcjub
         MbWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764725563; x=1765330363;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eTOcccqrFLWwThaWdKzVQ7M4eJzuu19XG8wwoiIcr+k=;
        b=KBlaF1EzPPjgaLzNE8J4s/gQW1lTdCo9ZGugTRzlQHp9+E9uRFEJpND71r3ktXCHGr
         G5syLtkR3icsU6wG9EB/OZTzRTWQDN6Y0rSIJTKd+euAOvtVWZJTN4x8IondbbJSN+Fr
         1gjBpYBRdlAV71a1gQUPpYxbCEJstiFYkbcHipZ2AINfNEuleUrVMVYwvptb+4QnKPAm
         LpJuAtEn1iRtMDF14rrCUGFaCCeMmgX1hkmTY/rSUp0/3D2QEPLE9ZfI+fNdKNMwYa05
         WlQwY5P8G9oALwqUyPSLmw9HKZaHQKihCX8K44mImNgJqZzxGc7hIf7PGrtl3+dtNubN
         t33g==
X-Gm-Message-State: AOJu0Yzrc3n8MdaWHKAbvWpJyFbikk4tz9UpFgvDya0JLMkfZPgQ9EzW
	lKw/cpK71fPwIzjlTS0pXnYcpl+dY3jbG+4VIpGC8LiYKO9qv8EXufX2
X-Gm-Gg: ASbGnctbcVP0Ddzwa9xRH8B/NbOy33AaFd2b8M9HA0aVLcs0aRrLwh35EQegN0GvbIC
	+KMRMmCACFdYy+NQp+ReDBwEWs/yXerCh7v7qIflC9c+/QpcAc5UWp3bRjsR2Uk12XEOHhhQvLi
	QXztFRp2KF0+hLoWF7lZ40qz8z8EA6anGgJHjK6hwVTS+ok6Y772o6qktIisL7/W90yAFvWjvVY
	ndzDTCmZjd/CQmUU6QW8VLwQljyuCScP4TJ41Lte1loVENAro2vGUo9CJbQ2rlL0ezLPaf0vB0x
	mjAP9LHSI8uWfGLLVqrkYrNDkhMreMU+BvrvGfM+HHQ64tDqoM5V9wXkwhdoRoc0JFVQyfBaPsT
	6/sYnVXkfTIoNzKATTQv1X5ze5z87eq6VTbhl//JDql/RXlBLT88cJEs4OEA27oa7JhGtwgqeU3
	iHRicEFygw6bkzfuTK
X-Google-Smtp-Source: AGHT+IEET8MMX8Xhn2CMl4tEK1KqNLyGoioso3/ZgB1ZWKgRfMhon8oV9N2dNt1Y7AkGknU75WSwKQ==
X-Received: by 2002:a05:600c:19ca:b0:477:557b:691d with SMTP id 5b1f17b1804b1-4792af3d28amr3978995e9.25.1764725562735;
        Tue, 02 Dec 2025 17:32:42 -0800 (PST)
Received: from felix.localdomain ([169.224.5.245])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42e1ca1a310sm38151131f8f.26.2025.12.02.17.32.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Dec 2025 17:32:41 -0800 (PST)
From: duccdev <duccybaka@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	duccdev <duccybaka@gmail.com>
Subject: [PATCH] staging: rtl8723bs: clean up comments in rtw_ap.c
Date: Wed,  3 Dec 2025 04:32:29 +0300
Message-ID: <20251203013229.696285-1-duccybaka@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixed 4 multi-line comments to follow kernel coding style.
Improved clarity and fixed overly long lines reported by checkpatch.

Signed-off-by: duccdev <duccybaka@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_ap.c | 25 ++++++++++++++++++-------
 1 file changed, 18 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ap.c b/drivers/staging/rtl8723bs/core/rtw_ap.c
index 0908f2234f67..210fa5388a01 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ap.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ap.c
@@ -391,7 +391,7 @@ void update_bmc_sta(struct adapter *padapter)
 
 		memset((void *)&psta->sta_stats, 0, sizeof(struct stainfo_stats));
 
-		/* psta->dot118021XPrivacy = _NO_PRIVACY_;//!!! remove it, because it has been set before this. */
+		/* psta->dot118021XPrivacy is already set earlier; do not reset it here. */
 
 		/* prepare for add_RATid */
 		supportRateNum = rtw_get_rateset_len((u8 *)&pcur_network->supported_rates);
@@ -658,9 +658,11 @@ void start_bss_network(struct adapter *padapter)
 	cur_bwmode = CHANNEL_WIDTH_20;
 	cur_ch_offset = HAL_PRIME_CHNL_OFFSET_DONT_CARE;
 
-	/* check if there is wps ie, */
-	/* if there is wpsie in beacon, the hostapd will update beacon twice when stating hostapd, */
-	/* and at first time the security ie (RSN/WPA IE) will not include in beacon. */
+	/*
+	 * Check for a WPS IE. When WPS information is present in the beacon,
+	 * hostapd updates the beacon twice during startup. On the first update,
+	 * the security IE (RSN/WPA) may not yet be included.
+	 */
 	if (!rtw_get_wps_ie(pnetwork->ies + _FIXED_IE_LENGTH_,
 			    pnetwork->ie_length - _FIXED_IE_LENGTH_, NULL, NULL))
 		pmlmeext->bstart_bss = true;
@@ -841,8 +843,16 @@ int rtw_check_beacon_data(struct adapter *padapter, u8 *pbuf,  int len)
 	memcpy(pbss_network->mac_address, myid(&padapter->eeprompriv), ETH_ALEN);
 
 	/* beacon interval */
-	p = rtw_get_beacon_interval_from_ie(ie);/* ie + 8;	8: TimeStamp, 2: Beacon Interval 2:Capability */
-	/* pbss_network->configuration.beacon_period = le16_to_cpu(*(unsigned short*)p); */
+	/*
+	 * In the beacon IE, the layout starts with:
+	 *   - 8 bytes: timestamp
+	 *   - 2 bytes: beacon interval
+	 *   - 2 bytes: capability info
+	 * rtw_get_beacon_interval_from_ie() extracts the beacon interval field.
+	 */
+	p = rtw_get_beacon_interval_from_ie(ie);
+
+	/* pbss_network->configuration.beacon_period = le16_to_cpu(*(unsigned short *)p); */
 	pbss_network->configuration.beacon_period = get_unaligned_le16(p);
 
 	/* capability */
@@ -1147,7 +1157,8 @@ int rtw_check_beacon_data(struct adapter *padapter, u8 *pbuf,  int len)
 	/*  update AP's sta info */
 	update_ap_info(padapter, psta);
 
-	psta->state |= WIFI_AP_STATE;		/* Aries, add, fix bug of flush_cam_entry at STOP AP mode , 0724 */
+	/* Aries, add, fix bug of flush_cam_entry at STOP AP mode, 0724 */
+	psta->state |= WIFI_AP_STATE;
 	rtw_indicate_connect(padapter);
 
 	pmlmepriv->cur_network.join_res = true;/* for check if already set beacon */
-- 
2.52.0

