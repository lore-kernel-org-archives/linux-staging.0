Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EA0F30CDB0
	for <linux-staging@lists.linux.dev>; Tue, 10 Feb 2026 16:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770741441; cv=none; b=Ey5dhtSLv3Bz4IucW6jCbyBPmDJTpLl+A7aiVtookoRh31QI6zGQMP1N+/kD6O0GDYFsItMaXPONhHwNgriQiU56oX9SbfnK+yUcUhatsXRuXEO8P9K09hpIkds7d80g4Gfn0IEil5GjkXcgs8/Bdz9k0PNg3Fz6hvbJc4WA7fM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770741441; c=relaxed/simple;
	bh=367it1VDoOlVajjt7sUqxrxRyQG/cFjEvSzFEvtxSnE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tIOwniTdwPiGCwnx+hdn9+E27YwRq0VsgZd0HAVZ7CwrDp3IGRiBcqa7TtCfBZjGHoYLtrqW602KWLnYOXvnQVgWFGwNPdMXLHq8tjb5RNzMmxCFHqh9xu0z9bpCdvoAcLUxARF5nSMNAQC71dReazFPFT2zsDf4j+N6U55e4ck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nCfpBKFj; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nCfpBKFj"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b88593aa4dcso799933966b.3
        for <linux-staging@lists.linux.dev>; Tue, 10 Feb 2026 08:37:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770741438; x=1771346238; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4XnWN1MIuHhxGE05BzDSukgBYumhzWpsWffKqSkpAtM=;
        b=nCfpBKFjcBDw5I8ozhFyXhU+RWlZz0aEGxfi0RNMh1T9mUgBfkxGNEhyIHXk1mrPUJ
         iso3KxiYRuLVj1YZTt6GmWQJfM5VNW46gpG7huIpEAYA+Ll9sxMSVsTQHW9KgN5Inu93
         h9pgUeCDnwHAp952XclwUVMYM324zP5s4frJ3d0ZUKTndfc1nPzwtjpQrgnxjhtqE4T5
         0wDEPVaLjhYlYYRdK0Oft9+I3sKpWd82Qt9nJtPXVT5IXjK34S5duGZtBEnKUhybtuso
         NhZGgZRGTvJFRbz3CPMAXsE5NwdcIQWsOmsIonV1KeIkQ9rtRGAcwwkSB4KDTVzi1ZeS
         o70w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770741438; x=1771346238;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4XnWN1MIuHhxGE05BzDSukgBYumhzWpsWffKqSkpAtM=;
        b=QKjERmd81nE6d6pz0mJ8WEm66Dv6XN3SCYsuOPWvx1o1IQpk4X/DJ36TrmHr3nYdMf
         N6sSvXCONHfJZZhd9cquzRx1CJ6YljUDxJ9CXu2HqtgA20ukcyTPQGFOrcZ1JNUF6qH/
         fXdGqNfGwoC3yC4iaMEa+hLqsBcUc/aM121Q2RYq3DQrAnYdNG4z34+6eMOXgr1UqQZG
         xRcUa3p55mdbYcpNC19Vp6Y0DC13WpbX932O59EoTJUW+4hPAKtHXbJ+URsw4ph9MDs0
         H+EBc6QWtet0q01MHnyj8kb+NUZJtimz8Ny2mjuQjbpG5u6K4+izu5+5vgkgvqaruzw4
         eApA==
X-Gm-Message-State: AOJu0Yw7n1/Eiwrcs279aXz9w+c4ELaqgoqdmZTQtMzVS7UY2N2xS73I
	Zb6llCa/yjl0+cDfrE7Grg/0LRrUbH7WzpIO+qNOTzwdv8MZi3PPTxjm
X-Gm-Gg: AZuq6aL7bPzvcUKsO7Z6j4BdoLTY5wOUPaKIRvpJ4Wtu/f76nCbJDpTgACTpAg8RFsZ
	C/KfLx4B2GsaSUu2wuxmSFHZdEOAzrFWVP+C/DC87e9vmRtdlHbvDbUCGDht/dfPj/Dkj5LzH3W
	ABHrux8+zsqdq07XgdQ8J0PeA0V6SgKq9+F56LiNzr7pUcYuohuJeByP4dcVSO37B4oL2LUbl/p
	vCKR1bjd+QY+qCPLpL/EcB5iU/fLjVfo8p4IIZuXJ8JIa6jTi5hZww5OHLskC/WqddSu7d5M3E0
	XrR9ez+pAtKMzI/Nn2grIkGY1mt8TMg1nBu4Hc0BR85sdfHtz+GhKjQiCqCE4yE8LpzIwkvs/r4
	wEh90gJ6h6/yUfrmhggJQvrblbHHk15n5N+lL2xzKLHQjf9U5cK57/gOLkpozJJN0DSfZ0kGKv8
	JHalp67OlhwJLUXnbcwRp1D1tcfwCtWbatv/xARQ==
X-Received: by 2002:a17:906:4795:b0:b73:667e:bb29 with SMTP id a640c23a62f3a-b8f5438ffa0mr175213066b.8.1770741437516;
        Tue, 10 Feb 2026 08:37:17 -0800 (PST)
Received: from arch (wlan-208086.nbw.tue.nl. [131.155.208.86])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8eda7a46ffsm552766066b.17.2026.02.10.08.37.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 08:37:17 -0800 (PST)
From: Haroen Tmimi <tmimiharoen@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Haroen Tmimi <tmimiharoen@gmail.com>
Subject: [PATCH] staging: rtl8723bs: remove shadowed variable in sdio_halinit
Date: Tue, 10 Feb 2026 17:37:14 +0100
Message-ID: <20260210163714.47719-1-tmimiharoen@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The variable 'bMacPwrCtrlOn' was redeclared in the function
CardEnable, shadowing a variable of the same name declared at the
top of the function (line 21).

Remove the redundant 'u8' type declaration to use the existing outer
variable and resolve a -Wshadow warning.

Signed-off-by: Haroen Tmimi <tmimiharoen@gmail.com>
---
 drivers/staging/rtl8723bs/hal/sdio_halinit.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/hal/sdio_halinit.c b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
index 0fa1b22fdf9a..861d5162de15 100644
--- a/drivers/staging/rtl8723bs/hal/sdio_halinit.c
+++ b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
@@ -30,7 +30,7 @@ static u8 CardEnable(struct adapter *padapter)
 
 		ret = HalPwrSeqCmdParsing(padapter, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_SDIO_MSK, rtl8723B_card_enable_flow);
 		if (ret == _SUCCESS) {
-			u8 bMacPwrCtrlOn = true;
+			bMacPwrCtrlOn = true;
 			rtw_hal_set_hwreg(padapter, HW_VAR_APFM_ON_MAC, &bMacPwrCtrlOn);
 		}
 	} else
-- 
2.53.0

