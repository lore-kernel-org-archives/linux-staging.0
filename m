Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E08F207A2D
	for <linux-staging@lists.linux.dev>; Wed,  6 Nov 2024 18:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730918037; cv=none; b=pYhtoG8MPwQE2WKJ1Un9PTIyvOBRWGknhuBsWqac9IHwquDljYZiFTQ/DTFwMowCCDzZsjOl3Q4PltCbyruHKwbG+lLTV+kdEJIhAMPe9/vpbOtbLsKL/cv5c3pJHH9xVdtlHZb13UxuF9K4u+/TRGb0omuljvaXSxBu5tFaLQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730918037; c=relaxed/simple;
	bh=0Gc+JPVi9O0tZICMYNaPCrl3aoXp938+vWpDID6LlwQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JASubp0aoRn4flzZwGqpP2Sf4RSxDwwfArYrrtghVMVDuuaoBvpSsNzUJexgi9bQDAU4h5oMAAAVPmCxCQRM1KVOX+8mebJBVgBNwlc0auMWLy9FVp01+96enr+czZFbaPADc3nrr0+cXznNYGceNzsGql+Ope1UAvGQTz4bhqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VATpTIuG; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VATpTIuG"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a9e8522c10bso21445566b.1
        for <linux-staging@lists.linux.dev>; Wed, 06 Nov 2024 10:33:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730918034; x=1731522834; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tx6X1YtADs2XT3Ox3Y3sdyzQo/0AxuioBEE5kCAYkwg=;
        b=VATpTIuGPskDF+4tCfFh51J4TKXkZRPuo+MufHTaoh1c99/vzKzbzJ/AELrB/pIJxc
         XirPHt94q/zZV/25ZLhgwXkFb0KzLROCgnsuccxqrIj61/2c2DF1j20niHCE4ADRQ+pc
         M4AbGyu6Dpbehn4hpxrZ70K/6KF6cOUlVcZ0H9ob35wEav0JiS+zA+TxagxtddGcykQC
         G8FgtNqz6i3xuP3zogYKHbyxa/qYiORVZsbWQaX+OlFYDf4LYZDovuNFgUvJbGeh7I1Z
         v4umrbeVKOSzP+ZrI4Q/Ho+U/FEd6klVzwhMXZsglwEmHZKrXOgIQtIltNoTU7fvNKkc
         qQyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730918034; x=1731522834;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tx6X1YtADs2XT3Ox3Y3sdyzQo/0AxuioBEE5kCAYkwg=;
        b=qumhaUid4SBW8kWdmDVhemBRxqPLFpSwhRQ1ew+WRwLFZGQlBSFUYdnxC5EZPEcY9d
         yA7VpliZ/7dR+cPbJijf/4/00sEs7r2AAVVWNRUHowWx3KbHaR5V1qHBUcFBEdZuKbqK
         PfCbQCOihVripUBAMpPTL5lz+s4fLy1DStdEWsk0h4fZsX9J06QGlFpNFF+woYiSqrCe
         ZFn2jJXq+EBeP7HJ8r9G6oSbEBw2ADXMEry3OyslgfMc6Oo7zmIvH3Sod4ZjHSfyLi6H
         CLwJa3UageyEWgHEBFWx18IzRYbLHnBSThxfvz36g29VpPPZCjlQSnX+qQnHsDV3RpJ/
         hKyw==
X-Forwarded-Encrypted: i=1; AJvYcCUhbIjWKIG2uJjXVQR7TIhHD9vzG3GyvcGmdbQV3jFR1yjunz8UgU4SqhtS0oj5AefC3I501E4iUIOfEmOj@lists.linux.dev
X-Gm-Message-State: AOJu0YzX71bAOYSyR5Syt9mhVQCtzJHVKAVrk70Aui6iqKCHhPuNu3Qx
	FmnhNLsi6ZD4DgzHw+jJa1JP1TgAw3WwT09liQQU81bYJo8Nnuyx
X-Google-Smtp-Source: AGHT+IGDWdUXEFRrR3jrnbt0tCF12f0An9+oAbEngtnkkZAAsRtEs+1qquwf2GEABXZvC8PGz2p8RA==
X-Received: by 2002:a17:907:c05:b0:a9e:85f8:2a3a with SMTP id a640c23a62f3a-a9ed506f2a8mr18888466b.2.1730918033692;
        Wed, 06 Nov 2024 10:33:53 -0800 (PST)
Received: from kernel-710.speedport.ip (p54a0712c.dip0.t-ipconnect.de. [84.160.113.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9eb1813a07sm315298966b.190.2024.11.06.10.33.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 10:33:53 -0800 (PST)
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Subject: [PATCH 00/16] staging: rtl8723bs: Replace function pointers starting with EFUSEGetEfuseDefinition
Date: Wed,  6 Nov 2024 19:33:29 +0100
Message-ID: <cover.1730916582.git.philipp.g.hortmann@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace function pointers with functions to increase readability.
Remove unused functions.

Tested with rtl8723bs in ODYS Trendbook Next 14

Philipp Hortmann (16):
  staging: rtl8723bs: Remove function pointer EFUSEGetEfuseDefinition
  staging: rtl8723bs: Remove function pointer EfuseGetCurrentSize
  staging: rtl8723bs: Remove unused function Efuse_PgPacketRead
  staging: rtl8723bs: Remove unused function Hal_EfusePgPacketRead
  staging: rtl8723bs: Remove unused function Efuse_PgPacketWrite
  staging: rtl8723bs: Remove unused function Hal_EfusePgPacketWrite
  staging: rtl8723bs: Remove unused function Hal_EfusePgPacketWrite_BT
  staging: rtl8723bs: Remove unused function hal_EfusePgPacketWriteData
  staging: rtl8723bs: Remove unused function
    hal_EfusePgPacketWriteHeader
  staging: rtl8723bs: Remove unused function hal_EfusePartialWriteCheck
  staging: rtl8723bs: Remove unused function hal_EfuseConstructPGPkt
  staging: rtl8723bs: Remove unused function
    hal_EfusePgCheckAvailableAddr
  staging: rtl8723bs: Remove function hal_EfusePgPacketWrite2ByteHeader
  staging: rtl8723bs: Remove function hal_EfusePgPacketWrite1ByteHeader
  staging: rtl8723bs: Remove unused function efuse_WordEnableDataRead
  staging: rtl8723bs: Remove unused function Efuse_GetCurrentSize

 drivers/staging/rtl8723bs/core/rtw_efuse.c    |  90 +----
 .../staging/rtl8723bs/hal/rtl8723b_hal_init.c | 353 +-----------------
 drivers/staging/rtl8723bs/include/hal_intf.h  |   8 +-
 drivers/staging/rtl8723bs/include/rtw_efuse.h |   4 -
 4 files changed, 6 insertions(+), 449 deletions(-)

-- 
2.43.0

