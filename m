Received: from m16.mail.126.com (m16.mail.126.com [117.135.210.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DA28477E34
	for <linux-staging@lists.linux.dev>; Tue, 19 May 2026 09:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779184766; cv=none; b=N3CPspmMDTnuw/bOOLDg6DJcEj+aLF1Gb+PQij8DDCwxVqne0Fy8vYObExLQjlkYGQeph/romc0+rEBibqgdbBPCqUzpZ0vs7qK2R9NMrPnh4wk/bnvsnc14MsnxSrHvEoAFbOEBzM/egMMqmAD8UyhztnvGWjdQKa7HWTTYT+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779184766; c=relaxed/simple;
	bh=gRooj37K2KawzMvpm5/eN30FNqrhbzSxlI9J6OlhiYw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OQCr1Pf3heihd0a78jp4EjZgvljmxOxkbW8Fr7jEwlzE7sWGALLjuoFsjGVynsXCOiNh0P4hOp5HR16p32tbwHPnKQKsGE88nWibHpPTZ9zoYu2sk2ATBsQBNl9oOD5bVwIC7ZpNt4DPCtEVnzGYvd5S2HmfiS2dZYRcbEWCTZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com; spf=pass smtp.mailfrom=126.com; dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b=iiBrKLH+; arc=none smtp.client-ip=117.135.210.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=126.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b="iiBrKLH+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=T7
	cJb5gz5ANNADLPdXPOu5H1J25lCNDmFq9UbYiOPOE=; b=iiBrKLH+4At4HET4yf
	O96kSPKy0/I7azM3MfXtmB+U1HY1CHuBNm8lioXcaubjaQ9fS0guZSRaC1sr82ug
	k0z4xoH3lk/z+Ylw0dXhZsTCwK/ztbCW2XE11W+BmkQHS40ZJG++hvUa/zZMt6YS
	tIHnIkBcR/7ZJYfor7Ady6PuI=
Received: from DESKTOP-EQVOVNC.localdomain (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wD3X_VwNAxqsKwRCQ--.41303S3;
	Tue, 19 May 2026 17:59:12 +0800 (CST)
From: lixinyu <xinyuili@126.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/2] staging: rtl8723bs: replace C++ style comments with kernel style
Date: Tue, 19 May 2026 17:59:10 +0800
Message-Id: <20260519095911.880517-2-xinyuili@126.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260519095911.880517-1-xinyuili@126.com>
References: <20260519090114.828918-1-xinyuili@126.com>
 <20260519095911.880517-1-xinyuili@126.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3X_VwNAxqsKwRCQ--.41303S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7CrWDJF4rKr4kCFW8KF1fCrg_yoW8Gr1xpr
	Z7ury3Krs0qw1q9r4DJr1kZF1fua1kWasrKa1IvanYgFy7u343Xr98Kr109r45XrW7J3WY
	qrn5Xw18W3Z8Gr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jd73kUUUUU=
X-CM-SenderInfo: 50lq53xlolqiyswou0bp/xtbBoBDGD2oMNHB-uAAA3c

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

