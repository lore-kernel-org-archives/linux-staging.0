Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 872912F34
	for <linux-staging@lists.linux.dev>; Fri, 30 Dec 2022 18:15:44 +0000 (UTC)
Received: from dslb-188-097-208-179.188.097.pools.vodafone-ip.de ([188.97.208.179] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1pBJZk-0004hN-M6; Fri, 30 Dec 2022 18:53:48 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 0/4] staging: r8188eu: merge public action functions
Date: Fri, 30 Dec 2022 18:53:22 +0100
Message-Id: <20221230175326.90617-1-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Merge the small helper functions that handle public action frames.

Martin Kaiser (4):
  staging: r8188eu: merge on_action_public_vendor into its caller
  staging: r8188eu: merge on_action_public_default into its only caller
  staging: r8188eu: remove intermediate pframe pointer
  staging: r8188eu: remove intermediate token variable

 drivers/staging/r8188eu/core/rtw_mlme_ext.c | 31 +++++----------------
 1 file changed, 7 insertions(+), 24 deletions(-)

-- 
2.30.2

