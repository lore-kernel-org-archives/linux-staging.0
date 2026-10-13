Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 579A731D72E
	for <linux-staging@lists.linux.dev>; Tue, 13 Oct 2026 17:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791912626; cv=pass; b=GLhYFCXu3+5vmMAanc0mrnCeEV5Oz+E2A7GZdCgMoGYqt4qCWELYGRKyhgoaZ1ls32bdIGItCHPO3XxLNccl6GXy/ZSUBLagPi6i1fJcunjFiuzFIWaKNECJJP0JFSAz8PSQSAOQriFj3golJAJ0enwb/Z4yrRn/zkO2yb2ay5M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791912626; c=relaxed/simple;
	bh=iU59kTEuKu/5Uo6i29XYgWs9QL0GsFGfB4ojSmsY8QM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pfZbEilW9+HSC4wRGjRHHLcgYK2JTV0cgQSLS8hGkN/yjcFHz8eIwd/D+dUPHTIwdcpLIGBSaC0zaD1AWI61v+cfBsHd2lEEiH62nvJ1EW1yZT1Ez0IM9I1rmFyGvWdEC7nZNtePRrCmIdsHh8wFVbEXd4iuoFHs89jYHkwYk2E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GtkD7P7x; arc=pass smtp.client-ip=74.125.82.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GtkD7P7x"
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-15ea896ddc8so182187c88.0
        for <linux-staging@lists.linux.dev>; Tue, 13 Oct 2026 10:30:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791912624; cv=none;
        d=google.com; s=arc-20260327;
        b=GKsWGdZRAlGyAIOXwENAFMiK901oRk2vmBR12UthphrUX+CDcH+jyvdeehwm0XPSXK
         bgmQ4inq/rSn81oYIcfZJY7IQyus9dTb+DtJaJuOLeTFBfMtLKpGCdYArG/X5XNCwCtP
         QI7+bJEq+nhXToaVUEQNAJ0vgD224AkCMmf7ipJLeT6B4RfR0Ph/0PGUp4uxlLZp3iwe
         pdqAZlRrCBda4nN71Ab8KBZaNcQtssNiUwttRXtcFMVdIX5P44TCbcAP/zh/w3Ag9Dra
         yf/HP3EgywhATKTWB78rnvZS9pqrpDA6xBrm3dvGjhUwgFmEGMlMQVNdTNH2ngwjyZrq
         yPpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=iU59kTEuKu/5Uo6i29XYgWs9QL0GsFGfB4ojSmsY8QM=;
        fh=2CVTIkVPhg0KPB0MXJsQlUHJYqJp0iJnPh+zOrgPQrI=;
        b=YhJ/pFXvnVyPuQ5F41oo5keAf/V5YCQMw3F71yJ5fUo3qqgLo+4gSPwnBtwJOF0UvX
         pCHkLC2irGzRCok6u4cilkWv8NMOR0s4ADR6+qn9EhgcLdu2djq7Y/L5+VFwUH25RPPs
         YIDsOWLHQCl+AC1fxyhCC3hmO58cuSzIthlqNROUxc+kqvfA1rLGmyUoZDQn8qPEA8Oe
         Vf8UzsFVsomnBI1RIxIIFy2gfrM8Q8+ij8BmLoKyXFObKqrc5xcvf5nkMXiNWkdyi3d5
         zAO3ir7UY4dAxcwPuK9qh0q29hSO7mHZadazOfzp2sy/RIjnhLwAgHrRm6kp4MXE4tIz
         pnRA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791912624; x=1792517424; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iU59kTEuKu/5Uo6i29XYgWs9QL0GsFGfB4ojSmsY8QM=;
        b=GtkD7P7xbO0LX5VPqP5zXIcuqz20CT7/XNokTOZ320Cquir33Py9x4WAnYAm4LSFGP
         o2BOdt8rfji4oEhJMA6pvxbioq1XOZbX4CTb38a7K5BA4HsOUGheY8uBvgZE5//blv4H
         jDtBwKCtGhng3ZyyzUYqHR/Qr2NwTo6NRGzMtim1PepNyrwhUEBZLwPWVbUebDHHhWhL
         3mGiphMX7iDMRJ+37Fk9bgyK+3Gmzwrq8ncdurz3++kjJIqyr1J+iXtnvDAePnovUHSt
         qigUvykqsqdogHQJMIKMC7UXx4VU0hLerkdP7GhFMLDpaAuoydhFCnenEmcAHiPoA0K1
         Lvyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791912624; x=1792517424;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=iU59kTEuKu/5Uo6i29XYgWs9QL0GsFGfB4ojSmsY8QM=;
        b=sESUMMjiAocecpKEvY3rbmPEbBfkfjYZyVsQO8v7o4BIjM3mQ+SNNOJLFckvPF+Yke
         y5Pc7lV6+A4A8jO7o6wRkn6vv8yM5NNjJF/IrhVyoDvpTF8IP+4mhjkJpsFx8VW2M7jB
         /t64WeoQ++yTiRacBV57DYLxGCN+YMVbZYsNc70EXCEHK81sMLtwYif9xP/J+KfJbs98
         YSfmz7Wtnxpr/gpY0TJcQWs9CCptFq2TXaTk9O0euMJkOq1egeZlc/yer7Wvo9QSyUla
         DDy0lQ43tXnte0ffStCCs+BRC2G5t38cBAsmfEeTP5dK6amL0HzXOEiFa7CFYEOq7XkH
         OOxg==
