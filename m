Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8920862E
	for <linux-staging@lists.linux.dev>; Mon, 25 Jul 2022 08:00:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3164CC341D4;
	Mon, 25 Jul 2022 08:00:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658736001;
	bh=htGIi81EhWUDNiQ/aByjFq9q+tZ8eQTA0UOuG8tIDtE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=exP5EuW8jNwWGnNiR4WGtBGzStxIKSZJbIoTDBI3PTzOl6t3QUsed9F1MZiZTJbiY
	 VOzc5hFJrbinc+WUIGBEH2Da2ltE57J100ZWee+U6Tft/33lfxsnAx1zO95UjCCMrs
	 ZHCKPc0UgxQ+1to3Lr6z7aEia/4PPkoYQYx9Oq5lz7L3cyWF7y+sWyu0/XdtPPTVOE
	 6p2Bzk/obbsUtsEw3zhAmZsRaeXA3nHluw7Qn8IxNtBS3N1eplOkWbJxyo9qCUBy2F
	 qRkHxmPxRBgttk0u+T3Msivq3tGFfsH+qQvu6OiPwKKCvMFvYUGxj3W8tsLGPhfDuQ
	 lKw4HZXzKyzAQ==
Received: from johan by xi.lan with local (Exim 4.94.2)
	(envelope-from <johan@kernel.org>)
	id 1oFt0e-0000KB-8o; Mon, 25 Jul 2022 10:00:12 +0200
From: Johan Hovold <johan@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Oliver Neukum <oneukum@suse.com>,
	Felipe Balbi <balbi@kernel.org>
Cc: Yan Xinyu <sdlyyxy@bupt.edu.cn>,
	linux-staging@lists.linux.dev,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>
Subject: [PATCH 5/7] staging: gdm724x: drop unused CDC defines
Date: Mon, 25 Jul 2022 09:58:39 +0200
Message-Id: <20220725075841.1187-6-johan@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220725075841.1187-1-johan@kernel.org>
References: <20220725075841.1187-1-johan@kernel.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This driver has a copy of some of the CDC defines but which are
currently unused.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/staging/gdm724x/gdm_tty.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/staging/gdm724x/gdm_tty.c b/drivers/staging/gdm724x/gdm_tty.c
index 04df6f9f5403..cc6d80554c98 100644
--- a/drivers/staging/gdm724x/gdm_tty.c
+++ b/drivers/staging/gdm724x/gdm_tty.c
@@ -17,12 +17,6 @@
 #define GDM_TTY_MAJOR 0
 #define GDM_TTY_MINOR 32
 
-#define ACM_CTRL_DTR 0x01
-#define ACM_CTRL_RTS 0x02
-#define ACM_CTRL_DSR 0x02
-#define ACM_CTRL_RI  0x08
-#define ACM_CTRL_DCD 0x01
-
 #define WRITE_SIZE 2048
 
 #define MUX_TX_MAX_SIZE 2048
-- 
2.35.1

