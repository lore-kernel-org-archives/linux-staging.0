Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCCC868
	for <linux-staging@lists.linux.dev>; Fri,  3 Dec 2021 15:37:53 +0000 (UTC)
Received: by mail-ua1-f43.google.com with SMTP id p2so6159099uad.11
        for <linux-staging@lists.linux.dev>; Fri, 03 Dec 2021 07:37:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+HrQ3J/HeO/GYMnMzsFEsM1o2YndrW9CPhQv68AS01E=;
        b=qAsjyc6ITBdQPfIq07bY2cHfZBHlABg0T9Oy5G6Hmgw4mQ7mMnmnHpKUQ73hjAjTiW
         W4ymDk7FJU2c31gTdxEAnlj2HVNHyTOo69S0k0CrV5Mg15UbW7lSyrpKkBcj3AYYLOiD
         X6Xi+kD3WgK7l4snPMkiGWu1/FHtllcd8ITjTdBw/VhYPjg85JN/2RnsBf40eVr457CG
         4NOv3fS9w98Gq6y0pxtfco5d3VL9fLRkMQL386dl2kX3CSPXDOVAjFWnM4z8c6UEPj5G
         AIN4b8k+aUZMRHcVr5KzvJA3DXwBsH37hjlhBVVwoTldNNhd/ktgMTqnh12FoL9qEF+e
         8m2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+HrQ3J/HeO/GYMnMzsFEsM1o2YndrW9CPhQv68AS01E=;
        b=R6meUMKpvBXT/slQ7eO8nu8C2KYBrXswhrUd24rI+wpfSkX6e2cujUO4+b02aRfZTZ
         bi3ONIldmq1Apq/hgjQzrS1vPiDwpNMWHu1A2NNS4Q3HlyDnTWEib/nHw1XGO4UeYql6
         8LWX2QNmU6eYiCQuhMuVYHwRt+pQqq0tM43BeFVAs0FtyuFogVuXSTbJTBzaFwtVy7ko
         hdbCyaOQjt+fTV7fEsxY7bWgN3WDD2Roz0BtQN0ChZF0HzkEACtC7z2b2nj/IbD+0KXp
         7YTzuCtCBleg5Epm7SC8PRsnjHm2HoFzWY/CZS9FGnMAihalfiFqixPlVbwxCCohSv5r
         YFzQ==
X-Gm-Message-State: AOAM532W0w7EeXx+In5yPgHByVuM+poKPedrU7uaWh8y3nGFwLYyS9/G
	nMSJyRo6EuXq9yvQLmlEwXI9lhqxkx7hF1p8SqM=
X-Google-Smtp-Source: ABdhPJySDfWB5ZvpJndLFL0F219WJXO9O/8gTVzkZsiqUOsl9LpvktP7BU7fXuzHctYTF/4gCGoGdAo+70uHuCwcACw=
X-Received: by 2002:a05:6102:2835:: with SMTP id ba21mr21178749vsb.76.1638545872863;
 Fri, 03 Dec 2021 07:37:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211107074200.18911-1-sergio.paracuellos@gmail.com>
 <20211107074200.18911-5-sergio.paracuellos@gmail.com> <YaokmRHYsazdMByi@kroah.com>
In-Reply-To: <YaokmRHYsazdMByi@kroah.com>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Fri, 3 Dec 2021 16:37:41 +0100
Message-ID: <CAMhs-H81bbmncXcV2-HMLh-gLBCUshO18y6E=XsyVgST9Hj5xg@mail.gmail.com>
Subject: Re: [PATCH v5 4/4] staging: mt7621-dts: align resets with binding documentation
To: Greg KH <gregkh@linuxfoundation.org>
Cc: "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, John Crispin <john@phrozen.org>, linux-staging@lists.linux.dev, 
	NeilBrown <neil@brown.name>
Content-Type: text/plain; charset="UTF-8"

On Fri, Dec 3, 2021 at 3:07 PM Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Sun, Nov 07, 2021 at 08:42:00AM +0100, Sergio Paracuellos wrote:
> > Binding documentation for compatible 'mediatek,mt7621-sysc' has been updated
> > to be used as a reset provider. Align reset related bits and system controller
> > node with binding documentation along the dtsi file.
> >
> > Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> > ---
> >  drivers/staging/mt7621-dts/mt7621.dtsi | 25 +++++++++++--------------
> >  1 file changed, 11 insertions(+), 14 deletions(-)
>
> This patch does not apply to my tree :(

This needs to be added when the changes in mt7621-clk driver (the
other patches in the series) are applied. Let me resend this properly
rebased to get a clean apply in your tree when Stephen applies the
others in the clk tree.

Thanks,
    Sergio Paracuellos
>
> thanks,
>
> greg k-h
