Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 106E82C81
	for <linux-staging@lists.linux.dev>; Wed, 13 Oct 2021 13:09:13 +0000 (UTC)
Received: from mail-wr1-f49.google.com ([209.85.221.49]) by
 mrelayeu.kundenserver.de (mreue109 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MDyoU-1mQmYF3Jzg-00A0l2 for <linux-staging@lists.linux.dev>; Wed, 13 Oct
 2021 15:03:59 +0200
Received: by mail-wr1-f49.google.com with SMTP id v17so8103188wrv.9
        for <linux-staging@lists.linux.dev>; Wed, 13 Oct 2021 06:03:59 -0700 (PDT)
X-Gm-Message-State: AOAM531isZ/L7cH7nfYCdcIFqD+uADk78LTrhk2/E25QYO2NGnUWXc0c
	R9Z1gT6+U7zO1+iHzl+CqsKYVqWvpLtnlNUyzzk=
X-Google-Smtp-Source: ABdhPJxrqmezALSBTO/BTYl8vNqV31BBADHOaBtQOotspl4zEqXFT9c7CCMDgePjQq0qoxmKIaQg8BmmJRdC0kZoEJA=
X-Received: by 2002:a05:600c:1548:: with SMTP id f8mr13062202wmg.35.1634130237935;
 Wed, 13 Oct 2021 06:03:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211011152941.12847-1-vegard.nossum@oracle.com>
 <YWbQd51r8R3BprMi@kroah.com> <1bfd3945-3487-31ab-5489-9c12c759276b@oracle.com>
In-Reply-To: <1bfd3945-3487-31ab-5489-9c12c759276b@oracle.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 13 Oct 2021 15:03:41 +0200
X-Gmail-Original-Message-ID: <CAK8P3a05E2muUiy0KcRgzhGef-Xg99_pY3gnDpWt7uHmbTxVGg@mail.gmail.com>
Message-ID: <CAK8P3a05E2muUiy0KcRgzhGef-Xg99_pY3gnDpWt7uHmbTxVGg@mail.gmail.com>
Subject: Re: [PATCH] staging: ks7010: select CRYPTO_HASH/CRYPTO_MICHAEL_MIC
To: Vegard Nossum <vegard.nossum@oracle.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	linux-staging@lists.linux.dev, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, 
	"open list:HARDWARE RANDOM NUMBER GENERATOR CORE" <linux-crypto@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:EjhwwdSgbI/fAW8Lgpv0/jqJQBijNu8jyI2vs6SYz42nYgQGCVy
 YJjmgNPjwrR0rz0L2Mjp0wVCvOM3f9F6iNXSUJD2/TL0C0H6OX7kM6PHpaI2BfYg4VsN0vs
 31K+Vi6ANzCK3zgL5xTcxobCQDFUntqkh4AtTauOWt4dJ5XqL5aLEKzjlXVi3/OKpcR+JTs
 1MteEYs/whD5asDVoKzRw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:hdjBB7PMyGs=:Dn2tOoJGTYFgUeyyD9iggr
 iBbQTvnfIUWiYoXHkbMjFSlzW+RPwrcujbHLi/aAgaLQbIzVAQ1eXqu18n87htgZ/DMrR0NlW
 NhdVEj44RLw+VNkOm1x7ibzLV1TjMaqV+AFZ1HILBeoowmD7O0+KFSDoCSwc69U7SDEdhAo9I
 SqBhWCnB86XLTcmQCu7j3K7wzgxWAMDSSoOyjaqG6a+1gJ4srqH9xybUesQ8wJQYc3tZCHAFO
 5kmDQBVS+BYT4vDtS0SY95PZGmU+QWPMfYRJQPuZUB8/vGMfDC3SxiggDLk1CMfj08fap8Dkf
 59UyhkQ/2sUszTKmiWSEhsXUsTCQN3p+konzLU6R9xg7veb83IyR8PzNSV1bobAO5WkxVWXwE
 MBayDKAFO1cJ6hbEDyp82aGTXFYUeFE+pwgfJCDYk3akByBdVILuTCijHAWaci4Me8z/bsTqV
 Nmm7oDW1VERNlRq6SuDa8JIeao1pBrFiM043Fr5dQumTOLTniYxEvJf/00GcVfP1iMv0KrF2m
 p9CmrQJyRuxhBvsqhVM1uyf2T0gdZvFawN5ugC2Xlik9y5MsEZiHkoMRjkrh0p8I5ueAvDHqs
 7yavR/iLoBWC5sN4wyHNmzF6Agu642PoB8Imm2aA6kGIfaa7+Z8tcrZuGGlxjrYMxAuOH/TaN
 sQKFBs/0Ax67nsFo7LcGjx/Iehadz/s4/gMBCPUW52gTnR5Jxw/9m7kn43BiE6bGQj64L2Hbd
 UrCMjCSj++jaTs8qUn/cGwrppW51UWGP+s8yxhAh4xa4vj1lr5bw54/u2rJ119vNsJLwLpWuf
 r7EJaRUIhsJ1QQkfWz0lzJ+NI7VcbNNQ82ji2ta5ZWztEPDhQkY1beUC3FpzU3XDEzRb7DHdU
 1MYXYGKH6E9s3GzR1fHw==

On Wed, Oct 13, 2021 at 2:51 PM Vegard Nossum <vegard.nossum@oracle.com> wrote:
> On 10/13/21 2:26 PM, Greg Kroah-Hartman wrote:
> > On Mon, Oct 11, 2021 at 05:29:41PM +0200, Vegard Nossum wrote:
> >> Fix the following build/link errors:
> >>
> >>   ld: drivers/staging/ks7010/ks_hostif.o: in function `michael_mic.constprop.0':
> >>   ks_hostif.c:(.text+0x95b): undefined reference to `crypto_alloc_shash'
> >>   ld: ks_hostif.c:(.text+0x97a): undefined reference to `crypto_shash_setkey'
> >>   ld: ks_hostif.c:(.text+0xa13): undefined reference to `crypto_shash_update'
> >>   ld: ks_hostif.c:(.text+0xa28): undefined reference to `crypto_shash_update'
> >>   ld: ks_hostif.c:(.text+0xa48): undefined reference to `crypto_shash_finup'
> >>   ld: ks_hostif.c:(.text+0xa6d): undefined reference to `crypto_destroy_tfm'
> >>
> >> Signed-off-by: Vegard Nossum <vegard.nossum@oracle.com>
> >> ---
> >>  drivers/staging/ks7010/Kconfig | 3 +++
> >>  1 file changed, 3 insertions(+)
> >>
> >> diff --git a/drivers/staging/ks7010/Kconfig b/drivers/staging/ks7010/Kconfig
> >> index 0987fdc2f70db..8ea6c09286798 100644
> >> --- a/drivers/staging/ks7010/Kconfig
> >> +++ b/drivers/staging/ks7010/Kconfig
> >> @@ -5,6 +5,9 @@ config KS7010
> >>      select WIRELESS_EXT
> >>      select WEXT_PRIV
> >>      select FW_LOADER
> >> +    select CRYPTO
> >> +    select CRYPTO_HASH
> >> +    select CRYPTO_MICHAEL_MIC
> >
> > Let's try to rely on 'depend' and not 'select' please.
>
> I used 'select' because it seemed to be the established pattern for
> these options.

Yes, this is the correct way to do it here. In general, using "depends on"
is better than "select", especially when crossing subsystem boundaries,
however mixing the two is what really hurts because of the circular
dependencies you'd get.

The only way we could use 'depends on' here would be to change all
the other drivers to do the same.

> Compare:
>
> $ find -name '*Kconfig*' | xargs git grep 'depends on CRYPTO$' | wc --lines
> 1
>
> $ find -name '*Kconfig*' | xargs git grep 'select CRYPTO$' | wc --lines
> 66
>
> $ find -name '*Kconfig*' | xargs git grep 'depends on CRYPTO' | wc --lines
> 87
>
> $ find -name '*Kconfig*' | xargs git grep 'select CRYPTO' | wc --lines
> 1005
>
> That said, I have found several other cases where CRYPTO_* algorithms
> are getting 'select'-ed without also selecting CRYPTO/CRYPTO_HASH, so I
> definitely see the problem you're trying to address.
>
> I've added some more people on Cc to see if there is a consensus on the
> best way to do this for the CRYPTO* options going forwards. Thoughts,
> anybody?

I don't think there is much point in trying to change the
existing pattern for crypto. We might want to change some of those
that use 'depends on' at the moment for consistency, though most of
those look correct as well.

        Arnd
