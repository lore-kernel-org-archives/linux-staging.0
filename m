Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B3A0EED8;
	Sat,  5 Apr 2025 14:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743862584; cv=none; b=WOhH6vGGbw2Uf8YzgwSsVA1ZHcSKmbIRVaiq8sQIQinn74iWc+gdnu0J77aLpHt1hhntOdOZZEQIPWxKRu0Sk6LUTNpeWexQ1nFx664TJtZz/kIPtocDg6x6cDAFv0714MFNUlpQ/+HucXjORuxuV0fCLlMCGGtXdvM6wn8qiVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743862584; c=relaxed/simple;
	bh=N8VFWuNLt0EzUPBfuJZdNKc5rTQ+suxpRg4mT0cMgpU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AnfCzS7DAhAJsWNi7+pFx7S0fUSe12U1iOLl1R/bBu8Sq1yEclTdeDDxA/dOFP6SAQ/fJIYUxzq8mA9XFeOjq2FMt+P/rWMu5rJ3GaW25t8oaAQQaCj4EP8GyZmtusq4PvHEJsJLN64IPlNP0B+ekWRwqAFWFCVi1ObqriijWDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YWdK9Egj; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YWdK9Egj"
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-52410fb2afeso2510721e0c.3;
        Sat, 05 Apr 2025 07:16:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743862582; x=1744467382; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XP90vPE7np1SiE0r2dwd1h544jc8ixLSRTP2M+wVC9g=;
        b=YWdK9EgjbJAOTZ4WCYbgudVpAzjRgNhjezOD46ntWzYjsn27ZzrhcPjHzTTbu3NOel
         NpH4y1ANHwbjzImcil2u03ME8bG7by4t/KQcaPOseCtdTNl/npj4yk6b2q0uFLtseVfv
         3v++yKBY8f7knW4qSE5OUhXL30NYWSf2Wgz9dmnezmyDX5Vswyjs5IJgGw8Dl6Imm7qX
         LN21a7CLBvNeAXXzlhuv5B5mo0qaTxCJUf4PrBhE+KujoU2+P4jQo9Qro1cYK5IuMVa5
         s/9PYqBQtjk9Swq/ymrv/30jM4OLGdgoQDpOtRl9DZfHPfQfw9V3jconVZGuT7jgwNFe
         4gSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743862582; x=1744467382;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XP90vPE7np1SiE0r2dwd1h544jc8ixLSRTP2M+wVC9g=;
        b=R6sogrQ4zaJ1k2OJk6UcIFrPhAWyQr7BGi0WmeflXWkXjDRaiOT6XGFJqZLBhvw7/M
         aiJ9MS6zza7/pXovWjn4evnd778JmZ4OqQytM+xhKlmO/yg2oRg279J4JCh6ldK7K6pB
         JZ0+S2Yb4dOXEMKhBRUIwuNfaV1NzPRpP6PmbYuh4PUUGkNOuoFkLr71LAhQBQToCiJz
         jwO9QUS/HbzbyGAOxk3YGsCObGgwdIDCcDEHBs2docE7WwSc/Ljrpuxcjf9GcUUp1fJ4
         AoO2gUDBCcZ9O+hv+FZRFNp2W5d2kvEgDEzj/K0pK66fm9fofP7X4TmMoHRn3i9kCv0T
         9RVg==
X-Forwarded-Encrypted: i=1; AJvYcCUxrzbshc7a5oYwxqsGDkEx7kXLTFaKBv2nI6VDJr/Fr4RM8aWo8FZw1ZDx1eMNsXmO7uPQeXRdtnrN6ft2@lists.linux.dev, AJvYcCWGGAhFCO7E1G9cHMFdSGU0dQmTLbtvZPrtmlU0FHrGi3AWAaPEpucJo1y7sT9GSnuDfTLk84eq6Ajx@lists.linux.dev
X-Gm-Message-State: AOJu0Yz+d38UxKSsDrRosHt5Frji1Z2ZD8vcvZOr5qzP7RgN0q0bggFU
	gYfdg+Pp0ZeT+A+lMW2sapLIiRXnT29kOJ7R6MzMymYmGKZUFjvwBiQQwxqr0IgnaJ9EnQYYUhw
	au8+o+d4NOIgW0Nwh0r9ztnTjmlo=
