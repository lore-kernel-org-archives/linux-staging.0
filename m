Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7D5C224AE0;
	Mon,  7 Apr 2025 05:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744005473; cv=none; b=VRATehxnafs/+SXuWIYSe0s58W4SV7cmArGImMbGMPtKzyZjfPGg1ZjtH29QtpUtnA0uA8Z9RhAaD/zZQ80Qo3F7sJ4KUswGJtC9Zvn6eSaT/SfJQCw0EIFYg1XqbVS4ZhhgS9WiCNd0Z/fuWAtJPuss76HLZ2uVyHmCrCbKHns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744005473; c=relaxed/simple;
	bh=Ie29+/UawBgvaIHMCeBJQcdJFBfOAaXTEIGtJaSIBvc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y4V2nPiajpr2W5n8qxQamwxiDuTHthUac7V0QQUjwQfZnSRRxiJghUomMEojHy96CS/5WfdFMltRnYLkuiF2WY3shRenjfQYPrRul2rGT3gN8Sr7TZiReNydmTuLnHNKhUzAsSLifyywnmhCc98TnER4SpqR+g5rNalVKvwqlTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aWcTBY2c; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aWcTBY2c"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5e6ff035e9aso7741095a12.0;
        Sun, 06 Apr 2025 22:57:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744005470; x=1744610270; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MU/QERwA590a39V1uHdiHYOh0ZGLgU5IxEfn8b8/6iQ=;
        b=aWcTBY2cWfFvnhivP40yGG6sY0sGGMnCgHCgjDvtO4UKXcPva+/EO1F18meJNj7qNO
         R0e+CH30cQY3vt3GU/SOinFjaBY0erpe0//RG5ccRBQXazLsRv0sML5MRY1asOwGWaqM
         h9zeEd5pp3lM5tXJw/9EsmGVPBARoHCnIVYvWcJTkcHXg/FOSDFdHzVRal9KSnO0dUQe
         jKBQ5D43EbllhRqtG5s9fm6pX2EScMprjB8FVGXrF+d3voGdW2mihh+293OCyObpK3hy
         VJZsbNjxXVvge68/+5H2kN2dici3p9uQNAeip7bZtPyqMU40MXhzqdr7Awx66pJCl9Hu
         mqFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744005470; x=1744610270;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MU/QERwA590a39V1uHdiHYOh0ZGLgU5IxEfn8b8/6iQ=;
        b=DdYmf1WGGxqIrjbD9TmMnDV88mLUbgCAokZFROTFHwty2XjPxdgd88+5szaOhBtVBz
         yR/L1qXqJocxozQV28exPtexEMO+oL9O2/9yBe69A+koPgdYdfQ3K9avPJiHR/tJ0vsQ
         NnHIDJ8YCXrRzIMUfBhpWv9KPGNAPOZKuyVUhAvk07amLrNfkfvf1kqdlJK076lNFDdB
         1XwtA4Z228M0gMXk+T3Yu67abnF33fmKHpl6mbbgTQYD6spMJTUMRxdLxRrdaR2WG4qe
         llp45C8LKiGUcQxeILkkySNZz1/e8HQMBF4QVoWc9uBFaf+Iqa1mZpQNiB8QyLGgbrj5
         9PoA==
X-Forwarded-Encrypted: i=1; AJvYcCUGn4jpiiCcHSZuY+M+uHtfBawzC4HEL3i544gKCrGq/vpPL9eArykMzzeODVCjzKh4l2HDMdt/f1Jp@lists.linux.dev, AJvYcCWisr6Ch5fsg8HLwhxO7d2IuKtRIZ+ebBCBVaZUJSFhkesoFWISSmHWFWOocM/lAPOGa2dkRotF9/DYfaLY@lists.linux.dev
X-Gm-Message-State: AOJu0YxI6LM7m5buZ4oCZBhVLmmvfrEL9bRHBNGKLtNmP34WlveVttnK
	RT+yzNPIjIVzOpeszWvPAJERNe4UCjaJkMh4WLqxRh5ZpOJnECJSN2Uq7qiaqTM88BEJN+Cickz
	xewJIJD/KEERbNGRoYYTcZfgUkaI=
X-Gm-Gg: ASbGnctQaKohboon/UOLIDAYsUhj7K9eVbHJ6JERqOn4NsQc1QiVcBDc/JLtwrG/9/a
	8f4igtGa99cOjeLOdSgdgpR/4mUd93FWQpz/iUPNneM4skvqL7Sl1N/4pFSA7sAJmGx/0vM1J5Y
	lRgVSn4qXKhcHDuA9JgKC6yPct
X-Google-Smtp-Source: AGHT+IELgjumJ/OH5wAvOqKNaKOIG+lfT/mrVgVJopPjWdFEehfMhOmWOSaLwOOa6/yim7LXwbc+NuGDmPdQpe8Z8O0=
X-Received: by 2002:a05:6402:34cd:b0:5e7:c773:ae35 with SMTP id
 4fb4d7f45d1cf-5f0b3b6089dmr9515458a12.5.1744005469968; Sun, 06 Apr 2025
 22:57:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1743857160.git.princerichard17a@gmail.com>
 <2025040538-breeze-espionage-dc6e@gregkh> <CAMyr_bL4Qo_eeVSHhy-_z9_PwcQAvD6N4jfqBb+rtN-Lj+YdmA@mail.gmail.com>
 <CADYq+fY-twT=NruAmfb6EpmYJLM971aTu-CUi-We_Fd6JSP47Q@mail.gmail.com>
In-Reply-To: <CADYq+fY-twT=NruAmfb6EpmYJLM971aTu-CUi-We_Fd6JSP47Q@mail.gmail.com>
From: Richard Akintola <princerichard17a@gmail.com>
Date: Mon, 7 Apr 2025 06:57:38 +0100
X-Gm-Features: ATxdqUEK1yuNgL11LsgZ-ALo34s7H0IFI4v_BYAnXp1SFIlzhqYSGlc_Kvkyfjs
Message-ID: <CAMyr_bLkvFBTpYehG4fs-tqVE18YBf53okddU2=i7+Rr-zbCsw@mail.gmail.com>
Subject: Re: [PATCH 0/8] staging: sm750fb: change function naming style
To: Samuel Abraham <abrahamadekunle50@gmail.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, outreachy@lists.linux.dev, 
	sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com, 
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 5, 2025 at 3:16=E2=80=AFPM Samuel Abraham
<abrahamadekunle50@gmail.com> wrote:

> This looks like a new version of a previously submitted patch, but you
>   did not list below the --- line any changes from the previous version.
>   Please read the section entitled "The canonical patch format" in the
>   kernel file, Documentation/process/submitting-patches.rst for what
>   needs to be done here to properly describe this.


Hi Samuel,

I sent the patches individually before, but I was instructed to send a
patch series.

Given that I didn't change any code, should I still add version number
and sending
patch series as the difference?

Richard Akintola
