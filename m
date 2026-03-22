Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 076E5280CD5
	for <linux-staging@lists.linux.dev>; Sun, 22 Mar 2026 02:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774146873; cv=none; b=BrEXRqEuolMfS6kYIMU4peJ2N9Ev+AmR9heqmqxcSpK2qwc1oBVJh7Lr8zxSA7Jy8bkGaOnoE7Lw4nLICkeLkoq/fsHGLFYZPDEHm5RL94kxWplaOz/G5pLi3bglVu4UL0HN7alW0JpvRdXVaVmy+itpIw7xQF+D3rJYGNf4Dgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774146873; c=relaxed/simple;
	bh=uENkwnAPwIxcuNSSxSNUnBu/2/DCKv3oLAP0aQGfxXs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=piEd9q+V0r8k/V4igg9HomNGHkkJ+i+cS4/wr0HAUOCWqAf5p/GWkFzk/f3R26f2dTKDLy0x7HXiB5sIKUPLTivoZmETMaHMrrZiH2cmxjCBFjxihwJa2U2txQ2PmZvueHk4kXDFI4lLWvv4wMar+da5XKEkXqj6THeQcuFbBDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SpFr+Vjn; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SpFr+Vjn"
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-899a9f445cbso37573136d6.0
        for <linux-staging@lists.linux.dev>; Sat, 21 Mar 2026 19:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774146870; x=1774751670; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qFmKU7I+y/iUHbRAgHsm4IY7K5kFQVNPVjnDFd6Qzbw=;
        b=SpFr+Vjnxvn/E+L9ELPpSsHUsDCAltCTcbXmkPvxhUZdtRiYA8lKm6dppbOzPX/Z5C
         XbVQFAzO6adCfbwe8WZC9r/hmEAjqfi7HXfHxMKkCogDx4W4o/qmf4oN0mPg81Qo9W31
         jOsN1e0svDXsV2OHQioGbu7gMrWCYDXxdG9qGdVz2NxZcgSxd0449tCCESjIjDCJz5V4
         foHoTVmfL5+mtGq9Mw37vctQUlbzedIP4WMu9+5vGqGRFifSs8PWTK1D1wGky2/iEj5J
         UjCTmj3PY/1PVExVKrxZ1lVfdD8YFoXXeDi3RVgAt/saelYLqaiUWDWHMMY7Wt1Qrbqz
         iLNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774146870; x=1774751670;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qFmKU7I+y/iUHbRAgHsm4IY7K5kFQVNPVjnDFd6Qzbw=;
        b=XAKVzLS7HhYK25aTwH+LRQBNkgnumWoOfB0d3xh+zWxwnGN3Sn8+pUToa/ogA3ucDb
         wfzF/nB27l/IFgK/uJ+v2GEt/NUZAr2f7FHoInS+c6NREuBNNF4HHt6MkvtEISviFDZW
         ZST6c4qGzlvJvwE7IM3QiSe+W3hzjmbX2NRq66sxWRTbVcJ8wCF/va2orx1NFc3t2VZ1
         CFrxE84gLh9/J8EpU7AtlnN7nnjXP12IMRrPqa+uZhsmJ6lWrQAJw/UuoYb5mQHMOkq+
         WGvjtDdloNF2wpp2RYffRFl4wSEuZ2XSx0QtKGD4Si+U9sMol8/ZwHmDCPU5Eq5cdNQ8
         RRIg==
X-Forwarded-Encrypted: i=1; AJvYcCWiWHPqqMkaybH4VBp4VQvDMrBrHM4lJOuDfnEo4D7nT3KLGmNaitVp2xB2tAzdVmqrt9IUcvG/ROa/lFaN@lists.linux.dev
X-Gm-Message-State: AOJu0Yz/7BydQGMG0ikfX9ofWZVPTVxARfGu+3XIy0NIjGRxHT6eKQl3
	7xnJdPIC0otDws8ABjaanz4Ngc+ragkAWJcwsdO/4/gXVw7OsTXIdHJT
X-Gm-Gg: ATEYQzy5FPOWnADCLlkfxfcAt0LASW+K0GtSZiVsNaEEdG4FAr6xna7WatPlWgF348Q
	6aTHqYHNe0dUc2EtLboDmSc2tGnqYvoIiycNWZDfroU15boGioQpcMOfR4bSc/n6XMzUQIGo2j+
	lNep1UxGBJ39XbDXD/v2yKf3PimpAPpJ6Hlm6Txw/WYckJZrIDC/ADfNi7n9zkWjBhN6g9VVAHG
	kXE6c4EtOtVLzdwV8Cxq5z4aM071yJkOgQ+rEApJBf2+Gb9Lt+v214cKdLFGZxxjIzmA+3NhACT
	5Dx6P5MVOMcAP940rIV9xG3rKlUNWgrs9i/POi7GfAAsao1GnLFW8fheYiCYMDstdmqg0ZvDxkL
	fIK51/zIMQtlQ4s91BIoGJSJ3JmaUUe6zCsbGl8nMJWfafNgSczyTUqKdLskaafzFJUXvzhANW1
	sJN/v17UaaT1ltX6/bJwaOx0jPwExEmcvHDO+d
X-Received: by 2002:a05:6214:6003:b0:899:f9f5:97a2 with SMTP id 6a1803df08f44-89c859f982cmr120781226d6.24.1774146869989;
        Sat, 21 Mar 2026 19:34:29 -0700 (PDT)
Received: from thinkcentre01.home ([142.113.119.189])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89c85335402sm66975556d6.25.2026.03.21.19.34.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Mar 2026 19:34:29 -0700 (PDT)
From: Cameron Pinchin <c.w.pinchin@gmail.com>
To: Marc Dietrich <marvin24@gmx.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	ac100@lists.launchpad.net (moderated list:STAGING - NVIDIA COMPLIANT EMBEDDED CONTROLLER...),
	linux-tegra@vger.kernel.org (open list:STAGING - NVIDIA COMPLIANT EMBEDDED CONTROLLER...),
	linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list)
Cc: CameronPinchin <cameronpinchin@cmail.carleton.ca>
Subject: [PATCH] staging: nvec: fix comment formatting
Date: Sat, 21 Mar 2026 22:33:46 -0400
Message-ID: <20260322023346.100296-1-c.w.pinchin@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: CameronPinchin <cameronpinchin@cmail.carleton.ca>

Fix comment formatting to align with kernel-doc guidelines.

No functional changes.

Signed-off-by: Cameron Pinchin <cameronpinchin@cmail.carleton.ca>
---
 drivers/staging/nvec/nvec.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
index e9af66a08..0e655f79e 100644
--- a/drivers/staging/nvec/nvec.c
+++ b/drivers/staging/nvec/nvec.c
@@ -660,7 +660,8 @@ static irqreturn_t nvec_interrupt(int irq, void *dev)
 			to_send = nvec->tx->data[0];
 			nvec->tx->pos = 1;
 			/* delay ACK due to AP20 HW Bug
-			   do not replace by usleep_range */
+			 * do not replace by usleep_range
+			 */
 			udelay(33);
 		} else if (status == (I2C_SL_IRQ)) {
 			nvec->rx->data[1] = received;
-- 
2.53.0

