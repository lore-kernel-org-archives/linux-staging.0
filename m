Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B91721FDA
	for <linux-staging@lists.linux.dev>; Sun,  3 Apr 2022 16:54:49 +0000 (UTC)
Received: from dslb-094-219-033-178.094.219.pools.vodafone-ip.de ([94.219.33.178] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1nb3Uz-0008D7-Ir; Sun, 03 Apr 2022 18:54:45 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 00/11] staging: r8188eu: clean up validate_recv_data_frame
Date: Sun,  3 Apr 2022 18:54:27 +0200
Message-Id: <20220403165438.357728-1-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use ieee80211 helpers, remove temporary variables, simplify the error
handling. Refactor the code for checking to_ds, from_ds.

Martin Kaiser (11):
  staging: r8188eu: use ieee80211 helper for source address
  staging: r8188eu: use ieee80211 helper for destination address
  staging: r8188eu: use ieee80211 helper for retry bit
  staging: r8188eu: simplify error handling
  staging: r8188eu: to_fr_ds cannot be 3 here
  staging: r8188eu: don't copy ra and ta before we fail
  staging: r8188eu: remove to_fr_ds from struct rx_pkt_attrib
  staging: r8188eu: ra and ta do not depend on to_ds, from_ds
  staging: r8188eu: remove psa, pda
  staging: r8188eu: don't call get_hdr_bssid
  staging: r8188eu: remove the bretry variable

 drivers/staging/r8188eu/core/rtw_recv.c    | 84 +++++++---------------
 drivers/staging/r8188eu/include/rtw_recv.h |  1 -
 drivers/staging/r8188eu/include/wifi.h     |  2 -
 3 files changed, 26 insertions(+), 61 deletions(-)

-- 
2.30.2

