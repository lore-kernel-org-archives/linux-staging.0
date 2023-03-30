Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B6C88BEE
	for <linux-staging@lists.linux.dev>; Thu, 30 Mar 2023 17:19:05 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id ew6so79277435edb.7
        for <linux-staging@lists.linux.dev>; Thu, 30 Mar 2023 10:19:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680196743;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/sK01N/HcAzey7kutWyAm0fiwuXpPIV0t8lDayMPKNs=;
        b=LTKkUm12AIGo3eLIKxZe1eZJdlSwFbEw7MjYGOf2wc/2fMmJkm75L7tA551E+AEbqA
         oA7iialTjFzQgsKKIP2zGyY6SWzGJjFq6/FPqeEbx0DfYET7qhdWsaKSGTMc8ROI/ikQ
         Ca1df3vPPapEwL497NnAvi70/4akBE+zB4Y2zB2WDvr/1REcx1XGnzDB8TOOL7l3aA9O
         rgH6lk3n2r0CUNxe61fzk0ouYXdUMVMZ9JDTr/3EUWLbrptSvTzLeD9Dks6g9At24jA4
         MZP6QRd17rv4n3nX+Jwbfmv01O/NGs6SlL41xs/MxOQLDXzAKBzFzV0A2MrCXZpUH/f0
         /VxQ==
X-Gm-Message-State: AAQBX9eGSnvVpDnlQU/y+cjF3Q8Q5a34loos6Ufz7wB/zlHUWIQqnS3g
	CrA94EFF7krZFkKagYM5xrm0FhLzhT75E4cjKq4=
X-Google-Smtp-Source: AKy350YytQ1yNiR6W3Bf1WUTGN6F1FlrOPm5tq5wq5gaK9i6al6bWOGltYKF/XedV9kSLG6QNcyQIMF5Rh1uNWAeOVs=
X-Received: by 2002:a17:907:a0cd:b0:947:4b15:51e5 with SMTP id
 hw13-20020a170907a0cd00b009474b1551e5mr1794105ejc.2.1680196743353; Thu, 30
 Mar 2023 10:19:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230329-acpi-header-cleanup-v1-0-8dc5cd3c610e@kernel.org> <ZCUon17pXpgBr0eQ@kroah.com>
In-Reply-To: <ZCUon17pXpgBr0eQ@kroah.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Thu, 30 Mar 2023 19:18:52 +0200
Message-ID: <CAJZ5v0jKA9GQULe360ZnwiKc4HRHcLJR=LxDwwm7DGP59JU_rw@mail.gmail.com>
Subject: Re: [PATCH 0/5] Remove acpi.h implicit include of of.h
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>
Cc: Len Brown <lenb@kernel.org>, Marcelo Schmitt <marcelo.schmitt1@gmail.com>, 
	Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, 
	Jonathan Cameron <jic23@kernel.org>, Johannes Berg <johannes@sipsolutions.net>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Jiri Slaby <jirislaby@kernel.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Marc Zyngier <maz@kernel.org>, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-wireless@vger.kernel.org, 
	netdev@vger.kernel.org, linux-serial@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-acpi@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 30, 2023 at 8:13=E2=80=AFAM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Wed, Mar 29, 2023 at 04:20:41PM -0500, Rob Herring wrote:
> > In the process of cleaning up DT includes, I found that some drivers
> > using DT functions could build without any explicit DT include. I trace=
d
> > the include to be coming from acpi.h via irqdomain.h.
> >
> > I was pleasantly surprised that there were not 100s or even 10s of
> > warnings when breaking the include chain. So here's the resulting
> > series.
> >
> > I'd suggest Rafael take the whole series. Alternatively,the fixes can b=
e
> > applied in 6.4 and then the last patch either after rc1 or the
> > following cycle.
> >
> > Signed-off-by: Rob Herring <robh@kernel.org>
>
> Nice cleanup, all are:
>
> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

All applied as 6.4 material with the tags collected so far, thanks!
