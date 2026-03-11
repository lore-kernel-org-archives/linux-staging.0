Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43D403DF010
	for <linux-staging@lists.linux.dev>; Wed, 11 Mar 2026 15:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773242555; cv=pass; b=mowQWqROmEVXriRX4xyo+HXzhHq/spchHY0G8if+yiTfvs87yQLu8oOmvzK36OQBU0OWEGJlWY0pYK8lP3jEPshouNTt3EhI9z8CWc04UxfNhKyKPhZgYSh1Y1A6mDp2rnpQyrVhNxZgI1MoyELYaQSofyASeX94+bZp/KJPt54=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773242555; c=relaxed/simple;
	bh=S/yZmnEYCd+WqMtgN9VNEc8yu6Z0hzm+57ud2v4UhzE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c569d7A2TAMifk0puINpVPyeINlBHOsHw70m6imgk6hDkyWW5UYnCZOJZxk9HRexfqH+ctAC6x6FPWqlhoZDU45/I2ZF2D/4aFdBMoydST54OXmbxdtXn+Xq/y3mN4624dMhxU2TP2gVLgNhBMYTvm6FbugiIMMl9rGrkyEkehU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dqmLHWx8; arc=pass smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dqmLHWx8"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-439ac15f35fso7594f8f.0
        for <linux-staging@lists.linux.dev>; Wed, 11 Mar 2026 08:22:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773242553; cv=none;
        d=google.com; s=arc-20240605;
        b=NsEqxEcjXmIeZO+Z9eZr64xB2Kk7DXu0Pd3agtVvnkw/Erws00sG/s2gjRT/Cts2lw
         7u7WOC+2GSQVX0c2VCsKlKQeuOnhH/EKPLrJkBhzFcPKQEgFxt3mNDuJZqlFdeJNdQPq
         ie/rYh2B/bmRiTE+QX3ut3gt31Tlz1i5Ng50ZsGlzYUEyqZFqemYn7xbI6gSZzbXFgDu
         5HRaWil+73+U3m0y9jWp/sznNwYiCdczvFlt0A5p+8Ve/TIZdoLMSMOwXLFZZZmsO/tT
         BXsTFY7N+I4iSH3sP0ZXrp9Ql25XCFpgYn9JrvLupdj5e0FA++mRFhDX4gFi1ocx9YQW
         HcPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=S/yZmnEYCd+WqMtgN9VNEc8yu6Z0hzm+57ud2v4UhzE=;
        fh=JSrGgfVc0KZjZqUP+1/O88OAITB8Gvk/jahpweRWWAk=;
        b=Myxs+EoxVo7WgzlsCw9Idr7/3N99WSd25zI2Cy26oiGU6ewoGK5VtzkiBSTxe3V2q+
         KW6ytkpwJjbBaKzPgXuPi4nKiTuYQCzIRAxtpxwBfHDfZXyBsVe/jGqZOnG78dfhdW2t
         j71Q9I0EmwR2mhx2DMllkTwc9Fl2tP4JgnuBvifbwrVrhpZ+H+kuYP2R0u951xbcBRLw
         yeRMwjtq02q3Ts4qUIRyrpmX+XYCdZISrKBbYVPCJuzbMzccRg8v0CgPoyV2ria2kjLj
         b0SfuXBgbNKzZ6JbItXhMbDu0/w3dHDjp/iuxnlNXNIqxkNyhx2cXB45R41pk171SSHw
         rCSA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773242553; x=1773847353; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S/yZmnEYCd+WqMtgN9VNEc8yu6Z0hzm+57ud2v4UhzE=;
        b=dqmLHWx8zXcf96XHdcjmfcwFUu+Vn3qIceEUoK9+qT70vYxjh4GnVHI9ZdawNitycM
         uJNZfhlZS3OVfQI4ANY8M5Wxf6Lxv70W2qtvt6iBLLIiLReOZ8xdKnFVnd405Tj+8yBC
         vipKVMet1LM0K5zQ2bgjyrA9G7EHrlXdhedDHkzP9/CmNc2WtsG2VAT6FMh6Gipjw2bM
         rRH9E6/hZC3UKp6EaBhcOGV5W4MCphKYIQEjDHF8lQOKDJb6QhRL1RuHlazAXPvkuL4w
         oFarsxVH5dowUPn/DiZOPdUw9d3isVAwzP5N1WeII9MQpQk9MVjbOJrSdOQOiARGL4fV
         rJ/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773242553; x=1773847353;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=S/yZmnEYCd+WqMtgN9VNEc8yu6Z0hzm+57ud2v4UhzE=;
        b=QIeR0UmsAPGqki2Sm/8bu4STH5hEnfGYPv8dbwfSmL2jHHvQemUJb32NNH6eNzh4PJ
         cUyO+p60EwdGZ5vij5YHMeJ/VwL+Cps9Z6M/prtFqS3iB79D4IcC69UKo4y1RReaU68X
         qAhDxga72W17yrOzyKpeb2hVIqI3yTksolUtGpLPu6ZYcHVwhj2/s+URUB4c0hhm4R0I
         PGoUVoxDl1JUq/Dr8Tot2dfp1Hle9jmfcfsMrxYcLIwkjWfEwBaUDvoNCqAaB7wgH7nK
         64NoXLCMbsjPFhNCItWsNf/x/8LuIDrgN8XRnXEaWp7Ba0xe25BRxnyqhwuGgLpMjA6p
         xYsA==
