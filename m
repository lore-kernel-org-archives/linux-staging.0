Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DA3A7F
	for <linux-staging@lists.linux.dev>; Sun, 11 Sep 2022 14:51:39 +0000 (UTC)
Received: from ipservice-092-217-076-063.092.217.pools.vodafone-ip.de ([92.217.76.63] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1oXOJ4-000829-TK; Sun, 11 Sep 2022 16:51:34 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 0/9] staging: r8188eu: more led cleanups
Date: Sun, 11 Sep 2022 16:51:13 +0200
Message-Id: <20220911145122.15444-1-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Clean up the init code for some of the blink commands.

Martin Kaiser (9):
  staging: r8188eu: simplify the code to prevent scan blinking restart
  staging: r8188eu: cancel blink_work before scan blinking
  staging: r8188eu: update status before scan blinking
  staging: r8188eu: simplify the code to prevent tx/rx blinking restart
  staging: r8188eu: cancel blink_work before tx/rx blinking
  staging: r8188eu: update status before scan blinking
  staging: r8188eu: simplify the code to prevent link blinking restart
  staging: r8188eu: cancel blink_work before link blinking
  staging: r8188eu: update status before link blinking

 drivers/staging/r8188eu/core/rtw_led.c | 120 ++++++++++++-------------
 1 file changed, 57 insertions(+), 63 deletions(-)

-- 
2.30.2

