Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82B8A71
	for <linux-staging@lists.linux.dev>; Tue, 27 Apr 2021 17:55:42 +0000 (UTC)
Received: by mail-oi1-f179.google.com with SMTP id m13so60472185oiw.13
        for <linux-staging@lists.linux.dev>; Tue, 27 Apr 2021 10:55:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Z2Q/8gmoCmD7vH0wfhQaChr0vts1hhFRsOkvHAH8Hog=;
        b=NfbWOcv1fu2GcaGe2N/8AmFqmw/m2sf8Ni9F5gcEu/GEl2jLYSS3CMDrPjtQJyGNWG
         b/Dc+6bSDRWmBYzmojotCKkGuamXplidFWqPE/7TeYyskNgRQuV93T+q4lwTWvqMm14s
         8FGGWWhF1ngcb3V/tGxPKTzlZP7/Wl/4CGc2tI7szf/64ab6Tp8/s+ypN31RVJRbV/3k
         wTOSjjTB6T/lZoWwtfZro6A1UCIFkZmp+C6snYvCdcHlDKUW6Wi2/DEg56HVXcksWugE
         XQFAd8V6tg0WcXIWFMeTzZx4U8icIB8yXBO6bZAbiT8ZwkAgpNKRrnhvnWnBOMtoPjOx
         KZNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Z2Q/8gmoCmD7vH0wfhQaChr0vts1hhFRsOkvHAH8Hog=;
        b=OcfxYfwePVFJFJJ8aQbu9IeACZMMt17JLPpRyLRTUmN88Dz86N84WZa+24R9URzOX7
         BofgFH4hBTdBSbOviCz4Cn9Q1ZgGSGaMjo9W6KU97McxBmkU6jUxCbsiU0z4wbuOks+k
         6dh6YYnd60Be4HF+ASfIPupPzTML6AAm9+a6DZjv9/UG+jdgDKIMzbSsL7vaL10f75WE
         iwuieF3T0o7xSrJtvKmSLnZexi93lxpDrXlKReOkmBoIKmf6eL3oHYGQv1y4XwLfBxdy
         K3uXPox0nJfnlMawJQ/1+k+UNAYB6PMYO11sBrkckNtmEJJgORv95I9u/yAufdG6Z5Zm
         zokQ==
X-Gm-Message-State: AOAM533RX7fwRv2zwnqDB9WXUbLm/aZC0Q9RBlFpp9B6qwyKHNwOLZR1
	fbJsP56qLl8rvZE7vyvIUMqNqh98FWhAAX/P5VA=
X-Google-Smtp-Source: ABdhPJw1i7ij/hMDyEHbRwYoGwLuBgXyPTsVPVA+DOb6v02lZdFHPseywNtdWGAExHm99gx3A+bPDpm4obEixNA6UNc=
X-Received: by 2002:a05:6808:1393:: with SMTP id c19mr4673637oiw.149.1619546141714;
 Tue, 27 Apr 2021 10:55:41 -0700 (PDT)
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210427174719.GA14124@ubuntu>
In-Reply-To: <20210427174719.GA14124@ubuntu>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Tue, 27 Apr 2021 19:55:30 +0200
Message-ID: <CAMhs-H_jfdTV4JYD+_Xy+1w452AjjAut-jjFhEt+GmLjTw8+8A@mail.gmail.com>
Subject: Re: [PATCH] staging: mt7621-pci: fix a multiple assignment code style issue
To: Iain Craig <coldcity@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	linux-staging@lists.linux.dev, linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Iain.

On Tue, Apr 27, 2021 at 7:47 PM Iain Craig <coldcity@gmail.com> wrote:
>
> avoid multiple assignments while setting pcie->io members to NULL.
>
> Signed-off-by: Iain Craig <coldcity@gmail.com>
> ---
>  drivers/staging/mt7621-pci/pci-mt7621.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/staging/mt7621-pci/pci-mt7621.c b/drivers/staging/mt7621-pci/pci-mt7621.c
> index 115250115f10..f3b5b8ac03b5 100644
> --- a/drivers/staging/mt7621-pci/pci-mt7621.c
> +++ b/drivers/staging/mt7621-pci/pci-mt7621.c
> @@ -306,7 +306,9 @@ static int mt7621_pci_parse_request_of_pci_ranges(struct pci_host_bridge *host)
>          * resource manually instead.
>          */
>         pcie->io.name = node->full_name;
> -       pcie->io.parent = pcie->io.child = pcie->io.sibling = NULL;
> +       pcie->io.parent = NULL;
> +       pcie->io.child = NULL;
> +       pcie->io.sibling = NULL;

In this particular case I think the original code is correct as it is.
Also this is the style used around different kernel places to assign
these fields.

>         for_each_of_pci_range(&parser, &range) {
>                 switch (range.flags & IORESOURCE_TYPE_BITS) {
>                 case IORESOURCE_IO:
> --
> 2.25.1
>

Best regards,
    Sergio Paracuellos

>
