Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABB1128F5;
	Thu, 14 Apr 2022 14:00:57 +0000 (UTC)
Received: by mail-pg1-f171.google.com with SMTP id t13so4848423pgn.8;
        Thu, 14 Apr 2022 07:00:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HX049nk0TmeEP2kdzm2STTsgpUopLU1Y6aWDJosY4+s=;
        b=naabtg+kxVaQ4d7MGKGTPGKhAqugJaBeDp6qzYqpcz7YUuhRa89gqTZMuCqA2nIYPf
         UOx1ZvDtx27JG2I7WO3lKBnb51QgIKztX5jogvi0YUwT145B/qwmXa777m4g9MVrLfhj
         ZTG4PgDo3/9kFEZSxCA8HnjNUiwkMxmOotEkhky7RjTvEABzcJr04E07f3d5a1lQlZbY
         MtZ4PyGP5gOU7Px8bO8Fwmo5dZz4zjpzhfxJ/oJq6UjEuKMRcbLpPwmRRTJC4Iy+uzB0
         uxW0xKo6r7qzaRFRvrTQYFSeaDze3vdaPX/LEd3NXPpzu1rbHNrJmmkap18yhaimU0Qq
         tAlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HX049nk0TmeEP2kdzm2STTsgpUopLU1Y6aWDJosY4+s=;
        b=5wVM+gWG7mBBQ0uL2TWHx5mB9yBo+5RQaO4wYlguxRfml0wCNE5nVe/b70uv3be7T7
         MVRRvuTScaSKzrHgoMF+XrGZqLRCKkI5qskgQtv1rsXGmkrnF9/O4+gOlN+DCdqL16bg
         6U1eYfVck3h+fJqNIFwxNAmd55lhEDA7M/XIEZN3cUBwNCBH+wFo3hwaCN2c9kUQ+W7J
         7XvNz915N2p/EuU+4h2NtWmojrnt7ec5bSXkeyeF5EUU88ZqiS4irG3DExdGd6V+jw1l
         S619nm/LY6VULqlczJkxbyNaDZTLd2uWrSVXMVs7I4FS2ewErOzBmPqNxreR/LiMCkfN
         caeA==
X-Gm-Message-State: AOAM531kRd27iotiFuLjI+XqR5s0hQjOw5jfvFULxKPH3VAGvreuB8zl
	cnjsZ7YVtTwhS82Xmyqjli64Y8SXl/OO4jHh8+k=
X-Google-Smtp-Source: ABdhPJwxTQe8hF7c7JhX3kIdck0H1jpfB1pe709GI3R9X3DzaeGY4fUniBJqnKnVXQFTL+cRiBbGEca4/aUeTsYt+k8=
X-Received: by 2002:a05:6a00:2290:b0:505:b545:da95 with SMTP id
 f16-20020a056a00229000b00505b545da95mr4075975pfe.17.1649944856765; Thu, 14
 Apr 2022 07:00:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220413203914.59533-1-aliyarahmani786@gmail.com> <YlfFhZ0o/FSzxOvE@kroah.com>
In-Reply-To: <YlfFhZ0o/FSzxOvE@kroah.com>
From: Aliya <aliyarahmani786@gmail.com>
Date: Thu, 14 Apr 2022 19:30:44 +0530
Message-ID: <CAGTWmRFs7dc2wusqdhND4vc=tT38iw6OHzrzN_3pskLtegnyNA@mail.gmail.com>
Subject: Re: [PATCH] staging: sm750fb: Remove volatile
To: Greg KH <gregkh@linuxfoundation.org>
Cc: sudipm.mukherjee@gmail.com, linux-staging@lists.linux.dev, 
	outreachy@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, Apr 14, 2022 at 12:26 PM Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Thu, Apr 14, 2022 at 02:09:15AM +0530, Aliya Rahmani wrote:
> > Remove volatile to fix checkpatch.pl warning.
> >
> > Signed-off-by: Aliya Rahmani <aliyarahmani786@gmail.com>
> > ---
> >  drivers/staging/sm750fb/sm750.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/staging/sm750fb/sm750.h b/drivers/staging/sm750fb/sm750.h
> > index aff69661c8e6..7a11f8593596 100644
> > --- a/drivers/staging/sm750fb/sm750.h
> > +++ b/drivers/staging/sm750fb/sm750.h
> > @@ -52,7 +52,7 @@ struct lynx_accel {
> >       /* base virtual address of DPR registers */
> >       volatile unsigned char __iomem *dprBase;
> >       /* base virtual address of de data port */
> > -     volatile unsigned char __iomem *dpPortBase;
> > +     unsigned char __iomem *dpPortBase;
>
> So you have properly determined that this code is now fixed and does not
> require this volatile marking?  :)
>
> Please don't blindly follow checkpatch suggestions without understanding
> what they do.  While the use of volatile is probably wrong here, you
> need to ensure that you can successfully remove this so you need to
> prove it in the changelog text that all is still ok.
>
> Also, why did you only remove one?
>
> thanks,
>
> greg k-h

My apologies, I'll verify and understand the code before following
checkpatch suggestions.

Thanks,
Aliya
