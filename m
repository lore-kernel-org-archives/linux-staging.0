Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FE0734753B
	for <linux-staging@lists.linux.dev>; Wed, 11 Mar 2026 05:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773207786; cv=pass; b=bY+JelhEXNSSGClYjDcAMuf656Kh/DKEdljYf1lFoZeYLbBwXtDXAdKFsBq1Pjb4wEABehguwctA4kjsh4quqa2SDbvfBHoenS09npuRbYzZk4CMehjl2DcKd2skhR1FSnW9eNYjhgvrWjc3a6U2dKdENCi/th8D17P/4nN5P1U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773207786; c=relaxed/simple;
	bh=j7GPyZUOKWPd6Eb1FHA6D0wCDgNjFxXANFaMP57pH6Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ie2eMW42afcE3a+uhsdkpCG5m8tZDT34jgWr5F5N3kI+jOCLKAS9rDBz5L4ERSaK/Kb/LLLWvRlQtXPSAIoUeiJrDwZX6Q7SaAYUK/vSsDcNOSSdetNcCFSLgUn/R3OsHKx2glnEqlAhwigJeSn12ZNiQbLmssD8hqKfoJOsqfk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yoq56VuW; arc=pass smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yoq56VuW"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-c73a5473bbdso1428567a12.2
        for <linux-staging@lists.linux.dev>; Tue, 10 Mar 2026 22:43:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773207780; cv=none;
        d=google.com; s=arc-20240605;
        b=IcRUx3zLzPNytFViqnZXt+7S4c0/kKdMVUofxcJ6RVNyc6sM2dA6sTb5ZmrvChXMzR
         Gg25UOyTaME64IRtTaXzUoshlY8CUqFYDIvVi37LfkTqdXwrRHNOXrf5kEd3Mb5rpao/
         X5cgiZZURhSSoiFJCQHWZK2P+AG8pzFT3K7SPdWdS5goaMyT1d+eGDirpi9sCC0XF+S8
         JkaXmnf4mUSs/MeyP6evHrjk6QwnAC6aDeOnd9cdBuJppw/yMkSTvcoUdR6JWVzLWin1
         H46EzyhbIB9dk5W2wmRLnSXyWfOhsDJzmthZUXRQQCtYcpsqd33NkbONfIPWYj9nIdaN
         2o8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HsZ0aj30QzrWxLy9ik/IeJVQ3KkElzxj0uQiMmN5kNQ=;
        fh=rs+4S8YHdfn1zbjTpGXzIYE7v+KizWczLfk9B1V2EY0=;
        b=QjJ87lKLf4FqYPtqmRXHLZxGBGuI5pdpdNuMrJNg6ZPFjctht0tJMFwIH7//8r6qQz
         Woz7qTVixk9Ay5Ti8aUrJ3COkr44jS3Jb+ps4Yj/h/zObFzWEV+pOnhp5gdjv3pw8xs2
         ffh1bybcE8d2WjZoFtAGIdGRcKtfTav1mwioAxMTCYYXMop6I8k1+PsjpDBuXH0gBxWb
         iXoAtQRBywcYw7QmPWsQnCBrB9IIoA8Iodg89hgf0DoKNaRemblcMExLxyltk6EpVzkl
         DdaGqb5XY3DpAIIS59tuz7IKkx20M1e0ykbKaya+VN3yrb7wHqmJkObShMTkf3lTN9YR
         w/eA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773207780; x=1773812580; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HsZ0aj30QzrWxLy9ik/IeJVQ3KkElzxj0uQiMmN5kNQ=;
        b=Yoq56VuWQTgEIDp0/s3fuqJ6c7dcCJqJdTY5++wmHRSL72GQroHiFZSZ3QzFWbAYmR
         hKcBArz41zojVw/9TmL6EAI1HGqWBTFbi92YahilvaqqEN70SwglxQuzIDnRMKWAN5Pb
         APi2lgyCjU1mwBhGyYNoit2PEC8eEIhp0IgtkIBFLNFFKqkuovl/6te3zhTBudE4Gr1/
         wbPD4MsKGUgf89b7+s/cEdawRfZYFPLCTYhf4HafiTRNqMmaxzVW0dK+YY/SKPZtInSI
         2W0k5SJt2qp935ml1HBMaL2xpDM8V2QbBtijcVlnhdbhrIc87+abLH1uS65gM3xd0c5F
         mkHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773207780; x=1773812580;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HsZ0aj30QzrWxLy9ik/IeJVQ3KkElzxj0uQiMmN5kNQ=;
        b=C8v6h2+0rdlQMy7/wjBSNgirR+NFTfx8iErQYjaF4vINAdt5Mx8nrXvvfcXkmsyrAU
         GnqxvGaTBMUCnpLU7uFZG1KW2pFHz1EO+NxUF2NWeAIPvyx0X9lw1rob1LSqNqBtPIVE
         NKSQ2ejmMDmsPEyuGi/cP7BdHNl/SBz+Zxmd7qssK8YyF23K5gwRmnKbWrCpJGh8e4GK
         9Q1hSGrsa0VeBZesBDJYN239BZ2GHVJc3xEptpTRcEJC24UcMOzb1g11EF7ZAmgCJudF
         ttQqaSZRGU3Xj4klVYc9+3MUc7gDl99sLwL70Bg6+iE9rDRiJk5RvT/94IfMGHa49EoQ
         QRog==
