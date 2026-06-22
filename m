Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2D8234040D
	for <linux-staging@lists.linux.dev>; Mon, 22 Jun 2026 04:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782102117; cv=pass; b=Q1mjsS2Ksy/LwTBt0Roc5QXhrCDhx4YdXhXiQSXYf2n6JO9461EdYUkx/7V4MUklcmra9vMxQxtYEztDVaOpDBhMDWEKkKUBkVHLRMI78yhKAsVKo0H+NjoqMwmry4K1whS4XF05/8tCHehr33Y3OxTfSuOyqheZd1rQz1uY/Qs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782102117; c=relaxed/simple;
	bh=xgkPZSLQAYYTDOwc/lm7EUbcBNigliopnQ06zjJeR/E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r7j8aPxVYXZ5wL3usMd1NVF5Qw5DQ6zWfCXUxLr9TRuXypl+8wPnlAsDdhQc+c2ylF2IW8wB9UVWUg+Laswbn0M8H/7FXtAfHJs+0v0TuGLXKTByqRiPae9CHmKtcHOESAOA1jho5rXGMk0ggZ/5P6HDnmY0PGWGzwovF9LAQqg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s8iNOvyc; arc=pass smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s8iNOvyc"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c074142cf6dso594725566b.0
        for <linux-staging@lists.linux.dev>; Sun, 21 Jun 2026 21:21:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782102114; cv=none;
        d=google.com; s=arc-20240605;
        b=DzMLw58p/HAipwwQPYlcNpEHzOvGtIPgqgzhFWdJm+TCtnY5Xhp0Ii/BBxsLzkSl78
         BdaPoVvpJATpQxla2ARHf0tgK7hksHjs7hm1KWJPvkEs/wnG5s7R+8yjPrRGTv8UURA3
         cL2F7lyHeJiKgeuvzvY2g7PhwnbuOXcC6h175mx0p97JSjdnvMQn6DhcqvQgdFqe2+TU
         koZRqbYhVeVKJMceyOEhe+vwOz7BYFKEEK1UX3UJiH5jLKxzHcW/wVlrU5Dtp54D+ND/
         pG1JSqJxtGTE/OlLuNdkx+JLRyptRQ58zlzHCvXgtddpt9LKrB6RdsvixKyxU5bKkjd8
         40XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=xgkPZSLQAYYTDOwc/lm7EUbcBNigliopnQ06zjJeR/E=;
        fh=/kwjbheCdKcOnUFo5k1FyPPqPGiyvIQVQzwk2YBdk64=;
        b=Emmz7HSQN8syxuW3xcQCJ8bU41PGzlhX7QZEVpqllHSghAcwU/brTjJSmVZIIbkWLd
         uf6gd+5FLZ/FTgEDAcv6VXS2Zc0bTx5TyoJPus9E+vtOFkSveD+oMkJw6rW4+0VUIEk6
         ZJS6Uvv6TNsv2fqdxOJflzCmopcz/MTt1eBRNscNugnlrgl3A5lb8x7pgIJsBnXigeP1
         HGalsZ4ALDHDYAOB9HPt2R0Hm/v0YZ1MceFPNYnJR9tnW5FdwZQJMhT9fe71igHJEB6s
         pqUGJj0rAQBvXJp3Jb4SRjF1/4qzegisezfAsvLhwZff39WO/YJeaQvsRAXL3dUXZx5D
         AQoA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782102114; x=1782706914; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xgkPZSLQAYYTDOwc/lm7EUbcBNigliopnQ06zjJeR/E=;
        b=s8iNOvyc7dK5Ol3xTKQMSNCm+AZk4B3sWp7bJUuReehZEI7/e+mNWiLGDyYuxFIoFa
         densW9vHo/5vQG41Qh+CFUD9xzah1mm+B4X52aS3OSp9Ie9UUuk2fY7YLE5D7UeXvyAO
         jW0sjoq5JPSnSEPJOZOR8qwf4PI77exa0RkOWHC6ZaFumMmzu5xPhz2KvWrEgYqKIxoT
         hgGoUyoNikPruzBL23Z1gqHAPagql7UlQjJ4SpFsDd4a/gQlb8GBXPysDD215xkRIxAS
         pkmExnRKV2iu69DwVpwDFMDKFg/fo4nwqG3iX8t+1WFQPKSYyQIXRKlQiMIaDk79npYr
         CmbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782102114; x=1782706914;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xgkPZSLQAYYTDOwc/lm7EUbcBNigliopnQ06zjJeR/E=;
        b=Ukwxwa3y1tda8d3gCecAW7Mh7QnmWnNs7FP0QaLP5wNWVagaBnCBsHJofCRntunMTU
         B62ZQVXUKeVkp6Q48bfnNZ7T4sThYJXMrUCEwfHM5KB3k0Cv6YutX/8Djoy3CMGNhFDQ
         WQvh6JF0nYzakO1KyIjcMTg0801cw0zxDqhdpwffOC2grpjxgw/WKaU6QXVJODm4mDrp
         nuLDjTet96uNaUfo/JAwWGKu/sHedRCudPBv8z4OO7JdyOi2G7eLW6Hz/PIlA2jWBkF6
         ngegq82+m6FKNgd37rGXzOs87WHPdlK9RgXgOVmGYjsXdu5Fw0W/GsSiw8pD4n0A/tER
         +6cQ==
