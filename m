Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C6FF25614
	for <linux-staging@lists.linux.dev>; Fri, 12 Jan 2024 18:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g5kE45MT"
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-680d4584a81so53119166d6.1
        for <linux-staging@lists.linux.dev>; Fri, 12 Jan 2024 10:28:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705084091; x=1705688891; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=opmBl8/CkWjdnrlaJu/bqZwfbUeX4H3SPCLc01ZfHrs=;
        b=g5kE45MTb7NFXkWd4Z4PgszqnlCZsOOHo1hS3d3NjAfZbfsZMUjb0ew/RgJCkuK3DI
         I0PYO72EW3Fn5Bu86bRoO98H86oJG2jfDQICToPD8TKspv7BwE+zvYDt6gbI/QBH1Y7q
         GhsHcjMVC8GHEWZSG8gLiptPDFrxGUXUKWXg9CpImtOkvG/FajNx/aGUpdcLm+66Nelt
         XQiJ43o/w882ybPmpnP/o9Du3R4nkccqMDrouoAdxCwzQD3TfP6k1Lq7Ic1hmDL9rmfm
         AHZPPwuEwh03vBUTGwIQw1HZBPryd5ECDK1UydwbzY9BaQlY7on2DItLhT4vGHQkP9k1
         yv+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705084091; x=1705688891;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=opmBl8/CkWjdnrlaJu/bqZwfbUeX4H3SPCLc01ZfHrs=;
        b=wbeKRyjEqWN8EMRJLYFnCKgu7en9zPcMSEaPPYC3ew4wu4D1cEM7d9zrf4ADh/+0X1
         oAMg8rqZilcyA03l+79jfHJ43ZPhlgTmz51awZoLW8QNNSq5MFm/qE/lLupWC2bTDQyS
         oSu4MZuBIQJKK7Z0aRr97s14F+f6g8nZVsJOMCL6xa3wiFbtOS3keRfymej4ANlRKxQz
         0tMah+N/9MgEkNPZisklwi78SZ0+9CSjs0ksWky2T7filhdXEQ+DHqzH9v5HHXlYRJCY
         td8Hrdm8T4yfMzDbgEY9xU9GwVwrn2Ueq+oSLOEQ8OG3f6FANNB0rpD6LkkX0mJ4SlCq
         ixuA==
X-Gm-Message-State: AOJu0Yxz4JPUTkmkuEqH/mQ6OD3o8ZDDj2mcnWb7wOX6BzbAbC1wbeU3
	nlwn3GeSl8X3suRFmldMhyDIZ7wnEAecq1u2qf4=
X-Google-Smtp-Source: AGHT+IFF35QiYm7jA5bgAgr6n96xbYn8XdXq3EadB6kJJiGWSiysApSLocEODR8eqTUFZob8HUv+BGIsUkThmktlVRM=
X-Received: by 2002:a05:6214:29e5:b0:67f:62e5:bf17 with SMTP id
 jv5-20020a05621429e500b0067f62e5bf17mr1791809qvb.34.1705084091376; Fri, 12
 Jan 2024 10:28:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240112083421.3728017-1-alexious@zju.edu.cn> <5dd12651-232d-41f2-afa4-2a3e5c127969@redhat.com>
In-Reply-To: <5dd12651-232d-41f2-afa4-2a3e5c127969@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 12 Jan 2024 20:27:33 +0200
Message-ID: <CAHp75VfKj7sQ3HkNaqNe0CjVrRb0J=X3gPJf-rSLeU8RQ2hjFg@mail.gmail.com>
Subject: Re: [PATCH] media: atomisp: ssh_css: Fix a null-pointer dereference
 in load_video_binaries
To: Hans de Goede <hdegoede@redhat.com>
Cc: Zhipeng Lu <alexious@zju.edu.cn>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kate Hsuan <hpa@redhat.com>, 
	Dan Carpenter <error27@gmail.com>, Brent Pappas <bpappas@pappasbrent.com>, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 12, 2024 at 10:49=E2=80=AFAM Hans de Goede <hdegoede@redhat.com=
> wrote:
> On 1/12/24 09:34, Zhipeng Lu wrote:


> > Fixes: ad85094b293e ("Revert "media: staging: atomisp: Remove driver"")

> Can you please submit a new version using this approach ?

Besides that, are you sure the Fixes refers to the correct commit?

--=20
With Best Regards,
Andy Shevchenko
