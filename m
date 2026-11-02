Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793649220;
	b=1Z6I0JsIj0ilbXy8WiEae0W2fDy9vODVie6Ay5ivLxHjWsq+xytYCYn/9xfgE4WzEemV
	 Z1pHcxwQWfUjFQ0Bv5gpoS+qjji9RV4UXUku99diwk/J7xqKoWeQ/NpoLmJIdcVKAVfWo
	 xlMCazUeGJARqrqoxdTb0yeLCVSNEQPYsC0WjCz5ie4S4P3MOUq4GuCycE8nDOtdqYoLH
	 +3wEu0hjgKx+Ht+iJmLpA0xdyLnsa0n+aiXeZ0fPmi7cYbh4X3gTCr3wQ5U+0zmXdkvCa
	 Ml1SC5tW6goxedF1BNtFz10KQbrFm82YSlNhlimKUydpP8yRGwggXE7PWADIXS7kXSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793649220;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=TT+JdKCO8FQmAWG62bqZ1mtZpW2RojAaKod9k+xaBw0=;
	b=gXYUClj8HlY/JLR3MjDV2ngOhXw/wSsfSMhoen3Z0wMqioO+1xF5TkXCX4eFXVxI2URS
	 zYkNUSq6jvgUPOUz6ZgrT01DSOFvoInoZrcEJGnrPbkdKrxxxBqfj5E7iQdr7N3p4ZuTh
	 1tudnuxZiM/mvCSDnF+9038N2adHMpheDdphLdaVqsJ9WQXuY3kpG9NPVjE8tLJZuBtmz
	 JZAyGFc3nHYLhhb2S5NEbBP7FZ2hpiGsWR0d54gN0Sx7YaRAVnNJv3jy/NCwie3PwC/3u
	 H67tsDaj1cLOu8B7rEw5FskUcoKiT5UdZSCwSkPyILcGr0EPmRTREAvQCgL5t+w1XQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ioEO9Uof;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1C7E606EEB0
	for <linux-staging@lists.linux.dev>; Mon,  2 Nov 2026 19:53:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1C7E606EEB0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ioEO9Uof
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso23972225e9.2
        for <linux-staging@lists.linux.dev>; Mon, 02 Nov 2026 11:53:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793649218; x=1794254018; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TT+JdKCO8FQmAWG62bqZ1mtZpW2RojAaKod9k+xaBw0=;
        b=ioEO9Uof/2Um+4+4CQqp9SdR1Wsr0UsZXS+EVax9rNpvlGIVLpz2j97f32W7braXdC
         rMQLS08RwaCa2RUEUZPjDfBwcj09WvO7gLpLqV4vgXPMPdOHPwXzuJlBifyqY4ZZUc3O
         pynMsck4cuFdfiyfVoRN3HAVsNsvYKfgLWqRZizB5ddCW9bCEQ5y8wmB6eT9sgOTST6h
         HwLMgmaRyO8eHUm9UePwYBn+TNW8Yc4Nqv+8hkrndmyIwO5/Jiqyz8M/G7A1GQiG/bkV
         KgJdy5kRlzijkCdRjuwe8ttl6EkFil8oySULRpMbAXnUdbUMbw60oJZcKjO1GDuWUGeV
         36qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793649218; x=1794254018;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TT+JdKCO8FQmAWG62bqZ1mtZpW2RojAaKod9k+xaBw0=;
        b=EykWWyUiCY513b4wwXqw3Q05AM8C6cFjv978D32biQmb3kwy5PPqLuz3TLuwovLyGA
         RpADNVxrhKS5y7sjAhOt2xNZD0OgnvLpyB4RmtaPLHsPKc7jRNKLwvEsfMmAcdEmqquE
         bR68KKHeFHCGENTbW0q+Tj4STDLAECCMNg5zqQodyyGnrfmAaXHxVnlSBACizcPf0+u6
         5fvbrsO3khDyRMHlTepcVQC4OkxqB8JTqEpjxK4sqQ4SeLKL2fgvnKNVOW5oK6hg9hur
         ORSZganxOmBrjad1F5VpQeJF/aWHlIKwjHkJs0/SmOmpCs8+df8j8r3e2qJMJq1Rs9tf
         EvLQ==
X-Forwarded-Encrypted: i=1; AKwUvByvn6GkMfwxE6kaHxDrvOygW4n9AKs1GpoRkXd6n7E7beRRgj69se/f9uAcqg6GxeWctU6UyVlNZvL4gOpq@lists.linux.dev
X-Gm-Message-State: AFq9FYJSl0ug0rDO/umVmxgrXcbWXE/0QgXfb5KFMOkVYqQvJfS0Zl5L
	M9a1SQyaDoYS9AxuEh/n2wa6mDVuhDupnxMGXwZnc3hkZsvhxhI6fxN+
