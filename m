Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E7373480
	for <linux-staging@lists.linux.dev>; Sat,  7 Aug 2021 14:50:47 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id b13so15083855wrs.3
        for <linux-staging@lists.linux.dev>; Sat, 07 Aug 2021 07:50:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=9hn67tJt2X1HPMWoBjQTop2rYNzqOcgRwZWoGVS2Fr0=;
        b=qQ7q7kbLiOq0y+zSYTXgcu38Vz9+ADTLdxdQTwLWXKFPeZ/iNFjPB5QxKifmwUFS+C
         de8b+cr/cTxcsn2Xcb3JR8iwN05NdMMBsHMmLw5JE6gZxpZtEkkaWwVUBsanjOQcQrR0
         rziijtStCcuyD4bJay/jGhlOd41F5x0AxnmvSeuABsIroukgN8wTxW00fd3r3+Ag+GcN
         wYeVO+PonOy0DL7IZGYbqK6CkbZgG3xXKwyPJllOnuR1/gqW9PFen7dM9JAK+ZwfcwF4
         uDgh5oFidZuRWss38yhWzA4qZpq8RaEalc3ZTw0yuUzTENWuijVz+qYBYq2rAu3nJ1rS
         GZBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=9hn67tJt2X1HPMWoBjQTop2rYNzqOcgRwZWoGVS2Fr0=;
        b=Qo42UW114hISgqINq6qpba2+Hro6IwFPd85pU2IEfI94eRrZPoSXxhLScv0yvXqFGN
         fS0X2iDBGN+xy8ZhFPQe80cmK0bspLw3sW6LdYjjJ70X1fYnO6+7CEGGb8C97A8PZW/6
         /B5qYkcGvu0lalBfh1D0iKOkQZYIw3JHL+WoIzTaWmM0tHr9snXbie+D0MgiqCpFQlfv
         xCMXgV7+PQdW8fOHyXPK4nmCPYjNLq4Iq7P5NyhDS2FqEUx8dHfMM+iSQyMQsv/2Y0BV
         2hyd9Z23q2YeD5IG4RaWtDX4QXyQYZpy8CCmHfCnXYRaRQJ2A8KuM8WHLxqfkSoXMzqc
         XDwQ==
X-Gm-Message-State: AOAM530OkpHI/48I93cuA/glOy9sk/6uxvz4kLUu9q+S9p07izkllLca
	C5ySsKkRz33AkPTxFP14Ndw=
X-Google-Smtp-Source: ABdhPJznosRzvxBcRhbfL9RupXi4erQbhUVgXv9oQcXlBupwT29tuTt94TfgjfNXC08e6tOThohNyw==
X-Received: by 2002:a5d:684a:: with SMTP id o10mr15912822wrw.384.1628347845701;
        Sat, 07 Aug 2021 07:50:45 -0700 (PDT)
Received: from agape.jhs ([5.171.80.175])
        by smtp.gmail.com with ESMTPSA id e17sm2531296wru.7.2021.08.07.07.50.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Aug 2021 07:50:45 -0700 (PDT)
Date: Sat, 7 Aug 2021 16:50:42 +0200
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: Saurav Girepunje <saurav.girepunje@gmail.com>
Cc: gregkh@linuxfoundation.org, Larry.Finger@lwfinger.net,
	insafonov@gmail.com, straube.linux@gmail.com, martin@kaiser.cx,
	will+git@drnd.me, dan.carpenter@oracle.com,
	apais@linux.microsoft.com, yashsri421@gmail.com,
	marcocesati@gmail.com, ross.schm.dev@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] staging: rtl8188eu: os_dep: Remove unused variable
Message-ID: <20210807145042.GC1425@agape.jhs>
References: <20210807102232.6674-1-saurav.girepunje@gmail.com>
 <20210807102232.6674-2-saurav.girepunje@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210807102232.6674-2-saurav.girepunje@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hello Saurav,

On Sat, Aug 07, 2021 at 03:52:29PM +0530, Saurav Girepunje wrote:
> Remove unused variable data and data_len from mon_recv_decrypted() in mon.c
> 
> Signed-off-by: Saurav Girepunje <saurav.girepunje@gmail.com>
> ---
>  drivers/staging/rtl8188eu/os_dep/mon.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/rtl8188eu/os_dep/mon.c b/drivers/staging/rtl8188eu/os_dep/mon.c

did you rebase you local tree on current staging-testing?
rtl8188eu has been deleted... now there's r8188eu.

thank you,

fabio
