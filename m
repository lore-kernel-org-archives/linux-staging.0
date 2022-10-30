Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE6C58F4D
	for <linux-staging@lists.linux.dev>; Sun, 30 Oct 2022 17:33:50 +0000 (UTC)
Received: from ipservice-092-217-067-184.092.217.pools.vodafone-ip.de ([92.217.67.184] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1opCBn-000469-0L; Sun, 30 Oct 2022 18:33:39 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH v2 00/13] staging: r8188eu: clean up action frame handlers
Date: Sun, 30 Oct 2022 18:33:13 +0100
Message-Id: <20221030173326.1588647-1-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Clean up the handlers for action frames. Summarize common code, remove
unnecessary return values.

Please apply this on top of the "remove the last get_da calls" series.

Changes in v2
- remove on_action_public's ret variable in patch 3, not in patch 9

Martin Kaiser (13):
  staging: r8188eu: replace a GetAddr1Ptr call
  staging: r8188eu: remove duplicate category check
  staging: r8188eu: make on_action_public static void
  staging: r8188eu: make OnAction_back static void
  staging: r8188eu: make OnAction_p2p static void
  staging: r8188eu: remove category check in OnAction_p2p
  staging: r8188eu: replace switch-case with if
  staging: r8188eu: replace GetAddr1Ptr call in OnAction_p2p
  staging: r8188eu: clean up on_action_public
  staging: r8188eu: remove return value from on_action_public_vendor
  staging: r8188eu: remove return value from on_action_public_default
  staging: r8188eu: rtw_action_public_decache's token is a u8
  staging: r8188eu: check destination address in OnAction

 drivers/staging/r8188eu/core/rtw_mlme_ext.c   | 116 +++++-------------
 .../staging/r8188eu/include/rtw_mlme_ext.h    |   7 --
 2 files changed, 28 insertions(+), 95 deletions(-)

-- 
2.30.2

