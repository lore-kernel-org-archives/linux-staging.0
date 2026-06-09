Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9B64438FFB
	for <linux-staging@lists.linux.dev>; Tue,  9 Jun 2026 16:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781023254; cv=pass; b=oWiC39D0qDxzl0eqOea+q8bnWpjAObnVlfUomvVF/rqpFFdSAWTSHp6dpe4eOYjIpHvHAQ17foK9po+4y99uM1g8+jEpqWQajPUXl4qkHQ0iKvVv1L2F2SLUt4Jzi0+uza9eaC8CDN4roUmVCaqRAdEyv8bCHMaUk9aA0oC9EJs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781023254; c=relaxed/simple;
	bh=MsVStE+8JmV+WuKyEllfU1CqZuzsm93hb5AP1UfLNp0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G3r9o0YPlprTLIQjg5kGG57pYX/MxKPyAHP8zA4AuMuBsLmzTxgyhe0gtnGUKurrHccNTuEWdulp157J/WiO05M137b9XSQVsBWXPq/TU0tCKIH+UfeoK9jss+F9PJk1vuAuMXEDgHPRDHwgG09vUnIR/Ckak85vP4Unxp2ciM4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mWF/xM8p; arc=pass smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mWF/xM8p"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-bed4f2f0898so732367966b.3
        for <linux-staging@lists.linux.dev>; Tue, 09 Jun 2026 09:40:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781023251; cv=none;
        d=google.com; s=arc-20240605;
        b=K84LVkzaWjMGpa8OE/HyJrQ/clnvl/mdMOk+3dWh5UsNcFVdmDLc0WWNKOASTcVbIB
         HFLoOGiXH2ZN0OqtQnSiBfDDPR7LhOskaZ1q1kfvMAkmUV/l+Bb9APSLOseNEb+gcxT2
         AB7yq1TIyLSHGCjm7PbHOhiK2FsO63HWHP5rJfbehJN4+wIyq2NsNSVAbgI59UzIwGG6
         WPHN6ghsT91aUNLCXh7dss30MxQg8b0Gzmr6gqRM8y60UD7DC/mbMpsz5vT9+iEYKMh1
         nQFfGJpS7TZJpsycN6Rg+a2F6RPsqEhqYlO5RARjB9josNaRCm6muVkqm2ee+X7362sF
         KUmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kCvaSfNh1ZRYnMKcF/LlJFV1y8GsbcWqkLxm+7NCkcM=;
        fh=d6Qeq/Mvxn2AufQm/Bri8RyPQ1Rnvq0iBFgcZQ2MSdo=;
        b=O4bUOrNYXirnokLRcitvfXjQMfbx51H5WgrLRUUl5zMNc1KdCtW7jEY4zYHgfFig4v
         o9MWaiR9MdD0UDCdEINVOhFrE9I9MNxhSKeAWT1u8e4fyHxg5rVz70C0OiSDnUcqIG3O
         qDkAsw8G1pXgqcXTqOvXbZ8u+putD1z/gmWLXOzzjP2buyTjHYXbkjb5EiPtTA/lTsdE
         +yBaTrQ46L8dg+XfCnGqUPSJzlG+6xQGJLe9u0TaU8mCbZUNR5FDdnJ+u5ySjkfWYLEx
         RMTaJuTOuyVNGkkWVkRsJm2rJghOFdaHOvlmkb44+BwGwWlItKzzecjJF3H0xxisfENB
         VSvw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781023251; x=1781628051; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kCvaSfNh1ZRYnMKcF/LlJFV1y8GsbcWqkLxm+7NCkcM=;
        b=mWF/xM8ppd/Gqb+PtJM7k/yEHqvU9q05cQHKSsR/dh3AKm/A2QZvEkessMEM/iEP9v
         lIn4hOMS3dlLLSDM6ojuJwM96XaccFd/WrCpngVF+JDsrNpblFJRtYIBxlDQT5XpcNTg
         E8REygzgNgZ2lxUzZN58w0nKEIB4ehPJOH1dTi+OgH98tNHEFu6Pp2POfdRz0D0Y9xN+
         HXkULxO4h6Vd+Mc7cRHUtGdXQ+6e/qQXj9GW6ZgYqOykZ24Y7HIFS27DlC6kWFzj513F
         8cL1YCUAyWZ3Dm65/juhUt9Ly9X9x+1a2jBo2Sl6uYYG9CIwiusMEGTnKG5p93bBR9/w
         MfjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781023251; x=1781628051;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kCvaSfNh1ZRYnMKcF/LlJFV1y8GsbcWqkLxm+7NCkcM=;
        b=eUx9WL3Sj1bguHmZJJtw5EBF0/qGEIuDA8YujtnvMIcQT7DSDMK3A2Nyn+3ouPsq5s
         oO7NizqVWnbw0bUjR1JmRcY7wb4tvUdNs2QoGkmUpgfBl3a00vfyOpF+VQCxzYzMjlpW
         YHGaDLMFN+lxlhThSIlFuO2+ffuztR92EWewWOXnBHHDt+yK4gWt30Ro1gGuRe5BXPjI
         SYIqsqHQ3CepUpeJxqL1D71fKGT7zbiH3DGbGAGY0QlEig/8+UXsIpKHFgSfcoqaTkp9
         UMPuuK9QKYswLTD56l19vKX6bn3Mk7ODtFQG0agDyUFF7/edlEJj/RyTA8D8CA0TGfEu
         S8Dg==
