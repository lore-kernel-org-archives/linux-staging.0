Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1280D3D65
	for <linux-staging@lists.linux.dev>; Thu,  2 Jun 2022 19:56:45 +0000 (UTC)
Received: from ipservice-092-217-081-045.092.217.pools.vodafone-ip.de ([92.217.81.45] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1nwqdW-0003py-Ne; Thu, 02 Jun 2022 21:37:38 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 00/11] staging: r8188eu: continue the cleanup of issue_action_BA
Date: Thu,  2 Jun 2022 21:37:15 +0200
Message-Id: <20220602193726.280922-1-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Simplify the code to send the addba response and the delba message. Use
ieee80211 helpers if possible.

This series should be applied after the "start cleaning up
issue_action_BA" series.

Martin Kaiser (11):
  staging: r8188eu: use mgmt to set resp dialog token
  staging: r8188eu: use mgmt to set the addba resp status
  staging: r8188eu: use mgmt to set the addba resp timeout
  staging: r8188eu: use ieee80211 to set addba resp capabilities
  staging: r8188eu: calculate the addba response length
  staging: r8188eu: use mgmt to set the delba reason code
  staging: r8188eu: use mgmt to set delba params
  staging: r8188eu: clarify the contents of the delba params
  staging: r8188eu: calculate the delba length
  staging: r8188eu: remove the pframe variable
  staging: r8188eu: use u8, u16 in issue_action_BA prototype

 drivers/staging/r8188eu/core/rtw_mlme_ext.c   | 51 +++++++------------
 .../staging/r8188eu/include/rtw_mlme_ext.h    |  3 +-
 2 files changed, 18 insertions(+), 36 deletions(-)

-- 
2.30.2