X-Gm-Message-State: AFq9FYIyB6nhIKPbfojIJSnrb+Nz0SgsPjPSe7+QJcSvnugiScuTuu2n
	Qh3Df4QZQkCPlMS+ipn/6MCZ827zrXtPncXIzoCAfusBk6NNv9lEO4ccO0Lw2mrsuWBHCib3PjS
	UT9RApgqWs32Qj4wBJZqmD88+AFGwhyE=
X-Gm-Gg: AYBFou3h9/6EEa+EYUjMKSbMeV8/Ls5vBheT5Ufwxv9AMxtalV7xayi6ZfYrrFMEM4M
	k9rcVvXcPEcQe0hd136El1aGxGajtPms7HpF9gtGh8IQVqERHOjuooxlR8YmewwZQEnc+ZeAKSn
	p0CESucM4SSCUq2MmZLMNGXf/rMEzg4S554Rvy/FA6tl7Gwa8aUMph0nv/GDLT2imKcR0/m2dag
	Aezr4qorYgSjJLIxenagbK5EGTmSqw7yCuZEMn7ID1D7HDOVIHa/j6ABEB+QYG0u373dblgSeXq
	0R08YTnoX6tWWpBB441Bibb6W7OcIuLW5qqYHsBUYwTBoScNjcjH4O4p1iSJvKL0YzgpEur/QUp
	khHqQYUyvlk8np4Zip8/IK7tp1VxhUrJHEYPSEZ8yByvFlXDt4tatZr+Mun2sBXmeVA4SmA8lcp
	Ccu6rIzHLKXkqvlptweD6Wyg==
X-Received: by 2002:a05:701a:c96f:b0:179:50d7:9ba4 with SMTP id
 a92af1059eb24-17950d79e34mr4981272c88.41.1791912624201; Tue, 13 Oct 2026
 10:30:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261012034020.100737-1-oliva.scorza@gmail.com> <2026101322-reexamine-astronomy-d4bc@gregkh>
In-Reply-To: <2026101322-reexamine-astronomy-d4bc@gregkh>
From: Riccardo Oliva <oliva.scorza@gmail.com>
Date: Tue, 13 Oct 2026 12:30:12 -0500
X-Gm-Features: AclHuK9o6enG89TsuG8KKARN_Opz28I22nC75RjQdT0RZsA5K-O7kcwoSpews7g
Message-ID: <CACseTm=8+20OAgsS+Hsm=1-8rUhs24rz1nyRVr7P2s93Mp5xDQ@mail.gmail.com>
Subject: Re: [PATCH] staging: vme_user: avoid iterator variable access outside
 list loop
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> How was this found and tested?
>
> thanks,
>
> greg k-h

This was found using Coccinelle with:
linux/scripts/coccinelle/iterators/use_after_iter.cocci

It was compile-tested on x86_64 using defconfig:
make M=drivers/staging/vme_user

(Note: I do not have access to the physical hardware for testing)

Thanks,
Riccardo Oliva


Il giorno mar 13 ott 2026 alle ore 08:40 Greg KH
<gregkh@linuxfoundation.org> ha scritto:
>
> On Sun, Oct 11, 2026 at 10:40:20PM -0500, Riccardo Oliva wrote:
> > In vme_slave_request(), vme_master_request(), vme_dma_request(), and
> > vme_lm_request(), the list iterators (slave_image, master_image,
> > dma_ctrlr, and lm) are accessed in the err_alloc error paths after
> > exiting the list_for_each_entry() loops.
> >
> > While the iterator variable retains its pointer value upon hitting a
> > break, accessing list iterators outside the loop body violates modern
> > kernel coding standards.
> >
> > Fix this by referencing the dedicated allocated resource pointers
> > (allocated_image, allocated_ctrlr, allocated_lm) in the error cleanup
> > blocks instead.
> >
> > Signed-off-by: Riccardo Oliva <oliva.scorza@gmail.com>
> > ---
> > Hi! This is my first patch to the kernel. I am learning the submission
> > workflow. Any feedback is very much appreciated. Thanks!
>
> How was this found and tested?
>
> thanks,
>
> greg k-h
