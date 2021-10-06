Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 380742C81
	for <linux-staging@lists.linux.dev>; Wed,  6 Oct 2021 09:10:14 +0000 (UTC)
Received: from pd956d63d.dip0.t-ipconnect.de ([217.86.214.61] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1mY2wD-0006je-Nc; Wed, 06 Oct 2021 11:10:09 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 0/3] staging: r8188eu: clean up PatchID / customer id
Date: Wed,  6 Oct 2021 11:09:46 +0200
Message-Id: <20211006090949.1694-1-martin@kaiser.cx>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series should be applied on top of the series I sent yesterday
(starting with Message-Id: <20211005200821.19783-1-martin@kaiser.cx>)

Thanks,
Martin

Martin Kaiser (3):
  staging: r8188eu: hal data's customer id is always 0
  staging: r8188eu: Odm PatchID is always 0
  staging: r8188eu: merge two signal scale mapping functions

 drivers/staging/r8188eu/hal/odm.c             |  7 --
 drivers/staging/r8188eu/hal/odm_HWConfig.c    | 65 +++++--------------
 drivers/staging/r8188eu/hal/rtl8188e_dm.c     |  1 -
 drivers/staging/r8188eu/hal/usb_halinit.c     |  2 +-
 drivers/staging/r8188eu/include/odm.h         |  2 -
 .../staging/r8188eu/include/rtl8188e_hal.h    |  2 -
 drivers/staging/r8188eu/include/rtw_eeprom.h  | 55 ----------------
 7 files changed, 19 insertions(+), 115 deletions(-)

-- 
2.20.1

