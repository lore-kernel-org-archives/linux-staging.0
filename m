Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8762826A1AC
	for <linux-staging@lists.linux.dev>; Wed, 24 Jun 2026 19:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.252.153.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782329547; cv=none; b=eckHJ2DMailElQf0UIxkBiDjhNyufllFIflWpZRbnOKbd17EYNbkuekrNvxC0XQ0sHtnD0qCVZi4Z5NctaJeBlLGR51UYC4HFc99IbtH9+mntWMAYXJcOWXl9NFb6G79SEqkhF4VGKptL3MDsCHJxXepxeL3DhWAejeZMcaw4PM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782329547; c=relaxed/simple;
	bh=VNckIGxvq1A31I9DxJKZVO7m4fceo7yrHK5XmVvF6oA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CIaWGuHMhdLaiQFbZWF4nqAG5BrRPu97E9Yq5pVqp5Df5yhjbLxKNQULF7S8CC+Nb2QUWD5a+S34LUTg/n+a+RJf2XIqDpFHRjTjYkz9CiLD0t/Ge8Cfp7nwHse1eIM0Q4579X2lhSxgLhUb267V3ZmIvGalZITmOz/d1CsDRpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net; spf=pass smtp.mailfrom=riseup.net; dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b=qN3z89oE; arc=none smtp.client-ip=198.252.153.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riseup.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b="qN3z89oE"
Received: from fews04-sea.riseup.net (fews04-sea-pn.riseup.net [10.0.1.154])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx1.riseup.net (Postfix) with ESMTPS id 4glsX26M86zDqCZ;
	Wed, 24 Jun 2026 19:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=riseup.net; s=squak;
	t=1782329539; bh=KQyJY0+jh219h9N18i/S1/EpS1nL7j5y4vpm+85ujcY=;
	h=From:To:Cc:Subject:Date:From;
	b=qN3z89oE4Y1Xlt+QFKa66P+0VKNLw0Yg5o5P0R+bJQZaw4m235Dag6Kd1pZxlixkr
	 ZgQxb6uuC57Xf2vUHVdScwjw1Er/j94ksxS7u3u+OOql2aZHsJjfzJR07a1YmNW8jZ
	 dGzBM7VE7IvkRRIvP0kH5cOlP8a6Mzd+8xxXxzdY=
X-Riseup-User-ID: A04DF5E6E4DA184F7175B4E301AF637039DB0A12EF9667B225670001177F1C5A
Received: from [127.0.0.1] (localhost [127.0.0.1])
	 by fews04-sea.riseup.net (Postfix) with ESMTPSA id 4glsX200VRz5vcM;
	Wed, 24 Jun 2026 19:32:17 +0000 (UTC)
From: Alonso Garrigues <agarrigues@riseup.net>
To: gregkh@linuxfoundation.org
Cc: guojy.bj@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Alonso Garrigues <agarrigues@riseup.net>
Subject: [PATCH] staging: rtl8723bs: clean up style issues in rtl8723b_cmd.c
Date: Wed, 24 Jun 2026 20:31:10 +0100
Message-ID: <20260624193110.1426826-1-agarrigues@riseup.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Split long do-while conditions across multiple lines and add spaces
around binary operators. Fix indentation of misaligned comments.

Signed-off-by: Alonso Garrigues <agarrigues@riseup.net>
---
 drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c | 39 +++++++++++++-------
 1 file changed, 26 insertions(+), 13 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c b/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
index c35c7f1c38ef..d31d8e445dcc 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
@@ -74,7 +74,7 @@ s32 FillH2CCmd8723B(struct adapter *padapter, u8 ElementID, u32 CmdLen, u8 *pCmd
 		else {
 			memcpy((u8 *)(&h2c_cmd)+1, pCmdBuffer, 3);
 			memcpy((u8 *)(&h2c_cmd_ex), pCmdBuffer+3, CmdLen-3);
-/* 			*(u8 *)(&h2c_cmd) |= BIT(7); */
+			/* *(u8 *)(&h2c_cmd) |= BIT(7); */
 		}
 
 		*(u8 *)(&h2c_cmd) |= ElementID;
@@ -416,13 +416,14 @@ void rtl8723b_set_FwPwrMode_cmd(struct adapter *padapter, u8 psmode)
 
 		}
 
