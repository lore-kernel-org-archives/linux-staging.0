Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8F696D11
	for <linux-staging@lists.linux.dev>; Wed,  7 Apr 2021 10:23:53 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 03C92613ED;
	Wed,  7 Apr 2021 10:23:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1617791031;
	bh=qpCsjTuSvqBj16pRBp9HDujrrwWVzqQwHEGbNNWT7dU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jK+AmIK1Dv2RJ/LXd5R7XagSgI4aJvH1xN46Sca5hTnZOVukjQLBwKNJ2mybqjdh5
	 Q6+tgvinKjKfI+Rr+Q63ykfpkmyk+bz4g1SlNUHoStcxeC5DTA9rzVBl+J5eI/kk/4
	 5+qp9/u2ywoTEHQ0AIT61qZrzQeN1RF44xkkZxUCOyoKMXxQ/c8w9agzSb0LRizNOu
	 E5F2DFTDA3DKiDiimYADNaOsqtoN02yMI/qXCnzPTP8pZhSq0fBWKZtzqcdIlXJ4Jb
	 PEUPeX1lbNF+MnS0lFSDFLkMiTs/1XpgcN12OAwdeZaHhVN07LGoeZypp3BuB6zOvs
	 HK13zgKBl3ttQ==
Received: from johan by xi.lan with local (Exim 4.93.0.4)
	(envelope-from <johan@kernel.org>)
	id 1lU5Lb-0008Rf-Pp; Wed, 07 Apr 2021 12:23:43 +0200
From: Johan Hovold <johan@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jiri Slaby <jirislaby@kernel.org>,
	linux-staging@lists.linux.dev,
	greybus-dev@lists.linaro.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>,
	stable@vger.kernel.org
Subject: [PATCH 14/16] tty: mxser: fix TIOCSSERIAL permission check
Date: Wed,  7 Apr 2021 12:23:32 +0200
Message-Id: <20210407102334.32361-15-johan@kernel.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210407102334.32361-1-johan@kernel.org>
References: <20210407102334.32361-1-johan@kernel.org>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changing the port type and closing_wait parameter are privileged
operations so make sure to return -EPERM if a regular user tries to
change them.

Note that the closing_wait parameter would not actually have been
changed but the return value did not indicate that.

Cc: stable@vger.kernel.org
Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/tty/mxser.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/tty/mxser.c b/drivers/tty/mxser.c
index 914b23071961..2d8e76263a25 100644
--- a/drivers/tty/mxser.c
+++ b/drivers/tty/mxser.c
@@ -1270,6 +1270,7 @@ static int mxser_set_serial_info(struct tty_struct *tty,
 	if (!capable(CAP_SYS_ADMIN)) {
 		if ((ss->baud_base != info->baud_base) ||
 				(close_delay != info->port.close_delay) ||
+				(closing_wait != info->port.closing_wait) ||
 				((ss->flags & ~ASYNC_USR_MASK) != (info->port.flags & ~ASYNC_USR_MASK))) {
 			mutex_unlock(&port->mutex);
 			return -EPERM;
@@ -1296,11 +1297,11 @@ static int mxser_set_serial_info(struct tty_struct *tty,
 			baud = ss->baud_base / ss->custom_divisor;
 			tty_encode_baud_rate(tty, baud, baud);
 		}
-	}
 
-	info->type = ss->type;
+		info->type = ss->type;
 
-	process_txrx_fifo(info);
+		process_txrx_fifo(info);
+	}
 
 	if (tty_port_initialized(port)) {
 		if (flags != (port->flags & ASYNC_SPD_MASK)) {
-- 
2.26.3

