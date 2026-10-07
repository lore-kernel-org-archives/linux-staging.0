Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27376334374
	for <linux-staging@lists.linux.dev>; Wed,  7 Oct 2026 01:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791337056; cv=none; b=BbjLTAKSyqZbcGHow+7PzDuXt+gQDU6coGbV7B5p6UTdRVVYpgslw3PCuMKK2rqwugAiFWCuDdF+n2jJoGHFfuy2yNGO/Lclh1A6Mj7mkcTfZ7n3ENwsGaH8XUzTd0noobVf4u+AJyFNolOyskzpiiivkJkCTbBiIzf7s2pMS90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791337056; c=relaxed/simple;
	bh=SOLkzMjcd8t7bYXDVU1/DE9RyYqx6GQwsbfS6Psv/UM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=SAdGwLmpU93ZynZpJjAga2108C8kQDbgFP7TcSs4WA1J7NHl3isb6GBZ7jUhqkFtV9tfYS5dzAaqGvaaMfuJ9BUwhLs4eARm0Xr6hick8rquov/6yMflqmUiUMjSHaV01S7LThw9J49Osr5mXco0LYnrlWMGSthVBTSlDYU1GQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V1vCswzR; arc=none smtp.client-ip=209.85.161.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V1vCswzR"
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-6dd4f3f696aso610389eaf.1
        for <linux-staging@lists.linux.dev>; Tue, 06 Oct 2026 18:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791337053; x=1791941853; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ct4rXXs0PtnWbJOqaUvpbRv2cVJCpPMHV6AEHhPMwjs=;
        b=V1vCswzRxumvuGRwYm3knY83Tmm/t2igC/gLEUzIJRz7bL4Tzz7UbHgjOGOmDJ+fas
         m0ZANJvHowyEYoRtucRtmnZmsVx2/t++8iUiDt8n5fGIo+VTInzpy/1i5LXlJ0AQ5+oV
         VL9MPKcRkk/JZVRSlCqiUBrbD5eqbdhzuuGxkK2r+U4Ja/EA6J28/wb8T0Ii9zxEq75t
         eR68ncbdluEeh4LBxQm7nNlbAQWU/EDvmPul4OhwYpJ5n8HZXVJhciWpDrBrcWN1Qnh2
         y1Ocdy41CoDvMitBbehUgcbxdezXD2xuN+KGKgCtq0nQPjR6H+mut1i0f99Xg+2yeafQ
         UZgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791337053; x=1791941853;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ct4rXXs0PtnWbJOqaUvpbRv2cVJCpPMHV6AEHhPMwjs=;
        b=M+yYgVrS4DZhUeS1YvoUg85Y/tlI8kIJOFx0TgoXD9/fbQqhEYLf+hiI6C6HQFi6Ql
         +2Rab3KS5KCzqyjrv/zfHjaz8Lsqael2pp9y2RkziqD7IuhLX7E3le14zgIPz5GLKu2Q
         wmi2on5FOAa35Vg9J7tJTHzVqgnaBhc4c+thFhRp+bkdUOU/XGBcPml+A11efTkDSB37
         n/+5HqoVJqIT4e0nT8Xw0l6ITHYPsNQeP0rQ/EnUAZqS1TpCup0zw+n5XnLlgV3rU5dL
         jEVXTzy56pURKNIOUoOxvAIj5JtNAt17BneGasA4/7KytZ7jzEkJoHiDRcvzP7UPVLZg
         nlUw==
X-Gm-Message-State: AFuF++kPGyZA/ZefTBUNsM97/r/icgurlgQ9hZAR750zDephR2Nm8bxP
	HVCLdWdTYzjSKn/+v7ZyAPeBUXy7TCmD7PUsCyn3TQtQ3VirTdVZkC0I3kRfa4Pj
