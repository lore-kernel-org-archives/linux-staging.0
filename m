Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCFCE1C2B
	for <linux-staging@lists.linux.dev>; Fri,  2 Dec 2022 09:25:40 +0000 (UTC)
Received: from ipservice-092-217-087-074.092.217.pools.vodafone-ip.de ([92.217.87.74] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1p12IS-0001tn-Lr; Fri, 02 Dec 2022 10:25:28 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 0/2] staging: r8188eu: issue_probereq_p2p
Date: Fri,  2 Dec 2022 10:25:23 +0100
Message-Id: <20221202092525.403887-1-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Clean up the issue_probereq_p2p function.

Martin Kaiser (2):
  staging: r8188eu: merge two probereq_p2p functions
  staging: r8188eu: remove unused da parameter

 drivers/staging/r8188eu/core/rtw_mlme_ext.c   | 40 ++++++-------------
 drivers/staging/r8188eu/core/rtw_p2p.c        |  8 ++--
 .../staging/r8188eu/include/rtw_mlme_ext.h    |  2 +-
 3 files changed, 18 insertions(+), 32 deletions(-)

-- 
2.30.2

