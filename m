Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CA2C71
	for <linux-staging@lists.linux.dev>; Thu, 20 May 2021 06:41:47 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9478060FE8;
	Thu, 20 May 2021 06:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1621492907;
	bh=tm/kVLSevT7w4n9D2krMeY3gouzh1HlUzMJ7mOwIv9g=;
	h=From:To:Cc:Subject:Date:From;
	b=bsxO3/TfcWRa53SCTjz+tibRvH/R82ktBt1f48tSniRbWG7KjgDLRT/GxwAl/ARfO
	 4e2aQIrdtxDxMsa02GbDLJz0/d74mgA4yZxOEfOZcgN24qJHq6xWc3J1GdBgFjvoZ1
	 YjhkPvHCJs9pYnOMSRxo66ZrAyH8UoTk1pQKIg70=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-staging@lists.linux.dev
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH] staging: rtl8723bs: rtl8723b_hal_init.c: fix build warnings about unused variables
Date: Thu, 20 May 2021 08:41:44 +0200
Message-Id: <20210520064144.1953251-1-gregkh@linuxfoundation.org>
X-Mailer: git-send-email 2.31.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

0-day keeps spitting out annoying messages:

drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c:3895:18: warning: variable 'ra_info2' set but not used [-Wunused-but-set-variable]
drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c:3895:8: warning: variable 'ra_info1' set but not used [-Wunused-but-set-variable]

Oddly, it's not catching all of the "set but not used" variables in this
switch statement.  Fix it up just removing the storage of the values
read.  Leave the read from the hardware as odds are it is required in
order to keep it working properly as I do not have the hardware to test
with.

I bet the whole case can be removed, but that will have to wait until
later...

Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index 33942ab58772..6359cd661374 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -3892,22 +3892,19 @@ u8 GetHalDefVar8723B(struct adapter *padapter, enum hal_def_variable variable, v
 		{
 			u8 mac_id = *(u8 *)pval;
 			u32 cmd;
-			u32 ra_info1, ra_info2;
-			u32 rate_mask1, rate_mask2;
 
 			cmd = 0x40000100 | mac_id;
 			rtw_write32(padapter, REG_HMEBOX_DBG_2_8723B, cmd);
 			msleep(10);
-			ra_info1 = rtw_read32(padapter, 0x2F0);
+			rtw_read32(padapter, 0x2F0);	// info 1
 
 			cmd = 0x40000400 | mac_id;
 			rtw_write32(padapter, REG_HMEBOX_DBG_2_8723B, cmd);
 			msleep(10);
-			ra_info1 = rtw_read32(padapter, 0x2F0);
-			ra_info2 = rtw_read32(padapter, 0x2F4);
-			rate_mask1 = rtw_read32(padapter, 0x2F8);
-			rate_mask2 = rtw_read32(padapter, 0x2FC);
-
+			rtw_read32(padapter, 0x2F0);	// info 1
+			rtw_read32(padapter, 0x2F4);	// info 2
+			rtw_read32(padapter, 0x2F8);	// rate mask 1
+			rtw_read32(padapter, 0x2FC);	// rate mask 2
 		}
 		break;
 
-- 
2.31.1

