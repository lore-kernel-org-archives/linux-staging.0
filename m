Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E838E2CA3
	for <linux-staging@lists.linux.dev>; Wed, 19 Jan 2022 13:55:51 +0000 (UTC)
Received: by mail-ua1-f54.google.com with SMTP id 2so4575388uax.10
        for <linux-staging@lists.linux.dev>; Wed, 19 Jan 2022 05:55:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=SKB+2gqwkmhRtvujHObAiP9QZA52p+CI6WHOcuhFGvs=;
        b=eUmHCDw3wkS0lUrAB+dFozV67Z/lrxEZLfdOsHGpbjZjf/IGmx4wrYpyfYNb8b/n0U
         wsQljeZuQsKBFT+WEsz5my5qMD+P3YaU4uOwq9YrVW8yNIow2nsrFZyu2O05i244dHk9
         Dqa7CBlNQpqftWj2tfUzOUmVGA3cNrmBpHru4/6ar2KKmtY58jN7SqAvg/m9cKXaU/BY
         Zg+DkyqTi/cBEVzUW9abyDk28qh14oTPk6AeqziJLLgdDxOMYRCsAQYPa9Tf3w4ZuhT7
         W+ZjndhlALXtwXaS5/aBNk/lJisvMPxu3kdnLncL060EX83mSEEg8m8/2SWR+Y2GkwY0
         3ubg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=SKB+2gqwkmhRtvujHObAiP9QZA52p+CI6WHOcuhFGvs=;
        b=7w/70diNhFxh2abfkW0fm/M4wocn0fvmF7dy7H5dt4SEQDmyt2fSJ+GDEArNjimsji
         tysXgWhRcs5WhDjfD490Ag7DEHFDoVHCa4H50O/o41sXgibwPA0Rq1CJJwCnWHDYcM5W
         L8Nh84qDxkrr3ON2dwEl88ZUbNfixxQT2dHBFm64K5TGzgu9CB+BCh3DNlO7Oqi5jk6i
         xnoW/z3F/foQttpSKhVfksfDT/Dm1bSdlMBcNrRKwIomLr9rLcAJpa+DzBXvB4dSnSje
         NIm9tKd+y/eyO4piHaljZnJCwqBUj7ZwNpTEXoG46qJuDdllPdFJkzc9CZNUm+vUQZZU
         YNLg==
X-Gm-Message-State: AOAM531dLQ+A8LAq42MWNiDGTw34vEVnKtgO0wZ3RgUnc/5FRpG4UVHx
	FUdv5CtEuLMyDcJiGB6jiy8StvpaOMAmlUGmMZM=
X-Google-Smtp-Source: ABdhPJwMAzx9yjy9ZymirKauhj5j++PmaIjJ6L+QWvrMT9gAYuDon288paA6SJNFakl9aTsokpI9doq/OxtxK5AOQ8k=
X-Received: by 2002:a9f:31cc:: with SMTP id w12mr12500442uad.46.1642600550848;
 Wed, 19 Jan 2022 05:55:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220110114930.1406665-1-sergio.paracuellos@gmail.com> <d46fcc03-40f1-edbf-e966-e35aabf84111@arinc9.com>
In-Reply-To: <d46fcc03-40f1-edbf-e966-e35aabf84111@arinc9.com>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Wed, 19 Jan 2022 14:55:39 +0100
Message-ID: <CAMhs-H9j+0F_9GgTfFfPP=br61pZ9PX=ndu9apnA_Fn9k7JEog@mail.gmail.com>
Subject: Re: [PATCH v8 0/4] clk: ralink: make system controller a reset provider
To: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Cc: "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>, John Crispin <john@phrozen.org>, 
	linux-staging@lists.linux.dev, Greg KH <gregkh@linuxfoundation.org>, 
	NeilBrown <neil@brown.name>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-kernel <linux-kernel@vger.kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	erkin.bozoglu@xeront.com, Luiz Angelo Daros de Luca <luizluca@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 19, 2022 at 2:27 PM Ar=C4=B1n=C3=A7 =C3=9CNAL <arinc.unal@arinc=
9.com> wrote:
>
> This series fixes the SPI & MDIO probing issues we were having with our
> mt7621 board.
>
> Tested-by: Ar=C4=B1n=C3=A7 =C3=9CNAL <arinc.unal@arinc9.com>

Thanks for testing this!

Best regards,
    Sergio Paracuellos
>
> Cheers.
> Ar=C4=B1n=C3=A7
>
