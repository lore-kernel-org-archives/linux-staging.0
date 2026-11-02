Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793655243;
	b=JQSGxmgHRGS4yP+wMV/lmUGJtqGYsDfkbZYe1pBH1VXiE91OTR1RltLbNVVUQjMVEhFi
	 FsU/QtyZsaK1VJFUUC/EmeUvr/EfzRcupnMbeBJBE4zQ90KfTIcHnnn/lQgVkFck4ubuy
	 YVTYTjaKcttPuKwFe+QB3mTo5zzSxKYbp9NA8oLnYwQ1bwz7lpSepr5So4EZiPY1O0gv6
	 Y/iJGmY4jo7iipznPCLRV+b3LB4dkmui2pSIhr9KOAP1TsxwWxbZBNk7slNm3/KwjN9HQ
	 njgR7xUifBfOpLHxQ2R7vusGpH/o9Hn3qLhZRuFc4VDlXckBFPVudvrTjXmru4iq6bg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793655243;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=t/Msy0dXqNw0HhDTL8dZmKlbwkYbGOrBXfiz4h4optI=;
	b=lR+rJ1G0VMzMItej+/ctIuEGk5iDFJt031l7/5PB5i0KytcGENuLkpvqESHcwX9zx6Hb
	 sI37WeX7rsx3s2K/LguA2Uk5MpZj0rxVkAgO/c19rODr3T9p37+uC3A2kfAbsFsMA5MzK
	 2jyC3vk42Lt7B2xe+T20odcMbvyatmorslqC8zLSa+CvxCntuiDDtB7uYvC/krti+GWC9
	 1hgqzYWBC12taqd2VlyKfm5O6Zpbu4f+85ywDSNLInpEAMPG/HIBMUsnq0lzKGZcLWnXK
	 gDfb4dfiMXHq4eeZItLXsQzZHgFcP3KaqedMNVcrK1yG1EeNPFfwKD2/GjOIAEaCnoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ieee.org;
	spf=pass smtp.mailfrom=ieee.org;
	dkim=pass header.d=ieee.org header.i=@ieee.org header.a=rsa-sha256 header.s=google header.b=NM2ev+Xi;
	arc=none smtp.remote-ip=209.85.161.42
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EA5F606A326
	for <linux-staging@lists.linux.dev>; Mon,  2 Nov 2026 21:34:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5EA5F606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ieee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ieee.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=ieee.org header.i=@ieee.org header.a=rsa-sha256 header.s=google header.b=NM2ev+Xi
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-6f5a0893610so2927739eaf.1
        for <linux-staging@lists.linux.dev>; Mon, 02 Nov 2026 13:34:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1793655240; x=1794260040; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t/Msy0dXqNw0HhDTL8dZmKlbwkYbGOrBXfiz4h4optI=;
        b=NM2ev+XiHUILGHMw6wGXSYHq9XrWJVa96XBsGDNOLS0ZbDHdya9Wna1a6vV/ZiQOA3
         PCCIHdqdjglMbVuKt+rVMT4dOR1AazDDoxPeAKKO30aSN2wbmBHn7GV/5agtWYuiZNSS
         f+UUoTYuorYkKTOApFHwabvgHQKPv9knVU7jc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793655240; x=1794260040;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t/Msy0dXqNw0HhDTL8dZmKlbwkYbGOrBXfiz4h4optI=;
        b=v1DTJ8LIwqp8QQfPSxWt326DYgaBqROyy8e7IDG29CTKU5HSjOf81F563SsejiWqNf
         KqS+EqXUnoYmHRa+xWn1ftE5RUZS190b0+CG32y+aikS7BRytA8UrSCg+1b5rVfNwvuc
         e0JLGE+YV0rLjcjm0+uRLrbkfFL2G8VgKhvS0UNymWfM95pcNgwVKzYYMxwaugqZ0Qf8
         IPFXAFP7G7vQsMfq2Fs9JHPJq2rvqbV9ykOdXeuMA8ShbMrQjOzyJpbzC3Qega4+extk
         fdzqdXd+NepMYpyTe480gflaEcca3EkfhLASeX6VKRpbPChCDFJyRaCFMToCa3iiY0Xm
         OxLg==
