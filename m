Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7A8A7A
	for <linux-staging@lists.linux.dev>; Mon, 13 Jun 2022 02:52:06 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id v4so1976924plp.8
        for <linux-staging@lists.linux.dev>; Sun, 12 Jun 2022 19:52:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=+syu8zXTLNzuwkgu0YpXNp+GQJj3tWOie/YgNIKS4U0=;
        b=M0eUrqzokBUgw6kx+SeIUwac//UqJb78eJPvjl4zcc7ye76BPFJyAFRItO4se0MfNB
         baIgwLhM25mHwtekNXBMrtvYAjO4pGOFwzPjWjpioSf89+x0Cd1eJbR4lYcZLUkXiRDu
         87TOZ6RXlLmR9uebqGC2BzZZwnlNrHO1qCPWtxkSvwa9eubRgcSwJYK94w2h7lPk0/mq
         oLhlyFXohWdlZt+OmlaHfOsbz0Pyw14uhedYzP8zWmCQNJSJIEf9dKfF5SccD7kyOt5p
         6ouMbiKRBT04OHIfOvNub3sIEcZ04uRA/pKQO/09k/lUrHvVtdzTexTf5WdAK/4gflB4
         NwSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=+syu8zXTLNzuwkgu0YpXNp+GQJj3tWOie/YgNIKS4U0=;
        b=8NfK6F75PfRV7VqNPlKf3+/RIJUHQ93bx7nL7o+hqD60zyXktR37uFBGWhXmGCM59V
         xWrozT+AarinQM9JcwEhditGjDnLE8UE4c3vyfAI1inHWkpyqz8Qf1N/y8Ja9iI2m7vL
         7cze/oEY3HxXbNcdb+evYa0meGs6NxB+8n7nQt9hbQc73bNnQnqSqTamaACD93ljp57a
         ex52Huk2JzU5/tvivM3vmbCpnr+SdVDXrC+UUFljI74Ig2IASplIBZ2pAmkySqItW7C/
         52ZdQhg8+HS9JfOmIdg9gnucpaNtX71cue6lYsy/vc1PnDcFzGvuBZbKBYpKnHuHbbqD
         PcJA==
X-Gm-Message-State: AOAM531dfBKSbWkml2Q9J4vvPrKb4X9lcpKQVxGdnMvLSbsB+i/aQXOa
	Iiq7CfMlXVNlnOlb6CcmGpE=
X-Google-Smtp-Source: ABdhPJx1eYlhYQSPfX7umirYAVUsnMFMYLEGdt9XIy8VcLdLixPOVw8G2uR3P6K9i4Hs+h6lxCZoJw==
X-Received: by 2002:a17:90b:1c82:b0:1dd:1b46:5aa9 with SMTP id oo2-20020a17090b1c8200b001dd1b465aa9mr13354049pjb.158.1655088726257;
        Sun, 12 Jun 2022 19:52:06 -0700 (PDT)
Received: from localhost ([2405:6580:97e0:3100:ae94:2ee7:59a:4846])
        by smtp.gmail.com with ESMTPSA id x16-20020a1709027c1000b0015e8d4eb276sm3732099pll.192.2022.06.12.19.52.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jun 2022 19:52:04 -0700 (PDT)
Date: Mon, 13 Jun 2022 11:52:01 +0900
From: Benjamin Poirier <benjamin.poirier@gmail.com>
To: Srivathsan Sivakumar <sri.skumar05@gmail.com>
Cc: Manish Chopra <manishc@marvell.com>, GR-Linux-NIC-Dev@marvell.com,
	Coiby Xu <coiby.xu@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dan Carpenter <dan.carpenter@oracle.com>, netdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: qlge: qlge_main.c: rewrite do-while loops
 into more compact for loops
Message-ID: <YqamUSc3Y9TBwAEH@d3>
References: <YqJcLwUQorZQOrkd@Sassy>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YqJcLwUQorZQOrkd@Sassy>

On 2022-06-09 16:46 -0400, Srivathsan Sivakumar wrote:
> simplify do-while loops into for loops
> 
> Signed-off-by: Srivathsan Sivakumar <sri.skumar05@gmail.com>
> ---
> Changes in v2:
>  - Rewrite for loops more compactly
> 
>  drivers/staging/qlge/qlge_main.c | 24 ++++++++++--------------
>  1 file changed, 10 insertions(+), 14 deletions(-)

Please also update the TODO file to remove the respective entry. The
other referenced problem instance was already fixed in commit
41e1bf811ace ("Staging: qlge: Rewrite two while loops as simple for
loops")
