Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B48B031E84B
	for <linux-staging@lists.linux.dev>; Sat, 12 Sep 2026 15:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789227867; cv=pass; b=hsGrfqvX8ELO0y9V2imuR52hO7t2G5Xhe036mqhBb3wt47mHKql1G+nKhcW+cRXyfunaNKNjQPNr5YyADe4WUMPd3FBoKios80mIzBGfQa6JlhLPE/C9oMfd+kw34cJy9MeNPOhXTX/NJsTU1L1LyF/41Zg8OYoibxM+LcabOKM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789227867; c=relaxed/simple;
	bh=VIbgcSAZRfb3EMsaaEk0Cm7vGUjyRZyM9yj497f//O0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qvHIadqql/3JPA9kgYQctKgAddxWNwk7b74rti7ChvK6C4vLm5CyvJV3ljuAKXOS7q7TX+UxTbnUG8ws/a3ldrdVI4QdjTFcupwWcLy5Yoog72FAHTjzvMq1ZlaTSCGk/lfwWET95lBGOocCInVvZRKClKAshb+eXMy/U57/eKY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X2/MP3vd; arc=pass smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X2/MP3vd"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f16f12so945408e87.1
        for <linux-staging@lists.linux.dev>; Sat, 12 Sep 2026 08:44:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789227864; cv=none;
        d=google.com; s=arc-20260327;
        b=bn3+QrFgf2GKyMrD6uy650ljG0VGCxfj/gkrVohRuflNb2KY2gwsw/LWteaKkvDH6a
         IJXmh1q5/PdcWT1QOqLfSGm8h0D40OGi2mgIroFV3UWR2QwvJhvoJaC6RzAj8z5ieU6m
         ooaym3DHFl4RA/S/rM72jOeo2yv94DHcFlFjvthCRGlI3rAJ4XdQSlPYk8jj68SI7DdL
         7LSOExjSxMcsmv6pxHfIeTV7lr2mt81wcCQq68VZjcQB+V96ouo9CVNnWJ1UrqB5mCPZ
         rfi4B9TNiTqcnWp9fm5ddKLbNTaaubxrwT8j77MAPKXQF0p+bHHTmCv+XGDqhMuvZDln
         2nTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VIbgcSAZRfb3EMsaaEk0Cm7vGUjyRZyM9yj497f//O0=;
        fh=qU+eDUjFf5zIkcP4vte0akifxIvcjTiMNtitdh7yGk8=;
        b=hDH6XWD9uPiNqpJiyYmNdvRHRcTvFCB/pYU9PzzNBeZvdJkZzj3Wc1UTuuGvcnZUg2
         9PNnI5poxJwghEUoZLiPr8Y+kGEykGaX3DM7i4icuSAdrbk5loP6wVgnHx73nvPYmkcm
         GzVWDGbQWR3VklhUFG5R6eGCZQimmV6YLH81PzDl3mZ5zXyx01caTxGXVQ1Zmsu/Z4aq
         WMiYH0fvPckQeEjFVH8QbiYkf78LFM37E5lg2d4/ytbxoRNv+sDxMOE5M/7q+4YQ2wWK
         RtgaX3+QaGEwxR7hZB3aqKo8wuLeQYwp7yRNWYihbWO0dVlGeGfKxSwdTmNyuRhOeeFA
         dO3w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789227864; x=1789832664; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VIbgcSAZRfb3EMsaaEk0Cm7vGUjyRZyM9yj497f//O0=;
        b=X2/MP3vdATKsY1b8cnexZK9yR+1/0qgqYMWiPRRbzS6CRBTO0XUDYHXhzjaEAevz0o
         XokJ7LV+A/4krckjhHA4az6TMCCVyxL9LQCSEa5MRUC1oHjaHKUYnhxRTu+i0wITAlV5
         5JHJED4Yeha1dnfnppL7CAEy5jdg2gPBg6cDhb2zi/LHCN0jCNcxSgssxAiG3ZDEYego
         CvDUGsQZpBuSudgDC8Yklem6B9X4fNs+cdIz6MpTqAysVpBMJHl4rMPYqOke3LdOkNQ6
         Y0l8YQACMRlNTps+cFJ2JAe3mvMDR19jZsk0Qhw/UmzGXjgPky6NbPQbgsa87EAyY7mD
         SN9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789227864; x=1789832664;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VIbgcSAZRfb3EMsaaEk0Cm7vGUjyRZyM9yj497f//O0=;
        b=tTX1X5hQ3Vzwsy1F59Ui20gyXvdixtfte3VYn8mmv1ZTegZ0mn4jbBKGHrM/gsbSD8
         Bj67o1DGskRSBx7krAW3yYXO9X3FIa1Aer27YWG2EOoEAkuqirisXlrmxmDoh1L6drWz
         49XMtJwCNjpnv5qd1qXNEusmkmC5WbHvDuWeW2m3HUwxSNujyBQtPUhp4+qQyFw0Oblk
         0SAfzmeDdx6qJ2MNyv8bKnAuugS15Z70TdOgn1CXf3M6ltlGhvcgb+RDTdmYzXScQ191
         YXXQKruftpFWd6RLds8xG9EaG9cKXfOlieT+ZjqSlh2B4rh/ExNIipcvuvQUge1/TPfY
         167Q==
