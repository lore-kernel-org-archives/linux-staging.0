Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D75E2F2F
	for <linux-staging@lists.linux.dev>; Tue, 10 Jan 2023 20:56:43 +0000 (UTC)
Received: from dslb-178-004-206-224.178.004.pools.vodafone-ip.de ([178.4.206.224] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1pFLfg-0001pw-Vx; Tue, 10 Jan 2023 21:56:37 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 0/4] staging: r8188eu: clean up usb_write_port_complete
Date: Tue, 10 Jan 2023 21:56:22 +0100
Message-Id: <20230110205626.183516-1-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Clean up and simplify the usb_write_port_complete callback function. Yet
again, this is based on the previous patches I submitted.

Martin Kaiser (4):
  staging: r8188eu: refactor status handling in usb_write_port_complete
  staging: r8188eu: reformat usb_write_port_complete
  staging: r8188eu: remove unused function parameter
  staging: r8188eu: always process urb status

 .../staging/r8188eu/include/usb_ops_linux.h   |  2 -
 .../staging/r8188eu/os_dep/usb_ops_linux.c    | 46 ++++++++-----------
 2 files changed, 18 insertions(+), 30 deletions(-)

-- 
2.30.2

