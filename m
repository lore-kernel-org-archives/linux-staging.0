Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7005C3ED114;
	Mon, 18 May 2026 10:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779100342; cv=none; b=NCBpQ/lYrKV9o7iOEq3NKAvQVLC2nppLbbdlhH0NvcoCwiKl+0W5Kzm58fDsrbaENNy59eTgm7KsHIqg6Cn59Ta96hnZccqH4MzhW+UkE/Z3ZVXVXOTPP8KPCJ/fWUV9J+I1nHlQvI4Y28ANBU2RzfC0C+2gO6ee3ZzAOztsE9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779100342; c=relaxed/simple;
	bh=y79apGl6OKDANYCmmE5+PZLLyf9iwNGUT3KnWbPd0gQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MGfgCr//MEj48E2y1XZgi4lMXwx5zcdTpdSuywR8OT42YXXdil92XstlcAAmKEsv9JGsnLo/MQl8hvJbrmqcVqgs3rCen/pUQX6nxzoCUNLwnenJLgd0JL32qm6xfxk+B5pPcNM7jstjI5UDqpzh9Wqt9vJDwDo/GWVKBdezoYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 4CB791F80041;
	Mon, 18 May 2026 10:31:44 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id D0DC9B40828; Mon, 18 May 2026 10:31:43 +0000 (UTC)
X-Spam-Level: *
Received: from collins (unknown [192.168.1.64])
	by laika.paulk.fr (Postfix) with ESMTP id 6F206B407FB;
	Mon, 18 May 2026 10:25:01 +0000 (UTC)
From: Paul Kocialkowski <paulk@sys-base.io>
To: linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: Paul Kocialkowski <paulk@sys-base.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arash Golgol <arash.golgol@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>
Subject: [PATCH 13/16] media: sun6i-isp: Add dummy params link_validate implementation
Date: Mon, 18 May 2026 12:24:48 +0200
Message-ID: <20260518102451.417971-14-paulk@sys-base.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260518102451.417971-1-paulk@sys-base.io>
References: <20260518102451.417971-1-paulk@sys-base.io>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There isn't anything configurable about the params video device link,
but the v4l2 core complains that no op is provided so implement a dummy
one to make it happy.

Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
---
 .../media/sunxi/sun6i-isp/sun6i_isp_params.c     | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_params.c b/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_params.c
index 77c2d06c0436..b7ef33fa2b13 100644
--- a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_params.c
+++ b/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_params.c
@@ -450,6 +450,18 @@ static const struct v4l2_file_operations sun6i_isp_params_fops = {
 	.poll		= vb2_fop_poll,
 };
 
+/* Media Entity */
+
+static int sun6i_isp_params_link_validate(struct media_link *link)
+{
+	/* Nothing to validate here. */
+	return 0;
+}
+
+static const struct media_entity_operations sun6i_isp_params_entity_ops = {
+	.link_validate	= sun6i_isp_params_link_validate,
+};
+
 /* Params */
 
 int sun6i_isp_params_setup(struct sun6i_isp_device *isp_dev)
@@ -470,6 +482,10 @@ int sun6i_isp_params_setup(struct sun6i_isp_device *isp_dev)
 	INIT_LIST_HEAD(&state->queue);
 	spin_lock_init(&state->lock);
 
+	/* Media Entity */
+
+	video_dev->entity.ops = &sun6i_isp_params_entity_ops;
+
 	/* Media Pads */
 
 	pad->flags = MEDIA_PAD_FL_SOURCE | MEDIA_PAD_FL_MUST_CONNECT;
-- 
2.54.0

