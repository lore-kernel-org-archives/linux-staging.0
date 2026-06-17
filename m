Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1B36285C91
	for <linux-staging@lists.linux.dev>; Wed, 17 Jun 2026 03:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781665241; cv=pass; b=L1uePGChg65TLoM0ZYzjy6CdkZu9I0a+8aHU2MJqD2iUHKfgCeFNURc54uOY5E+DOneYeyxHWDUxU/TreeAX/wV6gImP7OBV8j+9e9bpmR3anmyFcKiSRDJ4jk5alrMnu7dAn2jrnTvzldsBX4jzN3da2eKNGoq42TauA/cYGRY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781665241; c=relaxed/simple;
	bh=FzlNIwubDBvMWTsHAsdbkyAlcYjfTZvIU4NRqs0asyU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=enpfUE6ibYleLlVlg3UZ2PbyoyH5uc4UWWrJT7qVvz7y7th1NUQSzs0KSB12jU3m7BqXKSu/lU9icnlcMamj/kpeW+z5zAOvB6Vhc8uOyC2iKN7FzZw0jmT6f9CqSIFaEuyCoVsHdSaVlo9XWRlhvT6niZbtt4FmSKaQPWCxZC8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RiDvCZjY; arc=pass smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RiDvCZjY"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-bf0170c80f7so892492966b.3
        for <linux-staging@lists.linux.dev>; Tue, 16 Jun 2026 20:00:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781665238; cv=none;
        d=google.com; s=arc-20240605;
        b=IPLcRBewIDqbocIbG8ZghAPZ4aBg3bsz8TBPbmazyX/DUMDPP1EBmjiJResWK117wG
         huJye2iP1DvxwgG++MY6H5f1X8W9mwy7oKzWPe7kCXo+L9heFHDDAtA8o9cxTJUbCyn2
         QpDhfeOdkWjrFJ1y63qlx1O6p3OeSS6SPO7S2+deqDLWZMmHWslqMg91EwB4JUtV99uB
         Wt8cUyHhUeVOtKSiJfJVuKU81Bwpy5yDXf5t6Ot0KD07EVN52ldEsp0XzOTy89FkIjlF
         I5cg4vPoTLwj2N8RetkGYJRSIpv+SQybH//0/zo4nKVRZWD7p+naH3nCh0RWk1/+cbLm
         qI3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AVxcb6MPW/0aaJ/FVE44HUUHQfK736ne8YqYi6+JyTo=;
        fh=nu2OSz9cqGYnD9JCdAD+aTFjITWCo6KeSQrINj6Pjc8=;
        b=j+h7H2Va4VpTpysusSEF5lwhKKjL6eyURaaTd0yCY3XHYQzhhXHhA9Cr3zcB69duH4
         SUsSyn+zdJ94kQuzb/pUUqtsQp180LYnySF6c+ckUGj1tsetjoMB6RdNfJGQPzFrLaCm
         pZ8JMAucHoE/7AE75Iu29CEHVFuMu88nHbMo9h/WMCPQAPXWlMNBKRm5cVs9sEunYrQT
         8FDArR08tcxId2sLVFFdzqA5aypwaBjURkGPM4yaUBx4zt4/NzGxvToNLYG1U4uC01Lu
         AWtzItyQDZPv/AVc+KS3hDa67jKBg/HIXqJOjMNyUsOZgGNoQzhhn0PZ9sNEuEzL1UrW
         xrwg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781665238; x=1782270038; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AVxcb6MPW/0aaJ/FVE44HUUHQfK736ne8YqYi6+JyTo=;
        b=RiDvCZjYnzJ2gpw9UX4vwGneYJhIMC6Osx8BpeGKKYxKSe9JlSdlZfCGiAwhO+Q/ur
         VV1E9EWPIr/8XJlO9uaMKFI1o7jatRFIooZ3S1kG5i/l65G92kO7swZyk0lFYARfcYtW
         2A27qPa9wtv2nIDD8ZPQYseqvcAk0Mn/x0cHs6Nj6EOj2wTqg6a8cYQgP8z+9rS5l5uT
         thh3EDMAykCDP1Ge4xtytQNrz5v/ZbfhNbBfTTkSIwByoquW9Y+5gRxpobX4FDZuHFIM
         /Qft2qgb2wklO3VMqbAI5WN1FgUFCuYQEI0TA1YPqjbXtryHuHeCXoH/6L5nQrN70zmY
         ijtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781665238; x=1782270038;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AVxcb6MPW/0aaJ/FVE44HUUHQfK736ne8YqYi6+JyTo=;
        b=CHbjSEwaIcl3YrLRu8pKpetLN88/mvUS4yeeDDyzBfFTMHnhF/SprGIHyKJK+GIpUN
         qD6+JyhBToqNs0hMx2HCVppEELhPnLFOQwYrFbsK6QlIxwh6rKR3ukJwl3ujlZ+3xQAm
         5eT1LBecCcwTTSRiylc0+6h265hQcVnR59i47fNR4Uueqwr60O2VWUxtf9EqNfCPT+BV
         FjTFu40qrU3e/7jMaqSeFNR/96yUaEl7f62CTNzb3xLKfFxr+D2zYDVG6gvZtU4AdLvS
         BrgLkRxEKn1HtOh2EbSWRmEapIDvZL4nnP3K46D8dNGTxoCN7RvX3CJtaQ64ZKsx5hqr
         fNWw==
