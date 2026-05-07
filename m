Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com [209.85.208.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE55C3164A1
	for <linux-staging@lists.linux.dev>; Thu,  7 May 2026 04:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.193
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778126784; cv=pass; b=jiK92AVDx3mH2IwpS3qyOCR19KTkYZ2sD/uvHXX6Wke2IsWWtzTVlJd7HUgszZ1vZZCNascdPyowdySIHo9etCISP984aTFBSc74vt2m5Iqkj6XP8ZIyUlVRMegquhT+UjHi1hdszLl3YyLQxwM9tO9IVoLJsyjtv2AHkTMYtXc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778126784; c=relaxed/simple;
	bh=b6w9augMLPsLNh/LhQPxos8yZHi0gFrreJXIMasULec=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qHqwr1KkKWe6U8l7YY+IdiaL7GUibYxhkZu0Fey6zW4ZLInnzZ9WORVr/kwK4MeTzvDRs3FuFD215v+QOrM1gUjUgDUP0IIg03WajZY2DslKG52iCrhlQPQv7FmuxZIbpBSu/xIWdBS9Qn3FUJDz2uWcO0X2xNMO6tA2tW8/Pi8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SkbQ9931; arc=pass smtp.client-ip=209.85.208.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SkbQ9931"
Received: by mail-lj1-f193.google.com with SMTP id 38308e7fff4ca-393c93a01abso2870961fa.1
        for <linux-staging@lists.linux.dev>; Wed, 06 May 2026 21:06:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778126781; cv=none;
        d=google.com; s=arc-20240605;
        b=IrL18Nt/JNHK+w16jYc7L/0cUgBP4sX1FJ8rvZUUUr+A4iHrRDnx5Ne2tXMO6kPfEj
         uFybsfg64In0G+TXyDpMUV9TYSs/0AewaLAOUs4IXDi2IDULRWgof5K1JXxK0ZmPWsyV
         v3UhvMvtLK706rO/rvtG3Kn0krf26Si2kk2Gve1KuihQ/AJ23Tgk7riC61AQSMwztOvt
         vWYuzvo5wLJQeSoGpZe1cSAiJV45eBUg7ODl+Zfcb6+W3YQvJ0sPQQFoPnp3GtBW2cKY
         CC3rUHCB6THtIriulCChSWrIyYlvneeBqOFIDHL8PfPPi+HwIy9IfL6G1DeT5vCwOrzh
         W61g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Pga7PntbRCIrqIHJItT0gD5OU8oLLFDpVBORILI2ipc=;
        fh=pK/UnP5xuwvFtINNDadLUFLDagP0bOlVfmMjp9THwWo=;
        b=fnXAWfQALZjuPeQgeA3B0y/UvBVGEG17qWFu/Z/c7J8PNBFTmLffrieFhmlnb925Yv
         AwDqjIMy39VOVtrHR88sOil0hVIDn7w1NuKHDCs2TmV7RqPgkBydWxYVbgcqq8xXw4G5
         wc51E7uXhVggu6ma6AWG9h8QJ4OxEdW/zEW11Z3htNRAHtqi2fLu16jNc/TpgW4rwall
         QwbQAVPlE9a0Hl6VY6flfnNPYJlael0S0KOU0XdBT4XvvySwfaZQyLWrxxpaTcxSALa/
         kTVuPB6FrODGUeoxmb7187GshMZBOXu0FHnLfAYSFiKd4ScjpxIroeImyyAc7xOPdEFm
         ufZw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778126781; x=1778731581; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pga7PntbRCIrqIHJItT0gD5OU8oLLFDpVBORILI2ipc=;
        b=SkbQ9931W6Jv7BfATiEiZvvVRArOspt9okz9+XGMfS08mw5LO8KbqB/WyKAlrB+G5S
         KcS8vPTH/4PzFBNk+D5vN0TJuwXszl/7V5WWcgEHJRjIO5dGiGlfZPh6hYF0dLkyQb69
         t9haeaXp0xF7M23xlhgouRL9BTx3X2KixCY53OiuAxl2qVXhOdA+FPA6H/Fae9/nAv9k
         ZRnfde0L+7D0PzL1KAn4Ju3tOTxYzpnbJY3PYHFb4aWwsnemevrnen0co7KS37PmmCdi
         SNBtZ8LZ0KGdADKlAAydHntBK1Znq77cWRlTnGyiFkZ2/9cTNct1Kk2nBOqTUtriEuPH
         MYoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778126781; x=1778731581;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Pga7PntbRCIrqIHJItT0gD5OU8oLLFDpVBORILI2ipc=;
        b=Nv99yQCemNvgzqPlZokH/aXIxP+Eql5UXeJ26nqgPtVhTIC+GNCdAjcR3mkxlMFbji
         MpTXNomEq5aboEHPaumbg9GdGhWH3uz/bMIKMe9ye+YYH5vSyVYUYFmu9SbIoC+OIt8t
         7RGOUDxgoFxuM0GmOMm9gE8pMNogZNRl2nyuqMFvflpzVOZrMcoDZlTDeNWXwdug+lBW
         BCHAbfihO/+aQSYR4tKSxsyfeVbw3y8t3DsoU9ERfFAx8gJVmuDd/lMqMa9BszwdKCnm
         d44qYd/XhxpXuGRjSFpUj9ntSdM7CQCe7zcxMLBMmfRKC96hkkX+y0eQA2/E06glIl7H
         eQPg==
X-Forwarded-Encrypted: i=1; AFNElJ8HuJ7Ha5DqFW6dhG2tGKEryejephXiDUtL9sDq4R1kr0VI+wPzIrpUFrm1eiASY5EY4lv3592yqCf2O2+K@lists.linux.dev
X-Gm-Message-State: AOJu0YyTPZ/soaw13G8LbO1Hcw17JPshKkwIw0m5NDRu71OZs5Jq252L
	qeJHI3KslCvDeoXq+IKBOx3m3enr2wX7bM5RDEZk16N8M5udE2QwOZFzUewUptuhJ5bVeBl1Su3
	lU6VxupORImxLBDCs8KoyiJjF5jVGvvU=
X-Gm-Gg: AeBDieuPOi2Cn+u1vUl0+pnNnDJFxYCNyveTJo6xesVRBjoppOlacT34/4vZ45krT2m
	h1scCLqu89wScs14Mg/hVXhBPJ/MwJn4u6r9LxR95VkREQ8vaaFFLiqoJsfmwpEaKIb8YIBApY2
	gLoaJrJ8HWdO7wlG2XyNRqUKrchQZNOmcXJUpUOi8+zXN+eNnVT8FazyAbmfGaKPCQr7mfFEF/x
	6fzw4LKmSFiTicqUiezMQXwuva7ex/nlpjspBlz0IXbGsT9bxn3lau5Nk4U2n+++HN9otLHbs8A
	452ltGIM3U8p31HyqfCqcdfMvZEY+tuHdjUp6yERCcYSba4NBmSkxDbhzM1SHmA=
X-Received: by 2002:a05:6512:158e:b0:5a8:6c1c:6b07 with SMTP id
 2adb3069b0e04-5a887ceb616mr2202272e87.39.1778126780810; Wed, 06 May 2026
 21:06:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260507022213.29290-1-dennylin0707@gmail.com> <20260507022213.29290-2-dennylin0707@gmail.com>
In-Reply-To: <20260507022213.29290-2-dennylin0707@gmail.com>
From: Denny Lin <dennylin0707@gmail.com>
Date: Wed, 6 May 2026 21:06:09 -0700
X-Gm-Features: AVHnY4LXvZPpRwU04mfq25RExhckQg69jZwE6I3BvL2PBM_X4_gLx3vbBpb4Hmk
Message-ID: <CAGEkeHc2MiJenQnyHa8wwYxpZfaBwZpy3=iXJCjAjvXrs9UsiQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/1] media: tegra-video: vi: fix invalid u32 return
 value in format lookup
