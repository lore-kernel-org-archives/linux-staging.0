Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D8193148CD
	for <linux-staging@lists.linux.dev>; Tue, 13 Jan 2026 22:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768343661; cv=none; b=R/3d98IN2BfAyuwMoEPLYHEGghvPOHqL9Hr1X+QATkXu2zMtKz7Qsv8odDrP9KVx8q74htAcutf5JWveXu52g3ANsuUSeTE+8lPzpzcB1B03W8FKipz+1CeFj8UUcC6gXqF8LgzDHNrmVGD0GJeKIHENFoJHfVLsXBBCqlSCkYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768343661; c=relaxed/simple;
	bh=ca3sMZQ3yRnmRpkI56rIDFvF7bZ5BmR3/Uip6B9NYIM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K09L5gEWzBs57kwwyKWyb21y7Nj2MgYnBXzjFDTXf93PumbVkj61gd3F/3YGuhN81mE2M94EpQnLqZBZNWo1E589zWZJ3byIkL19dpLe0eaNZ5rcV4/DOrV3Jx/+rXryWAX01aDauLX/qNcaKQBDDfI7nhGX1Ue0jvgQriCI5/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UfO/JFnE; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UfO/JFnE"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b8715a4d9fdso380762066b.0
        for <linux-staging@lists.linux.dev>; Tue, 13 Jan 2026 14:34:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768343659; x=1768948459; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KCjGNZYzF+uQyqn73WJNSUS0xs7xih2Got5mg0iTccU=;
        b=UfO/JFnE0idmZKBzXHGe824S91proBEEh3lYl6KcBDZv5eeksQjbnpHkIw4+Y2B45N
         8FqsS/H1F3vipjdTmP6x5AMq8plmjVkOBCLCI3mBkM1Z5DJL+Edys5XDD/4ArKxX8sIw
         UZcWvjHeEk90mLRmPqvcApnM7YAYwn8QfJBtIMosCyOQLOwbHH0iG1mn+3fwBheA98mu
         Ep0magAGkt9gzslo1U5bgE5gPSM8seePNTOdYW44lGloQ6/egN84K0HMaDHZpynl57a3
         eg/qfEvwXCk5JUrINUPjhVaPnzua8hrU/u36Bk8O2gK4h7mEKAuJB4vrGoXpChCK/ctG
         ouGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768343659; x=1768948459;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KCjGNZYzF+uQyqn73WJNSUS0xs7xih2Got5mg0iTccU=;
        b=pPoVD7vJzyyd5fjixC/aKl+NiN0IzoiMKTNr8C6groqsQGUH1KPDZx8n7jM9i+Snpz
         GmMdtZDDW/88hJKgtt//If0bm6vLJRMs5ltcDd4KQPWtQkeL1SExFURNZSXvXwRMDaw0
         tzHSeyN4kqiQpsva7N+8ETIj60sZufnfZFe1bFURHXUu3VTaHs5ZcOc+4sNcUlVJ8Onh
         bQAUScY1eAr4yw8WMCoD9UQlLmzXclWvOmqhK4C9JO7KXQVDQ5Q/WqVAFUZFqeEk/FFn
         mJThZi/dWHndYPfafaQyW02YbM0k7lSvtTaa/9kg5DOgIWz/KnmYSh0vfhLb6TL2tbaK
         WR6A==
X-Forwarded-Encrypted: i=1; AJvYcCVajKrWJlQocd6Bon+yX5MTSbtB9NLEic9F0YNoZcLHaVUwTtu86etTmzXQjxjrA3jM0kjsfhxri09FIQf0@lists.linux.dev
X-Gm-Message-State: AOJu0YyIbVjSIVC/IEwE5LxN6/xg4cmjYasGv54gWswTmI3baslNI0B4
	9x2BCRDHt4AWrfP4eS+8BUypfKDYFhW6i/H/aX/8dER0I41jKo+YKCbOpK7pWD2wFnW0vypg/w5
	W8r2Ee7cHET5xBsMadgEL98bB7x2Xfl0=
X-Gm-Gg: AY/fxX76IVVm+yTm5Ee11VxtRZgGwvXROIGemd4bXcbdfXxL0SRS0rtxvDeWX0V8YyQ
	ewJSiRo0eYkATW8aVKuKha6Gxw5EF3mp82cFGJbQ8O0vKzPqKxfImvgR6uRlDu/ab6KHWtdEw7Z
	VPOnR34agxoLRSJ/aIVdQ/8MC8AyyjA6Df1Bt+oVQLyi+WN4x0RIW+cgJ6BBsukliP6i+FWZDLE
	1Gks/Lfyexcj360SJUGrWtosU4Zs7z4NqaW0h+MenI4A7JJG4bwsE8xTMts1A0irdpeOmlgDc96
	n5B1oCzWLgXRHIn+3onK8sibk6whOGjD46A2hof13wLdhoCxW/69OPIiiE5AsEuc8iaeTi8=
X-Received: by 2002:a17:906:6a07:b0:b87:2e8a:e256 with SMTP id
 a640c23a62f3a-b8761139c37mr65177666b.31.1768343658499; Tue, 13 Jan 2026
 14:34:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260113221722.5157-1-gideonadjei.dev@gmail.com>
In-Reply-To: <20260113221722.5157-1-gideonadjei.dev@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 14 Jan 2026 00:33:42 +0200
X-Gm-Features: AZwV_Qg-KjGT__tA_wPvwToo0BjLz68_JM46Yv5Ai0wR3NAD2NC4cBQyUjLnf7g
Message-ID: <CAHp75Ved+zhACJ9CYLYnkzW6Z52fmZT0VY+0NWKYk6O38HCkdg@mail.gmail.com>
Subject: Re: [PATCH v3] staging: fbtft: Change udelay() to fsleep()
To: Gideon Adjei <gideonadjei.dev@gmail.com>
Cc: Andy Shevchenko <andy@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Abdun Nihaal <abdun.nihaal@gmail.com>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Jianglei Nie <niejianglei2021@163.com>, Matthew Wilcox <willy@infradead.org>, 
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 14, 2026 at 12:17=E2=80=AFAM Gideon Adjei <gideonadjei.dev@gmai=
l.com> wrote:
>
> Replace udelay() calls >=3D 100us with fsleep() to avoid busy-waiting.
>
> The delays are used in init_display() callbacks. These callbacks are
> invoked by fbtft_probe_common() during the driver's probe path. The
> probe path runs in process context which already uses sleeping APIs.
> This makes fsleep() safe to use in these situations.

You forgot to add a changelog...

> Signed-off-by: Gideon Adjei <gideonadjei.dev@gmail.com>
> ---

...somewhere here.

No need to send v4 because of this, just reply with the changelogs for
v1->v2 and v2->v3.

Also note, it's assumed that even for such a simple patch the time
between versions is at least 24h.

>  drivers/staging/fbtft/fb_tinylcd.c   | 2 +-
>  drivers/staging/fbtft/fb_upd161704.c | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)

--=20
With Best Regards,
Andy Shevchenko
