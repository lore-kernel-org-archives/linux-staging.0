Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D01E2FB4
	for <linux-staging@lists.linux.dev>; Thu, 27 May 2021 08:43:31 +0000 (UTC)
Received: by mail-vs1-f52.google.com with SMTP id x2so2149412vss.3
        for <linux-staging@lists.linux.dev>; Thu, 27 May 2021 01:43:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YcHAcZ99LPh3KvdHc6+dwPmzciohpUzegXnqArlUae4=;
        b=hQPMiGQD3xGRn2uy7kTe4JQm3Ik6tfC96agRL4S3oEsJlhFQaONUIgpGd8P5Vb8Fzd
         JokMdx3EYMwM1eO9fKQWMvJ+QueHsA5mh3JOFEzllG5MskQdwuWNgqbbMo3xcRI+bdzV
         eP2yMzZPt0Z19rm8MOSDixwc+jG1pvIDTbB2JF/qa1LzmdRRHSUNu/barjTz9u+oMGcv
         2ZkIZshDSgXTPbwCYMYO5ZjZwO+1pSGHvPrJqQtyqUwxoxQw9Ju8nAa9zBCW0vMppLPl
         7i95mYDqtj+fapeY+C2OcyCMFe3upUAfx3bqrNOa6djNBHbyReWsrZrn3aG/D2hbfiW4
         VyOA==
X-Gm-Message-State: AOAM530kIewCXXamn/+4twurI7oKVnF7EHm0B/g4f67512uf/siV6VN8
	WNRLQz1I0PYWwdNTP52dmE1MOa/ZnySOGb3IeUg=
X-Google-Smtp-Source: ABdhPJwtMi0jMzxDHtCUV2SgEGd7LCRzwNK2Sumq2bMqbtu9N1gVIPP1bmFwaX5W7NkNQu33jCjEp7W89CRMWla1Gbc=
X-Received: by 2002:a67:8713:: with SMTP id j19mr1387811vsd.3.1622105010380;
 Thu, 27 May 2021 01:43:30 -0700 (PDT)
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210524152128.20519-1-harold@mrtz.fr>
In-Reply-To: <20210524152128.20519-1-harold@mrtz.fr>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 27 May 2021 10:43:18 +0200
Message-ID: <CAMuHMdWQqoqeaym5apdN8ppvkSm3DkKVeDn=S4e5Z2ytCVVUww@mail.gmail.com>
Subject: Re: [PATCH] staging: emxx_udc: fix alignment issues
To: Harold Mertzweiller <harold@mrtz.fr>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alex Dewar <alex.dewar90@gmail.com>, 
	Dan Carpenter <dan.carpenter@oracle.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
	Sean Behan <codebam@riseup.net>, Colin Ian King <colin.king@canonical.com>, 
	linux-staging@lists.linux.dev, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Harold,

On Mon, May 24, 2021 at 6:46 PM Harold Mertzweiller <harold@mrtz.fr> wrote:
> Three function calls can now be properly formatted inside the 100
> characters limit.
>
> Signed-off-by: Harold Mertzweiller <harold@mrtz.fr>

Thanks for your patch!

>  drivers/staging/emxx_udc/emxx_udc.c | 11 ++++-------

I'm so happy people are improving this driver!
Is it working well on your hardware?
Do you think it's ready to migrate out of staging?

Thanks again!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