-/* offload to FW if fw version > v15.10
-		pmlmeext->DrvBcnEarly = 0;
-		pmlmeext->DrvBcnTimeOut =7;
+		/* offload to FW if fw version > v15.10 */
+		/* pmlmeext->DrvBcnEarly = 0; */
+		/* pmlmeext->DrvBcnTimeOut =7; */
 
-		if ((pmlmeext->DrvBcnEarly!= 0Xff) && (pmlmeext->DrvBcnTimeOut!= 0xff))
-			u1H2CPwrModeParm[H2C_PWRMODE_LEN-1] = BIT(0) | ((pmlmeext->DrvBcnEarly<<1)&0x0E) |((pmlmeext->DrvBcnTimeOut<<4)&0xf0) ;
-*/
+		/* if ((pmlmeext->DrvBcnEarly!= 0Xff) && (pmlmeext->DrvBcnTimeOut!= 0xff)) */
+		/*	u1H2CPwrModeParm[H2C_PWRMODE_LEN-1] = */
+		/*	    BIT(0) | ((pmlmeext->DrvBcnEarly<<1)&0x0E) | */
+		/*	    ((pmlmeext->DrvBcnTimeOut<<4)&0xf0) ; */
 
 	}
 
@@ -657,9 +658,15 @@ void rtl8723b_download_rsvd_page(struct adapter *padapter, u8 mstatus)
 				/*  check rsvd page download OK. */
 				rtw_hal_get_hwreg(padapter, HW_VAR_BCN_VALID, (u8 *)(&bcn_valid));
 				poll++;
-			} while (!bcn_valid && (poll%10) != 0 && !padapter->bSurpriseRemoved && !padapter->bDriverStopped);
+			} while (!bcn_valid &&
+				 (poll % 10) != 0 &&
+				 !padapter->bSurpriseRemoved &&
+				 !padapter->bDriverStopped);
 
-		} while (!bcn_valid && DLBcnCount <= 100 && !padapter->bSurpriseRemoved && !padapter->bDriverStopped);
+		} while (!bcn_valid &&
+			 DLBcnCount <= 100 &&
+			 !padapter->bSurpriseRemoved &&
+			 !padapter->bDriverStopped);
 
 		if (padapter->bSurpriseRemoved || padapter->bDriverStopped) {
 		} else {
@@ -919,12 +926,18 @@ void rtl8723b_download_BTCoex_AP_mode_rsvd_page(struct adapter *padapter)
 		DLBcnCount++;
 		do {
 			yield();
-/* 			mdelay(10); */
-			/*  check rsvd page download OK. */
+			/* mdelay(10); */
+			/* check rsvd page download OK. */
 			rtw_hal_get_hwreg(padapter, HW_VAR_BCN_VALID, &bcn_valid);
 			poll++;
-		} while (!bcn_valid && (poll%10) != 0 && !padapter->bSurpriseRemoved && !padapter->bDriverStopped);
-	} while (!bcn_valid && (DLBcnCount <= 100) && !padapter->bSurpriseRemoved && !padapter->bDriverStopped);
+		} while (!bcn_valid &&
+			 (poll % 10) != 0 &&
+			 !padapter->bSurpriseRemoved &&
+			 !padapter->bDriverStopped);
+	} while (!bcn_valid &&
+		 (DLBcnCount <= 100) &&
+		 !padapter->bSurpriseRemoved &&
+		 !padapter->bDriverStopped);
 
 	if (bcn_valid) {
 		struct pwrctrl_priv *pwrctl = adapter_to_pwrctl(padapter);
-- 
2.54.0

