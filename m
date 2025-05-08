Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AB127262F
	for <linux-staging@lists.linux.dev>; Thu,  8 May 2025 08:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746693452; cv=none; b=nPC/YjgWjKzi8gZ41Q2gu/C3R+Xs0TA82IwVkw9e/ibF2l4Ob5Zc7KrNHWWJ7NLx6pTbAdy4bIualcFXtTwMwWpQGQQrhVI8v1NesTaR1G+nEAOdDLAPF/sVYdLZ3V1zUi9j48Lns0cvZbpc8KPGGLK9zsJ8vs3sX1ZeUHjjG08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746693452; c=relaxed/simple;
	bh=7dQP+Jvf9t5LMLKit8Xc4iV14+1km9Y870bkbSTRI4U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Zy3rSza/vlpslQ+AdadWcKE9pfPLbBtQyC2h3N7pVSFkr9Dm4vy2OtUq04lcf+5g1Ctuz2tk1h/lBbuyiniQ0pchiviU8C6A7bLr19mBpvF0b+8s2f6byB11tJ402WrpfPhmrOxTxEenMht7s5fn9afTjf8LEw8SYveH2vWKeSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cTtREKAS; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cTtREKAS"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ac7bd86f637so362937966b.1
        for <linux-staging@lists.linux.dev>; Thu, 08 May 2025 01:37:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746693449; x=1747298249; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7dQP+Jvf9t5LMLKit8Xc4iV14+1km9Y870bkbSTRI4U=;
        b=cTtREKASJjc8Er+lIfUkc4jLM0gjg65spyGOvhBe2ZvsDiYo6PdTlMrkYBH5L5+CRn
         eiOporGTwIobqdZTUGtDbEm+a6D1i64q4LCkBV0DwjsQGyCXiGNwNLpETTg1mM9fk9TB
         FC/6rjq+Ch/SrF9utO3UarVYkC1yUmEQfry+KHqFuKHWN9Oavpt9y9Za+m6iJwWon/oj
         /k2hfC1P5fWvT1A6J63wJeyVTL06im4I8X/5ecQpYTUoZpMBjCzKUmPlXWII2aA9dgBm
         mV8kYKqCwFdOG/jIyqeovBtdaCqrClFfMzQ5uPRWDne1XfhrHoSlecK8P7/54oCbKF6N
         lcYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746693449; x=1747298249;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7dQP+Jvf9t5LMLKit8Xc4iV14+1km9Y870bkbSTRI4U=;
        b=tl1hrbfR861JrXnF51WOuQEdLN2vBUUqc+afgIvy+vR0lOH5V+43QuRqkb6xGqHEGB
         KCc9v67efQmyY7euzXHR5qRqvWR1G2J61GbLvU329l+QV+TT9behibhMfsv/w029roA/
         2c7m5H5slv+l51yAMb/r77tLC12Zm6RH4wm/FeK89TFi12SVPmwDUCEnu9BdHFxdVGxo
         RKHLeLKPQs7FBZpKR2QtAP1nIq4gYp4dXKdwTRtw7pS9rPST13Zq1RuY8VZSGDpHdzPk
         JZ7aTNxqnfRMtIceiuyIgCAUo7BWW00nZUhkaoRJt9fb2LlYE/aS6vjLJi2dB1IzvlXa
         HeUA==
X-Forwarded-Encrypted: i=1; AJvYcCU498v0GYgL4pclPMfBf4HwK15hb3m0fQydXuiy8JZhhpL8/PEqMTOhhorLml7Js6kVU1fL0avSEGbAXwit@lists.linux.dev
X-Gm-Message-State: AOJu0Yxsso/ve43SAlHjd7IPT75SonhNWyAx37uUq5DaHteKoR/IuYBU
	9pBzvPobELMT45o5FttIE01/Af37pLlgm7kjivdyyLYxLe/xyUJoFCdYB4+4xsLbtkvf9YArFDK
	PirqQTLvSLHgqJCRuAGjM4t7Cu4M=
X-Gm-Gg: ASbGnctCaRhJSx6yH2TDvFmWGuhJknBmyC+5ys1DDk2wXOUyQkoKcCMRtzw9Rsq3wlb
	MpOmJYrHa53wTlsFclhB/ZRv0W9+O0C+bR6CnzkOqf91QcDNf9/QEg6owjWOUhIYbMk00Hh/n71
	DZJrsp7uecPxCoESP3IsBt/w==
X-Google-Smtp-Source: AGHT+IHp1CSHIpHxDY8gNgAOG/Ce7goUUDIKVoWAEswBpVlH0Z6TBbCa2vI02a48zmGb7MnI8O6qDy+SXjJoJjNpM2w=
X-Received: by 2002:a17:907:a4c3:b0:acb:aa43:e82d with SMTP id
 a640c23a62f3a-ad1fcb581e8mr297604366b.3.1746693448604; Thu, 08 May 2025
 01:37:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250507184737.154747-1-hdegoede@redhat.com>
In-Reply-To: <20250507184737.154747-1-hdegoede@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 8 May 2025 11:36:51 +0300
X-Gm-Features: ATxdqUEcbG6dK6948mLkuyvGtqVmoKxzr2JJzZa-z3S-SBMUTLf0FVaZwT3s1Es
Message-ID: <CAHp75Vcb-fcQHWqVDh=KUwhwvSP6KqUN8FsAMvDuwF2iD7=J1A@mail.gmail.com>
Subject: Re: [PATCH 0/6] platform/x86: int3472: Allow re-using sensor GPIO
 mapping in atomisp
To: Hans de Goede <hdegoede@redhat.com>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	platform-driver-x86@vger.kernel.org, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 7, 2025 at 9:52=E2=80=AFPM Hans de Goede <hdegoede@redhat.com> =
wrote:

> This patch series does some small refactoring of the int3472 code to allo=
w
> re-using the sensor GPIO mapping code in the atomisp driver and then the
> final patch in the series moves the atomisp driver over.
>
> About merging this, maybe the int3472 patches can be merged in time for
> the 6.16 merge window and then the atomisp patch can be merged after
> 6.16-rc1 is released, otherwise an immutable pdx86 branch with the first
> 5 patches will be necessary.

Overall I'm pretty much liking this series, but one comment against
the last patch (see there) and one question here. Can you isolate GPIO
mapping code in a separate file, please? This will help to generalise
this code outside of two mentioned drivers (I might need it in the
future for something else, not related to cameras at all).

--=20
With Best Regards,
Andy Shevchenko