X-Forwarded-Encrypted: i=1; AKwUvBzDdGEoLgvlzI1m1YHP7LK4sVztEm0vj1+M9wd7/j2oXYCGRfsxK5n96is3QH+vmFc2Yf4lFt8bf/Psgf7l@lists.linux.dev
X-Gm-Message-State: AFq9FYIb6NJrUOQnviBKpdkhxqwAmafWjDfZePxpXbgwQtyCa999GePm
	w/VJvNTfe+6bCCHWBJls+uSgr6GDoPpzj+i1Z85xN2I7yTXyPHOLiMCOSEOtKy7plw==
X-Gm-Gg: AYBFou1ECLyVJ7uSPYGe9VQUqJ16R1+YmtabwyRI3v/imJAofEIn694C83+Ie0QjMoC
	egWQTibsq6n+SGwHHjQxLHCNHoYy8haQARPZknKOT59BK8nX+s/DPIov+U08b+dbu7ihh+cimWI
	WRbZ7JKgazfT0dkSID1AJGXfUjhpMlJKOGsRDtA/OZ/1kBMRO7lK4pOKTyVrdfK/ZQePsZZQWfH
	QlT8CJEjARy+8sUL4vwICMaPCNlSDhw98eaTDWAqLFNCanoiyGkO+NW9I27XqbZ0ULM1o9pVxel
	vmaSw64q3dS2kK7kLQh/psHPCzwve2jy4IN8FLInzmqI1eEMtDqaWj4nosb3i4PAaQ6OmDuI/XH
	3RYXOaMGhrdTCVQcwHc33JedN/VZ9Duz80ZGmsO6dHdZdgm3ZOz2l3V84Zy5D+4aBYkQMi5e9w3
	oSEGT3dBXLFcFhJnz3tbYw2Wb1sxMQJMRQLM9o4Kj4h6hYN3D321CDgM6T8BJcvxjTolTiHvYJu
	Tu4ZO7O8zwrG15amQrs9q/C1jf97/pWLTtVbrM7B50xWlqaE3c/AdOm+msXiPW/zApdL14eGhQW
	CHNCDnTF/7XS6l1azFBONp0=
X-Received: by 2002:a05:6820:603:b0:714:b1a7:fc04 with SMTP id 006d021491bc7-714f2afa5a2mr5661602eaf.86.1793655240332;
        Mon, 02 Nov 2026 13:34:00 -0800 (PST)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.googlemail.com with ESMTPSA id 46e09a7af769-85d351e841fsm10996149a34.1.2026.11.02.13.33.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 13:33:59 -0800 (PST)
Message-ID: <f3848ac6-a105-4581-8f17-fc9d3f748b74@ieee.org>
Date: Mon, 2 Nov 2026 15:33:58 -0600
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: greybus: uart: fix heap buffer overflow in
 gb_tty->buffer
To: Maritu Hone <marehone12@gmail.com>, Johan Hovold <johan@kernel.org>,
 Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Bryan O'Donoghue <bod@kernel.org>
