Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2593928DEE4
	for <linux-staging@lists.linux.dev>; Tue, 22 Jul 2025 07:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753170091; cv=none; b=pnskRdyZQHjPTDxRrKA4F8uk/1hcpXlHk04Hd2wSzAkKhgiljj0MCfrYMUKmVbJWto3dfpPUmq1UIIUboPOhlfXJwF3DkqoO7EhXwBotRcDR8lhINa4rsdh1fFbIJTNxgurWgeS7x9bhBGKr2vxwbd185feYEhRGflEYZjHt/iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753170091; c=relaxed/simple;
	bh=+903zGZvnJBOZvgakEzqbUjZ8qRAgFxUG+gPiyWd7yU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Wslq/HJBgIeTrB8K2cVOKhEz341VH7HHjBbibJ9OdV9ZkZHtWa4mZ6tewR33LCkd8qUY04PcuMNKIchLF/Oan+/juBZid11/b/TVPhGbaRUX6LpOOE+97AulGGI+iO+kAdP81qXiAui2Y2XlGnXmSG/SO9yiO69PRhyWpdGneQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PvJN+x4+; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PvJN+x4+"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ae0d758c3a2so845641466b.2
        for <linux-staging@lists.linux.dev>; Tue, 22 Jul 2025 00:41:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753170087; x=1753774887; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pTRKXgPUhQNMg5YfDVPQLtFMcQsgKomN7QTt2xbWovk=;
        b=PvJN+x4+zhkIQHX1zSdu/p0CZdOxL5dN5mKbAMb5YpezMIhIoBBNB84oZghSkR0U0q
         eMbPv9GgBWp6rJ36efFBlwrqZxQ2bLuYfRLCY9lFxhVv1JKD/IwpOhK/w2Z52w2D+AQk
         QahELspSUyaR5GjB/LPC3K2kX70ZCsnWm15n24KBTnvTri8PLtS/6/Kq3JjVi3jQD/7Q
         eJdf1yvyLhBF1Tt/7dcbGifLSaJa+/5IFEzMUQyRepEksWEV6h7SAFIQOiVX4kVrtZHT
         t1uPrrXHpLM2aVhAXJopliqL0KXXpRfmyCejc78XXEDDJeItjZdNPC6pMha40vEq597+
         JK8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753170087; x=1753774887;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pTRKXgPUhQNMg5YfDVPQLtFMcQsgKomN7QTt2xbWovk=;
        b=JfTJRiUBTn8/IHp1Im/yzod5f6eoWir4MPM4j1YrWCsPR0BuVQi9YQ3SObp9DBtOM/
         42JUke4kbw6/7U25iE3t03X/vH+55I+/WMNwVJPrOaKug4vWxWGMKxdnK4xqbVOhqnDJ
         RQJdre2L5MtroC4OdKzrk4hBc9q3RPQSheoM5uNxcw/SPClsvBBAhqWIK4rLi6JHR+uj
         2QjfId75AMYPt34VALAh4mzHxksS3ClgTkaG1W6lJODNIm9HlRieWEF+XLga4UVXqwcy
         ro5yLqGesmHoNFjra7k9ynlSdPHO+jdrBhLnNlQWAqu2d+aWehdhv0MItYeOlC+Q4BD2
         +kcw==
X-Forwarded-Encrypted: i=1; AJvYcCUwNZ5Fec+oQro6qzpUYO0wUUY9je5lGthRnXC1c4K14DTNbKlsBZGyIw2pzYuL4vGvZR+kafaylmfz6KRC@lists.linux.dev
X-Gm-Message-State: AOJu0YwIMDz6DDQgiJS9FoY2z6VQxYrRHebc8bP0hnyK+ao7ooVf49fE
	l01Bzp3+Z1J0GfvX2mEJjes4mB1U5pcI4PeucF8BYQFoJfgpBJl4H/mp
