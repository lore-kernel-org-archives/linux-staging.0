Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DF913D6664
	for <linux-staging@lists.linux.dev>; Sat, 18 Jul 2026 14:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784386165; cv=pass; b=jgPXt+NzpxMWLP9XNoU0Ga51nkIjnUuqKs04aaeXZvRUU/iepKwaMWrTNijuTSzheQeOj3iV0ZHhNkequ+3g0CoEy6S+WTctEmslVqepp0bSCzb0RHCLzO5hTx5pQWluh8vvdUhPSaQf3Em6eS8MMArjWFZTGjAuD0/zFgX5yFI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784386165; c=relaxed/simple;
	bh=cY0n5YdJZT/kDg6q2RLSXisqeJKPpk4DBOLmie8Zcr0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LMKLuQbAdvqw/YMRIyOK37EvqFoE4J4mS9i2TZBNgp2CCPy0So+E2TOR+lt1Yx47/iKYSE7tKI0qYPlsRxuxofRa+RmEH/qjWOpp/mXOqgJvgkDk6+D+PTEH4GMxJhN/gOTtHpELN/UDq4fgC3rnAhlKqkmcJMg9E2fjhaxNLxs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fDBg5zOb; arc=pass smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fDBg5zOb"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c15f360851aso793800366b.2
        for <linux-staging@lists.linux.dev>; Sat, 18 Jul 2026 07:49:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784386161; cv=none;
        d=google.com; s=arc-20260327;
        b=dQptP0+XXfrcIpFwFQcdO59c4fo9Em9H4XPHgiGKqXG8J3cDg+gJydM6LxZuS2+FNa
         GUEMLCmtr8Oa/Hgm3k6V5AQBIO12MVOyqnWsL55qzTFcQLLAMsg6iV4waxF4K7WV5CwF
         J6E+nC6eWAByymwkwEcTCfO4PUqkcwZt2x3e1ZfMO3UqyTXZzYX/W5KFzpQzGM5c+8dW
         OkQQNcrDf8A3cLtI5O13J9l7HFYjIy/C/Mo3BcpKPcPVv2xctcMDO9UQA95mH1dqFutT
         z26+P1nXIhTTOuRbwX63S4VYp1PJW428aWOev9KOaiLfuN3+fF+zZvV5JJFW/0iXBcQ5
         aN0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vl1WVyiHzVkea159MteyZ6RyA+Bj3Qd5o83McaIp3/I=;
        fh=tRFppvRDB/X1j9S1/Otlsk8TTh8kHrc9nzbxyuQi1nY=;
        b=R4Skdz0vaVD+uOEhU6RRv/qaupbfwEYwL4T6HzznUqZCHEGHHAtulzwseHuBb7qC2q
         IsOkeVRPvr177v2JHzYqLarTXgzvxJvG5/TfVhwzhq1aeBtD8PGzdpXRhmIpVZXsphqV
         99taexyhEIadBvVj4BFcZU+2oGyFgKg+hrtUxtzA5vKVTVD2ZkEGrpaf4XWwrEkD9xqj
         CaRUM0iP3ieRzRPcBd2+aAEDQ7gpTPwflPamGYzEZrKlUZ8dHakM13enRcWDkzvEusY7
         lr4Enn39hLbIvysxEI70t/S/Xw+zJH6yleSIGFy7Z5+SxfR9rw9yGc3sRRllSjqko3yE
         yRQQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784386161; x=1784990961; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vl1WVyiHzVkea159MteyZ6RyA+Bj3Qd5o83McaIp3/I=;
        b=fDBg5zObWwkduE3ql/DIcFCI9H0qRHnghlLrvLPdkH0aJ9rOcrN+ffLZlxcQDYU+rB
         KwdUEsZAEMWy0nvPD5aJ+TAROBE+uAtIN7h0pRCKEdjEe5yGjEQvAfRC0KCYKepnsdnU
         QFIdzwvia8P81PJFkHsAm/ncUn9n0082TtT48M76/g6w7V+fRy8xKo1kyZmzd8GxT966
         4a9KyTg4+pi6ifRZhvHm72Sk4HOr0w9vPFKw/EbNSUMO+wdz02PWbMo55WYdfHI0Ob7+
         Oxcl3CZJMh1/U2UXePSvo5i6yhm3DDTl4TDpP3L98vTjUsUPvcb9RByreXSTgdA8dVaF
         c8eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784386161; x=1784990961;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vl1WVyiHzVkea159MteyZ6RyA+Bj3Qd5o83McaIp3/I=;
        b=M2kPf1/YCP8FMFcGJZRG0H5OKC9lbdztBShCjo6olZFZuQzFBoXwaFlI22TN4Joyrd
         rxFcb2IV0TvZuWYF6iCY29MshOQeSej41PdCHoPj+/tM0ek5oXquwT4ibdsmYGisizSk
         lCwhyMYgRGLNzVRrGxL6bvrsLCO/YnmQRc56kUn88BcBUFSFrKfYCJeUxxr6L7MfZXM4
         nOWtFjyBroVwiGMN14ejOajpDsUo1jnfGTJGwjsUj+OfeksUfs+XK+WUz0fjRd3sbqqj
         ZxsJpr+tHPC17gFM5OczdYjIFS0EK6g38V0AzpZVnmcebNmsbOmP14EQK7gEPgXTN+ej
         mK7Q==
