Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794632500;
	b=onNAOvAAuZq9rRiL5liPsI5q3FHyMAbzvknKlSe+wjR296ddSPswK39MhaVfGzUDuhIU
	 QCEtW9wxtI0HWs0ujRYLoSmt7gk3s5YPqDEhXmz9zAVSlT6rb+qxOrpHAwUCLS1tPau2f
	 fFqLKmosvlL+vBHNY/BoGJbhP0W6p63hXadUhBKiovS7v8SUOtNCKpitNDWCyxkJz7a4x
	 FDChwDeYFfkORQyJ3uZ0ZTB34RFj+mzf8eh3Qnj9Wf9p3NLdptSnL5Sup7KZQYtqQeUej
	 BFHMw31Z26uCIzhVchLPP/aA+ILHbfgxV/uLilLL9VRKp1s8/CNXKMFLHIa86yOsQ0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794632500;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=XsyBqFQpB4uqfmK/Q9kt69A4CrjPtbiX6wa6hMkSoPo=;
	b=zJHi2y5eMRfvw5TJ70EA+4jL9vZhY+iTk6s8LYjmQO3Pd0xFvzDtykMu+oANZtKSBS6U
	 lyrCUier+N+mrE0H75j4jA5N/vtTWhE886Uptt8o064sEm6qaMjFas87UXf+BgTJKWB1p
	 cNjhlEoC0qi2jmVPVbTFHxfKOgCY6KkY9rYV0fNrX0c2/ADgSeO5HmU6ayD1Ykzcvp3ev
	 x4SkVawJ81hdPt6IU8VqQBdc5LbO5O+b1PAGgLVMMlcrvgSZKYlC3wK4IMEBUc/rQZxIk
	 cOP0JeA7n+VHjTMLFHyoGcomf3TUZtPqhjMaalw8HyWk96CoXDvVJ3badYU4JHhHydw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=w9r3Turt;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FDA3606A334
	for <linux-staging@lists.linux.dev>; Sat, 14 Nov 2026 05:01:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8FDA3606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=w9r3Turt
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so21680545e9.2
        for <linux-staging@lists.linux.dev>; Fri, 13 Nov 2026 21:01:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794632494; x=1795237294; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XsyBqFQpB4uqfmK/Q9kt69A4CrjPtbiX6wa6hMkSoPo=;
        b=w9r3Turtc4UJ6kkOc4vKcBqhBfPZX7qUJ/MMMgSpx98yc99HHN1P0jQJNeYWY3KsOe
         4VCYedRohBGA/onEe0x8VVXbKTZleHQmhgCKuin2Yl6bymSkIvTIx+iu1+vUx2CdqMZg
         MMqg9ENJhz6vg7AShHWl0fmRzjOWbRWHUPpDvfdZboVMK3kWVVKQYpQfAfyBeUlK0Aq6
         FrnLgcZYXxKmvCu9V2BRnOpGB+Har8/Z/XJSpMZGNAlgc36IG+S60IgJYuJmykPQa+tY
         Bf9x2CNSt+fnxO9Z9SXrkgeyUDkXLg6Jcwq4Puxp22vKuUxMh6FtCVGP70pa53p0E1lX
         dIJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794632494; x=1795237294;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XsyBqFQpB4uqfmK/Q9kt69A4CrjPtbiX6wa6hMkSoPo=;
        b=aGVgQCbwe9xIAUKvk2KEct9WqRtOoGrGzOEObcgqy6Ce1X2vC+7YMRwho4nWKcMkgz
         9oVKmSLFw5l+I+JY+eEfaBVmDBKhJFW5G4lbo6bPQ4Mi8mAE3hGXzFdnp8d5/gjKmh//
         2G0Sbwn1jTvSxC3wNNxG+CXAdWeGvHSo0FO3xTk77Mt4jDM/k+4VWAif4l/IWpbFEtBU
         f4GfHA1OjKaSS8yMwJjXUXmOHUyYQsz4TdZko4vReUf7Jp8BBKOaB5fcYfmzHlCkQFag
         8EbWg/bWKYVe7DOnmAAptCYKv+fDyGM1WTdn93lPZp2a8SLuyifmfrFjlE0WY5/xNvOZ
         KTRw==
X-Forwarded-Encrypted: i=1; AL+hErEe/oL13RrW3YrzvkcSSGvxFPN1o/6z3PXxNAQeMJXszB4fv55UmFsMFxPVFwLhjmddRxqlv3DniLN2kPdv@lists.linux.dev
X-Gm-Message-State: APuU4Z9o6sMOL5TW8Et+UWl3E/1yJIPvg6UZuzOjW99IHg2ZVQJvwIQ+
	uuYSNzNEbYlYjgCsQDdrCMzn8FJIlq83qBXb4apPcy7PtGrTPOR1bbY+
