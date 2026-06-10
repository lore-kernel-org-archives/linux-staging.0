Received: from mail-qv1-f68.google.com (mail-qv1-f68.google.com [209.85.219.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F23A238C1A
	for <linux-staging@lists.linux.dev>; Wed, 10 Jun 2026 01:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781054094; cv=pass; b=c5DhqJupYI80w+2/eGDawFVGQSoTE8vGRMApxd9w8gGtubYi4iYky6td3ua0h/gZCYnEfNuuj8wZeawsx2WZu/5WXNRPWrCzrBNT5TjFlW81+bxffmVptJUi71ENI1WiYEeNJfNkb39a+ADeqYvqanDSSwqR830+WIK/YihWR70=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781054094; c=relaxed/simple;
	bh=eoBqyrwozyfPizN1M53W2PmMDQWOFIP6NCv4LN/rCuU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jCctDIpBtbSc+CKy0mzvi5KG8s/5WjnX5FMUvJs9SHrKDDSZ51mC//vuqcxscfcfKTzlV2R6Tn74S0ovEpNSuess5I9EzgHjFv0ok3gYaPE8cw4gKrIHxwm+6Vc+oXoM+x5TcW7mC+mruPSsujZn8nYf6pxDgN353tgr7sox1J0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jmnOFJRX; arc=pass smtp.client-ip=209.85.219.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jmnOFJRX"
Received: by mail-qv1-f68.google.com with SMTP id 6a1803df08f44-8cd45d4b7e2so70651236d6.2
        for <linux-staging@lists.linux.dev>; Tue, 09 Jun 2026 18:14:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781054092; cv=none;
        d=google.com; s=arc-20240605;
        b=e3yatu/MnxzCrI4Sg9JoE45ZiWk5ZlcRWu5NSGS+eQ3uFVPyJQqDjDaNlmfbVOxjsB
         j/G73npT4brM4eR9yw0rZnrWPvqa5j7mTOV+yqS7RHisecDZRiXKiFtJk81FyozSGxwV
         4LUrMq5wkVSuWf6QC5CW6QELzLvdrTiDDFi9fN8VfDbFmQpiAiJTA6g3tKNRn3NU2/V+
         fFs/qtorBU0BLBTNnF3MxbCc2r5x1zrh0oJdlRTw2bz7T5MmbjX7SySukf2u3i2Vbq7G
         lwycHT+7E5QbhdPi10SsAWfIVQq+/XXM361XNGzGX27WlFH3gN1ErOklOHEplVyrF7DY
         4tmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ChYnJlEHoZXI5v6H3MMgohIBDxc31asjLW8UfDy9l7s=;
        fh=grM9N4CbHEp7cAV2RX2OSOg360Fm/ZHU5F+G4WtV1K4=;
        b=FTZSJ4enFdnaFKA2sF5cEC6n8nxiiat/gJInLI8IYhUnKLP1gRR3SidLvPdw/4uIGO
         B71Tbc26kKvGkw4ZARJRyTevJtrUhk1t+jZUPCRKxcyrjqxGpR13E4+zDOBO2r3woCgT
         /slb949pIIhxkUqvP7votyTgOQBK5zE9TbLKPSrpj5m7oyk8hsK4HTz9IW/C7GcenkYT
         tbLiyAxiIeY5JsvPJT21itC2YlyYz6QT5TgJa45dH09/Upup5aR0azrPI0lPY3hwQ1aU
         3zfIA049ad5sbofDG53d40W9KJRmBxPRZYdpl+lXgsrgjJIDjdIBLI+IIFmhYiNBaBIv
         tyAw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781054092; x=1781658892; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ChYnJlEHoZXI5v6H3MMgohIBDxc31asjLW8UfDy9l7s=;
        b=jmnOFJRXnaT2OAEXqyryT5erf6yT6zicyqcaam15DPN5KAqAe5Vuh8uWszIarUwigG
         ToO037Unw9I8K3v6LBHYN0UbLTvzEFovWvn+MYtNZtlWef2fLAbyah3I6TJI+8WnOpaw
         NByUsm/kKARx+kij5D5sGcPkk/fKcAd99/Yl6rkbw6vxBXkgDtJbhiMbqe2zL5/GYoFS
         Qi3CTO060sLOJJO91PSuVY4TtUzWZlf44OvJqxRH9t/eSR5Qxmvx1sH65pgVa0qY+Dtd
         7zrjSzOyRWjc04/bLiaFBORrhiFBKASx6p/+4KakX5Svg4mN87bz+s0qcKJl7fMJebS7
         9blg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781054092; x=1781658892;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ChYnJlEHoZXI5v6H3MMgohIBDxc31asjLW8UfDy9l7s=;
        b=ITDLbN39k/NcTnFYnWnTl26hk/p9HDB1s6OfjQHMM5cHmrpM38TBnXd+JjFt7uR6XZ
         Rys3rPzI+EiI11fd4GGUXvhu0uisuu7XF+n9tz+hhPfra+a2pA2ik66qLvoTR33bA4VV
         QNmhrZUqkM7ghUSzUJZiurmE0hXdyLkSyo5LPp4eIDANUY4ksYCdpmmy0ZDxPLyivMhU
         TumDt9lCM5kZQ2vntVaPJ/YjREHC5soA174G1OzZj7LEX/QAd5ZU6LKqeBZIxaD8X8/f
         JhiGX7hy4ZSf9dR6U65sapyNoSC4aWPbCHDWPonH3HQRFrLUQ4KoNAgfMuwQgUhWJaXY
         E1Gg==
X-Forwarded-Encrypted: i=1; AFNElJ96cs8YErPYSbbqfAnBQHvLpt41qV3AlofCa99aD/SBslc4EEzOFs660IAcKOZscSjXS1X0LdOwjMU5xPN6@lists.linux.dev
X-Gm-Message-State: AOJu0Yy+yUeeX1I290cZYFlL3nmfRddulLdz80Uuqdfx0pNptS8enH01
	rU/8E+KOv+cM59AR+GXgExH7BLCBnmIUXVG/N8prQ7fVTB/DhpZB09jNPbIlQUp32FPvEYkErJb
	ussACqAnzwSco3yLMj+Jyxu2lLd8vmRo=
X-Gm-Gg: Acq92OGUR04zoapK1L7EAYqQZ8oDTv6NdVavP7fB4DdoHAzipWxnbVOrN0XjkBfYLy8
	Cihd5DzUHepm1thrr/F3tIbIBH0k1hYZteuG9ezP8Qo6cyWyRaIChrEOkvQSQLdHkUjuP2WM/0+
	WjNvkIe8nNSGSqjRd2evNTp8KGJivKm23zDEjF8abS55FrQ/Qo4Xkw4E8JToASdjNy/AdZeLgtq
	h0npqyvcw1HgjnkQ6ZpU8TvIP6VHbubBbbRaY7VvavuKN0vBegk9H2FGCVrKzTm1sJ06z+rXCZF
	FTXRA/SGaXzEjcbBAq64kGYFwiYs0C99G1BDpdwkZeofoxBzrARAJlAWlfrQYaYRIZCyiFH6zaS
	8eqTd1nmt1YFGuQ==
X-Received: by 2002:a05:6214:29e3:b0:8ca:117c:e503 with SMTP id
 6a1803df08f44-8cee62655d1mr335055816d6.26.1781054092226; Tue, 09 Jun 2026
 18:14:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260609202705.183875-1-enelsonmoore@gmail.com> <guidaiFoSi.541328.2026169aiie51mhcpgO149o_23655_LINUXKERNEL_AGATHA_@links.agatha.dev>
In-Reply-To: <guidaiFoSi.541328.2026169aiie51mhcpgO149o_23655_LINUXKERNEL_AGATHA_@links.agatha.dev>
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
Date: Tue, 9 Jun 2026 18:14:41 -0700
X-Gm-Features: AVVi8CejiAX4BPC3WkqimUAQOP3_qmC0-30J1KdBshcdRuBOy7A00Cqo0sNyjrI
Message-ID: <CADkSEUjVYOCYDRkr+WYD34_LH=gYGRyvHfwWH6q5jPLZBtXeTA@mail.gmail.com>
Subject: Re: [PATCH] staging: greybus: remove driver depending on nonexistent
 config option
To: Agatha Isabelle Moreira <code@agatha.dev>
Cc: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>, 
	Alex Elder <elder@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jakub Kicinski <kuba@kernel.org>, Namjae Jeon <linkinjeon@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Agatha,

On Tue, Jun 9, 2026 at 4:56=E2=80=AFPM Agatha Isabelle Moreira <code@agatha=
.dev> wrote:
> On Tue, Jun 09, 2026 at 01:26:58PM -0700, Ethan Nelson-Moore wrote:
> > The Greybus Arche Platform driver depends on the config option
> > USB_HSIC_USB3613, which has never existed in mainline Linux. Therefore,
>
> Actually it dosn't. The `depends on` line says:
>
>      depends on USB_HSIC_USB3613 || COMPILE_TEST
>
> That's a logical OR operation, it depends on USB_HSIC_USB3613 OR
> COMPILE_TEST.

The function of COMPILE_TEST is to allow drivers to be compiled in
environments where they do not work, to enable better code coverage
and easier testing of tree-wide changes without cross compilers. It
should never be enabled for production use cases. So yes, technically,
it does depend on either option, but only on one "real" option.
Therefore, I don't think there is anything wrong with the commit
message.

Ethan
