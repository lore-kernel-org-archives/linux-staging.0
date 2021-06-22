Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACE36173
	for <linux-staging@lists.linux.dev>; Tue, 22 Jun 2021 07:45:28 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id m15-20020a17090a5a4fb029016f385ffad0so1775512pji.0
        for <linux-staging@lists.linux.dev>; Tue, 22 Jun 2021 00:45:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=rTA9Ge9ztWJg6qu4WnRUxoLw0dKUZdpAeQoMLnN27LI=;
        b=sO8Qr+cKOoS9FFMwhHMmBRROUFXOc4mYXbSrj3q4I9aa/7WgaygubUaATqWccoO4Ew
         Szplz4/pkFp41LIoz//7GarOONmHu/e7bViZcLUdm6AzBVUw5baLNSA5pE5CjJ0ZAMSh
         X1A5FhBV6WqY/wv1ySo16Rm0rt9ENiTXGyAFElVbZEsRyng3TNRLqmASUDypQSmBB7Uv
         UNBA4SsU+L9w7HLzTJuOwLoH26y9YfMEqdJGXZOclR4x+nHw+p+sRh5JIA12fUJz68UQ
         +BVEMymQMH5X6dGY1vZeoxCm90cVBdIgQhHtQOUsmGMpeepu+3g5hrcTOzq+MpptMEEO
         MrQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=rTA9Ge9ztWJg6qu4WnRUxoLw0dKUZdpAeQoMLnN27LI=;
        b=pXjzvZVgq5ddAKNfS5/VxDs7GhHbpj37jV3mxPQrTf5jrTWiKi8t2Zu/IkZBNpeIkz
         nH/DVvE5cWGNwO98Uo9qgWS4SS/KUFx5hhiH2DwJLiSkkDNrOz7Ov71SqnLfbrAryPFy
         EqVzw4Xy/jhYUF39qFcFvKqt/Q89upWS94QOgjajMyMql+yLAcrF6IAF7vClgOsynfRP
         BvOUicwQhY9BwijKxK6M55acLxTeOQ2+XT6fTVAdCWiLbN2VUi/gm8/YJMun4Y+iXa3A
         rEX0fA2jeatByfmasK7q5seERWOm8zbhpqZnzedOMoVG0teq5P99EYhIBYh6qlMwD+mU
         engw==
X-Gm-Message-State: AOAM5330FT9o/dvbwoZuN1nK5NhbUdPxH4I9GX3dBSIu24oqKzJE/69R
	fup+nW/Xc3NeWa3i+ItDNV0=
X-Google-Smtp-Source: ABdhPJzMBA5sJR+94E9iAB6vMokMhc1pEt84r+vNnG+VInBYxTlSEk+FfUe3ay+4zpdhxsDYnbUNWQ==
X-Received: by 2002:a17:902:ce86:b029:125:8c21:2ab9 with SMTP id f6-20020a170902ce86b02901258c212ab9mr6136618plg.45.1624347928208;
        Tue, 22 Jun 2021 00:45:28 -0700 (PDT)
Received: from d3 ([2405:6580:97e0:3100:ae94:2ee7:59a:4846])
        by smtp.gmail.com with ESMTPSA id f13sm3076941pfe.149.2021.06.22.00.45.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jun 2021 00:45:27 -0700 (PDT)
Date: Tue, 22 Jun 2021 16:45:22 +0900
From: Benjamin Poirier <benjamin.poirier@gmail.com>
To: Coiby Xu <coiby.xu@gmail.com>
Cc: linux-staging@lists.linux.dev, netdev@vger.kernel.org,
	Shung-Hsi Yu <shung-hsi.yu@suse.com>,
	Manish Chopra <manishc@marvell.com>,
	"supporter:QLOGIC QLGE 10Gb ETHERNET DRIVER" <GR-Linux-NIC-Dev@marvell.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [RFC 12/19] staging: qlge: rewrite do while loops as for loops
 in qlge_start_rx_ring
Message-ID: <YNGVEiS8mITXQ5sS@d3>
References: <20210621134902.83587-1-coiby.xu@gmail.com>
 <20210621134902.83587-13-coiby.xu@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210621134902.83587-13-coiby.xu@gmail.com>

On 2021-06-21 21:48 +0800, Coiby Xu wrote:
> Since MAX_DB_PAGES_PER_BQ > 0, the for loop is equivalent to do while
> loop.
> 
> Signed-off-by: Coiby Xu <coiby.xu@gmail.com>
> ---
>  drivers/staging/qlge/qlge_main.c | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/staging/qlge/qlge_main.c b/drivers/staging/qlge/qlge_main.c
> index 7aee9e904097..c5e161595b1f 100644
> --- a/drivers/staging/qlge/qlge_main.c
> +++ b/drivers/staging/qlge/qlge_main.c
> @@ -3029,12 +3029,11 @@ static int qlge_start_cq(struct qlge_adapter *qdev, struct qlge_cq *cq)
>  		tmp = (u64)rx_ring->lbq.base_dma;
>  		base_indirect_ptr = rx_ring->lbq.base_indirect;
>  		page_entries = 0;

This initialization can be removed now. Same thing below.

> -		do {
> +		for (page_entries = 0; page_entries < MAX_DB_PAGES_PER_BQ; page_entries++) {
>  			*base_indirect_ptr = cpu_to_le64(tmp);
>  			tmp += DB_PAGE_SIZE;
>  			base_indirect_ptr++;
> -			page_entries++;
> -		} while (page_entries < MAX_DB_PAGES_PER_BQ);
> +		}
>  		cqicb->lbq_addr = cpu_to_le64(rx_ring->lbq.base_indirect_dma);
>  		cqicb->lbq_buf_size =
>  			cpu_to_le16(QLGE_FIT16(qdev->lbq_buf_size));
> @@ -3046,12 +3045,11 @@ static int qlge_start_cq(struct qlge_adapter *qdev, struct qlge_cq *cq)
>  		tmp = (u64)rx_ring->sbq.base_dma;
>  		base_indirect_ptr = rx_ring->sbq.base_indirect;
>  		page_entries = 0;
> -		do {
> +		for (page_entries = 0; page_entries < MAX_DB_PAGES_PER_BQ; page_entries++) {
>  			*base_indirect_ptr = cpu_to_le64(tmp);
>  			tmp += DB_PAGE_SIZE;
>  			base_indirect_ptr++;
> -			page_entries++;
> -		} while (page_entries < MAX_DB_PAGES_PER_BQ);
> +		}
>  		cqicb->sbq_addr = cpu_to_le64(rx_ring->sbq.base_indirect_dma);
>  		cqicb->sbq_buf_size = cpu_to_le16(QLGE_SMALL_BUFFER_SIZE);
>  		cqicb->sbq_len = cpu_to_le16(QLGE_FIT16(QLGE_BQ_LEN));
> -- 
> 2.32.0
> 
