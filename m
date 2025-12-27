Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5D7F78F20
	for <linux-staging@lists.linux.dev>; Sat, 27 Dec 2025 23:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766879178; cv=none; b=VebCPrsrky7n7XaL9ITBFNJwF8oEz6DuowKECi4F39zVL2Kv4eOps6rRnFzQNmUGYvy9cVoF8I1E4X9ZMRUMTMuBF+2t+A5T/dxT5nPmxNsBwKRmBwIuODIR2MWV9cgzFQs1/9T3VsNC80c4R1ny3aUrjDMVMcH/r2Lnbat6LRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766879178; c=relaxed/simple;
	bh=Kuyg2OOkYpKTpbcdEVstbh12s1+drGtTpu6g0UcaPwk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kIL9BslAPmmmF0XMPyr5A8GkEHoPeKjmOwJ3Tlm09j19KT/pJ3qsV4W6Etobgv/5MnzI37p+WZ7EoOlIo2QJhENCEEJVtZLrbbLTolE/zmDR/GNX5AgSi/VveVKdHxLMIAEiX+7f2k3oLXh+3LS/L0fAYz3hXb4mlSYNqgFcxk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B0rgZ0FH; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B0rgZ0FH"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-42fb4eeb482so4027090f8f.0
        for <linux-staging@lists.linux.dev>; Sat, 27 Dec 2025 15:46:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766879175; x=1767483975; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6R7BKT0LFS75tbdnFhzlpRvSo7z/8enEGUcXTEqP3XM=;
        b=B0rgZ0FHNWHgacEUpvhkP0kodt75ohJA6/OubsfNI4+NJgwITp86ICgfR71uuvtyS7
         ODltzU21OUaQ/C+4Yk5WqKXdHAlCM0LjTZhKFpllJv/Sb5uJ1CAmiUixlG0dMz+zsHTU
         p0XYdEp1A3T/PdzLA4r/NyTLHmoxuR5i1atoyJdCNc+mkbiy38S5GhKhEF5JOnE6jeEX
         7H2u9WAeP5VvnybW2CDX+XS/LbUVzFkAMIhrGo9a9CICbgiCq3bhQ4vfKYSxRtH7R1+0
         Py1EzjSbHRFELMIX0o9i77qPa1yQgkp8Auku8iJznM3VgdHpD2HCdPx19gG3e8vQhTog
         ekAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766879175; x=1767483975;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6R7BKT0LFS75tbdnFhzlpRvSo7z/8enEGUcXTEqP3XM=;
        b=dJVfVKxrXNpuEMYZSn2v4tTP3+2FkaNaSmWBoLEWs04yUlqx16aGuu3fjx6Nnss5Ll
         K2AXvCgu8+EO3PyC/f0i6j+NGI8oetwv/U4R0JR0WN4yWvpIbKrnpQ2kdtV8yypbS4E+
         kr0Qn7EaeSX9hOv2d/mx9mLOKihfxvjfX8+P2nX1B+HfU34PaAbMkxsDHdLFSyOgvJU8
         T2ykTd3Upeb3LTLxnoDWvirRt1dyunEoMIoD7b5vgxRkbtxVCcJlpzsw1xVKYHCRE00w
         e8Kks/QoDnkf6yl2xRC5cXaD6kbDfFz+bx2rkasoGbTcOzDtTC/Rw2X3ie42QiBShXNM
         aiTQ==
X-Gm-Message-State: AOJu0YzkL0Fl40EiMIhC8m8Ws0KRbfOVJvVXspl0UynhEJDm3659vS9W
	pJ7mlhWVoaD7Wrk0za7aHcBT3A7+k8XBBJElIhAiTVHWZ0u+2L4SwHYS
