Received: from m16.mail.126.com (m16.mail.126.com [117.135.210.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D09DB37BE8B
	for <linux-staging@lists.linux.dev>; Tue, 19 May 2026 09:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779184764; cv=none; b=EFsDp+MQfUGXo4CqhFNSD3NVfh4Y2rirGLnj5+OO1aK9waZpBIKHR0vXm9bkIaMyxxKsW3Zr78vrDMnbNxkqJbRExC/5YWhqW6W5gAkzgN72F69y3IqHVnnfPZxMapEdSU4OBhHHKiRF74cA1KSMSqqx3YnhDOc2EWEERXspwXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779184764; c=relaxed/simple;
	bh=u4gCTUGaWH6Z9G7grsV7yhfFioUhrDS5Os03CPchUNg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=a27IaiGFOQrtf7mha91DLRoiRBjBMq8tjeEgXW5ez6FWU5CmQBuZAUtik13NzRmCro2BdCWR+TptV2+PMIbDgh6LH3d9NTCJK4pEFdebp0E4ghL8IjiRcy4J4uA7l/Orr+76B+I19IdhKbIgXf7LpUvWsWKAS5al3saog8zOGHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com; spf=pass smtp.mailfrom=126.com; dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b=RCxaKUtL; arc=none smtp.client-ip=117.135.210.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=126.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b="RCxaKUtL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=uk
	CZ9nU36hfdgSJS5C+KEUE6AYJ/+IBY/lUvq2pwtMs=; b=RCxaKUtLlnFeJR/yW9
	vLA8e9k/RTt81nPZdKRbAhaANGRIl1BxJjJb4RC3SGKev68eGnZloGVpjdR4LJQX
	7M/xj+kNE6/cRI+x7Dj5S7bJeYWb2buQkoDykdDpdXKuGhDjpZ9/qmJPObQEq46Y
	H5mOP8Nn17lrbL/ldcihNU2Fg=
Received: from DESKTOP-EQVOVNC.localdomain (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wD3X_VwNAxqsKwRCQ--.41303S2;
	Tue, 19 May 2026 17:59:12 +0800 (CST)
From: lixinyu <xinyuili@126.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/2] staging: rtl8723bs: fix coding style issues in rtl8723b_hal_init.c
Date: Tue, 19 May 2026 17:59:09 +0800
Message-Id: <20260519095911.880517-1-xinyuili@126.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260519090114.828918-1-xinyuili@126.com>
References: <20260519090114.828918-1-xinyuili@126.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3X_VwNAxqsKwRCQ--.41303S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrCr4rKr4xJF13ZFW8Zw1xGrg_yoWxGFX_ua
	y0q3yIqry8Jan8K3W3Aa1rAaykAa1kC34rJ3Z8KrWUZFyfuF45Ww1kJr4fXa17WF4jyryU
	Aw4vk3sYyr1IgjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUnOJ55UUUUU==
X-CM-SenderInfo: 50lq53xlolqiyswou0bp/xtbBrxDGD2oMNHCXCwAA3I

Fix two categories of checkpatch coding style issues in
rtl8723b_hal_init.c:

Patch 1 fixes C++ style comments (//) by replacing them with
kernel style comments (/* */).

Patch 2 fixes missing spaces around binary operators (|, &, +, >>)
throughout the file.

Changes since v3:
- Rebased and cleaned up cover letter

lixinyu (2):
  staging: rtl8723bs: replace C++ style comments with kernel style
  staging: rtl8723bs: add missing spaces around operators in
    rtl8723b_hal_init.c

 .../staging/rtl8723bs/hal/rtl8723b_hal_init.c | 106 +++++++++---------
 1 file changed, 53 insertions(+), 53 deletions(-)

-- 
2.34.1

