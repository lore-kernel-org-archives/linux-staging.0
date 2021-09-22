Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E0AA3FC7
	for <linux-staging@lists.linux.dev>; Wed, 22 Sep 2021 15:47:38 +0000 (UTC)
Received: from mail-wr1-f51.google.com ([209.85.221.51]) by
 mrelayeu.kundenserver.de (mreue108 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1N2VCb-1mrfGw0JAt-013ssq for <linux-staging@lists.linux.dev>; Wed, 22 Sep
 2021 17:47:37 +0200
Received: by mail-wr1-f51.google.com with SMTP id t18so8320974wrb.0
        for <linux-staging@lists.linux.dev>; Wed, 22 Sep 2021 08:47:36 -0700 (PDT)
X-Gm-Message-State: AOAM5333ZPOs0DMHu0fGazFOoa0nV6pMzzYjHrA1Jd40yBxAv/QRNWkY
	R5ruJpEDxPUsj3MazSrJryxxG8RoVHFpRuxskio=
X-Google-Smtp-Source: ABdhPJxB6TJlgu1o3FLWomlpGuf9FbFSkPg8W1963ZV6qmS8zbuKAuZX7xZ4UTGLotnbbpRUNol21y/AFJHlcpA0/ew=
X-Received: by 2002:a5d:6c6f:: with SMTP id r15mr300802wrz.428.1632325656698;
 Wed, 22 Sep 2021 08:47:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210922042041.16326-1-sergio.paracuellos@gmail.com>
In-Reply-To: <20210922042041.16326-1-sergio.paracuellos@gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 22 Sep 2021 17:47:20 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2WPOYS7ra_epyZ_bBBpPK8+AgEynK0pKOUZ6ajubcHew@mail.gmail.com>
Message-ID: <CAK8P3a2WPOYS7ra_epyZ_bBBpPK8+AgEynK0pKOUZ6ajubcHew@mail.gmail.com>
Subject: Re: [PATCH v3] PCI: of: Avoid pci_remap_iospace() when PCI_IOBASE not defined
To: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc: linux-pci <linux-pci@vger.kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-staging@lists.linux.dev, 
	gregkh <gregkh@linuxfoundation.org>, Liviu Dudau <Liviu.Dudau@arm.com>, 
	Rob Herring <robh@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:Rc6tGpWKuJnaJDz0iCINVTBUC60tDQ1g6zZcY+6Zs7hS4o1lFM3
 u/AyrmGZNjDERgv870dmp/2YMaeSYq25HLrAE+/40UoLEwj/WKi2ZmtQsjW4b5ThT5Itww+
 +X5U6vXBKv4o0AmEwFmCOooWuOxvJdDBi9rHdEX591Uw0bMURNt4KfnR0rwDzYjF+t04sKH
 uOaFO3RqDcPV4czNHglTQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:CPME9/lL8dk=:fP4OVDZ7m5d5NtmM5+bg+H
 t6lSuSE+jRFjqZA2dLuS02jyoEA20xhC5KLB88uWZYigYHUUW1z0DJ3pHyFAOLDFkiBCT43Hk
 5HIYjXpvTOL9GXHErWjiEPXDLec8iPfQyp2bSNlk2YecZBaAgFt7dGiL8Be3zGlJKzifswlLP
 j8pk1kfntUhwHmyKSlV6ezJiYmezUl8LDNn7rl5T2xcLyP9RWiWb8Gs/NF5B6NbJXsoYhP172
 9ezeY6zBSMLwwnyEBHK2ZxMNuXTjVGnYCtBPuqFCtrtAOYgVLDzwSr3uuA8J1ds+5rPj3dmpo
 wqBPeoNcsLvXHH02Cu0L0HLt1u9+SV7wiGGoPUrRw6B2Ut76nyVo7tgzqDLgVnY3gUkTHEiTL
 TffUKSkhJdkHpymewzI3De9maXvJiB16p/Rko+QoE4eu0yNDCyykOHwwGrwRV4LqiWOk1IA6w
 sEHNL6WeIwhiCMxYrN05uedVtu0axHtxxmLZuqxO8GCr/v1fMg4Xe4uj3FjP9dMLrweYZg8zf
 WDV4S1gY6NXon6chWR86adeDAsm6NxH6kCKgwqG3OAJwVDZ2VNK+vMOKvm+Yi8BzS3FOSc9UC
 FLtM3vcqMKa0nTxQd69PGnryksQrJaq7SHlyye/RX2ONmfCuSDArSoLBWnjBj91qbugj1bS3S
 xZXK/QWGFqwgdEYdW2oz0t4JV72nyBH4jkhOd1oVTx/T2GosmPVQQI6zSkkbAVQrM6KaYKvFV
 WmsepST6DRW8iqHlQYiDEeglSeUrZX26WhPSZTd7jHj0eL0vVMFG144jZPtFPsiJHce/IlrcS
 uYknF18seBangbhE2Z/DC2JIP4NkKtvePHE28zbU8zLAlm/bJb+HHH5bPcWBe/edIieGQEw/z
 K8VHFv8PIPDY/w5r5RCg==

On Wed, Sep 22, 2021 at 6:23 AM Sergio Paracuellos
<sergio.paracuellos@gmail.com> wrote:

> diff --git a/drivers/pci/of.c b/drivers/pci/of.c
> index d84381ce82b5..7d7aab1d1d64 100644
> --- a/drivers/pci/of.c
> +++ b/drivers/pci/of.c
> @@ -564,12 +564,14 @@ static int pci_parse_request_of_pci_ranges(struct device *dev,
>
>                 switch (resource_type(res)) {
>                 case IORESOURCE_IO:
> +#ifdef PCI_IOBASE
>                         err = devm_pci_remap_iospace(dev, res, iobase);
>                         if (err) {
>                                 dev_warn(dev, "error %d: failed to map resource %pR\n",
>                                          err, res);
>                                 resource_list_destroy_entry(win);
>                         }
> +#endif
>                         break;

I wonder if we should have a different symbol controlling this than PCI_IOBASE,
because we are somewhat overloading the semantics here. There are a couple
of ways that I/O space can be handled

a) inb()/outb() are custom instructions, as on x86, PCI_IOBASE is not defined
b) there is no I/O space, as on s390, PCI_IOBASE is not defined
c) PCI_IOBASE points to a virtual address used for dynamic mapping of I/O
    space, as on ARM
d) PCI_IOBASE is NULL, and the port number corresponds to the virtual
   address (some older architectures)

I'm not completely sure where your platform fits in here, it sounds like you
address them using a machine specific physical address as the base in
inb() plus the port number as an offset, is that correct?

       Arnd
