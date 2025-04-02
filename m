Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3FB5238D45
	for <linux-staging@lists.linux.dev>; Wed,  2 Apr 2025 14:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743604631; cv=none; b=idR38R24aQxYD2ixb7WyS3LULO05GCe8dFAXiTGiddnTjaHNsALhZBMLB95Nrzd6E+ld91y/W3rFV7WoUVmc3mycO7boqqHKHO45fbPRbAESA0Jya1gqz5KQ8LyUKLFIOg/4uOsv85KIF3XWZrp6VWQ95zMEt2FvWmQDx3cD2Ds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743604631; c=relaxed/simple;
	bh=fujc+sesAjr5IIZE1HuxIUhTSSC46ThSreyEPcnf8NE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=apXDaKb5BebyrYOkbncKZomLRYaF6GfpcIDcdKvVKK1auGieZhHPyo5B8Xoq21zsBySTXq6qTOhtO10gCoEpOqUhNT0e2pKbmyB3nNnpQqQ/QqCgcTtnHjCMftWsFvTgSVAmSHqwGIMCnuoTuR+7r9eOdI8LsiJV3jUOPQSRnL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PuWfI67Z; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PuWfI67Z"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ac3fcf5ab0dso1102207766b.3
        for <linux-staging@lists.linux.dev>; Wed, 02 Apr 2025 07:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743604628; x=1744209428; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fujc+sesAjr5IIZE1HuxIUhTSSC46ThSreyEPcnf8NE=;
        b=PuWfI67ZNPmw10ADnefQ7LgZz0qNKMsdx44wwzSc+nvDnuTZPM3yWo6W9JaSOXu9Lk
         DUcdKaR4ssYx+GQbCAeGUdH3LwPQm+qJoi7DBpy/d5tIi7Lt6Xr2uK0TNNTfnml3KVnc
         lDQ0Kbv3fqhdoz6T99w4V5sICyCtOyA8cOXEfakyjg1HlkxhpFwJECKLH/fE3XqpyqTO
         Sq2VADMeGS6TpKB3GDNdEswhyCTAHEGV+KYFSJBdv+EnAeBaBbNilw98kcunzldrBs0x
         b9gm30xr5egwMfp+RMiMc/b73o43sU1jVyBA+4C/xJgfhu6Agf1h5Vjw1l/so2JHBYU5
         S+qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743604628; x=1744209428;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fujc+sesAjr5IIZE1HuxIUhTSSC46ThSreyEPcnf8NE=;
        b=PMDlidyf1NYG41fNMZyAaN/yxbyPUOwtpFqXU31ry/8FoRK3Yb4ZtYAH5ew5xmKY5Z
         syg8kDr6/gJWHFISARSZaqrHKYWB2a4eNUulJ117KOsHQV05i2OADC5iZJwpPqtw4lCX
         U7ZzdZIIwDCYGrYXzs8Zv6UWEhmJO5l5SQOmQ0mjQAlztOtMTAwWHaOPPITZmrZzcPz7
         I01hsh47wMQzKTSlR0whhkokYnJnPwbmIRl7XQxxejVhAtR+hR2/N2pVYuhJhbJmU+YH
         xBKFja29IUWb4i9fnsFt3sc65o7oC0PGTgUg7yY4tef4GN6Fdq8wN01t+xJ50uQzBPoV
         2vCQ==
X-Forwarded-Encrypted: i=1; AJvYcCW5Aw+ytnHqRLHu7EIP7xBIt8axsxyETcyTxR0RuWLSk7oQm0cRJoXcgff4rKpk/a+KEocd4LOcX00XAw6k@lists.linux.dev
X-Gm-Message-State: AOJu0YxYAjdNr5EB+S+XFMX9d9zMlbjXV3Yw+QLppyYFjRSxg9HrCOzV
	O5qhonGIx/W+4vMvvcz8AYrg7Y5UJtXdd6SaroJuErkwseuhBETuS24fsyIyTrDdt2q9dKVIzr0
	5OSMJ5+VH+opglH35DHOKjOD6Ks0=
X-Gm-Gg: ASbGncsmSNrTZoNTKngnyUEFs1Qr5/jh9JOPXA40WMlPSEtcfH40p/EDrsPbeqUZyid
	h5fCRx+RnpA/AI60wVT+6Xz1UfQ8XU/Q3eQ59SVP+jbWie+jHhsiQejSl44/Y3F5o4vvtJVIE3n
	ziTZqf7rJ+4M90MI8J+RmF6JY+NlGT
X-Google-Smtp-Source: AGHT+IFocfbGvbzRK8aJWLdh4mDxaWThCgh1O/7EJbYZA2Z5T7PzMh3BE0hV1pYCJ5WPoTTREpFt+GzoE5do8798C38=
X-Received: by 2002:a17:907:2d8a:b0:abf:6b14:6cfb with SMTP id
 a640c23a62f3a-ac7a166da7fmr220944966b.5.1743604627939; Wed, 02 Apr 2025
 07:37:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250402135001.12475-1-gshahrouzi@gmail.com>
In-Reply-To: <20250402135001.12475-1-gshahrouzi@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 2 Apr 2025 17:36:31 +0300
X-Gm-Features: AQ5f1Jo4kfDBVwVLmOzNt69eaOoDoSqPas9WlpNS1Q_ZWTK_Vs669mQNNkUol0A
Message-ID: <CAHp75Vc1nB8cDN=OcCJgeti3YNr0Dd4yeKgeSBvR95piLao1rg@mail.gmail.com>
Subject: Re: [PATCH v2] staging: media: Fix indentation to use tabs instead of spaces
To: Gabriel Shahrouzi <gshahrouzi@gmail.com>
Cc: linux-media@vger.kernel.org, andy@kernel.org, hdegoede@redhat.com, 
	mchehab@kernel.org, sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 2, 2025 at 4:50=E2=80=AFPM Gabriel Shahrouzi <gshahrouzi@gmail.=
com> wrote:
>
> Replace spaces with tab to comply with kernel coding style.

Still 'tab'. please, capitalize it to be 'TAB'.

But wait a bit, the driver maintainer might do that for you whilst applying=
.

--=20
With Best Regards,
Andy Shevchenko
