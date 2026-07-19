Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B56B35C180
	for <linux-staging@lists.linux.dev>; Sun, 19 Jul 2026 07:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784448001; cv=pass; b=upHvVDup7vaNlMzrppT9GvhaPM3QsbC+JkXdaM5X6Zv97TVD9n8KcGRThrARqQ36iaCIGFAoxCCExsMBllBumhwu9keig3NH0BYdAMHI7Ui2E71PIifQlsZRL68uk20IpnSlTLnDNlXfp73TtXymmbHFLIEF81ogilTorFrX8yA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784448001; c=relaxed/simple;
	bh=KS1bRvm+Q9h9PMyilTvbmVITAjaqgkwJk0v5BBO1EmU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bmpnJhs4gNHOXEKgWEGYVB7j96XukpoTyIWP/WfLe9zWOYBolFLUGnV8p5tYZqvVg17x5fNpn1rmZ1jIqvPZy0FwLU2fE1Kxn7wCkUD9lM/llJBOP/LaBBSIoIHb+z8/BJqDF/Gse6wMF4uboUTp+73ZMVcJPgndHHtryG10tXw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RCSS4vE1; arc=pass smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RCSS4vE1"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-69eae037da1so945224a12.3
        for <linux-staging@lists.linux.dev>; Sun, 19 Jul 2026 00:59:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784447996; cv=none;
        d=google.com; s=arc-20260327;
        b=lBnBWyFawPfdW3UPuMMClzMofrkLcb1xNznjvhuOFVrqgxN0rVI5Htsh0IUSqJH0Sx
         rtmMCyPzjK/hyEwwUMjaOQ8QjQjLoaFXg/uzA2BC+kkPBoC28CVeDj1TQYBQyG553gjC
         Z0XtOiSRN34b3R8iDkWBt/e5PllAclc5OX9g/SBB1iN1IRsG1IcHpE2sVdpjwD2jKYWl
         xHdPk7bTylY3gFJrYMq5VnuxTCk7GVW/PesJEdywYU1Koof1MaOxu32gPbEyTir30aPt
         awNxq3/FQbHqgplsznlhtIicDqvIePQgQt8IzJKRb2m3kideQezBRItX9tXQ3IYWX97g
         +xGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KS1bRvm+Q9h9PMyilTvbmVITAjaqgkwJk0v5BBO1EmU=;
        fh=sdvv+i61vhF/NFWu4P7DX+ANVvCSrIkBRJyZVTCggmQ=;
        b=ST1dB14Za3nwA+2BydUv9QdKxfBx+tU3qqcxkOzbVGaHsl0HEwwcX2b1LgL6YhS5q3
         662sN1Wf/k2AenRTi0kFzZ/Ixnt2BLbNPgOzzHu/caDZs+elcJzCVgQ6lYpDDjrK8I3d
         yTZfhRaWC2pUExGrNYJvheMV/ANdj4Wb5sUpb8BwW6+x0sxSJ2jTERPwe2rGOBP7drwh
         KC+WF6a5QE9PU1vGx2ZS8opgr6pOG3/NwBmd2MzjPjiPU7Xcn5xhc4N5mWY32jhC/sta
         mh6g+sQej4eYB+EvvZ9CPMcKB6YjMdEWrWv8KR+gWDci0Da38qo3Xo7ab9qqixrtL1xs
         upsA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784447996; x=1785052796; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KS1bRvm+Q9h9PMyilTvbmVITAjaqgkwJk0v5BBO1EmU=;
        b=RCSS4vE16Yexp2Xiiac/7ulJK2kDcx3/FWtnsXp3C2CRZ0Xz/AJMWw0aYegYvF2fQo
         8mn7QOi4ES9q2Gr20kh7HReMcFefboZtSAgE1FlXIyy56RZ6IXp+YNMMBlvbVG/pSL3l
         vQOrLneKCM2VBWtVYVL2bppAXBksOKajmZfnWidfyU8bTQuFBO82g7O+iqfIkgRdQApV
         aDikSI13XRMMDMFV3jdjcDxHj8wiHGuirYRqh/h4hznDOYcma1XsiojlHRFAyGkQnl37
         RmXNDMsImB63Uc+3+HVUQmCyeQRduDZy5Y0p3n2DA6SL/FEMoRJP+qpTfGKSNGaDgh2X
         dcXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784447996; x=1785052796;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KS1bRvm+Q9h9PMyilTvbmVITAjaqgkwJk0v5BBO1EmU=;
        b=iUF61jA79uOs9ndecVF27v9zVIkQ6ngfOuvJXnZYGl3wor7gZk0EgtxaTB44ynLLJL
         z9AOHrSTR2f2FaQP8OhMhunbcyvC7dwGsfzyQrKToJpEDwWbX4XxZBV6JiQ4PHXik4jr
         f+5n+2fZmwphGnxdRyIZDdVlJVEbZOeMyYD491C5WvnF0cKgV5rH0tlCK0kEqv/JnJCE
         BvtuckzbHepVZ4CN3mIqLPsEDBTLPMVy8BBGS+U5qG673H/7K9RaKHjEkMWD262usgJ0
         0wkqY0zHguqRtm5X6n+4g1xaUqAtS/5oU3HMBgK7FMMjV2Bb2qHhT8IkwTeAIBALIH7H
         hDzw==
