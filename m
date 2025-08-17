Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6508E29E0FD
	for <linux-staging@lists.linux.dev>; Sun, 17 Aug 2025 17:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755450863; cv=none; b=gVQrLKIYlLp/DMTJpUa5jjViJm8+fPpR0PVBmSWUCLmqN7umTNU3laabo3n0+9Ad3pn9GdwEWAjCHj7zuFbS8Rag70HkWQuql1pD/sS6/dF2xLq0fStaQj5/X0l2X73nV/d/1Wz0Q1nq5PNOXDs1Z0VmwPQTmSrwL9Kqt+/IACg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755450863; c=relaxed/simple;
	bh=EdsXrgswoXc/LcRSdAyb1O3Hx5UkEBDBkHDaZ4mDY/I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=dB7/UvTs5DELiW1OAu8q/oGIZ5NIWyv+cDXAKtERGlvO0AtKm2oWhwuUzM2s9E5/dPzjhW6vmrfRzWld5YF1rFfp9aZ2uhLCLvUDkZuGnAdHexnOPMCuRnrml0kOz+bFlNhNA/NyMTmZKdQZJjJidxJk3Vl0AKCN2DmndFYDZ1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RlWjLrRk; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RlWjLrRk"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6188b5be5deso4448768a12.0
        for <linux-staging@lists.linux.dev>; Sun, 17 Aug 2025 10:14:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755450860; x=1756055660; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LY0YIEoUecUVF5HfBlI2OFzc+QtaIhgG2Wu8Bta8CWI=;
        b=RlWjLrRkMJrJ8fejaDJggnpW79G2wxliWgSUmfIcQ0DbGZehuIQvF0zy77jshub5VV
         EWQF5KXVrKXVD6JnxERgEqejYbRNR/87mCf9haAYdGm+THfeeIxQ8B8eH5QdWO2xw+aP
         dFivfaxBeqV6OfFlMIFAg0/EHiBP1tcrPzsptLDvA0XPS95IvbzZBp7aBcV/8tWZNexA
         zFAyj4nhxMt6KbnjcFUaxWiNH8WBgHp35BA1aKQ72AedfoGo588LQ3FTEFSQ76tXuSK1
         mgZnnQoq8DMmXVE8h4NJj8fwjbeJHaV5obl13vRNdATHgOrlQJvAMKQLhNUSX+kZSXN8
         oZOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755450860; x=1756055660;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LY0YIEoUecUVF5HfBlI2OFzc+QtaIhgG2Wu8Bta8CWI=;
        b=VrU2HvLPG3f27Hv9azoriTd4q72E0DJ7XEBurafLvDzfCY9kbIbDFQsHykkbTD9JhH
         NNWYwO0BT6LNbRRkpvJaqF5qKtJs3dAMn8JrDYf8H0Efc+Yy53DqDIy/QCiFR51lJMuX
         nKramHeSU7ErrjClsOmFaTS5CSiWduoiFrCG2GJX1tjx3AtS5P2vVjpCdaelv7C+iyBg
         gcNFiyHppgJWcf/NS5X1ZfnOWzJmRWskXKqsI70UIqc8alDD/7+1ijQuh6f64K+eeH8w
         EHdI34NVOX/jVtWoIQk8smW0OoD9F5tZpQK7jEwFqb8hpKhFLFWG2aMBuVpZdeSoMdp/
         962Q==
X-Forwarded-Encrypted: i=1; AJvYcCW08HJJjE+f0Y9ve1kdDqwi6+PNqLfYnZ8KIublZGg3AouI7jIAGWzXQaT7CHAaMPhk7888t/cjuh0uvsJ/@lists.linux.dev
X-Gm-Message-State: AOJu0YzqeClyQwrZohbJstZpUceepDAPdYcxnN0y8aBpRQNCNuo/H2rR
	Qy9JOQqU9J8mQXuALLng1Kcdo2Sut33njq6dREG9oQzVGkYUDZQpT1Tz
X-Gm-Gg: ASbGnctO1LtoLZ+lLkFp26hi6sWdx3aNeE/Ixo1/Kw4VgnIts7dtBzagSZeQIPAYULG
	4v0xCMXu4svhabGZswKRRMIK1+AeM+gQ4mxi0I9IAIEkp+eF18XhE8J/xtjJmVF8sSSMkzigiyc
	oRkgmndTBRLJGhSKWxKuwwP02pyR6bEIVW7JwY9OuBW3+5sT8+AnCjaYaMgV/+GgXWjCh5nfOh4
	PlX6TnQGq29hA2kpTCW4DPGSH7XmTTosGxVR0kmhng0TwcJerqEFfaoII3aRBXioUBTpsAEDUuq
	AIN/H1x99V+jw3TeyWYa0t3p+GbIWqpxQ+0JO6aIU/cwteoPrTrp+jpCgIQ+tilXlqyAph9GUm7
	/VARflbWueeS1onYvZ3H2SZV/H/klSq+KsQ==
