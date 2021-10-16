Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35A102C81
	for <linux-staging@lists.linux.dev>; Sat, 16 Oct 2021 17:36:06 +0000 (UTC)
Received: from ipservice-092-217-067-147.092.217.pools.vodafone-ip.de ([92.217.67.147] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1mbnbG-0006dq-1A; Sat, 16 Oct 2021 19:36:02 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 0/3] staging: r8188eu: clean up the Makefile
Date: Sat, 16 Oct 2021 19:35:41 +0200
Message-Id: <20211016173544.25376-1-martin@kaiser.cx>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Clean up the Makefile, make it similar to other drivers.

Please apply this after the "staging: r8188eu: remove CONFIG_BT_COEXIST"
series.

Martin Kaiser (3):
  staging: r8188eu: Makefile: remove unused driver config
  staging: r8188eu: Makefile: don't overwrite global settings
  staging: r8188eu: Makefile: use one file list

 drivers/staging/r8188eu/Makefile | 146 ++++++++++++-------------------
 1 file changed, 55 insertions(+), 91 deletions(-)

-- 
2.20.1

