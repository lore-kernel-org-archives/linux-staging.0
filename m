Received: from mail.draketalley.com (mail.draketalley.com [3.213.214.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA63828E7
	for <linux-staging@lists.linux.dev>; Mon, 31 Oct 2022 14:32:55 +0000 (UTC)
Received: from pop-os.lan (cpe-74-72-139-32.nyc.res.rr.com [74.72.139.32])
	by mail.draketalley.com (Postfix) with ESMTPSA id 030D355DBF;
	Mon, 31 Oct 2022 14:25:29 +0000 (UTC)
From: drake@draketalley.com
To: Manish Chopra <manishc@marvell.com>,
	GR-Linux-NIC-Dev@marvell.com,
	Coiby Xu <coiby.xu@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	netdev@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
	Drake Talley <drake@drake.talley.com>
Subject: [PATCH 0/3] cleanup style for staging qlge driver
Date: Mon, 31 Oct 2022 10:25:13 -0400
Message-Id: <20221031142516.266704-1-drake@draketalley.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Drake Talley <drake@drake.talley.com>

This patch series addresses a handful of reports from checkpatch from qlge_main.c


Thanks,
Drake

Drake Talley (3):
  staging: qlge: Separate multiple assignments
  staging: qlge: replace msleep with usleep_range
  staging: qlge: add comment explaining memory barrier

 drivers/staging/qlge/qlge_main.c | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

-- 
2.34.1

