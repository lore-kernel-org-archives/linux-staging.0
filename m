Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 188D972
	for <linux-staging@lists.linux.dev>; Thu, 25 Nov 2021 01:32:32 +0000 (UTC)
Received: by mail-ot1-f53.google.com with SMTP id w6-20020a9d77c6000000b0055e804fa524so7095615otl.3
        for <linux-staging@lists.linux.dev>; Wed, 24 Nov 2021 17:32:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tcIV9fs5PyBSfa8FV0YzjooJWjW0D+74R3qAHQeRX8M=;
        b=QUhGk3vk91ygQk18q/T2Obk2GdUO7o4voQUE+c550rL2W99ipNmHT/v6D+I5MNCNju
         s78xKvZ4o3fNcLDsBIkwt3npsvk2nbziDgNlI2TT7BHn5QqvcwLBVlERPA9jPjaROtc7
         /Ru3j06woPJtEhRt6j+8fVxNvSqVvBJsIyk3cgwqbmeY85/E3MU+e6ayx0mbVYtqlt6C
         hU7hoDbOYxat10F4yktTnsiUOOMqWxvpGqNdNBav4McUizb94Hgl9Cl3tdKS+THTSTRq
         YTiutGC6w/50nsgnwLCUmmSUgg0O1KpKYq5al+IeHKw1HFfmsuS7k8jNSVN+fCBfWk1s
         4RsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tcIV9fs5PyBSfa8FV0YzjooJWjW0D+74R3qAHQeRX8M=;
        b=QyMeyVdwCLzwbAJNWCCPar+GSwugcpmGI6KgVNINNfVBshWSNcmakOtQmfCMrLh+vw
         vYcZK67QdD6I1E3QBHB+Dv6hX07DFkQe87X78IU3NcOptdPX03Qh+upo/x/RWbv6OVJR
         TKDEMkb92SCVHBkS4lBs+BEjSTu4/1ADDBLvmlekSOz9eBgcA7XfdtGrW7Ty0W6EFbNB
         oj06rW3iqYtYymZQqCqR6Y0OaolVc88euHJ+6MWM664Di+2TvWa0OK9zdDs54wNq7FNK
         aQkMNQiHiPoitHvwJvjAvquhssQOmyFv0KvRPert9D+YODQvat7clH3//wjVROWv+2I4
         LM2A==
X-Gm-Message-State: AOAM532Zf0OqoFv4WsoTYYY69Y/83MiM9QuxEPXDyDQkuKqGGdRMQB/x
	/Y7sEaEujNvdkt5hudUtkoQs9sYeufbr80smfR4=
X-Google-Smtp-Source: ABdhPJxitMWPao0qjKr4Y4SZbF53M1MtR/rPyuY0L6znUn1P5gW/0cKis5BNE+ptHSw62jbZT2mp5fzErNiD6xYc9I8=
X-Received: by 2002:a9d:326:: with SMTP id 35mr17920012otv.41.1637803951319;
 Wed, 24 Nov 2021 17:32:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211122195350.GA166134@makvihas> <YZ4NL3TvLYMa/Tzu@kroah.com>
In-Reply-To: <YZ4NL3TvLYMa/Tzu@kroah.com>
From: Vihas Mak <makvihas@gmail.com>
Date: Thu, 25 Nov 2021 07:02:20 +0530
Message-ID: <CAH1kMwRPLP998GjKx7bkL_LQE8hVNdCThwBJ7W8iNo1mPUyEZQ@mail.gmail.com>
Subject: Re: [PATCH] staging: r8188eu: remove unnecessary NULL check
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Larry.Finger@lwfinger.net, Phillip Potter <phil@philpotter.co.uk>, 
	straube.linux@gmail.com, martin@kaiser.cx, 
	Pavel Skripkin <paskripkin@gmail.com>, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

>> And are you sure this ever could be NULL?
Yes.

The function rtw_free_netdev() performs a NULL check before actually
freeing the structure, so the "if (pnetdev)" check isn't really
necessary before calling rtw_free_netdev().
That's the reason why I removed that check.


On Wed, Nov 24, 2021 at 3:30 PM Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Tue, Nov 23, 2021 at 01:23:50AM +0530, Vihas Mak wrote:
> > remove unnecessary NULL check surrounding rtw_free_netdev(), as the check
> > is already performed inside rtw_free_netdev() in
> > drivers/staging/r8188eu/os_dep/osdep_service.c.
> >
> > Signed-off-by: Vihas Mak <makvihas@gmail.com>
> > ---
> >  drivers/staging/r8188eu/os_dep/usb_intf.c | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> >
> > diff --git a/drivers/staging/r8188eu/os_dep/usb_intf.c b/drivers/staging/r8188eu/os_dep/usb_intf.c
> > index 5a35d9fe3fc9..392bd7868519 100644
> > --- a/drivers/staging/r8188eu/os_dep/usb_intf.c
> > +++ b/drivers/staging/r8188eu/os_dep/usb_intf.c
> > @@ -466,8 +466,7 @@ static void rtw_usb_if1_deinit(struct adapter *if1)
> >               if1->hw_init_completed);
> >       rtw_handle_dualmac(if1, 0);
> >       rtw_free_drv_sw(if1);
> > -     if (pnetdev)
> > -             rtw_free_netdev(pnetdev);
> > +     rtw_free_netdev(pnetdev);
>
> As Dan said, this isn't usually a good idea to hide this.
>
> And are you sure this ever could be NULL?
>
> thanks,
>
> greg k-h



-- 
Thanks,
Vihas
