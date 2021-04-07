Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6785A6D17
	for <linux-staging@lists.linux.dev>; Wed,  7 Apr 2021 10:23:53 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id C3C75613E5;
	Wed,  7 Apr 2021 10:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1617791030;
	bh=cHqlYiKXcQ0IRBnlkm7PVPRmIEJqyFZ75CoubzOdkus=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=n/e/91i4ieF7qae6funTAxgp+x3b3TyXvmNyPwSAdoeZcKKUsAFXJ5jXSlXlWvD+V
	 tkSPUmiAXxSkOuLuoSHLebnq4l12N+8gEJYYm4ERuRoiei1cmy9REQhBWDh4EseBbl
	 ZGW8n3lxZQR36ovk0EEHn6mfnUbFvTqUM8ug2Gtqysi8Fa9oYqRwQVzaC2L+HP5OM/
	 JFWy5KUMDrg6mfcP4LlxMriJFzYszs2kG6ezieY0yeta1rIGx0ZJLimTYmLMVpRfv6
	 GwxPmlZLyq60Zy4j3S7V40UWA/PlK0zhjfmzR9ZvnOCtOXMJGUxE2tt2cOp5kH2w7+
	 /tQrbD7wQkRRQ==
Received: from johan by xi.lan with local (Exim 4.93.0.4)
	(envelope-from <johan@kernel.org>)
	id 1lU5Lb-0008RW-Gp; Wed, 07 Apr 2021 12:23:43 +0200
From: Johan Hovold <johan@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jiri Slaby <jirislaby@kernel.org>,
	linux-staging@lists.linux.dev,
	greybus-dev@lists.linaro.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>,
	stable@vger.kernel.org
Subject: [PATCH 11/16] tty: moxa: fix TIOCSSERIAL permission check
Date: Wed,  7 Apr 2021 12:23:29 +0200
Message-Id: <20210407102334.32361-12-johan@kernel.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210407102334.32361-1-johan@kernel.org>
References: <20210407102334.32361-1-johan@kernel.org>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changing the port close delay or type are privileged operations so make
sure to return -EPERM if a regular user tries to change them.

Cc: stable@vger.kernel.org
Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/tty/moxa.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/tty/moxa.c b/drivers/tty/moxa.c
index 5b7bc7af8b1e..63e440d900ff 100644
--- a/drivers/tty/moxa.c
+++ b/drivers/tty/moxa.c
@@ -2048,6 +2048,7 @@ static int moxa_set_serial_info(struct tty_struct *tty,
 		struct serial_struct *ss)
 {
 	struct moxa_port *info = tty->driver_data;
+	unsigned int close_delay;
 
 	if (tty->index == MAX_PORTS)
 		return -EINVAL;
@@ -2059,19 +2060,24 @@ static int moxa_set_serial_info(struct tty_struct *tty,
 			ss->baud_base != 921600)
 		return -EPERM;
 
+	close_delay = msecs_to_jiffies(ss->close_delay * 10);
+
 	mutex_lock(&info->port.mutex);
 	if (!capable(CAP_SYS_ADMIN)) {
-		if (((ss->flags & ~ASYNC_USR_MASK) !=
+		if (close_delay != info->port.close_delay ||
+		    ss->type != info->type ||
+		    ((ss->flags & ~ASYNC_USR_MASK) !=
 		     (info->port.flags & ~ASYNC_USR_MASK))) {
 			mutex_unlock(&info->port.mutex);
 			return -EPERM;
 		}
-	}
-	info->port.close_delay = msecs_to_jiffies(ss->close_delay * 10);
+	} else {
+		info->port.close_delay = close_delay;
 
-	MoxaSetFifo(info, ss->type == PORT_16550A);
+		MoxaSetFifo(info, ss->type == PORT_16550A);
 
-	info->type = ss->type;
+		info->type = ss->type;
+	}
 	mutex_unlock(&info->port.mutex);
 	return 0;
 }
-- 
2.26.3

