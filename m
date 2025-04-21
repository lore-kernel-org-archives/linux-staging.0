Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A713586337;
	Mon, 21 Apr 2025 13:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745243814; cv=none; b=hUs6aSJYtHZAECoRpMEgKDU15i9+L0Lcjm/C3zBONUPZHJemFR1RSdjV3HUBM86F4p5Kzr+LtOKtWulHZmkBBqzH385NHGMX8cpJHlFLGzTWVyhqMe83Sf1IFNFcHNnBht2Co1np55MLnhlQJhV68Q+2yrx7UeylfAnFERROzJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745243814; c=relaxed/simple;
	bh=7G952GCUAgQVq0vHrcyEXSe0jtpjyYe3cHfs5H9tRi8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aCHcMweoohxK/RQVI6vg0jeHFmBPzec8Yra+z2f5KqkKFLapqs1IFxqTjPXd5HQeLSxPTKfSrGugusb1pb/zOW0XoeLXaO6kdEcvmlk1OWHQKo597UGl+tSu8iSSZiFVhyugKv3zVxN9NVOF3Mc9E+RcM1WEY5cPi+f9vw9jnXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cgsMlI/o; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cgsMlI/o"
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-7c08f9d0ef3so192149085a.2;
        Mon, 21 Apr 2025 06:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745243811; x=1745848611; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U50DhOW5tvqG4LqE1ZhO21eZnqHSraou5vt7RRanSeU=;
        b=cgsMlI/oqGvqVU/H9IBwRR2IX7aK6sJ8tGd1bEvmef/xAW8fDeijhVIxUgTQZaWSG1
         3/xW8mUKj969caSvhclWVbFdituKW/FpHpvgtyot1DCMdecQrKfLBAluhEVH9b1vU3fZ
         hlM4q+A3he0zP+Qrpa1i/cLP7AsmdmNgZKSEpOFAuGMtE2eliWwekNACSQtfnJ1yQLq4
         sJTUN2gmhnSKhGdSk7HZvrQK1Hd4JR+oz2Z9wzomLsbGThypDh25oag60uADKdbgcc2T
         yjP0fvEKRFNFFnkZzs9Gywjx2Zh3vpsL3HWnDzDML2Qpm/9fgkdpApTYX14lCgYmzW2r
         fQTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745243811; x=1745848611;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U50DhOW5tvqG4LqE1ZhO21eZnqHSraou5vt7RRanSeU=;
        b=MG57kIsuzWExKh3aL4o3GspwCnAWC8CLJMgpxyd59EKcHLK4/9kgVnpzUvQuXmDiAc
         YgM+YmNTmUo24m0TzUbz/V5d83//XzHC4a1ss7L80eEQIZahpir56PSy3u4FOTZRrrrj
         fTANbcUw/yYxBTfM4SvLaV8vrvFrMsCJh1RMkMB2pMDmJbpBKq4bZ+weBI/XPIXsY1WW
         zKfE8QXX3AW/xaH0AqcQy4SH8gMB5qAmBnlkfBKH/2iPP7LwOFwnYg45Bfs/gU9lmV5L
         H+QaqYFmLlANiEtNPI5o2ztemrHvC8liMDywypFYthDWE6hemVSLcZ4hqQuLBpMmuB0v
         emNQ==
X-Forwarded-Encrypted: i=1; AJvYcCWt6XWxjCtAj9zhdECwyevcEiqXlTNpLOQ81SnR6r440u1ngAiRGfEjcVDgOX1mzHp550unu1iIggPn7/qVWpU909ON5Q==@lists.linux.dev, AJvYcCX0wJN7PYo47UtaUXKmj3Dtiy5EmIJX7TNRSLZWmljg6+5yfI/D3PeTOMkCNwQDeTR/tOpn5zO5OP2fQAF4/A==@lists.linux.dev
X-Gm-Message-State: AOJu0YytyfZxD1FhcX5/wLqmSbqHT/DmYEROvYE1sMKz4h/b4sQHfu3Q
	WoWV6U1sKF+OTGk+6dxdsbKZNLWcQsx352DOKrCRSNrGZptG/xT0DobZAntgj/cx37VzV/PcKHN
	nUfs3r9g9fFQIjYL57h1kIBFGOhE=
X-Gm-Gg: ASbGnctO1KuRfgdtd7cngXCw2rO4mhufk32vu7VO7AXQ2h0CW+6Tx4/KkjpYkKGtDZx
	lzrIribRxfkukRl5Izep1cewbMyQomHMRHM+h8cS6J2Sthu/jRLnzet/lK6TBjyT8Zt4htT+U8m
	ZqiobjEk0hFO7vBBATu9Oubn/uct4WyNi175U5ES7E3eUHy32uouaGHQ==
X-Google-Smtp-Source: AGHT+IFwPfdkoy6EEJ8mTuzbNgnOACCZf4/Uyv3+B3FbTRzHLK/2P/3awjMDcxErAWDSHIh3e4LjnEgs1WpxoLtiYfY=
X-Received: by 2002:a05:620a:2409:b0:7c5:b909:fde1 with SMTP id
 af79cd13be357-7c927f9dd6fmr1930284085a.25.1745243811525; Mon, 21 Apr 2025
 06:56:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250420175419.889544-1-gshahrouzi@gmail.com> <20250421123331.634076d5@jic23-huawei>
In-Reply-To: <20250421123331.634076d5@jic23-huawei>
From: Gabriel Shahrouzi <gshahrouzi@gmail.com>
Date: Mon, 21 Apr 2025 09:56:40 -0400
X-Gm-Features: ATxdqUEiUsxoWmmaJ2xyXvjpRnVfAONnlaUDxmAq11sV0agws9ETpfjcyGC5AFA
Message-ID: <CAKUZ0zJ9LkkeWsFQEvAdNw4qYOeX2p=J5PKEoc3Kh9LmCAa4Jg@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] Fix and refactor output disable logic
To: Jonathan Cameron <jic23@kernel.org>
Cc: gregkh@linuxfoundation.org, lars@metafoo.de, linux-iio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, 
	Michael.Hennerich@analog.com, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 21, 2025 at 7:33=E2=80=AFAM Jonathan Cameron <jic23@kernel.org>=
 wrote:
>
> On Sun, 20 Apr 2025 13:54:16 -0400
> Gabriel Shahrouzi <gshahrouzi@gmail.com> wrote:
>
> > Patch 1 includes the initial fix.
> >
> > Patch 2 refactors the code to use the out_altvoltage_powerdown ABI.
> >
> > Patch 3 adds small improvements by minimizing the size of types and
> > doing a redundancy check.
> >
> > Not sure whether to include a read function for powerdown as well since
> > all the other attributes only had write permissions. I can also do this
> > for the other attributes to help modernize the driver.
> >
> > Changes in v3:
> >       - Include version log in cover letter.
> Just post it in reply to that v2!
Got it.
>
> Note though that this needs a rebase as I mentioned in the thread wrt to
> the original fix. I'll take a quick look though to see if I can spot
> anything else for v4.
Got it.
>
> > Changes in v2:
> >       - Refactor and make small improvements ontop of the initial fix.
> >
> > Gabriel Shahrouzi (3):
> >   iio: frequency: Use SLEEP bit instead of RESET to disable output
> >   staging: iio: ad9832: Refactor powerdown control
> >   staging: iio: ad9832: Add minor improvements to ad9832_write_powerdow=
n
> >
> >  drivers/staging/iio/frequency/ad9832.c | 50 ++++++++++++++++++--------
> >  1 file changed, 36 insertions(+), 14 deletions(-)
> >
>
