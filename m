Received: from pb-smtp21.pobox.com (pb-smtp21.pobox.com [173.228.157.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4703347B1
	for <linux-staging@lists.linux.dev>; Tue, 17 Oct 2023 18:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foobox.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foobox.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=pobox.com header.i=@pobox.com header.b="V+WD44O2"
Received: from pb-smtp21.pobox.com (unknown [127.0.0.1])
	by pb-smtp21.pobox.com (Postfix) with ESMTP id D2C2D2D623;
	Tue, 17 Oct 2023 14:47:07 -0400 (EDT)
	(envelope-from ihor.matushchak@foobox.net)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=from:to:cc
	:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding; s=sasl; bh=zxZFNkoqFPmt
	cYG6pQidM4iVr9IPmIm/N7mspSROcBk=; b=V+WD44O2vCmZf6sB7Bdn8k01hxW3
	61H9AfPlSbGa02aHElmoetNFshm8iYWs0/KdoffWlSsGc2ivw/VVvuKL7XWfYqze
	b7H+X/lghe5SxsS5HmJdCG5SHA0PzpLm9q/Ab0gyaRG0mvUoQrqsXpJF9SXjJFSd
	OyuIUrnLoMUblQ8=
Received: from pb-smtp21.sea.icgroup.com (unknown [127.0.0.1])
	by pb-smtp21.pobox.com (Postfix) with ESMTP id CB6412D622;
	Tue, 17 Oct 2023 14:47:07 -0400 (EDT)
	(envelope-from ihor.matushchak@foobox.net)
Received: from raspberrypi.telekom.ip (unknown [84.115.221.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by pb-smtp21.pobox.com (Postfix) with ESMTPSA id 0A0B22D61F;
	Tue, 17 Oct 2023 14:47:02 -0400 (EDT)
	(envelope-from ihor.matushchak@foobox.net)
From: ihor.matushchak@foobox.net
To: niklas.soderlund@ragnatech.se
Cc: mchehab@kernel.org,
	gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	ihor.matushchak@foobox.net
Subject: [PATCH] media: staging: max96712: Fix device name in description
Date: Tue, 17 Oct 2023 19:46:54 +0100
Message-Id: <942346374212972ef938ecac7c892558a48bfe75.1697568186.git.ihor.matushchak@foobox.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <ZS0wxi7SUhJcVh5Y@oden.dyn.berto.se>
References: <ZS0wxi7SUhJcVh5Y@oden.dyn.berto.se>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Pobox-Relay-ID:
 90AAAF4A-6D1D-11EE-B193-A19503B9AAD1-19565117!pb-smtp21.pobox.com
Content-Transfer-Encoding: quoted-printable

From: Ihor Matushchak <ihor.matushchak@foobox.net>

Fix the device model name in driver description,
which appears to be a copy-paste error

Signed-off-by: Ihor Matushchak <ihor.matushchak@foobox.net>
---
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

