Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A77943FC7
	for <linux-staging@lists.linux.dev>; Sat,  4 Sep 2021 06:00:48 +0000 (UTC)
Received: by mail-pg1-f170.google.com with SMTP id g184so1147057pgc.6
        for <linux-staging@lists.linux.dev>; Fri, 03 Sep 2021 23:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=GLxi1KGYaaCg8emjrRkzTYjlBtdFmy8JJ+fONfTMYMk=;
        b=POZs3N8qT6UI7DZbwpnV0sc/3NARUOAReXFHzonB+GX9rNmQ7l955DIzy1uy+AXR8Z
         IH9nxOQLoeVrSCxexagkriQst3XUt6p7XimvWWFBn7WFip5saZWLWo/WlLrLjxXDXqNn
         /3QoqZx3bMTpta2u/I5yCl7jVruF/DnkaILd8FNjlrbQSW0AbIKQJT0XNgONReqK4fiZ
         7b2bB2fX0flwJNNNQCa3hj3o3wdGJPbGd5wnnyDi/rj0NKRoOOp0QBEkdO93IG0w2XnP
         YjjGxdWFvPpmj2BFzdM+8wNAC20k2qtT+NTRK8hFIQYKJjKi2WOx2MSrWwGRoz3P6F93
         +9SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=GLxi1KGYaaCg8emjrRkzTYjlBtdFmy8JJ+fONfTMYMk=;
        b=E1a1HLPalzrYjvMfoYyBsgcHNAmFI5aOjfLyh+v8lP6X2U/Cfhn8GrBGgxJiOJPWiU
         RvzdigAefy0ODl806UPpYZP8/pfEL6XdYwYt+QFG6axB1jl8mW6biJijA6O/CTUM6wUY
         EgZhMqiV5GLoG4/0n39A/o24KxVcpef57tz5oLmyMGEVnEfJrGG51Ws0OZ03Mo6cR+IC
         NWG6McpH0t7+AIed+jBySH53qso92j9YTQgnvDoStAqmzyrIrM7/fmkofigW1vdsQXR3
         43SpYzDJUsWKZnCWFFqcfcTba3X9YAYJifXPVvUS3tzqUWYGJ+p5cjU1HZIrZneWfBiO
         IhOA==
X-Gm-Message-State: AOAM533ngNQR7HSHmj6wOSI/RVqfdXTRhKhwEaFP3YrOc5XpwKqSQ/KE
	SCoycE5JgZiinIp3w9nmf4M=
X-Google-Smtp-Source: ABdhPJyzqacZiVI7G+RQhrtXXy6lLEy/d1RtI8lj8UEgqeJEuu0XhkbqC/r/0nvTJSrO8uQOT2mm9Q==
X-Received: by 2002:a63:da14:: with SMTP id c20mr2287060pgh.155.1630735248245;
        Fri, 03 Sep 2021 23:00:48 -0700 (PDT)
Received: from user ([117.98.200.228])
        by smtp.gmail.com with ESMTPSA id w186sm1129029pfw.78.2021.09.03.23.00.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Sep 2021 23:00:47 -0700 (PDT)
Date: Sat, 4 Sep 2021 11:30:42 +0530
From: SAURAV GIREPUNJE <saurav.girepunje@gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
	gregkh@linuxfoundation.org, fabioaiuto83@gmail.com,
	straube.linux@gmail.com, ross.schm.dev@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	saurav.girepunje@hotmail.com
Subject: Re: [PATCH v4] staging: r8188eu: core: remove null check before vfree
Message-ID: <YTMLilFWdGopMdtl@user>
References: <YSu9GQa1A3s6FYQx@user>
 <20210830112525.GG12231@kadam>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210830112525.GG12231@kadam>

On 30 Aug 2021 14:25, Dan Carpenter wrote:
> On Sun, Aug 29, 2021 at 10:30:09PM +0530, Saurav Girepunje wrote:
> > Remove NULL check. NULL check before freeing function is not needed.
> > Correct the indentation.
> >
> > Signed-off-by: Saurav Girepunje <saurav.girepunje@gmail.com>
> > ---
>
> Looks good.  Thanks!
>
> Reviewed-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> regards,
> dan carpenter
>

Thanks for review Dan,


Saurav