X-Forwarded-Encrypted: i=1; AJvYcCWaRXS5TuIusjlXhM0JC7KHKqmvJsZCDKeGyh/kxmaZ4m6wnclHCagdcs86qMkCAb9NTZm/xVNs/9x0qoYB@lists.linux.dev
X-Gm-Message-State: AOJu0YzvYeeCEqbMH3o6h3CYWo0/hcbyAlr+PXLfo3ZG0BO/93QDOCc5
	0iA+/wEGjFECtSzMvGhdQTikrx/7Xao0Aa6z7BFP2rNVa8C2WoUil4agwcWQqMVJMVE+nt7LuvI
	jDkilNPP8CC/WQVg+3sVAq7zWge7ROw==
X-Gm-Gg: ATEYQzybpXjWTWfU3Th4eS4T623DvdPqAdhLq+/iVVTMgWXdNZF57kF+iL6aqwOu6A/
	pm69eYNOjjuvbtEySRqbFvmk3i/XGu+Il6h8o9arK5aQgnFt30lXATeOnoGiX6Kgmk6KEAAWWzy
	OTEgNH64IDcaQamLbBi0JuAPEZPUHl018sgwqWDPZvJdV+FwBy91+F9xwV1RqO9q4XIkH+Oftdh
	1TQG0aGJhDeJpo5NY60jpmhu44VYZuMCpHeVvSTyf+1Zxm1T4EdIlxnaERyF2IR2VAlWN2isdvB
	09s9YfVYwYlusF2SW48R09b3AmtXoJ9ZUI9sfliJcA3AEqACeLu7pfprUi/5qnHtakYf
X-Received: by 2002:a05:6a21:458f:b0:398:791a:9caa with SMTP id
 adf61e73a8af0-398c5ec806amr1236794637.18.1773207780121; Tue, 10 Mar 2026
 22:43:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260310200513.2162018-1-sanjayembedded@gmail.com>
