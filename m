Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CD5E2C9C
	for <linux-staging@lists.linux.dev>; Thu, 16 Dec 2021 14:24:18 +0000 (UTC)
Received: from mail-wr1-f47.google.com ([209.85.221.47]) by
 mrelayeu.kundenserver.de (mreue107 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1M734j-1mrYCU1f6F-008bWL for <linux-staging@lists.linux.dev>; Thu, 16 Dec
 2021 15:19:05 +0100
Received: by mail-wr1-f47.google.com with SMTP id q16so3688353wrg.7
        for <linux-staging@lists.linux.dev>; Thu, 16 Dec 2021 06:19:05 -0800 (PST)
X-Gm-Message-State: AOAM530RBd2ktYJlg5sah2P6qUYpF8QDJ6xtkvdEtsESkx0lcPedDAIb
	7HogXAXdmZoMZO9MaZKwm8P4VtzYO+XBM3pKzvo=
X-Google-Smtp-Source: ABdhPJxmplO/8wUtDmbZb8q9bqy7ZOfHV5yg368TQTzX4lBN+OEsoFiUjwpCE3vTs4ls9wlTx+wNiOOu6o9NNRcFeqQ=
X-Received: by 2002:a05:6000:52:: with SMTP id k18mr9356273wrx.192.1639664344795;
 Thu, 16 Dec 2021 06:19:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210925203224.10419-1-sergio.paracuellos@gmail.com>
 <20210925203224.10419-6-sergio.paracuellos@gmail.com> <67687e579e633d42dc501cfb6746c1cb9f600112.camel@mengyan1223.wang>
 <6ee31420-ef67-471e-a924-a0158b4a9428@www.fastmail.com> <CAK8P3a2i6eW8JunE_6h6OTCa51eHfPahQQhaGHGWePX+r4ybww@mail.gmail.com>
 <bfdfb7b3-1322-573d-eddc-1d337c4616e6@flygoat.com>
In-Reply-To: <bfdfb7b3-1322-573d-eddc-1d337c4616e6@flygoat.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 16 Dec 2021 15:18:49 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2iQhxckn0MfLyLpKmyKN_MwAJ0t2yh6DLsS0MvdreYNA@mail.gmail.com>
Message-ID: <CAK8P3a2iQhxckn0MfLyLpKmyKN_MwAJ0t2yh6DLsS0MvdreYNA@mail.gmail.com>
Subject: Re: [PATCH v3 5/6] MIPS: implement architecture-specific 'pci_remap_iospace()'
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Xi Ruoyao <xry111@mengyan1223.wang>, 
	Sergio Paracuellos <sergio.paracuellos@gmail.com>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Rob Herring <robh@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Liviu Dudau <Liviu.Dudau@arm.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, linux-pci <linux-pci@vger.kernel.org>, 
	linux-staging@lists.linux.dev, NeilBrown <neil@brown.name>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:dWBVB5b6XrDkizHcWzX3LH4f+gRyipM+GUHitXLuVhok3XKOJc7
 NP4Sy8x8+jXDeUYsg98+0YNcKd2u0o3lpH5qS41H/AcKgU25wJPaBMb7vLgEutdp7lTAwjH
 otqMjr/H7NPLeaaY1mWxN0fSAkOY0V7JTIa4bNCJvfXcI8SbkxnwdYTiAGzSUjPA8KDnYIy
 9qRA6/WAjVYQZYa38ah3w==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:0CvVe6k4WTI=:/5YWDTGVOn2Vimc6bJs5i3
 BqoirTMpoNXqkF0eycOnYCMYaXqrpQD1Ha1FYGP6O561/5A0WZZ+lVXPApOHXN12NA4wFnVsF
 YhgGEX3Lvb1ZtDVGosiC7hMR6964DE1sC+oEhRtb7w0X2bK04zODugIUqwIYcbzjE8Rs8Mwui
 pYCZLyHHptTp/a6ZCRbs01AQH/E696xevpjKNkqxKnZJzwFFTGJiJaMCmUbvTZ9W9NzHqyV4F
 zDIGZC4ikoEgflC+gtmdqH2SfN/mbIQgyJstiuR8n1iR+GT+N2TAbjfSv6Uxak/6ozV37RBTT
 3pNdewEIjOWcN6vAJzK3DkSP7athptbNNFeWQq6zSpYYYLTIEMi+2vX9j/5bi91O9HoxsVqBB
 A9pUT2mamzgkY65Zxreyr9sEthOHYswqe0P4erCKmbyDxh8rveqZ7+yRcUsO3m3r8hmL/rUrB
 iUztAtcG4fFGx1jv00l0Ww/kfObPYbyKn4FqMNYJjNyneB3atkDzzMtp4KdtPw2lQcFQ00ngn
 a3OmZ9U7efcFiymDcsbO2PkQqxOxpxNR7JkZgJZugTtLGPxC7vgNBRHlSEYmDkelL14lY2wJQ
 MwvLAnNn4Qn2yDO9qN6K2K3QZl1AozlVTaUbEuy58qjR3RBN9NOCTG57rmhN9Ob2COCgtMse6
 pJzwB6lw19wxxoUbPIX+TtNaNzSTiiwJGq58qzrlRlcopSHgCeTcxvdcgwanzZjXLVMkVQQEX
 a/Tg4iNBDSSdd5FQ3AnzOy1jUMXLKCz0y4PVhR/sMQknHBVgBMHEGNpq0gfJhjbDftlUHRMUm
 3GoktHF85cwH7i3rXw0t6cwH1u1z+g6UZnr8elG0vyKGztaiGI=

On Thu, Dec 16, 2021 at 3:14 PM Jiaxun Yang <jiaxun.yang@flygoat.com> wrote=
:
> =E5=9C=A8 2021/12/16 13:50, Arnd Bergmann =E5=86=99=E9=81=93:
> > On Thu, Dec 16, 2021 at 2:07 PM Jiaxun Yang <jiaxun.yang@flygoat.com> w=
rote:
> >> =E5=9C=A82021=E5=B9=B412=E6=9C=8816=E6=97=A5=E5=8D=81=E4=BA=8C=E6=9C=
=88 =E4=B8=8A=E5=8D=8811:44=EF=BC=8CXi Ruoyao=E5=86=99=E9=81=93=EF=BC=9A
> >> Another way could be keeping a linked list about PIO->PHYS mapping ins=
tead of using the single io_port_base variable.
> > I think that would add a lot of complexity that isn't needed here. Not
> > sure if all MIPS CPUs
> > can do it, but the approach used on Arm is what fits in best with the
> > PCI drivers, these
> > reserve a virtual address range for the ports, and ioremap the
> > physical addresses into
> > the PIO range according to the mapping.
>
> Yes, the Arm way was my previous approach when introducing PCI IO map
> for Loongson.
>
> It got refactored by this patch as TLB entries are expensive on MIPS,
> also the size of IO range doesn't always fits a page.

Are PIO accesses common enough that the TLB entry makes a difference?
I would imagine that on most systems with a PCI bus, there is not even
a single device that exposes an I/O resource, and even on those devices tha=
t
do, the kernel drivers tend to pick MMIO whenever both are available.

      Arnd
