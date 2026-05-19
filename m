Received: from m16.mail.126.com (m16.mail.126.com [117.135.210.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D456D39282C
	for <linux-staging@lists.linux.dev>; Tue, 19 May 2026 09:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779184009; cv=none; b=WYxi3v/VGl6zpAIx2xRpKuaS2c4IbSSpgpg2z/gR+dM3pBmdIcZPbCVSCzYUzpsfXJi49DIhOfMrL4R7gm9zvw9M+zjFxu4h64BEjB4A7cfBl1A5WEqcuMdtpRpYkjpnVhVcufZYCIHfqcH6HfWkitbL0u8Kpk9YuECeCEQiWh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779184009; c=relaxed/simple;
	bh=CSICgJrYHPQMJ8YAC/O27aOVVi9IAJPafcgoMZNM/bs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=X+FEyuPNS1TQfIIw2xLAmLV0peHJ0DHg0gO0Xs1G5Gdc+19ORGlUXC3znDf5/3/RSVUOg9dvbytHKNSUvLDAqh8b7pXpxLb1PEgRyb0aYL+Lc9TsPp8r7Ym4143e/VAjuxcNjiigroDTH0JSkBmF+s3s+oZtJy1zs81ER5FJQsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com; spf=pass smtp.mailfrom=126.com; dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b=OS+CwQPq; arc=none smtp.client-ip=117.135.210.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=126.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b="OS+CwQPq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=Oc
	MMjMJFRoHZSSWwbns9LSAwRbAkAZjbhxx++vgKVRU=; b=OS+CwQPq8hUJ5nhXBX
	Y0ssaYhbkSywyfnhBhmHy4rT1akrEa1+I2GHKzK51DyIIdzk7SJWrB49n51mBy/T
	wNxTJaflC5yrj3q6o6ga08TL7nrT9fu82YbSzGZzIRAxPyvA0dSI+CUh5Ecxo7bF
	YqdsERh0dVyqu4K4yiO4yh3Ys=
Received: from DESKTOP-EQVOVNC.localdomain (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wDnryN6MQxqbACWBw--.65405S3;
	Tue, 19 May 2026 17:46:34 +0800 (CST)
From: lixinyu <xinyuili@126.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] staging: rtl8723bs: replace C++ style comments with kernel style
Date: Tue, 19 May 2026 17:46:32 +0800
Message-Id: <20260519094633.869233-2-xinyuili@126.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260519094633.869233-1-xinyuili@126.com>
References: <20260519090114.828918-1-xinyuili@126.com>
 <20260519094633.869233-1-xinyuili@126.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDnryN6MQxqbACWBw--.65405S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7CrWDuw45Ar43WrW8WFW8Crg_yoW8Jw4Dpr
	Z7Z343Kr4Yqw1q9r4DJrn7ZF1fuan7WasrKayIvanYqFy7u347Xr98Kr10kr45urW7G3WY
	qrn5Xw1UW3ZxKr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jlxRhUUUUU=
X-CM-SenderInfo: 50lq53xlolqiyswou0bp/xtbBrxsIUGoMMXt7vwAA3E

Replace C++ style comments (//) with kernel style comments (/* */)
in rtl8723b_hal_init.c.

Assisted-by: Claude:claude-4-opus
---
 drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index 2a748367fbba..2c98ecc98ce5 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -2877,15 +2877,15 @@ u8 GetHalDefVar8723B(struct adapter *padapter, enum hal_def_variable variable, v
 
 			rtw_write32(padapter, REG_HMEBOX_DBG_2_8723B, cmd);
 			msleep(10);
-			rtw_read32(padapter, 0x2F0);	// info 1
+			rtw_read32(padapter, 0x2F0);	/* info 1 */
 
 			cmd = 0x40000400 | mac_id;
 			rtw_write32(padapter, REG_HMEBOX_DBG_2_8723B, cmd);
 			msleep(10);
-			rtw_read32(padapter, 0x2F0);	// info 1
-			rtw_read32(padapter, 0x2F4);	// info 2
-			rtw_read32(padapter, 0x2F8);	// rate mask 1
-			rtw_read32(padapter, 0x2FC);	// rate mask 2
+			rtw_read32(padapter, 0x2F0);	/* info 1 */
+			rtw_read32(padapter, 0x2F4);	/* info 2 */
+			rtw_read32(padapter, 0x2F8);	/* rate mask 1 */
+			rtw_read32(padapter, 0x2FC);	/* rate mask 2 */
 		}
 		break;
 
-- 
2.34.1

