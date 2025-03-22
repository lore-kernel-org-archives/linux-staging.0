Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0928A77102;
	Sat, 22 Mar 2025 14:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742655301; cv=none; b=iNIimmU+BVQMU4DV2vd4DMpq8YeWVqo4TG+nPNUltkMD17PLLNc3JsyzJH7ZWglBjOwGjLXABSZ4pSwaYAjTcndJH1CMkfsVSiEFAGcJjdZaabzj8Bs70sncO5kgub2bXQV/t1CeM1j1GuQ27CBaeosRWm+9bMLL0ZfNWPQNbwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742655301; c=relaxed/simple;
	bh=BwrWfrlKH9V5dEXgKEnM79/SUo4/kUvCZIBuFhDDsQM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IWhB2CDGHmYk0VGx6VgDOR3RPIbymA/3+tn04CihRmON/AlQRr68L3s/9/UbrUNhmlSxeP5RFle8Ai9d934L1C/xTPUL8XlfTKZEh0PfrK/X0P6dKuWQ7tlEIrPk3SUsmXOE7DMrnGa8X1dEXkNXC8K74v+zzdgFBYYsTyGTmqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T9rvsVXR; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T9rvsVXR"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43cf680d351so24055415e9.0;
        Sat, 22 Mar 2025 07:54:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742655298; x=1743260098; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CVsv+7+7z707eTgNMAV7D+lcTv5OJ3d2IoxGrmJvKw0=;
        b=T9rvsVXRKyrMcTkmDY5YrwjMp4wA1rrAcEjNVUkuKQQ3QKjY8RPpS/ufHIvMHZSv6v
         T6xH5nsUHAOBlPqM1XbHu3u92T3hOBihSH54AKhBLzAX9cG5E7hSoC2lS2tLUFGAdiIL
         5pzLZZ/r2NArrPeSHJTEd31WLdoMf2uo3TEiWQ1drgDgtx/mUc5jd/8/J6tCzYGA22LG
         bAngO2y3FiIX/ZMJxNS1+0B+WOdq4+LOn0Mgez3amGOmgFlG4ljre9Iy1XxUvHO1U/A7
         ClwNVcdHXqataXDdbiUcL1S8wEITaIKAqwutaqSs1VQSipG7KDJuZe1ZZ0Yf2+6V1Ocd
         mvIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742655298; x=1743260098;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CVsv+7+7z707eTgNMAV7D+lcTv5OJ3d2IoxGrmJvKw0=;
        b=onuoyQ1YgP0o/iWTZ95cRiniBhbR0Phhy2YVVEUprKkjF8HhJ6Haqa2tK6AsH1D7Gv
         7HnskYU8eSQGDXcuuXbFMPBTBVbQT2nxJcCJbew4ZylXbxRLTKgQx2x0W8eDV1Wj0y7X
         QANF/DYTCoyFzaJtLDGhcer6ug4SAOPXyZp91jxk2mqwMuxuCu0Mdjdyz55mf5knOhAj
         wQ1gGlc+hZNaoXJSOiab/peEKaORwCFPpesHowPQR+/8W4gxA+aKPesdl8gQJLe3BahS
         w5pMvtdXZ65NVmOgQxjVOeL06/MCDb4uNqwynRMuCtzh9sHbsOjELpOHsMG9dprYy6im
         r5kg==
X-Forwarded-Encrypted: i=1; AJvYcCUuYUO8eRd7RmtqX9WkP5/j9vGN0iXLIL+azQEz1+SO3y6SA3Ce6q0/ZwxOG7qqOfXJvpxKkhbmVG/o0GLB@lists.linux.dev
X-Gm-Message-State: AOJu0YwmfrM1udxGHee6TmxxMsUD2edTnf93RJR6R6BDCs66q3rkAieA
	HsMlQdq3ieXqoOALUOCOiuTjsL4+EYy0CZCTX6hoMvucX00Z/laWCUEBXmPEOfdkxV6yVvc1JhF
	l4iS7NhP0jxyBH0oY9QQQWNOGnK8=
X-Gm-Gg: ASbGncspUTYe2uP2mk/3YQJ2DE4us3U6st6B7GGe2GTz3ZtUXXKXB+Se/REnjm9rDVs
	2xr895LH3wlSR9n6U0D8mXS0skuS8eiAuruHJoayEZn8KhnlzhCeMlUuJKXUOu2pL3PgiJOsu89
	yIPzHp3PcZ3aJq03YYLSkF4ClRQtqSJNm0oPbvLX4=
X-Google-Smtp-Source: AGHT+IHOTXz6vU2UJzXZ1h1hF0qjSMg+BhN4y1f0FSW0ekLWWxEwX3enrSuwJUq000bqT2KVcv8R9mh2dJxA71DufVg=
X-Received: by 2002:a05:600c:ac6:b0:439:91c7:895a with SMTP id
 5b1f17b1804b1-43d49172281mr97741715e9.7.1742655298050; Sat, 22 Mar 2025
 07:54:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <Z97Bl9RyFRGZUXNM@HP-650> <alpine.DEB.2.22.394.2503221510230.12345@hadrien>
In-Reply-To: <alpine.DEB.2.22.394.2503221510230.12345@hadrien>
From: Samuel Abraham <abrahamadekunle50@gmail.com>
Date: Sat, 22 Mar 2025 15:54:46 +0100
X-Gm-Features: AQ5f1JqAXalsgn30MCSXP4SELVQNOiGgBWkb-rypE_PW3Skgrm8Qwl5TBxRuuKM
Message-ID: <CADYq+fboc+_cncOdrBh-2sDNSz9YAFvTqREmV+mmKOHy5QV5gA@mail.gmail.com>
Subject: Re: [PATCH] staging: bcm2835-camera: Modify function call formatting
To: Julia Lawall <julia.lawall@inria.fr>
Cc: outreachy@lists.linux.dev, gregkh@linuxfoundation.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 22, 2025 at 3:11=E2=80=AFPM Julia Lawall <julia.lawall@inria.fr=
> wrote:
>
>
>
> On Sat, 22 Mar 2025, Abraham Samuel Adekunle wrote:
>
> > The line is a function call which ends with an opening parenthesis
> > thereby not adhering to the Linux kernel coding style.
> >
> > Modify the function call to include parameters on the same line as
> > the opening parenthesis to improve readability and consistency while
> > adhering to Linux coding styles.
> >
> > Reported by checkpatch:
> >
> > CHECK: Lines should not end with '('
>
> Please check the get_maintainer script (see tutorial).  It looks like
> there are some other people who should receive patches on this driver.
>
> julia
>
Thank you very much for your review.

Please just to be sure, do I include the emails of the people I
initially sent the patch to or
I should only send the patch again to the other people I did not
include initially?

Adekunle.
