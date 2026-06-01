Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com [209.85.214.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B23434A3D9
	for <linux-staging@lists.linux.dev>; Mon,  1 Jun 2026 09:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780306677; cv=none; b=N3OWqFyWKAtng3SL0FaUOvbr3youPO1k1ent13PV+nnloe4lsvEi/f75oyc1ECLiZ6AfHyzc9jQzikHJhE2oy/3F2JMQdkovnPJyNHBidM0cfuTgsf36R+UUTVcpIe4BNG1uJQDSxdSdxsuno/yNAShxCUaTXU9N4L26Od66G4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780306677; c=relaxed/simple;
	bh=RSz4khn/JfdD5HoMzB7p7gW+sAfa2aoaxMMGZK1oZIc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pD/Z9UaZ+XId835TvwCbSqTfM4UO/LZLgXlCwbPb7bLEJJmoFY0FT1YH0/1/a2oRrurFup1xGJP2MruvzEYnJWZfeUy3uAI5wopyEl3xO6VQpTHsjTzOSvlRbvWjKxS6okr+iSNySnyREz+oItqMt+He0qv3myioQVHtDBYKNKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YhtxjZDH; arc=none smtp.client-ip=209.85.214.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YhtxjZDH"
Received: by mail-pl1-f193.google.com with SMTP id d9443c01a7336-2bf36a6905cso12576185ad.3
        for <linux-staging@lists.linux.dev>; Mon, 01 Jun 2026 02:37:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780306674; x=1780911474; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RdPa9OyJ9kZH08XOKCOJjleAYKDq5trhM0NOD/lWnSM=;
        b=YhtxjZDHeK3RtOD2GO+5gDEJEOMqe+rXYihtZWB6wbbpKLmfxlP1Y/piW+zZ1qQxAk
         sG5JFTWl3hz9XER1IY6+lio9Xe/9NOUjm+m47rHxq3jP0gIGLmSU9f6bV11ypmfJUge2
         O7P1rghJvnnztYOlSKeLY9p94ZYWilXb9kj5q3rvlukMaOo7GCfR12rJzSAixVgQLgpn
         3/k3y6ar5pZnNebv3ApwvHIZn7mCWrGI6Hfv7t3HaUxkH2s+GjQg+jt6vn2ksLs/eali
         wYXHtbj2FtZzWTCRQY/FmDNppUcz101s8A78YQ4JTr+QnbKK9SOEepmJ4icTdF62xONK
         3qRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780306674; x=1780911474;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RdPa9OyJ9kZH08XOKCOJjleAYKDq5trhM0NOD/lWnSM=;
        b=mEqXQEI23o6APOnkAFjVaPgGFOJ0ZEGMFRmOTG6+rBxav/po7I4r/xW0x5ZIPw8Aph
         wOBvHlAYFWPkMOe+No+f9ZE4Qc1lDPCOFGWUV0aJKfQ5mZYvftP7HrUIOq3hZE70HVjX
         yRD5OmYbGnyZzEKIau9kz3/MMWae64ojj5Y/+lSYQJiy9v0XGeKTVZX84931Jv1dQQ+a
         sb4ZOuDwC95C3KjdiabhMTsNrLX8c05HwLt7KXXpKpX01a33DpnmDB0ejC9/nfe6lvAc
         GlyavDJFwrAUgZMkmnYdJ0x68YSLTipU84EDuNWoL3Lpdekh1L8Gwh37yma4+jPyclBr
         t8wA==
X-Forwarded-Encrypted: i=1; AFNElJ+i9Nda/WNLlQUq5rnh+tRoHMRxoIt2RYZvnlTMd95WefhyOIdIvWd3OjFC9WAuuk15F7+eFr88TxlHipnD@lists.linux.dev
X-Gm-Message-State: AOJu0YzbGQFkHsWjQaejXDP27Ili6qysaZtKgYZ8ENng3mhIHyqRLnri
	RN/L55K1E4ZuqlRRy8LM3aZMU1hwhvoOLs6FPN55YZyj/19hmilR8pRa
X-Gm-Gg: Acq92OGjnfIe/uT3RJ57EDLwRI9S2BONX4moUvguU2F71rW21vhyWoeuJZClOyB4kGe
	xLBGWgXqVFetq57rQBrGppOL6NO3yWsOSHNB2fTunCN/8j/lmvZZwu9zoFz2UhFtH5QgYikL1Nv
	Nk9PTUiunKrVQHWKKzSpr+Hk4dkfo4ec5roYcuPohletbWtqDL+h/ckkU0UUuxnxoTfcC9D4/cH
	keWl3kUG/qJNJe3yNkaV2Peau+4GXAXS4PZv/TxK+s8I6jXs2sSDiBgvMwuiP48uS5ejnjgs68+
	luhXoQLuU67UtHXXh8P2pV/DZi1NE/IkoDPgdQrctwfxmacZHiskk3YuWuSEKa7aa9uzN+ONIvm
	LXyfkwCpMFPqxaHVmUgXSO914m1CmJkknPd4P0ob7ZXz53h4yh1ZQHJGt/ZBajZcHKmsW1ASeUz
	sY+c1KCFTGvJQVL1Reae9+bJMIqV3FfEamjEVNLrFJTqNKfZ0jZLa3rB85aY2w
X-Received: by 2002:a17:903:1207:b0:2bd:3bfd:7512 with SMTP id d9443c01a7336-2bf368468ddmr118244275ad.29.1780306674521;
        Mon, 01 Jun 2026 02:37:54 -0700 (PDT)
Received: from localhost (bb219-74-228-4.singnet.com.sg. [219.74.228.4])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-2bf239e7019sm101611145ad.11.2026.06.01.02.37.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Jun 2026 02:37:54 -0700 (PDT)
From: Eugene Mavick <mavick4022@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hansg@kernel.org,
	straube.linux@gmail.com,
	nikolayof23@gmail.com,
	mavick4022@gmail.com,
	khomenkov@mailbox.org,
	william.hansen.baird@gmail.com,
	maxwell2119@163.com,
	dikshakdevgan@gmail.com,
	arthur.stupa@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] staging: rtl8723bs: rtw_sta_mgt cleanup series
Date: Mon,  1 Jun 2026 17:37:55 +0800
Message-ID: <20260601093757.612130-1-mavick4022@gmail.com>
X-Mailer: git-send-email 2.51.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix line length and indentation issues in core/rtw_sta_mgt.c

Eugene Mavick (2):
  staging: rtl8723bs: fix line length warning
  staging: rtl8723bs: fix alignment

 drivers/staging/rtl8723bs/core/rtw_sta_mgt.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

-- 
2.51.2

