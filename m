Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794806897;
	b=dhPrp6dfW3xOCZCF9FpmAem4l6trmwcAS+GJSwWaLkE5Us0PTxs9ZnvZ9MCG/rQfy5oZ
	 ov75aHBrONUPJjq7Z7pnSURrfsaQxyZy1QnvuSEsFuUAuPd7VnJ5K7tiaEuvO8qseWPtx
	 Cvv95sE+cWNUYRzUs4I4AvjTg7dyGyNWucA0b/Mgz6G5jlL6bu9qtK0OWawg3+54CFhw2
	 rKtutwM0Bsi7aPpdk0GEX+pbX6d9cAydgbAPb+wVT1MZDUTObhqEIIEdUVH6cEtUcjI4q
	 OPUIqJrGBFHlZ019GDxShHx/DAACYhzx0K4YwI7ge20+zLJlss64wQ0KN3n2rgujXqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794806897;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=uaq0BVEvOHoY5FVUN84HI4rX3Wfh/nMm0wJPKthJRRM=;
	b=RTHdeGrOgwPvYwNrsyykLXobMMQNZQ8GX6Amea9cTgPJnsKRpIfFhMQc+Fmr7rlYXxJ4
	 ZGtPbJbKga2nVcaBYf4fB3b/PQjjbraboXg5Eju9oAmqjMq4nZvIL6uDMiunvJ2S0AJJ5
	 E/cUlTpvSbj8vg77ZH8ityeUN9PJffMBofcobbitfPsjDm8/Sf6VoZmYzqyTTCJ5rhOYr
	 XaJn5lBXdLFm1oPgncSpp6lyOOyQ2FGxCRGkWUxBQQB/v8F5oC/e730mWipvfd7esFGXS
	 GQz6VUgaQIfb90CR0mlkRTDYq6xQo/eSFt1iv1rWQXYXNWYHTnpCJh9lGd2XlKaXUew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AXijZnAH;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36D49606A323
	for <linux-staging@lists.linux.dev>; Mon, 16 Nov 2026 05:28:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36D49606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AXijZnAH
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-492fcbfaa87so1464773f8f.3
        for <linux-staging@lists.linux.dev>; Sun, 15 Nov 2026 21:28:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794806895; x=1795411695; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uaq0BVEvOHoY5FVUN84HI4rX3Wfh/nMm0wJPKthJRRM=;
        b=AXijZnAHGXSkEnrW+IH1bmOBf/vyVAIRMLofLjG093VlHpfFBcCTCdMLIvlCbJZyDh
         gk14FujFYao5zDDGK19Xgc91CQe9M0ZanZiNJVVYxJOiH09APZJrLhJkYybcp3ua7J07
         5Lx1qZkhdYE95wkX2BCcSC+5UZSxPtmhviI+hIZKkNG9/dq7lGyKFyf9PN7KUyVCY8xP
         /0Xjj34/RCbcGjOECtF85p7WCX6EoQ+7whD3nqp8+g04BfEbR5bkh8EOZs2p3xIazZgC
         6ok4vFZsg4fgEY1s3WyXvILkDZVqhLqrmGD9suBdmov47T34zmg2XWYz6+9z5qwIqnm/
         UYzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794806895; x=1795411695;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uaq0BVEvOHoY5FVUN84HI4rX3Wfh/nMm0wJPKthJRRM=;
        b=kDmJS1wYyoz965erdLuK1qG7F3fUXDwxtg0Tlxwk1cBtWccJbDJ3v6xejpsw82+tv/
         tEYJs2r4PsAgqKbqXS5tPExg2G9g8hUHz1o8Es5NSpeNzA5+oTkbbbo83FVHHhVXma4D
         Advn0X4QhC9lC0Rd5fNw+KQHkmflKYN7vvpzbefNq1ljwEsJ2qOYGG0vA4utn5rs4ZFs
         XBzzu9yW77Y/1LFC22SwxgrubT+vu9z/QjGRMWOKq5AvrMMXSNEsOPrzOsbh8ORb/So5
         WdTNJXW7N7tW0eJ585PXD7UZjkBGNrfGojqPntuHEyCuUjlvAjLfHYHlgk1bUc9yaWi8
         m2qg==
