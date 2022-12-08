Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74956A59;
	Thu,  8 Dec 2022 11:48:16 +0000 (UTC)
Received: (Authenticated sender: paul.kocialkowski@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id D1A01240011;
	Thu,  8 Dec 2022 11:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1670500094;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AdvPC73c9zwfkFT3idm11mKPKt/UTJmdPBrpsnJ9sEg=;
	b=DtiFiffK3Z98ZaFmBXwerOQeFzge8eRkBWde/Pd1X3KqrPJKGWFDwDVKVtpGS/eiMk9/5E
	TorFM8o8IyCQ2MvECljMaTW6U1RFBqHCGt5BvVK9K9e+wf5gjJ229V2pcvZXTq5Od5r9kt
	++SnRgVYIEetCpQ8n9mj0WIBH4LeCnWIFTtEaYBzk1crXGFjs5SO9a3xfIhVwS7SrcGgpi
	+GIXb573ZWdyHhxJAaaOkq4XYbEQaSFRBVxpEpG2ri7/vVRi/jvuGm16+v/dkNjPaLppf+
	u/W+BheJsV1Jly/MvH57Vo5TpJCnNjX09LWFI5OckHEex8C/jIFh/54+N7l7tg==
From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To: linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: Yong Deng <yong.deng@magewell.com>,
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Sakari Ailus <sakari.ailus@iki.fi>
Subject: [PATCH 7/9] media: sun6i-isp: bridge: Error out on invalid port to fix warning
Date: Thu,  8 Dec 2022 12:47:40 +0100
Message-Id: <20221208114742.399461-8-paul.kocialkowski@bootlin.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221208114742.399461-1-paul.kocialkowski@bootlin.com>
References: <20221208114742.399461-1-paul.kocialkowski@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The enabled variable is only set for a valid port and used later,
which triggers an uninitialized use smatch warning. Explicitly error
out in that case to fix the warning.

Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
---
 drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_proc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_proc.c b/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_proc.c
index a95709d2c573..4f34c1bc8be9 100644
--- a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_proc.c
+++ b/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_proc.c
@@ -416,7 +416,7 @@ static int sun6i_isp_proc_notifier_bound(struct v4l2_async_notifier *notifier,
 		enabled = !proc->source_csi0.expected;
 		break;
 	default:
-		break;
+		return -EINVAL;
 	}
 
 	source->subdev = remote_subdev;
-- 
2.38.1

