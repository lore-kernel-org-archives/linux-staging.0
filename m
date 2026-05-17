Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 183F510F1
	for <linux-staging@lists.linux.dev>; Sun, 17 May 2026 14:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779028709; cv=none; b=lIITIY4yyWwgjQ9Ha0BuW3w1QfGsmPmwQI/bB/6cfDGeVJf/kjGGULRMcvyCHh/6QNgmZhvrUAaTbj4Mm9dArlRjwJhVprWakfJr9TgCUDjXyji7r87A7UX7zVfbJ+gKR/wvQ+WqHOz23nLVa3TyLqgMPV0AmtWV5hLIVZjRUio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779028709; c=relaxed/simple;
	bh=xAHSBYDP6W/ya7H979vVgrYm6+UeSkQpAh7OsBt7vMA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jpB0afI6DNf2Qa996TvEoIC3vZmO1fuxDbD9FPnlgs2iY1iaJ+bmuRX3eQDaSMluBfdOV8x+GyYRL7AeqzSTXOFAcQCQS3wKgtZH1koLaV0TlK6InpCmBo4eJ6AyPrAsAgIAS/3AxWxfbDCkLoLWZTm0GKMEE0C7yhfk/kiEzrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SgWRSdB2; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SgWRSdB2"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-c80227c9572so503092a12.2
        for <linux-staging@lists.linux.dev>; Sun, 17 May 2026 07:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779028707; x=1779633507; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TtY5k0xj/sy9dlt1g7TjEF5z8G1f2ZoXWHAismVTxFw=;
        b=SgWRSdB2hzbu3Pyg7dHLUxyJ2i1XO1PFPzx/gjwWKeh/V5krVN4aYMgwqSTuMTTU8S
         UlEQA9tT8qlsCCA7fxBuo3hXgvST0EJHE9N9bBLUJRGtNFe6cxPlQZ2bUnJRMmdc8ZYu
         54MoQv9tPhu5um0Dv1WTbxEp0lpTAxZOk+ZfIEZKKVpkD++5HyTOn+qqeaOcZzcfVoMD
         gLUuv+sVgXpsPGQNL7mI2gdk4ggeZzZFlJXwy6U23uaM+fKvgVzB2LZcu9iVG6yOkHRj
         ChKiQ7d830ERg35cPUDFHmYaLE+089bytcRK+XtqquSCyv69v/BAOFzgfBGbXEJ6SeQx
         B3mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779028707; x=1779633507;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TtY5k0xj/sy9dlt1g7TjEF5z8G1f2ZoXWHAismVTxFw=;
        b=kMh7L7Ec94dmkJxIj0NBIvTjGujx3EIXu6gKvevLZ0ETDo2zip1j9Wsf8HZBFUoR20
         lz14OcXrd5pqIZwz5iQnBRHqXsgESf6MZ6ul2qk0FhiuZ9WhW7C2FR7dJKgZgC+bcDlX
         /SH+F7muSyGMNF5VwwzZfKpgOJ6n+evsvpP2D2YfUQDk9ALfy73L3uEJMJajUjXiTbhC
         HWR8hW8SMEyLiDJ7AN/z0OClPWIsnYMhueIYs5suMhmIdf9k+Jf9GdshNvhBrTznHRVT
         ttXchSaYqa9zAlzZIM+a1mTbCeIgGgwGHCA+AyVltUK++xBuKYVmbp2sOpGPmJN/lBMR
         YGFw==
X-Gm-Message-State: AOJu0Yy9aIBzPK5jU/yDM5qdxkemejU0b98UWHGqNLTVNn0xDiIqokyu
	npcEZ+4afxRzs69VQ7VoVCCPj+SWS5VcqcKZWStSuDIot9irwD65N+ac5t9iyGMn
X-Gm-Gg: Acq92OERTtB/ACxeTzR8zjDZDgHS5W16PVSMNL0mO8jfz3rEv4fHAe3IUDy8xcDHHhl
	rmmSsy2ekeH/8DudL2YCzqNY/AxCcs4CzsrU16E/0hAvuclyOLHBUtINZLIRdAS9y44JXVSdm3b
	VG3MSv8t8cQtHdzMEnkygePevt+fyI21W4AEn3E3VbHaP5L4Tg/hAKxKKAvd91ONF53uXpckKj+
	UC8zxjf9L4wN3O0cnVJ8kWqlInN3ixU1xsbBx4OOQ4fV62PGZ+IHkpBZOw62jGl4Ru/ovktuzSS
	oEaaGwzBJyIiAzYVMZ7HUbBW1zCZFPAVmrax0W2dyG/G9+xC1f3MVxvOeL6f9Kf89mzW1rW7X+I
	zksQXEllhkrPO981hXUr1IOcTKiC5LgxeTBxOzDHTDespRIqfBxA1x7IHp2fnkeScNMFQD1x/gw
	FW13A8NTJJo+7gHMoMol74Zm9aDkONrb5wQRIM74TBPeHDQ/XL2vljFXbW235dO23bdoia0BXB6
	mEKL7X8VMd/zQ==
X-Received: by 2002:a05:6a00:18a9:b0:827:3b1b:43e6 with SMTP id d2e1a72fcca58-83f33d227c0mr11344226b3a.21.1779028707408;
        Sun, 17 May 2026 07:38:27 -0700 (PDT)
Received: from localhost.localdomain ([115.242.226.50])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f196647aasm11036887b3a.5.2026.05.17.07.38.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 07:38:26 -0700 (PDT)
From: Moksh Panicker <mokshpanicker.7@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	Moksh Panicker <mokshpanicker.7@gmail.com>
Subject: [PATCH 2/4] staging: rtl8723bs: add braces to else clause in rtw_efuse.c
Date: Sun, 17 May 2026 14:37:21 +0000
Message-Id: <20260517143723.13281-3-mokshpanicker.7@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260517143723.13281-1-mokshpanicker.7@gmail.com>
References: <20260517143723.13281-1-mokshpanicker.7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missing braces to the else clause to satisfy the coding style
requirement that both arms of an if/else statement use braces.

Signed-off-by: Moksh Panicker <mokshpanicker.7@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_efuse.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_efuse.c b/drivers/staging/rtl8723bs/core/rtw_efuse.c
index 987d05816c5c..2be74f2d4ac8 100644
--- a/drivers/staging/rtl8723bs/core/rtw_efuse.c
+++ b/drivers/staging/rtl8723bs/core/rtw_efuse.c
@@ -73,7 +73,7 @@ u8 rtw_efuse_read_1_byte(struct adapter *Adapter, u16 Address)
 				break;
 		}
 		return rtw_read8(Adapter, EFUSE_CTRL);
-	} else
+	} else {
 		return 0xFF;
 
 } /* rtw_efuse_read_1_byte */
-- 
2.34.1

