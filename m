Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F39F722CBD3
	for <linux-staging@lists.linux.dev>; Mon,  4 Aug 2025 21:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754343705; cv=none; b=M+g7cn+mLc8ZURYUyv1m1ZupOb7dqFv1TvskO5loj4lQBC3lURuoqKYE2l9yQdma+OpWAl6BO7uKZjqwFH1p58e1ElaSFAC2bqiaapx3L2Vq8d5np1sMu3H58tGRc0xHuLbofKQabmXtKYMQeqkf8R0LkXoctFWTkvWeoNswl2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754343705; c=relaxed/simple;
	bh=PL7lo66XcnyBq2LGXtKUbohMx3PW5Q3nHhtN8novHSQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FPoKpF6kDWL94bWan3Jiz7D7DN8HGMykgiAcS3vQA/+nYFNp7ROu0SeSs+LWRX23YT+LQqPnSrRqUMVao3BHLXl/CgXyqVfHNLT/AJdlrBWoY6d49S9AHMVNGPwDadQoIBbPUX/Brc+KOOeYLYQkkYmZo5cvVWGw/w+l6aA46m8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Ri4QNRJv; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Ri4QNRJv"
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 464F89CE;
	Mon,  4 Aug 2025 23:40:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754343654;
	bh=PL7lo66XcnyBq2LGXtKUbohMx3PW5Q3nHhtN8novHSQ=;
	h=From:To:Cc:Subject:Date:From;
	b=Ri4QNRJveQwgzulfm7AYlUXQoEgIrf+wcCOyhjBkvuAQQ2sY31fjbXitR+IYAiqFd
	 Xq2IwPl8UtII/QfzvceDI8btMP6PxZY6MiSZklnZ2WfW7lYN/dcd6sXN6V42e3uYPk
	 AL4JOZulMzBSMRl10Lalnkd5/DgBzTv4aQWZMbSM=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
	linux-staging@lists.linux.dev
Subject: [PATCH 0/2] media: intel: Fix control event subscription in IPU6 and IPU7 ISYS drivers
Date: Tue,  5 Aug 2025 00:41:25 +0300
Message-ID: <20250804214127.22217-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

This small patch series fixes incorrect usage of control helpers meant
for video devices in the IPU6 and IPU7 ISYS drivers. Please see
individual patches for details.

Laurent Pinchart (2):
  media: ipu6: isys: Use v4l2_ctrl_subdev_subscribe_event()
  media: staging/ipu7: Use v4l2_ctrl_subdev_subscribe_event()

 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c | 2 +-
 drivers/staging/media/ipu7/ipu7-isys-csi2.c   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)


base-commit: d968e50b5c26642754492dea23cbd3592bde62d8
-- 
Regards,

Laurent Pinchart

