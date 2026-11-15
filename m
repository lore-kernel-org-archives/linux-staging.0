Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794754570;
	b=N5PRdLiHWiY7k+Fvu0qmUOfOnzOIZvFZ7OufMUVeZXHxP0Sz37ccu2Wtc4ZYW4PaicPb
	 UqXfm7mrB2QFgsVEnM6TmpfQfRar1zICwG7s5CvDeDfXqaE1zYDlFfjcUIB5xWCuw31Fr
	 MQVfocyJmXAfyaC6TCOpZ+Og8teGPnGNknCL6dEk4GKHoNmaMayynCDqce9S+fbvUWZre
	 nRsFav890qZVi8UTimfJorJZOVkFsM/2FmBizKYZSCTiIOo+4qJXpExAKJhJmVcdtuCy+
	 19VuUDTxpTaXpQXHvNJLCs96dfaR1gJzBR2QkcZwszDfZ3T+SNenWiqrFjWo6mPxmUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794754570;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=66KrluPErA73yZ5oWO4/Se+YF4oLxRzv02FOs2NcGy0=;
	b=nvRXk0BB17LTi2C2bYsb6VusAneVkE08TJD7oreBXiaOa/QG/qVnq6CVLBMGMtu2hSCm
	 R4FFlfNmhHIA+zIvohSdHoTUaj3ve8ptKQx7HdETxVjv7LKdid66S7KLMMvMX1C4VDgiD
	 iAFWNZv7BfH2JoNCNMaiig8ZJ6mL9g4TCiYJnDVD7cpz+1DvwIj+soKkh3cud2tyTRHx/
	 7BW6imxZRzQjC8SW89813svb08fsGMeXqEZ8+zUhJrxPZyc3etfb/CQYVAkEHMeLXy47P
	 BNS239PZ44n+aY4BkYwZUlxHWlYuFnQUF9i6TdzAfYRsi4M1cy3HVsoIe6Xxv0m4tdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ieee.org;
	spf=pass smtp.mailfrom=ieee.org;
	dkim=pass header.d=ieee.org header.i=@ieee.org header.a=rsa-sha256 header.s=google header.b="ZALu6y5/";
	arc=none smtp.remote-ip=209.85.210.51
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A50C4606A323
	for <linux-staging@lists.linux.dev>; Sun, 15 Nov 2026 14:56:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A50C4606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ieee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ieee.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.a=rsa-sha256 header.s=google header.b=ZALu6y5/
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-86210f31496so2290684a34.2
        for <linux-staging@lists.linux.dev>; Sun, 15 Nov 2026 06:56:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1794754568; x=1795359368; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=66KrluPErA73yZ5oWO4/Se+YF4oLxRzv02FOs2NcGy0=;
        b=ZALu6y5/Us9wtnUEhXLrY+JpnY+Rs6nGC4q0QL6BYQe/MhMBlyG+HzaaWrCmG7sED2
         ZdXQRNIC0J4JbfD+ZDtdYPznIF9FKbbw5b70/sf9ilU9vt3Wp3174xXW6vBoKNcFMoav
         cwcCw/s+lMOozoy4xKw9WlShBSUd7P75sQFXQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794754568; x=1795359368;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=66KrluPErA73yZ5oWO4/Se+YF4oLxRzv02FOs2NcGy0=;
        b=PwAyjWcJp28+YqmguIJbW0fL+pK898YEVbEu4GRejQu+esmekKAynj7qOCPd2DW9DC
         HC/jDXQ4TdeLvW6Y5KhqqfZblnwX4Nm+Ik0NuiBFtESZJlsCZ9A+QfNWe2hJboMH+3B7
         K4RBNkyCs+tC+abdn7BaEHcXUX7AWwUhiA/TLEthKQW9SIE6tk9DKXxhVsZGxPnvP1CE
         yFGWPzsePyeHraKfSELds7seENqnSMfC7OpiQtpNP0a6ddFqJ65zcjRxhdu6Bd5JEetQ
         KssG+AQ0pHWViuPdANGbLhHfdMG4oH7bxN9pbsw3wXhUc9hRN7MvH2prsGBLSMCS0itW
         B77A==
X-Forwarded-Encrypted: i=1; AL+hErHivwn8vxW6zL4xSXt5oLqvWo8UiBJ0VfRzclbPnGfQOvlNY9loBgcHvx+94t3bLL/85tLpYoZjKscMkf9g@lists.linux.dev
X-Gm-Message-State: APuU4Z8TN/vjOpHmCPCyM8f0WYI8OqrhEtSWVtLPkrBBSjNW9l+iYx+b
	gAXTEq6CVzg9/CfFNPRxvF8wvlQ/DeSn6bKzqx8AhAFMQ4+2rtTtofcLnF48NlbG5A==
