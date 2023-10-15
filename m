Received: from pb-smtp21.pobox.com (pb-smtp21.pobox.com [173.228.157.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1157748D
	for <linux-staging@lists.linux.dev>; Sun, 15 Oct 2023 21:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foobox.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foobox.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=pobox.com header.i=@pobox.com header.b="A2jkdKH5"
Received: from pb-smtp21.pobox.com (unknown [127.0.0.1])
	by pb-smtp21.pobox.com (Postfix) with ESMTP id 813451D416;
	Sun, 15 Oct 2023 17:24:59 -0400 (EDT)
	(envelope-from ihor.matushchak@foobox.net)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to:cc
	:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding; s=sasl; bh=0O2NDpY4S0tP
	P9OmkqouakInYeyjbbP8mqVR0QWryX4=; b=A2jkdKH5SCcXAfuaDVsaiJCyAvBA
	EPntdB8c/6GFtAtnl24RAEQjU2G9KTi98pvEfdqPgTFkQ7fzzvnDzRx+9ZKla9b1
	IicmrkO9EtZ+k37jLrDPlL7wDUPdvl3c5sstY0+kvHlwHTYFneLI0TI5UJa6G4tp
	2qFSraF9zKjkkOA=
Received: from pb-smtp21.sea.icgroup.com (unknown [127.0.0.1])
	by pb-smtp21.pobox.com (Postfix) with ESMTP id 782AE1D415;
	Sun, 15 Oct 2023 17:24:59 -0400 (EDT)
	(envelope-from ihor.matushchak@foobox.net)
Received: from raspberrypi.telekom.ip (unknown [84.115.221.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by pb-smtp21.pobox.com (Postfix) with ESMTPSA id CB0D61D414;
	Sun, 15 Oct 2023 17:24:54 -0400 (EDT)
	(envelope-from ihor.matushchak@foobox.net)
From: ihor.matushchak@foobox.net
To: niklas.soderlund@ragnatech.se
Cc: mchehab@kernel.org,
	gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	ihor.matushchak@foobox.net
Subject: [PATCH v2] media: staging: max96712: fix copy-paste error
Date: Sun, 15 Oct 2023 22:24:47 +0100
Message-Id: <20231015212447.7072-1-ihor.matushchak@foobox.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <ZSq4-7W_ke5XKsrE@oden.dyn.berto.se>
References: <ZSq4-7W_ke5XKsrE@oden.dyn.berto.se>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Pobox-Relay-ID:
 4977A7A4-6BA1-11EE-A2A3-A19503B9AAD1-19565117!pb-smtp21.pobox.com
Content-Transfer-Encoding: quoted-printable

From: Ihor Matushchak <ihor.matushchak@foobox.net>

Fix the device model name in driver description,
which appears to be a copy-paste error

Signed-off-by: Ihor Matushchak <ihor.matushchak@foobox.net>
---
 Changes in v2:
 Add commit message describing the change;

 drivers/staging/media/max96712/max96712.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/max96712/max96712.c b/drivers/staging/=
media/max96712/max96712.c
index c44145284aa1..ea67bcf69c9d 100644
--- a/drivers/staging/media/max96712/max96712.c
+++ b/drivers/staging/media/max96712/max96712.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Maxim MAX9286 Quad GMSL2 Deserializer Driver
+ * Maxim MAX96712 Quad GMSL2 Deserializer Driver
  *
  * Copyright (C) 2021 Renesas Electronics Corporation
  * Copyright (C) 2021 Niklas S=C3=B6derlund
--=20
2.30.2

