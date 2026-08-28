Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A1F2451996
	for <linux-staging@lists.linux.dev>; Fri, 28 Aug 2026 13:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787923518; cv=pass; b=DCV6WmEmIGlKBK2z6m0FZoCTe+HIOIi/FssSUFn8DcVrOj7FgU9HwwTXVGkTLwIRwug52huhWYWLPN8fnh2st2mIxcD5uSk332KFDT7rwguBE4hAw8N1fHFECaI70Z3NRqMe3JSB0SYvjVgGGVR9x9I54ob/owrlBrHfEI1bzMs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787923518; c=relaxed/simple;
	bh=jQCuxAKLPuTjC4o1Qbb81zb0BP3Q1HL9exaqQR2Uj0c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Xj65qQWqCfAfoNrQXAEXWOD0CI1nxXxu5kEWJRXTuM8ieZwFNTqkH+jm4jOD7A89KRqEqoqO4I2I/1rKnsCj/lrezLb7H09wANwEFYzhMjMUemKsEdgk49qQl34F9gYTGghcf5zR339zlFcXL4rNita11AkgJVlXJb5oGaZWNuE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ieLRMrDe; arc=pass smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ieLRMrDe"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c2531f453eeso161787266b.3
        for <linux-staging@lists.linux.dev>; Fri, 28 Aug 2026 06:25:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787923515; cv=none;
        d=google.com; s=arc-20260327;
        b=Zl7aHIH4GAJZA6+/yDxTKrvITRyekcmQCy29q8UZBoEmi3wL1zK3SkJHFNXRrrHAmT
         RthIWFXd2oEPyuTzGq/DuV58qu80a9kiiYKQlDHRw1RDMxOfTJVGfrm9MouWyF0bA4TK
         SVg8PrJL+gvP6Hvk6VJhQ50R4AG/n17c/AKh3pfr8UcbxhEjoTus6F/vKp2iojrMi6vU
         CFmUBmVRiZOsXZsFrAZpRx635oYxmUnWHLwN8w/0TFq+W0rXThQfSz3pvRJUCuaENKaq
         Tk1HcqUJXbOgY2SP/D3coN4OgrlvNZQ4RVV+k/w7lzZKYGDTYGh9yTrEkyLouwSdzjo0
         wpcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zFUxAfXixoS8jLZk5c6tfvBN2oNTN504XnBGH1O9OrU=;
        fh=x1A+2NFKHXQxXmjV9B+DkXcfopiSDZ7t7r35HsHsOcU=;
        b=fHfLJxbmYJx3SZ7IY5sxcg/Va0z1DwDTCbHWb7KreEGFcwnWh+ncO+TWzoVXAV++s0
         0IHAjyB8XWn27jmGiZRhrByReTrbhuExrUIur8OtN55ky1s2jdYR5H5nXbupmDegmFwQ
         58tgmoJQQXEJ9FDoZ0yyefqC6LvrefKGgcAy0VqZbDMpKJ5XvBJXQAFbLt7P8qGQ2Okw
         NIvoGBxpMp6U6DOFMJ3ZVLww81yj1H0MRrWVthPEN9Pgami2dgl1W/6JrpkVEjW8k+Mq
         U3wqJkWK2o6PRyZaeDwh9wBTVzVZbffOB3gGNIQhsF6dhDucCZqppU++pzFLqV0bdMbH
         BWNw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787923515; x=1788528315; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zFUxAfXixoS8jLZk5c6tfvBN2oNTN504XnBGH1O9OrU=;
        b=ieLRMrDecibLb6TF0OpWGFNkw7hxUQK9tVlIwc3zW/M4ca40O2+G0D6edJw8U6kk6T
         OSFhAvOfwmAsSULQSvVBxHS4EnjB/ZNyO9DjEX3cW0MPXNDzhWQXF27CDScXv82Rif1d
         rvPMpZ3wGUnHD1ghjW4Rx2sp/xmo4GGhKFdoHiTHv+EfhdYUnk94k8uf9jN2ZEI6yy9n
         2Mkft0jlFQsrGY7JB3z8Y0SP6Pon+bunozWYSGNDsez380xMWd1E8klNAR7qAda1Mbtb
         HndavhIH/8uQCveYak9hKU+rvw7koZFQricbEqbimoxDBzXadu52mvdXyTdztnT4s/SA
         SKEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787923515; x=1788528315;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zFUxAfXixoS8jLZk5c6tfvBN2oNTN504XnBGH1O9OrU=;
        b=HyRiKJSztRaA8pma2aoPrbGTf2b4UlZbPQ926IKOm+g339AbsH8TxvkPZybWQ77Net
         7UJAKJs3D/iAC/QHXfNvIIpfhWGZ5CYyo9S0Yija0ovD0QjX3ihL5XItIyZJC/btDFt2
         +9RMcTEYOlx82sqK4pk3u2uPdSMVOQmAcyIIHGPUf8S0cfKVFeJjeudP7XPwO/GulppI
         m+pW+ofy8tbSWYQ+Uf52H4J+nKpJVlaMLVb7nU1Z0UngnwrsqYJR7+VZRcz8nPaW4j6t
         8mG2ZLyqtGoZN6D3LHf+NczsRjfn+8esALOnOzyIQsmHPBPNnyDVYn1zlyOAUV5E5JMV
         3WBA==
