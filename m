Received: from forwardcorp1d.mail.yandex.net (forwardcorp1d.mail.yandex.net [178.154.239.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8ABF288C27
	for <linux-staging@lists.linux.dev>; Wed, 29 Oct 2025 14:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761748180; cv=none; b=ikTHSMH/P6TuE2ts+54cE4YP1a2oMr7EYBMrfQ8Ai8X2EKcmT4rgs0pMrkO7SoF0rVu3h7cjHmCYxszdHJ58KoKvMftml1UsiWFxFiWRE8OF1fLYby5MzoMxlB6dPXAp5cKrpACKI6fwhrb6vg+URtdeQxH9kXZgrW5smQRHAAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761748180; c=relaxed/simple;
	bh=jg/ovLgz3EOXIEtZvkh+fveBNnZFlK45tsqBfD6gDeA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rTlWJ0jPR+D1DzreFgRANVlnb34fKN1WvApLw4aunkMKykKpmn9+mhnv/o+++Hz4K8OAhDS71EhtLDbn+L3Wv1C8SSQLdCSAZFkZKG0zBjmw66jvRJSjMILH08ADZw1fE0Kt/VPZsxTxjh6V2ijpyU+qW7EFTGw10GdGnOelM6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex-team.ru; spf=pass smtp.mailfrom=yandex-team.ru; dkim=pass (1024-bit key) header.d=yandex-team.ru header.i=@yandex-team.ru header.b=fcyk+sIB; arc=none smtp.client-ip=178.154.239.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex-team.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yandex-team.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yandex-team.ru header.i=@yandex-team.ru header.b="fcyk+sIB"
Received: from mail-nwsmtp-smtp-corp-main-68.klg.yp-c.yandex.net (mail-nwsmtp-smtp-corp-main-68.klg.yp-c.yandex.net [IPv6:2a02:6b8:c42:94a9:0:640:a3fa:0])
	by forwardcorp1d.mail.yandex.net (Yandex) with ESMTPS id E762580E53;
	Wed, 29 Oct 2025 17:27:43 +0300 (MSK)
Received: from i111667286.ld.yandex.ru (unknown [2a02:6bf:8080:1::1:14])
	by mail-nwsmtp-smtp-corp-main-68.klg.yp-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id dRfxG40FsqM0-u0JuPnWI;
	Wed, 29 Oct 2025 17:27:43 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
	s=default; t=1761748063;
	bh=tkNRNGM6QgcG/1RrtK8H4Mh+KSp8yIPTIxCraSSOdrA=;
	h=Message-ID:Date:Cc:Subject:To:From;
	b=fcyk+sIBHEkDaS+hVJlVITu6bwypJ6QRwNOpU3Br8RjjnUMfAX5D338jsLM6bvkAC
	 K7WQwbeIAb5/yLj84Ii7Pk086fGpq8TcV7WHYH8Ddmkv8MLKyuqnBraKpyMqwx5+4t
	 PcMiFqrXynKNwlQtECuTGvjCArg7Cyc3R1fV1Mls=
Authentication-Results: mail-nwsmtp-smtp-corp-main-68.klg.yp-c.yandex.net; dkim=pass header.i=@yandex-team.ru
From: Andrey Troshin <drtrosh@yandex-team.ru>
To: stable@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Andrey Troshin <drtrosh@yandex-team.ru>,
	Ian Abbott <abbotti@mev.co.uk>,
	H Hartley Sweeten <hsweeten@visionengravers.com>,
	Jens Axboe <axboe@kernel.dk>,
	Jann Horn <jannh@google.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org
Subject: [PATCH 5.10] comedi: Fix use of uninitialized memory in do_insn_ioctl() and do_insnlist_ioctl()
Date: Wed, 29 Oct 2025 17:27:39 +0300
Message-ID: <20251029142739.2108-1-drtrosh@yandex-team.ru>
X-Mailer: git-send-email 2.51.0.windows.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ian Abbott <abbotti@mev.co.uk>

commit 3cd212e895ca2d58963fdc6422502b10dd3966bb upstream.

syzbot reports a KMSAN kernel-infoleak in `do_insn_ioctl()`.  A kernel
buffer is allocated to hold `insn->n` samples (each of which is an
`unsigned int`).  For some instruction types, `insn->n` samples are
copied back to user-space, unless an error code is being returned.  The
problem is that not all the instruction handlers that need to return
data to userspace fill in the whole `insn->n` samples, so that there is
an information leak.  There is a similar syzbot report for
`do_insnlist_ioctl()`, although it does not have a reproducer for it at
the time of writing.

One culprit is `insn_rw_emulate_bits()` which is used as the handler for
`INSN_READ` or `INSN_WRITE` instructions for subdevices that do not have
a specific handler for that instruction, but do have an `INSN_BITS`
handler.  For `INSN_READ` it only fills in at most 1 sample, so if
`insn->n` is greater than 1, the remaining `insn->n - 1` samples copied
to userspace will be uninitialized kernel data.

Another culprit is `vm80xx_ai_insn_read()` in the "vm80xx" driver.  It
never returns an error, even if it fails to fill the buffer.

Fix it in `do_insn_ioctl()` and `do_insnlist_ioctl()` by making sure
that uninitialized parts of the allocated buffer are zeroed before
handling each instruction.

Thanks to Arnaud Lecomte for their fix to `do_insn_ioctl()`.  That fix
replaced the call to `kmalloc_array()` with `kcalloc()`, but it is not
always necessary to clear the whole buffer.

Fixes: ed9eccbe8970 ("Staging: add comedi core")
Reported-by: syzbot+a5e45f768aab5892da5d@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=a5e45f768aab5892da5d
Reported-by: syzbot+fb4362a104d45ab09cf9@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=fb4362a104d45ab09cf9
Cc: stable <stable@kernel.org> # 5.13+
Cc: Arnaud Lecomte <contact@arnaud-lcm.com>
Signed-off-by: Ian Abbott <abbotti@mev.co.uk>
Link: https://lore.kernel.org/r/20250725125324.80276-1-abbotti@mev.co.uk
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
[Andrey Troshin: backport fix from drivers/comedi/comedi_fops.c to drivers/staging/comedi/comedi_fops.c]
Signed-off-by: Andrey Troshin <drtrosh@yandex-team.ru>
---
Backport fix for CVE-2025-39684
Link: https://nvd.nist.gov/vuln/detail/CVE-2025-39684
---
 drivers/staging/comedi/comedi_fops.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/staging/comedi/comedi_fops.c b/drivers/staging/comedi/comedi_fops.c
index 854b8bdc57a1..0af6e4a2fad9 100644
--- a/drivers/staging/comedi/comedi_fops.c
+++ b/drivers/staging/comedi/comedi_fops.c
@@ -1582,6 +1582,9 @@ static int do_insnlist_ioctl(struct comedi_device *dev,
 				memset(&data[n], 0, (MIN_SAMPLES - n) *
 						    sizeof(unsigned int));
 			}
+		} else {
+			memset(data, 0, max_t(unsigned int, n, MIN_SAMPLES) *
+					sizeof(unsigned int));
 		}
 		ret = parse_insn(dev, insns + i, data, file);
 		if (ret < 0)
@@ -1665,6 +1668,8 @@ static int do_insn_ioctl(struct comedi_device *dev,
 			memset(&data[insn->n], 0,
 			       (MIN_SAMPLES - insn->n) * sizeof(unsigned int));
 		}
+	} else {
+		memset(data, 0, n_data * sizeof(unsigned int));
 	}
 	ret = parse_insn(dev, insn, data, file);
 	if (ret < 0)
-- 
2.34.1

