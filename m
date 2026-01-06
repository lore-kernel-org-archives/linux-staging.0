Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A6671BBBE5
	for <linux-staging@lists.linux.dev>; Tue,  6 Jan 2026 00:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767660167; cv=none; b=SKchRf+zIKSBmPPpdwne6onbpgER2ZvjaP23v84DQ4Jrwk2lNxbYX+laThDBrIg7Vz0y77zFWkAdLhjBxdfkhDsw1Uq81UOkdk/aAUOm3qKZsrGqswhRMafb+13UJrPqG/Vx8sJJ4C42V+ZJdV+37QcRWdyYt8cfRklbCCMgGKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767660167; c=relaxed/simple;
	bh=QrzGH0rfY1PbzfL/LCC45gDfqDTjAUZLlnoS+Yp6OBQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HuwXjXcoKlznqItj0dB6x3ZsSEjX9TnBy66xRL8M/yb3f7A5vxu9ezAl5C6DNVb838US5W/8bt5k1U+YNcWPgZjbP/sAYoXR85zhDRGzLHfSi4Qtlkddx+H1uCIK1nWySp/hfCa9HHc339lefTOWKmqdIq4g6427gX4Y5USX8nM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AwvAr6kT; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AwvAr6kT"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-79045634f45so6612077b3.1
        for <linux-staging@lists.linux.dev>; Mon, 05 Jan 2026 16:42:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767660165; x=1768264965; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QrzGH0rfY1PbzfL/LCC45gDfqDTjAUZLlnoS+Yp6OBQ=;
        b=AwvAr6kTaOdiqLE8N74JUf31119QV46biwNdWac3c6iQhFP9k8lAbi74EMoQ926gnA
         UDKh7m4Qm0Y448zDMQzjHNZtclVMR6Qn0hp8tHgu2s7nrHAEnxfCS9n2X++UhsGMIyP6
         kOeE7iPyiNhoD4S4BKbUzYADbHeJkYaolBL+bEuOu8CwFPf5FjW0avVAgBCUep9493oc
         Rw9AgijKLHzYRVC1l+qi+B62nLgO31yCqBiW6tGI9EcUCXykJLcs0g4OB5wqacPvz4FN
         07DQsj80aZAm8inGs6GP/kU1D9TCjrLN6AZJZ7ivUjqze+VNUu1BIuOarh86pSFyKLWN
         uJlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767660165; x=1768264965;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QrzGH0rfY1PbzfL/LCC45gDfqDTjAUZLlnoS+Yp6OBQ=;
        b=lfd0bfxQyBF6sHHHiHZMdCTPTges+vzBq57w5QkoqgPktPoluTPB+e7J9yP+4En5MM
         ioRRbZaLeuV6rRqCphTV4dc1Ch2RqCSL+xTIKCBaKYTQQl7F1N1YeYcY9DXnDdKW8wUw
         6i8wIuTKFma1ARQuaSDuTV+1lPhIwmuZqNX9nInotiK2nXwRzjQMMqTvoKRj2Zmp167t
         ZXyPOBJI/6+wZ+XmzesiNuw9ndCkd2fgDCOQZsIwhKrKm7jRPQRnzpoxdl4ezmTeX420
         Qi8MzTp6np2PGchEzWUqFrz9vjT2yOAxOexFirnnwt76FQ1UjtoWIsKYCULT0VIYByIl
         8/5g==
X-Forwarded-Encrypted: i=1; AJvYcCXyvS4tXEqRLp9y18iDbDnrkixjkYx4vPcjHapTehJzbNlZoSvR6oo2c+yA5+4aJuMTtWImm78T/mcu+EmI@lists.linux.dev
X-Gm-Message-State: AOJu0YxQNT03GQ32GK1d6eJTQ/3k+vsTN5srJEdsy0RairidP04UOcXq
	N6zYyj5rcd9/SpTjUT32fgt4VyIK1VsyCKMSuR8dulNBjqq6tS6eFGqUJ0F1XalZr+7hqjaCcTi
	gaA4eyZ++BY1dkMei24/XJnuHwoSSh1g=
X-Gm-Gg: AY/fxX4MfB2sFsN5SwJAkQJQB+W3zShQ8+swp1Pczx5haUiXzBYVuU0IEGc9vL8d2IO
	NaJV1QgfIr0oBUB9lo/7B4+811NS8oi0E0u9jmnfgz6qlvd6shi2oXGjNl1hPqBEAhxokISD0Pl
	SCOSs2HZYy/XMWMZZU+khosESGF2H4QC2ny+5jrTDApGxca9oi/nbieiScxFpIxxtZhjm7cJOrK
	Y+PBYD7eEND48y2yh0KID/za8wUrrhke+c+jnDaM+n46ZnSHyuxWsdV2VephuBWfJO8ZKwu9JZO
	g7YXH4W2
X-Google-Smtp-Source: AGHT+IHL3mPJHriDypHyBEX+RJjLxwusS7faLWaHDC2qzlYJncxpcgVjuftmU+FyBZTns1j64beDONSID2hEF9V6+GA=
X-Received: by 2002:a05:690e:4144:b0:646:68b4:a7e with SMTP id
 956f58d0204a3-6470c83e595mr1080386d50.18.1767660164612; Mon, 05 Jan 2026
 16:42:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260104110638.532615-1-sun.jian.kdev@gmail.com>
 <20260104110638.532615-2-sun.jian.kdev@gmail.com> <aVvmr2qOrFvoEKGV@smile.fi.intel.com>
 <CABFUUZFeO51MW5n1uDp0tcwJeJvgxDRxY3rDqkj2Z-6cO23TwA@mail.gmail.com> <aVv_w643SMuIELDE@smile.fi.intel.com>
In-Reply-To: <aVv_w643SMuIELDE@smile.fi.intel.com>
From: sun jian <sun.jian.kdev@gmail.com>
Date: Tue, 6 Jan 2026 08:42:30 +0800
X-Gm-Features: AQt7F2oAGQEcEWE-V0GUrqr8ClkpEqurhwv9xHbSb0ypc4-wA_p502-iDKi-NtM
Message-ID: <CABFUUZH0pxar-tTK6LA3j9x_eokLK=FW0B6Uej33s=2YsgOcgA@mail.gmail.com>
Subject: Re: [PATCH v1 1/4] staging: fbtft: core: avoid large stack usage in
 DT init parsing
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Andy Shevchenko <andy@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-staging@lists.linux.dev, linux-fbdev@vger.kernel.org, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 6, 2026 at 2:15=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Tue, Jan 06, 2026 at 01:00:33AM +0800, sun jian wrote:
>
> > Thanks for the feedback.
>
> You're welcome, but please, do not top-post!
Sorry about that - I'll use inline replies.
>

> How can you test without hardware at hand?
>
>
> I already explained in the response to the cover letter. Please, read it.
>
Given that=EF=BC=8C I will drop all the changes.

Thanks,
Sun Jian
