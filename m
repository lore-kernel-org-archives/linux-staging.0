Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E95AE2FAE
	for <linux-staging@lists.linux.dev>; Sun, 26 Sep 2021 13:16:11 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4059961019;
	Sun, 26 Sep 2021 13:16:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1632662171;
	bh=UnFUQ3tDK4fMjGQnliWHdJvioYz9mkiO6swcBnoVrdA=;
	h=Subject:To:Cc:From:Date:From;
	b=Xd5E7Kk3CulKQ+dMGC5/MwxdTC039xMbSVO59e3fCN+ataF1K5UHO8GWDDUjpO38G
	 22eLHorJrwYYfiiJ7knvtlV2QJO3LMl9/cD2QpETcCNVSpz3s/40TZYItTdMjZx8Ro
	 4ApJ5qGPcSvxt6sc41sSnjxZkqLrD37wYPVQDicI=
Subject: Patch "comedi: Fix memory leak in compat_insnlist()" has been added to the 5.14-stable tree
To: abbotti@mev.co.uk,gregkh@linuxfoundation.org,linux-staging@lists.linux.dev,viro@zeniv.linux.org.uk
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Sun, 26 Sep 2021 15:15:48 +0200
Message-ID: <1632662148153142@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore 


This is a note to let you know that I've just added the patch titled

    comedi: Fix memory leak in compat_insnlist()

to the 5.14-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     comedi-fix-memory-leak-in-compat_insnlist.patch
and it can be found in the queue-5.14 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From bb509a6ffed2c8b0950f637ab5779aa818ed1596 Mon Sep 17 00:00:00 2001
From: Ian Abbott <abbotti@mev.co.uk>
Date: Thu, 16 Sep 2021 15:50:23 +0100
Subject: comedi: Fix memory leak in compat_insnlist()

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
 drivers/comedi/comedi_fops.c |    1 +
 1 file changed, 1 insertion(+)

--- a/drivers/comedi/comedi_fops.c
+++ b/drivers/comedi/comedi_fops.c
@@ -3090,6 +3090,7 @@ static int compat_insnlist(struct file *
 	mutex_lock(&dev->mutex);
 	rc = do_insnlist_ioctl(dev, insns, insnlist32.n_insns, file);
 	mutex_unlock(&dev->mutex);
+	kfree(insns);
 	return rc;
 }
 


Patches currently in stable-queue which might be from abbotti@mev.co.uk are

queue-5.14/comedi-fix-memory-leak-in-compat_insnlist.patch
