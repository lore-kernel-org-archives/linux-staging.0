Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DFE237C0FB
	for <linux-staging@lists.linux.dev>; Wed, 18 Mar 2026 21:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773869243; cv=none; b=dlZnrxMSbPVfdzG7/QhKOz217ZfXswKX/GvnFgedMsgAoMxAAVYpSg8qDyDz3t4EhT5MIlfLslWZlDcJD5Uk1opT+8qPy8afnQrxQ8v8Fd+aBauLioU08Zy2kwXfcFVNMrq2d/nY17OcYe2LTHM2jk8RyCLqkCDBRl408DKpH/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773869243; c=relaxed/simple;
	bh=rM2dZM0qMqnXHr/mEQLFCYmhBQHVuaJpuztZuLPFcoQ=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=V/G31rd7mPZVlnJjeln7m3gei+rUOyZ7OWnprM/TtM4RQzDh6wDUGad3qi0QmIrCaLHCfbxy9WFj+cnpjtAQGqFwTP/QFJzv59w9g6BM9dBaaIgjROlIvXLHJN2wrckBkClkrE5jSeQJJCFMOu1Ol/PBC7lnve97ddrEzgCn60c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=zkwOvaxn; arc=none smtp.client-ip=185.70.43.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="zkwOvaxn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1773869240; x=1774128440;
	bh=rM2dZM0qMqnXHr/mEQLFCYmhBQHVuaJpuztZuLPFcoQ=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=zkwOvaxnZTfLcGoY+uRHp56ZL8OAuFykGDOZCgssJT+PxheD1ZYTUpx5gllBv6IiH
	 a0GvgzYbZEDsJ24u1ZCGIOYPQTb+IXvkxh9it1bwSwt+v0k+wny3/7h7XDh/erqKd5
	 qGok8HD8Nfxh74j+dkOonc9fZuDgiJrIVHvKzWQpl7bwyJrANca/4g7iXL3HCgvcgg
	 ZW8nubWkRPvPL9neBKxDbfot6kO2A6assDX8aJ1OPq7v3X4WAdlJpTB/S3SrSN6l96
	 zLzHj0Ed1WweyFACY5BUYtqww57xEBzpWHBBrknY2NhhvR7N0VWnoMzcJMPqtDWKrc
	 wRCEGyw3SyZiA==
Date: Wed, 18 Mar 2026 21:27:16 +0000
To: Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>
From: Abhai Kollara <abhai@protonmail.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-media@vger.kernel.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Abhai Kollara <abhai@protonmail.com>
Subject: [PATCH] staging: atomisp: gc2235: prefer usleep_range over msleep
Message-ID: <20260318212645.2014561-1-abhai@protonmail.com>
Feedback-ID: 8137229:user:proton
X-Pm-Message-ID: 7060df1210ec361ec9ec7bfbbe532dc88c918bf4
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Abhai Kollara <abhai@protonmail.com>
---
 drivers/staging/media/atomisp/i2c/atomisp-gc2235.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c b/drivers/s=
taging/media/atomisp/i2c/atomisp-gc2235.c
index d3414312e1de..db5e007efc56 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
@@ -433,7 +433,7 @@ static int power_up(struct v4l2_subdev *sd)
 =09=09=09goto fail_power;
 =09}
=20
-=09msleep(5);
+=09usleep_range(5000, 6000);
 =09return 0;
=20
 fail_clk:
--=20
2.43.0


