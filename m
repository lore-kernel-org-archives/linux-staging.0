Received: from relay3.hostedemail.com (relay3.hostedemail.com [64.99.140.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF6957C
	for <linux-staging@lists.linux.dev>; Sat, 12 Feb 2022 02:59:51 +0000 (UTC)
Received: from omf04.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay02.hostedemail.com (Postfix) with ESMTP id 4CF5123E3E;
	Sat, 12 Feb 2022 02:59:44 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf04.hostedemail.com (Postfix) with ESMTPA id 4CF092002A;
	Sat, 12 Feb 2022 02:59:38 +0000 (UTC)
Message-ID: <56b8e6cfc623d53ebba27ee8afbbec0ece58c816.camel@perches.com>
Subject: Re: [PATCH] staging: pi433: add rf69_dbg_hex function
From: Joe Perches <joe@perches.com>
To: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>, Greg KH
	 <gregkh@linuxfoundation.org>
Cc: realwakka@gmail.com, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Date: Fri, 11 Feb 2022 18:59:37 -0800
In-Reply-To: <Yga7cDO00Hmk9+BL@mail.google.com>
References: <YgYZRArwwF7Z1B4f@mail.google.com> <YgYa8Pt77v6AAyjb@kroah.com>
	 <Yga7cDO00Hmk9+BL@mail.google.com>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.40.4-1ubuntu2 
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: rspamout08
X-Rspamd-Queue-Id: 4CF092002A
X-Spam-Status: No, score=-1.46
X-Stat-Signature: o5mck5eb9tynau44aprb7px6fyuutmbk
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1+H1REJnNkX344apKmkyt7wVWo6oYFGan8=
X-HE-Tag: 1644634778-705267

On Sat, 2022-02-12 at 08:39 +1300, Paulo Miguel Almeida wrote:
> On Fri, Feb 11, 2022 at 09:14:40AM +0100, Greg KH wrote:
> > 
> > This is a lot of additional complexity for almost no real benefit.
> > 
> 
> you're right. I will no longer pursue this approach. 
> 
> > > -	/* print content read from fifo for debugging purposes */
> > > -	for (i = 0; i < size; i++)
> > > -		dev_dbg(&spi->dev, "%d - 0x%x\n", i, local_buffer[i + 1]);
> > 
> > What is wrong with this simple line?
> > 
> 
> to be honest, I think that 1 register per line isn't the easiest way to
> read them. Given that print_hex_dump_debug existed and had this
> horizontal-style priting format, I thought that it would be a better
> way of visualizing the fifo data.
> 
> the only problems with print_hex_dump_debug was the absense of device
> name and string format... so I saw a couple of drivers implementing
> alternative hex_dump-like functions and thought that pi433 would benefit
> from similar approach.
> 
> > > -	/* print content written from fifo for debugging purposes */
> > > -	for (i = 0; i < size; i++)
> > > -		dev_dbg(&spi->dev, "0x%x\n", buffer[i]);
> 
> if we are keeping this format, I may need to add the register idx to
> dev_dbg: 
> 		dev_dbg(&spi->dev, "%d - 0x%x\n", i, buffer[i]);

You could use %*ph with a buffer length up to 64 bytes.

Multiple times if necessary. 

Something like:

	for (i = 0; i < size; i += 64)
		dev_dbg(&spi->dev, "FIFO buffer: %d: %*ph\n",
			i, min_t(int, 64, size - i), buffer + i);

Or for a more realistic length like 16

	for (i = 0; i < size; i += 16)
		dev_dbg(&spi->dev, "FIFO buffer: %d: %*ph\n",
			i, min_t(int, 16, size - i), buffer + i);




