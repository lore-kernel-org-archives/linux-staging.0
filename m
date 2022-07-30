Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0B851FB1
	for <linux-staging@lists.linux.dev>; Sat, 30 Jul 2022 03:35:30 +0000 (UTC)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-2ef5380669cso67191067b3.9
        for <linux-staging@lists.linux.dev>; Fri, 29 Jul 2022 20:35:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=wQPQlV7apFmdAUsFT8uJyYaVCkVufIRKulfJqIm3SSw=;
        b=ZT2MMNv6qiCqlI600Ig6b2L8iRnFwfJquxCn1XYJzn0H8G46TfJLCNCKWvF0n2jPKE
         cL1xo4u/MpaZUgHgaUrvdLfSGN52FTRzbY32HyFlsPIN013qaIfEaGcgVz9/OOZ9frNE
         giYlc1jSqeXT1gmIiCPlerAuNKKTOxpFIUNJq6xNHdLSzBRHq/mcpFd10jN8j/SlQKT7
         Ic69vavUNAwl/q73AmgP5ql7tw964rTvC5zclj9oYv8C7MY6YcWfp6rbmXeQtB8WYFWu
         Oj+YL4y4t4c40uPwcl9vcZgXpDAH8CMdZr0UCO05HH0ghYJzgfFspgTTdlJ96/Brz+Cm
         UioA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=wQPQlV7apFmdAUsFT8uJyYaVCkVufIRKulfJqIm3SSw=;
        b=uD0iUakJNycinDbRhAJ/qAGJQEJR6ZKv7aZCFRnS2oH69YDHSwBvEt6vNjZpub0YOX
         143yjInNTovZGnSp6y3/1xdj4dd8HShLC7fFEowCbTSUCXaiukG5NRi0IioFG1tCOgaU
         eQCZwlosPT0RpdYluK8JHOhlZn7KvijvK+T+l0mQ+BrhzWjHzKSh6dQFnOfBFJhs4YVI
         b2BiaXHcflR2E5R3FfdmePIputK3+sYAvQ1DAVkge8qdXsdbPLcF4+sftb69xlKh1m0Z
         fAtnDVXFoYONQp9n0tuCHgzjARZLJhNOtSZcjy+swysGlxaTqnNUY60wJgoUo6gKh296
         XtFA==
X-Gm-Message-State: ACgBeo134mGNtNYO4F/u5z5czboAukaGEpTxxSAn9cLUZ9WSEoXYnfeG
	7i9nN4lK37Tr5bSA3zaOZUp2J6PeT31GPSxEgef1Sg1ill4orQ==
X-Google-Smtp-Source: AA6agR4QY9761VtnH9U7F4uCzTjxcUz++vqV+cHnk6luBTe2FaF20W+gYT5CRUSs6UUGu7R0D8JPtHHQ5WAVxq0O5JU=
X-Received: by 2002:a81:4845:0:b0:322:ae4a:f3de with SMTP id
 v66-20020a814845000000b00322ae4af3demr5560045ywa.398.1659152129678; Fri, 29
 Jul 2022 20:35:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <YuDdHMaB6jWARQzA@kroah.com> <20220729035230.226172-1-ztong0001@gmail.com>
 <20220729035230.226172-2-ztong0001@gmail.com> <90a16ffd-5a08-0ed3-280e-bd5c4522525c@gmail.com>
In-Reply-To: <90a16ffd-5a08-0ed3-280e-bd5c4522525c@gmail.com>
From: Tong Zhang <ztong0001@gmail.com>
Date: Fri, 29 Jul 2022 20:35:18 -0700
Message-ID: <CAA5qM4B_7wvnB8U1kgQpcn81sazp43wn9dYa+SQzh1iwGKp2eQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] staging: rtl8192u: move debug stuff to its own file
To: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dan Carpenter <dan.carpenter@oracle.com>, 
	Jakub Kicinski <kuba@kernel.org>, Saurav Girepunje <saurav.girepunje@gmail.com>, 
	Colin Ian King <colin.king@intel.com>, Nathan Chancellor <nathan@kernel.org>, 
	Johan Hovold <johan@kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, Jul 28, 2022 at 11:23 PM Philipp Hortmann
<philipp.g.hortmann@gmail.com> wrote:
>
> On 7/29/22 05:52, Tong Zhang wrote:
> > This is to prepare for moving them to debugfs and fix rmmod warn issue
> > when wlan0 is renamed to something else.
> >
> > Reviewed-by: Dan Carpenter<dan.carpenter@oracle.com>
> > Signed-off-by: Tong Zhang<ztong0001@gmail.com>
> > ---
>
> When I applied your first patch I got this hint:
>
> Applying: staging: rtl8192u: move debug stuff to its own file
> .git/rebase-apply/patch:399: new blank line at EOF.
> +
> warning: 1 line adds whitespace errors.
>
> Not really an functional issue...but
>
> By Philipp

Hi Philipp,
Thanks for the review. I fixed it in v4.
Thanks and have a good one!
- Tong
