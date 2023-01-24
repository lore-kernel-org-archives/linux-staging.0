Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4600F8F65
	for <linux-staging@lists.linux.dev>; Tue, 24 Jan 2023 21:01:37 +0000 (UTC)
Received: from dslb-188-096-139-204.188.096.pools.vodafone-ip.de ([188.96.139.204] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1pKQPz-0001xR-RT; Tue, 24 Jan 2023 22:01:23 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 0/4] staging: r8188eu: clean up usb transfers
Date: Tue, 24 Jan 2023 22:01:04 +0100
Message-Id: <20230124210108.62170-1-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series cleans up some defines related to usb transfers. It's based on
the series I sent yesterday.

Martin Kaiser (4):
  staging: r8188eu: usb_read_port_complete needs no regs parameter
  staging: r8188eu: remove defines that strip regs parameter
  staging: r8188eu: remove unused defines
  staging: r8188eu: remove usb_ops_linux.h

 drivers/staging/r8188eu/hal/usb_ops_linux.c   |  6 ++++-
 drivers/staging/r8188eu/include/usb_ops.h     |  2 --
 .../staging/r8188eu/include/usb_ops_linux.h   | 27 -------------------
 .../staging/r8188eu/os_dep/usb_ops_linux.c    |  1 -
 4 files changed, 5 insertions(+), 31 deletions(-)
 delete mode 100644 drivers/staging/r8188eu/include/usb_ops_linux.h

-- 
2.30.2

