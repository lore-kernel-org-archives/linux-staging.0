Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794473002;
	b=rT3oOiv11nY2IfLPcjbRN7TAAQgnYBx9uYMDE39Euz34ozx4nYaSI54MPX9FcPvqOSOZ
	 oNH4NRSP5B35jDmdm47c6uU4Kck1jVhA3zNRngtLlQ2iTg7qtAAaVinMrlEqzUErn6u5W
	 dE1NDY13poJnNYUdUdmToujIa92iUXtdc3l2Q74rGjyUFOi3Wd3wOvIN61CZYyIaF185P
	 oP3KrYyCyaZ71TbYPdRSLNN/alLCiDPirfINkLfgmdvwNFZvuL3DCq68PaVtFK5xRHrTE
	 WaT8hreO48wWF8RnfkhCCURW20lg8RmFbYJU/joloq+PWoWdJjkVwcRop6D2NNX9p6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794473002;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=Ccrg0Ah5/raiZe23O01HRQmfIbLS9+N0hKSJNBgmJXY=;
	b=EJJMX/c6TFyvKkUJ+YPEt00rSpg1x9crsmAsZU/72mcX34B8lv8KlHuV5pVry0d2W9V4
	 zMjbGuHGSr4851FdjINlsvz7UnahbCXgjRgbOchVJ6ebj3ggMcnSMM+LzqQPtmcW4CMWe
	 zTV0lsgiarGWSs6htuRa2ycf4A/9CvO4F23nhAMt9Tb5ODN2+AkA9kX07hhcRd0qiLeuv
	 G2tbzkaGBQXoX9IWE74m+kBYlwoS1B/LsfqirACHJdvTq4QrhNKZ/++I5c1Sch+6ub2yV
	 E1adGS16aSOEeJqkOW0+3l9UI6FfXo/3XmAyzZ3yOhgkWzklxkTx9fPHKpBAkpyPlFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=pereq.eu;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D62B606B242
	for <linux-staging@lists.linux.dev>; Thu, 12 Nov 2026 08:43:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D62B606B242
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=pereq.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so46982425e9.2
        for <linux-staging@lists.linux.dev>; Thu, 12 Nov 2026 00:43:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794473000; x=1795077800;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ccrg0Ah5/raiZe23O01HRQmfIbLS9+N0hKSJNBgmJXY=;
        b=AdLG6EXbBDxbJVvDz7hhrILuBMQOEvh2wo/zmMzFAqMsMHEaBNrhLcF9L3alHUINms
         pc0XMIuLJ+s9jS3LbjxnWm4KHGDcljuXUei2tD/jeXGHPPM1tpzBje/4wELk0OrGYd/I
         CeZy6jnaK+pRlhCepbqAecI9LT2KVIaayGJhlaCgraDr3ZWujmZV1DPr1LucXij3zqJr
         gm1vXN0s6oBumOaV9cKHIHFGP6FIhQIKQ5ikaeu3KdOXK1vs8jLuASFnDndIUIcs5hBu
         GV2ewTb4CtK9evqPdY0k62TbFBPp8fsPsjjbrxCrQxjZ1jJnV8jzKjeD9ux28asmRnzk
         FS6g==
X-Forwarded-Encrypted: i=1; AL+hErG/qro/OahD3uY/aoIhqsvpza3Jx5Rwt/9Idb5Y9zivvMoo6A+06bLW1Ct2epMIr3PpFwfWaYPkVWTezR/l@lists.linux.dev
X-Gm-Message-State: APuU4Z/0r6L3rNl01NQ0p91bvGOIz/IibxbPoiKIv4o/SwMPivyq3D1K
	Hk3ERtZD1poU1yoiZUu8x9MhLNsMgqec0g0/0a+GbRh5FIKHm4TJmBgK
