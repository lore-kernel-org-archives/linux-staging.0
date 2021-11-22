Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 606C968
	for <linux-staging@lists.linux.dev>; Mon, 22 Nov 2021 15:00:50 +0000 (UTC)
Received: by mail-ua1-f52.google.com with SMTP id r15so37178389uao.3
        for <linux-staging@lists.linux.dev>; Mon, 22 Nov 2021 07:00:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=CmP2bXFruojw8kAtSj6UqlL7SjSwWnqcFws6u5CPCIc=;
        b=RV2PJLQSLxWJZ05lnNtM5IHsLgLmaoeBTTm6NuL2w3SH0Ok11sJvC5PDbs5wklpr3i
         uLtbywpCHvJHACFy/KiDjZwylIjxsrPQL4Coc6wynIX9+DDwvZlXS7C5BdGq5xTVCaMt
         /lhUWQUgk75mXD6JJBcE//LoxodQkrKHzDk6bgDZesP7l9MR/muMaIqS9blW/nR4xEfE
         yxME9JiDv8Z+FbgT9Galn0N77rBOFNfeiKuqH3E+89Ga+1HS62Bq+KU1dvblnM+1IHpb
         LoRC8fC3fzDsZaXguVfEhdfdhUv5tJ9ZGQyXjKtUqc2nizxTr96kIlDdqM2uUsofyCcg
         O8aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=CmP2bXFruojw8kAtSj6UqlL7SjSwWnqcFws6u5CPCIc=;
        b=pOckc085gMB6W27CBDkCSGvIuJ8asVNcfFOTZ1yVAqpAXcX0sQ20dMPI5F81eyl2VQ
         mEtreywaBMVQMVFTm9+1akuVQgQFQ7Tz0Fc5+40+5REI55A/4tfi3cBhRvWhXnVSrDWC
         OQTpPxKi+sg8Y/Rh05nUhdKZ3MpqJeRHlKua88mmMQWG45Mr1r30KkgK3AXEbaCcBsGp
         Zd0zygrIi6SeZ7SX6iAnJTtp+gXB2Cz0FGmIo0EWgAB6tw7fOpq4RuGjfn9H3NnJh/wa
         GsGjPB1zXYs9egcBMwlTYhCH/1dppK+FNN05qma1EUtwTfCwacqw/v6Gg2mexgUS1Rh+
         PsIA==
X-Gm-Message-State: AOAM532Ls0ydfLpRWvb5iLjiugFWBWuO3s/ZNJkCKIJcOJa+I2pWGV2x
	W99UW8IUH8VUY0XjNFG3qsbXm7OhHqI=
X-Google-Smtp-Source: ABdhPJz9tzowrWuZIQ3HOMTaJtFV2Ir4Q64/HuLIOszlDfJP6qTyEx83/hpiSV7n7aFklOsDmdramQ==
X-Received: by 2002:a67:846:: with SMTP id 67mr53758720vsi.7.1637593249362;
        Mon, 22 Nov 2021 07:00:49 -0800 (PST)
Received: from localhost.localdomain ([181.23.85.46])
        by smtp.gmail.com with ESMTPSA id o5sm476798vsa.4.2021.11.22.07.00.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Nov 2021 07:00:48 -0800 (PST)
Date: Mon, 22 Nov 2021 12:00:31 -0300
From: Gaston Gonzalez <gascoar@gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: linux-staging@lists.linux.dev, gregkh@linuxfoundation.org,
	nsaenz@kernel.org, stefan.wahren@i2se.com, arnd@arndb.de,
	ojaswin98@gmail.com, amarjargal16@gmail.com,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND] staging: vchiq_core: remove superfluous
 static_assert statement
Message-ID: <YZuwj0mhn3qEgQbW@localhost.localdomain>
References: <20211122130926.342128-1-gascoar@gmail.com>
 <20211122135031.GB6514@kadam>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211122135031.GB6514@kadam>

On Mon, Nov 22, 2021 at 04:50:31PM +0300, Dan Carpenter wrote:
> On Mon, Nov 22, 2021 at 10:09:26AM -0300, Gaston Gonzalez wrote:
> > After removing the BITSET_T typedef in commit d8a364820e01 ("staging:
> > vchiq_core: get rid of typedef") the static_assert statement becomes superfluous
> > as now we are checking if the size of the u32 type is 4 bytes. Hence, just
> > remove the static_assert statement.
> > 
> > Suggested-by: Dan Carpenter <dan.carpenter@oracle.com>
> > Signed-off-by: Gaston Gonzalez <gascoar@gmail.com>
> > ---
> 
> You sent the first version after the merge window had just started.
> It's too early to be resending stuff.  Leave it for two weeks after the
> end of the merge window at least.
> 
> regards,
> dan carpenter
>

Ah, ok. I thought it was ok to resend after one week once the merge
window was closed.

Sorry for the noise.

Gaston