Cc: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, outreachy@lists.linux.dev
References: <20261102195332.19860-1-marehone12@gmail.com>
Content-Language: en-US
From: Alex Elder <elder@ieee.org>
In-Reply-To: <20261102195332.19860-1-marehone12@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/2/26 1:53 PM, Maritu Hone wrote:
> gb_tty->buffer is allocated once in gb_uart_probe() and reused for
> every outgoing chunk as the backing store for a
> struct gb_uart_send_data_request:
> 
> 	struct gb_uart_send_data_request {
> 		__le16	size;
> 		__u8	data[];
> 	} __packed;
> 
> In gb_uart_tx_write_work():
> 
> 	request = gb_tty->buffer;
> 	...
> 	send_size = gb_tty->buffer_payload_max;
> 	if (send_size > gb_tty->credits)
> 		send_size = gb_tty->credits;
> 	send_size = kfifo_out_peek(&gb_tty->write_fifo,
> 				   &request->data[0], send_size);
> 
> request->data starts 2 bytes (sizeof(request->size)) into
> gb_tty->buffer, and up to buffer_payload_max bytes are written there
> whenever enough data is queued and credits allow it. That needs
> buffer_payload_max + sizeof(struct gb_uart_send_data_request) bytes
> of backing storage, i.e. max_payload bytes.
> 
> gb_tty->buffer is allocated with only buffer_payload_max bytes:
> 
> 	gb_tty->buffer_payload_max = max_payload -
> 			sizeof(struct gb_uart_send_data_request);
> 	gb_tty->buffer = kzalloc(gb_tty->buffer_payload_max, GFP_KERNEL);
> 
> so a full-size write overruns the allocation by exactly
> sizeof(struct gb_uart_send_data_request) (2) bytes, corrupting
> whatever follows it on the heap.
> 
> Allocate max_payload bytes instead, which is exactly
> sizeof(struct gb_uart_send_data_request) + buffer_payload_max, so the
> buffer is large enough for the header and the full data payload it is
> used to hold.
> 
> Fixes: dd1c64ede97f ("greybus: uart: kmalloc for send_data once only")
> Signed-off-by: Maritu Hone <marehone12@gmail.com>

I think I understand what you're saying, but it took a bit
for me to follow it.  I try explaining it in my own words;
please make sure it aligns with what you mean.  I think it's
also helpful to explain how this issue was found (by a tool,
or by inspection, or through examining the corruption that
was produced as a result of this).


The UART Greybus driver allocates a single buffer to be used
for all send_data operations on a connection.  It allocates it
in gb_uart_connection_init(), with a size allocated to be as
big as possible for the connection, but the size used is wrong.

The error is in gb_uart_connection_init(), where the buffer
size is computed and the buffer is allocated.  There, the size
of the buffer is computed to be the maximum size of the data
portion of a gb_uart_send_data_request structure (*without*
the size field).

The problem occurs in gb_uart_tx_write_work(), where the buffer
is cast to be a gb_uart_send_data_request structure.  That means
the buffer contains a *full* gb_uart_send_data_request structure,
not just that structure's data portion.

You're saying that the buffer size calculated in gb_uart_probe()
should be max_payload (the maximum operation message payload
size), not the calculated buffer_payload_max value.


I think I agree, but Bryan should confirm.




I will comment that sizeof(struct gb_uart_send_data_request)
should never be used, because it contains a flexible array
element.  Instead, flex_array_size() should be used, for
example:

     struct gb_uart_send_data_request *request;
     size_t send_data_min_payload;

     send_data_min_payload = flex_array_size(request, data, 0);
     buffer_payload_max = max_payload - send_data_min_payload;

I'm not sure flex_array_size() was available when this was written.

					-Alex

> ---
>   drivers/staging/greybus/uart.c | 10 +++++++++-
>   1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/greybus/uart.c b/drivers/staging/greybus/uart.c
> index e1b73db6a17c..7bbac2603726 100644
> --- a/drivers/staging/greybus/uart.c
> +++ b/drivers/staging/greybus/uart.c
> @@ -842,7 +842,15 @@ static int gb_uart_probe(struct gbphy_device *gbphy_dev,
>   	gb_tty->buffer_payload_max = max_payload -
>   			sizeof(struct gb_uart_send_data_request);
>   
> -	gb_tty->buffer = kzalloc(gb_tty->buffer_payload_max, GFP_KERNEL);
> +	/*
> +	 * gb_tty->buffer is reused in gb_uart_tx_write_work() as the
> +	 * backing store for a struct gb_uart_send_data_request, whose
> +	 * variable-length data[] field holds up to buffer_payload_max
> +	 * bytes starting right after the struct's header. The allocation
> +	 * therefore needs room for the header plus buffer_payload_max
> +	 * bytes of data, i.e. max_payload bytes, not buffer_payload_max.
> +	 */
> +	gb_tty->buffer = kzalloc(max_payload, GFP_KERNEL);
>   	if (!gb_tty->buffer) {
>   		retval = -ENOMEM;
>   		goto exit_put_port;

