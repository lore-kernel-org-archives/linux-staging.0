Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793619923;
	b=Fqmt747H/y+rU/y5+2YFGW1CFJ9GUhyO7agfaCnruIGNp2sXZnMmGfkzV4nFocpsF4lg
	 xVzixCVhf9Xf2Iq1ufLWYE6ZOPBLk+u9CoZmIFxECi+nHA+TS3P1ZgC3Y3P9I1loIOUEw
	 xpuQzG0F5IiuaVur+bKJH4PWcxidCuBRSJZllMmrGIkjpihYENrga/kKncCL0fax4FL5u
	 FFSwpArvtUg9unkcIlZZyiU4Zo3b3iUpnNM/yB043LI1xXcK6dMaBMqIOGWyy/p9tlLM+
	 s7q60RkovVQOz6P33ZTgX5DozsymzjWoxSnQig48nmTuTeNKk+2olyOF1EAE170hA2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793619923;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=2iW75D2tc7+B3ipWuNmxmErb7fmmq8W4bpLgK3YkqfU=;
	b=iq0BpD/kLISv+DZJdq8k/HgFG1iq0b//P1jInHVmyShz1aFIQfDglJwBLGCraOAyA57r
	 Qw2VPjKbPyqXrzbLEs2UF+5B6cL4ZEVPDLtJbjmyB/G+kseRX53396wCAU3dN/izhpveR
	 L7wLyVnmwuqug647iHKB3AqTV/tz94SkFDiuMC5dv2NvA9dfBbUOmERQy6ORoqCvtGLkN
	 orWzKYVFmBm0fTJgP4cmIvfegZYQ0S3kcx0cXqLDUI2/SbWQKv8/ODX/qsuYgDf8Yui9Z
	 JBKtx/ghxzNuhaGSTHoFJgNX5qLct7uxqytUxA2VCmNMRs/3qh+YsF3wjTWL12m91PA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dUIdMZiO;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C71F606A327
	for <linux-staging@lists.linux.dev>; Mon,  2 Nov 2026 11:45:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C71F606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dUIdMZiO
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48e20ed3b9dso2599331f8f.2
        for <linux-staging@lists.linux.dev>; Mon, 02 Nov 2026 03:45:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793619922; x=1794224722; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2iW75D2tc7+B3ipWuNmxmErb7fmmq8W4bpLgK3YkqfU=;
        b=dUIdMZiO6TmaTih0wG21H/nddzIXmETU6NckXBEP12D+WBJRRu69caxcmnmBcItqEh
         sYn6iuFaLwk9b64WBXri+Qn97kkBEUmxaPU5hyA3GT3uVRV0bk/WShd3ER48VlSPFvvc
         BrbNLrrASF/raPCJ54v5vgOf7N1Z+6UtMBsPIolsEOU4Ly0k4UtPR9dDc15sxpBHlEAQ
         Xgf50YmdUUwlZiWAPwwkQ6eeul4jtbFqTA3xvVvbDFSlP69D1ahaC0p7MzOo44/diAVs
         FxgppjhNwI5lBMBf5xNASgoEMdMA5SP5Nl/KikipfGjj+ua72lxbEWA7bjjXp+tdwo8/
         EpVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793619922; x=1794224722;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2iW75D2tc7+B3ipWuNmxmErb7fmmq8W4bpLgK3YkqfU=;
        b=UD6k7yZe0N/FMHvKPuASgMQKVMJxQfTvitfChC3gkwTN4clrI42iZzgRdTNMoZM0nt
         lkSKVOmhg5WS7n38/mIXLoi2wWJx9CTrGYkcXruWmG+WDnRn+bn0YwufcFTAHaQo7h1L
         t8MBXZcEpKj45bIfaNOeODui0k6CA8HawlDBuqSE2zIwq6ErGMYBmXp570Zaz6+iVmxR
         hseFB6kdgtawPtiHz01C55oL4lcvWbj12+BtWFotfqzG1snw7Awgm3b0VtD1l1gdIyQZ
         C6GV2wtaiHmtz0APILYWXMOe+of8w7fJx2tYZQB6wNJyVNS/suP4AuSH231m9yJUs+ZP
         exdQ==