X-Gm-Gg: ASbGnct2R2loGqFs84fH4yz78phCW68pldlgK06inUoAWzaSqCdKfBpGhLc1/2pkU+m
	1fjQpiZp9Rvv46cyZMrEVPPffDzaBBikrP/3dBa4SzrG4w0+131rzGFmR8irQFZbOc7w/oNn0Dx
	zgZm6dNLrCRo65jRv6gJuUNqApffmxikrfMJsgrvU=
X-Google-Smtp-Source: AGHT+IE7iQqA1fokLwrOvDbzoLIHYYX9oCNCNZxIIYZxSE2JfS3gUtlLIRy2TZF9FMty0xha0eHu8o9Hk40X6S1rSMI=
X-Received: by 2002:a05:6122:2a0f:b0:520:60c2:3f3 with SMTP id
 71dfb90a1353d-52765c34756mr5188927e0c.4.1743862581842; Sat, 05 Apr 2025
 07:16:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1743857160.git.princerichard17a@gmail.com>
 <2025040538-breeze-espionage-dc6e@gregkh> <CAMyr_bL4Qo_eeVSHhy-_z9_PwcQAvD6N4jfqBb+rtN-Lj+YdmA@mail.gmail.com>
In-Reply-To: <CAMyr_bL4Qo_eeVSHhy-_z9_PwcQAvD6N4jfqBb+rtN-Lj+YdmA@mail.gmail.com>
From: Samuel Abraham <abrahamadekunle50@gmail.com>
Date: Sat, 5 Apr 2025 15:16:13 +0100
X-Gm-Features: ATxdqUHzzqrCgUrOAQpmBEZ9dYl4sXGFnMfLDkfxfZaxngKtNc6FpmaqtjF-g8s
Message-ID: <CADYq+fY-twT=NruAmfb6EpmYJLM971aTu-CUi-We_Fd6JSP47Q@mail.gmail.com>
Subject: Re: [PATCH 0/8] staging: sm750fb: change function naming style
To: Richard Akintola <princerichard17a@gmail.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, outreachy@lists.linux.dev, 
	sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com, 
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 5, 2025 at 3:07=E2=80=AFPM Richard Akintola
<princerichard17a@gmail.com> wrote:
>
> On Sat, Apr 5, 2025 at 2:37=E2=80=AFPM Greg KH <gregkh@linuxfoundation.or=
g> wrote:
>
> > - This looks like a new version of a previously submitted patch, but yo=
u
> >   did not list below the --- line any changes from the previous version=
.
>
> Please, how do I resolve this issue?
>
> Richard Akintola

Hello Richard

THis is the main message from the bot

This looks like a new version of a previously submitted patch, but you
  did not list below the --- line any changes from the previous version.
  Please read the section entitled "The canonical patch format" in the
  kernel file, Documentation/process/submitting-patches.rst for what
  needs to be done here to properly describe this.

It basically means that if you made a change to a patch, you will have
a new version.
You will have to indicate the patch version and also what changed

So lets say you have a first Patch then after review, or you edited
the commit message
or made a change in the code or something,
you will now have a new patch which you will call v2.

you will use git format-patch -o /tmp/ --subject-prefix=3D"PATCH v2" <commi=
t-ID>

then when you want to send with mutt, immediately after the signed-off
by line there are three dashes (---),
You will then write what changes under these three dashes in the format

signedoff-by: Richard
---
Changes in v1:
   - This is what changed in v1.

I hope this helps

Adekunle.