X-Forwarded-Encrypted: i=1; AL+hErHwfbYpcITNB4XXDcZgcnXttercy3Qno39V50jAgcVub+8hAvm0rjfbHoOCrMHFu51qgoS6Ti+x6Gm3LStc@lists.linux.dev
X-Gm-Message-State: APuU4Z9I6VA54C1kB8yWvzcT/flso55Pn9185J2qiK0Fx2c6KtSt3Kiv
	CroAlfw8M5tMLZ0z4LRYjTcc97qNou3SXl1Y9b9YeVagglGf4xNb5AsU
X-Gm-Gg: AYBFou3J7cM/5VoESlM+gg2JWNd3GwHadHiWYNNhmjmwxv8CBB2nY9r9ftv1DVqah+M
	NBVISaUUi0olQ4YHLIoYBD3MkWwqGDX3RvqqpPk1f2qe7fmLU1P8bK42iQMOZbNVFGenRHlNQYI
	zl92/nspGwlAZ5SIQljNyqbsAGhy9hzNs0be/kRtlvT5LyWG/udcJp0Pc66OEJXWH3or/bI0BlO
	B7/g7ukGCGgmob5IF3sAu2514IUWzJNjM62+IKAMA2VJNerJyn8wzYt8MBIxrrxqZ+R9gqFVm4T
	nVdxoHllC1mS4BJec0SJUa9mhylG+JQhTIMpA7VsaaS9Bq4ujBf/+77pYLR3Ty4V6S1nFHEtLq8
	R350sJYiXMJX7sChlBnzmyrYCwYGKnq1ffg3t5XG5O9l4eleti2QrujPpL5G5u8YE/aAaKUbIBA
	8qARl8WGwmSYgUPGIqCfN3hQF6kOYDAB6bmfM/13PjMw0v67WRcs08gXQqbJCDLJHgpswTr141H
	WkdmhIz5zS4QNNPQtM1y0bBQE7AJEYH2ek1UhD9qAqelzoIRlYTIgfv/OAtj8XBSffsHt9k0RMe
	PbSnwCGWqJgQCjVqNDeCHVn1ybGdEtv1Na8CwL3XMPEyidRDoCZdME43LdfQfJM5npvuvSN/wKq
	QA9ZIGY83MCmqn2PbG2ftkZaKyfIqibP2vyvxS2Fqvv76YMAu7BpV/fTMH97/NVZ+PL0=
X-Received: by 2002:a5d:64c8:0:b0:492:a72:92fc with SMTP id ffacd0b85a97d-49c740bcfa2mr19526408f8f.44.1794806895504;
        Sun, 15 Nov 2026 21:28:15 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c60da11c5sm18757547f8f.54.2026.11.15.21.28.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 21:28:14 -0800 (PST)
Date: Mon, 16 Nov 2026 08:28:11 +0300
From: Dan Carpenter <error27@gmail.com>
To: Priyanshu Singh <singhpriyanshu9838@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Oscar Alejandro =?iso-8859-1?Q?S=E1nchez?= Lucero <aleszlucero@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: octeon: fix asymmetric output buffer pool
 accounting
Message-ID: <avqUa87gQnzKyVF3@stanley.mountain>
References: <20261113231622.17907-1-singhpriyanshu9838@gmail.com>
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
In-Reply-To: <20261113231622.17907-1-singhpriyanshu9838@gmail.com>

On Fri, Nov 13, 2026 at 11:16:22PM +0000, Priyanshu Singh wrote:
> In cvm_oct_configure_common_hw(), when CVMX_FPA_OUTPUT_BUFFER_POOL differs
> from CVMX_FPA_PACKET_POOL, 1024 output buffers are allocated and added to
> the hardware Free Pool Allocator (FPA) pool. However, in cvm_oct_probe()
> (err_tx:) and in cvm_oct_remove(), cvm_oct_mem_empty_fpa() is called with
> 128 instead of 1024 as the expected buffer count.
> 
> This asymmetric accounting causes cvm_oct_free_hw_memory() to report a
> false warning ("Freeing of pool 2 had too many buffers (-896)") upon
> draining the pool.
> 
> Define CVM_OCT_NUM_OUTPUT_BUFFERS in ethernet-defines.h and use this
> constant across cvm_oct_configure_common_hw(),
> cvm_oct_probe(), and cvm_oct_remove() to ensure symmetric allocation
> and deallocation.
> 
> This was found via manual code inspection and is compile-tested only.
> 
> Signed-off-by: Priyanshu Singh <singhpriyanshu9838@gmail.com>
> ---

This needs a Fixes tag.

regards,
dan carpenter