X-Forwarded-Encrypted: i=1; AHgh+RpSDu9ekDObgsochkwY1aup/PX8Ct/UHfQdEMMCl4yGt1nq2GO6T7YMophGwf4xT0ta/DT7uUUykuAAwVHK@lists.linux.dev
X-Gm-Message-State: AFuF++k3VxJcQUOJJ191/SUFh6n4VV9wJOmYLkvUZ+p5IUzSQhLQb/tB
	pLNUvOGOoWARJufVjMn/S8+fvdZUtchiurz/Ya76USQt6KzfyrIYT9F6nXt8uMXGhFIJKHvovtL
	9MLeKIjc/dUTOD9ZcW2fXttg5ziv9kF0=
X-Gm-Gg: AR+sD10IlvvWrY1RMY5s1jLAO/x524CCb58gKtn6SKkoi0mE4JmLbqeciGz/JTAVjT9
	Y9/Sf81C+U7fhiGdNDKTprgs9OqlnY89ig+HeT0sTshUX10voBBca3WotEtfOH1ttrb0srX+kBL
	Az/I5WvTbgZnrfl3zAIZ20yEjnYuvws7VJ8zOPd7at90xFDHzlqMXI0XfamcZhUoamACZenwIeu
	HG3ln0R1N+GgIKAFYtNmlfXEL9OOxyzn20UGlcbdr1na95qhFL9AGLF8wnQGD4TxWactbaMgUW3
	XCW9l2VHEpF0HFYEEWEe7lbgwI/kI6ZuPtTPwgNF50/sMnkyRmhVQSP0uZMYbeTrzA1qH3Y6y//
	z+5a4Z8piNlCjhUWyel3NjuKwZ1Z4SEQEIICx+NbHAe1lIVWvvaUTtpDBoC43D+XeSMm1EwkVfL
	KMeo8CaduO0QR1wDB8cbebF7t7+P/QAVZ+TS57989nLw==
X-Received: by 2002:a17:906:1004:10b0:c25:5faf:b22c with SMTP id
 a640c23a62f3a-c255fafc38bmr250324266b.21.1787923514497; Fri, 28 Aug 2026
 06:25:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260826132256.3343451-1-mauriziocasciano7@gmail.com>
 <20260827181756.2430054-1-mauriziocasciano7@gmail.com> <20260827181756.2430054-6-mauriziocasciano7@gmail.com>
 <apFvSlkU9V1f1mrZ@kekkonen.localdomain>
In-Reply-To: <apFvSlkU9V1f1mrZ@kekkonen.localdomain>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 28 Aug 2026 16:24:38 +0300
X-Gm-Features: AcwNN1WSOvUbreDrgg0-EtCl4ZwrYgBo4_tspVEmoj38PFDJAeL2DKx2J3CIroo
Message-ID: <CAHp75VfOba8pSw-4NhTOyzJxjEB97qfE+w+RjXEtdMrNEZMOOw@mail.gmail.com>
Subject: Re: [PATCH v2 05/11] media: ov8858: Add INT3477 ACPI ID
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Maurizio Casciano <mauriziocasciano7@gmail.com>, linux-media@vger.kernel.org, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Bingbu Cao <bingbu.cao@amd.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Nicholas Roth <nicholas@rothemail.net>, 
	Andy Shevchenko <andy@kernel.org>, Andy Shevchenko <andriy.shevchenko@intel.com>, 
	Hans de Goede <hansg@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jose Maria Martin <jmmartinf@hotmail.com>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 28, 2026 at 2:21=E2=80=AFPM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
> On Thu, Aug 27, 2026 at 08:17:50PM +0200, Maurizio Casciano wrote:

> > +             .acpi_match_table =3D ov8858_acpi_match,
>
> Please use ACPI_PTR() for this one. (Also see
> <URL:https://lore.kernel.org/linux-media/20260828084328.257703-1-sakari.a=
ilus@linux.intel.com/T/#t>;
> this won't produce a compiler warning then.)

Why?! What's the point in having this?

--=20
With Best Regards,
Andy Shevchenko
