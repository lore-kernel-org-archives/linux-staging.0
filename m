Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA08D3321D4
	for <linux-staging@lists.linux.dev>; Mon,  5 Jan 2026 10:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767609946; cv=none; b=Ip/t04mye2XaKuEsqgK6blaKIwFe9t/Dt6LJyh5Q3NcP/ej5mXnvtfALSMfOo2mYi6ocCCTUSMznwg2IiwlhtPdJ6TYqh6RMYCr16QeDDw08sCjT/TJ+jHlOVrGViW9ulHoxCfbDdRHB75Qojv8g/F4txyXAM8Dy6iwbaa4uZ7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767609946; c=relaxed/simple;
	bh=pog373FV4yw7WByTN8R/zCYl0HynrCssMTpYwTyowYU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UwBcEQuKVYOG1nnwgemw7x8HPwesOCGdAjp5EKWzj/cD5HIZtht0fNjg5RLmDviAD+5AX3F2M32j05rQwOQ+eDjUav7lp6x7zCg1uKedvLRWKmMnHb1otmyKETDCy03f4Y+acZzrASTo7zswFwZxLR8/N5Agp1tmGqvpjkCesi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=FuNIvbmG; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="FuNIvbmG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=j9
	IYzl5Mgx7Z3V24w/mbu3ZTvXoRK6X9gdyX889/ptA=; b=FuNIvbmGQMAq7MvUzB
	UVmVbOwtQwDmLy+qbORO/o1IqTrdrSVDgeZxohKOY2VVQCliVoNpd3ogsjWsyG/W
	CJdww0UKvjo4FPjtLbPpLDTrn9sy4mmmp11b+9cSaDl1TbBdVUsgx2cssVBpa+qK
	vxv9QTeyIJQWPgjjBmAch9/Cs=
Received: from outlook.com (unknown [])
	by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id _____wBnpxI1lltpOgk_EA--.3518S4;
	Mon, 05 Jan 2026 18:45:24 +0800 (CST)
From: Holden Hsu <holden_hsu@163.com>
To: Vaibhav Hiremath <hvaibhav.linux@gmail.com>,
	Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Holden Hsu <holden_hsu@163.com>
Subject: [PATCH 2/2] staging: greybus: arche-platform: fix spelling mistake in comment
Date: Mon,  5 Jan 2026 02:45:05 -0800
Message-ID: <20260105104505.8120-3-holden_hsu@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260105104505.8120-1-holden_hsu@163.com>
References: <20260105104505.8120-1-holden_hsu@163.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wBnpxI1lltpOgk_EA--.3518S4
X-Coremail-Antispam: 1Uf129KBjvdXoWrZFWktrWkJw43XFWrJFy7KFg_yoW3uwb_Z3
	ZFgr4xtrZ5Aw1vkw12yF43CryxXaykXFZYv348KrZxt3y5C39rJ3WDur1UZFyxW3y3KFyU
	A3ZrXr4akr13JjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU8lD73UUUUU==
X-CM-SenderInfo: xkrovv5qbk23i6rwjhhfrp/xtbC-AXnuWlblkXp-wAA3Q

Fix 'premits' -> 'permits' in a comment to improve code readability.

Signed-off-by: Holden Hsu <holden_hsu@163.com>
---
 drivers/staging/greybus/arche-platform.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/greybus/arche-platform.c b/drivers/staging/greybus/arche-platform.c
index de38cd4b3..f669a7e2e 100644
--- a/drivers/staging/greybus/arche-platform.c
+++ b/drivers/staging/greybus/arche-platform.c
@@ -569,7 +569,7 @@ static void arche_platform_remove(struct platform_device *pdev)
 static __maybe_unused int arche_platform_suspend(struct device *dev)
 {
 	/*
-	 * If timing profile premits, we may shutdown bridge
+	 * If timing profile permits, we may shutdown bridge
 	 * completely
 	 *
 	 * TODO: define shutdown sequence
-- 
2.43.0

