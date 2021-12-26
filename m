Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B269173
	for <linux-staging@lists.linux.dev>; Sun, 26 Dec 2021 21:25:49 +0000 (UTC)
Received: from dslb-188-097-047-111.188.097.pools.vodafone-ip.de ([188.97.47.111] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1n1b1T-0000qQ-T1; Sun, 26 Dec 2021 22:25:43 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 00/10] staging: r8188eu: clean up private ioctls
Date: Sun, 26 Dec 2021 22:25:25 +0100
Message-Id: <20211226212535.197989-1-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Clean up the definitions of private ioctls.
(Maybe it would make more sense to remove them completely?)

Martin Kaiser (10):
  staging: r8188eu: remove unused rtw_private_args entries
  staging: r8188eu: remove the private ioctl "get sensitivity"
  staging: r8188eu: remove the private drvext_hdl ioctl
  staging: r8188eu: remove the private ioctl "wps_prob_req_ie"
  staging: r8188eu: remove private ioctls that return -1
  staging: r8188eu: remove the private ioctl "wps_assoc_req_ie"
  staging: r8188eu: remove the private ioctl "tdls_get"
  staging: r8188eu: remove the private ioctl "tdls"
  staging: r8188eu: remove the private "test" ioctl
  staging: r8188eu: remove unused prototype

 drivers/staging/r8188eu/os_dep/ioctl_linux.c | 141 +------------------
 1 file changed, 7 insertions(+), 134 deletions(-)

-- 
2.30.2

