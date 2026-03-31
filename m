Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F283E371895
	for <linux-staging@lists.linux.dev>; Tue, 31 Mar 2026 05:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774935533; cv=none; b=Y49ANQauNi0nstoAbn5/mhOW7RhI8ERG2jU26aqJF2neMI6hhktgSpAc1y5VBEdVXe8uPLnKVKPDOKK1s880phVt/qeVqenqtjA9E1BMhNht/HiZm10RqC91hQOnhkt9hAca7yxoITk4Z1d6XBvA6/H9VCHCuVDGMmHrivNpV8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774935533; c=relaxed/simple;
	bh=tMuskWA+GekvxmK/ESX7nPibyWch04nYVago8yxfSxo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UHlugzow4jpKbLx70vqb8RvDT4pvCyvWuG2N/ddKTG/owu8GU+q+YuDBgd4KgJMuKY2K7MIQG1UK1n3UTsvIRJ4gEZqPu0uqqe/acdLlK82IkuDBEEXyrasjcoLiYMH3XUCg7VtPHU6/sp+5UWQrj+/y4LbWER2EkArjbGlsmXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CVHuORLA; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CVHuORLA"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5a27daa652fso4077241e87.0
        for <linux-staging@lists.linux.dev>; Mon, 30 Mar 2026 22:38:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774935530; x=1775540330; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d3h+SxZq49yPOnvzzPQ6MvOmq7ftWbqM0aBIl8gIyY8=;
        b=CVHuORLA2TzC/RW7pTxQjk+lZ2r+OwbsNSoDiwaHtwzoBGR8+utKznJhjgdNfeY4KG
         5gETQ6xSDEUG6Kf4j0l8/gIqOyaCRo7wKzr2EilrQslHaYrYdV9TYDeRmvJWU1L0nLQp
         BwSSENewfjrANcMkQucfLFSLnZ1sXMVBHweCbf2GtJNgsqg6NM3L4855x1NJ8ISXomIq
         vFc5zA9XjhYPlEdC2X/WWRx7ghquc5rl/1Fm9jh9OfyvRU2thSFhIZITd9hzdAEBtt7m
         cWRVX0RE8IhoNOrNAhqbCAdb+Vf99aHP8fV8326pQAGitS3FeN2fMId9kme5goWNU/57
         P1Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774935530; x=1775540330;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=d3h+SxZq49yPOnvzzPQ6MvOmq7ftWbqM0aBIl8gIyY8=;
        b=QeaoiSigJ1ZHLZUaCWc3MHGxwVn95ZB4YNKhW5lReSQGLckGBuEEXRfuKWA7+1ghIr
         2Ax9cgxQerGLs+n3+vqKZOoLeXVzNE+lFXEyP3Lph1niM1m2J1TrxCCqMU4NPd9ohiLz
         E0AT2A7Hfvfb4BgjiF/T9RzaqT0Og1BljisLnl+LS+hCkzLoaSR2D5+Ly+11ETxoATHP
         ohkSEgj/bMgTCZm65AOlkGuUOt95vc6gEs8dQKD9HX4jbBMw8ZYbVsu7bZ0raZoOrV3z
         nroF6Y/KVumoadFdtteFzLkleGVZU0GR5zsoYNHjMWet9h/fiIF3cTRCp8jd8mLkJYXJ
         ZRNw==
X-Gm-Message-State: AOJu0YztXYsC5xKD8tccQ6bCFJ3aKzE2uprjzVpD3a/9+sziSpyiKyMN
	LzRuwaAaxtgFOR/r/KxwR72oyaxJlsaqNJeXozIgGZM6dZ+lLqG7zYH0
X-Gm-Gg: ATEYQzwJ3hPYJyXwgV2OwSqdD2KxYbeXfFcjeMrDN6DWeNRhbvUVWPDbJ1aaxJg00KN
	Q6PDOyPAqECOLiwenbryWkOxl4le/2nDnryQMvQTHbVokC2Fo79dtYygR1RBswn7QyGzlJ+5Djq
	IH1E8gb16xqWC+seac6ufu/vU/91sMn2G9dpnn+nZ0wZggCbHZdG54xNmD9SaxP1pE422buhwTS
	IU2jbBm9CiwZbJUSMzKBgzy2Q9nlz6Y5ra0VzccxygD3IBEMq9R4qs03oUS9B2InKFQWxufD2db
	JDyi9AfDi/yKkJkH46tvH+B6Qemyl/uojzKBOU6555AFr1hK9KTumaBMM4cfet3U1/H56MFRlaU
	1A4gdaL0+UTB+Mi9NDd76BB+Nn4E/gLjXMFyGr6bOZxZSs1yjiWezxTL3bog+FJbvEiqOHqPeT/
	Qg1oCgI2MhhJx0VhIsLbpBS2jPtnBP20eUvx7TjpvciGmSDxc+Df5RssxVdXiJ74ecgHYZqFn/
X-Received: by 2002:ac2:4e01:0:b0:5a2:b40b:3f76 with SMTP id 2adb3069b0e04-5a2b40b3ff5mr2722341e87.21.1774935530080;
        Mon, 30 Mar 2026 22:38:50 -0700 (PDT)
Received: from localhost (c188-150-77-196.bredband.tele2.se. [188.150.77.196])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2b145f145sm2130920e87.78.2026.03.30.22.38.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 22:38:49 -0700 (PDT)
From: Linus Probert <linus.probert@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Linus Probert <linus.probert@gmail.com>
Subject: [PATCH v2 2/2] staging: rtl8723bs: remove unused functions
Date: Tue, 31 Mar 2026 07:38:43 +0200
Message-ID: <20260331053843.108678-3-linus.probert@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260331053843.108678-1-linus.probert@gmail.com>
References: <20260331053843.108678-1-linus.probert@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Removes two functions from rtw_efuse.h. These functions were only
declared and never implemented or called.

This cleans up the global namespace and also expunges two checkpatch
warnings regarding camel case naming of these functions. Verified by
compilation of the module that the functions are never called.

Signed-off-by: Linus Probert <linus.probert@gmail.com>
---
 drivers/staging/rtl8723bs/include/rtw_efuse.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_efuse.h b/drivers/staging/rtl8723bs/include/rtw_efuse.h
index 9da34606e5c6..808ba94a5998 100644
--- a/drivers/staging/rtl8723bs/include/rtw_efuse.h
+++ b/drivers/staging/rtl8723bs/include/rtw_efuse.h
@@ -74,7 +74,5 @@ u8 rtw_efuse_one_byte_read(struct adapter *padapter, u16 addr, u8 *data);
 u8 rtw_efuse_read_1_byte(struct adapter *padapter, u16 Address);
 void rtw_efuse_shadow_map_update(struct adapter *padapter, u8 efuseType);
 void rtw_efuse_shadow_read(struct adapter *padapter, u8 Type, u16 Offset, u32 *Value);
-void Rtw_Hal_ReadMACAddrFromFile(struct adapter *padapter);
-u32 Rtw_Hal_readPGDataFromConfigFile(struct adapter *padapter);
 
 #endif
-- 
2.53.0

