Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAEF7614B
	for <linux-staging@lists.linux.dev>; Tue, 22 Mar 2022 20:24:53 +0000 (UTC)
Received: from dslb-178-004-174-067.178.004.pools.vodafone-ip.de ([178.4.174.67] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1nWl3b-0006W7-IT; Tue, 22 Mar 2022 21:24:43 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 0/4] staging: r8188eu: simple mlme cleanups
Date: Tue, 22 Mar 2022 21:24:35 +0100
Message-Id: <20220322202439.157999-1-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

some simple cleanups in the mlme part of the driver

Martin Kaiser (4):
  staging: r8188eu: make _rtw_init_mlme_priv static
  staging: r8188eu: the MCS_rate_2R array is not used
  staging: r8188eu: remove empty rtw_dummy_event_callback
  staging: r8188eu: remove empty rtw_fwdbg_event_callback

 drivers/staging/r8188eu/core/rtw_mlme.c        | 11 +----------
 drivers/staging/r8188eu/core/rtw_mlme_ext.c    |  1 -
 drivers/staging/r8188eu/include/rtw_mlme.h     |  2 --
 drivers/staging/r8188eu/include/rtw_mlme_ext.h |  9 +++------
 4 files changed, 4 insertions(+), 19 deletions(-)

-- 
2.30.2

