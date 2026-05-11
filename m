Received: from forward103a.mail.yandex.net (forward103a.mail.yandex.net [178.154.239.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFE5F2EBBA4
	for <linux-staging@lists.linux.dev>; Mon, 11 May 2026 19:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.86
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778527959; cv=none; b=vFkEzGH8tbZ0Upzei1dQE5G7VVWROTH66DeennKTlYMywtUl2JDqvK6FtFIoj07yhaJoEo3a///GA8fu05ERwT/FDJg/KaKKo/kSfxVMWEDgYSru1zhS0sqQkoo+9k1mX4FuKDa5Z1Su7srxvLtgKGxWwuR0tAlkd0fLPK0c1Ng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778527959; c=relaxed/simple;
	bh=8fdBCbSnUqBhjbTn9UOWJoQwuXgVe/OWWz35TXe/r+k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=H6bl2OUjNYDQEoZtGL7uccIB9LWf35rQQijP40a2Jl6FZz7W2ljJRrnXydPiMeS9aVxhV734lN48FT0+tsYdjPKO0vei0sjVkZnRmjpyi2wvikveujBggEwcCN8TRIND6wH0sc/uJzCDvAmNiofBw6+PXO4ULL5iCDme/RSAXY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=noirlang.tr; spf=pass smtp.mailfrom=noirlang.tr; dkim=pass (1024-bit key) header.d=noirlang.tr header.i=@noirlang.tr header.b=wJSWrZfC; arc=none smtp.client-ip=178.154.239.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=noirlang.tr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=noirlang.tr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=noirlang.tr header.i=@noirlang.tr header.b="wJSWrZfC"
Received: from mail-nwsmtp-smtp-production-main-94.vla.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-94.vla.yp-c.yandex.net [IPv6:2a02:6b8:c15:290e:0:640:f317:0])
	by forward103a.mail.yandex.net (Yandex) with ESMTPS id 12D7F80549;
	Mon, 11 May 2026 22:32:28 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-94.vla.yp-c.yandex.net (smtp) with ESMTPSA id MWPPbLwRCOs0-UptC5NAt;
	Mon, 11 May 2026 22:32:27 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=noirlang.tr; s=mail;
	t=1778527947; bh=54dvJyhuyWvLVSda8b3M+wY9FY7C0JLI3aCVMez42Ek=;
	h=Message-ID:Date:Cc:Subject:To:From;
	b=wJSWrZfCXh+BiSbSpXRK5YKUI0BcmxaYCM6Rv0HvjkPYqJP6FBkbV85+ncgF3wav0
	 2Uu7ppzSGcDjt7G6hk5OveSLmCiEyjPx9aBzHzXy5d+FalNspVO3O2LtBmzurn4TsP
	 qmm9QysF4+/P14bWwWpzt55CWazYYKQdwX+KHPB4=
Authentication-Results: mail-nwsmtp-smtp-production-main-94.vla.yp-c.yandex.net; dkim=pass header.i=@noirlang.tr
From: Melih Emik <melihemik@noirlang.tr>
To: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Melih Emik <melihemik@noirlang.tr>
Subject: [PATCH] atomisp: remove unused module parameter dbg_func
Date: Mon, 11 May 2026 22:32:22 +0300
Message-ID: <20260511193222.49582-1-melihemik@noirlang.tr>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

atomisp_v4l2.c declared dbg_func as a module parameter to expose the
CSS debug print switch at module load time.

dbg_func remains as internal state for the CSS print environment, but
no code depends on the module parameter registration. After this removal,
git grep only finds the internal variable users and no module_param() or
MODULE_PARM_DESC() entry for dbg_func.

Remove the obsolete parameter while leaving the existing default debug
print state unchanged.

Signed-off-by: Melih Emik <melihemik@noirlang.tr>
---
 drivers/staging/media/atomisp/pci/atomisp_v4l2.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
index 900a67552d6a..2d19582ee7c5 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
@@ -50,9 +50,6 @@ MODULE_PARM_DESC(dbg_level, "debug message level (default:0)");
 
 /* log function switch */
 int dbg_func = 1;
-module_param(dbg_func, int, 0644);
-MODULE_PARM_DESC(dbg_func,
-		 "log function switch non/printk (default:printk)");
 
 /*
  * Set to 16x16 since this is the amount of lines and pixels the sensor
-- 
2.54.0

