Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 512F5253B6F
	for <linux-staging@lists.linux.dev>; Wed,  5 Mar 2025 19:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741203413; cv=none; b=Ow7YZm+Z/HUsvMAGDdAhGZDvdlVModMakCqEfIdM53EGe1tliVIHI0GeARclUgImJ3oDHfsx1wTy8juUbk+SqW46rBokaWDhS5TCia4NlK/Swim9rK/JUR8gBvNK3gq4pys+V7gq7waE2vA84MIeY9oy4nDbXWSEW7Z4yu7suSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741203413; c=relaxed/simple;
	bh=f+EcBHq0gIuPChKTRpZ/xjUmV0aa5c76pyhQGIXjb54=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=imRk5oVJdHB/ntuqX+g6YkNH7wyHDIbMDxJCa6h0Uu9G9HUDGwQeDJieDmWa1ItklO9wMPROPhrIorVRZmYbnUtQ03XP2DQkys0k50qayIBcC6xHbSgKzWBTD288r3YVFFeALeF/MWBmuuSii2LH4pplsEmIPo+WjVP4qwRLvOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fRQ1F3Ko; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fRQ1F3Ko"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2fea8d8c2f1so1763654a91.3
        for <linux-staging@lists.linux.dev>; Wed, 05 Mar 2025 11:36:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741203411; x=1741808211; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sk/Vps+XrXsj0EE9YsBttNsi6jhkGXsUnHgeSBsXBQE=;
        b=fRQ1F3KoVD2q6tFAR+8j7ao3kdOAufYzNIFoLcFpoQCXkcULagksnSPrBS9+JZr6+D
         j+RJjQJeoH9PV2huwj1ZetpjsaeG0xj5HR/ldZogfmwL0wmm5HhzmDPhuj53cdzwtZpk
         42tiBKz5SYhwhelHRq8YAdSR2kevZIfoUQDIgO5x6nH1Jj+3my7hE0huxPLG3QKARfFV
         Qzuvoy9wvoJSOmYsnOaAr6rEXHFfxFlOb0jA4hOC+n/zN3cnWz4TU+pVZRRHJxVgSObg
         ND6ZypbhS8evrat2wwirZ5kZfC3S3Ebw3BohuvxHw+VMFw3gobMh1DY5QhYmZIe5b1Vm
         odww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741203411; x=1741808211;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sk/Vps+XrXsj0EE9YsBttNsi6jhkGXsUnHgeSBsXBQE=;
        b=FHk+r6QYcO0akU41F47JfdQInhua2NYpgcAJXu8g2ygs287TOBLlVQMbCCwxfgeGqd
         cRpIHqXLoyXfupe37JoMt84RowGDjXbIcDtxcfOPLR4xFvopcMq8LiCIaQ3AN8dMG9Qe
         e/MVSLfZiolD0uH0Jt4WHueqFWm/TTU4RBpVyIITvToQvKUin7LmfLTFo660MF9RrpF3
         Ydq/gdney/rHj+Mkv6GFogEWxueg6uBmklbcLqA97ZMaTvy0UZPZ/sXdKMgW+mxMarGX
         UEkvMpsGqBHunoPm0/f0+E6s78wAi/A58/Q/diJIDYlcsJ5BWy7qDJF1F56wW3crS/U+
         vrQg==
X-Gm-Message-State: AOJu0YyFsD17xASp3wZvB5U8/x6icTE4GX1FiCh+GIux65p/161TZBg+
	n5Xcpob/dydqEMQk6qDMr6bQ5bJ6TZTeXUEfhoOV0aNbr7C7P98TJ3W9cw==
X-Gm-Gg: ASbGnctDmeZWiC7RPgryVRwTDjd2kRO/27dBIs/lihrV6vo7VHRaPCntbXWH8YxMCzs
	K/V42T9IGB0eyqTSrrbspl8RpDygHjopIOhLARfDyfBSoybC/lmIeAT280Ibq8bKeuSVXqiQ0Bm
	tlQMXGf9MWesRa+AvBedll/wwuK2DSrOGslRkx/jVknGgcOnLeDRTtbRlYRLMp3WtbBVEeL87kV
	V+hr9gleDyBF7dwK8pEKkhn40CdHTy65K3pxUi6PQZH9/Qh7gjR++NIM6p01/9thK4MTVal6D9M
	oLA7/nBkIOwFfK5l47AsBHCiG1l731/BnIfR1XBawaVpb5rP69bJxE9ZMzmj
X-Google-Smtp-Source: AGHT+IFQ9HwEoVTVlmufm04/RgIQIMt5CoKXcTADkaczq5WVDkpG/N4C0fD8ORB3wOOwpnFJIdaf5w==
X-Received: by 2002:a17:90b:5344:b0:2ff:4be6:c5bd with SMTP id 98e67ed59e1d1-2ff4be6c6ecmr2272508a91.8.1741203411157;
        Wed, 05 Mar 2025 11:36:51 -0800 (PST)
Received: from localhost.lp.veng.com.ar ([200.10.125.114])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ff4e7a2bbesm1898148a91.37.2025.03.05.11.36.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 11:36:50 -0800 (PST)
From: Gaston Gonzalez <gascoar@gmail.com>
To: linux-staging@lists.linux.dev
Cc: dpenkler@gmail.com,
	gregkh@linuxfoundation.org,
	dan.carpenter@linaro.org,
	arnd@arndb.de,
	niharchaithanya@gmail.com,
	jiapeng.chong@linux.alibaba.com,
	linux-kernel@vger.kernel.org,
	Gaston Gonzalez <gascoar@gmail.com>
Subject: [PATCH v2 1/4] staging: gpib: fix kernel-doc section for write_loop() function
Date: Wed,  5 Mar 2025 16:32:16 -0300
Message-ID: <20250305193614.39604-3-gascoar@gmail.com>
X-Mailer: git-send-email 2.49.0.rc0
In-Reply-To: <20250305193614.39604-1-gascoar@gmail.com>
References: <20250305193614.39604-1-gascoar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a colon character in the kernel-doc section of write_loop() in order
'leng' to be picked as argument by the kernel-doc compiler.

This change fix the following warning:

warning: Function parameter or struct member 'leng' not described in
'send_command'

Signed-off-by: Gaston Gonzalez <gascoar@gmail.com>
---
v1 -> v2: no changes in this patch.

 drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c b/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c
index 50faa0c17617..eeabbdb39057 100644
--- a/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c
+++ b/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c
@@ -232,7 +232,7 @@ static int write_loop(void *dev, char *msg, int leng)
  *
  * @board:    the gpib_board_struct data area for this gpib interface
  * @msg:      the byte sequence.
- * @leng      the byte sequence length; can be given as zero and is
+ * @leng:     the byte sequence length; can be given as zero and is
  *	      computed automatically, but if 'msg' contains a zero byte,
  *	      it has to be given explicitly.
  */
-- 
2.49.0.rc0

