Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793695502;
	b=HqhyUAzDXzajNmqiV4q7rRKlRz+9yjbNHiWrl+LlfyOpBEtt+ngtF4WY763jKhGFd4ib
	 k0ZhxbO319HM3NaEI5DpGmualj82PktnlbXEM0uauBi+IXypi0dFXfqp4b4XrTiPNp2GO
	 ALawN2RYjiimrBCrWR+LomqQK6CMMA2bDn2Hr5wTrCZ3SBo3YVt2gxAE6RSdTmfAmLgC+
	 dL71BV3LftuhXmMZfl8TjGUVRZguZ46KIzuK/WdgoXinEepnkrLb3YSFM4QKUd+dP12IS
	 DbJ7RPhftMmi1ShlZLiKbhh8txfOEOKO8IhjVKU4auFHNqm5hkrF17gdgQXfHQGIrTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793695502;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=+jpPh4m+peQuQ9WA8cXHA/qOhK6T9NmnutAIkA0W11I=;
	b=d2xyGrciAodxNKHuX9xwhxA6hA+snIxnYVFY4BRJHrboTpHLCCSP11qP3uzrRmsZX5eM
	 iG/vxismslIxFiUXtw+pG52snwSTjrOjt7E7oJbt24reduguAgsKx4MQsLMBejm1vRbei
	 Pf2diVmlPaNCQiqPAq06MCMvDMWNqgFhrgqlnk+Yqeo2KART2M6MWEb5rWtYvVth014x5
	 l9Xbpzi+krNYeQX4qNuG0vJWyRe1JO44ZFeDNhzQVQgNK8LEH7ER12w0nDr4HI7N4L8cs
	 ZFsmg+OJcysaSKIaLhSp2BVx1Di9cqRccGoRTuafYEdBHgGWtCpsWiuf6KARF4gBMyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DglZb69D;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2F7C606B6EF
	for <linux-staging@lists.linux.dev>; Tue,  3 Nov 2026 08:45:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2F7C606B6EF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DglZb69D
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so26022145e9.1
        for <linux-staging@lists.linux.dev>; Tue, 03 Nov 2026 00:45:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793695500; x=1794300300; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+jpPh4m+peQuQ9WA8cXHA/qOhK6T9NmnutAIkA0W11I=;
        b=DglZb69DGQEWIxw0BGIpLazuABvmEfiL4q5z4N0PAdbOBsTh0tJuV2LKIjCYocp/JG
         r0S3wZezhNhwj/jDFlIVnVkOBmwxN5FoZclV7QVQ04VnDRT4OhpV/wxRfLzrA7PAZXA+
         K7hrlMI9cRWwp1NmpE0ChthonVbr+j0t7SlLBgvan6QqjVFtOUtbyCZMQZCLEsZ+wdOM
         UZe4y412cJQKNrPrN1mSTFvaLp+0274JSnSdXCVIFRzGiQ3A9oNXtDqRdvLGi+PQLrzC
         xyPIHw7TmT9T99EMKRFRn828NGx+1qhtw7VFSxUBKzJC74O3+UtwuTg0MAOpSN6v+i1V
         ChVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793695500; x=1794300300;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+jpPh4m+peQuQ9WA8cXHA/qOhK6T9NmnutAIkA0W11I=;
        b=AtHVX3Q8bbJ8p2nczSWmh1GpUDgDgcWn6PQ8NWGHRX7nvTiAKfDnEjX4rzYu2wJy87
         BWlznAkOUPluYK3LU5i8FdCGjN7hNzzwB0b6aipS0ZZjkaA/oBL5U4ZCz5DK03s5adaC
         NgqVE0fWCggemtUwcbYErWMNc1G0MaHtcxMpKRMGsgVhAloe5DvpbK+obJRTdMGZkl2U
         oFFVdofdlgdkMMYB/4L/aekw0S8o9rgTS//NqugpqWwZVpHadYX2v0ZF4/AEObqZXiFy
         /51akx1KtHZMcPkhi8Gz2DHSnjHsgzVGLFg2HkSHcsAJy5qAZWhWx8UppnSIjgNwE6jP
         nYxg==