X-Forwarded-Encrypted: i=1; AHgh+RoKIKkwpAlCIkNkllRnPpuP5rlV1Rr4L9CjXBSh8UUoLIUAHkgFnr8QEhZluMyAyqMzGQ7APIIO0iYhnwSY@lists.linux.dev
X-Gm-Message-State: AOJu0YzMbDmP0gIleQuqetZqFX8MYVHZ7qhzsDWbntC6e6DFy2ybmleq
	UbfrdqhtJuhpM4s6mcs9MIgjZ87sQWT+jFB/OkBP6wNRgcgj7EDucU5KYYqpzXQFGx19LlxC29z
	qUA2HqUAa/4KH3zLvTL4VGz1QspxxuZM=
X-Gm-Gg: AfdE7ckha+vDwsMdfcZOOSTOta56VsznGgwopV1pcEOtZqRCUQDzHtMcek3bR0ch81P
	gGBy8nObP8uEVq4sGaBIpqYyk2JEIA/qTOdX/+tEn76cVbULt5tHhUA9gzMDiW1oXciYphQ8weT
	b6rf7OtrnnqMwbbJoaUU7725MiVutO5ChfQM4I07qVGTlnRxnHmaboGQZJJIE/6hpyTJAZtRjhO
	z+0x3EI63fuoBeBnKVlXojQxkxNA31eBGf6DiHRAUwEJhrSo7wPCtciLdrmCIPZl68p+mxiph7t
	YTGCbs3PoHI5ak92OK8K1L9+kNSleXnZjyrtzv+V2SyZbsK0zz0eUp5m75o=
X-Received: by 2002:a17:907:3c82:b0:c15:f0b8:eb91 with SMTP id
 a640c23a62f3a-c16b469b580mr291371066b.7.1784386160988; Sat, 18 Jul 2026
 07:49:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260629144941.33818-1-adi25charis@gmail.com> <20260630204908.40206-1-adi25charis@gmail.com>
 <2026070742-marathon-facsimile-648c@gregkh>
In-Reply-To: <2026070742-marathon-facsimile-648c@gregkh>
From: Aditya Chari S <adi25charis@gmail.com>
Date: Sat, 18 Jul 2026 20:19:09 +0530
X-Gm-Features: AUfX_mxFrqSSDggOS3fPevk9sELTA_inmI-94_M6dZS9housHt4PhqHn-u4ldRU
Message-ID: <CAKt_FXsofONvbB0+uHh=0b0-Wu1oTQvmADBzoUvLu9YgjSad-Q@mail.gmail.com>
Subject: Re: [PATCH v2] staging: greybus: audio: split topology get into size
 and data calls
To: Greg KH <gregkh@linuxfoundation.org>
Cc: vaibhav.sr@gmail.com, mgreer@animalcreek.com, johan@kernel.org, 
	elder@kernel.org, error27@gmail.com, greybus-dev@lists.linaro.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Greg,
Thanks for the heads up =E2=80=94 I'll rebase against your current staging
tree and resend as v3.

Regards,
Aditya

On Tue, Jul 7, 2026 at 2:50=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org>=
 wrote:
>
> On Wed, Jul 01, 2026 at 02:19:08AM +0530, adi25charis@gmail.com wrote:
> > From: Aditya Chari S <adi25charis@gmail.com>
> >
> > gb_audio_gb_get_topology() combined three separate responsibilities
> > into a single call: querying the topology size, allocating a buffer
> > for it, and fetching the topology data into that buffer. This left
> > callers with no way to perform any of these steps independently, and
> > forced the kzalloc() allocation to live inside the protocol-layer
> > driver rather than the caller, as already flagged by a FIXME comment
> > at the call site in audio_module.c.
> >
> > Split the function into two:
> >
> >   gb_audio_gb_get_topology_size() - queries only the topology size
> >   gb_audio_gb_get_topology()      - fetches topology data into a
> >                                      caller-supplied buffer of a
> >                                      given size
> >
> > Update the only caller, gb_audio_probe() in audio_module.c, to query
> > the size first, allocate the topology buffer itself, then fetch the
> > data into it, freeing the buffer via the existing free_topology error
> > path on failure.
> >
> > This resolves both the "TODO: Split into separate calls" comment
> > above the original function in audio_gb.c and the FIXME comment at
> > the call site in audio_module.c, both of which are removed as part
> > of this change.
> >
> > No functional change in behavior for the existing probe path.
> >
> > Compile-tested with W=3D1, sparse (C=3D2), and checkpatch.pl; all clean
> > on the three changed files (audio_gb.c, audio_module.c, audio_codec.h).
> >
> > Signed-off-by: Aditya Chari S <adi25charis@gmail.com>
>
> Does not apply to my tree :(