X-Forwarded-Encrypted: i=1; AHgh+Rq99AktMjSlAFbkvttaErF/BK7VxmCeWu1+SsVDAH6jUO37E1dzzKTmAIjqBo11luLrgnoNE8DNBEAPn2AJ@lists.linux.dev
X-Gm-Message-State: AOJu0YyisTVBR3SnamnlgCHRvORv46d7dZ7PXLmAdxSe6FTkU6X358Fb
	vVwTHGytDzSMUqIopj3eyC+EyncSiBWz04XaYab6F8Ld7AD6FKJdu6wjsawvmd0qMxqzuiGtPtY
	rGVek9IDX39d/5Vi2MTgnL69D1D1QKmY=
X-Gm-Gg: AfdE7clW63WM4jIEqmAyaoRZYZtA7OhRdEUQmg7IaTaQ9b5ze6a/oCtsekkdZQIpFry
	ny6pIXTKTrRF0pvpjETP3JI+qIwvOegV/58HLbxpzOs2gUJn1/G/vyx2udD6zXFyrUjbuqfzqIt
	nMo03AOEhjlfebWMDSGNQO6bofnThqHxL6Ls72ztAch9wvRGWEGrcFyKSLyNXuT21VPP6Qp00Cb
	8Nu4MIPngdhxErVNAjPyojjNQ65oh9OBPaSCMt5c0MogqmxEcrkO8uQSoSv0fcnkKbWMPgWLTX/
	GTnMFGh3PmAYd8v1LizQIZ0pO8MufnQJpQn93FltzIKE4KfXZS2ndqGen7SMxqjHqiZBB/fhdLW
	c+PhiZnT8WubxVn6G3e8ByG25ZQZYr9HFmXD8QjZFMt2SPgQ=
X-Received: by 2002:a17:907:98b:b0:c15:e5f4:63fb with SMTP id
 a640c23a62f3a-c16b47bc68cmr415821066b.59.1784447996091; Sun, 19 Jul 2026
 00:59:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260718174203.21591-1-prajvalchaudhari733@gmail.com>
In-Reply-To: <20260718174203.21591-1-prajvalchaudhari733@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sun, 19 Jul 2026 10:59:20 +0300
X-Gm-Features: AUfX_myK2l8xlmeaRic9whd9oSfhI2t3UA-n5OuABKumNve9JlIhXpC-bHdiO9Q
Message-ID: <CAHp75Vdxt3byDm+MTXbUpRUiqxv8XGwok5bVJGhdSb_g94wZEA@mail.gmail.com>
Subject: Re: [PATCH] staging: media: atomisp: use sizeof(*pointer) in vzalloc
To: Prajval Chaudhary <prajvalchaudhari733@gmail.com>
Cc: gregkh@linuxfoundation.org, hansg@kernel.org, mchehab@kernel.org, 
	andy@kernel.org, sakari.ailus@linux.intel.com, linux-staging@lists.linux.dev, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 18, 2026 at 8:42=E2=80=AFPM Prajval Chaudhary
<prajvalchaudhari733@gmail.com> wrote:
>
> Fix checkpatch style warnings by replacing explicit 'sizeof(struct ...)'
> types with 'sizeof(*pointer)' inside vzalloc allocations. This aligns
> the code with modern kernel coding style standards and ensures the
> allocations automatically adapt if the pointer's structure type changes
> in the future.

Unneeded churn. Is it for some kind of training session?
There are more desired activities that newbies can perform against this dri=
ver.

--=20
With Best Regards,
Andy Shevchenko
