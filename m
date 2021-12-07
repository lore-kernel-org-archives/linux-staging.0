Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9EE72CB3
	for <linux-staging@lists.linux.dev>; Tue,  7 Dec 2021 21:05:53 +0000 (UTC)
Received: from 250.57.4.146.static.wline.lns.sme.cust.swisscom.ch ([146.4.57.250] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1muheh-00060K-Ah; Tue, 07 Dec 2021 22:05:43 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 0/3] staging: r8188eu: remove unused led1
Date: Tue,  7 Dec 2021 22:05:34 +0100
Message-Id: <20211207210537.23382-1-martin@kaiser.cx>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The r8188eu driver uses only led0. Remove code for led1.

Martin Kaiser (3):
  staging: r8188eu: remove SwLed1
  staging: r8188eu: remove code to set led1 registers
  staging: r8188eu: remove LedPin from struct struct LED_871x

 drivers/staging/r8188eu/core/rtw_led.c      |  3 +-
 drivers/staging/r8188eu/hal/rtl8188eu_led.c | 42 ++++-----------------
 drivers/staging/r8188eu/include/rtw_led.h   | 12 +-----
 3 files changed, 10 insertions(+), 47 deletions(-)

-- 
2.20.1

