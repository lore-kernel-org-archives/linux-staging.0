Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD8F7168
	for <linux-staging@lists.linux.dev>; Mon, 18 Oct 2021 07:57:17 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id i20so66531476edj.10
        for <linux-staging@lists.linux.dev>; Mon, 18 Oct 2021 00:57:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HxP9FmqmfEaYqrTDx3Bipn3FnKmcfcL4+wP2KmotZvw=;
        b=fvudk6ZKIcg3nxc46JUcMYdXO1pUiNOPX7EXQ60tcUWsRcDMOktxOIwUp9gPEEmXHG
         YqWYPlU+srC1lSBoFWaMRDkkWPshDQirDcMp6ueZOFdAQZbhdmlGKtqjEStCwhADGNRu
         UvOOk+4d2m3oUxs/hrHqI84GjCs/Ekxt5Jhzk+XFhF8wdMwpo83WWn8+RVbkQPdZRntp
         lUnGJDid4gFm7PJmejvdtWBHOtdw4sAlMQ3Aek0ZpAbT1hhNM9P5ip8Ub4bSrQEGKs6H
         dIuQAlg2/nvYdz5A/j7vLllE5Lhy0s5cuFgKUqfcSOEHKLCeyVMcTQAVhUpsMtW36FgL
         ynvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HxP9FmqmfEaYqrTDx3Bipn3FnKmcfcL4+wP2KmotZvw=;
        b=7rWY4KG1JCqvL2vduuSFVXB9+DzgQfKQ7UOdA/QeD9AaUyV4P8/pkROVvwTaUeNSX5
         WrcuVjh17I++XVXGzUfIBofm3H7MroeSY0Cl9JinyF6Rk/DJTF5tWyHGKrrEQvKnU+K7
         8EqahP+VDJp06K8NTwpP4wijzsOkfCLsmqS39G6jLoJe8EIk5YNZGaMcwhPfte9M4qfQ
         QfZzzP6vn+bOTNBcOe/0cstBu6ofWm3OUit6henQORGIp33L8dDINNRvO46+tJiIKOo3
         RU5RTZrHBo5FT93yZtKUVm0tFq1h7nTlUBIi0Yi4wGaih+U7PNwpqcrurZpAHeuRGi0Z
         IJEg==
X-Gm-Message-State: AOAM533hEhDAHRPrT2fyU2kkZakQ+IHhOM0xR1rFmuW8/phsTeeuwJ0f
	2RhqrCKGUI9kRPaGtsKJ7IYsLC7o4Qil0PG5PrM=
X-Google-Smtp-Source: ABdhPJx1BV5cfPdBHoVU8zz0N9TiuGEE0ScuwlkW/XZZ3Pw8QqYsdGObM3d+Y4gsRadRDV9xw+UEdzoLDAzplkXWfPM=
X-Received: by 2002:a17:907:8a27:: with SMTP id sc39mr27409842ejc.567.1634543836032;
 Mon, 18 Oct 2021 00:57:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211017161958.44351-1-kitakar@gmail.com>
In-Reply-To: <20211017161958.44351-1-kitakar@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 18 Oct 2021 10:56:40 +0300
Message-ID: <CAHp75VcDZQ1M2iNKewxqcG3C+bzSEGV05dTmYp3xXhnhNGdviw@mail.gmail.com>
Subject: Re: [PATCH 00/17] various fixes for atomisp to make it work
To: Tsuchiya Yuto <kitakar@gmail.com>
Cc: Hans de Goede <hdegoede@redhat.com>, Patrik Gfeller <patrik.gfeller@gmail.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Yang Yingliang <yangyingliang@huawei.com>, 
	Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>, Dinghao Liu <dinghao.liu@zju.edu.cn>, 
	Alan <alan@linux.intel.com>, 
	Linux Media Mailing List <linux-media@vger.kernel.org>, linux-staging@lists.linux.dev, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 18, 2021 at 6:45 AM Tsuchiya Yuto <kitakar@gmail.com> wrote:
>
> Hi all,
>
> This patch series contains fixes for atomisp to work (again). Tested on
> Microsoft Surface 3 (Windows) and Xiaomi Mi Pad 2 (Android model) with
> v5.15-rc5. Both are Cherry Trail (ISP2401) devices.
>
> I'm still not used to Linux patch sending flow. Sorry in advance
> if there is some weirdness :-) but I did my best.

I agree with Hans, you did an excellent job!
I will try to find time to look into this. In any case it seems to me
that this is a material more likely for v5.17-rc1, rather than v5.16.

-- 
With Best Regards,
Andy Shevchenko
