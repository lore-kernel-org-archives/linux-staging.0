Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 719EDB676
	for <linux-staging@lists.linux.dev>; Sun, 28 Apr 2024 23:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714345272; cv=none; b=jX1X6P3mBR92BrhM1XscaB2EQ2+OLA9ONXsZOhko/Vf7dakq7OhAdFZbwQ+KkqCHjQtqru00ohpuOBEEK9+7e9QKhPUqzEJ/l0ayzbm1ycQuimWMAX3e+qcjC0kLBT4+d99rl9pcLF431zibo8lKlhWTgs1oS0T0IhAtJ61lnoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714345272; c=relaxed/simple;
	bh=zFLLDXev3+4EQMdTEsmOQ4pu98STBZZQq72+GXCKkUs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=A/uM6JtdtF28013WzNK3Z3lOjOUsCuu1UROFyMgOoZbsvbiqHeIi49wcK2YCKy+zh8azdVP/Wv+ezuRbZriq4Eh8CJn/AdqQkRNr1KySVBuzzahHyo7dZpgr1MgFgJFuLrWupOCTo7gcS7+vjHy9S+HnZQRuBoT5bx4tqYk9I4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=mkqpzApm; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="mkqpzApm"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-5f807d941c4so3034653a12.0
        for <linux-staging@lists.linux.dev>; Sun, 28 Apr 2024 16:01:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1714345270; x=1714950070; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=resl27Nx3Ke/QTsIv17VspqiZQnAqsVTHg2kuu+h1f8=;
        b=mkqpzApm40Diyb/5RSZBpEXRGRtq+cSp7aHTILPGQtIm/7nun0cwL3TvQPOJjEbwjd
         czmmYL4uYo4+p2+AxlZFaXpXkUN/UPYBMA8ofuWdmK1ldG8N40xxYgCV6nuPW133SgIp
         2c4q2IrEI+i0CXBW37oc7PCJePZTe93qh6zmZoWrIyMHUtmXs+5IojUUQ97DGvtCVEIZ
         4XeUe696wAYRlOBo4IFuo3z0KqdAKW2GJEivUQhc4LJf2FAUewWcxCnKWvLzkRB4m1ZT
         94GnC+DdxwKaTsgImuUkR8/bilx1ZpBIIChIQay82fVnvhyqOrReewHGeXBOtmJbRn50
         6nfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714345270; x=1714950070;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=resl27Nx3Ke/QTsIv17VspqiZQnAqsVTHg2kuu+h1f8=;
        b=wjvKojD25lcfALy1fR1o/hF3cooqR5jnzP+HgDC2HostwO8XBItCgTGZ4aevaQn+xX
         kvdD48Y0qbnzBbGLeuIhELH6OsPl8jQhwhVZANVAx49yCatqyc+0iXRt80RXQW7qXnqC
         P4jvXLgQjCSztVPKJyNkTAl2C25kezBlXJCV8aGzEpro8hP9gmcyUIoyvwxuclSE4vWp
         NNlpc3c9hHMTKG41mWVcH1PMqM6urjWxfUscWVxmas7qdSCEg8tlk8Iu0Ibr9ZZIkCCO
         n9tYWIHd2fOoVd+436+QkDrHywoi9ehiTVx7OXrJ+Vo8RcPFn/R+FJzV06xgOGnleuMg
         TUCQ==
X-Gm-Message-State: AOJu0YyncXPXMT8AX7v5bnL6ke8hE+1fQxx2M6kdQBR/pfZgNL5Q/8gQ
	nTUyM/RaeKKiAtDFqTS/kY1NyngD7aLFf8+QajphPyQmHJbmknV9LfwT9KDsTXE=
X-Google-Smtp-Source: AGHT+IFf0qQFHXWSQfrLGkHRc3x6u/r8d4OHeAGrYhIL/oHokRuNz3VnwyX+JGL+WSN4wJsGDB5TaQ==
X-Received: by 2002:a17:90a:b8f:b0:2a2:e56a:ca8f with SMTP id 15-20020a17090a0b8f00b002a2e56aca8fmr8784233pjr.42.1714345269654;
        Sun, 28 Apr 2024 16:01:09 -0700 (PDT)
Received: from lunchbox.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id o16-20020a17090aac1000b002a27132ac02sm17860864pjq.2.2024.04.28.16.01.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Apr 2024 16:01:09 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 00/18] Staging: rtl8192e: Rename variables in rtl819x_HTProc.c 
Date: Sun, 28 Apr 2024 16:00:48 -0700
Message-Id: <20240428230106.6548-1-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series renames 18 variables found in rtl819x_HTProc.c
Thank you in advance to reviewers.
~Tree

Tree Davies (18):
  Staging: rtl8192e: Rename variable CurSTAExtChnlOffset
  Staging: rtl8192e: Rename variable CurrentAMPDUFactor
  Staging: rtl8192e: Rename variable OptMode
  Staging: rtl8192e: Rename variable LSigTxopProtect
  Staging: rtl8192e: Rename variable ChlWidth
  Staging: rtl8192e: Rename variable AdvCoding
  Staging: rtl8192e: Rename variable MimoPwrSave
  Staging: rtl8192e: Rename variable ShortGI40Mhz
  Staging: rtl8192e: Rename variable ShortGI20Mhz
  Staging: rtl8192e: Rename variable GreenField
  Staging: rtl8192e: Rename variable TxSTBC
  Staging: rtl8192e: Rename variable RxSTBC
  Staging: rtl8192e: Rename variable DelayBA
  Staging: rtl8192e: Rename variable MaxAMSDUSize
  Staging: rtl8192e: Rename variable MaxRxAMPDUFactor
  Staging: rtl8192e: Rename variable MPDUDensity
  Staging: rtl8192e: Rename variable ExtHTCapInfo
  Staging: rtl8192e: Rename variable DssCCk

 drivers/staging/rtl8192e/rtl819x_HT.h        | 36 ++++-----
 drivers/staging/rtl8192e/rtl819x_HTProc.c    | 84 ++++++++++----------
 drivers/staging/rtl8192e/rtllib_rx.c         |  2 +-
 drivers/staging/rtl8192e/rtllib_softmac_wx.c |  2 +-
 drivers/staging/rtl8192e/rtllib_tx.c         |  2 +-
 drivers/staging/rtl8192e/rtllib_wx.c         |  8 +-
 6 files changed, 67 insertions(+), 67 deletions(-)

-- 
2.30.2