X-Forwarded-Encrypted: i=1; AKwUvBxhuiYgMUhqlXo02wnGI99CLSUYvamUBE9frOTcvSaBme/OAcOIXsqyw3PsCgpHSByLLAI/dZOp29Ub71/X@lists.linux.dev
X-Gm-Message-State: AFuF++kgClhkRZ4rUBDgudZE+c27KXJlCgd1/rBVuTgZFZLghfZMqCnk
	3gzInc+OTKj/NYv2qKWUFU2M0ONPIN9d3nhP0B78Pq4TPWnKnFwIHlt9+i3po+0ryPksHIFaBRm
	hsMB78Wk9VNgW6egOJrNjc+eI1RFKsrQ=
X-Gm-Gg: AYBFou3eeru80rGTaTVFvnnVDX4V3iKRfU81+FpK2QqsTZsOQC96F4i9gPdaMMPDi2f
	gCiiToF9sCs+LWYMoFfKIfSCWIkr2N7eq+xUDulI4pIlLiqo/wOHIb03Vpavw8HHdezKeglcWAK
	ApXjYvRA8+N41axRz8d1mER/IGI6Knc/PGHXvoWANXssSDr/T66xuBlhVGNwnzU6cB/Da5b1GL/
	nyWBeC0cqu6x/abnBFDf4wXB69kyTpFG6BUfaokWoi3ZlhiksPH/m2A98PzXdnQCC1ftAqFa1Tz
	SsX3Q0aRD8Ic/Wwru1QLoXEmCtmloDxK9T3jKmBRb7zFBMM5Flp34ik8fQ==
X-Received: by 2002:a05:6512:318d:b0:5b6:423:7f0f with SMTP id
 2adb3069b0e04-5b8a0339cffmr4190697e87.29.1789227863611; Sat, 12 Sep 2026
 08:44:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260912010936.12832-1-ricardobarbosamscg@gmail.com> <CAHp75Vfpq7TXcqFfGfqBZSawSSyMdbCj_gdNRkarTHyzbkJL4w@mail.gmail.com>
In-Reply-To: <CAHp75Vfpq7TXcqFfGfqBZSawSSyMdbCj_gdNRkarTHyzbkJL4w@mail.gmail.com>
From: ricardo barbosa <ricardobarbosamscg@gmail.com>
Date: Sat, 12 Sep 2026 11:44:12 -0400
X-Gm-Features: AcwNN1XRfFcNPuNAyFywkEbj9gVFTQEx20WFI7Say6LdEin3F6clCr5L4UmHlTQ
Message-ID: <CAOOzAW3+ySKGkSETW7knDLb7=aMTsgpJ4RSmRFcMjCb+gvaJuQ@mail.gmail.com>
Subject: Re: [PATCH] staging: media: atomisp: remove duplicate blank line
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: hansg@kernel.org, mchehab@kernel.org, gregkh@linuxfoundation.org, 
	andy@kernel.org, sakari.ailus@linux.intel.com, linux-staging@lists.linux.dev, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the feedback, Andy.

As a beginner taking the LFD103 course, my main goal with this
submission was simply to validate the workflow and git send-email
toolchain with a zero-risk change.

I'll look into more meaningful tasks for my next patch.

On Sat, Sep 12, 2026 at 8:36=E2=80=AFAM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Sat, Sep 12, 2026 at 4:11=E2=80=AFAM Ricardo Barbosa Dias
> <ricardobarbosamscg@gmail.com> wrote:
> >
> > Remove an unnecessary extra blank line to clean up code style
> > and fix checkpatch CHECK warning.
>
> This is the lowest possible priority patch, if even considered. If you
> want to clean up this driver, there are more interesting tasks.
>
> --
> With Best Regards,
> Andy Shevchenko
