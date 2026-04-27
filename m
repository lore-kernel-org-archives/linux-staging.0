Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11AE73E7166
	for <linux-staging@lists.linux.dev>; Mon, 27 Apr 2026 18:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777314933; cv=none; b=qZIMgAKpCfob+l7lvXVa7CquhpQNJwV2EsDp915awxheqaW6JwCTOXP0fyQ2xgR79z6UPiDyb5TN5t+NbWqHC3gPHrIfWylHYBoTLaN4o21I9B+3STMW6FTb5nN0WehjOan0+nCegRXrTVqM8FTe9LeY1HHFuJYRH7nBWzLXiWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777314933; c=relaxed/simple;
	bh=/02zNbWN+8ZuzgOr5n9WI8LWagccBb+VR3PWa85V2lo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=X2rcmeC/F76UssgNXLkZEdPDrTpybzjrqXMP7lSDCFy8tqk2Hpi7xTA5sEsWGVIG6YnlfdwBxFK27dxsBn8R/UFB0rf/XtCd06bj6A8bwocRkF6zqhNjlhI8jmdo5QH+vvwZq2LqddExOnfETNThfxmdG3C8DgDjugxgajb5Mnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qU5zCXWh; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qU5zCXWh"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-35d90833cacso6615995a91.2
        for <linux-staging@lists.linux.dev>; Mon, 27 Apr 2026 11:35:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777314931; x=1777919731; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=18yTdDBwjSZQj9dn0CBZsHKIH6qaSx8Oz+jd9+EKavY=;
        b=qU5zCXWhr5UUtRf2Zdiafd0WWaJfCv8KI+WO3v0DKofVxbSB3h1YF73hmBSlP/m3Xy
         jHayGMzdotXrFd777hPhiNBe+mIosddzmgsaRV7f+wKw7rT0Cz+/3bfzNodt9YOurfU1
         jRuTbIMy4/rcyfzjm5hYly2X9NwTzIc4befKOvqncbcNcE4Q6sgJEdM7MVsI8bcsbZSg
         reossF3Nr4KfR4xREfzKNiBAElRUIYfva3apOx8Ez5KHetl5Xm05Wts+soZo9Dqo79Me
         Umm0BDgAX+OAQ0ZZjwCHWwLq0T7D0N5c03ErvnhLQqXEE45dq/y9I6yLC4kxdqsMoGNi
         0GKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777314931; x=1777919731;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=18yTdDBwjSZQj9dn0CBZsHKIH6qaSx8Oz+jd9+EKavY=;
        b=e5WodRnMjUEe9q1RjlDOCkamLEFzLAA7WfgoJJzSAQVO33HCctiPSKMq/djdYTPi1s
         aBaTpvXEfq4RDQl9fi6qezTheXDHvc2FLulLVTyo+u+yexDnoDJ1BY3AXZcsdcIZQHqb
         bckXIHl7WCYKCth4w0RDRH4pLnh8d5neVcv1ot6FNdln2XwpVCs8us0SaeVgaIXwJxIc
         dpglAUJ/zLC6xWgmtvElNzQ0/mG8/sYqdjLKVIHyPlnLRdTYcq94FsLz0N6Gi9ZOsyWV
         45jmetOaGukyJSn/5CVl7dgPP7orEFDqEzJyyjTcM4pV8GLuK9moQeaSAW+ytxCkvErw
         M3+A==
X-Gm-Message-State: AOJu0YyRb+z40E2/I8UUAZ9zSMr1CdJHV+gWgux+wkik7/ZgUH76qZRh
	i+Fov/6oWQMWBeHcqV3idfj0c+4935Dr1+TcyRGzNOFJZHvi4prTKlLM
X-Gm-Gg: AeBDievasScmy0qogiMnnoNnTSZ4zZ5z/c4+THL5vUq/5KY2BFHtZ3cv723l2DcAsgf
	7H6L4KY1kl8UznWGc6zvGIaRfiFHiPGZDCL4plVCno7OC+nzBXGqZ+2k0L5PbPJs1uqYq5hFQR1
	e9uFnTEyY2jYYs6ES6ecDl3cLzQxdVxyReCsRrVb4kJvzUJdtbKJb4XWnewRn5HHc6dCof1zqgy
	NJ1Iq/EsGikwH2EKaPruLVdI/4wPAGAmfAkM+l+ld+Yv4Hx1KnL4tKGXSEI+vhxrA4+N4sxKZPs
	McMSdP35HQJ5j9MUqNFX0TAtYvgf6CZAN1vd++u50eRoarp90ZxpodYrmF5BKbgBCQd/MVJxQYO
	poqxybIHWtxBQHflMkWTaOslUADdxLdaDBK56e440PloZEEEBTlvhzpo5wUcaYZY+/UWEx7VgJ/
	RMSPMneQi0KREr1igPEHL1dMmvA9+PNXWvS33QDGgNuBI5JPSGbEvlDUi8aF6IIjtiBCOqVR0tB
	xHdE8nPpJJCWpHbe5zEBLiue2k0q1Rg
X-Received: by 2002:a17:90b:5190:b0:35e:581c:6bca with SMTP id 98e67ed59e1d1-36490bf0a03mr302925a91.3.1777314931316;
        Mon, 27 Apr 2026 11:35:31 -0700 (PDT)
Received: from shyam-VMware-Virtual-Platform.localdomain ([223.181.114.98])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36490dda756sm93053a91.7.2026.04.27.11.35.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 11:35:30 -0700 (PDT)
From: Shyam Sunder Reddy Padira <shyamsunderreddypadira@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Shyam Sunder Reddy Padira <shyamsunderreddypadira@gmail.com>
Subject: [PATCH] staging: rtl8723bs: hal: add blank line after declaration
Date: Tue, 28 Apr 2026 00:04:56 +0530
Message-ID: <20260427183456.6160-1-shyamsunderreddypadira@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missing  blank line after variable declarations to comply with
kernel coding style.

Signed-off-by: Shyam Sunder Reddy Padira <shyamsunderreddypadira@gmail.com>
---
 drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c b/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c
index 6d5e531505f9..7fac1c2ba8e0 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c
@@ -575,6 +575,7 @@ static void phy_SetRegBW_8723B(
 )
 {
 	u16 RegRfMod_BW, u2tmp = 0;
+
 	RegRfMod_BW = rtw_read16(Adapter, REG_TRXPTCL_CTL_8723B);
 
 	switch (CurrentBW) {
-- 
2.43.0