To: mchehab@kernel.org, gregkh@linuxfoundation.org, luca.ceresoli@bootlin.com
Cc: thierry.reding@kernel.org, jonathanh@nvidia.com, skomatineni@nvidia.com, 
	digetx@gmail.com, hverkuil+cisco@kernel.org, dan.carpenter@linaro.org, 
	linux-media@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

The media CI reports a missing Signed-off-by from Ricardo Ribalda,
but this patch was submitted directly by me and has not been handled
by any committer yet.

I believe this is a false positive.

Could you please confirm?

Thanks,
Hungyu

On Wed, May 6, 2026 at 7:22=E2=80=AFPM Hungyu Lin <dennylin0707@gmail.com> =
wrote:
>
> tegra_get_format_fourcc_by_idx() returns a u32 but uses -EINVAL to
> signal an out-of-bounds index. This results in a large unsigned
> value being returned, which may be interpreted as a valid fourcc.
>
> Returning 0 is not a valid fourcc either. This condition should
> never happen, so use WARN_ON_ONCE() to catch unexpected out-of-bounds
> access and return a valid fallback format instead.
>
> Suggested-by: Hans Verkuil <hverkuil+cisco@kernel.org>
> Fixes: 3d8a97eabef0 ("media: tegra-video: Add Tegra210 Video input driver=
")
> Cc: stable@vger.kernel.org
> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
> ---
>  drivers/staging/media/tegra-video/vi.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/med=
ia/tegra-video/vi.c
> index f14cdc7b5211..456134a9e8cf 100644
> --- a/drivers/staging/media/tegra-video/vi.c
> +++ b/drivers/staging/media/tegra-video/vi.c
> @@ -80,8 +80,8 @@ static int tegra_get_format_idx_by_code(struct tegra_vi=
 *vi,
>  static u32 tegra_get_format_fourcc_by_idx(struct tegra_vi *vi,
>                                           unsigned int index)
>  {
> -       if (index >=3D vi->soc->nformats)
> -               return -EINVAL;
> +       if (WARN_ON_ONCE(index >=3D vi->soc->nformats))
> +               return vi->soc->video_formats[0].fourcc;
>
>         return vi->soc->video_formats[index].fourcc;
>  }
> --
> 2.34.1
>
