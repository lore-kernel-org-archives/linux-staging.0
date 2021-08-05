Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 031D070
	for <linux-staging@lists.linux.dev>; Thu,  5 Aug 2021 12:37:17 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id u21-20020a17090a8915b02901782c36f543so5506463pjn.4
        for <linux-staging@lists.linux.dev>; Thu, 05 Aug 2021 05:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=q2YXDV7/eiOsz+RdfvqIBMFLQSgaD3AIo5p13mxr6fs=;
        b=TYDIuOhc9quWsDJhIHvMu9yH6z3Tlgs/N5jUgUxE5l5+R9skl+ni+YA6FoSdT320D6
         OTQabJjyUqZgP9Pr7WLz7qfL/ocqaTgQQO1gdwJm9il4vf19nuhdNN8JGLlbTkWdw7dJ
         GrY9fdsVWqm0YO/TuvrlfyxVeC/oYRKBUqObn+aybmLzjsnoMGcNC+TIgkV8ABFIx8q5
         IP/P77qa9hxX+3JibroT8uzbezQdE2LTIjgu7reXD2UbiLFUioOfpezdSGp+c7TePE/A
         qOdbBNyT9ZNMQ0V7lcBRiF1wAyUHgPjNDzbVrTVvr1mZ4tH6tuzzLY22kvDxPBOdPHvC
         g10A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=q2YXDV7/eiOsz+RdfvqIBMFLQSgaD3AIo5p13mxr6fs=;
        b=uQMmXc0m26E5yvtfdjbwawj4XbFq18TafoYss2IQ4jwzgKxlGFIpCHLs+OFqs+SNuW
         LMCk7PPyaSFcOp3LJUFEA1HSIEt0tos+TxwG4S989sWSwPIrxJNKVyab6SpjOJ81Nv4R
         mEr8NIHGpKQSQVUMtAnCbP2Ltpg1n+9x2m/PDGqOhJE63FKbSscNJNFFqB9bfkNzk+z7
         +TZoZlbyCNZtkecdKXMdHlcFaCPLcwcggwnTf6KyGkQxcu36eLkU0lq8GHkxFmdUyLgS
         7JsMi1jfnhbKgf7Io/fZciLRDe/PvBhe63RBJpnwU7h9o53ejgNCINj2QN+297m+Bb2K
         i1tw==
X-Gm-Message-State: AOAM531Emw99/A0DN2WFmIWt/zu3F51EDFrp8c54S+6G6+FSAAxjX1L+
	P6ytpmM0yYXSL25O4ZoqHlJKp9u2iMj2GW2gNFwkmA==
X-Google-Smtp-Source: ABdhPJxUF+xyeus5HBOYkG5CKzPEPP88JY3Zsh2ItnOjHMSm14sy6km+w7mlZg6IG7CxyWUqjnZ8I3mNNvBitbE4T9A=
X-Received: by 2002:a17:90a:1f49:: with SMTP id y9mr15060436pjy.225.1628167037508;
 Thu, 05 Aug 2021 05:37:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210801190437.82017-1-phil@philpotter.co.uk> <YQvAyd2meIE8btpR@kroah.com>
In-Reply-To: <YQvAyd2meIE8btpR@kroah.com>
From: Phillip Potter <phil@philpotter.co.uk>
Date: Thu, 5 Aug 2021 13:37:06 +0100
Message-ID: <CAA=Fs0mViTb_vys9t1DKhFW-1fXxhLRuJM8o=BWqT6MrY9BXsQ@mail.gmail.com>
Subject: Re: [PATCH 00/15] staging: r8188eu: remove core dir RT_TRACE calls
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>, linux-staging@lists.linux.dev, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Martin Kaiser <martin@kaiser.cx>
Content-Type: text/plain; charset="UTF-8"

On Thu, 5 Aug 2021 at 11:43, Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Sun, Aug 01, 2021 at 08:04:22PM +0100, Phillip Potter wrote:
> > This series removes all RT_TRACE calls from code within the core directory.
> >
> > Phillip Potter (15):
> >   staging: r8188eu: remove RT_TRACE calls from core/rtw_cmd.c
> >   staging: r8188eu: remove RT_TRACE calls from core/rtw_pwrctrl.c
> >   staging: r8188eu: remove RT_TRACE calls from core/rtw_wlan_util.c
> >   staging: r8188eu: remove RT_TRACE calls from core/rtw_ieee80211.c
> >   staging: r8188eu: remove RT_TRACE calls from core/rtw_io.c
> >   staging: r8188eu: remove RT_TRACE calls from core/rtw_ioctl_set.c
> >   staging: r8188eu: remove RT_TRACE calls from core/rtw_mlme.c
> >   staging: r8188eu: remove RT_TRACE calls from core/rtw_mlme_ext.c
> >   staging: r8188eu: remove RT_TRACE calls from core/rtw_mp.c
> >   staging: r8188eu: remove RT_TRACE calls from core/rtw_security.c
> >   staging: r8188eu: remove RT_TRACE calls from core/rtw_sta_mgt.c
> >   staging: r8188eu: remove RT_TRACE calls from core/rtw_xmit.c
> >   staging: r8188eu: remove RT_TRACE calls from core/rtw_led.c
> >   staging: r8188eu: remove RT_TRACE calls from core/rtw_mp_ioctl.c
> >   staging: r8188eu: remove RT_TRACE calls from core/rtw_recv.c
>
> I applied the patches here that I could, others conflicted with other
> changes I have taken recently.  Can you rebase and resend the remaining
> ones now?
>
> thanks,
>
> greg k-h

Dear Greg,

Many thanks, and of course - will be this evening though after work
though (BST). Hope that's ok.

Regards,
Phil
