Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6F5D3F54C2
	for <linux-staging@lists.linux.dev>; Tue, 17 Mar 2026 17:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773767367; cv=pass; b=bu5IWSU19VwGA4pRO+hfaOObKPO9hvb+g1pnVyr8t+lfcv22PCshT0HCJv+qzbOEbelKWN2lBuSZeR5vIQDq6PWNcyfNdSpMFI0nzUwCGfQOvKXkaMQwyjIsl/Oo5o9V2OGs4C3ltisRsRlUaQ9VU8zC7Zehs5aBvC7NnVl2UJQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773767367; c=relaxed/simple;
	bh=LWX8lvkUV9PBNvGCPfQH+mGtLQKsR1aBA/U9I+b0PXg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ajw5fze6ByJK66HRgkl1nJig9Kng/Zgu9xHUEvODqWZ/aTVNKz+HWgec1R8fkPv9m17R8NfTY2hT0w0oxhGdJtVTtzphAG9z7Lta6KtlNn1AYmu32A3MGOlEuLJAZohYHTyNHOu6s9Lw2rALZXRK6ALdMRpUI4oHzdOPfIOUajw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AvAtRFMQ; arc=pass smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AvAtRFMQ"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-43b40fb7f95so2471837f8f.3
        for <linux-staging@lists.linux.dev>; Tue, 17 Mar 2026 10:09:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773767360; cv=none;
        d=google.com; s=arc-20240605;
        b=Eh4m2VdTQ6nQk84NYzSIeKUVBoM8gByal7YVSBYM/tDpQosFmSM1ok5XHv5X6E7L2V
         +n434B2Bzi4/KWn/2+3rd/z6IFjcBUU9QXHq2anFfhnVWQbic/1pT+da0krcxpmysKyw
         GRo7GM94lkxi2x6Ip1qM9i1KHTaqKFENRXxFabO5wTLAAcUQml7TPrRu3FX/ROGYSKTh
         WhtiPU90+dxVztqKoVu3yvCbbWxFtXyAhGlxv9ItB8tN3V3aV1La4jj1v2ESqzv/m/GV
         Wkg1DaS4eNzK78S180CBHOjlptaXv4Pk8Bk4Z3o37C4IdSSq4JEUkhjDLAmc/cStOuMt
         hUwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LWX8lvkUV9PBNvGCPfQH+mGtLQKsR1aBA/U9I+b0PXg=;
        fh=7mqsHLoXmcS2F4tVgkNCQ8J4fozXprSi0Zx1u786uj0=;
        b=LKqN9MISM/pbjJ2x+usZauTEkh6HbIm7sleWuEmF0NhBTvGyoms+WfQjhZ162+/DDw
         6JR73RdFM+8rCKs2wS11Qcq3nA1tHKL53ygv2I16bWQqvqXE7adANrUagbJuet3AYVE9
         01uAQM7j0wEjOruOXOAm3+gwI05Fn9Wl4WcMJP7Hd0ppSlO7P85ZTtK884OpXrtXyBAj
         HoyEfuJ6oZNf7eFgvvIE9dHSJilpFQa9uPsvcFTHHxx5CVPCuVjQ/Q7gCZPqLmowimQd
         n2cJ1qH7FRAQmg7DswpXdmBTFD4IwiqxHPxoC9LkS84O+lYlYAC2I/Fp8xXKFn4S6JDJ
         +VKQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773767360; x=1774372160; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LWX8lvkUV9PBNvGCPfQH+mGtLQKsR1aBA/U9I+b0PXg=;
        b=AvAtRFMQQezDzJQGdJ9lOIaPc+4yVualep3gqwhJ8pczxVdEpX5TLj9Vz0ysjYiz1Y
         Z/nlMVTjPeSSOK9M52M1XPI/baS4wkZJn8aWCgoDVmLmRFSgeVausA79p8Ddh+Gb4lpF
         CzKy9rJW29QGxqWOuz0ew+XJrqMeNMiL7OGrAiRyIpjvRoMSkJHR3khdegdfCXRcw02B
         mWjA3s9icUTTbU7No0vV7AfhDzwiECED0nnwFuEPOZQi9S+uz4TRm87uYwejEK+0fPzp
         od3KyT6pZNrDao97qunmkVHHFuwT6ezOMVh82f8Dw1rNEzh4CmjmCi/IXWoPeRYSxItY
         ZVZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773767360; x=1774372160;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LWX8lvkUV9PBNvGCPfQH+mGtLQKsR1aBA/U9I+b0PXg=;
        b=rZsmHaHcgVOsStZ44DC8uAxEcAZ7YamWd3rmdZR1e59vZt+wwrLDx/2C9yK1Yz7avw
         6m3yqijsZJ0zLSP+WVu33PmaIedQh2W8TN860qdZB+VhqbzDw794YXNAjjdBRvW6v4aa
         WXZURfPWArfIEMaQZQlfJ0VxR1SkhsjvkK6CV74gkHNNAflQkUD+VPntFV4mNOSb4Dq6
         vRZlmDhTfq1E6sy5tYpZgHb5iIfo60sKpT6TjL205Rp9RhG39bwc35+Qtxx1nYuQDPch
         ElKIXVhBuERIB1H5ggNeQJvM+hxVptDYArzvntyGNO/evctMDuQAfpJDazoEzD24JE/+
         /pRw==
