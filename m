Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAB25185F;
	Sun, 15 Oct 2023 07:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="StcaEIPH"
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-57b9cb05fa3so1783730eaf.1;
        Sun, 15 Oct 2023 00:39:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697355572; x=1697960372; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nNv3jfwRRNqkt9PPVa1lvKqsr9PdWHn6W6Ue4vwk6JI=;
        b=StcaEIPHezWafafkMObfZVIMJk+/swRX6QtL7LAR+oAv5fniu8bKbT4oo0PgkzXo3F
         HTSjV1WacNArRn1nKZKf6cOlaCPaDyatJeTU0fcGYTJ9AHgPcivU35UkFAH36q4S2spV
         n7lviqtLvy3eoBOYS4FWCIzKWXJhaPPbJZ1GKz1Qwb9tvTgdGP1grPS5FQwu6GcRYq8I
         ObboWa8EqcL3VT/7g3Qxdl6WLgeMGBbCYh4Uh6LfZ0BB3F5i38eEnloY0x39G7kf1IS/
         S4F2vNwiW77Rw/yZoM4Hk1twcwGBtZxemxGXF710zojZ6uohKPdbAhQLCUJY0KuZSvzZ
         Lx3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697355572; x=1697960372;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nNv3jfwRRNqkt9PPVa1lvKqsr9PdWHn6W6Ue4vwk6JI=;
        b=inyDgo0EdWpt7jdoeHeSZzPkLl7Jw9I6BpVqCqKztRDyP7qfUsntFMl1aAD3m7OCp9
         UFJ+FoDRlKwQfO14J7VYrAUJViLaxEAdtMZ/XjouxBkf8Urwy7bwxrrwfrQ9srj5ZYkv
         IZm5xp66J4mRDObK8Ks44K3EOO20Qqg62cSJ3ABpDMxCfpG2Cyq47C64OZxnFNvmXZaB
         fecokaPhdYngnRIoAG5OlgLKJyeigIg7h34r9WbrugZbM77Yi0MchEifL4vIdD/aZKgo
         eB46OOpGUW0oueC7cfIe7XlV0fuEyjeGqrwh/1IALjE5eAj/2A2GkVJAg+irYfW0SzLt
         dDlg==
X-Gm-Message-State: AOJu0Yz1SzrU7t2oeMcXa36ZjQJnFWll3xOuBWRHUeVYbSETvmU9RrN7
	n86gLhV9o+6+yRCzctDKmddKtflcfYFLYc4pEsQNuFEzlYM=
X-Google-Smtp-Source: AGHT+IHwppOyj+URsllgCK0F09WQI8i3cFdFM0q+gTOnKY+C0lrJdsFmuMueCvi4oNE4itEV4q1Ks7vTsbfQBieoo0M=
X-Received: by 2002:a4a:c889:0:b0:581:3f2b:ca53 with SMTP id
 t9-20020a4ac889000000b005813f2bca53mr2652344ooq.1.1697355571674; Sun, 15 Oct
 2023 00:39:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <ZSjpQlUcyOoYv4Yh@lab-ubuntu> <62778e4d-cc2e-4310-b334-52b54cfe7e79@kadam.mountain>
In-Reply-To: <62778e4d-cc2e-4310-b334-52b54cfe7e79@kadam.mountain>
From: Calvince Otieno <calvncce@gmail.com>
Date: Sun, 15 Oct 2023 10:39:20 +0300
Message-ID: <CADFX3OSqnjGrxRazmmcBuGUOyv4TuXGEJ8fqbAhR4X9j0rn6sA@mail.gmail.com>
Subject: Re: [PATCH] staging: wlan-ng: remove unused functions
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: outreachy@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Luke Koch <lu.ale.koch@gmail.com>, 
	Bagas Sanjaya <bagasdotme@gmail.com>, Simon Horman <horms@kernel.org>, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 15, 2023 at 10:38=E2=80=AFAM Calvince Otieno <calvncce@gmail.co=
m> wrote:
>
> On Fri, Oct 13, 2023 at 12:02=E2=80=AFPM Dan Carpenter <dan.carpenter@lin=
aro.org> wrote:
>
> On Fri, Oct 13, 2023 at 09:52:50AM +0300, Calvince Otieno wrote:
> > The following functions were defined in the prism2mgmt.h file but neith=
er
> > declared nor used anywhere. It is recommended that they be removed.
> >
> >       - void prism2mgmt_get_grpaddr(u32 did, struct p80211pstrd *pstr,
> >                                     struct hfa384x *priv);
> >       - int prism2mgmt_set_grpaddr(u32 did,
> >                                  u8 *prism2buf, struct p80211pstrd *pst=
r,
> >                                  struct hfa384x *priv);
> >       - int prism2mgmt_get_grpaddr_index(u32 did);
> >
>
> Could you look up when the functions were deleted and add that
> information to the commit message?
>
>     These functions were removed five years ago in commit 123412341234
>     ("delete functions").
>
> regards,
> dan carpenter

Hello Dan,
I am  not able to locate exactly when these functions were deleted.
I have checked the commit history of these files prism2mgmt.h and prism2mgm=
t.c,
but, I can't find any commit relating to the removal of the above functions=
.

--=20
Kind regards,
Calvince Otieno
