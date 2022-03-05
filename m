Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AF711395
	for <linux-staging@lists.linux.dev>; Sat,  5 Mar 2022 14:41:40 +0000 (UTC)
Received: from dslb-084-059-247-134.084.059.pools.vodafone-ip.de ([84.59.247.134] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1nQVbD-0007ms-Gr; Sat, 05 Mar 2022 15:41:35 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 0/5] staging: r8188eu: clean up update_recvframe_attrib_88e
Date: Sat,  5 Mar 2022 15:41:12 +0100
Message-Id: <20220305144117.1380534-1-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This set cleans up the update_recvframe_attrib_88e function.

Martin Kaiser (5):
  staging: r8188eu: remove tmp variable in update_recvframe_attrib_88e
  staging: r8188eu: summarize declaration and assignment
  staging: r8188eu: don't initialize drvinfo_sz to 0
  staging: r8188eu: remove unnecessary casts
  staging: r8188eu: remove comments in update_recvframe_attrib_88e

 drivers/staging/r8188eu/hal/rtl8188e_rxdesc.c | 72 ++++++++-----------
 1 file changed, 28 insertions(+), 44 deletions(-)

-- 
2.30.2

