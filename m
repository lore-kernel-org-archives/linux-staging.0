Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15FB9443D
	for <linux-staging@lists.linux.dev>; Mon, 31 Oct 2022 20:54:54 +0000 (UTC)
Received: from dslb-084-059-234-234.084.059.pools.vodafone-ip.de ([84.59.234.234] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1opbo3-0006z9-2w; Mon, 31 Oct 2022 21:54:51 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 0/3] staging: r8188eu: clean up update_recvframe_phyinfo_88e
Date: Mon, 31 Oct 2022 21:54:09 +0100
Message-Id: <20221031205412.124871-1-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Here's three simple cleanups in the update_recvframe_phyinfo_88e function.

Martin Kaiser (3):
  staging: r8188eu: use ether_addr_equal for address comparison
  staging: r8188eu: use hdr->frame_control instead of fc
  staging: r8188eu: use ieee80211_get_SA

 drivers/staging/r8188eu/hal/rtl8188e_rxdesc.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

-- 
2.30.2

