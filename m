Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 898CB3FC9
	for <linux-staging@lists.linux.dev>; Mon,  4 Oct 2021 18:26:23 +0000 (UTC)
Received: by mail-vs1-f45.google.com with SMTP id o124so20725271vsc.6
        for <linux-staging@lists.linux.dev>; Mon, 04 Oct 2021 11:26:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6n/vts0PyHmoxi8oEBeOuVoVdH7tRF+8eeP06Mq4yWA=;
        b=NuDtgVLsxGgAxPAHdWpFc8G6LW+l550GL9Nh06oO17X1ulv4GnhPCUdBjx+zU4LSyH
         Lse4QOm89izzccTGHht3YRE4BXD12YPzgpcUFqqUG/Vu0p2LIJQKubFN4zmlqKNwdyG7
         qNmTA1rh02vDf6WggG/IYDve1KWSYW+jM9Vc1U/CIfj7okQO7UbHnsgBNeoFw0WPom/k
         /VwHya7SSczwtL1tixVNZaILyrKuFNAlS3P1BhwgqLhEANIuDYfTMZtKO62LU2jeXiK8
         kWZdMMqClpOq1da2IhvLtAPlP8DAPFbIm7Hpu9fpeB7ubx5iLHYfkzBIBeS0lEkxVH5m
         04ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6n/vts0PyHmoxi8oEBeOuVoVdH7tRF+8eeP06Mq4yWA=;
        b=QHN6z4qjYG2aZKz34xTFLNpmdCIukEYmDlcbN8S2VSjcb6i80ijyZYAbApvpMoPHX2
         oHs8MgjszvYrEuGQmUhni6so2nna5OaMAYnwyX7hzpHoSePBU+1tq1enrrtj3ECrzmlf
         tqdZXbkZhdkp5k0J+a9cwbuw0KtVZdFb+ZWaTfm63XnuHeFkRUbpB5xypkLMjmuWC1ex
         mYvYY4ilsuolxhC+8TaYaShjh7oX5iR39Kp1ZSGPheO5nmDffCfjE1e0+u9VSGFdKdXt
         rCpdd0Z775KS0ObFQ3RbJm4e8a51a+A343atDCZaKGDjz6r04KnF7tk0zJOagkWzOePy
         dL4Q==
X-Gm-Message-State: AOAM530r67/CZAGX6xJ2Nh8800tFvWYKJcOrov5E4uFZH9Gw3xTeuWBW
	kbx6yQfBAbLhTLLqDOTCsM1eeuscsEPafAiBtIFboCHn
X-Google-Smtp-Source: ABdhPJyWkVxkzj24O9IbQ07+XhO2ovB+390tYNmw0/qcOFn04pnzmeGJsny1QYwPGB1Z3BUS7aR0Sa6NBsE2uQoC/w4=
X-Received: by 2002:a67:d189:: with SMTP id w9mr14525515vsi.55.1633371982514;
 Mon, 04 Oct 2021 11:26:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210926145931.14603-1-sergio.paracuellos@gmail.com>
 <20210926145931.14603-2-sergio.paracuellos@gmail.com> <YVtBsrmCDk/sLsRJ@robh.at.kernel.org>
In-Reply-To: <YVtBsrmCDk/sLsRJ@robh.at.kernel.org>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Mon, 4 Oct 2021 20:26:11 +0200
Message-ID: <CAMhs-H_qBkQhzwvcVyFbegf412ecvweOBOYq8NW2hBNYUUCE-w@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: reset: add dt binding header for ralink
 RT2880 resets
To: Rob Herring <robh@kernel.org>
Cc: linux-staging@lists.linux.dev, John Crispin <john@phrozen.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Greg KH <gregkh@linuxfoundation.org>, 
	NeilBrown <neil@brown.name>, linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 4, 2021 at 8:02 PM Rob Herring <robh@kernel.org> wrote:
>
> On Sun, Sep 26, 2021 at 04:59:29PM +0200, Sergio Paracuellos wrote:
> > Adds dt binding header for 'ralink,rt2880-reset' resets.
> >
> > Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> > ---
> >  include/dt-bindings/reset/ralink-rt2880.h | 40 +++++++++++++++++++++++
> >  1 file changed, 40 insertions(+)
> >  create mode 100644 include/dt-bindings/reset/ralink-rt2880.h
> >
> > diff --git a/include/dt-bindings/reset/ralink-rt2880.h b/include/dt-bindings/reset/ralink-rt2880.h
> > new file mode 100644
> > index 000000000000..266ef521a584
> > --- /dev/null
> > +++ b/include/dt-bindings/reset/ralink-rt2880.h
> > @@ -0,0 +1,40 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
>
> Dual license please.

Ah, ok. I thought the dual license was only for binding yaml files but
not for headers since there are a lot of already mainlined files with
only GPL-2.0. I will take into account from now that binding headers
also need dual license.

Thanks for the review and clarification.

Best regards,
    Sergio Paracuellos
