Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17714168
	for <linux-staging@lists.linux.dev>; Mon, 10 Jan 2022 11:41:40 +0000 (UTC)
Received: by mail-vk1-f174.google.com with SMTP id 19so188507vkl.2
        for <linux-staging@lists.linux.dev>; Mon, 10 Jan 2022 03:41:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=o514X0rKQeZG8KSvRY+nluj6/Uqn5RzfGG2pNIWGbz4=;
        b=RpCR4VRmypfzEIS8sdD+1MhtREHywwBRPMt1/4Vdazr0+FzTXAt38nFlsbttcS8Wvi
         TRYpoJG0BrtM7IohqSEz2/6nlqsWxxyQ9MliDTfrU3U3bdc3GkSnFtP2xqF/anNxLXx1
         h0XwTGzjpWFiPHTkLDRA5dZcApaQicti+hCmqjoLaA8UgAQBm+Q+Td/nICeoAMLQ6pdy
         v1x8txQ7cL3puqHqS9fVtaFUsuTYATEjkOzWmtKIbKvksqHXcrx8LOF9FVTVxbf7cAVv
         /4DShyncvzHu0mzERufmEgc5EB0z9saOD56LzfCy4StafwXbSug3q/3mR1CkZLjPGVH6
         MKTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=o514X0rKQeZG8KSvRY+nluj6/Uqn5RzfGG2pNIWGbz4=;
        b=43E5nZOJqmK9+JAtvQ5CF86DC2d1qqCJlJP1co59AzJwnHu9L2MXNUxuaelEEjF/ZC
         i6dSjMMrd88dS19X4OSMdAqNKBC+4Ofzo0GCEqS9APHvc8HVnYY/4tOCcB8htjPnat67
         coezvRnltkPGH/2lGYgqLAptwpbHMYMgYtH/fTB+JRHtUZx1/nPfVwGNAnSDqRAOftd8
         7DgOvpMMRvZydC0IvhmqXRL54P5EEeDP2pQtIF9BfkyuINrkbO+PrsM9BMcPXsmjZMKx
         b7SuoCzK8a0HbZYG64tzbykUFQbYisn2IkF5oFSEazxkC+5HkAh9z5L2MYhgCNjwjB5N
         HoAw==
X-Gm-Message-State: AOAM532rva256coHuMH5PQNioLPx1DXISRnBSJVAA4/BPg7nhkWhIzUp
	CrU+HuHeEZTc+D2N7aShN/p6o1qGAWTcNy8CUnA=
X-Google-Smtp-Source: ABdhPJwGvgloBmQRKWa/zPp77xHXFYqA0ZwE902jyWdNhXjMW3gmdy6XXREboy+aLz0EFPk6dJtdPde83fOIupvAaj0=
X-Received: by 2002:a05:6122:513:: with SMTP id x19mr15038756vko.19.1641814900003;
 Mon, 10 Jan 2022 03:41:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220110111036.1380288-1-sergio.paracuellos@gmail.com>
 <20220110111036.1380288-4-sergio.paracuellos@gmail.com> <c88e81067826f04e2301b52eddb84ec84bbd1c9d.camel@pengutronix.de>
In-Reply-To: <c88e81067826f04e2301b52eddb84ec84bbd1c9d.camel@pengutronix.de>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Mon, 10 Jan 2022 12:41:28 +0100
Message-ID: <CAMhs-H9q=hP2GMU5QEU5791HfcCchrek6m9L4UdKzMyLg4nZBw@mail.gmail.com>
Subject: Re: [PATCH v7 3/4] clk: ralink: make system controller node a reset provider
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>, John Crispin <john@phrozen.org>, 
	linux-staging@lists.linux.dev, Greg KH <gregkh@linuxfoundation.org>, 
	NeilBrown <neil@brown.name>, linux-kernel <linux-kernel@vger.kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Jan 10, 2022 at 12:37 PM Philipp Zabel <p.zabel@pengutronix.de> wrote:
>
> On Mon, 2022-01-10 at 12:10 +0100, Sergio Paracuellos wrote:
> [...]
> > +static int mt7621_rst_xlate(struct reset_controller_dev *rcdev,
> > +                         const struct of_phandle_args *reset_spec)
> > +{
> > +     unsigned long id = reset_spec->args[0];
> > +
> > +     if (id == MT7621_RST_SYS)
>
>         if (id == MT7621_RST_SYS || id >= rcdev->nr_resets)
>
> I forgot to mention that with .of_xlate set, the driver needs to check
> whether id < nr_resets on its own.

Oh, ok. I checked 'drivers/reset/reset-k210.c' as example and there
was only a similar check that I sent. Let me add this also and send
v8.

Best regards,
    Sergio Paracuellos
>
> regards
> Philipp
