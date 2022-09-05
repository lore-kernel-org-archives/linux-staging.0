Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C45763239
	for <linux-staging@lists.linux.dev>; Mon,  5 Sep 2022 20:02:03 +0000 (UTC)
Received: from dslb-178-004-201-030.178.004.pools.vodafone-ip.de ([178.4.201.30] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1oVIIB-00063M-OQ; Mon, 05 Sep 2022 22:01:59 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 0/7] staging: r8188eu: continue rtw_led_control cleanup
Date: Mon,  5 Sep 2022 22:01:39 +0200
Message-Id: <20220905200146.82259-1-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Here's some more small patches to make rtw_led_control simpler.

Martin Kaiser (7):
  staging: r8188eu: simplify the LED_CTL_POWER_OFF case
  staging: r8188eu: don't restart WPS blinking unnecessarily
  staging: r8188eu: always cancel blink_work before WPS blinking
  staging: r8188eu: always update status before WPS blinking
  staging: r8188eu: always cancel blink_work when WPS failed
  staging: r8188eu: reset blink state when WPS fails
  staging: r8188eu: do not "scan blink" if we have a link

 drivers/staging/r8188eu/core/rtw_led.c | 80 +++++++++-----------------
 1 file changed, 28 insertions(+), 52 deletions(-)

-- 
2.30.2

