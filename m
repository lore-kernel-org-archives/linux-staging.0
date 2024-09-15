Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D95981B5AA
	for <linux-staging@lists.linux.dev>; Sun, 15 Sep 2024 06:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726382463; cv=none; b=CejL7ji+Pvq0nUmF4NJACnTIfu/cX4to5sS9Coh1aIt/PvNBK0spA9Es4MXW/F+a9DjfPJzalyvvBCLJ/rSya+8vI+YUPBjQ5pUHJ/e8ZvFhCqua8vWom5B7DXJWUHtHHXSka8iwV3et7O+TO0w1r1ZG6hYbqvo51EmsNdU/kik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726382463; c=relaxed/simple;
	bh=J1eaPEGXQTggxvrag31RjvbO/OZwnbWAvNuMWEu8Z1o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KkbhI+zUiIpfwPLqkgsn/8n6cMci5r6ousJg4aum4yfPfJGbCqzwt+ubx6PiE2m+YoJ34C80FoTuG+ya1OlKp42MxaVLm+ANKxMp8sypga3KhTEWg5+YneJ674sEafniC1Bds6pWvxmUscMoq3riOWp+Fs8v/Ljc6PVpcC2bFQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UglU3D8G; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UglU3D8G"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a8d2b4a5bf1so463577766b.2
        for <linux-staging@lists.linux.dev>; Sat, 14 Sep 2024 23:41:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726382460; x=1726987260; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dtdv6H+0O9IYGXXcKB93eZPrd2Xv4iQ27EcAPr2FIFs=;
        b=UglU3D8Gcm0USY8apnXvoSiXXK+7daMvyhNsPDnS0SwCE7S0tRGOavjhZwfymZEtUP
         tY4eSkwUjICJx9vNol2JGY++vkTDNLTVf8Fvm+XNzS9j/dm/Lq+EjUA21mCSI0A/66nZ
         poO2c4IDvCZgMl/NKHVeDiZ+EUy2gMcUABGF2vIGHbjI5mXSW7Wr0g6lBEZ2FC9HRuAc
         hg4aCLRme/JBZWaoM+kGCZWBJz7HvxlYavVyCiaoHl0cu4JijZw/qIBPo9Z5M59IYtr3
         nPCP9sNZPASNwB9VB+vuA5/pzkqd8eHIzoqy2EgNIhWmRlZX0GUTMsYKfNHKTNsXB+Qu
         ns8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726382460; x=1726987260;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dtdv6H+0O9IYGXXcKB93eZPrd2Xv4iQ27EcAPr2FIFs=;
        b=F0u7o2LqQNdzbCc905czsKHllQJeWjLhJcbnryeN7qIDhwhq72MOoL5DL4tc5OFlKg
         xStSNnzK8fY3Era6XaB8dFlGQ+vM4M2CBUoKNm3o7jIIugsKzpTTB3PyL0gjnhSf5nyj
         1pzB4GJPCCq1Kv68d2gHBYylYt7D1MnK8yndaqMFUaDxB1MIaRQMuFiouuXQp8RUIO5/
         906/f+JPdDvbUtHSbso2YMw+Vog7c1nolI7jP2zBkYAsNm68gVxrXEGslz3cHf8xGrmA
         hKwduVzh0nr2/chvu9P37lNMMb05l8oJ172nqriCw44oS7wpnLvdlA+JkNU9YClahzQM
         SxLw==
X-Forwarded-Encrypted: i=1; AJvYcCWax3cO9HRFyTUfVnFNyN2+RXqgT13qmgITzkW9ZPkjqDmsTXcP6ThAvDitoDOajWhyTmvTrWTAsi8PPFdA@lists.linux.dev
X-Gm-Message-State: AOJu0YwG9GUPgAow5rUe0Vr8h4v2B01ab1tZLwbLn+JoLB/Ugm+yNzyl
	WQeqLJxmOl9bdlp/0anBhAlNiXL+Gfj9lkeMjnjP/vH6qSSFCwGN
X-Google-Smtp-Source: AGHT+IHuv4df+s1zPsWeAfo3P2ZQTG12QhiqcUEflqhuSA7TDxUiFuZoUXwvwMRMIOQBAySGfFt5Fw==
X-Received: by 2002:a17:906:cadc:b0:a8a:7501:de21 with SMTP id a640c23a62f3a-a90294ab552mr1091979866b.12.1726382459810;
        Sat, 14 Sep 2024 23:40:59 -0700 (PDT)
Received: from kernel-710.speedport.ip (p57ba2f9b.dip0.t-ipconnect.de. [87.186.47.155])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a90610967bbsm160201066b.8.2024.09.14.23.40.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Sep 2024 23:40:59 -0700 (PDT)
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Subject: [PATCH 04/17] staging: rtl8723bs: Remove unused function rtw_get_oper_choffset
Date: Sun, 15 Sep 2024 08:38:18 +0200
Message-ID: <23623deed7bb225c614693d9b871e2d6f49744a0.1726339782.git.philipp.g.hortmann@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1726339782.git.philipp.g.hortmann@gmail.com>
References: <cover.1726339782.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unused function rtw_get_oper_choffset.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_wlan_util.c   | 5 -----
 drivers/staging/rtl8723bs/include/rtw_mlme_ext.h | 1 -
 2 files changed, 6 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
index 85215838a004..a4cc48989445 100644
--- a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
+++ b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
@@ -300,11 +300,6 @@ inline void rtw_set_oper_bw(struct adapter *adapter, u8 bw)
 	adapter_to_dvobj(adapter)->oper_bwmode = bw;
 }
 
-inline u8 rtw_get_oper_choffset(struct adapter *adapter)
-{
-	return adapter_to_dvobj(adapter)->oper_ch_offset;
-}
-
 inline void rtw_set_oper_choffset(struct adapter *adapter, u8 offset)
 {
 	adapter_to_dvobj(adapter)->oper_ch_offset = offset;
diff --git a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
index ba39435d1a10..479e90ff336c 100644
--- a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
+++ b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
@@ -449,7 +449,6 @@ u8 rtw_get_oper_ch(struct adapter *adapter);
 void rtw_set_oper_ch(struct adapter *adapter, u8 ch);
 u8 rtw_get_oper_bw(struct adapter *adapter);
 void rtw_set_oper_bw(struct adapter *adapter, u8 bw);
-u8 rtw_get_oper_choffset(struct adapter *adapter);
 void rtw_set_oper_choffset(struct adapter *adapter, u8 offset);
 u8 rtw_get_center_ch(u8 channel, u8 chnl_bw, u8 chnl_offset);
 unsigned long rtw_get_on_cur_ch_time(struct adapter *adapter);
-- 
2.43.0

