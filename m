Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 235FB29CA
	for <linux-staging@lists.linux.dev>; Sat,  8 Jan 2022 21:02:25 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id ie13so9497833pjb.1
        for <linux-staging@lists.linux.dev>; Sat, 08 Jan 2022 13:02:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=AgMkKh2nRCL0sWaRzvFbnX57uQaqM5obk1wN1aPXyqs=;
        b=NyvArGJdrnc5MOWILFNQfErNaxxr7AOqU9m8UDaYBjGbjcmfOuxIxooL1vHrca3HNX
         +oETpvAOYpYOLVrHuGr04zJd0UhnTfl1FfR5QshXou2dj7ckg2yky3DSiEYqWtNtOoez
         qrFj9Xv3KPjwb9AVb0DoKsNVSAx+3GViXBjAkxWqTCkTFsmlv0WtrimHInHy4McmXKax
         mN9s+Tdxp4Qu/F7QBJGWqdWWCOgS4UO8ChPK86NvjOBJp59EzaSFr2F+E33ln9XZW89A
         lvn4bNbbXhhJwpTpsKlhooogawAgKa7fr+RlWjEvV3INGIC4ycWf9xoTr6mix9AHsJwQ
         RzYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=AgMkKh2nRCL0sWaRzvFbnX57uQaqM5obk1wN1aPXyqs=;
        b=XUYZ7IsjZ8stucPMuLkeLznaBKMSAhiWYx8JJVupQgSzhnnF5wpAd6+BjUBS0YgE/8
         QW44RXy2QpOCjqTYh1ZWTCSd8GZIsfyJM3+N/an7ELU4CFzmyZ6DzKjuIaJtQ+c0ywI9
         yPmpSJev8aAK7Hj3ZO1tiQgAsOUnhM0oFu6dy5ylNXgX6WIGB3a7sPQwteCUlOEbiLoX
         HB0xMdJHTZxzeVHb+AdlIkFrVjghdKGrUHE3HCNj8HAZWT+Z1EvqAULNpWznVuJ5TjOf
         WVYqrzRQNQD+Ph4VUOqe80n74BFrqcaz3mVKmPElRxx1z4vW0gzG6MgZwIHLB/qLZVNo
         hW1A==
X-Gm-Message-State: AOAM532Th02hkDGNxM/X+8dscNhJNrXHeWs0wR9nrfnnlExqbUxwrrud
	k0Zy+35F6EDMv4F4fGP3hvQ=
X-Google-Smtp-Source: ABdhPJwf0QXJyWP0Pug2hy49yzRWhKDwGaEEOTJzOQ4syk3iWAWlZBC3Jbtp06U9hhljk1cWgzQVpQ==
X-Received: by 2002:aa7:8084:0:b0:4bc:9423:96b2 with SMTP id v4-20020aa78084000000b004bc942396b2mr31424279pff.45.1641675744668;
        Sat, 08 Jan 2022 13:02:24 -0800 (PST)
Received: from mail.google.com (122-58-164-114-fibre.sparkbb.co.nz. [122.58.164.114])
        by smtp.gmail.com with ESMTPSA id z7sm2273499pgs.4.2022.01.08.13.02.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Jan 2022 13:02:24 -0800 (PST)
Date: Sun, 9 Jan 2022 10:02:19 +1300
From: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
To: Sidong Yang <realwakka@gmail.com>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: pi433: move get version func to where all
 other functions are
Message-ID: <20220108210219.GB3660@mail.google.com>
References: <20220106201430.GA3416@mail.google.com>
 <20220106213325.GA10767@mail.google.com>
 <20220107085343.GP7674@kadam>
 <20220107192438.GB2693@mail.google.com>
 <20220108111910.GA1978@kadam>
 <20220108163621.GA26654@realwakka>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220108163621.GA26654@realwakka>

On Sat, Jan 08, 2022 at 04:36:21PM +0000, Sidong Yang wrote:
> On Sat, Jan 08, 2022 at 02:19:10PM +0300, Dan Carpenter wrote:
> > 
> > Yes.  Keep the error handling.  Your way makes the code more complicated
> > to read.
> 
> I totally really agree with it.
> Because the switch clause under this patch catches error with 'default:'
> but it returns '-ENODEV'. I worried that it lost retval from reading
> register if it has error.
> 
I will add it back to the patch.

thanks,

Paulo A.
