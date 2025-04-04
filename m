Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F04F5611E;
	Fri,  4 Apr 2025 09:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743757554; cv=none; b=ESJCybXM9GRohH2VL4+yVmXmZigQ9LCro/hjnl70q+ug5J4lFSh8/CpgQaTsig2V/7vvYTRXh3zMH2WLiaGf8NBoagGO/O9Vih8RcoxRLdd1eofE4my2XlriJL4IiaV+c+lyA6Jz4MLJqk6riZT2oxEJow7r3f5aFdN6uET+bak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743757554; c=relaxed/simple;
	bh=uhKMFNAVbmR4Kr/0n24Wq5pDZu2LhHwS5o/4unQpAXU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EF6i6z8zGfDZR0QD3Cdw/f3Rr025ExOQpm13SK1/Pe0o26NBQMRWzHIaWtp+aNToK2VveVuCR9wvzllvjz5IDz1WYzg980svpb1DjQQhMEy4xoYE0IQAgEIWpIBPTQUCEHmknmbouONXAEMEed/mxYkffrL7W+jYHlnU0oHPilI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zo2ehvDb; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zo2ehvDb"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-7c5aecec8f3so261996585a.1;
        Fri, 04 Apr 2025 02:05:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743757552; x=1744362352; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uhKMFNAVbmR4Kr/0n24Wq5pDZu2LhHwS5o/4unQpAXU=;
        b=Zo2ehvDbceNParQ1XolxZKAu+bsCP7NwrUM6vULyCj+y5keF5yOd9Gfx0OaLlMrp8d
         RkQTUgtL7g/GeXRBsFMVxCpKOc9j49UtsHBaOynGBZeNZMoG48LkZUnJF4cLQR44AqT3
         UxnN/jX1EHLHwDULS/dUyNygX9BqwmOB40WGf58kqX/K82cH/I3EinPduzdZsovk8qtk
         2nwFS1RAw2S1Blj5GZywD7Ba4n9lqz51sF0U24jD8Wx442qx0Gi1BW2kiIaBT+zx0ilc
         aphQAOfK5K2mcFh+R/+7rV4+qpvuXrcsfq+vNxx3fMm6ot1Cdn8tuNAdJgcC94LW4oc9
         K2xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743757552; x=1744362352;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uhKMFNAVbmR4Kr/0n24Wq5pDZu2LhHwS5o/4unQpAXU=;
        b=ZrtIwZM5V1Fveij3C5EmedwxUSQh83l4bMwLCu8+ZncX0BUxTu2inVc1LeTgDXIst1
         CuvSlByC22Nym6TS7BXUPKncUVcJk2nio9eUH7M/Ywd1b8+KPXQ4BODYIlaJq7kUGL4a
         JmWhwJyBztB4sphu+8kdo2EndM8WOGtdA2GjdcxeR5XAvUBVy1uE5/TEIxkDvZjR8d0Z
         CJ7BvbAvbmOxvRckwN++NI3y43HzqXtX/+jrlJmsGuUyiGGnGk6RgUx67eFTK5i1I4Ze
         kk0EaO4JaUNnBGryoXIlrUeKQa3cpi1fK/iTEdoeiG6T6WlvlxbwLLbWf5XcGVjyL7sr
         hnLQ==
X-Forwarded-Encrypted: i=1; AJvYcCVuIxW3pon/xCc4qrgtI3/db8ZxA7FeUbtGMc9RmYkuUUEgImhWGqyEb0YlWeWUzdqS2NWMxh49WazdMJ9vuF+qmxeiiA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxkPGYrMxSJFTLJQulvM+ogbREPzyt2XzQVrKJQwzFLlp1sfK1e
	CLAyZEynNSkhaRQ2NlKe8/U7i+3pW8jA504/5/gKCB2NI0Euium50orGw2nF0241ccAqgYlHwu9
	KKYA5xSow5KTAWXBONbED8QfHWtk=
X-Gm-Gg: ASbGnctKY7YOyM63IBLIG/agoZkE3VKG6pdsZ61phH/TQN8+JetzWZ9F9F3F0Gj6iUr
	F+kNJwy0Mr3loaY8RTKsN3uj6m0GATLZldyojM3luyuHwOMBD5MkscsnuxKJR4ju4V+MZ8DlVij
	XPb4smZ8QgBF6GUEslvvfyeV6LpCCFrl36L2+CHljvmE4o7gQ8AJRhlhLS
X-Google-Smtp-Source: AGHT+IGeB5gy3Bxye7z2MQOfNjxPTBd6g4r626j11K+xJvAUfHLE5a3OVvVAhRJh35DKi5LecvLM+IdQonxpnOsRMcA=
X-Received: by 2002:a05:620a:1a10:b0:7c5:57cd:f1cb with SMTP id
 af79cd13be357-7c774dd6ed6mr310719385a.37.1743757551749; Fri, 04 Apr 2025
 02:05:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250403160807.100057-1-gshahrouzi@gmail.com> <2025040429-avenge-camera-8d88@gregkh>
In-Reply-To: <2025040429-avenge-camera-8d88@gregkh>
From: Gabriel <gshahrouzi@gmail.com>
Date: Fri, 4 Apr 2025 05:05:00 -0400
X-Gm-Features: AQ5f1Jo01_JEw9ySJEDjCel8vQNe5KvQVh0WsMLpEgdBI48FpmeYR0ubmuhUQR0
Message-ID: <CAKUZ0zJzNinEqQLVH8o-QKYoZ99VWum-Qtfr+rGNytK44Zzdyw@mail.gmail.com>
Subject: Re: [PATCH v3] staging: rtl8723bs: Remove trailing whitespace
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, philipp.g.hortmann@gmail.com, 
	eamanu@riseup.net, linux-kernel@vger.kernel.org, 
	linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 4, 2025 at 2:28=E2=80=AFAM Greg KH <gregkh@linuxfoundation.org>=
 wrote:
>
> On Thu, Apr 03, 2025 at 12:08:07PM -0400, Gabriel Shahrouzi wrote:
> > Remove trailing whitespace to comply with kernel coding style.
> >
> > Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>
> As far as I can recall, I did not suggest this patch :(
Whoops. I misunderstood. I initially thought "it" meant the suggestion
for the new patch revision. But thinking more about it, that would be
redundant, since that information already exists in the previous
version's thread and could be spammy with many reviewers.

However, providing information on how that idea first came up is
useful, since that origin story doesn't already exist on the thread
(countering the base assumption that you alone came up with it).

Separately, I need to make sure to use the official documentation for
tags instead of relying on Google searches and third-party
documentation.
