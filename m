Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A156624
	for <linux-staging@lists.linux.dev>; Mon, 25 Jul 2022 08:00:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0545C341CF;
	Mon, 25 Jul 2022 08:00:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658736001;
	bh=bEsGf8Dsd9YtmoSRkVmOvqodgZEJC62LZm2jA6Q/xow=;
	h=From:To:Cc:Subject:Date:From;
	b=FzftwkCl7SnTTxs7ziR8+GlhmXhTYRLjw8MG60JFbSOxSVYHKIEWmTL1Lrd7pEVx6
	 XY+rK5/IeU205W1/X+iFgdtlk0RjVUBM7O48vKhHJadogtic+UfXMJGVeC1aeXJ9Fn
	 5gshOdM2T/aW59n0FNbiNgVW5CysuMguTsjvlZuleVwdKE1l7ZuDD581tK5LP4kM7c
	 x7d/rqxMnGTObudVKOIksXZcXt9MOFUTyX0KAAMrB4MsppFC/pVFtlNR00W+2VNkHJ
	 hnxsFETOEEtYqJI10xl5MVfkt9z/6jFkIvA4im9KMYNSIOnTk8Ezkd7e2T3XPUp3Ir
	 NO1k9Brx/p6bw==
Received: from johan by xi.lan with local (Exim 4.94.2)
	(envelope-from <johan@kernel.org>)
	id 1oFt0d-0000Jz-4J; Mon, 25 Jul 2022 10:00:11 +0200
From: Johan Hovold <johan@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Oliver Neukum <oneukum@suse.com>,
	Felipe Balbi <balbi@kernel.org>
Cc: Yan Xinyu <sdlyyxy@bupt.edu.cn>,
	linux-staging@lists.linux.dev,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>
Subject: [PATCH 0/7] USB: cdc: add control and state defines
Date: Mon, 25 Jul 2022 09:58:34 +0200
Message-Id: <20220725075841.1187-1-johan@kernel.org>
X-Mailer: git-send-email 2.35.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Several drivers use the control-line and serial-state bitmap values from
the CDC spec, but there were no matching defines in the global CDC
(UAPI) header.

This series adds the missing defines and converts cdc-acm and f_acm to
use them.

One staging driver also had an unused set of CDC defines which are
removed.

The final patch by Yan Xinyu, which triggered this work, converts the
usb_wwan driver to use CDC defines instead of hardcoded values in its
line-control handling.

Greg, are you ok with me taking these through USB serial (where there
are a few more drivers that could potentially use them) or do you want
to take the lot through your tree directly?

Johan


Johan Hovold (6):
  USB: cdc: add control-signal defines
  USB: cdc: add serial-state defines
  USB: cdc-acm: use CDC control-line defines
  USB: cdc-acm: use CDC serial-state defines
  staging: gdm724x: drop unused CDC defines
  USB: gadget: f_acm: use CDC defines

Yan Xinyu (1):
  USB: serial: usb_wwan: replace DTR/RTS magic numbers with macros

 drivers/staging/gdm724x/gdm_tty.c   |  6 -----
 drivers/usb/class/cdc-acm.c         | 42 ++++++++++++++---------------
 drivers/usb/class/cdc-acm.h         | 20 --------------
 drivers/usb/gadget/function/f_acm.c | 20 ++++----------
 drivers/usb/serial/usb_wwan.c       | 10 ++++---
 include/uapi/linux/usb/cdc.h        | 13 +++++++++
 6 files changed, 45 insertions(+), 66 deletions(-)

-- 
2.35.1

