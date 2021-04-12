Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BF0A70
	for <linux-staging@lists.linux.dev>; Mon, 12 Apr 2021 12:40:50 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id j20-20020a05600c1914b029010f31e15a7fso8600235wmq.1
        for <linux-staging@lists.linux.dev>; Mon, 12 Apr 2021 05:40:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mDtDoRs+7JTKmRSNbYm/eoC5RrOrbwKn07hGic3mdK8=;
        b=rWpSopbfXoidRd+rBu8OzHyrQSkM/8rg+DbhCxV40cfP343hyJOaPcMVGstU61R6HS
         FB2FfC6o7MQv9Scm43yyGbYMY4eDR26hRa7lMtjQLsMj0aVRtGpPFCTMjzSkZPHGqM1C
         ludoR4jQjsaAzQvje06u04ytzHvzkLSKkLIzF523OkzNQV+Rabg4BSNY0koV6kmI7yNj
         9SD/NpA1ohOrGv6jkWGVx/5bXWbyWWLoybs3/aoWgy0fg8yvFSNAWCQGT7Q9AXj8TRdd
         7+IcHxNf0ahsCTBp2Q9vjkz9Vp7+xAVUYZpzrHyZxK08kFePpDl8i6RiyFmnFRdlLme2
         PUlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mDtDoRs+7JTKmRSNbYm/eoC5RrOrbwKn07hGic3mdK8=;
        b=NQaYjEOAlzPYFjUM6qoQa+8VfUmDpa52npLbCfhEh8WQmAxj1Q3gm4JX7lwfwTgK80
         8cWVybzrFwV0Pat3+gz48UZ8266SJgPUeFPbZfucoWO1QlOdA4U9gDZuMe+D6vCicULf
         d+1cgdMoIZIZvoUmf4pQRqnSZLjJjGnY4R+t5aa0HRnG+PAYHa/heM+tU0uHZnHXWcKv
         URuTR2SUEjbH4NKIzg1Xn/DePx4CEJxlAiwFnllAY4qeaonUZnRFEUPguogz6VLl8Uf5
         TyyCmDooXxXOSLJ8u8TrE2f07pBBiRd+S0gX3tlu5D3j2taoIXq1YvMqIYvSlFyLAx6I
         IZow==
X-Gm-Message-State: AOAM530AQKVtnHx0JWA4B0SKJ+W79FQcu918ltghXBOk9iElfBHuvlCx
	X/PPEI56mYfHgHnHf+CAN/MCSOyws+hrIWYkUEw=
X-Google-Smtp-Source: ABdhPJwwzJV0JxFgyJYKPbig9riaMMb4hkRQqbS7qviEMxuCuPwShBYC81dKvxPFisExlNuFbUS1LVEVUA3QZEcTxAM=
X-Received: by 2002:a7b:c003:: with SMTP id c3mr26208794wmb.59.1618231248564;
 Mon, 12 Apr 2021 05:40:48 -0700 (PDT)
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <1617957240-53633-1-git-send-email-tiantao6@hisilicon.com>
 <CAGngYiVfattJKO7npMHTagxNfzU-B=rP3FoZ89_yzy-c=Zw2RQ@mail.gmail.com> <44f55f42-cb52-f705-c40a-6d5c1844f56b@huawei.com>
In-Reply-To: <44f55f42-cb52-f705-c40a-6d5c1844f56b@huawei.com>
From: Sven Van Asbroeck <thesven73@gmail.com>
Date: Mon, 12 Apr 2021 08:40:36 -0400
Message-ID: <CAGngYiV2dH4nLkFocyL4YkYkL3qu_kyB5ELZbWLeFMjjsFRpwQ@mail.gmail.com>
Subject: Re: [PATCH] staging: fieldbus: simplify devm_anybuss_host_common_probe
To: "tiantao (H)" <tiantao6@huawei.com>
Cc: Tian Tao <tiantao6@hisilicon.com>, Greg KH <gregkh@linuxfoundation.org>, 
	linux-staging@lists.linux.dev, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Sun, Apr 11, 2021 at 9:14 PM tiantao (H) <tiantao6@huawei.com> wrote:
>
> What about doing it like this?
>
> -static void host_release(struct device *dev, void *res)
> +static void host_release(void *res)
>   {
> -       struct anybuss_host **dr = res;
> -
> -       anybuss_host_common_remove(*dr);
> +       anybuss_host_common_remove(res);
>   }

That looks like it could work. Can you resend as a "proper" patch,
please? To tell the versions apart, simply specify [PATCH v1] [PATCH
v2] etc in the patch title/subject line. Then below the patch's "---
line", add the version history.