X-Gm-Message-State: APuU4Z/pwuypf8ZbY9I1UGaZxMhshI3rEqhkD6NEBOpQwB4vb9RcNGNC
	gS41MfhtCClX+6Gf9OjMXQVi7xsHPIER+o5ktUJnt90AnPULO89zLFk5eFegCJse
X-Gm-Gg: AYBFou0o+NN3B7yx4B5rgB7FXnxANOFyDIorg2okfaYgGTLLNuhwruoOdRRvRFPPRlt
	A5qWV2Nwxy/+aY3BOj1iGapE5vqQWl9r7hrOMN08ZNJu4FLj5ZVbTcvSBoB+8GRQ+e5U1ftsDBG
	Wrf05lSA1DtD/TuTnQMUJSDlBiEMoNYAFIRSuFGd1vaMfyJWfLYdmHEtwr4r2q+yP45LW1/d7jd
	wQf5ak/djVeu6UrZMcXQBwpjJQG9hc9hnD3TwPzXomKOeKLqtEg4q+6KJoJsCtFYTgn11w+OEQK
	S93M/mBdZa0ikUR25pax3F7zn7iP31XdsXGKbPrsmSX70eDUQr3oFMqymoI0GoKnB3JQupa4BU9
	T/d08NSgiypa73W6peiEVF6luC9wQKmlimoSgN3IL22jhijrVMhxZrJjgyExh/BXbGnmkhZpnRn
	LE/72kIUnjaVpT2jD9Mc6H2LKshQIcfC4QqDany4zk9RijtrHEkH1CLeuX/ugorZ5ZuslcucxDx
	M4IcDbFynsx7z6I9XMHNZ/1LtxsmjkuUGV7m08Jj/mooLVEDy7PibAysReCTrIAqgFL0WJW5YSj
	4ePAFb/67qFK7BYN1zApF0dWMyPEpBakKXsMq+sWjYbD0cPAMSIqyvAGAlIFPSkBYzLKC4ANtsr
	GHPsDxyDZwfy2brRsl+Tukm5AKXEyitsaU0As
X-Received: by 2002:a05:6000:4b0b:b0:48d:db77:d124 with SMTP id ffacd0b85a97d-48e6e2db9e1mr21860101f8f.6.1793619921668;
        Mon, 02 Nov 2026 03:45:21 -0800 (PST)
Received: from x1e ([196.189.89.249])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b8bd8esm19731126f8f.42.2026.11.02.03.45.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 03:45:21 -0800 (PST)
From: Maritu Hone <marehone12@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	outreachy-kernel@googlegroups.com,
	Maritu Hone <marehone12@gmail.com>
Subject: [PATCH] staging: axis-fifo: fix integer underflow in TX size check
Date: Mon,  2 Nov 2026 14:44:51 +0300
Message-ID: <20261102114451.54579-1-marehone12@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fifo->tx_fifo_depth is an unsigned int parsed from the devicetree
property "xlnx,tx-fifo-depth" with no lower-bound validation. The
write() packet-size check subtracts 4 from it:

	words_to_write > (fifo->tx_fifo_depth - 4)

If tx_fifo_depth is less than 4, this subtraction underflows and
wraps around to a value near UINT_MAX, so the check that is supposed
to reject oversized writes never triggers, regardless of how large
words_to_write actually is.

Reject the write up front when tx_fifo_depth is below the minimum
required by the hardware, before the subtraction can underflow.

Fixes: 52ff2b840bc7 ("staging: axis-fifo: fix maximum TX packet length check")
Signed-off-by: Maritu Hone <marehone12@gmail.com>
---
 drivers/staging/axis-fifo/axis-fifo.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/axis-fifo/axis-fifo.c b/drivers/staging/axis-fifo/axis-fifo.c
index 7bb35e11d1dd..aa76be5d78e4 100644
--- a/drivers/staging/axis-fifo/axis-fifo.c
+++ b/drivers/staging/axis-fifo/axis-fifo.c
@@ -228,6 +228,7 @@ static ssize_t axis_fifo_write(struct file *f, const char __user *buf,
 	 * raised, which requires a reset of the TX circuit to recover.
 	 */
 	if (!words_to_write || (len % sizeof(u32)) ||
+	    fifo->tx_fifo_depth < 4 ||
 	    (words_to_write > (fifo->tx_fifo_depth - 4)))
 		return -EINVAL;
 
-- 
2.43.0

