Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8721C2F3D;
	Thu,  8 Dec 2022 14:20:45 +0000 (UTC)
Received: (Authenticated sender: paul.kocialkowski@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 1F653C0007;
	Thu,  8 Dec 2022 14:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1670509243;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LSzyeFFbgISZ/XcjaB38QewnBAIka+71vdPWj8SCHL4=;
	b=KVYG/tL1bPMselEeCN3b/I8Qw9g0WjPv/m2OQgIDTADcDDbRBVA0NAVDoSgyNeerL9ZFzs
	nFPWKVmw/4LeuyIPCj4Bx6J6pl0Zpsh6H++NIytcZTPBnLeKEUmU5yoogJeFL6CHFEhh+l
	kZGPQVCEsETlHo009nT/W5tpUgOTvwlE+GuCyUWowYMfpK2LaqEgIQ2GlGtGk3yd9zPQoB
	ilGh4D/ZOHRWMtB7aHKtvPZqdLQrEt8+I7WJY0hRVhbe2CBuLK5wmUI4aDjHz8V4HWRnj0
	G4NI8K4vHuwe6JmEvn3UrsSvfwwFywW6ih7n74Acr9g2OaOVXIumq3tUPo+LCg==
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
	Sakari Ailus <sakari.ailus@iki.fi>,
	Conor Dooley <conor@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>
Subject: [PATCH v3 08/12] media: sun6i-isp: proc: Error out on invalid port to fix warning
Date: Thu,  8 Dec 2022 15:20:02 +0100
Message-Id: <20221208142006.425809-9-paul.kocialkowski@bootlin.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221208142006.425809-1-paul.kocialkowski@bootlin.com>
References: <20221208142006.425809-1-paul.kocialkowski@bootlin.com>
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
Fixes: e3185e1d7c14 ("media: staging: media: Add support for the Allwinner A31 ISP")
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

