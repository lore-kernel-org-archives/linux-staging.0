Received: from h04.kommunity.net (h04.kommunity.net [138.201.86.160])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 662BB72
	for <linux-staging@lists.linux.dev>; Sun,  2 May 2021 21:08:59 +0000 (UTC)
Received: from notebook.fritz.box (p4fc26c70.dip0.t-ipconnect.de [79.194.108.112])
	by h04.kommunity.net (Postfix) with ESMTPSA id 9EF41F85628;
	Sun,  2 May 2021 23:08:56 +0200 (CEST)
Authentication-Results: h04.kommunity.net;
	spf=pass (sender IP is 79.194.108.112) smtp.mailfrom=alec@vc-celle.de smtp.helo=notebook.fritz.box
Received-SPF: pass (h04.kommunity.net: connection is authenticated)
From: Alexander Vorwerk <alec@vc-celle.de>
To: forest@alittletooquiet.net,
	gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Alexander Vorwerk <alec@vc-celle.de>
Subject: [PATCH 0/2] staging: vt6655: remove multiple assignments
Date: Sun,  2 May 2021 23:08:24 +0200
Message-Id: <20210502210826.10323-1-alec@vc-celle.de>
X-Mailer: git-send-email 2.17.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

These two patches fix two multiple assignments coding-style
issues reported by checkpatch.pl.

Alexander Vorwerk (2):
  staging: vt6655: remove multiple assignment
  staging: vt6655: remove multiple assignment

 drivers/staging/vt6655/device_main.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

-- 
2.17.1