X-Gm-Gg: AY/fxX5IAL3IKRaS3N9ITmacgaJ8qdrSe8bXlSelfC6xvSemey23zV1z2uD4HayJXGk
	T8PQwc1PrOIkzf91L3MGoRGvAtZRBygY+R3N98NhhMWK7bxzLxMdSUdyE4OluW878NWXWNuH9Sn
	DWjLJzeXJCm99Q479Bw1B8/Wmu0R9rNZsua06gwNp3CwVK6mUDolzCMCvNBC330j+rDsH3SP+oS
	KE23/ltjhoXmlw+ewzfInf8hVbRjlrinxLOr+AE5Dt7VrAup73NnSmkpE7JSN8RMco77PmVDNgE
	1BT9IxJgf+kaejL1evOi28gvQc/fQbrlcl9dav1cXn8hotPPQqsEaBeJS//Yh5Wg3qxFS4buuT/
	bM0m1T32SN0aKZBtQiA6nTr59GWnQ8lEpNM81pWNoNo5W770uYfKTvWP12BBqpDLpB8Od17upLw
	Ed+NDGMNcNapDKc5MjouGq+OrrqWd6i5MLTf/qeKAADwoj5JIL7f6K10hQgAS9VS9Ku6tm1+LKc
	IU=
X-Google-Smtp-Source: AGHT+IE4mxWU074zC51/A6v/Rilf4s7oKMUlwb58aq6En95Lv9kjFChY3wlbhvzd6BCBtb04kmrfRA==
X-Received: by 2002:a05:600c:4e8e:b0:477:b0b8:4dd0 with SMTP id 5b1f17b1804b1-47d1957b120mr312121935e9.17.1766879175012;
        Sat, 27 Dec 2025 15:46:15 -0800 (PST)
Received: from LAPTOP-2QR70VTP.localdomain ([77.137.79.98])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be3a2b419sm211559695e9.1.2025.12.27.15.46.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Dec 2025 15:46:14 -0800 (PST)
From: Ofir Mirovsky <ofirmirovsky@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ofir Mirovsky <ofirmirovsky@gmail.com>
Subject: [PATCH] staging: rtl8723bs: remove unnecessary blank lines
Date: Sun, 28 Dec 2025 01:45:50 +0200
Message-ID: <20251227234550.3034-1-ofirmirovsky@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unnecessary blank lines to fix checkpatch checks:
- "Blank lines aren't necessary before a close brace '}'"
- "Blank lines aren't necessary after an open brace '{'"

This improves code readability and adheres to the kernel coding style.

Signed-off-by: Ofir Mirovsky <ofirmirovsky@gmail.com>
---
 drivers/staging/rtl8723bs/os_dep/os_intfs.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/os_intfs.c b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
index 6ca6dc548..e66b9684d 100644
--- a/drivers/staging/rtl8723bs/os_dep/os_intfs.c
+++ b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
@@ -553,7 +553,6 @@ static void rtw_init_default_value(struct adapter *padapter)
 	padapter->fix_rate = 0xFF;
 	padapter->driver_ampdu_spacing = 0xFF;
 	padapter->driver_rx_ampdu_factor =  0xFF;
-
 }
 
 struct dvobj_priv *devobj_init(void)
@@ -898,7 +897,6 @@ void rtw_ips_pwr_down(struct adapter *padapter)
 
 void rtw_ips_dev_unload(struct adapter *padapter)
 {
-
 	if (!padapter->bSurpriseRemoved)
 		rtw_hal_deinit(padapter);
 }
@@ -980,7 +978,6 @@ void rtw_dev_unload(struct adapter *padapter)
 	u8 cnt = 0;
 
 	if (padapter->bup) {
-
 		padapter->bDriverStopped = true;
 		if (padapter->xmitpriv.ack_tx)
 			rtw_ack_tx_done(&padapter->xmitpriv, RTW_SCTX_DONE_DRV_STOP);
@@ -1022,7 +1019,6 @@ void rtw_dev_unload(struct adapter *padapter)
 		}
 
 		padapter->bup = false;
-
 	}
 }
 
-- 
2.43.0