X-Gm-Gg: ASbGncscrwOr/DynPN+mxafVXTWbAZUGtiadp4yziaVT56HEnn775uYPHDmHovM2ZbI
	F49qEyXPK0Qcd2aC82wDt1/eUmtcPdk9JLw6hxeJ3MsqTIcEUTSTE1GeAXQ3DfvYyf+xlRiI7vZ
	+6wXnGhBpfxXNL761ygWQzQCh8MAiqHciAtNh1/RfCtDx+7+sBKpd6hVL9QG6Rt5AfJX7rAopbJ
	hbx7SCoZGsvL+lGkHJgDkRoRpRvxzoUxBhMGcnQU3Y8JrAqAseqkHwkY0vptSSZLHAAVUYXWtL8
	s6pTD08M/2vWLR9LbuFmFlX1liV1f5iB/NCtC+giKEKT30ySC9v5J82f7b99RO4Ohr7MwJvyRPt
	3kT96FckPzahx90Zeknyk3dg=
X-Google-Smtp-Source: AGHT+IHeslD+1Ncf3fbtZY6D7RH6MggfPObIE7haUNbAba/ZYty9LnEejM4kM7jKmSr0+XKGEvx93A==
X-Received: by 2002:a17:907:9625:b0:ae3:7022:b210 with SMTP id a640c23a62f3a-ae9c99812e3mr2376087566b.12.1753170087262;
        Tue, 22 Jul 2025 00:41:27 -0700 (PDT)
Received: from tumbleweed ([95.90.185.15])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aec6c79d6c6sm821224666b.32.2025.07.22.00.41.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jul 2025 00:41:26 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 5/7] staging: rtl8723bs: hw_var_port_switch is empty
Date: Tue, 22 Jul 2025 09:41:13 +0200
Message-ID: <20250722074115.35044-6-straube.linux@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250722074115.35044-1-straube.linux@gmail.com>
References: <20250722074115.35044-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function hw_var_port_switch is empty, remove it.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/rtl8723bs/hal/hal_com.c     | 7 -------
 drivers/staging/rtl8723bs/include/hal_com.h | 2 --
 2 files changed, 9 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_com.c b/drivers/staging/rtl8723bs/hal/hal_com.c
index d91e2461fd7e..07e9d3423651 100644
--- a/drivers/staging/rtl8723bs/hal/hal_com.c
+++ b/drivers/staging/rtl8723bs/hal/hal_com.c
@@ -569,19 +569,12 @@ void rtw_hal_update_sta_rate_mask(struct adapter *padapter, struct sta_info *pst
 	psta->init_rate = get_highest_rate_idx(tx_ra_bitmap)&0x3f;
 }
 
-void hw_var_port_switch(struct adapter *adapter)
-{
-}
-
 void SetHwReg(struct adapter *adapter, u8 variable, u8 *val)
 {
 	struct hal_com_data *hal_data = GET_HAL_DATA(adapter);
 	struct dm_odm_t *odm = &(hal_data->odmpriv);
 
 	switch (variable) {
-	case HW_VAR_PORT_SWITCH:
-		hw_var_port_switch(adapter);
-		break;
 	case HW_VAR_INIT_RTS_RATE:
 		rtw_warn_on(1);
 		break;
diff --git a/drivers/staging/rtl8723bs/include/hal_com.h b/drivers/staging/rtl8723bs/include/hal_com.h
index 258a74076dd9..7ea9ee2b3975 100644
--- a/drivers/staging/rtl8723bs/include/hal_com.h
+++ b/drivers/staging/rtl8723bs/include/hal_com.h
@@ -134,8 +134,6 @@ s32 c2h_evt_read_88xx(struct adapter *adapter, u8 *buf);
 u8 rtw_get_mgntframe_raid(struct adapter *adapter, unsigned char network_type);
 void rtw_hal_update_sta_rate_mask(struct adapter *padapter, struct sta_info *psta);
 
-void hw_var_port_switch(struct adapter *adapter);
-
 void SetHwReg(struct adapter *padapter, u8 variable, u8 *val);
 void GetHwReg(struct adapter *padapter, u8 variable, u8 *val);
 void rtw_hal_check_rxfifo_full(struct adapter *adapter);
-- 
2.50.1

