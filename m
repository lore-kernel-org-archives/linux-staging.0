Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C8ED411FA1
	for <linux-staging@lists.linux.dev>; Wed, 23 Sep 2026 19:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790190960; cv=pass; b=Hfn25mevShi6iKmktpfiZq4avDekxbnV4nWA7/EyWknIU1mjLxW4e0xKDWuRI5xZpjfxW82B/B42HKGb6ou6V97eeb0yIYTtm26b7tjx5sYvy0ebvsnGTVbKoRcPGhZHsHosEVPPgz1Cpdpey2LdEaCN//nuFbLA2v10pstyAo0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790190960; c=relaxed/simple;
	bh=1fO+H3CaJeix86W//NLHqNy5lAb7mvgci32QvoqP3J4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZIr4wp7nETi+8BOTV3FGoved+N7xhTWVTlWa+oJz4wa6r7DBZSgbYZdFaah2vQdeNfK+5zvfLrDfgmWz+sUxH25z//HSRffeUHfeE3EyOSF+9DTulZWi7zUEoPeHasa7FqcPgafa9CUixlgqE8GpV9GlBX0ISlubkXwtv/7mNIc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qPi0Va7Y; arc=pass smtp.client-ip=74.125.224.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qPi0Va7Y"
Received: by mail-yx2-f12.google.com with SMTP id 00721157ae682-85d43db0c16so19925377b3.1
        for <linux-staging@lists.linux.dev>; Wed, 23 Sep 2026 12:15:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790190958; cv=none;
        d=google.com; s=arc-20260327;
        b=A6d/M2tZos3ctPRPoS+bvR0V/28uzy/nlUF7Pn04Geggk+SEqRykOdxo5xVLbYPx40
         cACOvgLhfQGIe77K3EVmzgzEOgsii2IY9e55TXPDKJyCZAwcuStSpIsQIbTXFlff4YDl
         NrMtxlARYXkC3D8VItwCW3nGNcGYXmclpCmncXWRbsXqS7iTMi82thYuySfevPdRE3jC
         pSRhny+LJUiuQ83yW6X8sSuI+TGzS9L2ZK7DzJhbTkpPAfyiwgvOC4S1iQCEDwY7UwSF
         3ku6uOtw+h860ldt20CelSuMYNmDH01XsE6noNdo0EF2l1n2RZa9tohMbCxTsG1SGSXY
         Z0eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZVj1AAbZ6yw4i1ZgIrqEGNJhPbwd8yPIZklKAdOq/PA=;
        fh=C/rWqmR56ytDKft11qbf3hyva4VdW4HmC3/CxK3REjc=;
        b=P18d6QNHb5em+5oPghcxfRWzTOH9JL8+EUpnR2i6pe6463FGCqDUT8WcfmVo2PPZLt
         1iZEvWDVTCzgTTVFgVlI5VmbVtJeFJxnIq821SbhRYfweIVIFhseGKQUQpSSxHF4p2iB
         Nn6l0u9fXkhnZDTWhlMXZJS5PHEopJon3ulqqpVi237rFyJ2SwVRVZhb5k1A5hlvHJ/Q
         h7PGrw0avHBs0+rdWrNYUBDJppevHhSebVjsQEaAqxKciMhSlACO7uRRZ+lOXFk3pVTR
         1keADpXAbJWtLA5Uc0yAuBzt/9SDHlGTcRptPCB+bZVwC773lq+csw+Zk5fU0A87J8BF
         Mfyg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790190958; x=1790795758; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZVj1AAbZ6yw4i1ZgIrqEGNJhPbwd8yPIZklKAdOq/PA=;
        b=qPi0Va7YfEktBLeEM5HebpnnYKj6dp5EaCY2ArJgqihybbdwllqZWQqtqNdeXZs9qx
         oPYqNbyYxeJSAsQ9A8k4tzvK5Axww2VcJqEGeFsDVWKLc4Yqsl+p4HfOyaeMdXtCOt8L
         De8VaxXLM7xsXwKLsObGSVzJvn1MAdf62bwi3UXyix298If4CERnXDjDBTtzeF3mF/3d
         5U5G+0nijfA+Hp/wdVnQAi7BWt/DDPsAQfLOBIF4GMBBZ/KD9hdf77YpfEUe9fa0kOy2
         Uj5ci/8eDVevucxphaK2jRuknnDU8NHoyMTc3bp/JQOhg3l689U63rYp7DNi+0IByOyE
         A7Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790190958; x=1790795758;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZVj1AAbZ6yw4i1ZgIrqEGNJhPbwd8yPIZklKAdOq/PA=;
        b=AZAZZlDNfdBLFGHWYCG86QI1LSFKnIfiTyd5lZdKZrwnYzSC5U0pku77o+7TiRvZf/
         nO91GQJwbNkYSSStoWdu6DQzUTE5HlNtEp6wWbbqY0wUX8q5E9fuksUCJw07Ij4Ig2jR
         yomfTXrcg24fh+OLDVc07pAMXk3bIpqfGXao53Md+GHgPAqOsdyewCtJqVg5Ybp+IIje
         LUpQx0BxcKCeGdp4V+VBSjeGs/NuEHb/3MC78HH3bzG4+yy8eLkKejH8lPbMFv7MxqIq
         P8B9xxDudkjoJcS0maVl7LE/MdGnm3AtJszNrOsm16ln/TTFcXSvcbQxDgDcIhdNp9fc
         xcfw==
