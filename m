Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793698105;
	b=R8A5O7unq6TyK/0RbCETMGJ0XcBqUJlGA+NASeFH+d5gWG5tNmbh899h0+3d/y6mpzD9
	 XXKdTZhs+/5hGQmZz868VExo7PN0ocyfZ5MUOekTepFOLzrnVNL6EdrC/n1oOa1rawWMj
	 HuMLVIuRk3Rkkxof+OVdOswW2KoV6KkEPz4ayzqFO+wPk9Qt54/Fku5pubSuIkitd0Rin
	 7OQrG8YLIwMf4STm97GMPGK53jbxKLh6New6pol3FzE/XmXdzqQVtQjz8QTUE80JJ3uUs
	 QY9o8R5fx+sQaiAn5ATqFxmfHH2DpJSyqXM5QoMH877tYA6lVYWoc9+Lct8SC0IaOrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793698105;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=rJxzKiW1QrwhdtV25TvjUmW0XRnbnGbKhj6Wgjpusvk=;
	b=2Uidq4jDPSoK920+Iw4/VYdorsLchD235il5MaR+U3q99ODSQh3YrBo1btbHMvOcNblH
	 WHTXmPnqMuASIMHIv+7VaGK97n7ioA42gT/SiyoHDx4MJIH3JyA+kg/scxj8STajz3nrs
	 GPcEdzNQGKj2XWDcS1Mf2OsJVJopFYPDYPKQh+jHpSPGcsi01RBSeaRc4rBisor2+LMNR
	 X3Q/pY+dzyemDPL4i+mYhJJtM7E1bc9B0v+YJE5a9w2lJvrHaB6yU75ZLVInuHF43ir9l
	 JTVZYSEgx/79locegxkjVWYKbuagxDDWuvo6PTORIF1nN8FD+ZZ1w4+BkLeIByJT78A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ngy2Bx4M;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D77F606A32F
	for <linux-staging@lists.linux.dev>; Tue,  3 Nov 2026 09:28:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D77F606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ngy2Bx4M
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a214af2076so29809325e9.0
        for <linux-staging@lists.linux.dev>; Tue, 03 Nov 2026 01:28:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793698104; x=1794302904; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rJxzKiW1QrwhdtV25TvjUmW0XRnbnGbKhj6Wgjpusvk=;
        b=ngy2Bx4Mm6bQD0VBplehnxbW+UYaYDVds7p1Q+/FXCDkfJiMrQbmglqoj6avxqIRSP
         g5BMf52SowhelGHDjLlkwnaOmYxRRsObrXzvKSYtDdSBx07y+xgk/u2kw+kR1zqNTuZv
         AsTjw3UTdUwi/sJlGwXQyyggy8F3LiYroQKiwBJtRSfJjrkQsyocCDlGexBEhc/dZJpZ
         RlCJH5OKoyVV6xV/IvsNX8vXH3xSQCQvuKk72SkvdsfsGzijaxmNhiQ+FfRmla6OF4BU
         f5yFb/BboNncY4/DVfquydu++jf6GUZoK6ECk9MT1k0QoBSKp3+qNiveVV/99jGVrYPz
         B4Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793698104; x=1794302904;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rJxzKiW1QrwhdtV25TvjUmW0XRnbnGbKhj6Wgjpusvk=;
        b=xEWSE/gpEL0AnfumUJyeHhMuC3pm9hhRvgDs23aNpDjLxB1fE6MPhw/tpuOStdNIMD
         eeFp1yFZv5wray2wijI9wKJvdhngETqq90bLjGN7WuwWtV2gV5fkA9fhv3DLPjWP3fwD
         zyyVYRzu5bgemqo/NWzrMM7JHjCGEbL8oTuIcONdapikqMqaqw8d3GlHKJu9l+hNkDes
         JVUdr1jjcy9XYJav0dD6GG8q/YL66oLiPeS9Cr0zFkVQbBarTIRNkkNQ0FxRpDyf1GNZ
         O+u4YluFTzVwvYUHjF9yVdPykFM5kaRziWWt8kYMpk18qvfBAgFBM5Pzkyx/ahe+VYhA
         u7xw==