X-Forwarded-Encrypted: i=1; AKwUvBw38haVCFgHlH8jhm22iugbDsZ2pfyXCZAO0gp4QM1WErJP+gRMUEASow/riw2WAdmmyuvD4sMmjQeAqqQS@lists.linux.dev
X-Gm-Message-State: APuU4Z9MefJnyLh2w9hCh/we28KqPe4B2gJFvQNGaJ9L85Nntop573wd
	GM5d81XK0vsC/UzJSzUf+46YiuhpGjJhikfr9JvV4FvZor+KpzfodjHB
X-Gm-Gg: AYBFou1hvMLiVRB5Y3Db+XRHHW194kEp16GUEiogZxf1cBogpocBbHobsdyxh4OWi5R
	B0T6bIymJgOwO6tKmtfAwqi/8yZCiuI6xUQc8B82BKU0z1bp9IAL/30AdhAOakfpXgy+TtbPiEQ
	n/tqoSlRZHZX7B8J4k8U8hRSx2yRJP2Inb+cDIFVbTBYn6P53o25dgDc6dTMXnmQzKORIFtfHLX
	fsT+PYxaLpdmkG+sCjwRKMEjRHW3ugvkPUgY2Bf7KVKnPRtZvPkIcXV5j/PvM84LnAkAa44+T0j
	1dcUrQeqohK7/jhVQsnHhdfMnPK5hd/29bvT4qUYLz0qcePJYJe4sJRs5GtctqLkCZxYkY+mjU3
	4nf7sAdcFiSYqqCEp8ZnABr6Dv1E3JDQUk1qrvJ6UZN7BABh8Z3OBL7k8yWCWZJy+1mNPbDAd0u
	07hsN8sSHC2WLMEuZe610x4o7Fpn9WGM5IohkBn5cm1c40bNNNs3dJP/M7pav9wA6K9ksUQgyVo
	hzavdBpj8YL33myevsrAppb0hh6jcF95XgDrd8BbxmEZSIxXUCYqHq5SnqDQL7/gTTZaJQDC5Hw
	VkV6KskEQbgKwzLsSdoXFuSovEQiK2niE8EuDfmCj6vA7V4C3LsWwLECUkYCIPO9LuIksTnqy5t
	KFbBGmXBIri7NBEMBonwfGfKPPcXmUAY26nll0zSF9HlQAKQYevwsw8TuN9nUFMNAu/k=
X-Received: by 2002:a05:600c:3554:b0:4a1:e7ce:107b with SMTP id 5b1f17b1804b1-4ac150b20eamr297842715e9.2.1793695499792;
        Tue, 03 Nov 2026 00:44:59 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b78c10sm23373364f8f.25.2026.11.03.00.44.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 00:44:59 -0800 (PST)
Date: Tue, 3 Nov 2026 11:44:55 +0300
From: Dan Carpenter <error27@gmail.com>
To: Alex Elder <elder@ieee.org>
Cc: Maritu Hone <marehone12@gmail.com>, Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Bryan O'Donoghue <bod@kernel.org>, greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev
Subject: Re: [PATCH] staging: greybus: uart: fix heap buffer overflow in
 gb_tty->buffer
Message-ID: <aumfB5MLWIQuTYY3@stanley.mountain>
References: <20261102195332.19860-1-marehone12@gmail.com>
 <f3848ac6-a105-4581-8f17-fc9d3f748b74@ieee.org>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f3848ac6-a105-4581-8f17-fc9d3f748b74@ieee.org>

