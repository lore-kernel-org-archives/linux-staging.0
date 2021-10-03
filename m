Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73E8C3FEA
	for <linux-staging@lists.linux.dev>; Sun,  3 Oct 2021 16:55:46 +0000 (UTC)
Received: by mail-vs1-f45.google.com with SMTP id i30so16846736vsj.13
        for <linux-staging@lists.linux.dev>; Sun, 03 Oct 2021 09:55:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hFtEl8S10zL/n9vo1k1ZM/Rpdozvd/xX5yiKs0GwGUU=;
        b=LorWYhqsx2crztXC7e03nWh/YejEJa5hD6+IpyuxY6lIlOmrqBySlqtIEYmblGpOTA
         OTKXi+EojGSBwhDWhPI5UDSLbtZZGkhULp4AsFxRHg5JItYl8GhsNkxcknz0Ev9U/PhI
         vQX1NXmBjdeUaJ14Q5UeuQobXWCsjG7O4e92MEFOLNKGk7PuRpzvojkv1xRjkY8qHsnY
         T+l/D1zv5PKPuLx4fhzRF9eRGwIkzbCamLPzjHGU1DDBUNsZnyVc5TCU50Iws/L5oIkT
         LpXibcTsIEM9zJ+kdQyAESFSE5tMcbRqFbW+iqoLQ/cfG2wWLNMHAkz+T675NRc2dXXZ
         RUDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hFtEl8S10zL/n9vo1k1ZM/Rpdozvd/xX5yiKs0GwGUU=;
        b=o7U9/Vz8bD/hsq6/Z0FMc6NBFW6lLLOj+sLoCngD5f7QM0HGvlfRsCgMlfbGXjt8zw
         MgjNozPeoi7+ODhlJNshBwazzDcRhrLHGUPILuuReg2z2jxPuc8u0gxqfXIz4RhUUYEZ
         aQEyWyy+ksPp4uCZ4vYApBGyyovmvW69UETEPAQw47W/XDGCoQPQfTsnUm6xyrnTTw9Q
         UXUPGPJkvcbDv31ja4cJxAbsPCyH0XR5DDRoFfdydktVZinFxw9y1vlQSN9fBChUbRf6
         lmiXuKjXayBTfxEjm7Als7LejqHe8O3vCVATi4FygCne2qJBvCFd5Bc7uLWsa2E+c0c+
         9KKQ==
X-Gm-Message-State: AOAM533ndlh2qwsrwoodYx0NizAgJ1BAumIBgkFe5twdXAN3UT9OM1o+
	BLM+JdVDF6POz6AeW4IrTb73pakHPVyV3v78Hk8=
X-Google-Smtp-Source: ABdhPJxSiyXNfs3bBalwZBhKxEV1wxQFc8AoojgOrPVCE/jtNgs2qdDlQvTnTAOC+nMXt5+HYx8/SAtEYYX3d7pwQ7Q=
X-Received: by 2002:a05:6102:20c1:: with SMTP id i1mr10273822vsr.28.1633280145424;
 Sun, 03 Oct 2021 09:55:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210922050035.18162-1-sergio.paracuellos@gmail.com>
 <20210922050035.18162-4-sergio.paracuellos@gmail.com> <06500d9d-4156-f9df-956c-7306a2984a3e@gmail.com>
In-Reply-To: <06500d9d-4156-f9df-956c-7306a2984a3e@gmail.com>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Sun, 3 Oct 2021 18:55:34 +0200
Message-ID: <CAMhs-H-JWCX6cr+t4ca=o=C1rzL-NNMDjcrYy5eifbMyfpXJGw@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] MAINTAINERS: add myself as maintainer of the
 MT7621 PCI controller driver
To: Sergei Shtylyov <sergei.shtylyov@gmail.com>
Cc: linux-pci <linux-pci@vger.kernel.org>, 
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, John Crispin <john@phrozen.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Bjorn Helgaas <bhelgaas@google.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Greg KH <gregkh@linuxfoundation.org>, 
	"open list:MIPS" <linux-mips@vger.kernel.org>, linux-staging@lists.linux.dev, 
	NeilBrown <neil@brown.name>, linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Sergei,

On Wed, Sep 22, 2021 at 11:05 AM Sergei Shtylyov
<sergei.shtylyov@gmail.com> wrote:
>
> On 22.09.2021 8:00, Sergio Paracuellos wrote:
>
> > Add myself as maintainer of the PCie Controlller driver for
>
>      PCIe Controller. :-)

Ups, true :) I will send v4 with this fixed if more changes are needed.

Best regards,
    Sergio Paracuellos

>
> > MT7621 SoCs.
> >
> > Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> [...]
>
> MBR, Sergei
>
