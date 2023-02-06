Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0D566116
	for <linux-staging@lists.linux.dev>; Mon,  6 Feb 2023 21:01:37 +0000 (UTC)
Received: from ipservice-092-217-084-033.092.217.pools.vodafone-ip.de ([92.217.84.33] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1pP8cF-000876-Tc; Mon, 06 Feb 2023 22:01:31 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 0/3] simplify suspend/resume functions
Date: Mon,  6 Feb 2023 22:01:21 +0100
Message-Id: <20230206210124.150142-1-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Here's some simple cleanups for suspend + resume.

Martin Kaiser (3):
  staging: r8188eu: make ips_enter static
  staging: r8188eu: make ips_leave static
  staging: r8188eu: remove change_rfpwrstate

 drivers/staging/r8188eu/core/rtw_pwrctrl.c    | 23 ++++++++-----------
 drivers/staging/r8188eu/include/rtw_pwrctrl.h |  3 ---
 2 files changed, 10 insertions(+), 16 deletions(-)

-- 
2.30.2

