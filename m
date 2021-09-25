Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E1D172
	for <linux-staging@lists.linux.dev>; Sat, 25 Sep 2021 19:34:27 +0000 (UTC)
Received: from mail-wr1-f46.google.com ([209.85.221.46]) by
 mrelayeu.kundenserver.de (mreue010 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1Macf4-1n0nIx45VK-00c8G0 for <linux-staging@lists.linux.dev>; Sat, 25 Sep
 2021 21:34:26 +0200
Received: by mail-wr1-f46.google.com with SMTP id d6so37856741wrc.11
        for <linux-staging@lists.linux.dev>; Sat, 25 Sep 2021 12:34:25 -0700 (PDT)
X-Gm-Message-State: AOAM531aYtKXAmUZ40hrjhehqrjdlIUQ8GqMJVS0R9IuHebVMIElIjRF
	KBRQODNP5/jgQElxce7gOCAsS9lDXKKfcCWithA=
X-Google-Smtp-Source: ABdhPJwbpmHIdWFL4NwLB5kag/+wj+bWLQfp5Mtq/+97YD9kjJkKuMkhEupsEM0B7gpocdwbiU1czX+HWHnqtWzRS8w=
X-Received: by 2002:a05:600c:3209:: with SMTP id r9mr8157627wmp.35.1632598465533;
 Sat, 25 Sep 2021 12:34:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210924211139.3477-1-sergio.paracuellos@gmail.com>
 <20210924211139.3477-6-sergio.paracuellos@gmail.com> <CAK8P3a3SpuioCVBfQpHFGuNQoXG7g8w9VL+V8rYd8Q80Od89HA@mail.gmail.com>
 <CAMhs-H8jF10NpTgCP=_FEaBcedTN75b6MoyrEVrrayJEAdufwA@mail.gmail.com>
In-Reply-To: <CAMhs-H8jF10NpTgCP=_FEaBcedTN75b6MoyrEVrrayJEAdufwA@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Sat, 25 Sep 2021 21:34:09 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0p0YwsiG8NgZGPxGp=GwTLXfEO=D=CY3TtmYwiDSuaXg@mail.gmail.com>
Message-ID: <CAK8P3a0p0YwsiG8NgZGPxGp=GwTLXfEO=D=CY3TtmYwiDSuaXg@mail.gmail.com>
Subject: Re: [PATCH 5/6] MIPS: implement architecture dependent 'pci_remap_iospace()'
To: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Rob Herring <robh@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Liviu Dudau <Liviu.Dudau@arm.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, gregkh <gregkh@linuxfoundation.org>, 
	"open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>, linux-pci <linux-pci@vger.kernel.org>, 
	linux-staging@lists.linux.dev, NeilBrown <neil@brown.name>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:xrV4YbbRWYxz6MKfoTvWWG/ERwpOVJiZIAXkjPamSTwlpo1G6vs
 B50yo5pVtWSkuD55+t0XYNjzr5QNNGJn6YsKaStJWeJfs4EKe1MJQujSn1Enc8JOGOLPXJo
 gfHLKXDLjMr/fcdcj9iG9LQqqY8GCh9cmANyAcCjjvy1Ek3b4HvKm96CrDJnj+zzG2Bi1mD
 sTxdz5bJ/9w7Q2driEn7A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:hNBwF+IYgpQ=:Rshc3SW6SrOngjuVMmpz/j
 8JvnrGO7wjBWSIhRPYrdxfvwXOyjRVwKMPanmr39CgQsb3i1D0O9ZEkxyYQIXIqtXckhkKdQY
 3IWpXABm6QJ5M18hz4sYI3lIuVWVGYiMvfnTNlYz09CThE3ranuXnezagfT90bBDSZulnNziu
 TIJvnwvD1nTuIk/BclyOtDQy5OP2RnLSYRaAcA5w76ztA8TfeGTUr4phcV23LI6kMhh7U3C8V
 PlX3MSfuVLpFZEY5Ghut2xFClPGynPc/wCeUfPafksUn5kTkE33Ri61NuP3rE25+LU1JXzuSo
 OjQzFW+BWl+P41KGEyfWd0NgY195kzoYiyTxcfHov7HWqONbfvJc3AFhUg9T9gcVNg9xvpiFB
 vlOfRJl9UkyKyp2F8ndOP/ziS8urlX7gVDvcXoikbBySOWeTXm9zXH+Cq2RDPV1rZTP84eY9c
 YAD8kocU8NywADrra+r99SXLeJPaECAuZMDfY160FddaetXuCASfkbEicJ9I+ZRdy+qkapL8P
 2LxrXA5p+7pXG+hyX1XyfVmy2U1zlTIdHaCdbzCzslAoKh+QlcDydw7gqwVpoQmeDpQvrZbrk
 +P10wvxoJxz0n79iWls6Y/aFZUMRc4QAfIsNZClIvXqiDXDpz8qAuXct2QHnbHrEqVy8C5ryD
 YAFRmpMarYvUA41D2sNUMHPhJ8riXi4EabkB5WS6awDjxJEPLL1WfktTPw9FPIeDBcSMB3Uap
 5FmxNaCRISfcMQMQWTj2tUTrJfenX/4yUvlFU8T+QAMduW45jRWfeUSzeG6SHv1/67gv2zaaA
 LvUsPuUPnOqlui64hxoivMX54aVbJj5gS6nBmLS2LUY6lxEXo4FtT7mfej+j6Yu/szldyTPpU
 PjZb2k3HlzKAIedQecWQ==

On Sat, Sep 25, 2021 at 8:10 PM Sergio Paracuellos
<sergio.paracuellos@gmail.com> wrote:
> > It might be good to check that res->start is zero here, otherwise
> > the io_port_base would be off. That could happen if you ever have more
> > than one bridge.
>
> Do you mean something like the following?

Yes, exactly.

> int pci_remap_iospace(const struct resource *res, phys_addr_t phys_addr)
> {
>     unsigned long vaddr;
>     size_t size;
>
>     if (res->start != 0) {
>          // Should I WARN_ONCE or just show an error/warning message??
>          WARN_ONCE(1, "resource start must be zero\n");
>          return -ENODEV;
>    }

I don't care if it's WARN(), WARN_ONCE() or pr_warn(). If we ever see the
message, the system is not working and the person who caused the problem
will figure it out.

        Arnd
