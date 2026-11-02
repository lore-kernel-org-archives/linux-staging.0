Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793621172;
	b=c6gsd/D6i5+qMCa8zrwE4c5MraNjQgfqeVPeAqojt+B9dPrsW4pR48I1cujtaFiEvjFB
	 BeuDadwd0HkFGG6MJsA5yUUCWPvyl9xR8PfUe3Cc/k+LpNHxBgTX3MFLECHBsgRvoNTlF
	 ar3qZMEWU4i2FDOHG/hc2NHpjzF9GhoZBbomro41+XQHVAbXNsYYAUnfrnf1++BJIM5Cc
	 pLceVegcxrMn75UTdkdr9b1UEes6Dbhk00Si9FJ1gexDbpxG5iw8Zh3yJ4xCF/yxrdL+H
	 NB2mpNIgkAZ7Ikf2voCkwXZKjd1fXmwlSF5DCZPi6M/gbEgjf1xjr24f+KvG3VoXXSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793621172;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=JgQSYzOM8+HGOvzxQgP9NPQLAChpRixPZZ8qdgqKf9Q=;
	b=tgvG67RaarwNAuZJVTsj+AVwmYF5nAI+aPeuS8Xu/MKyMrj/5XGhMpj+pskKzVDBrb2g
	 mknGKFJWLhVlQ8YFd3mlT1ShttK9Ov+LMlQ5B/sjUREuIXKIi9FlmoQ709plwAYLAZHiD
	 XVg4Hk12vD3UmmPVA9JijN0ewIMJZ/ZX1+GC02D7d3VDC/lBPEIaUoy4HvrbOgXzXcZCh
	 MocLyPkEr+dPjbiOVB3h1vR3x+5hhFrGp2bnnImLm8SZxpnHi6mhOMMrzmJFXoH/umJMH
	 wrf1dMJH2kpYiFdqILlZ4vgrSk0zMkt1QA2uD+fHTZh285tWC6SJ5qeMlOBEagZgZdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L+5NakfZ;
	arc=none smtp.remote-ip=209.85.208.45
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 294BF606A327
	for <linux-staging@lists.linux.dev>; Mon,  2 Nov 2026 12:06:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 294BF606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L+5NakfZ
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6b4883643ccso580094a12.1
        for <linux-staging@lists.linux.dev>; Mon, 02 Nov 2026 04:06:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793621170; x=1794225970; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JgQSYzOM8+HGOvzxQgP9NPQLAChpRixPZZ8qdgqKf9Q=;
        b=L+5NakfZe+pfhAdNAvNxeoNihKJn3x6G1Zk6Rve9MhPGbS/l6ZipJS3CvS3fSZyNF9
         yOHx6RxtLv1D+98bjjKBRkoBMQPSk0eVQcjda5kiJLdH4r/GYs6FZx08E+tv5pHhzUik
         L0t4yCP3+tFW59OEVUnlqpzXYnd0Q+4NV7/Doq09fvtDBhokydolL+UHUBJ71JhkkjL6
         epw+wj7Qk62wxAHWBAG7Jd1+0LuAOR69stvCK+83/jJEBgn2+U5tCd2++cEHE6ArdVyv
         BKcyJkgwKtz0CAqa5OFwBlv4IzVmWnYLoZfy3hsJ0OPM/21zH3DLOQmD51OTgARMyBfB
         tXUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793621170; x=1794225970;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JgQSYzOM8+HGOvzxQgP9NPQLAChpRixPZZ8qdgqKf9Q=;
        b=m6kdFMzOphPsm7KPlIH+hSUPmWVFdeVpiqdn+7H++MJmuPSNA69JCSfizNsSvK8VVk
         dBjl3mKTM/GUJfwmc3Ah5DJP0X0/LbQmaKgTb+89W2E2QLCavjgv2o7upo07ijrZHWCI
         WmESMC4n31CBER+iB9QfygVqY36z+XHIV5hNkxiATvfKefAe6VP6CbF4e80mWJCp2LGG
         6rKh7DxRevi4IyBECV5ED3iKF+8TMJPY3CJKUah+ycczOfCwPaoC1iYU+hpUFBtl3j80
         HeAh744rHjJuvubNduHlRpgx4TugKikMe4w6aHrUQqeGTiG4afb5dMc77OR2bs7soJc8
         CpyQ==
