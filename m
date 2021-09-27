Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 837F172
	for <linux-staging@lists.linux.dev>; Mon, 27 Sep 2021 09:14:50 +0000 (UTC)
Received: by mail-vk1-f170.google.com with SMTP id g15so6643017vke.5
        for <linux-staging@lists.linux.dev>; Mon, 27 Sep 2021 02:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WbaNXMBECXey7ELal8uMHHShxWFOFNevhVPa8lYniYY=;
        b=RAemMbnGVpPW/DQd2waEBePc7ixfmJGa8M5Q4s3tmglGzdGIvF8j9/K+dnEt0H/cQZ
         FaV0D9LcwiiHh3HgvZClJEkRNeRkOdJW9u4xPC0W5feThfZ1l0tQc25gPgiKt4PS+vin
         2ZsM+1Ou3dJHWoN/2Fe6vv2NgrY+tf5OipUjplK9IVw7N7dn96qXfDkg5Uo0IVneo7jY
         EeWDpUua9SjCMGrkwkRiN4z1HvVHIqEwJayb3FQLNbjFSbWQpZAjSYKDtulBb5X+xm/C
         eRc1qLCgvQa1V677/HfypA114QyRcn5OPw86n3HEBM6eDsLzGorTIAH5GeZjrINsoMRG
         QpKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WbaNXMBECXey7ELal8uMHHShxWFOFNevhVPa8lYniYY=;
        b=sl9Gnazifo8hgZ5yXJZRAHyZQeMn0WWl+gn3tuGxrJhG2Jt7aZ8RfvMvcU4KQ6vg/m
         ExWEBCpGZH7A0lO0USI9aLGXEu0dwEcKTn55u98X4paPczz2SKP/wHu6q/K+iH2ySUUu
         i2IEOKgI+jGLcPfnc5YXQHfmwCfF8IqsPYKZnTJGs0fDegjOjmkzSlppb2ITWcs0cQDO
         OBWqFwm3tAXvKeJiXAkICpn33X9xRZM7eqcfDuKrfb+WWoYUchZdnXj0gHHnna+QQxxt
         7Kfnrreby0MPKv/ELA+CEfDv/+1vww7YkFd/iUT30cgxw9DQZf3BUQU7AexQXTjArleh
         eyjA==
X-Gm-Message-State: AOAM531mYldGleRV1qIkBRO16DnCUy0oZ05E0EmF6KGXV2bC6dNg18oI
	H28oKBuTjm+m/PSsml20ah12eWbkdki8AdKcDTo=
X-Google-Smtp-Source: ABdhPJwBqIxeWAX6bgr87UbnnhqSB8U3yyRByhoxX5/LWxHm2KmuWgE7NKQp4aPlSFAPKp/L5UzWU5/+0C6hYH08ImQ=
X-Received: by 2002:a1f:900c:: with SMTP id s12mr14749733vkd.1.1632734089613;
 Mon, 27 Sep 2021 02:14:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210925203224.10419-1-sergio.paracuellos@gmail.com> <CAK8P3a3+54S2=-=ch1+XWuNQRoOCDdQhtBhu3CKOdqcSNzu8YA@mail.gmail.com>
In-Reply-To: <CAK8P3a3+54S2=-=ch1+XWuNQRoOCDdQhtBhu3CKOdqcSNzu8YA@mail.gmail.com>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Mon, 27 Sep 2021 11:14:38 +0200
Message-ID: <CAMhs-H9JyD8kBMJfjER1QQwDNmsy6gY6At+d-UOvAe_Q0FQs0w@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] MIPS: ralink: fix PCI IO resources
To: Arnd Bergmann <arnd@arndb.de>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Rob Herring <robh@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Liviu Dudau <Liviu.Dudau@arm.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	gregkh <gregkh@linuxfoundation.org>, 
	"open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>, linux-pci <linux-pci@vger.kernel.org>, 
	linux-staging@lists.linux.dev, NeilBrown <neil@brown.name>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Arnd,

On Mon, Sep 27, 2021 at 9:51 AM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Sat, Sep 25, 2021 at 10:33 PM Sergio Paracuellos
> <sergio.paracuellos@gmail.com> wrote:
> >
> > Patches related with reverts are from this merge cycle so they are only
> > added to the staging git tree. So to have all stuff together I'd like to
> > get everybody Ack's to get all of this series through staging tree if
> > possible :).
> >
> > Thanks in advance for your time.
>
> Looks all good to me now, just one general remark: Try to give a little more
> time between respinning the entire series, otherwise you get the opposite
> effect and reviewers start ignoring your emails after getting annoyed at the
> number of emails. Once you are reasonably sure that no more comments are
> coming in, or you have made substantial changes, it's time to resend the
> series.

Thanks for reviewing this and also for the advice. Will take it into
account from now on.

>
>         Arnd

Best regards,
    Sergio Paracuellos
