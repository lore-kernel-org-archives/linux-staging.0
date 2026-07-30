Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D09CE348C7D
	for <linux-staging@lists.linux.dev>; Thu, 30 Jul 2026 10:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785409049; cv=pass; b=avXzfNLWOqC82gL+rvRJXqnmLS7yqSAj2sbE8T6u3/uO6zQdvzyDRBDiP6mgMaNBDkg6Dr3fppzOG8VwG58LBKRmssgx0gZ1iLhbJWqF2PoqxUmggIjW7i/6QVx0rSPqNu+Vb8VXXdfc6IHTTeiCo8FNDp4PLguxv1YFtL6lZvU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785409049; c=relaxed/simple;
	bh=VZe3ptdSvqUqRkFkgs0iRY27OuwjWKPNX5LWzIsRbYU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gTGFPyw1w+siJ1r/O1JR98jK39+VDBMmyDUG+B+5NDXwtCQKtljJTYjp6jSK6EPv2x8wZFxxW+Be3pJGDc2xBfa07mEZTQjm/+IlLK405F7/6Mxfr2H44hyxn4nSFKAVKjO+qUwAXupWCMwz6QgEC0HJ9HlE1JOl3Y9w7fhriZY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B5rBMYaA; arc=pass smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B5rBMYaA"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-81e6f0b4610so24915927b3.2
        for <linux-staging@lists.linux.dev>; Thu, 30 Jul 2026 03:57:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785409047; cv=none;
        d=google.com; s=arc-20260327;
        b=CuzG0Mu+c2diDLih4pLPmshlRfTeC4UlKdx/el8st7Qe2yJoJzsd21f4BImz0eQB0x
         QQWOPS6+adWt+MNs5KBxs2yRb6rNh9OGw/vZ8pKVu3s0l04t0w+CTnNMbMJWXdwAy43E
         Mfy61de4IBqUAKlnJCFud12dOXgDN75KE5eQKpobvYLa4dRJX12Qu/+qUqKT9418ZucA
         GUaBcUHGtnZlXQyhMqUBY2LJ3yBCn3k1VW23G+VDUriYDCKx5OcLcQ2HI0Ah/KQjP88w
         H/B6Ap+CdmxK97f4p1dkdFxGlLAmRws1lYlZts6zAt6hdKXUfH8KCpY4Oa36uXrM/OL9
         RafQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PW0GfHLWu/vkXBsR6uqeQVy3SkbR5UikWeF8VilLzI4=;
        fh=6miAYY+ETW5++n1Xz3nWZIdw2l29S2449jFVJ2Dyg7E=;
        b=H+s9Dggk5hnxPIpSgd6jtuZjNRmR5h21uFByTr4cmLCoCa057rXmNyrlQNK4IUui3Z
         /al2Rp5hawbyiEv+oajPiqskhoG+8dy+dw+n90isdzcXiKPZKLSMT8TDxYq+5YjeppqF
         SNeoi7YFr6oL5rtbBmJKK4Gw9R7EdwY8M5LKFmF5tzdldQUvNy4u8fCIGPJFjFczcJHe
         5xUd2nbARkOO3fTOicQc3OazqVO7shYpC5In2jxkbdvQxrIGw5ek9tlkNW8sN0Nyr8eq
         Kb38vBf457Ekih9fxwjUkWrPIu8ecUsnyFcjuaiqV5raDbWzyOJF3MAdG3yW7kVaSk2F
         U0PQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785409047; x=1786013847; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PW0GfHLWu/vkXBsR6uqeQVy3SkbR5UikWeF8VilLzI4=;
        b=B5rBMYaAhbWtRLrmTSBqtWVcsvtOTclSBXJSD/T95qg74OLjlUQeguFkkhactQUgtr
         CqjVx4zZiI8IP7TM5cAC1CSkFPQv/DKsVZnSImnNwM4oNQrZBdtpYoHLQAQms8Ca/F9H
         2ZNefMeQvQ4fLdFOEl9gGrqUhAUbjS6WSpLT+CYD1z8HTXRLba/VURz6GS/VDoTuxVTQ
         OtOPliFEjeBSTut9SRHUnpTEWSeSZEKU5xKog+ICJZywdjLOX3yoZFYMUReVlbMcoaIi
         r+bIpDqooKPSpV1tdpc0DUZtcmthbo3nmGAcDMLtPouMDn/zXrrggrNNkbae/sIJ4M5u
         tiqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785409047; x=1786013847;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PW0GfHLWu/vkXBsR6uqeQVy3SkbR5UikWeF8VilLzI4=;
        b=IcpLttm3WNGzc0fNOAs55t5Vx8HNf53ngRjO+uQkHE1KAalsMHLJ6OAzzwmbRVbtNf
         8IRrJxxmgcNBK8dg9rUo00JA3YknYCCSPYeG38lYG6IalqjElxux7UyHWcCMGNoj7Pin
         ngC6Xl9eBhnI63nojtfIvke1IS9luUBgJMn4sC0jxoSO1wjg2cnFvBbLYNf+9iEd9zvo
         JIcILwZkio8uXUc2pLWCqLOmDdEdpox9/PhBoynaHrNSTH2u+TV6IZ6GSeW7lUgNYey/
         OnmtxuYH7u7fgvsSCU7U5gO73eyGuR7JrQCgQ9jgTFH+XvaSxpMrNnvy4aZO/pONSfXo
         vjeA==