X-Forwarded-Encrypted: i=1; AJvYcCUz0Jx9p0P9VaVBKMvW2wFUrqgnCppg0Bnf/CJQz4j17UHEDj9N4af+saWatbwkmKTb9GKWlSOm6Zmzs68K@lists.linux.dev
X-Gm-Message-State: AOJu0YxwYQ6DiSyF3rBANH7Qnv3GguTJSOMzyFlKiJp9sSt5bULdPIag
	291LWq9nV1VIDYrZZxfkq+OfILJclTTqAJfKFQ/e5DZBdbYN9hJf65KqLN0ojrbabC9Il5EzaSD
	EDbadO4RjaWmALX4C7nU5tt/uoIBxZng=
X-Gm-Gg: ATEYQzxPv8yj20n89UO0eggV3eegpgeF34Z+1WAxf4BuXNOGnohgOcHk1mOvtS7rsX4
	jo0/+1VYwSopdXB3pT51HXqwDnyjN62/rtTatIYaMSL7XhyM3HMoniCg2QV1Hm1h4+ao4+qaUvT
	sHtnPa+ycM4skfS3ylGjrHNMSWYWYFEx6pOAudBEJiS6QQNZXc/sP4rU36u1rlniGI+uL3iHgBX
	i+y3c77UzHJDR5z5VYkt2L+fafmUyS1kZIggWk/xSVwZEp3OLLrDVuA5l1VrhKmutNPTS00jWJt
	bvaHO9XEmE8gKBsp21/fK2P5xgHf2aP2/sURFAPOpjQamT7rNHo=
X-Received: by 2002:a05:6000:1a8f:b0:439:afea:aff2 with SMTP id
 ffacd0b85a97d-439f820514bmr5953661f8f.23.1773242552459; Wed, 11 Mar 2026
 08:22:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260311151302.105992-1-kalyanipatra2003@gmail.com> <a26ba4c7-05d9-4df0-b4ec-1a82d2df075e@nxp.com>
In-Reply-To: <a26ba4c7-05d9-4df0-b4ec-1a82d2df075e@nxp.com>
From: Kalyani patra <kalyanipatra2003@gmail.com>
Date: Wed, 11 Mar 2026 20:52:20 +0530
X-Gm-Features: AaiRm51rhXY5MAbFa8uqzn1ax-wqEdiLngJBt399mw_Pvps2VigEa7OVXsC4LME
Message-ID: <CACjYBviU6v_QbpPy0zhfpaBYMoQrO-pBNywzXZb9cHgerCCGBw@mail.gmail.com>
Subject: Re: [PATCH v2] staging: atomisp: fix brace style and trailing
 whitespace in isp_param.c
To: Daniel Baluta <daniel.baluta@nxp.com>
Cc: Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Andy Shevchenko <andy@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Simona Toaca <simona.toaca@nxp.com>, d-gole@ti.com, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Daniel,
Thank you for the review and for the clarification about patch versioning.
I will keep that in mind for future submissions.

Thanks,
Kalyani

On Wed, Mar 11, 2026 at 8:47=E2=80=AFPM Daniel Baluta <daniel.baluta@nxp.co=
m> wrote:
>
> On 3/11/26 17:13, Kalyani Patra wrote:
> > Fix checkpatch errors related to brace placement and remove trailing
> > whitespace in isp_param.c.
> >
> > Reported by scripts/checkpatch.pl.
> >
> > Signed-off-by: Kalyani Patra <kalyanipatra2003@gmail.com>
> > ---
>
> Please keep in mint that when submitting a patch you need to start with v=
ersion 1,
> saying [PATCH]... it is enough for people to understand is v1.
>
> Now, even if we did an internal review until v2 community doesn't know th=
at and you need
>
> to reset your counting.
>
> Otherwise, people will ask you where is v1 (plus where is the changelog f=
or v1->v2).
>
> As now this is clear, I hope community can ignore [PATCH v2] in the subje=
ct as git tools will do
>
> when applying the patch.
>
> With that,
>
> Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
>
>
