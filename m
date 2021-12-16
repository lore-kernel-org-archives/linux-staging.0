Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFE3B2C9C
	for <linux-staging@lists.linux.dev>; Thu, 16 Dec 2021 13:50:45 +0000 (UTC)
Received: from mail-wm1-f54.google.com ([209.85.128.54]) by
 mrelayeu.kundenserver.de (mreue109 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1McY0J-1mNQXm3Xjx-00cx2T for <linux-staging@lists.linux.dev>; Thu, 16 Dec
 2021 14:50:43 +0100
Received: by mail-wm1-f54.google.com with SMTP id z206so4734160wmc.1
        for <linux-staging@lists.linux.dev>; Thu, 16 Dec 2021 05:50:43 -0800 (PST)
X-Gm-Message-State: AOAM531Z0tMz5XP8A8CufJ5oO0e54QHXNfxJkkMekPqbW9nf3IECzdRv
	A4Saqes0Nk0LGQ+SHg0dtjsWwlNsiuIT6xOHZew=
X-Google-Smtp-Source: ABdhPJxCd/5MpFbOtsFJckUJOZrM9UCRFM6hiyz1bgYXaPUV/X3iHVLNzmr2Do1QRYr3DDtCk0coUfAVZdKdklRM2bE=
X-Received: by 2002:a7b:c448:: with SMTP id l8mr5023776wmi.173.1639662643472;
 Thu, 16 Dec 2021 05:50:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210925203224.10419-1-sergio.paracuellos@gmail.com>
 <20210925203224.10419-6-sergio.paracuellos@gmail.com> <67687e579e633d42dc501cfb6746c1cb9f600112.camel@mengyan1223.wang>
 <6ee31420-ef67-471e-a924-a0158b4a9428@www.fastmail.com>
In-Reply-To: <6ee31420-ef67-471e-a924-a0158b4a9428@www.fastmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 16 Dec 2021 14:50:27 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2i6eW8JunE_6h6OTCa51eHfPahQQhaGHGWePX+r4ybww@mail.gmail.com>
Message-ID: <CAK8P3a2i6eW8JunE_6h6OTCa51eHfPahQQhaGHGWePX+r4ybww@mail.gmail.com>
Subject: Re: [PATCH v3 5/6] MIPS: implement architecture-specific 'pci_remap_iospace()'
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: Xi Ruoyao <xry111@mengyan1223.wang>, 
	Sergio Paracuellos <sergio.paracuellos@gmail.com>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Rob Herring <robh@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>, 
	Liviu Dudau <Liviu.Dudau@arm.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, linux-pci <linux-pci@vger.kernel.org>, 
	linux-staging@lists.linux.dev, NeilBrown <neil@brown.name>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:FMpKHPPrBHBnd6XN04mB+QDPKEb8dOw5usJhYNPKx8hguL8gGdw
 xDPN6ZaVnXW0dxlU2AZYrbervVw4n1mm5PT6F7ArdFvbiLfHjobt1tWCvPe2Aj/DhJp+q1s
 U82R3eQngXf/NwlGOdeH+/wNTh5b1lctaO2Ci0uYj6LYBF9AtBcnmLkyleb7WirtAPNtJNG
 7hqAons+hz2wytcIT2IHw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:kqlrEpG9dFc=:Vk23M9xCcyTH+mSHuZUQxl
 zgzBzFsivK47UW+H4jOdUrT8+jfzl/OmKAlRSbWy1mCCTo1x33221c6OgRp/mmo2BE1LTDIS2
 iuL9RJ9n9QwwgL5oxePl4IE3IMW1JXla6okG7s7WmHsso9S1UuBiwTt0RcZyApHZ6yzdZTRRn
 sn9wTvLDyv74rus0KSYMPaCguBzs4Yp9esUTgcFDz7YyXQO0tFgJQk8EV8Qa3STQts8S96r5L
 iNycZ/dsju72FsdhH8zlN7jIcpdR1H2byMw/m/T9JEFgpUKzJfDpBbbbT/hWhvAeszACqvDdt
 jrLI7InQpTGnN2pvHXLnZqwQe5nKDkypAXHxw3sXMA/C9hs7ccJk79TMlZuz0IJGTSevwBhoy
 9qg6dmigkVTPisKXpmZ1K9UUpdlyYJ2aobiD5x3RCK6ectvdYnorVs2vwaM10in/CzN2LcLB9
 t5xZGqY+++uGxBWlz1hZTc+s/FX23XAmb+EcZ6a7IQ9bgPkPsoMWCnAOFhidageURqrYZMcET
 BPydb+2ItlxP6AuRoQ5YkMOeHtNaGbLULMtuR4byathMPX1unFp2wQiha7a7OEqktnlSacjfi
 KHX7WQYFTx7lI1zg4mahmSTiuRn0T5laas3TTNTGMya3Rfl9u7bfp2pvwzDFQUbiiI5YrW1MW
 qTE1h6nt6dbNVD2lNju/0f2x8qm/j6aHzGyC6ODDW6Eq2wOHy/tQT28BeVHUL4/DK9SWCL2HF
 bQWTjg5xhQIAtnzygYMlwPcTn/LczbZQaTkgeCXCOglkSHenci+lUwoNawEmJDmEHJVqS7eO3
 cRQ6DdoaQC6OmNn6Q6/xjemyFh1W8Hm0F6/nO87UfUu8ODSsEg=

On Thu, Dec 16, 2021 at 2:07 PM Jiaxun Yang <jiaxun.yang@flygoat.com> wrote=
:
> =E5=9C=A82021=E5=B9=B412=E6=9C=8816=E6=97=A5=E5=8D=81=E4=BA=8C=E6=9C=88 =
=E4=B8=8A=E5=8D=8811:44=EF=BC=8CXi Ruoyao=E5=86=99=E9=81=93=EF=BC=9A

> Another way could be keeping a linked list about PIO->PHYS mapping instea=
d of using the single io_port_base variable.

I think that would add a lot of complexity that isn't needed here. Not
sure if all MIPS CPUs
can do it, but the approach used on Arm is what fits in best with the
PCI drivers, these
reserve a virtual address range for the ports, and ioremap the
physical addresses into
the PIO range according to the mapping.

For the loongson case specifically, that's not even needed though, as
the two buses
have physically contiguous I/O port ranges, the code just needs to
detect this special
case.

        Arnd
