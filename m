Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 270323FC3
	for <linux-staging@lists.linux.dev>; Fri, 10 Sep 2021 20:22:13 +0000 (UTC)
Received: from ipservice-092-217-077-211.092.217.pools.vodafone-ip.de ([92.217.77.211] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1mOn2B-0005Wm-Qf; Fri, 10 Sep 2021 22:22:03 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 0/4] remove unused usb endpoint functions
Date: Fri, 10 Sep 2021 22:21:47 +0200
Message-Id: <20210910202151.4007-1-martin@kaiser.cx>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove driver-specific functions to detect the type and direction of a
usb endpoint. Their callers have already been updated to use the helper
functions from the usb core.

Martin Kaiser (4):
  staging: r8188eu: remove unused function usb_endpoint_is_int
  staging: r8188eu: remove unused function RT_usb_endpoint_is_bulk_in
  staging: r8188eu: remove unused function RT_usb_endpoint_num
  staging: r8188eu: remove the remaining usb endpoint functions

 drivers/staging/r8188eu/os_dep/usb_intf.c | 40 -----------------------
 1 file changed, 40 deletions(-)

-- 
2.20.1

