Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE4911D61BC
	for <linux-staging@lists.linux.dev>; Sun, 15 Mar 2026 17:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773596723; cv=none; b=XKii8s2ivrvSVA3P/iLb3hb1uBd/XGEI5s+Sftmpq00X0/52AuP6HAOQI6xBYTNN03IE2F0DnGbIx6PVdprdX3YJGjETu96K3/au4z0U9TdFciUlTyE3ExVZ+Cqfa1h/Jw+ghxapIiXFsIfY/7U/X+UTg1vxtK8shNHnl1HmkWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773596723; c=relaxed/simple;
	bh=ezreWzcg646xLd13w0mmXtM8mU/LA4H5PXlJX4hzNuc=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=cOeB+yRCx6PWp8ZQQHyDogEEXKXJCrdwlWy8O7zG/Xf3NpAKM+QNTE6Mey/K11m/umVkS5rGKKDvjhVoFACIaBEAdP2vihsDFVGB9wuCi1VZ7mjwhIMgD1qHZInMn1bwf99DQSileI0R3b7BfPobleBgdRpgGmy4DUPo8u4W4ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PEGHMMW/; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PEGHMMW/"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-79860421382so33524037b3.0
        for <linux-staging@lists.linux.dev>; Sun, 15 Mar 2026 10:45:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773596722; x=1774201522; darn=lists.linux.dev;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ezreWzcg646xLd13w0mmXtM8mU/LA4H5PXlJX4hzNuc=;
        b=PEGHMMW/gjejxdny9oeFzJ4n8CSDBjjgmCwyCvwur43lMz+liIKjjva/RZy+OT09Sq
         Zei3OUsjSl/phih5m9C44/gTjvGywBC1bL29Nv+offDFAgd/ltf7m4FDYResIoh9JLER
         ERYIrHak7/aeGTq/wlrVOd472sdfxONzZ6ssgcG8x9Dd9ZxXhFaZJmX6DsmRJIbrdSz7
         XQ0gIjv51k3zaLO3dtvItlinq0qw2XKg31ZzlvRtTNEdbjN6E7361Rr3/kjbuVxjhPcx
         aCAUp5zd7AzfiBEuURrEgGV0Et+ax6UpI4h93KDZVHD6CKgndsj5C/uGUMRtxz6cjFvO
         +IUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773596722; x=1774201522;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ezreWzcg646xLd13w0mmXtM8mU/LA4H5PXlJX4hzNuc=;
        b=rQw7lXMTa9HuMSTRc1+kLi95UPCgCBcSyLNZhBBj6uFZ9OK8GmEG0lC1QnaKj2+fa5
         edbzLVl7hUgZmbRIaN/YfGYgfKVjY9tzYMWFanIAvU97qCCibWnfRGXwLukDl43ondAS
         7L0a1/2aRXikNCQuaj9QKU+ymBsbqiodJ8vFLdov4ov6c6fkD8GYAjH8pM5n4MSTcsIb
         RdO3uxJze/r6E8UikUfm0j8+fjxbjPl/TcqkYlX+4tiz54TY7DVvU8dIDQsUQdDc2R8h
         bhwEncz8zyLbTxRo3rNcdkR27DhnGzFBjDDjMU9mGanaV4UaQqefarVidOEYbwLUFwam
         VomQ==
X-Forwarded-Encrypted: i=1; AJvYcCVavPNDD45Zlpv59pFvNXfgp03Oe2FECtf3vNnCUyCzLlr77WUUJcJ7pVOLBh9/QIKpzinkk+25nLUkFfuO@lists.linux.dev
X-Gm-Message-State: AOJu0YxFqsO4TERVeUFZuJ5CKHtsk/pQP0sP2ZNCtFgnKeljm5XO1ege
	6VRu8XtOTRYitF77kh8/NpdPFuu2qlv18Z7gI4zIkWgCNGQwWs3kkGtO
X-Gm-Gg: ATEYQzznIbDKLCk+mk+/iyM803waRxESvusCUjpaWRS8rSknwJRwsD6KddElkDd5U5c
	yEOBjkS1xKWCBXGGniCNHWUMNlIMc6k/LhuPQs3a+/ugdFHRf+2VuyXjbARG7LZER0mAyXPUa8Z
	2ZKsl64eqdt47VgbaALj8yEYRWbd57iwySiNayu1hTipWj/yTovhVHZmV3n3u0rwMlRALs/0MMp
	0IyVd6rod/D+9rLxOtc5serZmBjcXG9Egcg8t+6bDYRNNO3tbiw2Re6/d0JxarKkR9MdXQqLR98
	DlbR4swLAM58w+QqprPC1/dw/kvtg4+hlwg3rJ0G/kcasWFmHwULfaDC5y7/yL5MkUaFrFzt+P0
	jKN6CqJHHlmXhJfwsZs7YPn7hQ2oDiMLpivdjjxIZBwa4JH80eufmr+bPQK9DVC7WSHdEbh1ih/
	33INtin5+gFraA1Wn1igzGlTMY8Qy1cSfN4ikrxmu3ZhFvIW3PGqUFnHz0UFbQBFZzIPc8j5bwq
	IlHdMPR7WDN2MFXzbt/byVnjxmO8vY2
X-Received: by 2002:a05:690c:6d84:b0:79a:40fb:933f with SMTP id 00721157ae682-79a40fb9bb9mr29261127b3.51.1773596721682;
        Sun, 15 Mar 2026 10:45:21 -0700 (PDT)
Received: from localhost ([2601:7c0:c37c:4c00::5585])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79917deb69asm75154027b3.10.2026.03.15.10.45.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Mar 2026 10:45:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 15 Mar 2026 12:45:01 -0500
Message-Id: <DH3JK4H34XH8.2MG43DU6UAQDK@gmail.com>
Subject: Re: [PATCH] staging: greybus: use %pe to print PTR_ERR in fw-core.c
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: "Tomasz Unger" <tomasz.unger@yahoo.pl>, "Viresh Kumar"
 <vireshk@kernel.org>, "Johan Hovold" <johan@kernel.org>, "Alex Elder"
 <elder@kernel.org>, "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: <greybus-dev@lists.linaro.org>, <linux-staging@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260315-greybus-pe-format-v1-1-d923fbed3097.ref@yahoo.pl>
 <20260315-greybus-pe-format-v1-1-d923fbed3097@yahoo.pl>
In-Reply-To: <20260315-greybus-pe-format-v1-1-d923fbed3097@yahoo.pl>

On Sun Mar 15, 2026 at 3:40 AM CDT, Tomasz Unger wrote:
> Replace PTR_ERR() with %pe format specifier which directly prints
> the error pointer in a human readable way, making the code cleaner
> and more idiomatic.
>
> Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>
> ---

LGTM.

Reviewed-by: Ethan Tidmore <ethantidmore06@gmail.com>

Thanks,

ET
