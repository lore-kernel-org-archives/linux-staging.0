Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793699921;
	b=pB0f4+i6VK/mxYZY9pblXxZXvCx5ke+/aEYO/ex/KWXG3JHCchomEMTPNR7Dw+Ckc4+d
	 9AJ2l4MOBd+3JzsRcCosPEz4zTA1BWqhO9Iu1kbKuWZgcMwIl1zqcKrDY1ecJdwXPsg1+
	 P1WSmYDGPfPylxrF0JG1wxGjvW9km7DvZzVUCUi6d6j7GUx9EOyDzuikNEWWKsEsKlynG
	 oqwcSmMI6iBNYZBmnWNudIi9g9QrY9DpujPEtt/p88Zqff+0eOnHQHZLlUTlKPfhm9FaE
	 EREBY5kyMN81v7yxPxSxsUE6Y2fgosz/lBh+TRtShlMKoKkNMYDVMHApLi760ln5eqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793699921;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=iAKv+yT4A/GjeZOo4+mQtD3Vw+a5YgPIPq1fplJgNtI=;
	b=GmhGn7DkYxq26NTvOIsQffaHDoFvS1gT5SHyQnI4CnqtDcXhMLMno5PuZlHOC5g+y3Nb
	 p7oUKL4xDmAa5tk9ID40d8TvhNCnrRr2JU3Go4C7W85g8/mz8tZlolKNUcjF7PxtYZziU
	 4g+QVQiAHFCa5v4s07eIH3adKHrOggjoKH24/3/1g2Zkuijo7e3MtIKoPzpY1Y/rcn7R5
	 hBGxZw78eEW+PTpyZ8FDAAh9cJS5Vr0uSYPiMmAq6ix33cu0aCGRhaQ3eScHvF6hSJvsK
	 jBZgHm+3ez+UErW5b0oQnd6//P6CW7yjLW+AeynInAPzBc01/0JnxMN8Vn8eLZe/gVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=F6tysFMp;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACD92606EE9C
	for <linux-staging@lists.linux.dev>; Tue,  3 Nov 2026 09:58:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ACD92606EE9C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=F6tysFMp
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48e46e449e8so2408451f8f.3
        for <linux-staging@lists.linux.dev>; Tue, 03 Nov 2026 01:58:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793699919; x=1794304719; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iAKv+yT4A/GjeZOo4+mQtD3Vw+a5YgPIPq1fplJgNtI=;
        b=F6tysFMpivoFNhXuDPcNCda+5fQzNs1aOd7yhN+LRUbGK7TD2Iji5ptcbIY62Gk6nQ
         s9j5jOYbRo0CY94acPZwznR7R28TONQ8avTZdK3TWdprb/0JWTHXvqoEyu4VMaCzKwg/
         qD/EP5SnJ3Csd6ScznR9WuX9cpVBNok1YIQLUp8TQQjjFfX6byM5PlTEG+L+CSpUH4wH
         JuDk29XmuUfsiI02nIXJPppRzy0CstHoUgrKjHVflUBqWS8gTRb0/6u5fRqzDuSMHakg
         V9w+NeG6QgVqutdoJU+TuAAtUf9kH2B9U6+fGgMWq4oxlvNF0HjG325G35qJK0UhS4QU
         2QyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793699919; x=1794304719;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iAKv+yT4A/GjeZOo4+mQtD3Vw+a5YgPIPq1fplJgNtI=;
        b=kMGrxMRDCzC/xmEABTGQv6LCogOFfqUKhIy0wIiXn+6d60z/7JvH8uSjm7tGzmkZKp
         38XTtnzdplXww1tLR/yoho9R067HoJ2hrXfOHsMGawu2BJrrVkA5Q+duDrdV4brnjrhg
         YELMjQA0lcWsR5wD4QAe7VHwJqeRdqxZGriz8Lpon7SBS3HShuRvjmV2ZDHJYa8L5UIk
         HBSQX1vhRLZeN7JX7shwIIHtXbk9pbsZwnRVHdPtIj7EznMNNfn12rmlmdFaqZGDKhHq
         6qhQwdNOxv8Yi/jwGbZfcRbvsLjNGEtK8ER24Qk6f6dd2fg4OphpGWS6KQm76LeQt2rP
         8TUQ==
