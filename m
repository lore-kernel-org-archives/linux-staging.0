Received: from mail-io1-f42.google.com (mail-io1-f42.google.com [209.85.166.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69C6C5F
	for <linux-staging@lists.linux.dev>; Sat, 27 Mar 2021 00:24:07 +0000 (UTC)
Received: by mail-io1-f42.google.com with SMTP id k8so7122605iop.12
        for <linux-staging@lists.linux.dev>; Fri, 26 Mar 2021 17:24:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kWcmqDNjSgMeYn5Nyg6J1/NYCGWlgfXicWyx1OhC3R0=;
        b=fquED2wSUv+ch67CdubGSg9f3jFh3Ancb7wrovx0Mrm+9Ggnl0IkSRmnTwHEbHWAdA
         bqC6Ww+oq2UTHbSfdNo+9sd25RJ04Q+7RaXWC61DG/pNRNaa0KocZC6ekNem/SSQvuJl
         RwU+NcmNjOxUbGevJ/gkoVb+cIudsZU2IgADFYPk28IPnVOvNCcIXrC2Gj3sWssvJtrQ
         2tqh7b3fS7P7gZGVTA3Nxi1qMsmirjED1/UARMgp2Q4miOqzBrPFNPqCsgRALuZd8pKI
         7JRt+X4OaOr3r3ABP1v2YvQL4qw+yeGaDjagZf3FJnH0ZDsrbYe+NLyd1WgR7q3HKHmF
         surw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kWcmqDNjSgMeYn5Nyg6J1/NYCGWlgfXicWyx1OhC3R0=;
        b=Qjyl6/881ieU4sLRW86n9PWt7vbfv7YYklQ2TxcfEAQDnVJTifFEUI7T0qE0nsOMg2
         hC+ndO6fL1NSmZ3Njo8mwrfHvEgBQquzhnu5Nce4k90nOt8OkU/jFanJyYE/1CAtM2fM
         CZHI3a4uWXzCQn/eyLVIvAuyl8OJo6/CTpgXUJHkrFg9kqJXtdiCcZZqQD2sPmVm6/Rh
         WLennv1mmMX2EvrzEa2AXIt9xwiq446Zc/c5pnl2uvoR18IYcY06bL0whkUK43/B8m6h
         nFbr1KH17WNxJ0Bryz5izmf8JAwn68KF4OBQUCjI70dgyppncJKY0QynCua0ijTSDo6y
         au3A==
X-Gm-Message-State: AOAM533qT0yuemzyqtVSqEKqFCUxowgBGcTuarPDXZk45GsZndVyw9qL
	PuXhuIuAmlZ3tXuDdC4YxThaMXnGn65POIr/B+k=
X-Google-Smtp-Source: ABdhPJzu7X7HTviVbHkO5+zIcPCigw6WEAd8ddThIawVm1vOGA1G3GM5EznMV/T1gx0+zvz6xyc79nvVfFF1qMD+4KY=
X-Received: by 2002:a05:6602:1689:: with SMTP id s9mr11811345iow.171.1616804646661;
 Fri, 26 Mar 2021 17:24:06 -0700 (PDT)
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210327001736.180881-1-eantoranz@gmail.com> <20210327001736.180881-6-eantoranz@gmail.com>
In-Reply-To: <20210327001736.180881-6-eantoranz@gmail.com>
From: Edmundo Carmona Antoranz <eantoranz@gmail.com>
Date: Fri, 26 Mar 2021 18:23:55 -0600
Message-ID: <CAOc6etY0QruhUJtEQqD8sx1zn4SNAw3rGpMiyS+kDz=uYcBLDw@mail.gmail.com>
Subject: Re: [PATCH -next 6/6] staging: rtl8723bs: sta_mgt: return _FAIL if
 there is an error
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Marco Cesati <marcocesati@gmail.com>, 
	Dan Carpenter <dan.carpenter@oracle.com>, Ross Schmidt <ross.schm.dev@gmail.com>, 
	fabioaiuto83@gmail.com, linux-staging@lists.linux.dev
Cc: kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, Mar 26, 2021 at 6:18 PM Edmundo Carmona Antoranz
<eantoranz@gmail.com> wrote:
>
> If there is an error when calling rtw_init_bcmc_stainfo() inside
> rtw_init_bcmc_stainfo(), variable res is set to _FAIL. However, when


I must have been half-asleep when I was writing that. :-D Sorry. I
don't think it's that bad that it should be taken back, though.