X-Gm-Gg: AYBFou03JBW2YRwfEDlPmTJsZZTbSgEgMi/GCPvPH/pDcRKmtSD60XQH0bxiP52dYmt
	r0YrF7L7rABRo+d4ZFPbLh1mSIfIZbPpL6BhG72wa5Zys3Cjn/4ank6tQN+Mxlnk7GS6g6evNpR
	cnBkWJdxnl0nKWhZZWkN+4zlJeT9p+Q7fuY4I0hExKOPEXTJ5PMJFKwJ7basa6chUddCOJW1yZX
	Awv2y/pp75S9ZX0JUDSiaOu4iK4qKBPB+EA+0uSHKpfwxHqPMt1vfrQ2A8l0lW1yNw17CK8Vtex
	ZMpkxK3pYwCLd9uRIuoRDzyJzt36VQnlhyBMU4EeWkzCXrYcXCpyW4V5r3aodLisWEGjb0+k+Mp
	mrsoiLIBRNpj1N0+y5plkbKIzqQKQopGoaky0nRc2RWmO7e2eqfrPgUtk0BrQqZSkQ31sogLmVq
	Jn/I64RlXuA8vsMjfk1194kmGUsTDZ1V9yUkhWisLqS7ykXIRj4iPDunwTWubwnerOYOClA+2KD
	VaThU9zebYrKZayR4q1ZP5YqLz0u1SiAIi4bBS6PTTyHi2ykyu7DWmgnmGThIALKvhC8O6sEpNU
	Dsj0yfL7xNY67pW5A82pO/hlpCN9lJ0IYp/aXVIu2GbDOzxrAKt2y2TOoGn8nhKIFRkqmjo9eEL
	3z88t3xphMrzTVsl+LudumkckduxuXRyKqYSX6QACc9d4d8BaDdlwmIBqyIwCfg5U00Uio6qmeE
	ffdHIJEg==
X-Received: by 2002:a05:600c:470d:b0:4b1:4017:c4f4 with SMTP id 5b1f17b1804b1-4ba093805b3mr88234605e9.20.1794472999607;
        Thu, 12 Nov 2026 00:43:19 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e258e8dsm82532545e9.4.2026.11.12.00.43.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 00:43:18 -0800 (PST)
Date: Thu, 12 Nov 2026 11:43:15 +0300
From: Dan Carpenter <dan@pereq.eu>
To: Shunbo Shi <shishunbo@cmss.chinamobile.com>
Cc: syzbot+0b456664585fa81a47f6@syzkaller.appspotmail.com, elder@kernel.org,
	gregkh@linuxfoundation.org, greybus-dev@lists.linaro.org,
	johan@kernel.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Subject: Re: [PATCH] greybus: verify the received message size covers the
 message header
Message-ID: <avV8I97uZJgX8Osk@stanley.mountain>
References: <6af55517.a0c627da.5d811.0010.GAE@google.com>
 <20261112082230.33584-1-shishunbo@cmss.chinamobile.com>
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
In-Reply-To: <20261112082230.33584-1-shishunbo@cmss.chinamobile.com>

On Thu, Nov 12, 2026 at 08:22:29AM +0000, Shunbo Shi wrote:
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
> allocation, triggering a KASAN slab-out-of-bounds report.  When
> header.size is zero, kzalloc(0) returns ZERO_SIZE_PTR and the
> same read dereferences an invalid address.
> 
> Verify msg_size >= sizeof(header) in gb_connection_recv() so that
> the "Caller has made sure we at least have a message header"
> assumption in gb_operation_create_incoming() actually holds.
> 
> Fixes: d90c25b0a279 ("greybus: let operation layer examine incoming data")
> Reported-by: syzbot+0b456664585fa81a47f6@syzkaller.appspotmail.com
> Closes: https://syzbot.org/bug?extid=0b456664585fa81a47f6
> Signed-off-by: Shunbo Shi <shishunbo@cmss.chinamobile.com>
> ---
>  drivers/greybus/operation.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/greybus/operation.c b/drivers/greybus/operation.c
> index 7e12ffb2dd60..da53c0e026f0 100644
> --- a/drivers/greybus/operation.c
> +++ b/drivers/greybus/operation.c
> @@ -1047,6 +1047,13 @@ void gb_connection_recv(struct gb_connection *connection,
>  	/* Use memcpy as data may be unaligned */
>  	memcpy(&header, data, sizeof(header));
>  	msg_size = le16_to_cpu(header.size);
> +	if (msg_size < sizeof(header)) {
> +		dev_err_ratelimited(dev,
> +				    "%s: invalid message header size (%zu < %zu)\n",
> +				    connection->name, msg_size,
> +				    sizeof(header));
> +		return;
> +	}
>  	if (size < msg_size) {

Combine the conditions:

	if (msg_size < sizeof(header) || msg_size > size) {

regards,
dan carpenter

>  		dev_err_ratelimited(dev,
>  				    "%s: incomplete message 0x%04x of type 0x%02x received (%zu < %zu)\n",
> -- 
> 2.53.0
> 
> 
> 