X-Forwarded-Encrypted: i=1; AJvYcCWr1525BPPOpdf6/JcoKYY40vJCOaOc2eHlQSYwvXBfAdGtxQSoRNT/Gs2g6FiT1eL2HrYehAzlCrL8qg/v@lists.linux.dev
X-Gm-Message-State: AOJu0YwqeGXavnuPYRn2L7u5wPSaGbvNFACF7c+jDtunTbpw4zBwnByc
	rq1BEXzWsaChd6BNU83OxfJ7qbsz/BMZEtPojBQyV20A0id7B0iwMQnqDI4WEuaXsr0Ku4yNx88
	qQDe23PImYirGb4m8Dj0Uv2ke2eogruM=
X-Gm-Gg: ATEYQzw8FVBl45MVP6j+G0k1U9ECYfwvMd6RRTaG6bcZXk5G5w5bAYNnX0MYrRl1civ
	NAbjYhWpiBvNRrnsx6IChNe4ZbXWRKnsDoErZvUO4R0FCl0F8quDH3VzycTJoHSzBlHZ+tGxxPs
	rlKh2LMETZEX/L5yKP6tkIVb6RIaB7fbPRzxB5LA5YFQHjw+iXzIBwngoRvFgI8DyONEmjpQXEc
	sF8pFqC02JRkMQQbEG7IODINmtjPXgdR/KdKwywHBZ4PKPTQFzv/7Ay0G2DDp6YIY0LjhM5Tj1w
	hx2sByg5TuIWPDctGgSOaOg8/V8LB97HH8LD5Lcgdg==
X-Received: by 2002:a05:6000:24c1:b0:439:b1c3:84c8 with SMTP id
 ffacd0b85a97d-43a04d8c957mr36170888f8f.21.1773767359996; Tue, 17 Mar 2026
 10:09:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260311151302.105992-1-kalyanipatra2003@gmail.com>
 <a26ba4c7-05d9-4df0-b4ec-1a82d2df075e@nxp.com> <CACjYBviU6v_QbpPy0zhfpaBYMoQrO-pBNywzXZb9cHgerCCGBw@mail.gmail.com>
 <abkRdID5NGk2mkOF@kekkonen.localdomain> <CACjYBvir9vnXqH4HVXKqMs-pmqTWjs3wA92WH9_KUpwSr3KD8Q@mail.gmail.com>
 <abkf0KPSKnKZep5V@kekkonen.localdomain>
In-Reply-To: <abkf0KPSKnKZep5V@kekkonen.localdomain>
From: Kalyani patra <kalyanipatra2003@gmail.com>
Date: Tue, 17 Mar 2026 22:39:08 +0530
X-Gm-Features: AaiRm5338gRG7C14c73NXuA1yBJ1OtcVqLnDaipkFF0EhNbiUlUmgmJ-wtvEcfw
Message-ID: <CACjYBvjb05JsrV6g9CaJozApxA9FWcQ1UUZqzzTrsztS=+RBRw@mail.gmail.com>
Subject: Re: [PATCH v2] staging: atomisp: fix brace style and trailing
 whitespace in isp_param.c
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Daniel Baluta <daniel.baluta@nxp.com>, Hans de Goede <hansg@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Andy Shevchenko <andy@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Simona Toaca <simona.toaca@nxp.com>, d-gole@ti.com, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 17, 2026 at 03:03:00PM +0530, Sakari Ailus wrote:
> I first applied the patch to a different branch and it seems the
> issue the patch addressed was already fixed by another patch in
> the atomisp branch.

Understood, thank you for checking.

--=20
Kalyani Patra

On Tue, Mar 17, 2026 at 3:03=E2=80=AFPM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> Hi Kalyani,
>
> On Tue, Mar 17, 2026 at 02:12:20PM +0530, Kalyani patra wrote:
> > Hi Sakari,
> > Noted. I=E2=80=99ll keep both of that in kind going forward.
> > Thanks!
>
> I first applied the patch to a different branch and it seems the issue th=
e
> patch addressed was already fixed by another patch in the atomisp branch.
>
> Thanks.
>
> --
> Kind regards,
>
> Sakari Ailus
