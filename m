Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F33128F3;
	Sat, 22 Oct 2022 08:26:34 +0000 (UTC)
Received: by mail-qt1-f173.google.com with SMTP id g16so3041911qtu.2;
        Sat, 22 Oct 2022 01:26:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EdgtvDDaY+OxymTESyr2mOv4XwN/dRDwnOgyw9f2CnQ=;
        b=Xf6oCHGd0aoT1O16EzrebZG2Cf+pK0MAesDHXtBSxJJpBVxfms/j6X+NavWb/HVenA
         Ywdm9wxZI3fTm+thTcy0bhASg6o+pqplOL2s2CQ1MG2IUrUBgsmrOVaSsQyHBAAxwQCm
         3W3ynQ0Ang7o0ff5DvI96AtQhhgDprYMYWLHV1qeouIPW5WkX8f3Wpf74lU1okht7Izq
         dvCXAmMs9+BWWzRZrfxrby9cVof+rsLqrxJ6fPTAOoIGGb3EN9/S1nBd0HzA0LLBhs0u
         PgPVbJ3tgijwCefjRTPsLV6uhqOe1GxyiMxoIN56dgXfZAQMV95mOYbI3+iODyUZuz+s
         CmQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EdgtvDDaY+OxymTESyr2mOv4XwN/dRDwnOgyw9f2CnQ=;
        b=2byMl1WYfGY0umzw7U8mLDwAOKiItbWF4pMh5ChYC+HkhjiHB11W+/tf6stC3bD5m8
         Aon1yiL5+CTPx4SgukRccKahJKh5zU5vp7h96Rm+BYJV1QXW3Vc8VvKrsUXuNgxIYnQ8
         H2voFPSgZctw+oxpjw8ENbv8rMnEpV6rHY+EKBgunJA7Szq9rRNpfYgNrB/GWqG8+b2m
         TX4kw7KvwlE/3uZ7rbpuogjgg4QPWMUHwW7HeNxh2uj7kSypU/46VEUY3n59V2cE3+Po
         Ed0nUtwftuIAEPvNBQwEkBbiysnQVoXCSNEShsMdM+vfST50pIkPs+S5truNF9Tyy366
         GWLg==
X-Gm-Message-State: ACrzQf00fSoVqnwXzAX1HcxEzpEQ6eMQrQah+zGgfD58gz2QwDN12ZZ+
	hwOUP4NjzYF4EW/zsUE1jaW1EQjoPCeGa1DGX1AXK0RyWwqPbihMobU=
X-Google-Smtp-Source: AMsMyM4b8c1b7RtHVTJFKcyhmRQGIEADeY5CB/g13EEcVRWGt8H7lX3SozFCftDupJHWdzGFGhRX/mRVa//Lj4yyiOY=
X-Received: by 2002:a05:622a:411:b0:39e:354e:b537 with SMTP id
 n17-20020a05622a041100b0039e354eb537mr5728346qtx.656.1666427193238; Sat, 22
 Oct 2022 01:26:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221022070612.13009-1-tanjubrunostar0@gmail.com>
 <20221022070612.13009-3-tanjubrunostar0@gmail.com> <Y1OlmdhJ564Y4H05@kroah.com>
In-Reply-To: <Y1OlmdhJ564Y4H05@kroah.com>
From: Tanju Brunostar <tanjubrunostar0@gmail.com>
Date: Sat, 22 Oct 2022 09:26:21 +0100
Message-ID: <CAHJEyKVyL5=axmWJw2HxOr2N9b3Tedjd7RXgq-_vAcqKuR64Sw@mail.gmail.com>
Subject: Re: [PATCH v3 2/6] staging: vt6655: refactor long lines of code in s_uGetRTSCTSDuration
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
	outreachy@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Sat, Oct 22, 2022 at 9:17 AM Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Sat, Oct 22, 2022 at 07:06:08AM +0000, Tanjuate Brunostar wrote:
> > fix checkpatch errors by refactoring long lines of code in the function: s_uGetRTSCTSDuration
>
> So your commit to fix a "too long of a line" has a changelog text line
> that is "too long".
>
> The irony is deep here...
>
> thanks,
>
> greg k-h

So true.
