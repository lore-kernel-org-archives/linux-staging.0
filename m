Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6301E3E2ADC
	for <linux-staging@lists.linux.dev>; Mon, 25 May 2026 08:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779699311; cv=none; b=tQDVaK1FCvjkwc7/HLinrn6zDDCuUzf2wofhgzLchE0lP9KOkR0tP/t70CgUZqycI4k3cgcnvoSF+YrteMe1Ajk6ejqa98HC2zlK3eVMusw0RawPfUTOT4v5/IKpDmtbGXhWcztb1LGk1o3TGQdWh+ZFJTD37hoIYIZMDcU7e7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779699311; c=relaxed/simple;
	bh=y36FUV+Kj0COd2vvIG9U/6igV1AeQxXH+J1W3RL3kQU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RbWqtoSWXg51EkDIIA4p645GYz2KurZrg4kAy0XWecaTsTGrXQ3WySetR7aF2iapaBzZC1RPEoy05Da1piEPnRbeJ0vvpMhYy8iTePFSOpwhQer0AT1AT4ygmkyPkpYgMDe7f2CLoQuDnypruBRWuTPusNHT3XzSByYTx8LdCz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=cAq3HA6D; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=cqMVDUzE; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="cAq3HA6D";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="cqMVDUzE"
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4gP8pb0w2sz9tp5;
	Mon, 25 May 2026 10:55:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1779699303;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pZy96z5qFb4ItyQSThPEEv+Sh95ZU/kjNEwyLEXw154=;
	b=cAq3HA6DQxXTf+cLasqdMU34gSCiAFnf4R2wF+4UivcTKddeWMwTtASg2PKNUtE1R4mLX0
	04gigboMsu9XJMWlj+b65mMlwqnswtTQOmTV1LcKo7zVEyikzaqqAVSWRMfCpxSIp0SJr6
	zTPqgtIdjp4+IlNbxXMYd38L+qPtP9my3fLNCCBaPYdDOnNFj4IWkCnbxzFsk+ayGGZCXV
	20INKepou5Z+7Sre8bwA+qt8Gwr5iOjyRu4IK/q4woFLw2oToy8a5x/H6tUjqQRKTJXTKY
	bFLF55rv4dvyKNa2nYSr7SknszrbW7krHZ8HdFSioPKvYKQKNP3u0TR9F9KJUw==
From: Manuel Ebner <manuelebner@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1779699301;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pZy96z5qFb4ItyQSThPEEv+Sh95ZU/kjNEwyLEXw154=;
	b=cqMVDUzEBllcaZyKsJxGv5dvDIZAg/+0snCeqPqi6PlwmzP4Nq4tvRvSLEnf+aFGWk+0gy
	Y93/sfbNSa1zC+UWQxjvUrd31kixxrbhX9cyWNDIOgkrj1iQ0JSZ++8Fiu3yiSTeVSXepo
	hHPj2Aj6eWIsks3L6o1spn8f0bua8/7LXx051qVd/yPiiBADoToF5fvxFYxZ3fllLz6q4M
	sLSoL0uWSqJQOeCGCePD16wuaGHTlXFPNNxzEwyfIPlTpjTQjMkR6LS5xuOKsoZvkAaL/K
	QS2+nKv8ELMZ9CcI2+iKW6/faPOkeoUqmPn/5HGIOqXxkKkn8eDFfAWBN1GPvg==
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Omer El Idrissi <omer.e.idrissi@gmail.com>,
	linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list)
Cc: Manuel Ebner <manuelebner@mailbox.org>
Subject: [PATCH v3 3/4] staging: rtl8723bs: cleanup braces of sdio_intf.c
Date: Mon, 25 May 2026 10:54:12 +0200
Message-ID: <20260525085411.215692-2-manuelebner@mailbox.org>
In-Reply-To: <20260525084956.215254-2-manuelebner@mailbox.org>
References: <20260525084956.215254-2-manuelebner@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: fb64ff37907598a0263
X-MBO-RS-META: teapkz81unxb5q6tjw45rf6snr4it41i

Reformat function declaration.

Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>
---
 drivers/staging/rtl8723bs/os_dep/sdio_intf.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
index 63ec486f9a34..fd805ee74a1b 100644
--- a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
+++ b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
@@ -334,9 +334,8 @@ static void rtw_sdio_if1_deinit(struct adapter *if1)
  * notes: drv_init() is called when the bus driver has located a card for us to support.
  *        We accept the new device by returning 0.
  */
-static int rtw_drv_init(
-	struct sdio_func *func,
-	const struct sdio_device_id *id)
+static int rtw_drv_init(struct sdio_func *func,
+			const struct sdio_device_id *id)
 {
 	int status = _FAIL;
 	struct adapter *if1 = NULL;
-- 
2.54.0

