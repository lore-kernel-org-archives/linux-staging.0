Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DC2620FC
	for <linux-staging@lists.linux.dev>; Tue, 31 May 2022 06:40:28 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id q7so6288160wrg.5
        for <linux-staging@lists.linux.dev>; Mon, 30 May 2022 23:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=hWi8+sNMetrYMzLc34VlHt3OhXmn2b5I8FlnJI4POXE=;
        b=UFL9N9JhTYW/Wh36Zwj142mdG1eXYyqsPf0pCsMhKDQtPljFB78+hO04ngET8qF0X9
         wBE4eIGDlQomlKtwgY1OJ95nl9vGvsbherAOFGH4r6VmmAwv+HVQs5JtTVId3i/8nlVn
         uzJqH8fYXZkT4XdCAT1+PZWz4eeumQaG1JwQJYdDVNip8v2nnvbxBDMAMp+ezPITWU07
         2DLYCJSoyLsv7S+D6jM4CrHvzjhy4E0mf6lnuoFwHzvJ2JkT9vQr/kxPItKB1wdSF+HG
         GCsFGYGbgUzDThj+IjDCjYo0gTsUhSppwHgE3rEE1brg69vYSwfmw2NmbJMJ0iyaMyvV
         dIVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=hWi8+sNMetrYMzLc34VlHt3OhXmn2b5I8FlnJI4POXE=;
        b=aYyMs6ak+vT5J7ertPKuFSE1DBvF7ElvLIv9zGxXg+lBSomwXVHEtEeGWiiDDkldt1
         zLZeFD/fdDcOYGagI0Pqvf1tdR4IA6n52+l82ZqL2qQX8VN25jAQ5GyRWcYeo+YSNvyc
         hOg4S0HUl8vJ4nXjxaIlhRDGaQVd7NN4/gx31drRHUSV9zwL5vV2b3ThwW8/B7evDgrQ
         U1O1oUUrMk1YUww7g8d74GhfxLD0qFfYD94z9FzvRC0uJJyFR8bcIyOqpaW1KRKSKz62
         lOp6g761nGignx0HJHn3SvuFiiiXoBdsckskgEBOli9axFB2xctHREAxiNcmQ8jUPLhi
         UGXQ==
X-Gm-Message-State: AOAM531FKXKmrhqu6NijZnNf6tyYXVJA8fr7jTzXrD0hHfbJ2WGBXiaI
	+/dr5Pln948HrPzuaV07Tpqx5Q==
X-Google-Smtp-Source: ABdhPJwMqIF0KI6J8fO9BDzZJ9VYbRVfEIjt23H4x15ky9FdtzN9fcbpJxoV7hzlDtt3RwVHgKaJIQ==
X-Received: by 2002:a5d:47a1:0:b0:20f:ecc4:7f6c with SMTP id 1-20020a5d47a1000000b0020fecc47f6cmr30560217wrb.236.1653979226621;
        Mon, 30 May 2022 23:40:26 -0700 (PDT)
Received: from equinox (2.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.a.1.e.e.d.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:dfde:e1a0::2])
        by smtp.gmail.com with ESMTPSA id l6-20020adff486000000b0020c5253d907sm10671844wro.83.2022.05.30.23.40.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 May 2022 23:40:26 -0700 (PDT)
Date: Tue, 31 May 2022 07:40:24 +0100
From: Phillip Potter <phil@philpotter.co.uk>
To: Larry Finger <Larry.Finger@lwfinger.net>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Larry Finger <Larry.Finger@lwfinger.net>,
	Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH v3 0/2] Fix some compile warnings in v5.18+
Message-ID: <YpW4WKxKIIgY0l7m@equinox>
References: <20220531013103.2175-1-Larry.Finger@lwfinger.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220531013103.2175-1-Larry.Finger@lwfinger.net>

On Mon, May 30, 2022 at 08:31:01PM -0500, Larry Finger wrote:
> Building driver r8188eu in staging with -warray-bounds exposes two places
> where arrays are too small.
> 
> Signed-off-by: Larry Finger <Larry.Finger@lwfinger.net>
> ---
> v2 - get proper To and Cc
> v3 - Use Dan Carpenter's suggestion for correct patch.
> 
> Larry Finger (2):
>   staging: r8188eu: Fix undersized array in rtw_xmit.c
>   staging: r8188eu: Fix warning of array overflow in ioctl_linux.c
> 
>  drivers/staging/r8188eu/core/rtw_xmit.c      | 17 ++++-------------
>  drivers/staging/r8188eu/os_dep/ioctl_linux.c |  2 +-
>  2 files changed, 5 insertions(+), 14 deletions(-)
> 
> -- 
> 2.36.1
> 

Hi Larry,

Both patches look good to me, however I've already submitted a patch 10
days ago that does exactly what your rtw_xmit.c patch does, in
addition to fixing the changed error handling semantics for the relevant
function (in f94b47c6bde6) which broke the driver.

Regards,
Phil