X-Forwarded-Encrypted: i=1; AKwUvBwhcM6+aznTuGb5fvRP5UAbF2E64GY6Ei89WUc+vyd2ytR+c/b4E6CbLOKyprKJiQuH2oLeNm+0g9pCy+k6@lists.linux.dev
X-Gm-Message-State: APuU4Z/C7kGsUgH1gvhrqPxjVeMHfzVruKJVFYdn3clnBHFxvj9VPFV+
	aZ44ldeS4vGBAnrfGfd3gG4oaDCpq1GNiZY0gtaxxYiuqClQRx2L2U22
X-Gm-Gg: AYBFou2bhatLlcih/8yTbgsTvwyyGXa+eV0ueUIlcWwa0NCaPkIYWz5eDWzxcJpq935
	6He780/fGRwGbtSe0lutf6yAHfJj7xoF4pk/jxW03N/Vv1BI6nGVmidp5oJX8M5HZCdCFtFuS0d
	EC+BZVQoxMRROGv1oRgMtVzqFzwNIDk9W0agHkuwHxZS7pa2PqZs3mJN4Atlwhp1sUjUYG2EXiB
	zYOxUqDbbq50wjeaG0pMXFhPxf7cphCLHfGLP2ilBpcBifqOhRAhAABS7ixyZ/T61zOyeqwrK6F
	w132WP56odYph3HVwpDhc1pshb9M9gE/T/G9+I/ZGjecei1uVJDFnCkMoB5KQRNOQSfv+GmKk3J
	7rxly7UBeHjazHgL7l2jF8ze/QAYtu++JgDJevwkmHKuJ6VUgPgGoUJqrT2v3g1CcPKLap7Ev7r
	f5vZHQ9rZhLle8YPLFztonAIM0a4xQg3nb8NrZ+OjWT1C2mZKQKKe6N23PYFkVDIIGQMVnP1+iI
	cvV5JrPJMVTIk/YQgPK7LdlRxIQr+uNNgUaIzztdxKAhRsY/RqugL9GzSMld6rHtOd3inadq5FW
	5odbt2fQaEwHXeRT727jDZ/Tt4Ecokz6ygof13rOk2Og/7nPIYjwCpOOZc2tG0rSJyQPahneBRh
	d08VG7ByZjyDvffVmOmz1JgS//GVUzw3+LhlsLxXCGjzakEqDXIB/iaivlX+2GtTGAg==
X-Received: by 2002:a05:6402:1f45:b0:6b4:59d0:7294 with SMTP id 4fb4d7f45d1cf-6b4d4c6fdd6mr6927817a12.31.1793621170371;
        Mon, 02 Nov 2026 04:06:10 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4ec9a6f11sm3136954a12.3.2026.11.02.04.06.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 04:06:09 -0800 (PST)
Date: Mon, 2 Nov 2026 15:06:05 +0300
From: Dan Carpenter <error27@gmail.com>
To: Maritu Hone <marehone12@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com
Subject: Re: [PATCH] staging: axis-fifo: fix integer underflow in TX size
 check
Message-ID: <auh8rTgLTGuSUJM9@stanley.mountain>
References: <20261102114451.54579-1-marehone12@gmail.com>
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
In-Reply-To: <20261102114451.54579-1-marehone12@gmail.com>

On Mon, Nov 02, 2026 at 02:44:51PM +0300, Maritu Hone wrote:
> fifo->tx_fifo_depth is an unsigned int parsed from the devicetree
> property "xlnx,tx-fifo-depth" with no lower-bound validation.
> The
> write() packet-size check subtracts 4 from it:
> 
> 	words_to_write > (fifo->tx_fifo_depth - 4)
> 
> If tx_fifo_depth is less than 4, this subtraction underflows and
> wraps around to a value near UINT_MAX, so the check that is supposed
> to reject oversized writes never triggers, regardless of how large
> words_to_write actually is.
> 
> Reject the write up front when tx_fifo_depth is below the minimum
> required by the hardware, before the subtraction can underflow.
> 
> Fixes: 52ff2b840bc7 ("staging: axis-fifo: fix maximum TX packet length check")
> Signed-off-by: Maritu Hone <marehone12@gmail.com>
> ---

This patch has been rejected many times before.  Best to do a search on
lore.kernel.org before sending patches.

Device trees are trusted.  I wonder if the AI is actually searching the
device trees and not finding anything, so it thinks maybe the device
tree is wrong?

$ git grep xlnx,tx-fifo-depth | cat
drivers/staging/axis-fifo/axis-fifo.c:	ret = of_property_read_u32(node, "xlnx,tx-fifo-depth",
drivers/staging/axis-fifo/axis-fifo.txt:- xlnx,tx-fifo-depth: Depth of TX FIFO in words
drivers/staging/axis-fifo/axis-fifo.txt:	xlnx,tx-fifo-depth = <0x8000>;

regards,
dan carpenter

