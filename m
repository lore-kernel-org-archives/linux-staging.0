Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBAD525CC54;
	Sat, 21 Jun 2025 18:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750530320; cv=none; b=QhkBPo0AETW7ZJhLxH1sOv6yAoHuJ9D92NFpOMuqKhhLY7wqIw3iKEqg2PE/sZ9zdi8gdSJxh6CeqvVCY5XBtAu08EMXS//8Ek7Jm+xOua7SmFYvwG5+Fk7dnvfPt5T7YQ2U0CLrdyGCvw5L5/nTPsli51pTnyYG0eRRHoEfNr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750530320; c=relaxed/simple;
	bh=WXDAT0p5ZVcXK8GhqJvWCQLjsqE9/G3NdrAazvXFfmg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ay5ENtM2M9PNBAznvSuGAmoZpe9i3uFUeHGmoLCkJqPhOMcyFCnj+i7zCJxmqTEnN3jajFRVdRgEEkdaUQfHMzEgOLAaqNF7VCHDC2YDtWWVarFR4rNHrG1wfUq85tIWFC1QAdXdJCH9cm68TnawtTOttQZD8IHLks3r+CW4nIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ckKgFrNn; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ckKgFrNn"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6070293103cso5299726a12.0;
        Sat, 21 Jun 2025 11:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750530317; x=1751135117; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kw9tbk5Ggbk3BxQq8PGaG2PHCPfTa77ZcVZchgZ1Z+E=;
        b=ckKgFrNnJmW7I6gHs2QGmm5BlO5THSsYQ3kAoZZ2pz2gzXCqPuPDpT9dYwwxHgeMWB
         MgIVpGRPP72D3NvKfwaTF6kkEHv1EHXZsL1UcInpZ9tg0jgx9YAeVQoF0HDGmaBo6U5B
         mNGgkSTpQqilQvzKalLqPZJh3vup5IiTYfpIdkEARihi6dv2hApsgR/uqjnQb857Qxdi
         s8Vh/gQq7UNAuaCs/gOF28b3gR3JD8BHX+4iCdZYj3tXPFruAXIFWHvJPSQSTDtW/v3c
         PsKYprK8u78e+QzCEUmDlBvaqC5WkDglcdNWzUK0cLhMNi2Kj0sq/Db+0ZBwxj/aym/U
         B8Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750530317; x=1751135117;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kw9tbk5Ggbk3BxQq8PGaG2PHCPfTa77ZcVZchgZ1Z+E=;
        b=XBynYfq5WBM+BHLn9lT7bHyCoz5vQIo1mAtw9Gx4m3/PfpCEKr8KJ/JmvclExWpihB
         4J+9ffn+BkfL4ctT5qjJDcggC9XiDoJYIXQtN2bFKazNqxs+jzNgzNwCOs9egqRSf/fb
         KNINRTj1bIJAFmuHLIulWptD0q53HdZwlKj7S5svl0cn1fJpF7f8hiniA80A3ptztEnA
         6qJeQKAagq55y6L2+eaJWBkL9O2N3YcQPlWJcW/2vkT6xJY4uJoq6xtFgVmfqOlCxcQg
         P6LOy7We0fVoMTe+XhMfOp61pEFzqTYNeUG2ZL4wfMBZtTk1qb1JLR37D9HGDaJnAfcp
         3htQ==
X-Forwarded-Encrypted: i=1; AJvYcCWCJGRn8slPTIflaigIpVnVAWpby21OCyy7mGPLrhhz76lrBA9IaMrHdvh3gWHAffZ3QLaRDHo5rMkkDy6JQlc2GWvj5g==@lists.linux.dev, AJvYcCXmF7WVMsWs/2+sVLLevc9gaO/8HXYAKEhPXW3foFkRMwO9aYQTbbOLnDCi/8ZVSL/6ek5P9CiQ1QomqA/v0Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YxI6zTtkzQWupAeFFBjvMPkN/QqUNQTV3aC7XpxfaDkojetOCX4
	xr4BjXDgOKwiXogAdLDyeOV4VV8QvCSHJfA/FDxg86qdZngNZ+ABA9EX4Bdgp1BpWtYbM9m4Iwy
	werWqo2ajGBDhTniVo3zKwgym1CJec+s=
X-Gm-Gg: ASbGncsw+ufx3cNFgDKUsnS9EQ6wL/xyLtbPNU1hP3MH9Asp43+k5g96rmjG2UZddBf
	xqstatpU6ef3Te90ZkLG5OYobfWr5n17cvqf90B6apf2rBYCnqP2lr/yFmT6xscZdtvWcC1lm7I
	DXN0OB7P3HLrs+kwPpZPPXmJBk6se18ghbEl5c8/e4Y9U=
X-Google-Smtp-Source: AGHT+IHK2rTt5Insjp/jKKM1rSYBliXDNBFwgyaQDS2bk5jUmokhpWhRIGFeX45VfVac1F47IfDW/3qmzFO03lvfzoM=
X-Received: by 2002:a17:907:1c10:b0:ad8:9e5b:9217 with SMTP id
 a640c23a62f3a-ae057f653a3mr686464466b.45.1750530316842; Sat, 21 Jun 2025
 11:25:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250621062944.168386-1-abdelrahmanfekry375@gmail.com>
In-Reply-To: <20250621062944.168386-1-abdelrahmanfekry375@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 21 Jun 2025 21:24:40 +0300
X-Gm-Features: AX0GCFtrGpRHPsY7yoSy6uZXYIi5rESiR7BcUli23Y0PElYlMLQpvpeR40LW4SE
Message-ID: <CAHp75Ve3PWgkwncVv5tGxzjWkF+Nodtp=Q3dpCejfSRD1BFMig@mail.gmail.com>
Subject: Re: [PATCH] staging: media: atomisp: Replace scnprintf with
 sysfs_emit in bo_show
To: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
Cc: andy@kernel.org, hansg@kernel.org, mchehab@kernel.org, 
	sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 21, 2025 at 9:30=E2=80=AFAM Abdelrahman Fekry
<abdelrahmanfekry375@gmail.com> wrote:
>
> Convert buffer output to use sysfs_emit/sysfs_emit_at API for safer
> PAGE_SIZE handling and standardized sysfs output.

...

> -       ssize_t ret =3D 0;
> +       ssize_t offset =3D 0;

It would be good to move this...

>         struct hmm_buffer_object *bo;
>         unsigned long flags;
>         int i;
>         long total[HMM_BO_LAST] =3D { 0 };
>         long count[HMM_BO_LAST] =3D { 0 };
> -       int index1 =3D 0;
> -       int index2 =3D 0;

...to be here.

>
> -       ret =3D scnprintf(buf, PAGE_SIZE, "type pgnr\n");
> -       if (ret <=3D 0)
> -               return 0;
> -
> -       index1 +=3D ret;
> +       offset +=3D sysfs_emit(buf, "type pgnr\n");

This changes the behaviour in case the sysfs_emit() fails. Not that
this is a big issue, but it should be pointed out somewhere.

...

> +       /* Direct return of accumlated length */

accumulated

Don't forget to run a spell-checker.

--=20
With Best Regards,
Andy Shevchenko
