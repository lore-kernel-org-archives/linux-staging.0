Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37B472D7386
	for <linux-staging@lists.linux.dev>; Wed, 24 Jun 2026 21:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782338296; cv=none; b=ctawIqYla4YXZpdBxhZCbW8zbmFmdmc2tkRuPavbOqmbKsNYyWxCyLron5UdBLsg+nEpPyqdB47oF3B07aMMuOzoWFnzhQB6baEUt3AWErWoP0Buytnzs+jM8vyA3OV14RwLGVb+zXkx1y/Y3imnKqimHKwDd7fmG5eNKPstXxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782338296; c=relaxed/simple;
	bh=J0TBYsaLmM+bOq8tzz5Wg9fNZmnslhG+JxLYh4qLUEU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=G87OKhzTF0md5kuoWbZfzgqZxplRmUkZ/QqLnQybWu0GX3YBrQ3fkIHQ3Ilhi9Bpb4WowE2wAPHeb0bo3Ya1UAK8uRqCtITSgDPh3U8g5OSNisZC5vqOHQeGFF9fyMh27Gdx/VKXbg66Gr451fmGoTs/qbQUOwJvIV6IP+gpeLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rNV6eRHZ; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rNV6eRHZ"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-845438a46d4so1132474b3a.3
        for <linux-staging@lists.linux.dev>; Wed, 24 Jun 2026 14:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782338294; x=1782943094; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fZpP+OdKjTlIjTBHXSAEFDT/EOMsfzbgt+r1GJr2CQg=;
        b=rNV6eRHZoMzWDt477MfQv3aYDb7KVKExuomDFhAKjkBl2B/y59HXRpaR/PbkfXyPnE
         NRf5RCC0TgYJuYM2rTmQ9ZEY4BpmFUBOAw7SL7dD9hHlM5szeJdb05m63dcyYn3grst6
         o5AQ2ffY806iQrTaTEvj6FnuRB2oST3RH6NP5qc9F6MUyAXDVqXJnrIjQxX8l7vgnUaf
         g5pq4ySOxG+bP6aO8G/hGPCJqFNQSXLi1wbAKRynh0BvlefC9AMbtAN5pDr8EBlurQOc
         j+jttmcF+YevZoH0FNpvYTV4XAhSKY+UfV/qR84t5gntYFuqNB/4PDEvl+QhKV2iibqr
         fvwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782338294; x=1782943094;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fZpP+OdKjTlIjTBHXSAEFDT/EOMsfzbgt+r1GJr2CQg=;
        b=VxWee3kyJcK/s0QwJyOeGQ1vqxrfH+kaNdJ5dVopDrSoPa7DbV3PsPGFB/lmT/SO+Q
         n0XS5iQktX3xc9iiuCTI0z8ty5JRCQfB/00M/HKdXEBBCoI/kAaZZ1J3tfjDLXFoD93j
         x1NGKfqBQZ2IsUW/CvsQHBD0LwQYQaoLCbeUGDKG9CTe3YJdAM2zLDnHcSIjEnnMpeAI
         1074eGPAuDy+LfLUq2JoJki5HMgsiF8rTyzCNLvYN87kR8oE/oxllKsqKGRDjple6bm4
         v3Yx41BJe3lcoG2qpiGpb4ofkmYAbjLZhLbsRRaPlV98JyysxvIhFadzCT/FZMQUBFXz
         /5bA==
X-Gm-Message-State: AOJu0Yx8FQ3jFtDOh0THNwfz8KmwY0M/QcKgsNrsZesRyXWhVDmSZx9S
	9YrXVFJ/PIzebR3Ya3udSRZI0OtBd3iVKBofvwsX8/tUvhhXSam0SM4Ncqyws2twYPd43V/l
X-Gm-Gg: AfdE7cluj7LXAHd19nbLHQdf1g9VKLW4Z8XO7o0QIWGECuYpSfbGW5d6a1+PGKk+K5O
	IUWss4jvi9Jh0/kmUhSLoXKiEOxZUa+6FcTbRqCo16usqjnronau/dZ0giN90UD2DvAMNTL5d1E
	7oQBNAv8Tro3xgunV9X5HA5z3P9h8RWFLRiak76iLOShvMLlbkxe3sfT1HT0LFmWpB0IPTtAOBu
	JPaTXZ9iBYXANCUtDRrzMH0w1KCyAKXZev96dYl82KQ9/WarHOypMzWargmGIn21Czd5eX51Bhe
	kf4weKhLEKS2ovsUpvqzkSBceT06BHHWpRIEQEMOMSmK8y8ujhEC17odJXaT0l5WBQKgcu6hoz8
	emX0RYLpHdg4wWgOrbjSBv8h/ea8Vd85sD9w4edYlAVk8iNR2Ga2wL/fjHxm0CL0I0cg4vdxgk/
	pyKJGAXvMu
X-Received: by 2002:a05:6a00:22ce:b0:82f:abc8:ae0 with SMTP id d2e1a72fcca58-845b39df9f9mr38703b3a.17.1782338294449;
        Wed, 24 Jun 2026 14:58:14 -0700 (PDT)
Received: from adr.. ([103.216.221.112])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845a411960asm3036754b3a.47.2026.06.24.14.58.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 14:58:14 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Moreira?= <andrem.33333@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Andr=C3=A9=20Moreira?= <andrem.33333@gmail.com>
Subject: [PATCH] staging: rtl8723bs: clean up code style in hal_intf.c
Date: Wed, 24 Jun 2026 18:56:29 -0300
Message-ID: <20260624215629.32568-1-andrem.33333@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fix coding style issues regarding unneeded parentheses, Yoda
conditions, and unnecessary braces for single-statement blocks.
Also improve variable initialization.

Signed-off-by: André Moreira <andrem.33333@gmail.com>
---
 drivers/staging/rtl8723bs/hal/hal_intf.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_intf.c b/drivers/staging/rtl8723bs/hal/hal_intf.c
index 228297cee5d6e..496f18d40c5e3 100644
--- a/drivers/staging/rtl8723bs/hal/hal_intf.c
+++ b/drivers/staging/rtl8723bs/hal/hal_intf.c
@@ -184,8 +184,9 @@ u32 rtw_hal_read_bbreg(struct adapter *padapter, u32 RegAddr, u32 BitMask)
 {
 	return PHY_QueryBBReg_8723B(padapter, RegAddr, BitMask);
 }
-void rtw_hal_write_bbreg(struct adapter *padapter, u32 RegAddr,
-			u32 BitMask, u32 Data)
+
+void rtw_hal_write_bbreg(struct adapter *padapter,
+			u32 RegAddr, u32 BitMask, u32 Data)
 {
 	PHY_SetBBReg_8723B(padapter, RegAddr, BitMask, Data);
 }
-- 
2.43.0