X-Gm-Gg: AYBFou2Ds4PNSKgvB3Fybwn5PA0O8uJmkNgiL7XKamO58rO//gsyC1+lA0w0197+ejz
	+T219OmPOS3iTgDCou3FvZTPXnEmJ4650IWvK0JJsOALG6/kclw4UHPLePgYQe6ilGMuDAIi10V
	szW7Ga86U9dl1wqOnOr5xQCuunb3mD3VSjSOcU22pyJ7k2ygipdR8xWIntiUtjn1aJ40BKgMMWa
	5wUfABrrb3IcpVCVV6owXtW3JZd4xIbC9zsAKYzmnxY8TB0NsZ+8VHZapEE94wktSx4Wttr24BF
	L2uo33vcvBHg9IoJtT2C8ckYVx4VYGEVzW4S93w6nCNGNVXIvRqBYo5ELXJFnOCp6CxAQmwrMQJ
	vpyxFGmdIyYHEUNCPEw2TTPSEDtHwf/Ga0OlGrbUGdIzEYbDI42clsJNbmZjtr9ugQHY9heB3eI
	mNCNxTSaOGXlFHBdZZBT/9we3t6LHB8CBi7xcL7IGpz4YUeDhPx88N9YDGR3pdA3uSSFMCV8NwQ
	aEyn1fgLbqjNOTNoveWABMt9c1Oy6zK3iauchIiCMqbIHSfN4oxBEVU9NYfV3UbpFakNuCdalGD
	x+R3ysd5t6ifFwuY6MPtVPTW
X-Received: by 2002:a05:6830:3495:b0:85f:31f:7643 with SMTP id 46e09a7af769-8628981ad1emr8483076a34.7.1794754568555;
        Sun, 15 Nov 2026 06:56:08 -0800 (PST)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.googlemail.com with ESMTPSA id 46e09a7af769-8628812e44esm8317981a34.15.2026.11.15.06.56.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 06:56:04 -0800 (PST)
Message-ID: <b304a5dd-f6b9-4cd8-9d2a-8ca398119a41@ieee.org>
Date: Sun, 15 Nov 2026 08:56:01 -0600
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
Subject: Re: [PATCH v3] greybus: verify the received message size covers the
 message header
To: Shunbo Shi <shishunbo@cmss.chinamobile.com>, dan@pereq.eu
Cc: elder@kernel.org, gregkh@linuxfoundation.org,
 greybus-dev@lists.linaro.org, johan@kernel.org,
 linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-usb@vger.kernel.org,
 syzbot+0b456664585fa81a47f6@syzkaller.appspotmail.com,
 syzkaller-bugs@googlegroups.com
References: <avV8I97uZJgX8Osk@stanley.mountain>
 <20261113234739.1432-1-shishunbo@cmss.chinamobile.com>
Content-Language: en-US
From: Alex Elder <elder@ieee.org>
In-Reply-To: <20261113234739.1432-1-shishunbo@cmss.chinamobile.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/13/26 5:47 PM, Shunbo Shi wrote:
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

Looks good!

Reviewed-by: Alex Elder <elder@riscstar.com>
> ---
> Changes in v3:
> - combine the two separate conditions and unify the error message
>   as suggested by dan. Thanks!
> 
>   drivers/greybus/operation.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/greybus/operation.c b/drivers/greybus/operation.c
> index 7e12ffb2dd60..74429f3745bb 100644
> --- a/drivers/greybus/operation.c
> +++ b/drivers/greybus/operation.c
> @@ -1047,9 +1047,9 @@ void gb_connection_recv(struct gb_connection *connection,
>   	/* Use memcpy as data may be unaligned */
>   	memcpy(&header, data, sizeof(header));
>   	msg_size = le16_to_cpu(header.size);
> -	if (size < msg_size) {
> +	if (msg_size < sizeof(header) || msg_size > size) {
>   		dev_err_ratelimited(dev,
> -				    "%s: incomplete message 0x%04x of type 0x%02x received (%zu < %zu)\n",
> +				    "%s: invalid message 0x%04x of type 0x%02x received (%zu < %zu)\n",
>   				    connection->name,
>   				    le16_to_cpu(header.operation_id),
>   				    header.type, size, msg_size);

