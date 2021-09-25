Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 946983FC7
	for <linux-staging@lists.linux.dev>; Sat, 25 Sep 2021 17:33:24 +0000 (UTC)
Received: from mail-wr1-f44.google.com ([209.85.221.44]) by
 mrelayeu.kundenserver.de (mreue010 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MF3U0-1mfC2M2FGi-00FQkp for <linux-staging@lists.linux.dev>; Sat, 25 Sep
 2021 19:33:22 +0200
Received: by mail-wr1-f44.google.com with SMTP id t18so37446365wrb.0
        for <linux-staging@lists.linux.dev>; Sat, 25 Sep 2021 10:33:22 -0700 (PDT)
X-Gm-Message-State: AOAM5309YoTTFNKjGNL2OkrzshuZSbhFLptjtJb2FLo4BcaqFBLAHMIC
	DZZdVdFaEONLRY7+jBHKZ68XRnpS5NW3jsIDyoQ=
X-Google-Smtp-Source: ABdhPJz71+W5QKw02u9tzKycAUfeIQyFgilizU1qNL0MVKu7i8r/pw9Qp17Rg7H+KND57HeXcwT7x94QOx8SGQmJwGI=
X-Received: by 2002:a1c:7413:: with SMTP id p19mr7959099wmc.98.1632591202155;
 Sat, 25 Sep 2021 10:33:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210924211139.3477-1-sergio.paracuellos@gmail.com> <20210924211139.3477-7-sergio.paracuellos@gmail.com>
In-Reply-To: <20210924211139.3477-7-sergio.paracuellos@gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Sat, 25 Sep 2021 19:33:06 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0LXzyC1y4QapdjvtC2WRu8hU_0hENzZrz14ufoVP3ceQ@mail.gmail.com>
Message-ID: <CAK8P3a0LXzyC1y4QapdjvtC2WRu8hU_0hENzZrz14ufoVP3ceQ@mail.gmail.com>
Subject: Re: [PATCH 6/6] staging: mt7621-pci: properly adjust base address for
 the IO window
To: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Rob Herring <robh@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>, 
	Liviu Dudau <Liviu.Dudau@arm.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, gregkh <gregkh@linuxfoundation.org>, 
	"open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>, linux-pci <linux-pci@vger.kernel.org>, 
	linux-staging@lists.linux.dev, neil@brown.name, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:Je2F8sFefstsR6A+SgVicut8hRMk+6cyP1cl0zH6KDPT3O37g7W
 FikVSqHVTVdLf6C+CuNTD3YBKXqLQh9MRweX+MMH/E4PmEYq0fptReOMIkrnq3uo/0CZZDe
 SlNwI2AhtMBTJp+GNFuIMbVe1avoy/sF1B2bCooxzZdqeuPGIQUHSxN+BagFMEehEZ2uR0B
 fLtH2H+MlzlbtJpHLHGnA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:2enO981ZNss=:uCBvOgCzWpX6YoCgsEwu5J
 uhPfBrphprdFeOUYlmydqZy0KW2XuizWq9ztkoZuqWsHU+Vjl9eze55QSUL6AshJ/KKpCILDl
 +wbEXCgZiA4bmtxXLNclo8mkuSLLQIhoEmR4IAoSZF11U/iAudGozhc0kiiNZCN1Kcnt/uZc2
 5gQcBQo/9m9bvtdVHWWYjIgYnss5l2RoYXeVsTnVVtOYl8kx0FFraBzrDxlS2+/jcBe+gl+8V
 n6EdWBe/CB2kEVKdxjl8YL4bydaim96dd0sKKVzTaZ3Xdv5ezywgeJ1GNNX07m+rMBSeKKMSl
 Wb8v0P/ZCWSVF5hjNsG1okrvqvM5MrkiraPnq7zcDn7iBs0hIV9JRWvJ6pdBuC8+2RBZzkw+8
 EwfHQ02OcqawegD1wcDhHb5kOsq1oqPlYb+neqaNgkuu9qfX8+Jyy7kQkH7KIdSkzAGqIZShk
 GqhA2jOjURysQ+PbrDFfkTgzjvPK8vNCVG+fDlXLHTrlEASNRphZe6jBmqrHBUYcpvGXqHohT
 7KTB8f05WuEvSOpMOAAvLn6lAP1cNHCiO8jSW2NNr2FazvWntkP9ztN7bHXXjRia8aJWsmA+p
 HrXzCaYp3VR+bkBxF5jCtpvLxBlCmxGwN5CJ1pcIykWONvKhmvs5hhE2UMPxkWInKRyywis9v
 e6z2hkWZEgAotd7cl9Ghm+gXsTzVfMe1ew60CSz3BHtkhSgBAzQAlXHcVPrUK3+S2WN7joMY2
 DuOsiRBe8kKU55k2rQ0rkBesHLejAt6TiNrv2kGyffiSofuBi8a7Y2pH3zKRH48l/5yxIUpTu
 S/iVye0rFvUXgjfPgEuk230srecRO8VlQDWeEb/3exnOTmpI5CxwJlb8HV+aIG9QOELnrqCzw
 IR7BuZF/ybgqycbspnhQ==

On Fri, Sep 24, 2021 at 11:11 PM Sergio Paracuellos
<sergio.paracuellos@gmail.com> wrote:
>
> The value to adjust in the bridge register RALINK_PCI_IOBASE must take into
> account the raw value from DT, not only the translated linux port number.
> As long as io_offset is zero, the two are the same, but if you were to use
> multiple host bridge in the system, or pick a different bus address in DT,
> you can have a nonzero io_offset. At this means to take into account the
> bus address which is used to calculate this offset, substracting it from
> the IO resource start address.
>
> Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>

Acked-by: Arnd Bergmann <arnd@arndb.de>
