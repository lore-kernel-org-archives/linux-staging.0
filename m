Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFED217C98E
	for <linux-staging@lists.linux.dev>; Sun,  8 Sep 2024 19:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725823606; cv=none; b=Uk6f/zBynECSSGsCmKDPGSXVILYF95+mana58YqD7IQXfwLnPX5Q2Bzf7/UBQugP4LZgz3B6BFgswfT7B3d7OUXK+TgLkJjtebdIiYdUaA4kKBI5E2/TLPM1hCDSbeaDlclzDllise3/jIa5XfTT3iXKLXv4UlxPw5mwM4VBzWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725823606; c=relaxed/simple;
	bh=qqKcKGI24ZLluphP0qMulOyEU/6MpzTHCItJT29kvoA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=oKN4M3N4NK/w264vUMlSd4FfD6OLE39SbcoN8YGJLmj6pWVvF8pQDDUgVmz4stEFpHWYmgZ2V4NU81ionyAKlvyE71qIrfyM1K4sCKJ9HjSMHA/kN7C49uSehx37ZrYJioB12yp5/oeVBTdHAGQVpirdYfY/zcp25PL+tobiaEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=fNP7vjwy; arc=none smtp.client-ip=209.85.161.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="fNP7vjwy"
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-5da686531d3so2529946eaf.3
        for <linux-staging@lists.linux.dev>; Sun, 08 Sep 2024 12:26:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1725823604; x=1726428404; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YVHa5epj2p1dAms9PACg6c0dVYf4FlgMjQpCOuLBg4g=;
        b=fNP7vjwyqluZceNpq2kZn96X96R0IXIFTAU3kHzYRXFZNqR+lEMsAjvxw+rN4E9zaI
         /Up9CFyfHanHJSRRedXTKT3rIjOC4beBzXqAx9oaqDfjN2bVhTimD5XFlnuPEzQqHnBV
         FZLjcRF4lma4IMbsXobjHLAiz1aR01bWehkpNFITE81bvTVSaciN6MhXAzTvbJRKRHNZ
         1suNpXGcrG8EM3ApepyXlug9KyVgUpt/Er3ZC9wJolsQ3s49Vt1z3kH7WgyrhXjQSlYw
         NuP+sJr2IG/zVNLTUzTiGqkj985O/n9hmk8NDRfGJUWwoV0orNG/i+LyNdJ2ibAQJjTJ
         btkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725823604; x=1726428404;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YVHa5epj2p1dAms9PACg6c0dVYf4FlgMjQpCOuLBg4g=;
        b=j12FEo85YJYIkPkwHIkTzSHlt9Dc6wUAwtl2ufEX2xmlg9XieRVYqYGlUizSpv7eRR
         VP7Oge4yOCHkGGAPFDJJN1lAZHx1sqdYtMiH+j8DgDkUi6w8ippWdPz8bSi9XoZwlEvm
         /wdEoYTySASR9woPywxM6W11nRmASK32ijQaQz4h/cogjtKk4VlqFsEtQ1VYI3ftFV6P
         Zv9LYL4eiw/lvCKZ4C3snqtVKGbfNukBnLUZQXKhK5nkG5wOZJ+TlztuzvLmFfdnlvai
         tITaof+j7KCziJAwKEgOtR8I/O9shw5tftdg5LYXfFGZJfV+nKXIPiNSVYyeQkpitJ08
         3oqQ==
X-Gm-Message-State: AOJu0Yzl7m+V7tvmo/7Oit+4UpZt3t1bsRZkp3yxBZtUR09XZxm875F8
	5RwYWNnHd9TTbb17gTcucQDTxAHiz0nYq28OVr2TWgYAgSyn8nkTy/9m6jQD12M=
X-Google-Smtp-Source: AGHT+IEgfQxng7tLhbSWEjoMiuayrwGJkE9DyAouF6RW/y2GMbl2QBRXJ3lKHYLnWg5xEXd9Ce7l8g==
X-Received: by 2002:a05:6358:9204:b0:1ac:f109:e248 with SMTP id e5c5f4694b2df-1b8385b2c39mr1123143055d.2.1725823603918;
        Sun, 08 Sep 2024 12:26:43 -0700 (PDT)
Received: from lunchbox.darkphysics (c-73-83-183-190.hsd1.wa.comcast.net. [73.83.183.190])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20710e1b085sm22703305ad.36.2024.09.08.12.26.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Sep 2024 12:26:43 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 09/16] Staging: rtl8192e: Rename variable Operation
Date: Sun,  8 Sep 2024 12:26:26 -0700
Message-Id: <20240908192633.94144-10-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240908192633.94144-1-tdavies@darkphysics.net>
References: <20240908192633.94144-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable Operation to operation
to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtl8192e/r8192E_phy.h | 4 ++--
 drivers/staging/rtl8192e/rtllib.h              | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.h b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.h
index c928bc2b218b..956dfbdd5b68 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.h
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.h
@@ -43,13 +43,13 @@ void rtl92e_set_channel(struct net_device *dev, u8 channel);
 void rtl92e_set_bw_mode(struct net_device *dev,
 			enum ht_channel_width bandwidth,
 			enum ht_extchnl_offset Offset);
-void rtl92e_init_gain(struct net_device *dev, u8 Operation);
+void rtl92e_init_gain(struct net_device *dev, u8 operation);
 
 void rtl92e_set_rf_off(struct net_device *dev);
 
 bool rtl92e_set_rf_power_state(struct net_device *dev,
 			       enum rt_rf_power_state rf_power_state);
 
-void rtl92e_scan_op_backup(struct net_device *dev, u8 Operation);
+void rtl92e_scan_op_backup(struct net_device *dev, u8 operation);
 
 #endif
diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index ee5de93a90c1..3621f27b083b 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -1460,9 +1460,9 @@ struct rtllib_device {
 	void (*set_wireless_mode)(struct net_device *dev, u8 wireless_mode);
 	bool (*get_half_nmode_support_by_aps_handler)(struct net_device *dev);
 	u8   (*rtllib_ap_sec_type)(struct rtllib_device *ieee);
-	void (*init_gain_handler)(struct net_device *dev, u8 Operation);
+	void (*init_gain_handler)(struct net_device *dev, u8 operation);
 	void (*scan_operation_backup_handler)(struct net_device *dev,
-					   u8 Operation);
+					   u8 operation);
 	void (*set_hw_reg_handler)(struct net_device *dev, u8 variable, u8 *val);
 
 	void (*allow_all_dest_addr_handler)(struct net_device *dev,
-- 
2.30.2