X-Gm-Gg: AYBFou0VyxFOSwx/MAdb3x0+N1ZKxLPyLhZX/6vFRag8UjRTg4xfm/EUg7O4RCDIAMj
	DRmmrSNXMhBhjc8pU8XT7VXVi+L6B+RY2kA6VzNSLKf8Rec/4TlTmRmzwE8Jn/Vq7WFE4GvNwyy
	BAM54Gtev2cl77R8pH6qLin/hPM08mBvIa2EewOBe8i6IohTck9xf/fY1/pRPt3GDVj3pnRP/tG
	xffv0Hvt6faVScBj6URteHCSDPN01FvwJtKbXQUmpLwuiqI1RmeKuibFKRHDV5p87lZCxgCptCW
	b14vAwwpgeIJrymiSGB2VwnUM8DukwE00hg5wlLv7eBN3sGHTeNv/9oFwO0rsSGpIq/NDhnsTHe
	NHGroFzQdb2An7pULAp6yVAk5xfGUvgHeAKu+STRd1nxQYY6KKbf5saRrl8e/Q+t4coAg7iN1iJ
	VZXmcFjKrFgSAgqhljY1aZRsu8Uga1lgD94s63NydWWQhcewaGNqwn1delQSHNwHYIVuUWL9zAT
	35s1jtYiApfliG+crhIimDfO65/nOeTz1XjHe59cqzWLTxRNRBmQ2TnR07Uxk2G4DD7+k06LOfI
	i+FjkUR9SZc3DWb0pd+R+sPk4epVNj8k35XV3tXh3mSRS5kY+ZOSHP6jsJmwXU3vuJQAVq9LOqf
	yzKXOHtJu5cAp8KqmtzXxWuXLclCKhmCt3CdfAw==
X-Received: by 2002:a05:600c:848c:b0:4a1:efd3:9862 with SMTP id 5b1f17b1804b1-4ac1765d977mr237853695e9.21.1793649218121;
        Mon, 02 Nov 2026 11:53:38 -0800 (PST)
Received: from x1e ([196.189.152.19])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b727c6sm23542852f8f.16.2026.11.02.11.53.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 11:53:37 -0800 (PST)
From: Maritu Hone <marehone12@gmail.com>
To: Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev,
	Maritu Hone <marehone12@gmail.com>
Subject: [PATCH] staging: greybus: uart: fix heap buffer overflow in gb_tty->buffer
Date: Mon,  2 Nov 2026 22:53:32 +0300
Message-ID: <20261102195332.19860-1-marehone12@gmail.com>
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

gb_tty->buffer is allocated once in gb_uart_probe() and reused for
every outgoing chunk as the backing store for a
struct gb_uart_send_data_request:

	struct gb_uart_send_data_request {
		__le16	size;
		__u8	data[];
	} __packed;

In gb_uart_tx_write_work():

	request = gb_tty->buffer;
	...
	send_size = gb_tty->buffer_payload_max;
	if (send_size > gb_tty->credits)
		send_size = gb_tty->credits;
	send_size = kfifo_out_peek(&gb_tty->write_fifo,
				   &request->data[0], send_size);

request->data starts 2 bytes (sizeof(request->size)) into
gb_tty->buffer, and up to buffer_payload_max bytes are written there
whenever enough data is queued and credits allow it. That needs
buffer_payload_max + sizeof(struct gb_uart_send_data_request) bytes
of backing storage, i.e. max_payload bytes.

gb_tty->buffer is allocated with only buffer_payload_max bytes:

	gb_tty->buffer_payload_max = max_payload -
			sizeof(struct gb_uart_send_data_request);
	gb_tty->buffer = kzalloc(gb_tty->buffer_payload_max, GFP_KERNEL);

so a full-size write overruns the allocation by exactly
sizeof(struct gb_uart_send_data_request) (2) bytes, corrupting
whatever follows it on the heap.

Allocate max_payload bytes instead, which is exactly
sizeof(struct gb_uart_send_data_request) + buffer_payload_max, so the
buffer is large enough for the header and the full data payload it is
used to hold.

Fixes: dd1c64ede97f ("greybus: uart: kmalloc for send_data once only")
Signed-off-by: Maritu Hone <marehone12@gmail.com>
---
 drivers/staging/greybus/uart.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/greybus/uart.c b/drivers/staging/greybus/uart.c
index e1b73db6a17c..7bbac2603726 100644
--- a/drivers/staging/greybus/uart.c
+++ b/drivers/staging/greybus/uart.c
@@ -842,7 +842,15 @@ static int gb_uart_probe(struct gbphy_device *gbphy_dev,
 	gb_tty->buffer_payload_max = max_payload -
 			sizeof(struct gb_uart_send_data_request);
 
-	gb_tty->buffer = kzalloc(gb_tty->buffer_payload_max, GFP_KERNEL);
+	/*
+	 * gb_tty->buffer is reused in gb_uart_tx_write_work() as the
+	 * backing store for a struct gb_uart_send_data_request, whose
+	 * variable-length data[] field holds up to buffer_payload_max
+	 * bytes starting right after the struct's header. The allocation
+	 * therefore needs room for the header plus buffer_payload_max
+	 * bytes of data, i.e. max_payload bytes, not buffer_payload_max.
+	 */
+	gb_tty->buffer = kzalloc(max_payload, GFP_KERNEL);
 	if (!gb_tty->buffer) {
 		retval = -ENOMEM;
 		goto exit_put_port;
-- 
2.43.0

