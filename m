Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A29B1B4257
	for <linux-staging@lists.linux.dev>; Fri, 27 Mar 2026 00:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774570944; cv=none; b=Twqn510983RzUXbiSwc6v4D9XyS3V9EU4bbt9UslTmXGg0yf9ZYuZqoPBaLGV7uL+j1VkXm+BT9KJr/H4xSCC4E+xnS75cPcOsMoCTATNCf97BxhKICvBHKAJG0VSn/2U7W3eUeFGyvVg+UTsJXytyuB0mEMHNG7QefJuKYsOtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774570944; c=relaxed/simple;
	bh=aWjnpZXDMHlZDPkzl1eRPTOsY1PisgRZdytXZZgjbf8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qfYmWgBfQe7p+ab1zAaHoaF0m+NvIOWYs0bZWEy6awg7nDVkXk3X2GG792blC8mDRF8THvXvh2z+6ci5lUOT28A7Fr4kUFe+qULAiXT6BwgByXLKBO7RmfQLN6c9q9zGXhF61rZqNQk7XATftcz5MVDSW3sVaW1GW1cNWGQmkDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y6PFm7+L; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y6PFm7+L"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-35c124d2613so1052842a91.2
        for <linux-staging@lists.linux.dev>; Thu, 26 Mar 2026 17:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774570943; x=1775175743; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ujh+lk3zsPEUzCT/OwCv/sqXcpjBGiMht3hDWTtrhm4=;
        b=Y6PFm7+Lk5FWNQf5maO03WILMhVC1XSdpZoPECxC5pYlj21IZDzwzdQYgt5UYU5+/b
         oqfB8neIBrunDvH8KG2SQqTK/2o2I5URGg6OGu/D3Kmq/1xzjgLlCgt3tlE24qp6vEfI
         6fo5FnOomZHRehPtuiByMabM22zVYgepYeZncpeBV26qVJOUlaMkHBmiPIFEB92ZgBLe
         CkM0NiytVib1sgi5zAomBFTaeubhQ3yP8w5qnJKLHst/i4VW4EsY268OWhOB2ts/80hs
         46bkuOc1IjxZYxVzI5wLNYpfkNZCKTV3yXDSe5EP4Uf+afrhdLTtnv27OYcTDhfz4BER
         vHCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774570943; x=1775175743;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ujh+lk3zsPEUzCT/OwCv/sqXcpjBGiMht3hDWTtrhm4=;
        b=Mz+gikTHJGHmqrZajcS89psKNE674Fan0NOzHxInxPqbPz1c+FiqLobEqdFFNQ+VnL
         I9O3lqlUcmZjyCfoj5MWWONKoSvDcJXJ6jjvg/Lrpd8zZIxvqVh2wS1n2/WgIrbv0mv9
         968NR8aw/s0PvYh7J6YEVcVlXxm2lFVoDpRhCN4ZfchOXr5vFiXe1gZiEF5Me8Mnxl3C
         eKd4HHXaUCpehV6moPD6VAh9LdrI/wPt84ShtZe/RuzcPZpz2Byv2ishEDXyPidoPcob
         n8N6/nleAetsCv33a85+edyE9I+8SrFPH527oU3hHZ0MrJFv5/XUAfxdjEu71dl0so8g
         oT9Q==
X-Gm-Message-State: AOJu0YwcJ1W2qTCkC+DiF0S/d4yeIgtYDbV++E+qB8IwNKsuTTmyRMJH
	BzjNHCwHihdhsXbmgqkct7Lv4HuKtmUH7LV2sp/hxmJ6NZJzotHcfUQe
X-Gm-Gg: ATEYQzxsTXTocrxe2X+480UVKObQKQxI1o5uQV/tD8vPghjOGUsLSA9C//TiqwHrg8c
	k59mPdfk0sjjQ8WM/TVfhjxww05azWNGCOtuZx9nGr1j2CSS3OpJgLc9K5KQUvSbts25a+l64YO
	+tFKii6V6rOPFW2/6YoTcB06svx4MJh2ckXZPF/MKcjz8qXDgZbMuV+3DUTbhcN40PZonU0jnhK
	SkSxyd09EmVhZgwOo+8d2S0Po2d8m02r85Ws/ak+//RLtxG4yV7DxAZZ7CCj6uUqzAJciWpEzky
	Fl7sjtpHAgDFXRyK6xELeqV+wC4KeX9dYY4DBJdeatJsJfKzloVuu2gnjzkTI85tGFZoZEL6DSs
	jUs+WrzbtkUWa01Wbt4xDGosQdohxB6vCSkQn401qapuukJl9vcPEzMBy1KKWq0Ac3u/qd/vPYE
	pNquQiWqn2dvBTmo0UpOJawnI=
X-Received: by 2002:a17:90b:4a0b:b0:35b:e52a:8a37 with SMTP id 98e67ed59e1d1-35c30039971mr464207a91.15.1774570942666;
        Thu, 26 Mar 2026 17:22:22 -0700 (PDT)
Received: from MrXploisLite ([39.194.5.72])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c22d8c425sm3649407a91.12.2026.03.26.17.22.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 17:22:22 -0700 (PDT)
From: Romy Rianata <arokigaming@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Romy Rianata <arokigaming@gmail.com>
Subject: [PATCH 1/2] staging: rtl8723bs: Remove unneeded blank lines
Date: Fri, 27 Mar 2026 08:22:11 +0800
Message-ID: <20260327002212.33024-1-arokigaming@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove multiple consecutive blank lines that serve no purpose.
This is a cosmetic cleanup to improve code readability.

No functional change.

Signed-off-by: Romy Rianata <arokigaming@gmail.com>
---
 drivers/staging/rtl8723bs/hal/hal_com.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_com.c b/drivers/staging/rtl8723bs/hal/hal_com.c
index 50370b14c..279bc87c3 100644
--- a/drivers/staging/rtl8723bs/hal/hal_com.c
+++ b/drivers/staging/rtl8723bs/hal/hal_com.c
@@ -30,7 +30,6 @@ void rtw_hal_data_deinit(struct adapter *padapter)
 	}
 }
 
-
 void dump_chip_info(struct hal_version	ChipVersion)
 {
 	char buf[128];
@@ -71,7 +70,6 @@ void dump_chip_info(struct hal_version	ChipVersion)
 	cnt += scnprintf(buf + cnt, sizeof(buf) - cnt, "RomVer(%d)\n", ChipVersion.ROMVer);
 }
 
-
 #define	EEPROM_CHANNEL_PLAN_BY_HW_MASK	0x80
 
 /*
@@ -292,7 +290,6 @@ u8 HwRateToMRate(u8 rate)
 void HalSetBrateCfg(struct adapter *Adapter, u8 *mBratesOS, u16 *pBrateCfg)
 {
 	u8 i, is_brate, brate;
-
 	for (i = 0; i < NDIS_802_11_LENGTH_RATES_EX; i++) {
 
 		is_brate = mBratesOS[i] & IEEE80211_BASIC_RATE_MASK;
-- 
2.53.0