X-Forwarded-Encrypted: i=1; AFNElJ+9RsPo8al2Lxla8g1nQXGlQcub9pMpfJ34QVRuEAR8xQIYl7N+AUUT6bQVJnBQO1TG6WpaReQdwI2uH9nW@lists.linux.dev
X-Gm-Message-State: AOJu0Ywiit1uEtr7xuiI3rAlozc9t9Rpe7V0IUdILhzhQZ5wwij5wpIB
	X9Z4gVQXksqiXqW+rL8u89Wk3a1olhZlw7QQ+iju7mHqcKMLXiE0tiTAgoFdvklWzhvs4YGGaKM
	9hpQcXXRnn+zj7JWUwR8o0lJq6z0a0rk66CTmRXz/jQ==
X-Gm-Gg: AfdE7cnKSu4am8e9xzs04sU113pa1yDMie9cS3MkoYhA2YRVDWjoU1y/yMn0g+YhCpi
	CzMHJLoS/vuGbNuFm623r02j8OI8VD7i5Pj85X6wPLEaXs+CcirzFuzgmaFGqUIKeQq52FZHeGx
	MN+GAK1HxNROMGkxu+i7qeR5lEvzkrp8EylTUQ9vIwmqIpzVG9JFEd3T+86YBo5NgHD0XdpzP1b
	RSsvF2p06cVbjThprYBtD24JZ6pK55pFiQAl5Qw6GfMISwe2IEi4tEoQ/71IJKx7nV/opZNfXDF
	wNSqtN29tZw4wTIWb7c5ahm1TlU=
X-Received: by 2002:a17:907:3fa9:b0:bfe:ed35:e854 with SMTP id
 a640c23a62f3a-c09b9c79152mr574158766b.25.1782102114021; Sun, 21 Jun 2026
 21:21:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260621085209.52651-1-adi25charis@gmail.com> <20260621094312.53655-1-adi25charis@gmail.com>
 <548d66ce-d01e-4c6a-a77e-7d61378a1c74@kernel.org>
In-Reply-To: <548d66ce-d01e-4c6a-a77e-7d61378a1c74@kernel.org>
From: Aditya Chari S <adi25charis@gmail.com>
Date: Mon, 22 Jun 2026 09:51:42 +0530
X-Gm-Features: AVVi8CdPLwVQZLB0JiWV8CFDlR8dIv9xVka_w61GnzYy2nzQqPQ5o65iXNStMmY
Message-ID: <CAKt_FXsiXv7dai+F7cT=GNvETa5_42su9G1ev8+_fph0Bg5EbA@mail.gmail.com>
Subject: Re: [PATCH v3] dt-bindings: misc: add binding for Xilinx AXI-Stream FIFO
To: Krzysztof Kozlowski <krzk@kernel.org>, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, gregkh@linuxfoundation.org
Cc: jacobsfeder@gmail.com, devicetree@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
	michal.simek@amd.com, lucas.fariamo08@gmail.com
Content-Type: text/plain; charset="UTF-8"

Sorry about the pace - jumped from automated lint feedback straight to
a new version without waiting for an actual reviewer. Won't happen
again.

On the staging binding question - I found the driver-removal thread
from June 2 and read through it. Michal Simek's reply makes clear this
driver isn't going anywhere (their networking team has plans that
depend on it), and that there's already an in-flight binding
conversion from Lucas Faria Mendes that he's actively tracking. I
wasn't aware of that series when I started this.

Given that, I'll withdraw mine rather than duplicate work that's
already further along and already has the relevant maintainer's eyes
on it.

Thanks for pointing me toward the history.

Regards,
Aditya
