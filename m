Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 790156D0E
	for <linux-staging@lists.linux.dev>; Wed,  7 Apr 2021 07:11:23 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id z6-20020a1c4c060000b029010f13694ba2so588401wmf.5
        for <linux-staging@lists.linux.dev>; Wed, 07 Apr 2021 00:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=x+hJP4Wbd0+kr+Q6ctN5XNabEooWKMdvmI401MEJJ8I=;
        b=sLMhvI3zLplhs6Z+gGg+ktSXOZzTrXE7tvrf/IxD5gIZ5csmkPwfMh8RwTFoemaGdU
         8q2ACC5Ueb197JzanKYe7fUhgRjP/HyalCwaCz+7M3lqKzLAOosQbJgJmkExjWSiGnAt
         GDKPVjO301ASIrC3qRB85d21vdnvHhHYu4VVrbteUCIGEHTMAuoW8V2eWknakk0E1rc8
         Cw3WQDLLOmaxVOFdBnikTB0azuGa+UeKdRZJ24sTRDwcTYont2VO4fr1bbYqjsWWLbhd
         A15hB7UlwVndqNLj9R0o9zj64+dEXwtYmfXHRilYy8rTTycyjY0HKDO73Anm1wbOwN/J
         2RlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=x+hJP4Wbd0+kr+Q6ctN5XNabEooWKMdvmI401MEJJ8I=;
        b=mezYQPYr7Yj0EUlk1UeIHOrM57N7WkKCsnhSt97FS8IuxcZjMeAHD3JjmNOiEwJnWR
         Tvb5X3595CQRgw+tDtmztHz/i4qppgxGn1FnXybW6FHZjTQxBqm9jxN9ELL2yvuypI+O
         0Zsq4/MIe7OX34Hvu6Fyf5gjry7nW5LdyBPmou1kSi8IdBQXDjH8cP+IVoVWWl6627uh
         zNku85TiezOKBWORaEq09xnuN2UX1c46B0chdOt73m3zU7/G/ZGumvIWT7mijOQ5m1MT
         vC4rRlQiqKiRQIbdIey1yoenpPeS5Zop3c9FU6nio1oq+pTv60qBE1/8YJXAdhqaTjw6
         W/bw==
X-Gm-Message-State: AOAM5338PvPwo9r3DJ4RAaB3ELlBsCoUAEWagZkqkLxUry3ixQxIIEHe
	ZiEaWwaamodL68JwpuACIeY=
X-Google-Smtp-Source: ABdhPJyVQRgco5fyWoJmXb4S9xrDYaQnwBqKdQfg0JhjtHIHEqHDUciLVxKHjOUfJf/pqZfN8SzEWQ==
X-Received: by 2002:a05:600c:2056:: with SMTP id p22mr1618228wmg.171.1617779481909;
        Wed, 07 Apr 2021 00:11:21 -0700 (PDT)
Received: from agape.jhs ([5.171.81.184])
        by smtp.gmail.com with ESMTPSA id y17sm7864224wrw.1.2021.04.07.00.11.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Apr 2021 00:11:21 -0700 (PDT)
Date: Wed, 7 Apr 2021 09:11:18 +0200
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: Pavle Rohalj <pavle.rohalj@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 00/49] *** SUBJECT HERE ***
Message-ID: <20210407071117.GA1354@agape.jhs>
References: <cover.1617776878.git.pavle.rohalj@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1617776878.git.pavle.rohalj@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Tue, Apr 06, 2021 at 11:35:54PM -0700, Pavle Rohalj wrote:
> Changes in v2:
>     - Removed type information from variable names
>     - Broken up the changes into smaller patches

Hi Pavle,

I think you missed the subject in cover letter, but maybe
is not a relevant issue...
