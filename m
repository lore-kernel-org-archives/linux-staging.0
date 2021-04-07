Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E00F36D12
	for <linux-staging@lists.linux.dev>; Wed,  7 Apr 2021 10:23:52 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 83935613CD;
	Wed,  7 Apr 2021 10:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1617791030;
	bh=aOiPbYy6/Ya3tIGwHa7GwZ9E/dBfsXM6G8A4jcFIg/s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QMoWO65jgBW2Pok69R3BKsbXuIrP21olYOQZOHASBR6UxawzxDMHRKdr31p/w9hfp
	 zO2LLm6V3dwgpSA8dYMj3b4+5QkugHofPnzlmDYip8SzxfYmFcbGmS7z12hFN7vV50
	 ZvSU+SmOsUyx6UP56WMYEqbQ87I20Tfi01OF41fP4swS17NrzoejFFjHmdKmSJBQCM
	 w4FGkLn96em5nzhGCruLSrJrk+8aB7Q9Uh/OycVTP2otygNq05PKouwXO2TxlI85ps
	 tn4I6+T4v/X6SorrSLTCXBmmV/dpa2gtd5Vkwo8Yj0olKSKWGk9bLYsqspqyJnaG0i
	 kXAHQDmeIuXPw==
Received: from johan by xi.lan with local (Exim 4.93.0.4)
	(envelope-from <johan@kernel.org>)
	id 1lU5Lb-0008RN-94; Wed, 07 Apr 2021 12:23:43 +0200
From: Johan Hovold <johan@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jiri Slaby <jirislaby@kernel.org>,
	linux-staging@lists.linux.dev,
	greybus-dev@lists.linaro.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>,
	stable@vger.kernel.org
Subject: [PATCH 08/16] tty: amiserial: fix TIOCSSERIAL permission check
Date: Wed,  7 Apr 2021 12:23:26 +0200
Message-Id: <20210407102334.32361-9-johan@kernel.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210407102334.32361-1-johan@kernel.org>
References: <20210407102334.32361-1-johan@kernel.org>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changing the port closing_wait parameter is a privileged operation.

Add the missing check to TIOCSSERIAL so that -EPERM is returned in case
an unprivileged user tries to change the closing-wait setting.

Cc: stable@vger.kernel.org
Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/tty/amiserial.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/tty/amiserial.c b/drivers/tty/amiserial.c
index 0c8157fab17f..ec6802ba2bf8 100644
--- a/drivers/tty/amiserial.c
+++ b/drivers/tty/amiserial.c
@@ -970,6 +970,7 @@ static int set_serial_info(struct tty_struct *tty, struct serial_struct *ss)
 	if (!serial_isroot()) {
 		if ((ss->baud_base != state->baud_base) ||
 		    (ss->close_delay != port->close_delay) ||
+		    (ss->closing_wait != port->closing_wait) ||
 		    (ss->xmit_fifo_size != state->xmit_fifo_size) ||
 		    ((ss->flags & ~ASYNC_USR_MASK) !=
 		     (port->flags & ~ASYNC_USR_MASK))) {
-- 
2.26.3

