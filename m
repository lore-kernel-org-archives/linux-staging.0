Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCBE56D18
	for <linux-staging@lists.linux.dev>; Tue,  5 Oct 2021 13:29:18 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 78FE7619F6
	for <linux-staging@lists.linux.dev>; Tue,  5 Oct 2021 13:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1633440558;
	bh=LF/tBVlDQO6RuZf99DRYv1cbQeLhdXuXABeqOo0O3fg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=GX98xAI9+1xPRS57QOe/fJ/xyF39b5nmOnVrWSvURobnEmIhSsskyyyPaScjWolxb
	 0WvF6RnLxXc5ZcLt9R7b11MHBOERjmtLHG7yEdWHEUFJL7I4NasfxdEQScuQ9GtDj6
	 ObLiOhpCxJFW7uQZi81ab1TvMJlRa4uejgLuftL7AxIzGNkQN+Ns55ZFbFKcPC7IDo
	 I8G4GpTJSMMyDCYkcFVJMUP5lfitnnQCBK1utcHgPL6qpKxVg75+KlgLTZsSXhuTuU
	 1GbDQPAW6qpoQoBo0/Penh28TdIMKrqUnmehsiTfp8VV/RjPCGpPd+nbDcK/PJx6r5
	 2yN8Nii9CLCPQ==
Received: by mail-qv1-f47.google.com with SMTP id d20so4945300qvm.8
        for <linux-staging@lists.linux.dev>; Tue, 05 Oct 2021 06:29:18 -0700 (PDT)
X-Gm-Message-State: AOAM531HIb0zIYYcaDXPvyNSLkdhDaN0lFptoz+tA3YU/ryplarHNrsk
	j6rSJdWnmTKBKTymisDzhG1o5ewWeXrJ38lZLA==
X-Google-Smtp-Source: ABdhPJxMdpq3J7fB00AXs7CoA89pdFWl0mrM2JhB4zgxF0Cc87pLhhCVtwW5TsMMLA1sELraQx1/aydztdtEIskS/PI=
X-Received: by 2002:a0c:80e4:: with SMTP id 91mr28966424qvb.57.1633440557667;
 Tue, 05 Oct 2021 06:29:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210926145931.14603-1-sergio.paracuellos@gmail.com>
 <20210926145931.14603-2-sergio.paracuellos@gmail.com> <YVtBsrmCDk/sLsRJ@robh.at.kernel.org>
 <CAMhs-H_qBkQhzwvcVyFbegf412ecvweOBOYq8NW2hBNYUUCE-w@mail.gmail.com>
In-Reply-To: <CAMhs-H_qBkQhzwvcVyFbegf412ecvweOBOYq8NW2hBNYUUCE-w@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 5 Oct 2021 08:29:04 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+Nj_=kmGNEbmN4DxJquVdd1BRJnuK43ROvNp-hQM4POw@mail.gmail.com>
Message-ID: <CAL_Jsq+Nj_=kmGNEbmN4DxJquVdd1BRJnuK43ROvNp-hQM4POw@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: reset: add dt binding header for ralink
 RT2880 resets
To: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc: linux-staging@lists.linux.dev, John Crispin <john@phrozen.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Greg KH <gregkh@linuxfoundation.org>, 
	NeilBrown <neil@brown.name>, linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 4, 2021 at 1:26 PM Sergio Paracuellos
<sergio.paracuellos@gmail.com> wrote:
>
> On Mon, Oct 4, 2021 at 8:02 PM Rob Herring <robh@kernel.org> wrote:
> >
> > On Sun, Sep 26, 2021 at 04:59:29PM +0200, Sergio Paracuellos wrote:
> > > Adds dt binding header for 'ralink,rt2880-reset' resets.
> > >
> > > Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> > > ---
> > >  include/dt-bindings/reset/ralink-rt2880.h | 40 +++++++++++++++++++++++
> > >  1 file changed, 40 insertions(+)
> > >  create mode 100644 include/dt-bindings/reset/ralink-rt2880.h
> > >
> > > diff --git a/include/dt-bindings/reset/ralink-rt2880.h b/include/dt-bindings/reset/ralink-rt2880.h
> > > new file mode 100644
> > > index 000000000000..266ef521a584
> > > --- /dev/null
> > > +++ b/include/dt-bindings/reset/ralink-rt2880.h
> > > @@ -0,0 +1,40 @@
> > > +/* SPDX-License-Identifier: GPL-2.0 */
> >
> > Dual license please.
>
> Ah, ok. I thought the dual license was only for binding yaml files but
> not for headers since there are a lot of already mainlined files with
> only GPL-2.0. I will take into account from now that binding headers
> also need dual license.

If you want your dts files used by other projects such as *BSD, then
they and their include files need to be licensed for that.

Rob
