Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8140B2E413
	for <linux-staging@lists.linux.dev>; Sat,  2 May 2026 22:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777759298; cv=none; b=Q0EczJw7LSHTQpQ3i0P3fPJwoOlAtLA8Vc+BKZdsDRcAxvU4Y6ZpGbBIiqdXu5zAnv/LVwCJK62jAIU167E31jT/5zwV28NGvRyjBSlOcQm2v+Kb26jOyxG6Ew2JmAi3H8zTiInldxSihsVqTbSgqeyyQKSXGZ4YXUGpsgvL5/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777759298; c=relaxed/simple;
	bh=CVwrh3sf13Z4pjSQRWRb8GvrZEZ6Rzv/AzkfjrsmdF8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e6MHtDzpDMNFywlhah4ekcULiDgWiVkjh2bIZ2q7yaGaWVIXauwzxct2XOJtleApTgwDz0OKO+BCdSLSlezEKwS8jNrmyvUvkMSNHrbGJk0FUZvRsJDroX2l4FoNi0uz+IhRYWm1yn443GxSneyTjun9fN8bs+v4trjSRlDWoKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Se3kjTbN; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Se3kjTbN"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-39380e79936so6263211fa.2
        for <linux-staging@lists.linux.dev>; Sat, 02 May 2026 15:01:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777759296; x=1778364096; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+uTGMcW/RzBFyvDcwILIf3nADZbptPXlczeE8I/VfB0=;
        b=Se3kjTbNx2gAXJYMgECBdeDRp09Hei757i2ZhoOKynWevOip6B4FVY5NP4hiby69TX
         pb0CMEtj3C3uG8KVdA0mZMRWMAZl43VUzCmVVHWDXlQhtdu+rmYWIQW7Xs2AHWxCruuf
         efyfaPckHBqj5BCGzsy+q+fAFOGgmXKU/q+/aaVvpKEAd31Z/dcrIFjLTf9MEgdmh68G
         C6+xZNKD6c/TRbyxBXt241+6pxxHsx0YPuBBLS80Nm7tN0UUbomMc4hBVT6krcxIieEo
         BQa6Dq+CuI8V2EWVr+cxxJ8U2czaJS43XBdwe6SqMxjx91Iz0O4r66f7/iovsO881VWB
         6bmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777759296; x=1778364096;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+uTGMcW/RzBFyvDcwILIf3nADZbptPXlczeE8I/VfB0=;
        b=KElJCJD7cFtqv3elYnMV2kp9hF6vraJjcsl8YZER9V5jJQ7EX86AyXU4xSbJswmtZO
         IKpRS94lvooC79SnXNlJ9O8YhSA1z6CMlRydmKT9T3L2xym140UGYzLjyPejopq5qHm+
         bmnsPryyNp+KJ+iP6SgkAG9OcE5C85j2iOJQtZliGffsrVC5RnQGz0ctBjBkzxh7VIlk
         9IdOXjLS9K4tObyUvr0ZnLPSht/uDLwnhRUmlUn4f27YH7ccLwf7rpIaNpkYwKL399z5
         BkkUY0NOF3P4PoGmeJqwjmPB7iudqZmdoTZZ5t8Qh5dDNNnpNeRUdvtTKE4o6mgv9WST
         s/vQ==
X-Gm-Message-State: AOJu0YxBevfof0QhJNeMs6UkV+QGqngYlvuW6kt1w9hHE8r3mGL/nQpr
	83ZMQ2Dj1KiDBz3N9rL82kbRBwIpFnCf0VfLCZQTo9siexWtE3BeI+i/
X-Gm-Gg: AeBDieu9nj9o3ViDM7TFUIB9ebMExmIXUXAyqnSBUHZX6kITZyNRr6RjkAK1PFZv8K+
	B3cZ80ienpi0oNiTi+EG1RSHruc1SoCa55Un8ybTJ07+UXB/q+em12iXNM7jG6ULWwMK6A4mxLO
	ruwmnTzcMeu4Mr6oHyMj1UyIJfjRwcnO7GXHCDbVw7wvDMleE8V1ihE97LYNaY3RdnhZtWiqcr+
	gO3O+sskZs0sOfZZovMGYyVwbQqKkh/Pfzd4ulAg2ZYF0WNh7RGpeE7gjNnCskt9lOdzgHoTr/a
	CrNKHI5F/INQgTB5jIDl9x/6IasYAldgZAO8N48DVLWj6Ox7DooZfwUcbYIEofUP8aF6kRocxxd
	uD6vYIhyOlA762kCPCrwWDIKp0+WJFlIs3hlqEhNyhBAY2SRFhv+oaYfaTdwFT8L5Pkui0orReM
	FXewPz7XTQTKISLnLiyght3V9gh+/CsEwCnT4=
X-Received: by 2002:a05:6512:3f15:b0:5a3:ecf7:71c0 with SMTP id 2adb3069b0e04-5a862ebb397mr1022409e87.5.1777759295643;
        Sat, 02 May 2026 15:01:35 -0700 (PDT)
Received: from archlinux ([185.140.161.214])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a85c230d6asm1539179e87.23.2026.05.02.15.01.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 May 2026 15:01:35 -0700 (PDT)
From: Nikolay Kulikov <nikolayof23@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	Nikolay Kulikov <nikolayof23@gmail.com>
Subject: [PATCH 04/10] staging: rtl8723bs: remove unused ICType from struct hal_version
Date: Sun,  3 May 2026 00:55:43 +0300
Message-ID: <20260502220056.59815-5-nikolayof23@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260502220056.59815-1-nikolayof23@gmail.com>
References: <20260502220056.59815-1-nikolayof23@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the unused 'ICType' field from the 'struct hal_version', as it
always takes a single value (CHIP_8723B) upon initialization and is
never used in driver.

Signed-off-by: Nikolay Kulikov <nikolayof23@gmail.com>
---
 drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c | 1 -
 drivers/staging/rtl8723bs/include/HalVerDef.h     | 1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index 7ca328019386..be9082aa89b7 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -835,7 +835,6 @@ static struct hal_version ReadChipVersion8723B(struct adapter *padapter)
 	pHalData = GET_HAL_DATA(padapter);
 
 	value32 = rtw_read32(padapter, REG_SYS_CFG);
-	ChipVersion.ICType = CHIP_8723B;
 	ChipVersion.chip_normal = ((value32 & RTL_ID) ? false : true);
 	ChipVersion.VendorType = ((value32 & VENDOR_ID) ? CHIP_VENDOR_UMC : CHIP_VENDOR_TSMC);
 	ChipVersion.CUTVersion = (value32 & CHIP_VER_RTL_MASK)>>CHIP_VER_RTL_SHIFT; /*  IC version (CUT) */
diff --git a/drivers/staging/rtl8723bs/include/HalVerDef.h b/drivers/staging/rtl8723bs/include/HalVerDef.h
index cb970b1d37d7..c9c7bc369fa9 100644
--- a/drivers/staging/rtl8723bs/include/HalVerDef.h
+++ b/drivers/staging/rtl8723bs/include/HalVerDef.h
@@ -42,7 +42,6 @@ enum hal_vendor_e { /* tag_HAL_Manufacturer_Version_Definition */
 };
 
 struct hal_version { /* tag_HAL_VERSION */
-	enum hal_ic_type_e		ICType;
 	bool chip_normal;	/* true - normal chip, false - test chip */
 	enum hal_cut_version_e	CUTVersion;
 	enum hal_vendor_e		VendorType;
-- 
2.54.0

