Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0610F2C80
	for <linux-staging@lists.linux.dev>; Thu,  7 Oct 2021 07:10:28 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id g8so19226767edt.7
        for <linux-staging@lists.linux.dev>; Thu, 07 Oct 2021 00:10:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=7o7olDwHwdK5/Ab9HY2xquuMz0Q2unNj/qL+rAvTIwU=;
        b=MPiVJ/BF+xU4JgazGBkQUR9Fvke/QadJGvaQKcfTp1q3dNCCQYexxPlqAu2YSYK/66
         sK+E48UcTflM/KO8l+qkdM3QiQWKKAYgbCKsb4UDRrtv9k0XgiR5/X8XIQzRqWX7GXCG
         1cC6YqWFV3fW/vdnZXVywBmv9Is5fjQO8lDKWHvxJGVIJ+Ougc7lPvGTyMqZqzMsbYDS
         3pZOH9b1N2rpfcxmCXJpjbXJhfGAsDlfGZZVMyPRZZZSUQHyDx1UmFa/o2+Qer36/Pyp
         X7PIHQFzp5eAAYUZLUOl/7cImpyNXf1u+ltO3CFHCDYE8jG73+9RSBXaLGHb9+Pnpp6j
         UtvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=7o7olDwHwdK5/Ab9HY2xquuMz0Q2unNj/qL+rAvTIwU=;
        b=Psh6rTefWfpfR/92r4m5EWVC8GZFd2ggcImh2gXv/nO/5j4B1Iw2DL9yRPQAEbhjFY
         2hnLJ2OwISTdN85TfXHCjZYwpOxPlDRbCi2NPOw+4nbFduD21bncp9Jb/uyBek3OxQVp
         t8W5Yt4P0QHhNfOszAO9caQRl0rOT+mh00WTEdQRd3lQcLoB5MzE36PmyMc0CR43+A7Y
         zdspc39xoBICi/KGzKufi1V2BfDjM43XhPn5PVhVZMWqBa7xbBzAmjESRWQyf596eYlv
         jn6MLaShIzeDLRvaqNIORRyCNkNrRZOsiOuLEyj/anmrg7CKEhDvClTrjTSkxHOFFFjN
         rEyQ==
X-Gm-Message-State: AOAM531lUQBZuKPh/BrTrRQhofWzlIIXJzWr8tNBKK+R02uGgHoSZEkX
	mT/u/O3u2lBU5CX8ruZy/Zo=
X-Google-Smtp-Source: ABdhPJzMzHSWg3H+huLcRx4zvg6jVlCs9hQepjt9bK4P6g2YBaW2g2NvTFBW0Tm77YaVgB2mLzUwpg==
X-Received: by 2002:a17:907:330e:: with SMTP id ym14mr2905201ejb.417.1633590627450;
        Thu, 07 Oct 2021 00:10:27 -0700 (PDT)
Received: from tom-desktop (net-2-42-54-217.cust.vodafonedsl.it. [2.42.54.217])
        by smtp.gmail.com with ESMTPSA id u2sm10521492edb.6.2021.10.07.00.10.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Oct 2021 00:10:26 -0700 (PDT)
Date: Thu, 7 Oct 2021 09:10:24 +0200
From: Tommaso Merciai <tomm.merciai@gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Lucas Henneman <lucas.henneman@linaro.org>,
	Yujia Qiao <rapiz@foxmail.com>,
	Madhumitha Prabakaran <madhumithabiw@gmail.com>,
	Marcos Antonio de Jesus Filho <mdejesusfilho@gmail.com>,
	Aldas =?utf-8?B?VGFyYcWha2V2acSNaXVz?= <aldas60@gmail.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Deepak R Varma <mh12gx2825@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 1/3] staging: vt6655: fix camelcase in bShortSlotTime
Message-ID: <20211007071024.GA3113@tom-desktop>
References: <20211005205702.14029-1-tomm.merciai@gmail.com>
 <20211005205702.14029-2-tomm.merciai@gmail.com>
 <20211006080956.GY2048@kadam>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211006080956.GY2048@kadam>

On Wed, Oct 06, 2021 at 11:09:56AM +0300, Dan Carpenter wrote:
> Looks okay.  Thanks!
> 
> Reviewed-by: Dan Carpenter <dan.carpenter@oracle.com>

  Thanks for review Dan!

  Tommaso
> 
> regards,
> dan carpenter
> 
