Received: from smtp77.iad3a.emailsrvr.com (smtp77.iad3a.emailsrvr.com [173.203.187.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E52D62F80
	for <linux-staging@lists.linux.dev>; Thu, 16 Sep 2021 17:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mev.co.uk;
	s=20190130-41we5z8j; t=1631803835;
	bh=ARRShqYel/AFPgRIrMAGJ0CCJl0lX8sUyPk06CsbnLQ=;
	h=From:To:Subject:Date:From;
	b=JyZrHXC0EhhT0ccYrGDyFYJR0/Bi/a3uV1my7NtCphcVbS1xSN+RYJqXI0yMEQtAE
	 2kFZDioQBMkjuNCYIbnxWfdBzCUQwxC7GakCmif4sD4m6ihOqmVsCZhEbGUE+Vh1T+
	 2xpPf1HuwTmCZ0nNXy38FhjxbVasqQFLZQwBKZwo=
X-Auth-ID: abbotti@mev.co.uk
Received: by smtp2.relay.iad3a.emailsrvr.com (Authenticated sender: abbotti-AT-mev.co.uk) with ESMTPSA id 469B2282B;
	Thu, 16 Sep 2021 10:50:34 -0400 (EDT)
From: Ian Abbott <abbotti@mev.co.uk>
To: linux-kernel@vger.kernel.org
Cc: Ian Abbott <abbotti@mev.co.uk>,
	H Hartley Sweeten <hsweeten@visionengravers.com>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	stable@vger.kernel.org
Subject: [PATCH v2] comedi: Fix memory leak in compat_insnlist()
Date: Thu, 16 Sep 2021 15:50:23 +0100
Message-Id: <20210916145023.157479-1-abbotti@mev.co.uk>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210916144438.156858-1-abbotti@mev.co.uk>
References: <20210916144438.156858-1-abbotti@mev.co.uk>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Classification-ID: 6b5d46b7-08db-410e-b953-84ff91fa7dea-1-1

`compat_insnlist()` handles the 32-bit version of the `COMEDI_INSNLIST`
ioctl (whenwhen `CONFIG_COMPAT` is enabled).  It allocates memory to
temporarily hold an array of `struct comedi_insn` converted from the
32-bit version in user space.  This memory is only being freed if there
is a fault while filling the array, otherwise it is leaked.

Add a call to `kfree()` to fix the leak.

Fixes: b8d47d881305 ("comedi: get rid of compat_alloc_user_space() mess in COMEDI_INSNLIST compat"
Cc: Al Viro <viro@zeniv.linux.org.uk>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev
Cc: <stable@vger.kernel.org> # 5.13+
Signed-off-by: Ian Abbott <abbotti@mev.co.uk>
---
v2: Corrected typo in Greg's email address.

N.B. Also need patches for 5.8+ from before comedi moved out of staging.
---
 drivers/comedi/comedi_fops.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/comedi/comedi_fops.c b/drivers/comedi/comedi_fops.c
index df77b6bf5c64..763cea8418f8 100644
--- a/drivers/comedi/comedi_fops.c
+++ b/drivers/comedi/comedi_fops.c
@@ -3090,6 +3090,7 @@ static int compat_insnlist(struct file *file, unsigned long arg)
 	mutex_lock(&dev->mutex);
 	rc = do_insnlist_ioctl(dev, insns, insnlist32.n_insns, file);
 	mutex_unlock(&dev->mutex);
+	kfree(insns);
 	return rc;
 }
 
-- 
2.33.0