X-Google-Smtp-Source: AGHT+IGTN3iEvbwgt1xnZ9FgE2o8v+iy5yboUBLF5nA0P8h3zvmiBjNvUzKjvIuN7BJmKtdf0bSh6w==
X-Received: by 2002:a05:6402:234b:b0:617:fe86:6bff with SMTP id 4fb4d7f45d1cf-618b0513fe6mr8219743a12.8.1755450859385;
        Sun, 17 Aug 2025 10:14:19 -0700 (PDT)
Received: from ws-linux01 ([2a02:2f0e:c207:b600:978:f6fa:583e:b091])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-618b02b2e97sm5414399a12.56.2025.08.17.10.14.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Aug 2025 10:14:19 -0700 (PDT)
From: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: gshahrouzi@gmail.com,
	Ovidiu Panait <ovidiu.panait.oss@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2] staging: axis-fifo: fix maximum TX packet length check
Date: Sun, 17 Aug 2025 20:13:50 +0300
Message-ID: <20250817171350.872105-1-ovidiu.panait.oss@gmail.com>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Since commit 2ca34b508774 ("staging: axis-fifo: Correct handling of
tx_fifo_depth for size validation"), write() operations with packets
larger than 'tx_fifo_depth - 4' words are no longer rejected with -EINVAL.

Fortunately, the packets are not actually getting transmitted to hardware,
otherwise they would be raising a 'Transmit Packet Overrun Error'
interrupt, which requires a reset of the TX circuit to recover from.

Instead, the request times out inside wait_event_interruptible_timeout()
and always returns -EAGAIN, since the wake up condition can never be true
for these packets. But still, they unnecessarily block other tasks from
writing to the FIFO and the EAGAIN return code signals userspace to retry
the write() call, even though it will always fail and time out.

According to the AXI4-Stream FIFO reference manual (PG080), the maximum
valid packet length is 'tx_fifo_depth - 4' words, so attempting to send
larger packets is invalid and should not be happening in the first place:

> The maximum packet that can be transmitted is limited by the size of
> the FIFO, which is (C_TX_FIFO_DEPTH–4)*(data interface width/8) bytes.

Therefore, bring back the old behavior and outright reject packets larger
than 'tx_fifo_depth - 4' with -EINVAL. Add a comment to explain why the
check is necessary. The dev_err() message was removed to avoid cluttering
the dmesg log if an invalid packet is received from userspace.

Fixes: 2ca34b508774 ("staging: axis-fifo: Correct handling of tx_fifo_depth for size validation")
Cc: stable@vger.kernel.org
Signed-off-by: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
---
Changes in v2:
- added "cc: stable" tag

 drivers/staging/axis-fifo/axis-fifo.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/axis-fifo/axis-fifo.c b/drivers/staging/axis-fifo/axis-fifo.c
index e8aa632e0a31..271236ad023f 100644
--- a/drivers/staging/axis-fifo/axis-fifo.c
+++ b/drivers/staging/axis-fifo/axis-fifo.c
@@ -325,11 +325,17 @@ static ssize_t axis_fifo_write(struct file *f, const char __user *buf,
 		return -EINVAL;
 	}
 
-	if (words_to_write > fifo->tx_fifo_depth) {
-		dev_err(fifo->dt_device, "tried to write more words [%u] than slots in the fifo buffer [%u]\n",
-			words_to_write, fifo->tx_fifo_depth);
+	/*
+	 * In 'Store-and-Forward' mode, the maximum packet that can be
+	 * transmitted is limited by the size of the FIFO, which is
+	 * (C_TX_FIFO_DEPTH–4)*(data interface width/8) bytes.
+	 *
+	 * Do not attempt to send a packet larger than 'tx_fifo_depth - 4',
+	 * otherwise a 'Transmit Packet Overrun Error' interrupt will be
+	 * raised, which requires a reset of the TX circuit to recover.
+	 */
+	if (words_to_write > (fifo->tx_fifo_depth - 4))
 		return -EINVAL;
-	}
 
 	if (fifo->write_flags & O_NONBLOCK) {
 		/*
-- 
2.50.0

