Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56BE22FAF
	for <linux-staging@lists.linux.dev>; Mon, 27 Sep 2021 17:07:42 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 53F4C61356;
	Mon, 27 Sep 2021 17:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1632762461;
	bh=Bmn8bSktzQgWEoEGlaZkLZhVLVDbLwW0y7quV/rv3ZM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LkYMAGLfBIYS8bsgR1zA3BjRiyWASsWodrm4M7VPzIxSQK/RO/BSCqo0Pe/SLz7Ds
	 jpEt0R4RFWIkHL1Rf4VUwVzc76ByrMsDxv0ijsNzhZuFD7e3ooDbdTgxzfw+5jAdoQ
	 883ixK0ekqmyXWfEGfcgZcLrKygZcwKbbBrnMMWE=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	stable@vger.kernel.org,
	Al Viro <viro@zeniv.linux.org.uk>,
	linux-staging@lists.linux.dev,
	Ian Abbott <abbotti@mev.co.uk>
Subject: [PATCH 5.10 032/103] comedi: Fix memory leak in compat_insnlist()
Date: Mon, 27 Sep 2021 19:02:04 +0200
Message-Id: <20210927170226.851357259@linuxfoundation.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210927170225.702078779@linuxfoundation.org>
References: <20210927170225.702078779@linuxfoundation.org>
User-Agent: quilt/0.66
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Ian Abbott <abbotti@mev.co.uk>

commit bb509a6ffed2c8b0950f637ab5779aa818ed1596 upstream.

`compat_insnlist()` handles the 32-bit version of the `COMEDI_INSNLIST`
ioctl (whenwhen `CONFIG_COMPAT` is enabled).  It allocates memory to
temporarily hold an array of `struct comedi_insn` converted from the
32-bit version in user space.  This memory is only being freed if there
is a fault while filling the array, otherwise it is leaked.

Add a call to `kfree()` to fix the leak.

Fixes: b8d47d881305 ("comedi: get rid of compat_alloc_user_space() mess in COMEDI_INSNLIST compat")
Cc: Al Viro <viro@zeniv.linux.org.uk>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev
Cc: <stable@vger.kernel.org> # 5.13+
Signed-off-by: Ian Abbott <abbotti@mev.co.uk>
Link: https://lore.kernel.org/r/20210916145023.157479-1-abbotti@mev.co.uk
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/staging/comedi/comedi_fops.c |    1 +
 1 file changed, 1 insertion(+)

--- a/drivers/staging/comedi/comedi_fops.c
+++ b/drivers/staging/comedi/comedi_fops.c
@@ -3090,6 +3090,7 @@ static int compat_insnlist(struct file *
 	mutex_lock(&dev->mutex);
 	rc = do_insnlist_ioctl(dev, insns, insnlist32.n_insns, file);
 	mutex_unlock(&dev->mutex);
+	kfree(insns);
 	return rc;
 }
 


