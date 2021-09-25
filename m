Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F118629CA
	for <linux-staging@lists.linux.dev>; Sat, 25 Sep 2021 17:33:54 +0000 (UTC)
Received: from mail-wr1-f42.google.com ([209.85.221.42]) by
 mrelayeu.kundenserver.de (mreue107 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MdeKd-1n3FC5486D-00ZiUu for <linux-staging@lists.linux.dev>; Sat, 25 Sep
 2021 19:33:53 +0200
Received: by mail-wr1-f42.google.com with SMTP id t18so37449180wrb.0
        for <linux-staging@lists.linux.dev>; Sat, 25 Sep 2021 10:33:52 -0700 (PDT)
X-Gm-Message-State: AOAM532DywwrDxW/EIR4oPzRNHC+GDysHPWdX6cRnsDHg7MFPC6B6QTv
	DVygWaMX6E81BUa9zdszOQEDmQWkXYL97E0RZlI=
X-Google-Smtp-Source: ABdhPJxHilNyrhkKldS3YRZ1E4Ye2gk1OmIUNcWp41Uyl1sY+smAmPNinSd9bb4kF6SjiPUsqd5p9aU8s9o12e2ei/c=
X-Received: by 2002:a5d:6a08:: with SMTP id m8mr17718929wru.336.1632591232505;
 Sat, 25 Sep 2021 10:33:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210924211139.3477-1-sergio.paracuellos@gmail.com> <20210924211139.3477-3-sergio.paracuellos@gmail.com>
In-Reply-To: <20210924211139.3477-3-sergio.paracuellos@gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Sat, 25 Sep 2021 19:33:36 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3gHsNoyaNjyn3e8=+4YqnAM6YHNna_yKUxf7k8O_od=Q@mail.gmail.com>
Message-ID: <CAK8P3a3gHsNoyaNjyn3e8=+4YqnAM6YHNna_yKUxf7k8O_od=Q@mail.gmail.com>
Subject: Re: [PATCH 2/6] Revert "staging: mt7621-pci: set end limit for 'ioport_resource'"
To: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Rob Herring <robh@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>, 
	Liviu Dudau <Liviu.Dudau@arm.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, gregkh <gregkh@linuxfoundation.org>, 
	"open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>, linux-pci <linux-pci@vger.kernel.org>, 
	linux-staging@lists.linux.dev, neil@brown.name, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:gnzH5hMU/yd8lMu/q762v1hMz9nzjIo/aKvEtjgGrYaj7+NZK7Z
 gcvdEQYhPHhINVczHgYjZIUA32UteFRRST31ViBCcY3FMSUSzzSIgvW7E3nwnO5ZhzDLeR5
 GyVkwCDU7nQbFPWqAao1JolvG/thQ0YZ7RpNgVipL3uqnueTZgcdLk7lZnCqshzJ/pd+siE
 ThZSp9er67MQVX2az20Xw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:XbTBuKAa+d8=:AfYhgHPUAnw6F6Vzl833UC
 Bkgj9pIjwp2SHLOLG7Moh0hsqKVkk4XGTFTKwjdHN9xQ3v5L6SAvMrroc2mIGAD4/MTGylaeN
 JtvcpNJVdaeBCYoAjeSpvbzx9ZBeM93rbCmmaAb+SZHVDTYnSsCshWbfpfsHVLga6L4C9t53/
 wkmfMyzJbBGJh238+2dR8v4duLSmXUjQHaKTM4UM/XfB6DY+RchKhU6Py+Wf6WJ9ZuWc1NH5C
 F7sFOWRsjCuSbr5ZsJLF9bi3BG/DDQy8FIfCru5CsI6PMHO15OqONtTzm8eZ+MkPeg3+ppZGr
 lCoptOW/TbnSfNX59PP9E+GLcx8xc2Sj9V7L12HkkWLTJTTXoViXx6VEXgVV8EIwBnjGfQ3yp
 A501jDcmfO9XzJzCdO6+95TkEMrATBh7mbhA6S2KvU794SsxdfKhwur5iF00inrIfBPwT5S36
 sl46ztp2w5Qxpw5fxoetmPqcM1JGWuJlg1xqHM97OrLBZkchcnJiSqeODDDFhqlHeG6S5jSw0
 zxntoXMT17aVeThSCmUq8mE36A+HFchne6MkwZ8Bvd0c3pZT7ycD3fQceVvKk4u83V5Q1dyVG
 xvDCQHl/iTXL2wBgkHkftHMOGMmM32aPNJBLk70Q9eSJsuawE5Ii+bP2NLZtrDb7X+VDEXy7Y
 1e0rrLE1G7CJGLpgZJdFDGnd8ork3euEbDTNvwQd+rBKuUMSw56QHroWbFz4pyLXGvd7mCAlT
 /XiniviNgmBrhLqWV67WTzBluH5lAyiwT/pWymUaWRTaHDkZtRr80hVRukyyJw/FAaDcQ2a07
 9qkjD16kx3+ESZYaIIsvzKHIZ9Gm/VzlaxWTcUFVHUt42kUfP/Xr1i77s6G5DS37cZWbPQ7pH
 7PewvXd4ps2LGnF9F8EQ==

On Fri, Sep 24, 2021 at 11:11 PM Sergio Paracuellos
<sergio.paracuellos@gmail.com> wrote:
>
> This reverts commit 50fb34eca2944fd67493717c9fbda125336f1655.
>
> Since IO_SPACE_LIMIT is not really being changed there is no
> real need to adjust the ioport_resource end limit.
>
> Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>

Acked-by: Arnd Bergmann <arnd@arndb.de>
