Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0FF02D94B0
	for <linux-staging@lists.linux.dev>; Mon, 13 Apr 2026 07:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776063958; cv=pass; b=qOiKFYQ9NrpFvnDElYqV1n7ZzLUm+oUX2T8Mtfb/y/M/CSvjAtzC9BnD0uXxfqIj8EEJg5iCxGbewmVUahyqWR4Gmzc/+2PhaSI+1PCY33eN0yTfZPiLHrw7Emo2sM+3LFpxNFIRPJ1Y6fW9M/6Swvr8+fQTXWp1dZTE0doRQA4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776063958; c=relaxed/simple;
	bh=6NNewgyL8mNQKfHVhI7jr+URAuqSbxwpJSjB3JPRtLs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k3SVu+gn3KeTWl9MkwtNEo3EGSVJpCtZG/xWh+UtK3sEoU1NhE8tloex2NsPcEr/8EBznUvQ5bZAOvp5mKxxstYg8B9EnedS7i8nvs/7OHPIt2YYeuah5BLKGhaJc6SE1Fe/TV3xpglDlqBSfdyLxAxd/3ZAgzsFFadp+AGJuAs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FAik7RGu; arc=pass smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FAik7RGu"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-43d7605ec91so722638f8f.3
        for <linux-staging@lists.linux.dev>; Mon, 13 Apr 2026 00:05:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776063956; cv=none;
        d=google.com; s=arc-20240605;
        b=OzKplkASN38ZYksbBm5mu1Din5ZYqpRwaUPRrNtNehppdW6nvbGpUUubX2jQLdyHTB
         IsMdFSgpbVBjgBldsPN+qfBjGME4SuX5z3XswWKP9UpgFAVfuP18tE915fCFLfmLxwz5
         gm31uiYUMhZmeQmlBwID0Nwpd3DlPpJW3lqKjaHTFaMkB1Fo+3dBSFKzfiTgMlgGXgSf
         s5Lg+UoDUCkxgDhVjQaQx9d4ZEE4TKeNtEw5desTnK2tF+MopQeWpLbswC7u2a9l5f1i
         14BldOGe18gSy+s2hwjUmfqjA9fOKbfHYt4OR1TrSm4om8bSKywyQWsgYMlrxUcrTkYb
         uivw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZHI2UWp8+R2OAULr/9NO8p7Pt/rJO/LrNlqi21QyDfQ=;
        fh=TDlBGUMvjXHP5Rwh7wf0yYaTZ5iJ4vxRrYEuXtg9zmc=;
        b=gEj8c+Cf9Kwsux+Mo+n19VOlFMdCa3ysOXn3FXMuqc7IKCKdmsgE7xF2HjalCbM4ur
         JdvQJFNSg1c3X14yOTFJGSCPzBGiOq+Nr2oFq6lU4jP7RE90OmtikfWS8AiImUs0dnDQ
         9YNeEs9YDhRXdCSmgk83YE3QLyVGVZbnnQCMIUK5GnKIYmw24SkH9NEjWMU4rdeZCZ+8
         Foo2MsYvNXVLFDQ6mOxkyKKSGdlOP4Po1CrKO6ey7oP11Isz6Toc0ZawrTxNDccKGqmH
         g7xAOrznbdcY0zhfPk+fpAdEwfEgK6O7zmyie1Y6n6bXE2ZJ7eCBSvR9LLfM/xZPVMFR
         36QQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776063956; x=1776668756; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZHI2UWp8+R2OAULr/9NO8p7Pt/rJO/LrNlqi21QyDfQ=;
        b=FAik7RGugWdgVF8OlbfZFmwiShk/9KGhjvBLVQW/Nzgko7DqhCfaYQAwrf78wT71ul
         PFzeAMDqmflKYw0vLsuxYFqdjKdDA0zM6uwW0AqqnnT4BSqkkYJs3kK8+IbkDc4piuMA
         vYZEIRsznXMBQZzmxAyYg8qkMzaAvGSZpPr0GHxUsrNdk+kuO2bS4fVFfZ6q0dLzUBXV
         aanrnZwTkbvsYfb4JamdclQMTVL1yscGqaI6DHBtAugBNcuSw0khJE7k76i8Hrwq0Dam
         LeQ+06ouFoQM6fmsFLzg1K9wnjmNelurWdayaau46DgwaQLnjy621EVCA+Kg3xhP72Tb
         exRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776063956; x=1776668756;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZHI2UWp8+R2OAULr/9NO8p7Pt/rJO/LrNlqi21QyDfQ=;
        b=EMcpYUZPQzw1BoptFYDEPz1ieZO2P4tKj9sAqu7UjEXBc3pShc7YW44G/WkG5d+lFh
         8jG/Q0lnRnc9BRlNvt84oWlGQSb0NKLDC0U1HsmuHBeQowOdHYpmtBKryIOQvxTxLF6+
         36paWkqHLGnLvslzLo+MzgL+X4p5WMFXMXVy+y1ET6o9AUJHZTadryIaOJoVR+g26pPi
         Q7UmWz/hLSvysi1O3a+Ao9Dgk+CEj2UGAhjcctXHSSoO8qeHEsNhCgqYnLwgKxSAyO7a
         53ZNarQmWoy+MvqNyCliWUlUBkBhIWRPxDK3UkcB3di0bfL5Oc4lSS1V5kIM3KWEkeUl
         LS4w==
