Received: from mout-y-209.mailbox.org (mout-y-209.mailbox.org [91.198.250.237])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0768A37E30A
	for <linux-staging@lists.linux.dev>; Mon, 30 Mar 2026 11:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.198.250.237
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774870397; cv=none; b=LmhoIaJoK+2xIlWIHR6dEM4GWYyg2xNtQYvyKx1COHA0OovwSbyDyvEbt2wiEn4xLE6Yi8GZMFrJbdLCYrcbHJeBLFyzU2p/5b38dBWQE5TLe4PSmhkdNChspKgsd5xXRP6cwY3GdnJQ2WIWRDfB8/mv62uW1+xS00/uwTykWA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774870397; c=relaxed/simple;
	bh=wi/sEO38HhaceOGF8PBE5aRPU+5JbMyVT2MXH0kmMmM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hnG5PYuj98RfRG7OvkIz6L/N5UKXxkEmx8k7ioFQfRJO/nHwYsJeF8kHVjjxPbtZctILzKKLtkPTi3QNWmXT4Etz7iBMcHQJ3MD7f/SkiHTBn5RPJE2CDsB49MvMZ6aCIIuhvoGr1minBiuNMeSwY4WRq2Pz97/lyaffX13Sijc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=pgcbTyPp; arc=none smtp.client-ip=91.198.250.237
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="pgcbTyPp"
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-y-209.mailbox.org (Postfix) with ESMTPS id 4fkpyv51lczB0tF;
	Mon, 30 Mar 2026 13:33:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1774870392;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wi/sEO38HhaceOGF8PBE5aRPU+5JbMyVT2MXH0kmMmM=;
	b=pgcbTyPp8B4b77HThIso8p6cdoY0mMiLafXgM6eJLBqi4+NfgTYDlWaMx9fBm7rVO8JWTI
	VifU7HaNXTSnOMTky10Ohf30CbrL/vB8uXzaFH6bMAB9Ws5KchTt24adx3vx0W+bY9PJPu
	0TOEtzJ2cBWfvFH6d2CQRw1s3golKcxg9l4ygBWMflog9YJtSyF7oTZYjP6uMdmJaKAW6v
	YJu3ueitcWfMSs+bZ3EQGHXnwmWQlzDjfJ7+46+uQgbOKmKBpFlmPFlaOk147Eqd5LmmDt
	3OivwXvLVPVtYCQmfRAQZaGibgokBSEIRTfYZP2DnW1Z8R91kO4kCJkDwzB0Vw==
From: Mashiro Chen <mashiro.chen@mailbox.org>
To: error27@gmail.com
Cc: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] staging: rtl8723bs: fix logic bug in WRITEEF4BYTE macro
Date: Mon, 30 Mar 2026 19:32:27 +0800
Message-ID: <20260330113227.88818-1-mashiro.chen@mailbox.org>
In-Reply-To: <acl-tVy1PJX3XBuR@stanley.mountain>
References: <acl-tVy1PJX3XBuR@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: 8fx4ioggj111jm7g6965fa1gbiox8534
X-MBO-RS-ID: 6e38dfd20f0b572fb95

Hi Dan,

Thank you for the feedback. After further investigation,
WRITEEF2BYTE, WRITEEF1BYTE, READEF4BYTE, READEF2BYTE and
READEF1BYTE are also unused. I will delete all of them in v2.

Thanks,
Mashiro Chen
