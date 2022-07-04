Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D16854A0A
	for <linux-staging@lists.linux.dev>; Mon,  4 Jul 2022 20:17:09 +0000 (UTC)
Received: from dslb-178-004-207-027.178.004.pools.vodafone-ip.de ([178.4.207.27] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1o8SVE-00007Y-LF; Mon, 04 Jul 2022 22:17:04 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 0/6] staging: r8188eu: clean up ap2sta_data_frame
Date: Mon,  4 Jul 2022 22:16:48 +0200
Message-Id: <20220704201654.195574-1-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Start cleaning up ap2sta_data_frame. Remove duplicate assignments, use an
ieee80211 helper in one place.

Martin Kaiser (6):
  staging: r8188eu: set bssid only once
  staging: r8188eu: don't set pattrib->dst again
  staging: r8188eu: don't set pattrib->ra again
  staging: r8188eu: don't set pattrib->ta again
  staging: r8188eu: remove a misleading comment
  staging: r8188eu: use ieee80211 helper to check for nullfunc frame

 drivers/staging/r8188eu/core/rtw_recv.c | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

-- 
2.30.2