X-Forwarded-Encrypted: i=1; AFNElJ+Ru0CX1PYDuiC0Hhsq9M2iBlsQky/+jbhYxJ5PTgnyW7EEEtXGUKncqNstJi13fZnMNa+zxIqAMGdWOTNh@lists.linux.dev
X-Gm-Message-State: AOJu0YwpIswHS4IYA93H29uDgyJuE4sT5U5e8ak6auZ/B3mB9HIzaaot
	S3599RTVIAe9MPw9XVLH/Zh0EzRVYTkMqhMDGF4PhbwZSa1yPxq7XasrTQKoUHqaRkK6/bjt5oJ
	SHJ2rQ6AKNXl0AGO/bcnDLII9DyVNwrw=
X-Gm-Gg: Acq92OEU5XC/scUQMYkSseD2SaiyEX/i5ciDIa/OsOc5YlT5LXcQAllrFqXKXVN0oEL
	GzoT2Wskl/7RAxaawTp+SIsgY1ssnjZ9orlnKoVTMeP9Gg34kJ5HS+vt/QGLRDur0LpDkeF3ZbB
	0WtYjInVT7MiRSCE7Y3714iMutpSx+6lNQjraEswXXUnbBfJQqDjHTBaRnlxqDqNvsopFQTYHCq
	cNR3w6rBOEZ+kP07Io3ETMfE8BpC0LcazNI3Teu5AM26Dxua6k5GdIND7Hh+0rM3nivoikCZ7aW
	/r8geAq3zryD5JyGNYb8cExX+RE=
X-Received: by 2002:a17:907:844:b0:bfe:ed06:5a20 with SMTP id
 a640c23a62f3a-c05a83a5be6mr120171466b.53.1781665237966; Tue, 16 Jun 2026
 20:00:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260529111927.14138-1-neharora23587@gmail.com>
 <CAOWJOptv1JcOGcEt39HVy7LkpAsvzbw9yj64kJG+X5J=VbWrMA@mail.gmail.com>
 <CAOWJOps9RBNAGsPFsBCbzFkEUN1=75YvwmqJX6RdQBbt1C6W-Q@mail.gmail.com> <ai-j96dVwtPMERVM@stanley.mountain>
In-Reply-To: <ai-j96dVwtPMERVM@stanley.mountain>
From: neha arora <neharora23587@gmail.com>
Date: Wed, 17 Jun 2026 08:30:25 +0530
X-Gm-Features: AVVi8Cc5Aqz6IEU_psJpBjlzSR1xH6pEKu7o2DlkOJhvJA9uetWjimuvkY4Vpkw
Message-ID: <CAOWJOpt2CW=-zybOrPr2pwfPVQFcd+j3YoNP+rMyAar_2kJtbw@mail.gmail.com>
Subject: Re: [PATCH v3] staging: sm750fb: rename pv_reg to io_base
To: Dan Carpenter <error27@gmail.com>
Cc: sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com, 
	gregkh@linuxfoundation.org, linux-fbdev@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Dan,

Please disregard my previous patch submission.

I am currently working on a complete rewrite of the sm750fb staging
driver into a modern, KMS-based DRM driver (sm750drm). Because this
is a complete architectural overhaul, I am building it outside the
staging tree structure.

Once the sm750drm driver framework is stable and ready for a RFC
(Request for Comments), I will submit the entire new subsystem patch series
directly to the dri-devel mailing list and CC you.

Thank you for your review and your time!

Regards,
Onish


On Mon, Jun 15, 2026 at 12:34=E2=80=AFPM Dan Carpenter <error27@gmail.com> =
wrote:
>
> On Sun, Jun 14, 2026 at 12:45:05AM +0530, neha arora wrote:
> > Hi everyone,
> >
> > Just following up on this patch to ensure it didn't get lost in the que=
ue.
> > Please let me know if any changes or a V4 are needed.
> >
>
> It doesn't apply to linux-next.  Did you work against the lastest
> devel-next tree?
>
> regards,
> dan carpenter
>
