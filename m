Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CBBB2C9D
	for <linux-staging@lists.linux.dev>; Fri,  4 Feb 2022 12:15:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1643976940; x=1675512940;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=w/GuNznqndIUcAdDbJ2FxtN8SD25HIguOxBaARlAb1E=;
  b=I/B138Zh1rOMJJ8lce1moWaCw1OSMg/SJoPpUKNlegvaPTjihD9Kwe4y
   aiQklQUVtzIk16tzm5fvxh4vBPp0WBvQyBZvuz9zhyylKOLlQ7Uwes2Cd
   xc+Oh3vBKVbCqt+qTK7vzSgG3oVaF7ImOjga+84We/9OF30TLOS1d844w
   He0SGRNEE+P5wAFTKH3zhwpt5IwMAVWnyKI9dvnyIaMAOfzXHAkhToAdp
   ryAxyTSlG3T9jlXQf37aQkYtDFE0Y/gTaGW2qQ2+22JoaLXCc0dTQIPUZ
   Gv2Bl4U9IWHYkyp0PzzcbN1JUnanmJzY0D8JEXwd9LzcPGMrKwDWpkGFd
   g==;
X-IronPort-AV: E=Sophos;i="5.88,342,1635199200"; 
   d="scan'208";a="21903443"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 04 Feb 2022 13:15:30 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Fri, 04 Feb 2022 13:15:30 +0100
X-PGP-Universal: processed;
	by tq-pgp-pr1.tq-net.de on Fri, 04 Feb 2022 13:15:30 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1643976930; x=1675512930;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=w/GuNznqndIUcAdDbJ2FxtN8SD25HIguOxBaARlAb1E=;
  b=CvwyRAB+K8AiIManazXd7kpO5CcK37/S9oqyR8ayntBF4BeHtHhiOW40
   El4mYVm2ttbqNLzcKBFyMjEamqX20DfD1HlikHdXJfygFiRlNjH/R0LRL
   wO74OboqI8YJKgYD8pOQhjDczptuvAB6t+2Ozy17Xa1kVO3/6RbjdoKPc
   WZ/NDjaT2KFqGDEdkDLNB8a/kBQm9Mu8clP+Dq5fwDxwpgrv2MSKY36Ho
   xoSjFpc5nW6B+PKMmxS9blBAlgjqfHXSbuyFaDWtCsQscVzeObkR/jTwP
   lPJvoxJ4+Y9DcYqUQ99Iytye+qc52ScavL3YVF5Ago3wGc1o8PkzlMOyt
   Q==;
X-IronPort-AV: E=Sophos;i="5.88,342,1635199200"; 
   d="scan'208";a="21903430"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 04 Feb 2022 13:15:25 +0100
Received: from steina-w.tq-net.de (unknown [10.123.49.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 43F63280065;
	Fri,  4 Feb 2022 13:15:25 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Steve Longerbeam <slongerbeam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Dorota Czaplejewicz <dorota.czaplejewicz@puri.sm>
Cc: linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Subject: [PATCH 4/8] media: imx: Fail conversion if pixel format not supported
Date: Fri,  4 Feb 2022 13:15:10 +0100
Message-Id: <20220204121514.2762676-5-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220204121514.2762676-1-alexander.stein@ew.tq-group.com>
References: <20220204121514.2762676-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Dorota Czaplejewicz <dorota.czaplejewicz@puri.sm>

imx_media_find_mbus_format has NULL as a valid return value,
therefore the caller should take it into account.

Signed-off-by: Dorota Czaplejewicz <dorota.czaplejewicz@puri.sm>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 drivers/staging/media/imx/imx-media-utils.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/staging/media/imx/imx-media-utils.c b/drivers/staging/media/imx/imx-media-utils.c
index 32aaa2e81bea..e0a256a08c3b 100644
--- a/drivers/staging/media/imx/imx-media-utils.c
+++ b/drivers/staging/media/imx/imx-media-utils.c
@@ -544,6 +544,9 @@ static int imx56_media_mbus_fmt_to_pix_fmt(struct v4l2_pix_format *pix,
 		cc = imx_media_find_mbus_format(code, PIXFMT_SEL_YUV);
 	}
 
+	if (!cc)
+		return -EINVAL;
+
 	/* Round up width for minimum burst size */
 	width = round_up(mbus->width, 8);
 
-- 
2.25.1

