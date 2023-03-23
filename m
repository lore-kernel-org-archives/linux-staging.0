Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C677FA93A;
	Thu, 23 Mar 2023 15:23:21 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id b20so55240879edd.1;
        Thu, 23 Mar 2023 08:23:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679585000;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=scQuxxJfm4ub8gU7bTw0rxXChvmi6APTEZr+zioVIhk=;
        b=MI8ikvr8TzjjuijX7Y4Xo6gHXLlP3Esg4/kjR1Thtk+nykXUGES7CK8Vc5p6FaC+Kf
         fBqVUYgvBzafiL6/VLzbNEfqKgF6Kt0tHeHMYUdvWLxG5bRauOjbX4JEN473sFYuCBZM
         K936dQb68Wusisg3Fk65XMXF1kxPyla/wAJxNS8VVZ4LgiTI07vs6bVFH+woAzTXidT9
         esX4Ot+xArGLJWQmh1RHLkR181S7eoNLh2xVIHoC50W0GwOPCWIuTwe8gRjilLb51Dp4
         wRtbom2PW+2/ROs2wmKcNmQ5pqt/CtLckm9GClrVqbdJcB/zNwwE0dLYmzWy5HhOznM4
         CS/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679585000;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=scQuxxJfm4ub8gU7bTw0rxXChvmi6APTEZr+zioVIhk=;
        b=XzlPS4vf231YS62l81NO39gXoEYbG3v9QMcClUZFGV73b2BhVE+qpLvNLkb3Fg/71E
         /+qWBnEv+Cx5KkJTXw0YHVIyhGhxZfuPbSwZaF5Y5+cBkNMNtyH2aVhWKxsAMR+FqR26
         ICQ7UbSy1XB5effwpzut9uB5PGYNx/AdLQj0tEEmXfO+xcaKsYxczgesLpJf1cI3wRcz
         lQDbLFxH/fbx5DNHnz/VQ/lqTBgApHLaMZ8JN04ANfdh/fmHGSs88rRPNOv9smTXwRd3
         V8fdE790zMZGPw3lNDqGtUWzTwSaGEobdPHgBMakJ6sgzt5IbpoJVWmGoqa4sVIxHqM4
         F0RA==
X-Gm-Message-State: AO0yUKXREEiAlbPyi3RRJqM4kqKJgfsk9++9fns8n/Xr5FwfaHcNuTxY
	QYdGq6l1fPToYj1xp8Z7XUY=
X-Google-Smtp-Source: AK7set/DZ2v39lQmt267GFQmOnLCocICmotj5GVBuvWvP0/VI55IsZsHWB3m/fSzpGX8sWvFmM5EcQ==
X-Received: by 2002:a17:906:aad6:b0:930:2e3c:c6aa with SMTP id kt22-20020a170906aad600b009302e3cc6aamr9362522ejb.49.1679584999806;
        Thu, 23 Mar 2023 08:23:19 -0700 (PDT)
Received: from khadija-virtual-machine ([39.41.14.14])
        by smtp.gmail.com with ESMTPSA id t7-20020a1709064f0700b008cda6560404sm8768790eju.193.2023.03.23.08.23.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 08:23:19 -0700 (PDT)
Date: Thu, 23 Mar 2023 20:23:17 +0500
From: Khadija Kamran <kamrankhadijadj@gmail.com>
To: Dan Carpenter <error27@gmail.com>
Cc: Julia Lawall <julia.lawall@inria.fr>, outreachy@lists.linux.dev,
	gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [RESEND PATCH 0/4] staging: rtl8192e: code cleanup patches
Message-ID: <ZBxu5RBG9kCRlwRB@khadija-virtual-machine>
References: <cover.1679573474.git.kamrankhadijadj@gmail.com>
 <alpine.DEB.2.22.394.2303231408000.2866@hadrien>
 <alpine.DEB.2.22.394.2303231408410.2866@hadrien>
 <090ee842-46d0-4f35-bf00-68a3e1393b72@kili.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <090ee842-46d0-4f35-bf00-68a3e1393b72@kili.mountain>

On Thu, Mar 23, 2023 at 04:34:43PM +0300, Dan Carpenter wrote:
> On Thu, Mar 23, 2023 at 02:08:58PM +0100, Julia Lawall wrote:
> > 
> > 
> > On Thu, 23 Mar 2023, Julia Lawall wrote:
> > 
> > >
> > >
> > > On Thu, 23 Mar 2023, Khadija Kamran wrote:
> > >
> > > > Fix several cleanup issues reported by checkpatch.pl in module
> > > > staging/rtl8192e in file rtllib_rx.c
> > >
> > > Why is it resent?
> > 
> > OK, I see, sorry for the noise.
> 
> I'm still confused...  :P
>

Hey Dan!

Sorry about the confusion. I sent the last patch with the wrong email
mistakenly. It was causing following warning as reported by Philipp,
Checkpatch:

WARNING: From:/Signed-off-by: email address mismatch: 'From: Khadija
Kamran <kkamran.bese16seecs@seecs.edu.pk>' != 'Signed-off-by: Khadija
Kamran <kamrankhadijadj@gmail.com>

I resent this patch with the correct email address. I hope I did not do
this wrong.

Regards,
Khadija

> regards,
> dan carpenter
> 
