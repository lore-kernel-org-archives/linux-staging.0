Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECEFE369990
	for <linux-staging@lists.linux.dev>; Tue, 24 Feb 2026 10:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771930461; cv=none; b=fkAiCWXHPbjoLeqnqIi3NmtEgWLF68Y/Q5+et/fSDdQhrIOYjf+4GocYFdJMhQlyv6Bs0nHoKxJzBAN2ou98pPisA4ewREsuavziJm0thrGLN788RpwWFk1o8d9Vx3j/5lpJbjz9BQMzzz6LxLYf7o6bu7FZBET3bBDfT5YxidY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771930461; c=relaxed/simple;
	bh=6mROfoziB1wogHwF+fugrVDDVD7osh6LPHHE5JOOJWk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hNjZ/B/iAzLacBCYAEo87oX4NCMAd9jUToS0UukFQTx8O7nZKdWcF8e5GGYtHTqY6x1t7LHd5bpR1RdZZ7kzEx1Rg5p4FR84BNBVh4mlPxpPZ9OjbtILy6AkSzR1Indztw+iWs8s6Kj8anod20UCtPDs44J9/fAMe/7gPkS9OnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IfTq9tL6; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IfTq9tL6"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4836fc075d2so6323025e9.0
        for <linux-staging@lists.linux.dev>; Tue, 24 Feb 2026 02:54:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771930458; x=1772535258; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oFI8vx5HJsLEeA3xcDmzX/irkmvSFeM1B9jELarh0Lo=;
        b=IfTq9tL661gLqf8GCjVAYIV7M9DIkHI0kviwvpIHlvESdJ1a48jaftRxWoY2PKVRq2
         g74adI/snY4doFinWEb/EwRoU1M8Ks9wKPE8p1+JIilRKq34oG6lK1eA+iwQco4sPbuT
         ZK4ztE2HZt5OmrbNL/x6VrW4tRU1LmuQXlkTLR7oMaveO8rAg1ni7vqBIng310ZaqgOJ
         6qf6qNzpmQNI270t1Vu8IOsmlqvx7VPmA837wTcI92i2Ft2WrW+9CzdsBrWKtFtON89A
         hc2+tNPGLvZq0NxXJqV22GnxVcQavvIEMyTk8CyxOkIFfv8eqcohCuLpv/8wJ//jqw7o
         MKmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771930458; x=1772535258;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oFI8vx5HJsLEeA3xcDmzX/irkmvSFeM1B9jELarh0Lo=;
        b=SV3n3OqBdxk0TxBnxBYJhx8paEfV4oGIRhhYqiv0pyrulu2wkbEm7Ybcrj2BMOopkm
         wnuepzEARxdz/1NiWjHMziUTVEXG+bkShH0gsYWeEQGGpLcMmcGgEj86JILejr8I4gsK
         0A8pByO1TadAQDMoukuZpEw++3F78FihiYbFb7Qjpy1MWz9A/HOrJjXVa6JCSia5TNwr
         LgkkzWvCuss4Hdf5mErtpr5khtRv5ra6y4guxb7n0a09BEwPVrYdoMdw/VodyCDxj4bY
         3jMkzLMNNUG5HrwjJd/OOCLZ2Z4Z7RukbNdd9FXar59lvzl0o+Zf5js8PIqWaX+M1iba
         /CpQ==
X-Gm-Message-State: AOJu0Yxot0j1K8ybdfgDPofXsNLWFqFnLvjoeGOcLLEO2c8gTnc63Cv8
	+NXWYxDfqjHVC3WIcluL+PuKVB2I1vGgYrmZaL5/hHLKHdfeRAw4Aqtu
X-Gm-Gg: AZuq6aK+rPivLVe0vTISyBkUYzPPbyNs+LU4zY9zNmibmUSzEBjoSwOzb/CBIdONd+d
	RJRaoCS6GVbMFrWz1rgYMor6+wCL+PdxvG0D3y9RaMG53DuSHRi/+/nLnQy1b5mcX2TTOTdFx5X
	pFd9XyofMgPlXWZzzaNrVRElU87pFXpCVELiEEVGV1KGVwo1t209Nlr4oXikUJCxxDbRYUPTE+n
	1YTwcsUX+X+5hcb//KzrfD3O8YkUN6SWCotgUJsiLvqj/ibEcx8E39tuaXCWzW98pA26qsmdsST
	DHNW+xKjWqMy22YW9wQZcBdewNAHEaQnFBDwEoGopIqJhb33g1goHzWEbkFU+yaTYCwF+iURgNC
	jUnTw+IEVVvtSoPeTIAsdFnKVPmnbICEVtMty+UGo6mudeQqNpZxN6j1AdbnOsjGe5vrr5OVyed
	dMHpDBiT2r9+ZAFkYKaSMOcjVsRCdckX653AME6dfDVYqkNuNHYY1+6EK2zHahZv1jMjJQVuja4
	dS2Z9K9drjwh80W7orrh2X4Or+07QvPl/FerImUG3Ki8Voymqsk
X-Received: by 2002:a05:600c:6305:b0:477:9fa8:bc99 with SMTP id 5b1f17b1804b1-483a95dc3d2mr120195895e9.4.1771930458019;
        Tue, 24 Feb 2026 02:54:18 -0800 (PST)
Received: from fedora ([149.3.87.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a9b7fc8fsm229251585e9.7.2026.02.24.02.54.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 02:54:17 -0800 (PST)
From: Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
Subject: [PATCH v2 1/2] staging: media: atomisp: Fix "acquistion" typo in input_system_ctrl_defs.h
Date: Tue, 24 Feb 2026 14:53:35 +0400
Message-ID: <20260224105335.51418-2-giorgitchankvetadze1997@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Change "acquistion" to "acquisition"

Signed-off-by: Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
---
v2: resend as series with unique subject lines (Greg)

 drivers/staging/media/atomisp/pci/input_system_ctrl_defs.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/input_system_ctrl_defs.h b/drivers/staging/media/atomisp/pci/input_system_ctrl_defs.h
index e26b9ba3356a..49e327b55b9f 100644
--- a/drivers/staging/media/atomisp/pci/input_system_ctrl_defs.h
+++ b/drivers/staging/media/atomisp/pci/input_system_ctrl_defs.h
@@ -222,7 +222,7 @@ InpSysAckOverrule  2/0  [3:0] - 'b0101,
 #define ISYS_CTRL_PORT_ID_CAPT_A                  0 /* device ID for capture unit A      */
 #define ISYS_CTRL_PORT_ID_CAPT_B                  1 /* device ID for capture unit B      */
 #define ISYS_CTRL_PORT_ID_CAPT_C                  2 /* device ID for capture unit C      */
-#define ISYS_CTRL_PORT_ID_ACQUISITION             3 /* device ID for acquistion unit     */
+#define ISYS_CTRL_PORT_ID_ACQUISITION             3 /* device ID for acquisition unit     */
 #define ISYS_CTRL_PORT_ID_DMA_CAPT_A              4 /* device ID for dma unit            */
 #define ISYS_CTRL_PORT_ID_DMA_CAPT_B              5 /* device ID for dma unit            */
 #define ISYS_CTRL_PORT_ID_DMA_CAPT_C              6 /* device ID for dma unit            */
-- 
2.52.0