X-Forwarded-Encrypted: i=1; AKwUvBwjc28L0iwO6irRuKvaywZ8PI3DX+A0N/HoATHkWekXfDLnHAxfXeBmPnOY3MjBReK+DUmm33qOF2ozPDHU@lists.linux.dev
X-Gm-Message-State: APuU4Z+/20cJn3pqbMgcA/0SwD+tdcgvijT11vcYwknOQ/rzB5jJ5a5E
	nFA/G5P3NK5XAEaw9N65IIYagovVRJ4235I3cRh1/6aLOQAI7HtEd0od
X-Gm-Gg: AYBFou2f4CQysqIkgW4e86l4YtiRwY++HdK4LnYd/8OQqjeiqD1MQzWuD0sAQDy+Pev
	E9TSaLp5JK6IN2fiOAZyQK+46t/Kp22DFCZ0Z7DOm+c+bqpgIUWXKJWvusYnvAJroL4coeGYKqA
	vKF7fitqEkmS6D+RCNEfusuX2rVDxdUHqxl11tDpolW8ESKvGO9Xtm2INdGjIoKpRyaKp3mIS7x
	BKEGlmZYNVXLFiQ35FmvlvcQ0y1QlBC2k2Fj6JJYlAB2B+V2ItC1KQ8sRJAb9uixG74B4PsICp6
	YdOzh//TDjS4+Q5XfXT2QKlu+Y5tZ1a7UWyPC02D56V4ZRf0WNOSCXrPEFGua2ez2tBW2SlwEjW
	6KrzyKxpU2dH3niB4Iq8IkRUSF5X1uApTcxkDaULAOYfakQmc8KqpWt6dPXREJuVt/iAhWi1Ocd
	5Jw/BzdvtfVfGuV8AY823II2ieNoUkpKnfbuaBQhjIOUvrrpFoXJmouKQseKJzezRBaVj7Oq+BH
	aPvZ4c+8XnybNfRmied0XhpOZ7Yu6iFckWmitQ/bBM2LlAKn8MhSTJ1tl1CiOXVAtrqUsWld9E2
	ILCyCLuh43GLtEzqD60lUAKjVRPot+XM/3IcoBYjWr59Vc22zlcNi7m8H0Qip/+IQc7D6QtQDRg
	v+7sayCfwu+VdK9gES+73bf9UvJiiM4hKSBLAKhHx/LG+P4an02NPSrsK0kR57IXP+Q==
X-Received: by 2002:a05:600d:82f2:b0:4af:c210:5b3f with SMTP id 5b1f17b1804b1-4afc2105bf0mr185589865e9.24.1793698103693;
        Tue, 03 Nov 2026 01:28:23 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2a922c298sm38522655e9.9.2026.11.03.01.28.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 01:28:23 -0800 (PST)
Date: Tue, 3 Nov 2026 12:28:19 +0300
From: Dan Carpenter <error27@gmail.com>
To: Johan Hovold <johan@kernel.org>
Cc: Alex Elder <elder@ieee.org>, Maritu Hone <marehone12@gmail.com>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Bryan O'Donoghue <bod@kernel.org>, greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev
Subject: Re: [PATCH] staging: greybus: uart: fix heap buffer overflow in
 gb_tty->buffer
Message-ID: <aumpM9Hlh40t9UZd@stanley.mountain>
References: <20261102195332.19860-1-marehone12@gmail.com>
 <f3848ac6-a105-4581-8f17-fc9d3f748b74@ieee.org>
 <aumfB5MLWIQuTYY3@stanley.mountain>
 <aumlkgtsSDS1fw4g@hovoldconsulting.com>
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
In-Reply-To: <aumlkgtsSDS1fw4g@hovoldconsulting.com>