X-Forwarded-Encrypted: i=1; AHgh+RrLmZDaOKd+MWj1Kz8ZvfTph8iouqzl3S/ex2duGsvroOxDZ8YuYMQLlQ2WX3Q+Sf0LcZ/+IU58E79ma8zQ@lists.linux.dev
X-Gm-Message-State: AOJu0YxmYG18G5J2f6fDnjsJvZ93olURt0zj6zQd1EA69KHYYsYaZxbP
	VQ0UlhNtoR8IrGaORxO6cngQHLjxsruFgCcsDar55fwAY/hWjTEqPkBjQo6XJHlP0qjIOnLy88n
	2OepqW0nV8m8sjVvTzWt/1Utc3eOYP20=
X-Gm-Gg: AR+sD108oE1IfFRsp+FWD5/CX1MLE//sYKc8KgY9zC8MMkmTbgtYM+BRAeRQA+n84OB
	SggTYwo5tEOiKpBzNSCqNRd3c8lKeaJY+usvSNjKcY4gFSP7YaK+FWQI2GPQyVxsRwkJgZ4rPhH
	4BEDFUptVZH1i6y65EOQubhVPNXL5P5ntlHsi/x3HGbOdkyQTguXCKxjpRpn8Xr5x24DiLTGWin
	P1H3LuClUbZz9SsC8+NJuKzXSJCPVHHek+dOH0VDCvfHk92Gg8OgL80N4EZ8o6au7HJ2A/aB3gi
	KwHFDUxl4dLyIkn3z7rydo055u7BcvjRgMyB43NDMs8tUaTEGwg/3DhOgbjIWuM8Gr1hG627bRD
	t72JtL/osrXBI
X-Received: by 2002:a05:690c:4444:b0:7bd:b0a0:509c with SMTP id
 00721157ae682-81fb896fa5bmr14204887b3.28.1785409046711; Thu, 30 Jul 2026
 03:57:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260726110039.3674948-1-congnt264@gmail.com> <2026072842-protract-matcher-99b6@gregkh>
In-Reply-To: <2026072842-protract-matcher-99b6@gregkh>
From: =?UTF-8?B?Tmd1eeG7hW4gQ8O0bmc=?= <congnt264@gmail.com>
Date: Thu, 30 Jul 2026 17:57:15 +0700
X-Gm-Features: AUfX_mxWlfz_vhh-v1g2WzN_3LopqxiYQ4ANvfra2s7zj7DZeJbCKj0UzCqgFw0
Message-ID: <CAJpJ=GtHycfZncrux5chZLF-s97DiTjm-Ps_cjopamT0OPwtkw@mail.gmail.com>
Subject: Re: [PATCH] staging: greybus: light: fix leak of cdev->name
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Rui Miguel Silva <rmfrfs@gmail.com>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, 
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Greg,
I used an LLM-based agent (Claude) to flag allocations that aren't freed
on error paths, then I verified this one by hand: I traced every place
cdev->name (from kasprintf()) is freed and found that
__gb_lights_led_unregister() misses it on the config-failure and flash
channel teardown paths. No static-analysis tool was used - just the
agent to surface the candidate plus manual review.

thanks,
Cong

On Tue, Jul 28, 2026 at 2:17=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Sun, Jul 26, 2026 at 06:00:39PM +0700, Cong Nguyen wrote:
> > gb_lights_channel_config() builds the LED classdev name with kasprintf(=
)
> > and stores it in cdev->name for every channel during the configuration
> > phase, which runs before the channel is registered.
> >
> > That name was only released by __gb_lights_led_unregister(), i.e. only =
for
> > a normal LED channel that was actually registered. It was therefore lea=
ked
> > in two cases:
> >
> >   - a channel that is configured but never registered, e.g.
> >     channel_attr_groups_set() fails, the flash configuration fails, or =
a
> >     later channel in the same light fails to configure and the whole li=
ght
> >     is torn down; the release path calls gb_lights_channel_unregister()
> >     (which returns early because the channel is not registered) and the=
n
> >     gb_lights_channel_free();
> >
> >   - a flash, torch or indicator channel, whose unregister path
> >     (__gb_lights_flash_led_unregister()) never releases cdev->name at a=
ll,
> >     so the name leaks even on a successful teardown.
> >
> > cdev->name is a configuration-phase allocation, like channel->color_nam=
e
> > and channel->mode_name. Free it in gb_lights_channel_free() next to
> > those, since that runs unconditionally on every teardown path, and drop
> > the special case free from __gb_lights_led_unregister().
> > gb_lights_channel_unregister() is only ever called from
> > gb_lights_channel_release(), immediately followed by
> > gb_lights_channel_free(), so the name is still released on the register=
ed
> > path and is freed exactly once.
> >
> > Commit 04820da21050 ("staging: greybus: light: Release memory obtained =
by
> > kasprintf") fixed the leak for the registered normal-LED path only; thi=
s
> > covers the remaining cases.
> >
> > Fixes: 2870b52bae4c ("greybus: lights: add lights implementation")
> > Signed-off-by: Cong Nguyen <congnt264@gmail.com>
> > ---
> >  drivers/staging/greybus/light.c | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> >
>
> Cool, but how did you find this issue?  What tool did you use?
>
> thanks,
>
> greg k-h
