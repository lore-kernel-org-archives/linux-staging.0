Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BCE03FC7
	for <linux-staging@lists.linux.dev>; Sat, 25 Sep 2021 17:38:41 +0000 (UTC)
Received: from mail-wr1-f50.google.com ([209.85.221.50]) by
 mrelayeu.kundenserver.de (mreue108 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MzQXu-1mqEil20ae-00vN6O for <linux-staging@lists.linux.dev>; Sat, 25 Sep
 2021 19:38:39 +0200
Received: by mail-wr1-f50.google.com with SMTP id i24so21457703wrc.9
        for <linux-staging@lists.linux.dev>; Sat, 25 Sep 2021 10:38:39 -0700 (PDT)
X-Gm-Message-State: AOAM532u1JRJMtqlgcW0AJeGPh8k3gP2DJidOterV7bzfCY06RslEMTF
	Vmawu1wCsLdKX7TI047biluOu7mE8HbAtNm9HJE=
X-Google-Smtp-Source: ABdhPJzy03N7tVhfn6aBkr45ZQOyfoDC04by9fsZmXLOn/y0W1o8uKfR6dX6QCxoxxGwp2bNJq5CkcHyUSMV7fPDOXk=
X-Received: by 2002:a05:600c:3209:: with SMTP id r9mr7825038wmp.35.1632591519149;
 Sat, 25 Sep 2021 10:38:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210924211139.3477-1-sergio.paracuellos@gmail.com> <20210924211139.3477-5-sergio.paracuellos@gmail.com>
In-Reply-To: <20210924211139.3477-5-sergio.paracuellos@gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Sat, 25 Sep 2021 19:38:23 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2YiGm=2TSKGotXRR3vJjfv+xhyZuD-Law57UDiagHZxg@mail.gmail.com>
Message-ID: <CAK8P3a2YiGm=2TSKGotXRR3vJjfv+xhyZuD-Law57UDiagHZxg@mail.gmail.com>
Subject: Re: [PATCH 4/6] PCI: allow architecture specific implementation of pci_remap_iospace()
To: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Rob Herring <robh@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>, 
	Liviu Dudau <Liviu.Dudau@arm.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, gregkh <gregkh@linuxfoundation.org>, 
	"open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>, linux-pci <linux-pci@vger.kernel.org>, 
	linux-staging@lists.linux.dev, neil@brown.name, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:O/2t/QnwhcIFzH4T8nC38vK6CR9e+Vq68h6iSZmo9gSdtXgQdsL
 z7JpsC9ro59tXorVfSoYEUyQpgwHyuEx16m82e2jnWBU8nmHLp/3efoN/e/u+GFjGwCCe1D
 wi/EwTYZheqYzwjU5nfWdv/8kcYChqnARGwrYHzQGwVcSHorFzZWN6j/bAAklgq5Nqo1tS6
 a7tc0cVwy5CtAduP9lZGw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:49nm1oih/BM=:aQuLuqnL5Sgy0Tj9HPdlh7
 zIntJHFtEFOm1XSZMbgZXTwmvm95iSb4I0rUG7tP6ruY9xBPVj6fo58dsbXfvdbfmLd6O2jcb
 LsPRODhxWraclfcDxI7BMcv9QZ9cvI9XxkSAhTvbfAkaQVkYMswqqppDyHnx77n/LGEQ/NwxK
 PezKq/CngKKV/GugNdre2kDCHOaKNvnKse9GshZPyIBBSP87xfMSBDVPo/2I5GG6Inup7rw9M
 o/asryQHaVKeGmmJa/4aHGvieYfI3rgp/c5LinDNwB/q03QIqiFEQsE6/xDMdGEqQ8HQGYr/n
 m0JWsYcErtMwzS2RFTGQP7s+JBo374PUkKVyhdT2NjIyIy9Lss/i5LmWNNnExXaKwFJM/oklx
 EhmfrRCPvDIc6kcKcJmh0ToU0ajz+ZdXUwIinCGAWyv/ZZKSYcL2/gjttBb1yLhtSzvksTcFB
 rjrNJ3U90WDbI1Dvjc3lX0dNFi77Cu9yCYWxTMPuJcsAKqyof+uSUmpoq1JcePCRdNhW92W2Z
 /FkhE5mltSrSQC/fFhNTwkOpWJeVu5h2Vlfk8wP9lAFwSz+eqYu4k03aVSdgPSXJMa+C7hsLW
 NH6D6HEn9+40BsfuTugywzNXPiwN/zLo1EtxoVXcu3X67viqiSqGCatjFo/C7+OK2PpE71OfU
 sTXl+541x3LSxtidaW1qWDfITqTj+93JjG9I3JaOMkWfIqE6zFC30ZGL/MBFBEcKOR1Xc/KqK
 PzgH0wc/NQPyqqiyTQvj59v74IbjkZ9TLLCW0FCo9crFbofQHVbLJ8WY6hgw2yVhq9l8c2Iil
 6s5esFBgJZOV4+RRyJsQUW59fBSPCY57XgpPFANDV6r0YIUdwcPjHYYIv0nhsA1mrtUanbU47
 xGGULvbFJRCMFGo2L1+A==

On Fri, Sep 24, 2021 at 11:11 PM Sergio Paracuellos
<sergio.paracuellos@gmail.com> wrote:
>
> pci_remap_iospace() was originally meant as an architecture specific helper,
> but it moved into generic code after all architectures had the same requirements.
> MIPS has different requirements so it should not be shared. The way for doing
> this will be using a macro 'pci_remap_iospace' defined for those architectures
> that need a special treatement. Hence, put core api function inside preprocesor
> conditional code for 'pci_remap_iospace' definition.
>
> Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>

Acked-by: Arnd Bergmann <arnd@arndb.de>
