Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3B9E3B0AFA
	for <linux-staging@lists.linux.dev>; Mon, 30 Mar 2026 09:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774861204; cv=pass; b=qJiMDJnRcHABxFlVhYEPCotnFE7rbOgKYHc14a4vHWb/KgO1M/dhEbvyO6rQPvQ6ObT77VdhCsYGewOok1d6nXSj4XCMzZ7JrsC6dqZ0jW5pAlKTlZg7sRcDBq6VqZMKBiT5UlY/67o9SmRprzllVrgNHoS/pEHxpReMqxjvyBQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774861204; c=relaxed/simple;
	bh=Gmf4cKRYBxiM/zbzU6bBxAY/t0/pYX6lhM+af7/ibpo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dCCFbtXhis/0YESxb/STTSCuSZR+uZ3Vtdq1FyKpSGoWJxrMGASUhs0kpqfJq4zgJwtgZ9nzjXMbrfm7q1A6cF8Of9AKYkTyDSkZP4CYnPRFhbLpwoqSfcMx35hltn/5HZpPJD72sY6vnyyZCsKh1LtBkaF4vU7w0cdocN4xKoo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CVJnDV3c; arc=pass smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CVJnDV3c"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b9841aecf72so494723566b.2
        for <linux-staging@lists.linux.dev>; Mon, 30 Mar 2026 02:00:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774861201; cv=none;
        d=google.com; s=arc-20240605;
        b=hVZpugvVlTRjLcXl6P+HQwD+GzFTspDqS0y6k5581SEXbO34T6inmIB40opuErTOKZ
         9R52SKwyFzTtTHzQ9SRQcrEHfF/wwwW/21U3Q3U7rcIZD1ah6+0aaBOFDnt/lL3mW8hf
         QZSToSt7HxEt2rzU1tzDvlwVestJVNNke9UBF3GZyfA5MRpVL74PQ3E9qUc21Gp/Wom5
         E0KQ3d8JrnxU0MDKxKwZD4a7TjJffqxrTZzmnyGky/pGa0IOq9rNimmxrxFee+6DhhDu
         PXZoJyIssRsAj6QdDe8eObIyXIJVeTfNqH0n7yXwsa0dehgrX4qGFQo+KtfW7TrRF1xm
         H+nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aGiglqVIFw2t7J/GqduapkYUREbx60yFQhhgRL82ZAg=;
        fh=BHISQwWtYOvwntOkacD3yqN8i+6yhrWnJI3S5oxxafo=;
        b=BeCS54ZGx0Kt6hbyyEE/hl2Nc1W3EbXXvg5W4/qCOjKKJ5H1R3qav21YrX+1nG3l+P
         3TeOVPh4BS1VQX5Ggwd9pIWO+PPJmloOS+fZGm3zRQI8Br43vxjYBthpzYBlQRullGVv
         fMPK5CL4shr7BzjbH4Mvo2/qziuffR+Fza43u/hrCJfqU/tbgELsi6LnDG/16xx9CmmN
         3fiO2H3af97cQEPPKrbwdMBrDHXZCgIildgHSOVDfpgeVqINCnOlYlQMoPf5qmy7zot4
         TUiizfsSwqCh8G87CcL+ROMOd7HpZczUwzRseRkZph8Y0VQ48iC+XrZBlbIuvcHkZQWJ
         6baQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774861201; x=1775466001; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aGiglqVIFw2t7J/GqduapkYUREbx60yFQhhgRL82ZAg=;
        b=CVJnDV3c+yyYkeO+jY0WutJp1pBG/v5+HbcYyVWdNZfxudNJOoUW9ZjYMoO2E9iZa6
         kgP8Lf11USuopg5u0XzjIm23pgmEJHJu+K9AKXUhhbtlr/zn/qsG+3aO+3Pp/9vJLrBN
         sM2r2I0Gz7pqzpxuNOHdSSBBkKG4U4ZVtyJT8EN2C/ct3s9jyxBMgjyGCYqMgXyeBXhE
         oTF0xcJx+Ex05MdlHQTgN0vzd3eOQUSF0nHjNTkEt+gGmFDXXkjHI8sSLAZdb0vcbJec
         Vk4Ss5uZGtSrBXusF3JBJYa87jalS4KdDKzqD/JNC820KdeIk2rtUBvgdstENpZjql7A
         S8KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774861201; x=1775466001;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aGiglqVIFw2t7J/GqduapkYUREbx60yFQhhgRL82ZAg=;
        b=Oz4tCZAvxH4t+E1PQAty2HKWTiz7h/a/woqkYeMPGMNdoo9eFsGuyuRYbbBQt5jT8k
         or03eEz4EsEALs6tLdZxnaGBiFMJCDhCUhN/70o4Z2pX6YJyH4j3F1XHQuYlDleeh1nL
         dQ7OxBMH4/SjNV3CLfK9gyChPcENjaBmSozFaUT5Az20peuADV1eHFDabkiMWc0vt/2f
         VwF5eR2WN/7qRU+i0/O8rZr3oxeyT+AmzlmmCWFyHQYNyYDJWKpCok37XqqEHfmS3Dbl
         I9MP84W2Zlozqa4F8apRLrAin6rE6oSlPZ9p5dWxZwki77xIFHj6SzPEtet0UMWY6Eyq
         qJXw==
