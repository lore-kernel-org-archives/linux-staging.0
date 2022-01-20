Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2438B168
	for <linux-staging@lists.linux.dev>; Thu, 20 Jan 2022 12:29:01 +0000 (UTC)
Received: by mail-oo1-f51.google.com with SMTP id v10-20020a4a244a000000b002ddfb22ab49so2280292oov.0
        for <linux-staging@lists.linux.dev>; Thu, 20 Jan 2022 04:29:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=H6QsODldDl5vUgs0b13/9aR4jGe2tT2snE0u6JkjQn0=;
        b=bRYyD/20jPnVHwXJmaGTX2YCs+KqgLPib7Z/rbv0dldagVrFIPz+H41ONzcGaNucFo
         OQyzpSyQaLbKHpT/DKw0GYF4hbcmllmux8krdcoQ4lQf5jJasFMrlaSfcjz+nG8gtzLg
         hkPJqVsKb7hNA4diqJOApKL9/Uk1JtR7+zKzcKQbnzhii5ZFILXhHvFjHtZyHum17ljo
         iAzlFpRJccy6CeEre/amrfejwXnKnQR/fFqnGUYBNs8t0HQaqybTmmut/01DG2ue6q49
         fmWDwdNewwcebVTlhHZ/wNU8yfi80s+/+CKX+M3jl8DiGVIAlRD5OOS5u4yhlVxkTk+F
         TWNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=H6QsODldDl5vUgs0b13/9aR4jGe2tT2snE0u6JkjQn0=;
        b=rh27F2hhvxPmWtcHfqlqSMpxh12BYg/Ob9grTJqF2Q1kHl+XOAsfUzv0oSuK1sz2/c
         LmTa7UDXYjJCQQ2bShQDrOt3xKyTR23ICIDT+WfxD8d3M24/UPTmZBWRllYV78n4s/kn
         rl8AcB7qpLzPSRUaz/KN30GRhGiH7SmL+2m4ZIl32RLt4IMWShKMUSvSiTeDO6eoLqe8
         MRBeAwbpbFdeLRJ3xkK0LQaFmQAj9ZWK8Kng/KVFk+Sffi8m6cbbYUFIG05qxvWNZSue
         K53XxQKU4XibqhxZJAWWQy+IXOaypLGCFnkxqFtUrr3+38tK3PRmzjqXZ3BA2MQaJbY5
         BmLA==
X-Gm-Message-State: AOAM532Td052n8oyfrYuoQrS9viOEDvDj+rdSWYjusyJ6xHPbjJSOLxa
	nGeJrpqCOyX3cl8rTqYO2WWbfARcnjnvcwUIk6Y=
X-Google-Smtp-Source: ABdhPJwq+Q1G+48YsvpIZjULWllI1ZZq8IxUCv3NoC6RCpfoN12YDpvhjJHY2y/Fk/0gKRLrY7mIKHTWU2iTepMCcEw=
X-Received: by 2002:a4a:b4cb:: with SMTP id g11mr25861335ooo.46.1642681741170;
 Thu, 20 Jan 2022 04:29:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220116192611.19224-1-makvihas@gmail.com> <20220118150728.GJ1951@kadam>
In-Reply-To: <20220118150728.GJ1951@kadam>
From: Vihas Mak <makvihas@gmail.com>
Date: Thu, 20 Jan 2022 17:58:50 +0530
Message-ID: <CAH1kMwThGSp7v5BuPvRiY44i6TvLbK2an0iqGw-_r3RZYOADzQ@mail.gmail.com>
Subject: Re: [PATCH] staging: r8188eu: handle rtw_init_netdev_name() failure appropriately
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Larry.Finger@lwfinger.net, Phillip Potter <phil@philpotter.co.uk>, 
	Greg KH <gregkh@linuxfoundation.org>, martin@kaiser.cx, straube.linux@gmail.com, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

>> This doesn't really fix the bug.  Better to re-write the error handling.
>> See my error handling guide here:

Thanks Dan for the guide. Will submit a v2 soon.

On Tue, Jan 18, 2022 at 8:37 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> On Mon, Jan 17, 2022 at 12:56:11AM +0530, Vihas Mak wrote:
> > rtw_init_netdev_name() calls dev_alloc_name() which allocates the name
> > for the device as per the given name format.
> > It returns a negative err code if the format is invalid. Currently the
> > name format is specified by the module parameter "ifname".
> > Warn the user if "ifname" is invalid.
> >
> > Signed-off-by: Vihas Mak <makvihas@gmail.com>
> > ---
>
> This doesn't really fix the bug.  Better to re-write the error handling.
> See my error handling guide here:
>
> https://lore.kernel.org/all/20210831084735.GL12231@kadam/
>
> regards,
> dan carpenter
>


-- 
Thanks,
Vihas
