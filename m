Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 368C721B192
	for <linux-staging@lists.linux.dev>; Mon,  6 Apr 2026 20:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775508691; cv=none; b=ZgnZ3zq7jCnw4nwY6ZuaKjT1kEgeoMMVBawWeT4mF4Rs3Vd4zcDiUssr+hDP74rNrzuhdwV3Een8sFgubL3r7gRugIqPeJb+2dIZ8bGHz1yR27lZwxocwTSXV1mKG+DIz345Us1hqIVHnTxSGQL9PB+HB8h31WcOlnOCnRPmJxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775508691; c=relaxed/simple;
	bh=3fjbOwGNW9309jTSztLgD7EJ2rQMqtKi66IRHr1gtXU=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=IeZ2ySBfs2DpIxNtGgG4MyLUlv5sF9g++B5VvWB8eFbXMo2VYt4pzeX35As7DgxAi593m2gLH5z/yHOvrrg9qw4Oy6zXlXMiVZETyG/Y7IY1+ghslVzlN6AbaCh+Qgf9hD9fjhso0Su7GCJ7Jh6hujGCPELZiSxp4rJfqM4uHzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FdpHlB0D; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FdpHlB0D"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-7991db3dc98so45591977b3.0
        for <linux-staging@lists.linux.dev>; Mon, 06 Apr 2026 13:51:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775508689; x=1776113489; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3fjbOwGNW9309jTSztLgD7EJ2rQMqtKi66IRHr1gtXU=;
        b=FdpHlB0DR3ZaTqUfrWQhX2fXYMQMRBtcVzROsGFvrmDqHj04Da4uCvpUM1k+iKY2KX
         xb89CQKJcKmXPbDefT+jBY1W/SSawBAG9UhQgIsHrrgt2P3f/feHMIZkLRH5XoB9nodQ
         1oYeb2SKFRvcn3OqhODxucehVzhym3/DodDD4FT/926iuIF2ty3bLbBcxrvcHC9Td3IS
         VZ2PHWHlaZaTcURbiKiwmWoOY8l5MYwDdA5i3WMCkpHtX6jY+KK1FCQsbWKPeE8HZ7hF
         /L1I9ipmuITlrggtERN5Im4wF+CNNrrpgUk7WyDkNywzw1RfKi3aiN3x3G6vypZbge6x
         EUAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775508689; x=1776113489;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3fjbOwGNW9309jTSztLgD7EJ2rQMqtKi66IRHr1gtXU=;
        b=AVQ4A5fQkUk5VYNQ97L+h5kuSsW4kr0iHh7hHuYvhyl841ldYiiNqJ6NuE6QQo7kMk
         Mmadkt5xk6ZSZ/+JkKbez6rVScwwyiKhWMBprCqkxRbj0yzVqz7jfD1jxgrwIsMwXip0
         ja74F2PJ3e7IG7xLzM+/dhr+OXuDDgXdL0WqY6ERzJW4oZdNUN5Uu4lELr5FyS2S+8on
         CG+y9Pub+3jBSjyLRcaYEPh8olrZphZ3XKD4LXKhk+y3DXkk8pxq11i3zkyJju1Shl/M
         JP5/AytLJJt+iHmOe0sRPSoDY2G24X0PrrZSOki0i5/wgB1rXciU+MszWHgDJ1f5Rn0o
         15wA==
X-Forwarded-Encrypted: i=1; AJvYcCXR+9ISdsXWE16gA9ChC7cCARiuD7mCHPiJzVrkgI6WgcGRSIrR5F8gnM3F8nPbdkIInGypvkhv4d9s9+R4@lists.linux.dev
X-Gm-Message-State: AOJu0YzbsudlvV8Op7PS2p8rReOPim5a4OtkmdAeQwGF69cVg3vfozCf
	O9PLwrRAKkMsw3/R6vodEX4wOKxXJZqoyj7SZTEVa6rUH5osuh62m+z8
X-Gm-Gg: AeBDieth7EuIfwtKcsFTUXOfLZ/AelGZuWbvnPQxKIxJKZ7TwXkpTryfxEQtzZ0Qbi9
	H0vYnHUtQGgcwUg0XWMXh5ib8cOy/z7T/JMAWAzCZKh6maH1vEhs4hOnh8a6edK4yAmZdLrUwV7
	Q3bgaNRzkNgpeQTb2MTbAaJ2wXAsLmayndGCEl8oJKTqflm35K67W+d8O2YmxQo0rXg4+Wpf5So
	GGN6z6oeiqf2+5uC0dWMHDHCwZQ1QFWmutsTS013Uf57GkZduZ75sSPvVOJR7kb4o6LE5W4ShCv
	lcwlmpwpwDjRAbnqPl4BrEpaizL7GuQFr9uILBkGk++M9+0rgbXTIXViJOYJFYhlGPTLjJ6YflC
	cmHL2lWikwL3yftNWvilSQWdPYJZvI2G2leQPAGBIlQI7+KDVw95zpow7YQ++VLq3A6ufEctX7i
	tPJQYh+swp2oJpQyUXT9wat4w747QleH6hS2A1HQ6U1x+jx4hAgPU0oapFkQA2wSOhi4TluHjvZ
	0l9IfJYkLsMGUYJR/g9IICbVzFzS/+o
X-Received: by 2002:a05:690c:e04f:b0:79a:c93f:4acb with SMTP id 00721157ae682-7a4d6449755mr118038067b3.54.1775508689159;
        Mon, 06 Apr 2026 13:51:29 -0700 (PDT)
Received: from localhost ([2601:7c0:c37e:2360::17e2])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7a36ea2872esm58167437b3.19.2026.04.06.13.51.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Apr 2026 13:51:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 06 Apr 2026 15:51:25 -0500
Message-Id: <DHMDAU082PV0.3UBKYLS6Y2K8P@gmail.com>
Cc: "Ethan Tidmore" <ethantidmore06@gmail.com>, "Dan Carpenter"
 <error27@gmail.com>, <linux-staging@lists.linux.dev>
Subject: Re: [PATCH v4 1/3] staging: rtl8723bs: core: cleanup booleans and
 style
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: "Andrei Khomenkov" <khomenkov@mailbox.org>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260405160135.22291-1-khomenkov@mailbox.org>
 <20260405160135.22291-2-khomenkov@mailbox.org>
In-Reply-To: <20260405160135.22291-2-khomenkov@mailbox.org>

On Sun Apr 5, 2026 at 11:01 AM CDT, Andrei Khomenkov wrote:
> Simplify boolean comparisons by removing redundant ' =3D=3D true',
> ' !=3D true', and ' =3D=3D false'. Remove redundant parentheses, add
> spaces around bitwise operators, and wrap logical operators to
> the previous line in if-statements to improve readability and
> follow the kernel coding style.

These are three different types of changes that should be their own
patches. Please keep one logical change per patch. The rule of thumb is
if you have to use 'and' in your patch notes you probably need to split
it up.

Thanks,

ET
