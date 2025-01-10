Received: from out162-62-58-211.mail.qq.com (out162-62-58-211.mail.qq.com [162.62.58.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6637B1B4248
	for <linux-staging@lists.linux.dev>; Fri, 10 Jan 2025 13:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.58.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736514658; cv=none; b=MtclikyKTddIKR1xPEqSEIICn/zcFhDutGiW1mporawFaDOg4J7wWDYbGYrolB21IJe6zW7nOTIyp/KsBFjZ23q/Qzma292k6yleWXjlZ+V1LdTm4GoBaQzKD8JpP+x8zRbEjvrApPWqFbwPXq87DVH28CYG5qI8SBx3XXP4Yfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736514658; c=relaxed/simple;
	bh=1gCLQ/r8fNOVjtlo0fX4NPhNYYbq/xft1RvIo7TGJE0=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=pm/X8unETT3d+3MREBuYx83zLGVMZ2eynfaSCJH7+Kj4r/2FEE61rYibucWe5R3uH9c9pgzrDQseVd87g38qKQ6ybcLJ6Svp73yR+tONbqCNxMmVGDffpqtuzvKGlChaxAnZ7Clqzp+XUbfb7+Yt3nSvnz78OvV8PxOdX8UuK0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=Red54.com; spf=pass smtp.mailfrom=red54.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=d7JyV9dD; arc=none smtp.client-ip=162.62.58.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=Red54.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=red54.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="d7JyV9dD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1736514643; bh=+UPyFv6cjm/faZ6PahzYHZgQnlCXrtKHglr3Bc5Qre8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=d7JyV9dDze+SfuQM//O2pcHDCu7Bc9ckrU2dxsDnFwEwWr/4W9wRMoaoCDm0dTHOT
	 MS0MWga5O+1oniXlSGYPq8AeHCUR8frSe8842P6uy/IqhhY4GdPcN+ADTMKKsz1Imd
	 9wlcUhCg3siPB0oQbjvJHumbgfdNDIVeCGEu2gcs=
Received: from mail.red54.com ([171.25.193.77])
	by newxmesmtplogicsvrszc16-0.qq.com (NewEsmtp) with SMTP
	id 29A3C8E3; Fri, 10 Jan 2025 21:10:26 +0800
X-QQ-mid: xmsmtpt1736514626trs0ck0qb
Message-ID: <tencent_202D558F9075C15FCD33573BC88F48E03706@qq.com>
X-QQ-XMAILINFO: MyirvGjpKb1jj3rihDsXtofPvHyvgpJTI0UTwPvkrrF7FsuDmkzKz57XngCWZv
	 7ni5E6hytmQjAdHTUKqQabpJ2Y3Oj9tKJURHriTUSWxeoyk8C6T6renQl7GfgfYdOmumzgZMdqYY
	 YFXnRwe6fLqmeGd4OsWL3hRfcU9ajflNW5liWICAZpAwgg+V6Xp5xdCJFI3+xzs3sNrBSExvOLI5
	 plde+vSks3N0SQc2c1bIzSNJ9DNWq/QEvi83kmbSmcKL4uTsr4BIQyKIPY9NGhbp6CjuxBvAsyDw
	 iMNRh0SbMpDP9pm9TPe/s2/rk9l/+kYA+H8PYxuijAKvqRgxj0Nt186JI2Lt/JjRwginRWOfvlKw
	 lx5FpiuDuULligUjOGptgAEHB2VpwWKLjq1XVmh+4/lfY4rLh9j+clUXY11irSMmUscWhcs6EzDC
	 R18Nu0jbk4KTEIFo8OhpzPXQ4Kz7o3nQnqfCQrV4Kje47XZYlA5a79fjkkbHiZwdD9dC39qxHZxw
	 LSAhnusXJ/QxBPy7s1IzUUmTJ2w946dNbGTuPcT1fl94cPphDAMyMAocfkfC/ArByi3ER3MD5tk0
	 V7pNFeH2ES/0NLJ1ljyYq3iQ8JZBbogJlzXtn46pVphyOcLy61pmNL1xEmFMXwdj7tjaQpbaGPOd
	 GHJVLKTdcdTjnIXFb9zOfzgLtQzckiRgBgrwHCLY/7jYz027HFehlKsSJ7DabaZOaV6dIexxHbT8
	 zwOcdtkIk3U2rVLnabN5q0rQpGe/cNL4Krabz4TUHKkxkNJ1z3oO1fQlOQgN8qittaN7JQaWrnkm
	 jz0pKYHoCSQP+6IL0Km2Lx82KKisBMABHZ1d2miLHO8PSsV5HB5YCCGHpREZQO0biHyDZpGEIrc4
	 94Kd/1g8onMjpKcgdAEgK7fGnFjMXmCzWOxo/pOeN5YQ3U1nUG2EYTY9nvpnKaqSfpLvJ/WNdqxk
	 dzmEaNLQ7nKo6FfThnEyw5PgR5tZP4
X-QQ-XMRINFO: OWPUhxQsoeAVDbp3OJHYyFg=
Sender: yeking@red54.com
From: Yeking@Red54.com
To: arnd@arndb.de
Cc: Yeking@red54.com,
	dan.carpenter@linaro.org,
	gregkh@linuxfoundation.org,
	hdegoede@redhat.com,
	johannes.berg@intel.com,
	justinstitt@google.com,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	masahiroy@kernel.org,
	nicolas@fjasle.eu,
	philipp.g.hortmann@gmail.com,
	rodrigo.gobbi.7@gmail.com
Subject: Re: Re: [PATCH] staging: rtl8723bs: Remove ioctl interface
Date: Fri, 10 Jan 2025 13:10:23 +0000
X-OQ-MSGID: <20250110131023.80454-1-Yeking@Red54.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <aeadd5b3-c187-4800-ac1f-fe2b53bfb3f7@app.fastmail.com>
References: <aeadd5b3-c187-4800-ac1f-fe2b53bfb3f7@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> Thanks for picking this up again. I had done a complete removal
> of ndo_do_ioctl a while ago but hadn't gotten around to finishing
> the upstreaming. For my older patches, see
> https://lore.kernel.org/all/20231009141908.1767241-7-arnd@kernel.org/
> 
> Your version is very similar but seems to miss a couple of stale
> data structure and function declarations. Can you make sure you
> include all those?
> 
>        Arnd

Thanks for letting me know that you have an old patch. The stale functions like
rtw_ndev_notifier_call, rtw_ndev_notifier_register and
rtw_ndev_notifier_unregister, and the related struct rtw_ndev_notifier have
been removed in 037f9a6df3fb (staging: rtl8723bs: Remove no-op
netdevice_notifier(), 2024-10-24). As for the intf_priv struct that was removed
in your old patch, it has not been processed yet, because rtl8723bs has a lot
of such structs that have not been used since they were introduced in
554c0a3abf21 (staging: Add rtl8723bs sdio wifi driver, 2017-03-29), such as
many in rtw_mp.h. I plan to deal with these contents later.

	XIE Zhibang

