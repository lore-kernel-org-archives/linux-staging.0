Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19FBC2F22;
	Thu, 18 Aug 2022 20:33:57 +0000 (UTC)
Received: from whitebuilder.lan (192-222-136-102.qc.cable.ebox.net [192.222.136.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 9106A6601B7A;
	Thu, 18 Aug 2022 21:33:53 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1660854835;
	bh=hvEiAvpDFVVSoBAQ52gtXwVxHayJqh7AhxJnyUuWZII=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Yo6EbmMswKJNtgeL+rG3yxayMi3H8ZSeZRYASO4kAqFDuxN3l3Ka30qQpubYUGgwc
	 6bAbT8UosuDfp30uy4kGhil39cvLZTnCkhfmVPqoCVfshyhIlmcvunEeU7yrTXaWrk
	 SUo1ns8Fz/YomVGR3o501y17WiWZBSot5PRmVP2tUZn2Wn+wqwccGOHGHf17+PBQjd
	 gFw10zuG5qGqZOfA+S6Ltn9LkPlamcg63+EATVJ4Ee4a4pJhGWsElLHTlenrSFlnnW
	 JaKDEqlydcRNE0hQe3E5+RDkpQN8+K6oJW3bpFKgzmS1tRklppRZpl8ADQYoAVjUav
	 yQ+jsc1Vk2f7Q==
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: linux-media@vger.kernel.org,
	Maxime Ripard <mripard@kernel.org>,
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: kernel@collabora.com,
	Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	stable@vger.kernel.org,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/3] media: cedrus: Set the platform driver data earlier
Date: Thu, 18 Aug 2022 16:33:07 -0400
Message-Id: <20220818203308.439043-3-nicolas.dufresne@collabora.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220818203308.439043-1-nicolas.dufresne@collabora.com>
References: <20220818203308.439043-1-nicolas.dufresne@collabora.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Dmitry Osipenko <dmitry.osipenko@collabora.com>

The cedrus_hw_resume() crashes with NULL deference on driver probe if
runtime PM is disabled because it uses platform data that hasn't been
set up yet. Fix this by setting the platform data earlier during probe.

Cc: stable@vger.kernel.org
Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
---
 drivers/staging/media/sunxi/cedrus/cedrus.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c b/drivers/staging/media/sunxi/cedrus/cedrus.c
index 960a0130cd620..55c54dfdc585c 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
@@ -448,6 +448,8 @@ static int cedrus_probe(struct platform_device *pdev)
 	if (!dev)
 		return -ENOMEM;
 
+	platform_set_drvdata(pdev, dev);
+
 	dev->vfd = cedrus_video_device;
 	dev->dev = &pdev->dev;
 	dev->pdev = pdev;
@@ -521,8 +523,6 @@ static int cedrus_probe(struct platform_device *pdev)
 		goto err_m2m_mc;
 	}
 
-	platform_set_drvdata(pdev, dev);
-
 	return 0;
 
 err_m2m_mc:
-- 
2.37.2