X-Forwarded-Encrypted: i=1; AFNElJ9BYlAY+K2Blxvv/anp9pEly0VsDiv7ygklQwLEX5SQlMml2sWyuclLPyKH+9XUI/Gy5M3M/NS43luh6BnT@lists.linux.dev
X-Gm-Message-State: AOJu0Ywqlfu0KgmzVovBgH6tJbceYmVegoOIicmaUGJYBWuOoOU2VPAn
	1SKaj/M3+BR0eCibN3lwxlbzvxXyHX8pb+XfO+S+d7z0B3FpR/fM0/v7NvAqR/LB4FgWdKdEO+7
	HnIlwgmmS6mIBEXnfu+YeNAt7WpJ6BEI=
X-Gm-Gg: Acq92OHSB/PgDQ6OaXzuc9cHlGshtPJ7VOtXuIBHhd0Ga0sYgMZ+2APTCwTDDQXGTIu
	deM6rdypsUGM9jSBc4HYbC8AeIcdXi0qf6nN1zZr+a0XMwxps8HDvciFMskkNrMKjBYaEShXw5Q
	QodFNjI75e6Nc9x6PrhbHeVsTHrr94VJP3uLbm0H0aSgPATOE2NxDvNNxAypuGhopSjySKMO6+N
	8l2CAxd1jrYP9oggcsqFTyDOYp88OyvgT/6SzXjyZ1+QDzpjzfW1Oo7CsRltJ7oJ2xs0WhVZtNh
	WXuD2VEtcby1J2wvw3s=
X-Received: by 2002:a17:906:45a4:b0:bd9:a087:730d with SMTP id
 a640c23a62f3a-bf9365c7926mr130649066b.8.1781023251029; Tue, 09 Jun 2026
 09:40:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260608190700.85755-1-nbakuradze28@gmail.com> <aie9bqpiNDJ_IU0M@ashevche-desk.local>
In-Reply-To: <aie9bqpiNDJ_IU0M@ashevche-desk.local>
From: nika bakuradze <nbakuradze28@gmail.com>
Date: Tue, 9 Jun 2026 20:40:39 +0400
X-Gm-Features: AVVi8Cd2CjAsOi7TQ5hd3PT70jSm3B7lBtg9-vrkR9kT7vrAHvbDH0sBLQ7Muic
Message-ID: <CAHyzTT3R-cOpJdE=hKPGSBSdC-BiY29y40DURvKjCN4V+w5EAg@mail.gmail.com>
Subject: Re: [PATCH] staging: rtl8723bs: core: avoid NULL pointer dereference
 in c2h_wk_callback
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Khushal Chitturi <khushalchitturi@gmail.com>, Archit Anant <architanant5@gmail.com>, 
	Minu Jin <s9430939@naver.com>, Kees Cook <kees@kernel.org>, Hans de Goede <hansg@kernel.org>, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

You're right, kmalloc(16) effectively won't fail. This is my first
kernel patch so I was being overcautious with the framing.

Should I resend v2 with the else continue form you suggested,
or drop the patch entirely?

Regards,
Nikoloz Bakuradze

On Tue, Jun 9, 2026 at 11:15=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Mon, Jun 08, 2026 at 11:06:58PM +0400, Nikoloz Bakuradze wrote:
> > c2h_wk_callback() allocates a 16-byte buffer with kmalloc(GFP_ATOMIC)
> > when the c2h event needs to be read by the host. The existing guard
> > only wraps the read step, so on allocation failure the loop body falls
> > through with a NULL c2h_evt and dereferences it in rtw_hal_c2h_valid()
> > (via c2h_evt_valid() which reads buf->id).
> >
> > Restructure the check into an early continue so the rest of the loop
> > iteration cannot be reached with a NULL pointer.
>
>
> Not sure if we need any Fixes tag. kmalloc(16) won't ever fail (otherwise
> the system is already in the state when nothing can help).
>
> ...
>
> >                       c2h_evt =3D kmalloc(16, GFP_ATOMIC);
> > -                     if (c2h_evt) {
> > -                             /* This C2H event is not read, read & cle=
ar now */
> > -                             if (c2h_evt_read_88xx(adapter, c2h_evt) !=
=3D _SUCCESS) {
> > -                                     kfree(c2h_evt);
> > -                                     continue;
> > -                             }
>
> > +                     if (!c2h_evt)
> > +                             continue;
> > +                     /* This C2H event is not read, read & clear now *=
/
> > +                     if (c2h_evt_read_88xx(adapter, c2h_evt) !=3D _SUC=
CESS) {
> > +                             kfree(c2h_evt);
> > +                             continue;
>
> It's too verbose way of saying
>
>                         } else
>                                 continue;
>
> here.
>
> >                       }
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
