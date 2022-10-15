Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B90C220E0
	for <linux-staging@lists.linux.dev>; Sat, 15 Oct 2022 15:29:39 +0000 (UTC)
Received: from ipservice-092-217-066-135.092.217.pools.vodafone-ip.de ([92.217.66.135] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1ojios-0006sp-LB; Sat, 15 Oct 2022 17:11:22 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 00/10] staging: r8188eu: led layer fix and cleanups
Date: Sat, 15 Oct 2022 17:11:05 +0200
Message-Id: <20221015151115.232095-1-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Here's another series to clean up the led layer and fix a problem with
leds during suspend/resume on some devices.

Martin Kaiser (10):
  staging: r8188eu: fix led register settings
  staging: r8188eu: handle rtw_write8 errors in SwLedOn
  staging: r8188eu: fix status updates in SwLedOff
  staging: r8188eu: SwLedOn needs no padapter parameter
  staging: r8188eu: SwLedOff needs no padapter parameter
  staging: r8188eu: remove two unused defines
  staging: r8188eu: don't include rtw_led.h from rtw_cmd.h
  staging: r8188eu: remove padapter from struct led_priv
  staging: r8188eu: set two more state variables
  staging: r8188eu: summarize tx/rx and scan blinking

 drivers/staging/r8188eu/core/rtw_led.c    | 62 +++++++----------------
 drivers/staging/r8188eu/include/rtw_cmd.h |  5 --
 drivers/staging/r8188eu/include/rtw_led.h |  2 -
 3 files changed, 18 insertions(+), 51 deletions(-)

-- 
2.30.2