X-Forwarded-Encrypted: i=1; AFNElJ9aiOToximYRVbkGgrK9sQJLxDo3t0UnWEPTQqEv9jF0Kz5lCJcChcijb4KDCpkD9NK5vYLHeJB0RNttpWA@lists.linux.dev
X-Gm-Message-State: AOJu0Yw1aRxc0vrW/DdBSEFlxMPo8Dn8NmXhvvI9VN+xJFhBnbokAVVZ
	8NmoVyVPnM2Le/iaiOL1Qzx1qBQf4smXRk/q/BfbGFL0cp7zeSEC6RDkyKiPQ0nzAjZ+HQy6PWB
	7i30OTzPGXlC+lnE6+dfvCoq8pmAv8ug=
X-Gm-Gg: AeBDiestqoAcPSJQgieV4R7UpGuG29fs1/lEwzeOirEj6buLROomEnSuGcD8arFkIbQ
	7ROkDS8JHZH8s3nNMnz0WUFuqNzzofjZbvPTXA3bGl/znxa3HtjpqHGKjm0y4exCKZNMklZk3ea
	xzFAfs0y38hpYMRpGfC1UZeYc83QqhfhOFhz+tw5+cXI5qgS4ZWLbXA3BRw+H7vA2C8uaIRt8NR
	bUcYUjHMt2XqyrKIAMQytJHBcwXI4kaCMQV5eynKT0fIz/mXFE5mmXXAv7/xIYhpI6QorQVvtkK
	Cc3tRrK4YhbkjD17+CIFS1lC7Ngd9o5YBwQ9LSvN1h4g87C8GOb1tKP+k6QSWnRCJYoVzptXx8r
	cIHHns/+wxV0DWez+b7i6va53UNgh8mgXq/EWBSe/4A59G6WEfYMgbXHYHUjQ/C1RBjSJ5cA/+8
	Xu97qSag==
X-Received: by 2002:a05:6000:11c2:b0:43d:68dc:9ca6 with SMTP id
 ffacd0b85a97d-43d68dc9d13mr9278619f8f.18.1776063955971; Mon, 13 Apr 2026
 00:05:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260411123512.84739-1-joshua.crofts1@gmail.com>
In-Reply-To: <20260411123512.84739-1-joshua.crofts1@gmail.com>
From: Joshua Crofts <joshua.crofts1@gmail.com>
Date: Mon, 13 Apr 2026 09:05:54 +0200
X-Gm-Features: AQROBzAXYuBSZMKylrzZk9piXxiKmPZRoVgKuuLSOCWThsyrFt2uKr2aQljUk_A
Message-ID: <CALoEA-x4Kdi+=y3E8RKX=42Tfb4VjxtGXWS-A3khqRfLhY4K7g@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] iio: frequency: ad9832: cleanups
To: lars@metafoo.de, Michael.Hennerich@analog.com, jic23@kernel.org, 
	gregkh@linuxfoundation.org
Cc: dlechner@baylibre.com, nuno.sa@analog.com, andy@kernel.org, 
	linux-iio@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 11 Apr 2026 at 14:35, Joshua Crofts <joshua.crofts1@gmail.com> wrot=
e:
>
> This series cleans up issues in the AD9832 driver,
> including proxy header removal and bit math
> simplification.
>
> v2:
>  - PATCH 1: removed redundant bits.h include as it
>    is implied in bitops.h
>  - PATCH 2: changed ull to u64 type
> v3:
>  - PATCH 2: remove rogue vim typo
>

FYI, adding Nuno's reviewed-by tag from v2 as v3 is just a typo fix.

Reviewed-by: Nuno S=C3=A1 <nuno.sa@analog.com>
