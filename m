Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 311CB2C9A
	for <linux-staging@lists.linux.dev>; Tue,  2 Nov 2021 08:55:43 +0000 (UTC)
Received: from 74.172.62.81.static.wline.lns.sme.cust.swisscom.ch ([81.62.172.74] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1mhp0Q-0007h9-JV; Tue, 02 Nov 2021 09:18:54 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 0/5] staging: r8188eu: remove odm wrappers to read/write bytes
Date: Tue,  2 Nov 2021 09:18:28 +0100
Message-Id: <20211102081833.18054-1-martin@kaiser.cx>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the odm wrapper functions to read or write bytes. Call the
underlying rtw functions directly.

Martin Kaiser (5):
  staging: r8188eu: remove ODM_Read1Byte
  staging: r8188eu: remove ODM_Read4Byte
  staging: r8188eu: remove ODM_Write1Byte
  staging: r8188eu: remove ODM_Write2Byte
  staging: r8188eu: remove ODM_Write4Byte

 .../r8188eu/hal/Hal8188ERateAdaptive.c        | 10 ++---
 drivers/staging/r8188eu/hal/HalPhyRf_8188e.c  | 43 ++++++++-----------
 drivers/staging/r8188eu/hal/odm.c             |  2 +-
 .../staging/r8188eu/hal/odm_RegConfig8188E.c  |  2 +-
 drivers/staging/r8188eu/hal/odm_interface.c   | 30 -------------
 .../staging/r8188eu/include/odm_interface.h   | 10 -----
 6 files changed, 26 insertions(+), 71 deletions(-)

-- 
2.20.1

