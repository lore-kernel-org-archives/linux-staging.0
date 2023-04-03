Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8F681370
	for <linux-staging@lists.linux.dev>; Mon,  3 Apr 2023 06:24:01 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id er13so71790717edb.9
        for <linux-staging@lists.linux.dev>; Sun, 02 Apr 2023 23:24:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680503040;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ElJuNUFsMwi5roY3yyQjQy4Z7CYKWDGQhJKFQymJzes=;
        b=Gut8oqvT/qTTCSw9tafkiGG4ANcTSTe9WKKbcS+OIQeFNEzv8PEkAGACUDo0vLkSvO
         mpoWxf0S+uPbwz+gIh7GBgNPKDLW0Jj5b7ej3mdCraL//CWZEiizZq+s6WIWFSw/qzbB
         Cqq289fNXw2UwlUKqZvX1KSpVVN1ork23LdwzrdjAjjFMCO4OvgFNp9PZzEUwLe8gmTr
         L+opyiHomo4VNaNBddzAwcpHpNnkQBbahQ7USHr3/0HuJMrmW7NJqFGtygOUSIiwSsTA
         UeK3D2TTjYrIflxoiaGQ0y/Ughn1Twnau3pJDmVcDP6CdQYNA6Uhg9gv5qWgtAox8NYi
         q5Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680503040;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ElJuNUFsMwi5roY3yyQjQy4Z7CYKWDGQhJKFQymJzes=;
        b=X76VNdYbgMFqU5yqr8qhoLrQudmJIIpZGAMtNdRvdcHSAGJV75BBMqhJDgyrVY2WEy
         ELCf5Dr/CS7cIgWwLlhyRzwiF52W//F3CND9Dwvi9jfSJz6fcPAhK0bk+XzIiS6M4XUf
         kdsuK3VsAF6ogiS+Z74w+Miy9P8dW84HhqOLL8BEC5KTqLFU8Ejr/k8GmQqb+PAavaqj
         O4JnNUbRYx9JKsVuXT+tcIOFYXD6Lr1ZehXW6EdNCdg51aQ/x64XjppgGXk2VU1ZA+dL
         lQEekqFpYRdjNoWSphoO80q27IuVzANxkjhkOEbO6QgD/tqAMVXct5K26yZcnOvyIrmF
         SYMQ==
X-Gm-Message-State: AAQBX9cLY5aO3xo05alDzAg9/vhWaClys89kuVUF6ecZr87h3TYOaLPD
	2aGPTisjSQODXXLXG+3sOMg=
X-Google-Smtp-Source: AKy350YcXj0yllddeu+1jsJraGt8twyveoS6qIyHUSlt3jrxCweF3OZruDJcTgVetha/Lpdr+rRVwA==
X-Received: by 2002:a17:906:7f1a:b0:8b1:29ed:e206 with SMTP id d26-20020a1709067f1a00b008b129ede206mr30080061ejr.28.1680503040092;
        Sun, 02 Apr 2023 23:24:00 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id a26-20020a50c31a000000b005027686918bsm3955881edb.11.2023.04.02.23.23.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Apr 2023 23:23:59 -0700 (PDT)
Date: Mon, 3 Apr 2023 09:23:55 +0300
From: Dan Carpenter <error27@gmail.com>
To: =?iso-8859-1?Q?=C1ngel?= Alberto Carretero <angelalbertoc.r@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Bryan O'Donoghue <pure.logic@nexus-software.ie>,
	Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: loopback: fix up checkpath macro do
 while error.
Message-ID: <2cb170e2-3551-4f2a-9cd3-065d9bd4504b@kili.mountain>
References: <20230402122550.70682-1-angelalbertoc.r@gmail.com>
 <2023040252-racoon-daintily-3589@gregkh>
 <0af15115-9641-a1c8-f398-c4e8e77379a3@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0af15115-9641-a1c8-f398-c4e8e77379a3@gmail.com>

On Sun, Apr 02, 2023 at 08:22:35PM +0200, Ángel Alberto Carretero wrote:
> 
> 
> On 02/04/2023 15:16, Greg Kroah-Hartman wrote:
> > On Sun, Apr 02, 2023 at 02:25:51PM +0200, Angel Alberto Carretero wrote:
> > > Wrap macro in a do-while statement.
> > > 
> > > Signed-off-by: Angel Alberto Carretero <angelalbertoc.r@gmail.com>
> > > ---
> > >   drivers/staging/greybus/loopback.c | 8 +++++---
> > >   1 file changed, 5 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/drivers/staging/greybus/loopback.c b/drivers/staging/greybus/loopback.c
> > > index d7b39f3bb652..371809770ed0 100644
> > > --- a/drivers/staging/greybus/loopback.c
> > > +++ b/drivers/staging/greybus/loopback.c
> > > @@ -162,9 +162,11 @@ static ssize_t name##_avg_show(struct device *dev,		\
> > >   static DEVICE_ATTR_RO(name##_avg)
> > >   #define gb_loopback_stats_attrs(field)				\
> > > -	gb_loopback_ro_stats_attr(field, min, u);		\
> > > -	gb_loopback_ro_stats_attr(field, max, u);		\
> > > -	gb_loopback_ro_avg_attr(field)
> > > +	do {		\
> > > +		gb_loopback_ro_stats_attr(field, min, u);		\
> > > +		gb_loopback_ro_stats_attr(field, max, u);		\
> > > +		gb_loopback_ro_avg_attr(field);		\
> > > +	} while (0)
> > >   #define gb_loopback_attr(field, type)					\
> > >   static ssize_t field##_show(struct device *dev,				\
> > > -- 
> > > 2.40.0
> > > 
> > > 
> > 
> > Any specific reason why you did not test build your change before
> > submitting it?
> > 
> > thanks,
> > 
> > greg k-h
> 
> Apologies, we can drop the patch. I was trying to find an error as part
> of the eudyptula challenge and thought I was compiling the driver
> correctly. Upon further examination, the macro cannot be written with a
> do-while because it is defining functions.

The "eudyptula challenge" and other first patch guides should be updated
to tell people to search for their code on lore.kernel.org before
sending a patch.

See if you can fix one of the howtos.

regards,
dan carpenter

