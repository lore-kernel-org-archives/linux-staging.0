Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A11E93DE434
	for <linux-staging@lists.linux.dev>; Mon,  4 May 2026 16:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777911041; cv=pass; b=BQctUFd+JrTxXYOwHx8riMBJcIy5hUfTbR9lyvBCTG4lb7J3ZrtxMO4BJE31CB71arD+w4cqYcBnEu8y6WlCgjey1twcSp7L+0w/mgBPIdhCVcDmuDy0SmBwBt0Ik8gO/IOluOSWlbzhYG0j+/5NCs7EpOEhzqSl8M+rj04yRME=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777911041; c=relaxed/simple;
	bh=QXSLC9K2LUyolFUxq1Np6YwX9Z+I2FxGsd//jAT5sO0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bzQrZcLIU9Ew7P5cEFFyHDkW77tjoSbgCCYAM6uBUnP6DcWX+CTmBqA+uchAX3hDfYH+pY5EbGMNK6iBmI23tCSW4o39YSMbz4RHPLn9UTG4BagltODiVWjZmctpDrEPM6AXQF1wbR/i9U3oxRQZyzZjN8MTdC4noEqvlYi6yi0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DE7Yo24a; arc=pass smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DE7Yo24a"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-7bd8c55c885so15212647b3.2
        for <linux-staging@lists.linux.dev>; Mon, 04 May 2026 09:10:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777911040; cv=none;
        d=google.com; s=arc-20240605;
        b=DevlWd0OOtigFYf0avlFVB0Mfx05OYxb3eqHPImTO13WZzYhGCqlDAv7if6qXSZwxZ
         NmuivHjdKkN4bw7db4xWh0NmRKZ8c/XsZVOPMKm4GUlMqcfZv1fyMXPayTq01ULkcHZi
         7AdcQ11UP7FvcDZoQZvpudVEWfEk2o59GFTTmUJvWe3KuK8oBrIRSQ2ElgpWvpySxt2u
         eQqCNZ9FEe2scCnelJWoy+7LrlJDAEx6VeKUhtjSkWQgzrsUdA3LYfCvsdbDHbGdTIJL
         EES99Aftu1BQjn1o8Lc7YBKmYr1veQyTaH2ldUn6hblTcvraV7L0jUDIAP7n9emhclp/
         fZZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qutAn5+FACFY9CJnkdgihQani3q+IAXospNoRfuglOI=;
        fh=siuKiK6SRDFvKkdSNqKq0Jink5i2CDvGyHCYupfDtBw=;
        b=ZkDe7W01+FWd1mWtYNqUzCWOxG7HiSRoC1KeFxVafag0BmrirbfkiflrqyUulrqZDv
         NRe/NhTlQuy0hQxiF1N65QgqvaVKlHyRB4wET3GlvvTmU3xZFAGeoB49enPuqeoqj9SA
         KtUqhpYdn0h0baLhMhy649+uWiMlXESrzKixHguK13gKzv5Ru+OaCccbbM+/wBa/2qeD
         HgLTX7Cy2CKuqO1KHZVUByI83OmDtddQ3DQBXfJbUsbN4kjNxa4rNOC6qYxhNbv3vLKQ
         UEB178GxcY/hpm7cTQk2V6xdpLiv0I4dTmiLPue63V2eT5rlXlz27DaWJa89HynGQ0M5
         Uhfw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777911040; x=1778515840; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qutAn5+FACFY9CJnkdgihQani3q+IAXospNoRfuglOI=;
        b=DE7Yo24aMKwP9kVc+OzPBl1N2lEsxShwfHfLUrYyHgsWe1glsNS8td1mmEm1/on+ol
         wTKrhmx8IwmGW0Xge/k8LdJF/ViNGjpmD2KuNP5VVSxE5P9UApB6398sWYxRAQ8EtUHh
         Tm2oTxPzGZGojT6oLer8DidHNMAbqbY1G6nJD3Si9QPdHj8yPevzmlgYpZi9ZW82LPov
         SdxROELTV3KWSV8acCclpxExADAIoTJU+S0rMUZJOWf256iY1rdTYCzMWe/dcRurCtME
         gly4cJiYPuvcZekeZxpxSLsgin+QxfhVpWng27TKzByq4Wi/HQBLOUfSkGkhcnCEf0wz
         yPMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777911040; x=1778515840;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qutAn5+FACFY9CJnkdgihQani3q+IAXospNoRfuglOI=;
        b=HaVbTCtdKWmdUqJq6wm46WUoOKYBH3YZdJ3Etv4yr0gQu4KMyyyCVqBdd7M1UjBClo
         pWjsgX6s9ig5DoUoEUhUsVUf7CXZJgB/ayLnnLDE0O+1hBm1cx5i1lhBgNNG2M5Roeym
         6S7nwZHNrtYw9DuglNBgaEkbW9IW+yEwPUDkaDztE9/ndZ1vYrumPunpHssRXNbuhhDy
         wHiDenMLJRM5v1JLz+7D61uJnEl74xPcUyWvTEGTi8nwK9gf4ZWs9OBTpKeU/4k8gny8
         Bcpx+bOHkobZGcD996A+FVARy0gkqdAh3OI/Ehv5WQrURas+jRJRZoz76xZ1QW77bXAW
         vPcQ==
