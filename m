Received: from m16.mail.126.com (m16.mail.126.com [220.197.31.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A9A936308D
	for <linux-staging@lists.linux.dev>; Tue, 19 May 2026 09:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779184657; cv=none; b=MwW2YG0TRncyo975qs4gw24w9oY/MTzGe7WOQ0BW9VNS/lLDNSj5Vfn+J0sx66K5Yv7GtoNyed1PDd796wyfur9LXrHGHWe3K8bPywWe8a7xGFxzFYWszM8/9dVZ3J9vfxwpRgQ9MdyjRom7jzEEhJ3jwEghVeNVeDEO85Uq5jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779184657; c=relaxed/simple;
	bh=hmzck63o7KyPiCEpVPdJnsJYbdtTZbEr0kK9RHlPgOE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=eGK7jw8Zh0Cnp+0uVnTuBUof1YJekewPux6RMOs5xtgo5DXjBqzvMUjLJ77NL5Q53gRN+4mu+Wr4DLxBjRGD7eQ72bNEHjV4KBcIocqCl5wL5lw+T5zloJlsead9f1jyvSaEiARn3y3mqQRFZeB+ODlYp1y4bRj2eTg77W6UDhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com; spf=pass smtp.mailfrom=126.com; dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b=aZpzXNmC; arc=none smtp.client-ip=220.197.31.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=126.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b="aZpzXNmC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=eC
	gJna25pKp+/Jms5nhTTJzK75XnUyjyVTSmfpKzSiQ=; b=aZpzXNmC/LhSALmV/O
	FjmE+d3t2qdK8xOvwYGUEZ9NN5VZb7SBY4VfGgji6BPTnLOxCPITYui9K18gCewa
	3d44yu41jQv4yHAC1QTClbnToOwwpcDWMrjo1CzJMQEQYN9RlTXGKSU5p2EObe0e
	QqDaTnTEwNF7MnLIAYuFyjsKo=
Received: from DESKTOP-EQVOVNC.localdomain (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wD3v_X9Mwxqg0AXBw--.63806S2;
	Tue, 19 May 2026 17:57:17 +0800 (CST)
From: lixinyu <xinyuili@126.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] staging: rtl8723bs: fix coding style issues in rtl8723b_hal_init.c
Date: Tue, 19 May 2026 17:57:15 +0800
Message-Id: <20260519095717.878742-1-xinyuili@126.com>
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
X-CM-TRANSID:_____wD3v_X9Mwxqg0AXBw--.63806S2
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU2MKZDUUUU
X-CM-SenderInfo: 50lq53xlolqiyswou0bp/xtbBoR2p8WoMM-2FPQAA30

Changes since v2:
- Drop Assisted-by tag, use Signed-off-by as recommended
- No other changes

lixinyu (2):
  staging: rtl8723bs: replace C++ style comments with kernel style
  staging: rtl8723bs: add missing spaces around operators in
    rtl8723b_hal_init.c

 .../staging/rtl8723bs/hal/rtl8723b_hal_init.c | 106 +++++++++---------
 1 file changed, 53 insertions(+), 53 deletions(-)

-- 
2.34.1