X-Gm-Gg: AYBFou028QY6ajElP9qvwkbWB7tUDyUBE/+qzL5FbJMyFztYlfTwTo4kSUU9f3Jb4Ja
	iZ2wlo6apR93EocjPvMV+hCM0FQJHxdi+7qCr88/FRRCkOi7GJKCpVJq8aW4Sp5M0qm90s5AaaI
	VC3+AwBvA/SmAnAg8y2iq9iruAZasI/ojHT8RCTucKQVW6eMbxaKrSTmjZkwsXdgrXCb72M3P85
	MPu30jntRJ83ihvDzvMgJ3dITFJtX3/6nv/RRMqsk304iVN23ldsruTakCMqP5ZaqbJt1xKR3+m
	Y656JKwtYHD5b/2pH9MmBJ+xS9cM17BpFnZZeoUwSqvwHKHIDM7YHzDsXj/+Q80DOJKyup2hpkB
	/BUcD/9kYK0pgi6P8tO8BngXq1LRO1KjCyypD8TjeiK2fddyg9S8HH73R1MnGgTUKg7iv3P488+
	IOmg9DOFd2C05HH0DX3nhzHaXk2p9MJNKl/4ynk/SZNFgUBEgrVxw+injeOzgaKfZf3EtkK9S2A
	/tO8fzs8dA2nCRhcQ6nlcbU8oRO/zvkbA==
X-Received: by 2002:a05:6820:200e:b0:6c1:dc9f:ab2e with SMTP id 006d021491bc7-6e7a889e3b1mr944001eaf.27.1791337052909;
        Tue, 06 Oct 2026 18:37:32 -0700 (PDT)
Received: from Arch ([201.110.174.1])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a25728fad1sm966520fac.18.2026.10.06.18.37.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 18:37:32 -0700 (PDT)
From: =?UTF-8?q?I=C3=B1aki=20Sobera=20Sotomayor?= <inakisobera8@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?I=C3=B1aki=20Sobera=20Sotomayor?= <inakisobera8@gmail.com>
Subject: [PATCH 1/2] staging: rtl8723bs: remove unused EEPROM definitions
Date: Tue,  6 Oct 2026 19:35:21 -0600
Message-ID: <0c4bc57c3034233f330f620eeb03fd7d8f8de457.1791312824.git.inakisobera8@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

RTL8712_EEPROM_ID, HWSET_MAX_SIZE_128, HWSET_MAX_SIZE_256, CLOCK_RATE
and the EEPROM_*_OPCODE macros are leftovers from the original vendor
driver. None of them is referenced anywhere in the tree, so drop them.

HWSET_MAX_SIZE_512 is left in place because EEPROM_MAX_SIZE expands to
it.

No functional change intended.

Signed-off-by: Iñaki Sobera Sotomayor <inakisobera8@gmail.com>
---
 drivers/staging/rtl8723bs/include/rtw_eeprom.h | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_eeprom.h b/drivers/staging/rtl8723bs/include/rtw_eeprom.h
index 4294b021f1b..92eea3e2e70 100644
--- a/drivers/staging/rtl8723bs/include/rtw_eeprom.h
+++ b/drivers/staging/rtl8723bs/include/rtw_eeprom.h
@@ -8,24 +8,12 @@
 #define __RTW_EEPROM_H__
 
 
-#define	RTL8712_EEPROM_ID			0x8712
 /* define	EEPROM_MAX_SIZE			256 */
 
-#define	HWSET_MAX_SIZE_128		128
-#define	HWSET_MAX_SIZE_256		256
 #define	HWSET_MAX_SIZE_512		512
 
 #define	EEPROM_MAX_SIZE			HWSET_MAX_SIZE_512
 
-#define	CLOCK_RATE					50			/* 100us */
-
-/*  EEPROM opcodes */
-#define EEPROM_READ_OPCODE		06
-#define EEPROM_WRITE_OPCODE		05
-#define EEPROM_ERASE_OPCODE		07
-#define EEPROM_EWEN_OPCODE		19      /*  Erase/write enable */
-#define EEPROM_EWDS_OPCODE		16      /*  Erase/write disable */
-
 /* Country codes */
 #define USA							0x555320
 #define EUROPE						0x1 /* temp, should be provided later */
-- 
2.56.0

