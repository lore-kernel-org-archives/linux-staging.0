Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21D0B17FD
	for <linux-staging@lists.linux.dev>; Fri, 13 Sep 2024 00:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726187345; cv=none; b=mGDzcYltj1DXhCEl5ibj2MmsMdc4/54rCLAUbDRQZuQWl9tslDP52vzhgzhfWrKJ1S+WawlheCOWXrxU3a5oP689CFS3fz7LzcaTkppdTBKp5fAfkr+4QlFW92xuFxhTkMQxtBSKrTYMULxR+Xh0Ckb4Xxnu/Q2l0Q6GH7qXjIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726187345; c=relaxed/simple;
	bh=EngLON1Fj98k3BjRNHJ9N1FPv3IMVIJ/FJJsOmkwN6U=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FqJIJkaiUygSQffzymdd3Wd5RrV+xx9AcA/4bj1e6HUzPIKWbthUHXdkndWJfXPVBsanK279sxwsc3r/aWsLQwwZMnvCM7S9IBZSk7xQnlTZtGU4b1s7aqNoWO+izbtRd44g4V3hN5ILctRR2RpDwJTlF8QkzyrUto1ormQdCHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=temperror (0-bit key) header.d=realtek.com header.i=@realtek.com header.b=bf3zMjMF; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=realtek.com header.i=@realtek.com header.b="bf3zMjMF"
X-SpamFilter-By: ArmorX SpamTrap 5.78 with qID 48D0T01402030661, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=realtek.com; s=dkim;
	t=1726187340; bh=EngLON1Fj98k3BjRNHJ9N1FPv3IMVIJ/FJJsOmkwN6U=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=bf3zMjMFVxJ0Gix4Th3GaujQ2Z7cN4yu0qMBE4zpfpFD1GVf5Z25AyJnD+kMV3WM1
	 /kcmRdHF8RtZkoaf8ZRDPi4+6+CD4mV6t+7wvp25qgboTMGiQWljexZ1O610YPD1FL
	 rSxHU5Ew3ePBzWQEaZGqudpGSJcq5SBU+22OGEdif+Z3IEq7hZS+37Nfegn+OQbqBN
	 3icJ6SwLnANr2u5CjOeffTuxK4Q9ZnwNYAHV7jYBn7dEWnHFgm0hp0TlyEbpwOWEkm
	 xpzBnyyuEniWSo6uTSmR8vcJU/Vh3TN4Qu/+3drz9eTs05rMQho+EksG/jeOw5rA4F
	 ma0VhN/8SNsDA==
Received: from mail.realtek.com (rtexh36506.realtek.com.tw[172.21.6.27])
	by rtits2.realtek.com.tw (8.15.2/3.05/5.92) with ESMTPS id 48D0T01402030661
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <linux-staging@lists.linux.dev>; Fri, 13 Sep 2024 08:29:00 +0800
Received: from RTEXMBS04.realtek.com.tw (172.21.6.97) by
 RTEXH36506.realtek.com.tw (172.21.6.27) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 13 Sep 2024 08:29:01 +0800
Received: from [127.0.1.1] (172.21.69.94) by RTEXMBS04.realtek.com.tw
 (172.21.6.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Fri, 13 Sep
 2024 08:29:00 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: <linux-staging@lists.linux.dev>
Subject: [PATCH v2 4/4] staging: rtl8723bs: remove unused 'poll_cnt' from rtw_set_rpwm()
Date: Fri, 13 Sep 2024 08:28:15 +0800
Message-ID: <20240913002815.5149-5-pkshih@realtek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240913002815.5149-1-pkshih@realtek.com>
References: <20240913002815.5149-1-pkshih@realtek.com>
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
index a95092129748..dbfcbac3d855 100644
--- a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
+++ b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
@@ -284,14 +284,12 @@ void rtw_set_rpwm(struct adapter *padapter, u8 pslv)
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