X-Forwarded-Encrypted: i=1; AFNElJ+t65UXKS1ZWu6eN0Pd7ZYa4Cz6zR9qlq37cwwamr2WgU7fvDFFV/JEEOscABztOlscmW2ygSjgtyI4zXRq@lists.linux.dev
X-Gm-Message-State: AOJu0Yzd0hfzkq9+OS0+AvKlsoX7buml/Pz9asoPHBUKQkKqEUBagKxu
	k16WS6AoZHsGC67T3QAGAbWHsPXeD+AoIV0jAo7QxO0Snu1DEGWJJNulIl6Vt/ZlwVXVWh5z/Hs
	LDUQdVBCqCL3NLeOfJYPXGrXnOxRHOk8=
X-Gm-Gg: AeBDievM1GrWgy3tMlJoJgsN0gHS4s3j7mvGzR3LfmBNxwkYyiPDJhlDB0OSWv9YaXw
	jQEhzg89A6bzi2zgZGVkjaFyAlazWxWvV1HU4Ayva6WvJYrJooBOPzDAi432uexQqErGxb1rQfP
	+RZCbcLYeDTrqMY4j3vXRChWBnOFO5zi3KviEIlXtA6mBFAkw4BtZ0+5X6f9y7NB23qo0QVc1rn
	1jwkENM5++IwTqbgkogxBxrrFdQG/41zTbGrcH8S1t05qFiPsIM9XY9cXRAR3LUQfEm6avPVYl3
	ypEIfZT/ccxrlmPf9axKEMcJmpdFj1I=
X-Received: by 2002:a05:690c:c6cb:b0:7bd:4792:66f0 with SMTP id
 00721157ae682-7bd7716fbc0mr81990687b3.46.1777911039612; Mon, 04 May 2026
 09:10:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260504092059.1536094-1-angusg778@gmail.com> <20260504162346.53668925@jic23-huawei>
In-Reply-To: <20260504162346.53668925@jic23-huawei>
From: Maxwell Doose <m32285159@gmail.com>
Date: Mon, 4 May 2026 11:10:27 -0500
X-Gm-Features: AVHnY4Knbk-TsM_DmQ2n_xN8NRlpmOqGAfjG9IJqfTYXUwMg5Fq9WPp19C79NKs
Message-ID: <CAKqfh0FiqN3ztMxYRWasj8+2+z0wvYanrdfvze4z3U8YVcgS9A@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] staging: iio: ad9834: driver cleanup
To: Jonathan Cameron <jic23@kernel.org>
Cc: Angus Gardner <angusg778@gmail.com>, linux-iio@vger.kernel.org, 
	linux-staging@lists.linux.dev, gregkh@linuxfoundation.org, lars@metafoo.de, 
	Michael.Hennerich@analog.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 4, 2026 at 10:23=E2=80=AFAM Jonathan Cameron <jic23@kernel.org>=
 wrote:
>
> On Mon,  4 May 2026 19:20:56 +1000
> Angus Gardner <angusg778@gmail.com> wrote:
>
> > v2: Split into a series of three patches as suggested by reviewer feedb=
ack.
> >     Also add a missing dev_err_probe() conversion for the SPI init erro=
r
> >     path pointed out by Joshua.
> >
> > v1: https://lore.kernel.org/linux-staging/20260502021815.3953423-1-angu=
sg778@gmail.com/
> Hi Angus
>
> Series looks good to me (Thanks Maxwell and Joshua for reviewing!)
>
> Applied to the testing branch of iio.git.
>

I realized I forgot to add my explicit reviewed-by to the v2 of the
"use dev_err_probe() in probe function" patch. If it's not too much
trouble, could I get my reviewed-by tag added to that patch? If not
then no worries.

best regards,
maxwell

(p.s., feel free to call me Max, cheers)