X-Gm-Message-State: AOJu0YxU9AdfDND1m3FK22Xqu8BjMZd1ctTxfkunHALbIgAa0EEJAX3r
	9iMLKIPSXMKRApJoOa7YPKJwlnSqyG12FOaus174rjXKDln6vxGortwnedyloUDuC98OWGOfxfY
	g+iKKOh5nghTofHQnwlihlGtTWBOMOP8=
X-Gm-Gg: ATEYQzxuGoOJVCHAmKRZeOm9hLBbL0ljhisQtONWq/Ra4Sy0c2ZqANQJjX70DXFcGeN
	J3U7Do6z6M70i/gquaPW6EAhQmbh8KjHtQh2k9p0ZgLATC3Sd81ktzvASxZV1ewS6YbYQ67CVo/
	i1UP9YkchA+cTBDivUxTM+KzPFlyhUd426z9S/jpp4VIS+7PtXwWFB3oW2OPrueJ+TN7U8B7PZM
	gihhtkV45Uzg0HIUoiOFTqDGtNdWmcwQn76KKRRw+/yONZ8+rFf+5Ae8d7g1g4MdQJ82Bi/524M
	+7SewrneN57a332oqFaCP9UK1rodtbi834QF22twxWTw/lv7llFFGWIP71bVEdlqlz0RK+5ZyEF
	2ObD4O7A=
X-Received: by 2002:a17:907:9711:b0:b9b:63af:d9cf with SMTP id
 a640c23a62f3a-b9b63afda64mr607791166b.48.1774861201120; Mon, 30 Mar 2026
 02:00:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260328192721.255493-1-azpijr@gmail.com> <20260328192721.255493-2-azpijr@gmail.com>
In-Reply-To: <20260328192721.255493-2-azpijr@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 30 Mar 2026 11:59:24 +0300
X-Gm-Features: AQROBzAcoxHOw7fb0aPNNPEuLuc8vp52MzCuSgku8_PK1LjqHwTGnIxNOYa7iJk
Message-ID: <CAHp75VezSSid9b5qNzvMjUS7QTJaKtBhhVVnuS+-sjVe_a=CxQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] media: atomisp: fix potential NULL pointer
 dereference in configure_isp_from_args()
To: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
Cc: linux-staging@lists.linux.dev, Hans de Goede <hansg@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Alan Cox <alan@linux.intel.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 28, 2026 at 9:27=E2=80=AFPM Jose A. Perez de Azpillaga
<azpijr@gmail.com> wrote:
>
> The function configure_isp_from_args() incorrectly dereferences
> args->delay_frames[0] to configure cropping without checking if the
> pointer is valid. However, as noted in a FIXME comment later in the
> same function, delay_frames can be NULL in certain pipeline
> configurations.
>
> Add defensive checks for both delay_frames and tnr_frames before passing
> them to their respective configuration functions. This ensures that
> optional frames are only processed if they were actually allocated,
> preventing a kernel NULL pointer dereference.

Have you experienced bugs IRL?

...

>         /*
> -        * FIXME: args->delay_frames can be NULL here
> -        *
> -        * Somehow, the driver at the Intel Atom Yocto tree doesn't seem =
to
> -        * suffer from the same issue.
> -        *
> -        * Anyway, the function below should now handle a NULL delay_fram=
es
> -        * without crashing, but the pipeline should likely be built with=
out
> -        * adding it at the first place (or there are a hidden bug somewh=
ere)
> +        * Safely handle pipelines built without delay_frames
>          */

This comment suggests something different. What the proposed change is
doing is just skipping the invalid data without actual understanding
of the root cause.

--=20
With Best Regards,
Andy Shevchenko
