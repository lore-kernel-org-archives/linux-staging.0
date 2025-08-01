Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2A6414AD2B;
	Fri,  1 Aug 2025 21:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754083193; cv=none; b=MGt9UjBy1FwuDJE1o/EGUVSrBxVN8Z/I/g7NvwHZ1u11ICoR3zDuFZXcLojesy6wH8Wxgi+Ox/JzC07T0UaEr53WwSyGzO8BIoRYD3i+IkMCoHIKwUrljAmGTdsI+M8jNdzExnKSG3xyPAiHIEE+1sfEMZxZz6zX5xnqVSf3UEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754083193; c=relaxed/simple;
	bh=oN6XpE9OHRyB+JWejgT1fLjEbaw9Vp28BwidxWB9bek=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tm8Sifx5Wwki1C/iPXKLP1r09ozlkPgxjkrGjFV+fcsh437bVNORf930lUVtYL4CzGJKOtqMOsCbZ8sGnB2LWAVwD+6VYpnNbcshbFxSYSB6fRHU5XKrGAjwSVYOHj19sj+EEtTX68dpZeHTpgbkWJQaKfgIYEV75beM3u9LZXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=TlPqjWHh; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="TlPqjWHh"
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 45E2850A;
	Fri,  1 Aug 2025 23:18:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754083139;
	bh=oN6XpE9OHRyB+JWejgT1fLjEbaw9Vp28BwidxWB9bek=;
	h=From:To:Cc:Subject:Date:From;
	b=TlPqjWHh7ALXw5vtsUE07dDsb/1XO8MAS3OAJ8DxG2cXcx/rI6DnuiRkFRj40n3PH
	 wmdF4TuNFkCwBpxPobh5WEWRuOMtGyfB/LAJghDcoBmgpcQf8BBMo4ihbb3TdP5OUD
	 adpbR15umR1zrSgn2WkrOVAooLGql3YpWcFKTIiE=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Hans de Goede <hansg@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Steve Longerbeam <slongerbeam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Hans Verkuil <hverkuil@kernel.org>,
	linux-staging@lists.linux.dev,
	imx@lists.linux.dev
Subject: [PATCH 0/3] media: Use v4l2_event_subdev_unsubscribe() in more drivers
Date: Sat,  2 Aug 2025 00:19:30 +0300
Message-ID: <20250801211933.22553-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

This small patch series contains drive-by cleanups for the omap3isp,
atomisp and imx media drivers. I noticed that all those drivers
implemented custom subdev .unsubscribe_event() handlers, for those
handlers to perform exactly the same operation as
v4l2_event_subdev_unsubscribe(). The series replaces them with direct
usage of the v4l2_event_subdev_unsubscribe() function.

Laurent Pinchart (3):
  media: omap3isp: Drop custom .unsubscribe_event() handler
  media: staging: atomisp: Drop custom .unsubscribe_event() handler
  media: staging: imx: Drop custom .unsubscribe_event() handler

 drivers/media/platform/ti/omap3isp/ispccdc.c       | 8 +-------
 drivers/media/platform/ti/omap3isp/isph3a_aewb.c   | 2 +-
 drivers/media/platform/ti/omap3isp/isph3a_af.c     | 2 +-
 drivers/media/platform/ti/omap3isp/isphist.c       | 2 +-
 drivers/media/platform/ti/omap3isp/ispstat.c       | 7 -------
 drivers/media/platform/ti/omap3isp/ispstat.h       | 3 ---
 drivers/staging/media/atomisp/pci/atomisp_subdev.c | 9 +--------
 drivers/staging/media/imx/imx-media-csi.c          | 8 +-------
 8 files changed, 6 insertions(+), 35 deletions(-)


base-commit: d968e50b5c26642754492dea23cbd3592bde62d8
-- 
Regards,

Laurent Pinchart

