Received: from m16.mail.126.com (m16.mail.126.com [220.197.31.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C47F3D3D06
	for <linux-staging@lists.linux.dev>; Tue, 19 May 2026 09:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779184652; cv=none; b=QB39eyldQtdV/w5IqQmJ0CDGFvBea247BO5DuZi5VcPHiCOcWiOc9GqZOv0ttYlrwjxz69/1JcP9KkorjMtfIOlMmKO3TpDrV0RJ/U0WvWqa/kYGD700DnJ1677rLnLpO5w/Tx/JhmJ2s7vHNH4nIifGZwCiviIfdxt2ItLWziE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779184652; c=relaxed/simple;
	bh=gRooj37K2KawzMvpm5/eN30FNqrhbzSxlI9J6OlhiYw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=omyU1/HjsFtZmoHvZBdy7qPv6gU03tH1QrA0IKtIR2cPpFceY33xaeizyxE8lfru8fPAJ0mg1dIz+RP7MX8Bp/yguia9xcMn1vJT8RfBmNFHWaEcxmV6g2RROUtKo1SFWS/PSHJJaCX3a2HNv9ATa7rjIDscWnmzRHK38pdV0yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com; spf=pass smtp.mailfrom=126.com; dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b=dMNYNzvX; arc=none smtp.client-ip=220.197.31.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=126.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b="dMNYNzvX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=T7
	cJb5gz5ANNADLPdXPOu5H1J25lCNDmFq9UbYiOPOE=; b=dMNYNzvXTh8HYMG6OK
	BF1NFz2dnCY0Z6iv7kVWUYfqdSOLPQ+SHp6ALmQ30OlEwGlqd0M70i9/fot/EOwC
	mf/XU7usGydTlQ5/TRDDjGn3pO2IwDCOTZEeEpGFaMfy5eeEz9izv1JRoMzKttHz
	sxs3eEW1Q8v7LOMv+Bu9V6L6M=
Received: from DESKTOP-EQVOVNC.localdomain (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wD3v_X9Mwxqg0AXBw--.63806S3;
	Tue, 19 May 2026 17:57:18 +0800 (CST)
From: lixinyu <xinyuili@126.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/2] staging: rtl8723bs: replace C++ style comments with kernel style
Date: Tue, 19 May 2026 17:57:16 +0800
Message-Id: <20260519095717.878742-2-xinyuili@126.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260519095717.878742-1-xinyuili@126.com>
References: <20260519090114.828918-1-xinyuili@126.com>
 <20260519095717.878742-1-xinyuili@126.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3v_X9Mwxqg0AXBw--.63806S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7CrWDJF4rKr4kCFW8KF1fCrg_yoW8Gr1xpr
	Z7ury3Krs0qw1q9r4DJr1kZF1fua1kWasrKa1IvanYgFy7u343Xr98Kr109r45XrW7J3WY
	qrn5Xw18W3Z8Gr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j24ENUUUUU=
X-CM-SenderInfo: 50lq53xlolqiyswou0bp/xtbBrh6p8WoMM-6RCwAA3Z

Replace C++ style comments (//) with kernel style comments (/* */)
in rtl8723b_hal_init.c.

Signed-off-by: lixinyu <xinyuili@126.com>
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