X-Forwarded-Encrypted: i=1; AKwUvBxbAERa/9j0Xh/1oT/DieP/Bc2zr0AGidSH/BMVApmGuhyNzhAyjPOn7gdV6PwlyN3khbnAqMVBiqbTiUTT@lists.linux.dev
X-Gm-Message-State: AFuF++lL7cWHah43+Iw3mOLwAaB9FyrxkxXACV0X2wFbyMdbEYQCs2lo
	51SlJJVDvYkGHRzbxZ7vFDxb5p0DH+b44Ckvd8qpsCAmuJnlYydFTYEzy2KkCQZPfpDiy8l0lnn
	kFteQ1Eg+2xh7siKpUzo37lP1RwHyXB0=
X-Gm-Gg: AYBFou37ixYLFFaSTwuz9vhHAbYR5iajosXO6bXhtseVqOrVOUD6IKeC4e/nlLpfRjy
	QKcf8t/JqM9Pu0VoXVnVBSZYYVnsi9EF4FQWOAX/83FkP6qX06L7Drf0pXPCD5DKRDbsYIdYGQx
	PIRa2LQhcrLXMlu9bcQhGkMo2aS/FQPbCMIBonVyhjSW3GThYB3qDfm/PXWQ96WK1h+4pYUMArS
	yB8sCerOsVv4zKCVGAHXs0NlVBuZIMtCtWmEiHwIYsY6LW9lnwt3K/xD3Ps8Nek84I8F/93uWuK
	D1yPokWZY/QQOw87fOX1uGpmo6+RrVArTLBVhgEzK4eO/xNf+Gfq2BeUoO2zkpia7g==
X-Received: by 2002:a05:690c:6610:b0:873:17c9:b054 with SMTP id
 00721157ae682-8a648505a0dmr1055207b3.21.1790190958227; Wed, 23 Sep 2026
 12:15:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260922215849.16739-1-vladan.kalaba@gmail.com> <arN08yVxjhAAyZ4S@stanley.mountain>
In-Reply-To: <arN08yVxjhAAyZ4S@stanley.mountain>
From: Vladan Kalaba <vladan.kalaba@gmail.com>
Date: Wed, 23 Sep 2026 22:15:45 +0300
X-Gm-Features: AclHuK9JgAQsoEghJsGDXhi9vPLNpnYzGw31sUj4uH2GUgZlNk-AGNv2A8t4vO8
Message-ID: <CAMfJq18GfekJgaCi7uOT9MazN+_scyCHfOjC3o_umzJzmZPMBA@mail.gmail.com>
Subject: Re: [PATCH] staging: axis-fifo: fix integer underflow in tx_fifo_depth
To: Dan Carpenter <error27@gmail.com>
Cc: gregkh@linuxfoundation.org, ovidiu.panait.oss@gmail.com, 
	gustavopiazdasilva2102@gmail.com, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 23, 2026 at 9:43=E2=80=AFAM Dan Carpenter <error27@gmail.com> w=
rote:
>
> On Tue, Sep 22, 2026 at 11:58:48PM +0200, Vladan Kalaba wrote:
> > Fix integer underflow if tx_fifo_depth < 4 in axis-fifo.c due
> > to check in axis_fifo_write() subtracting 4.
> >
> > Fixes: 52ff2b840bc7 ("staging: axis-fifo: fix maximum TX packet length =
check")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Vladan Kalaba <vladan.kalaba@gmail.com>
> > ---
>
> This has been sent a number of times before.  The information comes
> from device tree and we trust the device tree.
>
> regards,
> dan carpenter
>
Hi Dan,
Thanks for letting me know, I will keep that in mind in future.

Sincerely,
Vladan
