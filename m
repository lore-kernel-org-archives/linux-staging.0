Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 047113CF58
	for <linux-staging@lists.linux.dev>; Thu, 12 Sep 2024 02:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726108065; cv=none; b=sAIlaDWJnJkpR0P65BYMK2m/33+dernLtp9j2Qh8aFDWjndxJOIXzlQ4hUNSMynyc9NLuAliAkKoiJf2G5aytwVDZGDoUpYZN1iuqs24AzE9ojLpl2FaARoEr7mzn7OP5Hd00U2AKWzhO8gL9Slftu0WqnQU2GAMaAJgFIVfZSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726108065; c=relaxed/simple;
	bh=BzE9rpHZ3AtIMdF37M0D4NilrAeOtwrfIGflu9Kw9YU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JFKmxx2zjU3orRAH44I5GS34jpA00DFdKVHxhhdSahTJ9fCqmhsinl+o474ATiq+AjQ+ygXUGQAHft5VxaMLQJnCCcvabLl0bOdMtId8/I95fgcBmilRyXHVQ+JBRcBqUg/QvsPrJW1PTQ05tgcmKZepNeBouIDD1kWSusE5dzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=temperror (0-bit key) header.d=realtek.com header.i=@realtek.com header.b=pDHBho2a; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=realtek.com header.i=@realtek.com header.b="pDHBho2a"
X-SpamFilter-By: ArmorX SpamTrap 5.78 with qID 48C2ReAK2521285, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=realtek.com; s=dkim;
	t=1726108060; bh=BzE9rpHZ3AtIMdF37M0D4NilrAeOtwrfIGflu9Kw9YU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=pDHBho2aPGgvdHl7yScU7cJDmkR95y3tFtvZbivLy4p0mO5vgXlznU8GUnXao5p54
	 OeTSyUjM1v9Ckvuha1O0+bqrJY7Be4XL53rF060Ijez9ku4XN62eXhJvTnCzp2voC2
	 z+BB558uokLwTHGTHbLEU7C89CMs2mecX1fA/2x+lVDlPuHrY4glSX0YcSV40SuvCR
	 6U6Bf7qhT490cDJ96UGhthM1AYqBPABXuawTtbn72FabpPLwSP32tPaXaDPspJpeLi
	 964P8sOpkoxyetIuCxbgm5Ws5ZCN55NOBm994xqpWhfWflI8h+glmAN/4GjGS/pKzA
	 gSDT1W9KaqFPQ==
Received: from mail.realtek.com (rtexh36506.realtek.com.tw[172.21.6.27])
	by rtits2.realtek.com.tw (8.15.2/3.05/5.92) with ESMTPS id 48C2ReAK2521285
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 12 Sep 2024 10:27:40 +0800
Received: from RTEXMBS04.realtek.com.tw (172.21.6.97) by
 RTEXH36506.realtek.com.tw (172.21.6.27) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 12 Sep 2024 10:27:39 +0800
Received: from [127.0.1.1] (172.21.69.94) by RTEXMBS04.realtek.com.tw
 (172.21.6.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Thu, 12 Sep
 2024 10:27:39 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: <gregkh@linuxfoundation.org>
CC: <linux-staging@lists.linux.dev>
Subject: [PATCH 4/4] staging: rtl8723bs: remove unused 'poll_cnt' from rtw_set_rpwm()
Date: Thu, 12 Sep 2024 10:25:22 +0800
Message-ID: <20240912022522.10715-5-pkshih@realtek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240912022522.10715-1-pkshih@realtek.com>
References: <20240912022522.10715-1-pkshih@realtek.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: RTEXMBS02.realtek.com.tw (172.21.6.95) To
 RTEXMBS04.realtek.com.tw (172.21.6.97)

The 'poll_cnt' is used to assist in polling hardware state. Current code
uses jiffies to determine timeout, so removing this value is safe.

Otherwise, clang warns:

core/rtw_pwrctrl.c:288:6: warning:
	 variable 'poll_cnt' set but not used [-Wunused-but-set-variable]
  288 |                 u8 poll_cnt = 0;
      |                    ^

Signed-off-by: Ping-Ke Shih <pkshih@realtek.com>
---
 drivers/staging/rtl8723bs/core/rtw_pwrctrl.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
index e9763eab16f6..82f6a63226bc 100644
--- a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
+++ b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
@@ -285,14 +285,12 @@ void rtw_set_rpwm(struct adapter *padapter, u8 pslv)
 	if (rpwm & PS_ACK) {
 		unsigned long start_time;
 		u8 cpwm_now;
-		u8 poll_cnt = 0;
 
 		start_time = jiffies;
 
 		/*  polling cpwm */
 		do {
 			mdelay(1);
-			poll_cnt++;
 			rtw_hal_get_hwreg(padapter, HW_VAR_CPWM, &cpwm_now);
 			if ((cpwm_orig ^ cpwm_now) & 0x80) {
 				pwrpriv->cpwm = PS_STATE_S4;
-- 
2.25.1

