Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D92A62C9C
	for <linux-staging@lists.linux.dev>; Sat,  5 Feb 2022 07:31:45 +0000 (UTC)
Received: by mail-ua1-f46.google.com with SMTP id b37so14526281uad.12
        for <linux-staging@lists.linux.dev>; Fri, 04 Feb 2022 23:31:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WbyfaMqzZXhO0umDixLaEVZrBVE9+22ohPkmZGUA6cg=;
        b=ox1zgBxjwk68T8/e6T05OVzldw84Tk/UPt04CUVsYlVVII3bjGqd3WDzv6StX+ncr5
         c/AbmMRmRL1dM/Y/XyQvKXhonojFhy50NeMeQpkUbuHUruo9kX9sE03vWBX91EP+HfHQ
         CMJ9jxSO9IrYdmm5qaD3MEnHqljcd4Ssu3uWs/WH8Rbt1W1Ere471TXJyPg+9FXv787/
         dVre0snfzwBZQVhs6wVzyc4XOb/LnPqO9w4DAISumu4VfRE7U93gAt/bdre7jh44pqwn
         0d+YcV+76/YnmtUqnDaEflCkOqMgd6OECdnGlQUPTvpMyzI/G9KR9RQUAJ6J+h4t6Zve
         g0aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WbyfaMqzZXhO0umDixLaEVZrBVE9+22ohPkmZGUA6cg=;
        b=pn5oLMa8+T8g7spHvmyXtMWXN+bc5rn+fX4qXZB7scjZTmq8hyHqdRvLmknrwzR5sG
         tnN+PTRr1k6a/76o/SW/LgdKZwGQQK2TOq2Tz8M3cq9pXSSi16zEW59oTXSgglhdYGs3
         TGemg3UxOCnWFjQQWSsy1YxhLqqGXm8+/MZeA7rhojLx12x3ESgiDfieJ3E+emq8XHh1
         eUqpcR2UfHQy3kMDalfrWTdCAO/ybzrIouIR34zb62Fh7bFg9HOUUMkdvTX9mktzgjC6
         m6FLUDjTtYJhbOlNUWes3P9FEgJNKjW/Jl34GmcL1HtgdWbus6QOvxKC2r3PQZBGNQnP
         EAMA==
X-Gm-Message-State: AOAM530H9HgOqixHVTgk5b2c/7Lx4/dinKV6FgKOBQedx35KTSCeOVd8
	kHozQOSPETU9zJrBjuZcH3jXQKpjgyrX9h3nH9Y=
X-Google-Smtp-Source: ABdhPJyyHjkmV21JQdIe0QvNFhVw2HYFIbG7H6USFrmQbTy8rjGuwn0riyfm1/0ggMyobR6SPJMphu5k8OAQhmlIJJw=
X-Received: by 2002:a67:cb84:: with SMTP id h4mr2045413vsl.1.1644046304748;
 Fri, 04 Feb 2022 23:31:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220110114930.1406665-1-sergio.paracuellos@gmail.com>
 <YfE5MOkQRoHQV7Wf@kroah.com> <CAMhs-H8s0d=PswQDR86Tq-bQt634Z6rdFYHTE+DFepsthmKAYA@mail.gmail.com>
 <YfE7LNFuf79i3oAQ@kroah.com> <CAMhs-H9c8zF=v2tu5Y1OsFRP6esOi5zrUceqS_OUiJ=MSfCvRQ@mail.gmail.com>
 <20220205025548.AA1BBC004E1@smtp.kernel.org>
In-Reply-To: <20220205025548.AA1BBC004E1@smtp.kernel.org>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Sat, 5 Feb 2022 08:31:33 +0100
Message-ID: <CAMhs-H82J5DC+m0V==tQKKYyqsu30kGLkdUbMRU+nsyLb8sL3Q@mail.gmail.com>
Subject: Re: [PATCH v8 0/4] clk: ralink: make system controller a reset provider
To: Stephen Boyd <sboyd@kernel.org>
Cc: Greg KH <gregkh@linuxfoundation.org>, 
	"open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>, John Crispin <john@phrozen.org>, 
	linux-staging@lists.linux.dev, NeilBrown <neil@brown.name>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Sat, Feb 5, 2022 at 3:55 AM Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Sergio Paracuellos (2022-01-26 04:45:31)
> > On Wed, Jan 26, 2022 at 1:14 PM Greg KH <gregkh@linuxfoundation.org> wrote:
> > >
> > > On Wed, Jan 26, 2022 at 01:08:52PM +0100, Sergio Paracuellos wrote:
> > > > On Wed, Jan 26, 2022 at 1:06 PM Greg KH <gregkh@linuxfoundation.org> wrote:
> > > > >
> > > > > On Mon, Jan 10, 2022 at 12:49:26PM +0100, Sergio Paracuellos wrote:
> > > > > > Hi all,
> > > > > >
> > > > > > This patch series add minimal change to provide mt7621 resets properly
> > > > > > defining them in the 'mediatek,mt7621-sysc' node which is the system
> > > > > > controller of the SoC and is already providing clocks to the rest of
> > > > > > the world.
> > > > > >
> > > > > > There is shared architecture code for all ralink platforms in 'reset.c'
> > > > > > file located in 'arch/mips/ralink' but the correct thing to do to align
> > > > > > hardware with software seems to define and add related reset code to the
> > > > > > already mainlined clock driver.
> > > > > >
> > > > > > After this changes, we can get rid of the useless reset controller node
> > > > > > in the device tree and use system controller node instead where the property
> > > > > > '#reset-cells' has been added. Binding documentation for this nodeq has
> > > > > > been updated with the new property accordly.
> > > > > >
> > > > > > This series also provide a bindings include header where all related
> > > > > > reset bits for the MT7621 SoC are defined.
> > > > > >
> > > > > > Also, please take a look to this review [0] to understand better motivation
> > > > > > for this series.
> > > > > >
> > > > > > Regarding the way of merging this:
> > > > > >  - I'd like patches 1 and 4 which are related going through staging tree.
> > > > >
> > > > > Patches 1 and 4 now in the staging tree, thanks.
> > > >
> > > > Stephen wanted all to go through the CLK tree since PATCH 3 and 1 were
> > > > also a dependency... Can we get all of them through the same tree,
> > > > then? I am ok with both CLK or staging trees.
> > >
> > > That's fine with me if they all go through the CLK tree, but there will
> > > be a merge issue that I already fixed up in my tree.  If you want me to
> > > drop them, just let me know.
> >
> > Stephen, what do you prefer? Is it better all going through staging-tree then?
> >
>
> Sure take them through staging tree.
>
> Acked-by: Stephen Boyd <sboyd@kernel.org>

Thanks, Stephen.

Greg, can you please take remaining patches 2 and 3 through your tree, then?

Thanks in advance for your time.

Best regards,
    Sergio Paracuellos
