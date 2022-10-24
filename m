Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAE2D809
	for <linux-staging@lists.linux.dev>; Mon, 24 Oct 2022 11:23:20 +0000 (UTC)
Received: by mail-vs1-f50.google.com with SMTP id n63so7534331vsc.8
        for <linux-staging@lists.linux.dev>; Mon, 24 Oct 2022 04:23:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Awx4Y/bO+loraqXV2AwEp2ffosaIQWTq0T6Y6GrQT7k=;
        b=Cz6V7CP8AWHCdwsemLxu07MC9m7ITS+yO8mBsVa1Li7ubhohU9ejYTd6wpV/DBbAkH
         18PwV7GrJ5iAl+ZyO+WodecqmYYXHKjhfgUsjzCAH8jPdVorpUVaYbDC2cYrbpJscuZ9
         RxT/X9/kzbbL5ypjogrMqUXwUMk+HJmdNuSMOFptvq6hW2+jIFnNLUN8gmjbVAMbTsO/
         hore48c+Rbeimbyx3YUo4gMXWMfYRXZU5zNDFoJ1P+/pRh1xfuvA3EorJlzK2Nkag/lt
         nSy9gl84iB3rugxbdxIZObICASo2iYQoITLpWmm4RhdPDlVON+XeOoTiz8z77ht6Jd4x
         RahQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Awx4Y/bO+loraqXV2AwEp2ffosaIQWTq0T6Y6GrQT7k=;
        b=UEw4F2tptLnnMe3hfFGTG19RYkGclbDvGu2PculxKztDS+L3hyUJCJC8X0+m0AhpmZ
         yOX7fDaOCMski4dCEsAXzJDpZsN+YEcb5faScjkO/IMWZU5qO2BOdjq0kLQqFBv/+26n
         JBhqicOTbpL9r3ThY80WOYT9ois+xYHYmd2mdLu4ADBKEYaG/l5n/Yjuq8ODj3CM6vA1
         KuJMbo8ClhzRtepP+bCAqgAVlIsO7HCEIj5vCKqlZJbzu/NZrk77tL1Ne9YCPAJx4vrH
         rKhhU0GfJ88FpKUXeGbIWjHdFIIlCdT8RthUZ0VqP/aKr4ZkUpG9gWsruYszQ6IpLevy
         MwBg==
X-Gm-Message-State: ACrzQf1F/3D00HoEmhySAB9vz/KWGuliEVwkjGlgkXDmiCzIFhvjVXdl
	tAPK5jSS6dQbzd/mgifDisf/TbPkFSOo3JzfXFM=
X-Google-Smtp-Source: AMsMyM4w1m/n473eX50mXZOCB5avuhNpyZkjf7DSvmHsNlfuajMASiPUtsXyBVnUfUSAi+5Mu8c5pAIHU5fijfO9em8=
X-Received: by 2002:a67:db0d:0:b0:3aa:12be:c26c with SMTP id
 z13-20020a67db0d000000b003aa12bec26cmr3828320vsj.26.1666610599422; Mon, 24
 Oct 2022 04:23:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221024084925.262289-1-tegongkang@gmail.com>
In-Reply-To: <20221024084925.262289-1-tegongkang@gmail.com>
From: Kang Minchul <tegongkang@gmail.com>
Date: Mon, 24 Oct 2022 20:23:08 +0900
Message-ID: <CA+uqrQDuJQ3yBY8_re===u0f97pyr_hn_VNu6LqLJAZnDeqhVQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] staging: r8188eu: cleaning up unused variables
To: Larry Finger <Larry.Finger@lwfinger.net>, Phillip Potter <phil@philpotter.co.uk>, 
	Pavel Skripkin <paskripkin@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

2022=EB=85=84 10=EC=9B=94 24=EC=9D=BC (=EC=9B=94) =EC=98=A4=ED=9B=84 5:49, =
Kang Minchul <tegongkang@gmail.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> This patch series cleans up unused variables in r8188eu
> causing coccicheck warnings.
>
> Difference between v1 and this patch is that this patch series
> include making function amsdu_to_msdu in /r8188eu/core/rtw_recv.c
> into void function.
>
> Kang Minchul (4):
>   staging: r8188eu: remove unnecessary variable in ioctl_linux
>   staging: r8188eu: make amsdu_to_msdu void function
>   staging: r8188eu: remove unnecessary variable in rtl8188eu_xmit
>   staging: r8188eu: remove unnecessary variable in rtw_ap
>
>  drivers/staging/r8188eu/core/rtw_ap.c        | 5 ++---
>  drivers/staging/r8188eu/core/rtw_recv.c      | 5 +----
>  drivers/staging/r8188eu/hal/rtl8188eu_xmit.c | 3 +--
>  drivers/staging/r8188eu/os_dep/ioctl_linux.c | 4 +---
>  4 files changed, 5 insertions(+), 12 deletions(-)
>
> --
> 2.34.1
>
Oh, I guess patch 4/4 can be fixed as well.
I think the function rtw_sta_flush can be void as well.

I'll resend the patch later.

regards,
Kang Minchul
