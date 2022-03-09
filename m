Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DA3E4354
	for <linux-staging@lists.linux.dev>; Wed,  9 Mar 2022 11:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1646826189; x=1678362189;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=W7ZlPSFo+FHjKYpXGX7Y0kh08F+NDUeJwlxNFhiBxYg=;
  b=NiXSAqBGCfWtkYcBzWvHHWpQxdXCe1c90K3GH5F4CQcSkazziqgbc7Vc
   zGgPEM98YUCvuNPQvsXMpC95PtFVASOz6ijS7G126VNOnrp6dzw+eJvpD
   SwPcZsZs4wGikBD6kkFTNVkPJaocHQfO/dg5rDtZao4eT9PU+xXWM/ZDb
   F156kA9tBin6GDdf3O5hfV/vXNiWs5+ldkuAriUhp0WcXtmUQFaVQX2mK
   LAFNambLHve2/plB846IdBtK63OXyOj6M2rSxYG241XkMFLRKBWycUaLY
   NH/yeViOi40xj92JzymtPkbhLYyR4Lwm/G+aMfdzl+hzYpbCJnkFK/qiX
   Q==;
X-IronPort-AV: E=Sophos;i="5.90,167,1643670000"; 
   d="scan'208";a="22553366"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 09 Mar 2022 12:41:54 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Wed, 09 Mar 2022 12:41:54 +0100
X-PGP-Universal: processed;
	by tq-pgp-pr1.tq-net.de on Wed, 09 Mar 2022 12:41:54 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1646826114; x=1678362114;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=W7ZlPSFo+FHjKYpXGX7Y0kh08F+NDUeJwlxNFhiBxYg=;
  b=TXMtn1w+93cbVArP26iR/6Rr1XuyI0vb4B3lQZ685fIL5jeyx1lsjyW6
   FS8z6TF7NVWVMb7zyJdxdvo9DlhQ8YjRaazu/Vs3rzZuld2hn4tDwLMEf
   bwAqNBNwhQxqzg2TCKX+T1yhhIEXUycJHHw8VqCAooXiE877mfh9mazsb
   8dZRgDj4Rh94iSG7dK+KwwIotdg8c/UvuHdyWg7ZeHtsrOPhNBj/2cRGS
   L5cKGEsvE6hl+rZ8RphatYNdtmEY3rsZb4mrLlurD1fcWGppToo2z0MND
   TUci5Xg/3Z34wTLNRbN9xQqZr0PTp0r7dgWoAN3A7Te5ILzS+spsPyM9P
   w==;
X-IronPort-AV: E=Sophos;i="5.90,167,1643670000"; 
   d="scan'208";a="22553365"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 09 Mar 2022 12:41:54 +0100
Received: from steina-w.tq-net.de (unknown [10.123.49.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 3F29C280078;
	Wed,  9 Mar 2022 12:41:54 +0100 (CET)
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
Subject: [PATCH v3 4/8] media: imx: Fail conversion if pixel format not supported
Date: Wed,  9 Mar 2022 12:41:40 +0100
Message-Id: <20220309114144.120643-5-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220309114144.120643-1-alexander.stein@ew.tq-group.com>
References: <20220309114144.120643-1-alexander.stein@ew.tq-group.com>
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
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
Changes in v3:
* Added R-b Laurent Pinchart

 drivers/staging/media/imx/imx-media-utils.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/staging/media/imx/imx-media-utils.c b/drivers/staging/media/imx/imx-media-utils.c
index 0534f7746cb3..0152bbcc5150 100644
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