In-Reply-To: <20260310200513.2162018-1-sanjayembedded@gmail.com>
From: Luka Gejak <lukagejak5@gmail.com>
Date: Wed, 11 Mar 2026 06:42:48 +0100
X-Gm-Features: AaiRm53yOPVigtTBWqUrHQSRYbaimfIQ_tKWwOGhPWuEPWqnKrEs0Ob5KWiVmFM
Message-ID: <CADRnA90=F5rRtWWJtSg7mA_QLzQa5Fzh3s2RzXDJtOOTiitzrQ@mail.gmail.com>
Subject: Re: [PATCH 0/7] drivers: Simplify cleanup paths using __free
To: Sanjay Chitroda <sanjayembeddedse@gmail.com>
Cc: jic23@kernel.org, m.tretter@pengutronix.de, mchehab@kernel.org, 
	p.zabel@pengutronix.de, tiffany.lin@mediatek.com, andrew-ct.chen@mediatek.com, 
	yunfei.dong@mediatek.com, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, johan@kernel.org, elder@kernel.org, 
	gregkh@linuxfoundation.org, pure.logic@nexus-software.ie, 
	dlechner@baylibre.com, nuno.sa@analog.com, andy@kernel.org, 
	kernel@pengutronix.de, kees@kernel.org, nabijaczleweli@nabijaczleweli.xyz, 
	marcelo.schmitt1@gmail.com, maudspierings@gocontroll.com, 
	hverkuil+cisco@kernel.org, ribalda@chromium.org, straube.linux@gmail.com, 
	dan.carpenter@linaro.org, ethantidmore06@gmail.com, 
	samasth.norway.ananda@oracle.com, karanja99erick@gmail.com, 
	s9430939@naver.com, tglx@kernel.org, mingo@kernel.org, 
	sun.jian.kdev@gmail.com, weibu@redadmin.org, linux-iio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, 
	skhan@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Sanjay,
Would you mind explaining why you put so many people into TO and CC
fields when sending patch series. You should stick to maintainers and
reviewers from maintainers file as others can still see it on the
mailing list(that's why you CC kernel mailing.list related emails).
Sincerely Luka Gejak
P.S. If you are including me in further discussions or patch series
please use luka.gejak@linux.dev instead of lukagejak5@gmail.com.
Thanks in advance.

On Tue, Mar 10, 2026 at 9:05=E2=80=AFPM Sanjay Chitroda
<sanjayembeddedse@gmail.com> wrote:
>
> From: Sanjay Chitroda <sanjayembeddedse@gmail.com>
>
> Hi all,
>
> This patch series replaces manual cleanup and explicit kfree() calls with
> the __free attribute from <linux/cleanup.h>. This modernizes the memory
> management style and simplifies common error paths without altering any
> functional behavior.
>
> The __free attribute provides automatic scope-based cleanup, making
> resource management clearer and reducing the chances of missing cleanup
> on early returns.
>
> No functional changes are intended in this series.
>
> Testing:
>   - Compiled with W=3D1
>   - Build-tested on i86_64
>
> Based on:
>   <linux-v7.0-rc2>
>
> Feel free to share your valuable input in context of the cleanup API.
>
> Thanks,
> Sanjay Chitroda
>
> Sanjay Chitroda (7):
>   staging: greybus: simplify cleanup using __free
>   iio: ssp_sensors: simplify cleanup using __free
>   iio: st_sensors: simplify cleanup using __free
>   media: mediatek: vcodec: simplify cleanup using __free
>   media: chips-media: coda: simplify cleanup using __free
>   media: allegro: simplify cleanup using __free
>   staging: rtl8723bs: simplify cleanup using __free
>
>  drivers/iio/common/ssp_sensors/ssp_spi.c      |  9 +-
>  .../iio/common/st_sensors/st_sensors_core.c   |  7 +-
>  .../media/platform/allegro-dvt/allegro-core.c | 95 +++++--------------
>  .../platform/chips-media/coda/coda-bit.c      |  4 +-
>  .../platform/chips-media/coda/coda-jpeg.c     | 39 ++++----
>  .../mediatek/vcodec/common/mtk_vcodec_dbgfs.c |  3 +-
>  drivers/staging/greybus/camera.c              | 27 ++----
>  drivers/staging/greybus/loopback.c            | 35 +++-----
>  drivers/staging/greybus/raw.c                 |  6 +-
>  .../staging/rtl8723bs/hal/rtl8723b_hal_init.c | 13 +--
>  drivers/staging/rtl8723bs/hal/sdio_ops.c      | 37 ++------
>  11 files changed, 78 insertions(+), 197 deletions(-)
>
> --
> 2.34.1
>