On Mon, Nov 02, 2026 at 03:33:58PM -0600, Alex Elder wrote:
> On 11/2/26 1:53 PM, Maritu Hone wrote:
> > gb_tty->buffer is allocated once in gb_uart_probe() and reused for
> > every outgoing chunk as the backing store for a
> > struct gb_uart_send_data_request:
> > 
> > 	struct gb_uart_send_data_request {
> > 		__le16	size;
> > 		__u8	data[];
> > 	} __packed;
> > 
> > In gb_uart_tx_write_work():
> > 
> > 	request = gb_tty->buffer;
> > 	...
> > 	send_size = gb_tty->buffer_payload_max;
> > 	if (send_size > gb_tty->credits)
> > 		send_size = gb_tty->credits;
> > 	send_size = kfifo_out_peek(&gb_tty->write_fifo,
> > 				   &request->data[0], send_size);
> > 
> > request->data starts 2 bytes (sizeof(request->size)) into
> > gb_tty->buffer, and up to buffer_payload_max bytes are written there
> > whenever enough data is queued and credits allow it. That needs
> > buffer_payload_max + sizeof(struct gb_uart_send_data_request) bytes
> > of backing storage, i.e. max_payload bytes.
> > 
> > gb_tty->buffer is allocated with only buffer_payload_max bytes:
> > 
> > 	gb_tty->buffer_payload_max = max_payload -
> > 			sizeof(struct gb_uart_send_data_request);
> > 	gb_tty->buffer = kzalloc(gb_tty->buffer_payload_max, GFP_KERNEL);
> > 
> > so a full-size write overruns the allocation by exactly
> > sizeof(struct gb_uart_send_data_request) (2) bytes, corrupting
> > whatever follows it on the heap.
> > 
> > Allocate max_payload bytes instead, which is exactly
> > sizeof(struct gb_uart_send_data_request) + buffer_payload_max, so the
> > buffer is large enough for the header and the full data payload it is
> > used to hold.
> > 
> > Fixes: dd1c64ede97f ("greybus: uart: kmalloc for send_data once only")
> > Signed-off-by: Maritu Hone <marehone12@gmail.com>
> 
> I think I understand what you're saying, but it took a bit
> for me to follow it.  I try explaining it in my own words;
> please make sure it aligns with what you mean.  I think it's
> also helpful to explain how this issue was found (by a tool,
> or by inspection, or through examining the corruption that
> was produced as a result of this).
> 
> 
> The UART Greybus driver allocates a single buffer to be used
> for all send_data operations on a connection.  It allocates it
> in gb_uart_connection_init(), with a size allocated to be as
> big as possible for the connection, but the size used is wrong.

gb_uart_connection_init() was renamed to gb_uart_probe() ten
and a half years ago...  :P

> 
> The error is in gb_uart_connection_init(), where the buffer
> size is computed and the buffer is allocated.  There, the size
> of the buffer is computed to be the maximum size of the data
> portion of a gb_uart_send_data_request structure (*without*
> the size field).
> 
> The problem occurs in gb_uart_tx_write_work(), where the buffer
> is cast to be a gb_uart_send_data_request structure.  That means
> the buffer contains a *full* gb_uart_send_data_request structure,
> not just that structure's data portion.
> 
> You're saying that the buffer size calculated in gb_uart_probe()
> should be max_payload (the maximum operation message payload
> size), not the calculated buffer_payload_max value.

Wow..  Heh...  I have read both the original message and your
message and I still have no idea which function contains the
actual memcpy() overflow.  :P

There are two sizes:
1.  The size of the whole struct from
    gb_operation_get_payload_size_max(connection).
2.  The size of the variable length array stored in
    gb_tty->buffer_payload_max.

I have reviewed gb_uart_tx_write_work() and it uses
send_size (which is the size of the variable length array)
consistently and correctly so far as I can see.

I didn't follow through each function to see if there was a math
error somewhere else.  I'm not going to do that because either
way the commit message needs to be more clear where the actual
corruption occurs.

regards,
dan carpenter