On Tue, Nov 03, 2026 at 10:12:50AM +0100, Johan Hovold wrote:
> On Tue, Nov 03, 2026 at 11:44:55AM +0300, Dan Carpenter wrote:
> > On Mon, Nov 02, 2026 at 03:33:58PM -0600, Alex Elder wrote:
> > > On 11/2/26 1:53 PM, Maritu Hone wrote:
> > > > gb_tty->buffer is allocated once in gb_uart_probe() and reused for
> > > > every outgoing chunk as the backing store for a
> > > > struct gb_uart_send_data_request:
> > > > 
> > > > 	struct gb_uart_send_data_request {
> > > > 		__le16	size;
> > > > 		__u8	data[];
> > > > 	} __packed;
> > > > 
> > > > In gb_uart_tx_write_work():
> > > > 
> > > > 	request = gb_tty->buffer;
> > > > 	...
> > > > 	send_size = gb_tty->buffer_payload_max;
> > > > 	if (send_size > gb_tty->credits)
> > > > 		send_size = gb_tty->credits;
> > > > 	send_size = kfifo_out_peek(&gb_tty->write_fifo,
> > > > 				   &request->data[0], send_size);
> 
> > Wow..  Heh...  I have read both the original message and your
> > message and I still have no idea which function contains the
> > actual memcpy() overflow.  :P
> 
> It's the kfifo_out_peek() in gb_uart_tx_write_work() that may write 2
> bytes beyond gb_tty->buffer (as its size is currently just
> gb_tty->buffer_payload_max).

Ah, right.

The right way to fix this is to have a commit message that
says.  "The gb_tty->buffer pointer is supposed to hold a struct with
a flex array at the end, but gb_uart_probe() only allocates enough
space for the flex array so it's two bytes too small.

Part of the reason for this bug is because it uses a void pointer
instead of a struct pointer.  Clean that up as well to prevent
future bugs."

Please send something like this in v2.  (Send exactly this code
but edit the commit message if you want or leave it as-is).

regards,
dan carpenter

diff --git a/drivers/staging/greybus/uart.c b/drivers/staging/greybus/uart.c
index e1b73db6a17c..7d1985d63482 100644
--- a/drivers/staging/greybus/uart.c
+++ b/drivers/staging/greybus/uart.c
@@ -43,7 +43,7 @@
 struct gb_tty {
 	struct gbphy_device *gbphy_dev;
 	struct tty_port port;
-	void *buffer;
+	struct gb_uart_send_data_request *request;
 	size_t buffer_payload_max;
 	struct gb_connection *connection;
 	u16 cport_id;
@@ -230,7 +230,7 @@ static void  gb_uart_tx_write_work(struct work_struct *work)
 	int ret;
 
 	gb_tty = container_of(work, struct gb_tty, tx_work);
-	request = gb_tty->buffer;
+	request = gb_tty->request;
 
 	while (1) {
 		if (gb_tty->close_pending)
@@ -775,7 +775,7 @@ static void gb_tty_port_destruct(struct tty_port *port)
 	if (gb_tty->minor != GB_NUM_MINORS)
 		release_minor(gb_tty);
 	kfifo_free(&gb_tty->write_fifo);
-	kfree(gb_tty->buffer);
+	kfree(gb_tty->request);
 	kfree(gb_tty);
 }
 
@@ -842,8 +842,9 @@ static int gb_uart_probe(struct gbphy_device *gbphy_dev,
 	gb_tty->buffer_payload_max = max_payload -
 			sizeof(struct gb_uart_send_data_request);
 
-	gb_tty->buffer = kzalloc(gb_tty->buffer_payload_max, GFP_KERNEL);
-	if (!gb_tty->buffer) {
+	gb_tty->request = kzalloc_flex(*gb_tty->request, data,
+				       gb_tty->buffer_payload_max);
+	if (!gb_tty->request) {
 		retval = -ENOMEM;
 		goto exit_put_port;
 	}
