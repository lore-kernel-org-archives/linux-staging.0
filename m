Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69C724A32
	for <linux-staging@lists.linux.dev>; Mon, 22 Aug 2022 20:29:43 +0000 (UTC)
Received: from dslb-188-096-142-076.188.096.pools.vodafone-ip.de ([188.96.142.76] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1oQDnn-0000pA-SX; Mon, 22 Aug 2022 22:13:39 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 0/3] staging: r8188eu: start cleaning up led blinking
Date: Mon, 22 Aug 2022 22:13:26 +0200
Message-Id: <20220822201329.95559-1-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The code for led blinking contains too many states and state variables.
This series is a first tiny step towards cleaning things up.

Martin Kaiser (3):
  staging: r8188eu: don't restart "no link" blinking unnecessarily
  staging: r8188eu: always cancel blink_work
  staging: r8188eu: always update the status variables

 drivers/staging/r8188eu/core/rtw_led.c | 36 ++++++++++++--------------
 1 file changed, 17 insertions(+), 19 deletions(-)

-- 
2.30.2