X-Gm-Gg: AYBFou27x/Epvc6DE3/WPzGqxmxECz2JbQNvJT2DZZ3nINKZaKu/6tcGKkFK4HQ99Q7
	oAOd7ll7V5x5pDKVWZoEO5Yt9yNBQykG/XlbMmCZUjVzzfxFDdn2cFhqVZb3gO0olQnmKWMEhzr
	7hQUctST+gN/Chq730DA6Z4uJZ9z5EqK1F+Bbau2zM3Tulr7uO4+VD7+qq3pfB74/h8rgaITt65
	OinfjGK7FzfbTLF6mHZMffCQvCOooATN/bj6Dd825uUELTdzs0AKyAKUQ2yGcHWy4lL73uW63PL
	/HDN90I1lmkTUqWnbpDtHoA8usWLFEbZZ12gs/JKTOpxgvRTf7MAvIc5wboAKCp9LknhEOQCroh
	jWdWpd7V2Cpq7islgC7VVKVo974HCtxHUiwWbMbTlxY3dzUU323Gq1fc5bTp1lrhOsVcA7nE8AB
	fpild/lRqEmaW7ReW2+kmTmxNn/hXfroI2SwHWExOfNlIr9Td3eIAlE82KN/KdjO5UnyrMCgZfW
	Kg4ULPWfMPp+/gUDKTaHyaa2vASvf+PjZnyL1CtNTjckPIha0RGrjnZZt2hnfKVmCEgjoz6RVAx
	th0jse3xb22EPqyDruaVYlWtka6f4uPDq2wTTvhh56D5ljFcEkif3B+rl4bSaQQ2sTNPbB2XQdq
	X4RWKiAKvY9Nhc2CGDMjaEcZ0qucD4R8CclEitITDO/SouTIFBf5Gb6OwEeJHpxNeTH0=
X-Received: by 2002:a05:600c:1913:b0:4b1:2026:6b41 with SMTP id 5b1f17b1804b1-4bb55ab021bmr98950275e9.30.1794632493836;
        Fri, 13 Nov 2026 21:01:33 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb5671059bsm65540875e9.1.2026.11.13.21.01.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 21:01:33 -0800 (PST)
Date: Sat, 14 Nov 2026 08:01:29 +0300
From: Dan Carpenter <error27@gmail.com>
To: Shunbo Shi <shishunbo@cmss.chinamobile.com>
Cc: dan@pereq.eu, elder@kernel.org, gregkh@linuxfoundation.org,
	greybus-dev@lists.linaro.org, johan@kernel.org,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-usb@vger.kernel.org,
	syzbot+0b456664585fa81a47f6@syzkaller.appspotmail.com,
	syzkaller-bugs@googlegroups.com
Subject: Re: [PATCH v3] greybus: verify the received message size covers the
 message header
Message-ID: <avfrKSBbpEp7vQyO@stanley.mountain>
References: <avV8I97uZJgX8Osk@stanley.mountain>
 <20261113234739.1432-1-shishunbo@cmss.chinamobile.com>
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
In-Reply-To: <20261113234739.1432-1-shishunbo@cmss.chinamobile.com>

On Fri, Nov 13, 2026 at 11:47:39PM +0000, Shunbo Shi wrote:
> In gb_connection_recv(), the size of the received data is checked
> against sizeof(struct gb_operation_msg_hdr) and against the message
> size encoded in the header (msg_size), but msg_size itself is never
> checked against the header size.
> 
> If a peer sends a message whose header claims a size smaller than
> the header itself (e.g. header.size == 3), the two existing checks
> both pass (size >= sizeof(header) and size >= msg_size), and the
> message is dispatched with the undersized msg_size.
> 
> In gb_operation_create_incoming(), this leads to an unsigned
> integer underflow in:
> 
> 	request_size = size - sizeof(struct gb_operation_msg_hdr);
> 
> The underflowed request_size then wraps back around in
> gb_operation_message_alloc():
> 
> 	message_size = payload_size + sizeof(*header);
> 
> causing kzalloc() to allocate a buffer that is too small to hold
> the message header.  When the response is later prepared in
> gb_operation_response_alloc(), reading
> request_header->operation_id reads past the end of the undersized
> allocation, triggering a KASAN slab-out-of-bounds report.
> 
> Link: https://lore.kernel.org/all/sashiko-outbox-210716@kernel.org/T/
> Fixes: d90c25b0a279 ("greybus: let operation layer examine incoming data")
> Reported-by: syzbot+0b456664585fa81a47f6@syzkaller.appspotmail.com
> Closes: https://syzbot.org/bug?extid=0b456664585fa81a47f6
> Signed-off-by: Shunbo Shi <shishunbo@cmss.chinamobile.com>
> ---
> Changes in v3:
> - combine the two separate conditions and unify the error message
>  as suggested by dan. Thanks!

Thanks!

Reviewed-by: Dan Carpenter <error27@gmail.com>

regards,
dan carpenter

