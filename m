Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA31F7E
	for <linux-staging@lists.linux.dev>; Sun, 27 Mar 2022 18:10:06 +0000 (UTC)
Received: from dslb-178-004-173-219.178.004.pools.vodafone-ip.de ([178.4.173.219] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1nYXKt-00019B-AW; Sun, 27 Mar 2022 20:09:55 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	David Laight <David.Laight@ACULAB.COM>,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH v2 0/9] staging: r8188eu: use ieee80211 helpers for parsing
Date: Sun, 27 Mar 2022 20:09:35 +0200
Message-Id: <20220327180944.712545-1-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220323074859.177425-1-martin@kaiser.cx>
References: <20220323074859.177425-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update some of the code for parsing incoming messages to use
the ieee80211 helpers.

v2:
 - fix an endianness issue in the version check patch
 - add two more patches for validate_recv_frame, use a struct ieee80211_hdr
   instead of a frame control variable in this function

Martin Kaiser (9):
  staging: r8188eu: use ieee80211 define for version check
  staging: r8188eu: use ieee80211 helper to read the pwr bit
  staging: r8188eu: use standard mechanisms for control frames
  staging: r8188eu: use standard mechanisms for data frames
  staging: r8188eu: use standard mechanisms for qos data frames
  staging: r8188eu: remove unused data frame subtypes
  staging: r8188eu: remove unused control frame subtypes
  staging: r8188eu: use ieee80211 macro for sequence number
  staging: r8188eu: use ieee80211 define for fragment number

 drivers/staging/r8188eu/core/rtw_recv.c       | 40 +++++++++---------
 drivers/staging/r8188eu/core/rtw_xmit.c       |  6 +--
 drivers/staging/r8188eu/hal/rtl8188e_rxdesc.c |  3 +-
 drivers/staging/r8188eu/include/wifi.h        | 42 ++++---------------
 4 files changed, 32 insertions(+), 59 deletions(-)

-- 
2.30.2

