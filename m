Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3C2F3FC7
	for <linux-staging@lists.linux.dev>; Mon, 27 Sep 2021 07:51:28 +0000 (UTC)
Received: from mail-wr1-f48.google.com ([209.85.221.48]) by
 mrelayeu.kundenserver.de (mreue106 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MfqGN-1n1c7k1n7h-00gIhy for <linux-staging@lists.linux.dev>; Mon, 27 Sep
 2021 09:51:21 +0200
Received: by mail-wr1-f48.google.com with SMTP id v17so6294071wrv.9
        for <linux-staging@lists.linux.dev>; Mon, 27 Sep 2021 00:51:21 -0700 (PDT)
X-Gm-Message-State: AOAM53020JuNE2hCGSJOuR1YrYse1ut11pYSm8BCeWkLEiEEkWYAg2gf
	QYOzlvNIXjJxAkNWzT5Q+u6HRY25ODQamahuAi0=
X-Google-Smtp-Source: ABdhPJwNcwXck71rNE1/gI90KB/Jti/UtvWTFzI7YuAuJdYp1B3gd5+yHJu01In4gT34cm6LdQkR+GmwiEb9qD7ilRE=
X-Received: by 2002:a5d:6a08:: with SMTP id m8mr25539649wru.336.1632729081037;
 Mon, 27 Sep 2021 00:51:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210925203224.10419-1-sergio.paracuellos@gmail.com>
In-Reply-To: <20210925203224.10419-1-sergio.paracuellos@gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 27 Sep 2021 09:51:05 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3+54S2=-=ch1+XWuNQRoOCDdQhtBhu3CKOdqcSNzu8YA@mail.gmail.com>
Message-ID: <CAK8P3a3+54S2=-=ch1+XWuNQRoOCDdQhtBhu3CKOdqcSNzu8YA@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] MIPS: ralink: fix PCI IO resources
To: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Rob Herring <robh@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>, 
	Liviu Dudau <Liviu.Dudau@arm.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, gregkh <gregkh@linuxfoundation.org>, 
	"open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>, linux-pci <linux-pci@vger.kernel.org>, 
	linux-staging@lists.linux.dev, NeilBrown <neil@brown.name>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:ZmO8lEosbt6Vss5TAj+9EFyv/jFY3X6SGWyXkEP9Rgmq6PilFiZ
 Akn64IWCRg78wiBw+JXsu8GzQpXEi1PB+XLf5h5dU0J8LfkuGUePDWkJ0CPfspwkJNbp7Ui
 dWFT1hXET16eYNDVA4xhoOJ5xzjjphIWqEqnI5gNaDL6RSYeql0NUfXc9YSGlvlTCHCL5hd
 RAgboElRit2ZD9Lf5adJw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:vIJfllUGadM=:P3GyOx3r36rYzUH5oQX2MG
 Dn2gKrOfPwj6XWN7B6egk6/GQF1W4QW6ct7KnXDeStYuETCr6bI/ygiK2qkAbIU73k1fB0nC5
 bl8P2Ivsu3nm8Eb6HLP4lKlA1bCyRoezqoGMS7UY4B2Momu0kf942Jcc/ZIkd5e3pf64Iuqem
 2dDhVtfozeidHasQPR9IYey8HfrtkAZqobLuw/HfO8oSjMDU+RLm1wn7G8NbgioB9/WHTKADY
 07rYRFxlj4LiiPpxb0q2wECOMhoUxuV2EFe2BmuByihlpopyYbPovn1cEyifo0WB9IMKYqJF2
 Oh49r4dqqM318cI8uZrT+gSo5Ilmngae9ilXHCUrk1Q1fCRBi3pHEV1NzS1OB1Ze2xggYUw/y
 4XLCZVgbMKfWmMNGak4m3/BynASgJOUXbeou5gcXvD01xdMZ5shDeeaoCg7teUp+JHveUJd2r
 sPMiXWjGSj98PFtaTvDbCruA/7Egexi5UIw2smT5JXhc3m41HuIqhqvS0F2stK6BAvxL6R2PK
 bd0VBP9U5p8LmBLpcZVOTSWjF05JgNq5EnE0JieGcYr3Kb15iFye7h8gV0mvYVAE6tcqjdaN2
 NkH+DalnC1ohJv73i9vDGEWwzOqBM5t2tsjJ+icvaZywB4HzQV2EIj4ISgJ/KdQHcnGDt16KV
 Q9lvab3X9FO15r7n5ZG4fjBidn3l29DspvLTxSgbDzbhh6XIa+QnKYQ7p8tzYFURv/P6+jvtk
 X5LW0vdrhO5nmoqSYA+Taxe8UBYXLVswPMAXDAdR6wb3nJtIEji+5gO9rkA6CtxBF7onvq8yP
 STQQUH15rT18i6Xois5csLJILmjU1G/fEiwxAFJyliRFkr9jAZPtrGLKNJoYzJKcgSpBpapWJ
 m6aWNfmOOfCPPxuxhTgg==

On Sat, Sep 25, 2021 at 10:33 PM Sergio Paracuellos
<sergio.paracuellos@gmail.com> wrote:
>
> Patches related with reverts are from this merge cycle so they are only
> added to the staging git tree. So to have all stuff together I'd like to
> get everybody Ack's to get all of this series through staging tree if
> possible :).
>
> Thanks in advance for your time.

Looks all good to me now, just one general remark: Try to give a little more
time between respinning the entire series, otherwise you get the opposite
effect and reviewers start ignoring your emails after getting annoyed at the
number of emails. Once you are reasonably sure that no more comments are
coming in, or you have made substantial changes, it's time to resend the
series.

        Arnd
