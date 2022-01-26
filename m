Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FE262C82
	for <linux-staging@lists.linux.dev>; Wed, 26 Jan 2022 11:46:55 +0000 (UTC)
Received: by mail-ua1-f49.google.com with SMTP id c36so42811717uae.13
        for <linux-staging@lists.linux.dev>; Wed, 26 Jan 2022 03:46:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=N4CNUTqSVWn9bXn7l88zPRdfRlbtM6HbzeC8ZWljLDY=;
        b=kZlc5lyneJxcG3mgrIIsGcOndeVBblAK0nKqJSIxp5XBRMZDtyWdX5FBwuNfSIkm9a
         KEa3BbUfSUgVIEcWlYs98e72BJkdt70ayYnbXgyYLT2AGf8mBiDWdNBn4GM7fs4t9y7s
         tv9chq0HqYSR4PmevC7Ay1dz4ZgO1zXBQaak7iVtaAqHzINmLVcIHjWHrY4iC9LBEQ1z
         NvtFXX/fQh2btOfQHsd9ie7Hq9Jk9xKK8Yp+oomhROlf1ZbDVzK+Ph9Ciprme7e2np4f
         a0Ioc50iPwG018CiaEhUt+3VNIM+BzYZITkX0FfQdiQ7uu7jlOfQGewH2itZbhggiEL2
         z+Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=N4CNUTqSVWn9bXn7l88zPRdfRlbtM6HbzeC8ZWljLDY=;
        b=4augQjqeAlf69XS3N9+E6ibSTXNQa0uW5LCkUdQaLKBCcRJea0mMcyELpn4ICBbU3C
         cALgzX9Mwm5/rgYUtBsQjKv/2Oglj7v6umKBeuKDVUmCp41JW1c8a32IJUc6FnHYYJYo
         guCHc6wah/xnEq1Nu8JrRiTf4IxMMppOxWAS8UKOwgBBLmRlz2SGA8HE4/eMlQgHWk24
         VfgVtDwCiU5wzxmSyA1cFvaq2rE3GWKrCUmXF9xkF+ON2EstgPg1ibJIJDclhqsrf6Vi
         X9uyJBefT1FkX2zq0CPOJ1pO/lvr+lY61QkLy4NcmXk0Ayb+Om83oeoiZ0tKb7X0493v
         yGdA==
X-Gm-Message-State: AOAM530nS7porERC/lgCAPQJpaXurJ5qQirAm/FYzOkqPnZIdtCTp67T
	CWxcmdVrKAH3rPoPrDxKYQ9xRrlUklMB3sjNDUc=
X-Google-Smtp-Source: ABdhPJwZR3GhqHW6vVDPMdvc5RfjPrPxRISo7AxE0yRaHiKPCLToutmaZ91KccUpC53UUHP3+xvCW8VUf4CPP4L+I4g=
X-Received: by 2002:a67:c98d:: with SMTP id y13mr3479175vsk.43.1643197614279;
 Wed, 26 Jan 2022 03:46:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220110114930.1406665-1-sergio.paracuellos@gmail.com>
 <20220110114930.1406665-5-sergio.paracuellos@gmail.com> <d62d838872d26201b04a1014a925738d29ff3e48.camel@pengutronix.de>
In-Reply-To: <d62d838872d26201b04a1014a925738d29ff3e48.camel@pengutronix.de>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Wed, 26 Jan 2022 12:46:43 +0100
Message-ID: <CAMhs-H__SxEZ4OtdN_PFf4g+joWBRgRR0q7hHkZX3d=qZtpxUQ@mail.gmail.com>
Subject: Re: [PATCH v8 4/4] staging: mt7621-dts: align resets with binding documentation
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>, John Crispin <john@phrozen.org>, 
	linux-staging@lists.linux.dev, Greg KH <gregkh@linuxfoundation.org>, 
	NeilBrown <neil@brown.name>, linux-kernel <linux-kernel@vger.kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Greg,

On Mon, Jan 10, 2022 at 12:54 PM Philipp Zabel <p.zabel@pengutronix.de> wrote:
>
> On Mon, 2022-01-10 at 12:49 +0100, Sergio Paracuellos wrote:
> > Binding documentation for compatible 'mediatek,mt7621-sysc' has been updated
> > to be used as a reset provider. Align reset related bits and system controller
> > node with binding documentation along the dtsi file.
> >
> > Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
>
> Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
>
> regards
> Philipp

Can I get your Acked-by on this patch to apply this series through the clk tree?

Thanks in advance for your time.

Best regards,
    Sergio Paracuellos