X-Forwarded-Encrypted: i=1; AKwUvByZbxSAYRRnlvdxGg4lY7lc3EOcl2qf9gdsikYPm8jDwZ9g3QUlTWbdEG3J/hPKCKjAqIOE8Yy0Uz2jPGHE@lists.linux.dev
X-Gm-Message-State: APuU4Z8/68kZsSN+RLoWSFdsGqqQ6esK3DhP6NA6I0nJgZBrhU/yqA6w
	keHLiZ/4M/h/nmHHMi6vn9CDRUXU22DKJD4VhvnnvV5zlGSWhpPj9pyw
X-Gm-Gg: AYBFou1WenH9/aJMo0n/a4GMJFEKtb07tKcV8R85Qm3g7Y0W6GUTQOjWYryeMa9W8di
	w3Ggdv7ZEIiizFeLemDjmvXe2+ExhBBtlXP46TVZGz+l73CdHmyx1HB1tIWT7W2THN6U++Mcnkr
	y6vspvzpELAShYLboduHTUI+sjNbmwUTUDcCw/7/fIVtP0D9M3EtEa0ZeI6A9inx1zQ/+nvX8mq
	XAonmatAPj1PWYPyARJBnAqWCfW+6BOjaWPlp8KGYGPKciG79uiNxbD4kozmX81dSmAT0lqPkie
	nl8vhhL6VLS++swIcvmdCI87CQV7lomXfqCzoGbHUTiWLqBy89YaLkDHZvfZrVWhYqyptYWZs7U
	lZedR/J2x8Sigii/P+He5216NJuozj9d5AW3WYvcXgvlhQTQ6liYofaxHwVjLinOKuxSK8ZJAhK
	BGz5WsyP/zhmdmdxwRAa+B5hVXyYJ23uthvdF8rAF3Xa+3gsDjwfwgHLxntJFUGcMqYcZPurRFj
	D1u23NY6s5RgJ7RwI1PpIHrWYF76SEaefHqASeaF49xisIWQKzg6OCIqfQ7FlYOn/yeO7Jcn69Z
	eUA4mwWGTxGSm6E+usBbF8ExjuXp/J7BlD/m03ArB7tULsL3flWkeg7wsKqOZ7STA4SiqcVdZnT
	Oa9YE/HOIimsys3mut8o7q1RCekc6NBsIOcAD8o1c2SiA3P6VaKEcDjIaiPCKatqTNA==
X-Received: by 2002:a05:6000:24c7:b0:48d:f460:2c62 with SMTP id ffacd0b85a97d-48e6e50da1dmr29721511f8f.33.1793699918835;
        Tue, 03 Nov 2026 01:58:38 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b964desm23901951f8f.46.2026.11.03.01.58.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 01:58:38 -0800 (PST)
Date: Tue, 3 Nov 2026 12:58:34 +0300
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
Message-ID: <aumwSiYE_EfWGdo3@stanley.mountain>
References: <20261102195332.19860-1-marehone12@gmail.com>
 <f3848ac6-a105-4581-8f17-fc9d3f748b74@ieee.org>
 <aumfB5MLWIQuTYY3@stanley.mountain>
 <aumlkgtsSDS1fw4g@hovoldconsulting.com>
 <aumpM9Hlh40t9UZd@stanley.mountain>
 <aumuFpFQWloRxaqO@hovoldconsulting.com>
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
In-Reply-To: <aumuFpFQWloRxaqO@hovoldconsulting.com>

On Tue, Nov 03, 2026 at 10:49:10AM +0100, Johan Hovold wrote:
> On Tue, Nov 03, 2026 at 12:28:19PM +0300, Dan Carpenter wrote:
> > On Tue, Nov 03, 2026 at 10:12:50AM +0100, Johan Hovold wrote:
> 
> > > It's the kfifo_out_peek() in gb_uart_tx_write_work() that may write 2
> > > bytes beyond gb_tty->buffer (as its size is currently just
> > > gb_tty->buffer_payload_max).
> > 
> > Ah, right.
> > 
> > The right way to fix this is to have a commit message that
> > says.  "The gb_tty->buffer pointer is supposed to hold a struct with
> > a flex array at the end, but gb_uart_probe() only allocates enough
> > space for the flex array so it's two bytes too small.
> > 
> > Part of the reason for this bug is because it uses a void pointer
> > instead of a struct pointer.  Clean that up as well to prevent
> > future bugs."
> > 
> > Please send something like this in v2.  (Send exactly this code
> > but edit the commit message if you want or leave it as-is).
> 
> Looks good, but since kzalloc_flex() was introduced in 7.0 (and this
> bugs goes back to 4.9 it may be better to do that conversion in a
> follow-up patch to assist the backporters.

Yep.  Good point.

regards,
dan carpenter
