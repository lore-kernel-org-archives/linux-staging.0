Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75C4820C023
	for <linux-staging@lists.linux.dev>; Sun,  8 Feb 2026 05:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770527628; cv=none; b=avZYJ/ir0KFcmtKqkxRhzOXGKMSVbohNr3mUoFRpP5UHecB5dZ3gOe4PsqfoO1Vl3io+4g0EqmYSsm2TTSm6M/RyIBmal6XNZTwKLeFg8OotsF93wtRm4+bRwC8HOSvZ0vjXv9qlR2K1y97/j/8ANZeXTUy6XfgBCkJzHDXuQcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770527628; c=relaxed/simple;
	bh=krqLToGwYMpcs6qEA8YZWE49DwoYgoO/qqej0hOfkqg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OcYyFJBteaXxKCRfjNHOzCwyv50MzlZLdazT898dxrEpvRZ2mzaYcOblrfB26JEsCBy2OVDOjUPg0rAtfi91Zoh0ObA82xoaLH2Dj3rODc2kif7LIF4x44oMColR5RLLZQwkUd6oG2vBUx4JFd/55js69YSrxsXnd6wMCKwcBt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h1hzauCO; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h1hzauCO"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-81f4dfa82edso910914b3a.0
        for <linux-staging@lists.linux.dev>; Sat, 07 Feb 2026 21:13:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770527628; x=1771132428; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=heGgX62koJOz09/98Ilwqv9fZuJPHyPSxx3pKDihyfc=;
        b=h1hzauCOTujQ3UQqCiv19Jiswv9Z4FxkBkig7ex0Jg21dyJcTeCgth9O6bsXBuKmV6
         vbSJYdcffTby52JxvVHGHLpfNR/XxwOxXaLz3ri86XX7NnWCS4s2bNKKVld7CO0Xd/ml
         Jmv6fDxkmR5Y/2mPmuXQoFsiJoOxCzqh6VHFoy4s2Jma2ya68G+O2qCo+kkbgaPIZPQa
         r+Wl53JOFqqtAcFa13iMfzfbYKCR1TOB0aqQRdadakrK5aa4eLwEI6TspsUa5Gc4gfCO
         9i5ZQutP9FGd0zQSM3js+GvuJV7SudOnRtkJYvETOl5StB2GHcH7sabVqGn+eqyXNknD
         Tbfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770527628; x=1771132428;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=heGgX62koJOz09/98Ilwqv9fZuJPHyPSxx3pKDihyfc=;
        b=QYg4TD5AKCLCW6ZsFYiF8asCzc6Vvyy7Kett02SW8hFVkL0np/x9Bm1m70o1DDeaj7
         Y8/dqdBHg4qCXqc+CNFTzmHS+ckZ9QCBEQidpSaNuLgmk/ZWbG+nV5FQIAS27o5std3P
         m4S2gwk8F1s+bBTaGO1fFKhFeZvy1kwvRtsEhFRqbd7iW0513DWBp4t8EetY4at77wum
         aP/nRjMxuttp4rnZOFENMKBQt3bIe8dTBnzn7iFss2p9+lgourkQ+O8fjnb2V3G+hPLp
         +PR1yP0v5pCaHegdi9PtKPrwpTNvMKc3i+dDPWNEkzsUhDdjb6Y4MDx1iwjsL40PcxnM
         I5KQ==
X-Forwarded-Encrypted: i=1; AJvYcCUhnSCsu4IeD+KtBz8xnOFLUttWv0MFAV0MlSoc3W0KoHJbqD83UsviD/9aYyBRJVP18t6Hp5HyQNzgdL/b@lists.linux.dev
X-Gm-Message-State: AOJu0YzuQ20Cm+zJGU9z6lcG/XE60nADj8u1Rh2J0zDe9bVMSFwZNn4t
	cSv5FtnaPtxlX2sOZ55/Vch+x+GieyJWsbJnhP0UKWkK2kRGGQMfwPmk
X-Gm-Gg: AZuq6aKQhcib0XWojuwLBmvSirvrXSr/H5Y9JR2/O8IWz4JIU4FKmeyA77rTAD95nYp
	AMxpGVD3zRo2FY9Ru9iK7Swt4QhnXY8yg5lth+P44mAhqZ5zQqW+iZaM0uVODILvepD7UgRrFhg
	n3dHy5se2+2dZCE+9bqW2x07FQByrRmLFzDrfGgHo60wOYMp+0HPwLYGNVaY7cfmrXSOWPYtYho
	1ni5X7Bo0VHekG1ak+v/wKUpFWZ1SCVweo0BURadmu0e90zB52tx0/13pWUyoIDNSNYXMENvCuz
	AQ2mGVb2C0L0Zc4to4yZv46oEpzIEdmXxYgWPRpp7cLZyk8QWdDjNgORcVJmIT7xvYJJdfXcBkQ
	v+OuXkVmDtfxDeTAO5NFTZu2nNWFwfPnu0FZ9DqV5BliPKysc0tu+Z+Ox6yL67icvlqkAfuswE8
	F1UnGz3+sMrRG08eW8/FUqv/3s1B4WoQeJa9TtMXOTRgPoQfsFFw==
X-Received: by 2002:a05:6a00:f08:b0:824:15ff:d35c with SMTP id d2e1a72fcca58-824417af640mr6991347b3a.63.1770527627716;
        Sat, 07 Feb 2026 21:13:47 -0800 (PST)
Received: from tabrez-VivoBook-ASUSLaptop-X513UA-KM513UA.. ([27.4.56.3])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82441695f7dsm6917847b3a.23.2026.02.07.21.13.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Feb 2026 21:13:47 -0800 (PST)
From: Tabrez Ahmed <tabreztalks@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@linaro.org,
	straube.linux@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tabrez Ahmed <tabreztalks@gmail.com>
Subject: [PATCH] staging: rtl8723bs: fix spacing around operators
Date: Sun,  8 Feb 2026 10:43:41 +0530
Message-ID: <20260208051341.38631-1-tabreztalks@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix checkpatch check:
CHECK: spaces preferred around that '+' (ctx:VxV)
CHECK: spaces preferred around that '-' (ctx:VxV)

The kernel coding style prefers spaces around binary operators for
better readability.

Signed-off-by: Tabrez Ahmed <tabreztalks@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_security.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_security.c b/drivers/staging/rtl8723bs/core/rtw_security.c
index 2f941ffbd465..f379af98f9db 100644
--- a/drivers/staging/rtl8723bs/core/rtw_security.c
+++ b/drivers/staging/rtl8723bs/core/rtw_security.c
@@ -1362,7 +1362,7 @@ u32 rtw_BIP_verify(struct adapter *padapter, u8 *precvframe)
 			goto BIP_exit;
 
 		/* MIC field should be last 8 bytes of packet (packet without FCS) */
-		if (!memcmp(mic, pframe+pattrib->pkt_len-8, 8)) {
+		if (!memcmp(mic, pframe + pattrib->pkt_len - 8, 8)) {
 			pmlmeext->mgnt_80211w_IPN_rx = temp_ipn;
 			res = _SUCCESS;
 		} else {
-- 
2.43.0

