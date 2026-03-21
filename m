Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F4413921FD
	for <linux-staging@lists.linux.dev>; Sat, 21 Mar 2026 15:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774106053; cv=none; b=PM6qYtlO2XiotNHhIC2zLX4EdbHHua8nu1djLA7yGAibum4RmBbcSXn7ZssDavdGlB7pC3nrvSnpKGo4Xvbwf98OqgQQW/sJ3VNXfxce/QmnV4z0Xv0mNiaimIEp/Z3MS2X432JzfM1bSFsZHWwm+PJh6Xg1bXSQEmbEO/aub0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774106053; c=relaxed/simple;
	bh=8HBt+OjCGz8Jjm54o7uD7/8TvpvBSvaMblyNErLtBoY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mlHnilkh2ws86SI/SH7cDLfMiMmRF9mda6vryCBlb2uXdL5XrkYSGpmf/OpoKk37smpQHlRpKn04DaG7OfwqDqiSnMHx34y4ZpgVNUyFShgrnyoZjxU7GO6fA2mukixZz4pVy+Rausa1A7oZcZRpWHuft5u9sgicw9acExIkxME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ih5gmEOm; arc=none smtp.client-ip=209.85.217.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ih5gmEOm"
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-5ff05af29b4so432592137.1
        for <linux-staging@lists.linux.dev>; Sat, 21 Mar 2026 08:14:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774106052; x=1774710852; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YuT+lq9hkywLtwM7vkTsrjb1dGvveGHdd8WfFpTPkyg=;
        b=Ih5gmEOmZ6nTyyFKBJCRo+HZEFNyrLJTGZwXcMPUqgL+UtPGvO3yvRV7JkoeSOeIJr
         0/a017gY1OH4tF1FcE3xbidGqVgKs2YwX9QaU7BEvA6KyR8j1WYoAaP6acaqe8bawaVk
         n9Y9t5Jbujj7wpCuF8QY3wFZ2JPk0+0+qGlY6seFfr2KEw770RfINaZnqhPp1pHMplH2
         4aLyUU7JUFCbt4dZwcNajxa4668NSmN7e2naedyRJTklFzWPPBgU5ebtv+4g2YT8+dxF
         R+/2sv0LkBD+mOxJXLK/jI48jkb/lQ+sFFxt2dJR+Z180FKBE+ZuRFIqdiZ4BuPI9ynf
         Uo6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774106052; x=1774710852;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YuT+lq9hkywLtwM7vkTsrjb1dGvveGHdd8WfFpTPkyg=;
        b=ZXylxlDg1vudoNniSEFzY6qsZO1/884AAhE/s7vrHgv0A5YQdVCYbqN6NTvavaL32y
         iqeyEBQnWiqMhxVHfAZCsCHDSeY8Q6MTQb8+fhx6LQNtZukqt6XMNIZOWsxGCNH2OoRx
         kVnIkoGFf/1jqyhbtiuts9TloyPcFBzQq9FSaCPYVI9dzgMAWXJiTv9vV3GFS41bCzsU
         HJ/74WtktHkV9GLYHMjSZOLAKXhcSHC0QLZCpT0jrAkfUAZyQRuc7bEq0uw4zzkBwPqL
         DXAZ1tpqlAzQrNNkcPaYopFNwl4ywYEBm+UJozTqE+l6YV5HURv8kIDhjrGYooCwuT4T
         e2IA==
X-Gm-Message-State: AOJu0YyxZfBlNBPTquB2+oiD06qZLDUy+nrWhviOIFIJFsZTMpohW/VP
	uhQCexrUznXC8o6PdE9U6EPU4rNvN7rRBXNCVfV12kGsshR7w+3GoZIe
X-Gm-Gg: ATEYQzwzcnGcmhLTmsCTr/ZdABZa2nYBklvzUpSRrNYYSPU0i/ygkg7VZStdkA71Zom
	TPdgl9Y2LG/cSuDIhEiyccFoM0m3uFQTK4XUauF6LVN9TPZU40G0qJUZQtd1Z+IA0w8dXMIQ1Ln
	pcmmCH6YDCYJuOBpYK6uUIv9zBTKb60I5fcMIQzXyvFKN54NQp/0Tnp5RF5VwMKCFAjkeDmLHlr
	icK23ZzDHWaI58dG6I/Js2rhBN22r1UxkyFrlBU8OnPFjhgKxNQd/0u3ftMGkbrWS4RufrVkXS9
	qt60hWIQ8rFEqNwfjW106GU7eJc5TcOr81/ZJQBxdMURFoAXy45Z5Li35uIqC3yOYuFc1L9yPxi
	Q8CR1qG4AJvWKx8zBQyp78y/m88lAJ7591n/oHpPLEcmSlE0Z5QagojlFH20oB89fh4gB81Uups
	0MFR6FDHnR11D1CArtrWpsPGMc+DjlunrHRottHp10zx2AwAD1
X-Received: by 2002:a05:6102:10cb:b0:602:b1cf:80d5 with SMTP id ada2fe7eead31-602ce2ec232mr469390137.8.1774106051586;
        Sat, 21 Mar 2026 08:14:11 -0700 (PDT)
Received: from localhost.localdomain ([131.255.96.168])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-602afb4ed6esm3186753137.10.2026.03.21.08.14.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Mar 2026 08:14:11 -0700 (PDT)
From: Marcos Andrade <marcosandrade95963@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Marcos Andrade <marcosandrade95963@gmail.com>
Subject: [PATCH 3/3] staging: rtl8723bs: update rt_channel_info member usage to snake_case in wifi_reged.c
Date: Sat, 21 Mar 2026 15:13:42 +0000
Message-ID: <20260321151342.19864-4-marcosandrade95963@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260321151342.19864-1-marcosandrade95963@gmail.com>
References: <20260321151342.19864-1-marcosandrade95963@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace all occurrences of the CamelCase member names ChannelNum and
ScanType in os_dep/wifi_reged.c with their snake_case equivalents
channel_num and scan_type, as defined in struct rt_channel_info.

This change brings the code in line with the kernel coding style
as described in Documentation/process/coding-style.rst.

No functional changes intended.

Signed-off-by: Marcos Andrade <marcosandrade95963@gmail.com>
---
 drivers/staging/rtl8723bs/os_dep/wifi_regd.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/wifi_regd.c b/drivers/staging/rtl8723bs/os_dep/wifi_regd.c
index f9c4d487badf..bccc779c3ecf 100644
--- a/drivers/staging/rtl8723bs/os_dep/wifi_regd.c
+++ b/drivers/staging/rtl8723bs/os_dep/wifi_regd.c
@@ -70,11 +70,11 @@ static void _rtw_reg_apply_flags(struct wiphy *wiphy)
 
 	/* channels apply by channel plans. */
 	for (i = 0; i < max_chan_nums; i++) {
-		channel = channel_set[i].ChannelNum;
+		channel = channel_set[i].channel_num;
 		freq = rtw_ieee80211_channel_to_frequency(channel);
 		ch = ieee80211_get_channel(wiphy, freq);
 		if (ch) {
-			if (channel_set[i].ScanType == SCAN_PASSIVE)
+			if (channel_set[i].scan_type == SCAN_PASSIVE)
 				ch->flags = IEEE80211_CHAN_NO_IR;
 			else
 				ch->flags = 0;
-- 
2.53.0

