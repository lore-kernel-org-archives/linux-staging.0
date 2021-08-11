Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A67F72
	for <linux-staging@lists.linux.dev>; Wed, 11 Aug 2021 20:15:28 +0000 (UTC)
Received: from dslb-094-219-033-123.094.219.pools.vodafone-ip.de ([94.219.33.123] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1mDudH-0004sF-TL; Wed, 11 Aug 2021 22:15:23 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Dan Carpenter <dan.carpenter@oracle.com>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 5/5] staging: r8188eu: remove CONFIG_USB_HCI from Makefile
Date: Wed, 11 Aug 2021 22:14:50 +0200
Message-Id: <20210811201450.31366-5-martin@kaiser.cx>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210811201450.31366-1-martin@kaiser.cx>
References: <20210811201450.31366-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We already depend on USB. There's no need to set CONFIG_USB_HCI in the
Makefile.

Some other Realtek drivers use #ifdef CONFIG_USB_HCI in their code, the
r8188 driver doesn't.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/Makefile | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/r8188eu/Makefile b/drivers/staging/r8188eu/Makefile
index cca7a58c5f29..6bd3a0590aa3 100644
--- a/drivers/staging/r8188eu/Makefile
+++ b/drivers/staging/r8188eu/Makefile
@@ -4,8 +4,6 @@ EXTRA_CFLAGS += -O1
 
 ccflags-y += -D__CHECK_ENDIAN__
 
-CONFIG_USB_HCI = y
-
 CONFIG_BT_COEXIST = n
 CONFIG_WOWLAN = n
 
-- 
2.20.1

