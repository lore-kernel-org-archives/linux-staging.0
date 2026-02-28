Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D26AA15C14F
	for <linux-staging@lists.linux.dev>; Sat, 28 Feb 2026 04:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772254038; cv=none; b=ofCLvhqGuiDsvKG84U1j2iJuxXQBJM7PNMlq04sKRDhTW+MUW2aA6qndGiSwNH4Ip7s73fAqeoIaGIwyFe+jtK6KIYwezw2Y0hZjvORJshpEhGlwZnjB9NuEBpJikaC+YDCiGqqQl9cFDDsu/2mpLSfaJkVdfPCy5WMdz586E5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772254038; c=relaxed/simple;
	bh=ZJX9rey4Z0R6QVsER+86FAcuWRIySYsyjzmKlTX0kAs=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=j5jgMLuBHaDCL0yhPBWL19H86+DjFWqQk14bYdU8pZ42bgP1R13gn3NkTCDvYz1eWCE0O8U0Fnt8k0bg9Oujlwmud8MLSc3ldMYr/ZXl8ECZa/5QjgB2Ty25QEmtZ4lexIzqbBwvktZ3nkE6V57vCSYm46dnPHqoJS9CMJkwXJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bHFnPzQF; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bHFnPzQF"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-794719afcd4so25896337b3.1
        for <linux-staging@lists.linux.dev>; Fri, 27 Feb 2026 20:47:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772254036; x=1772858836; darn=lists.linux.dev;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bTrWlok3Ss034iX4L+U3R8thb9pVdbpBg+VuGeWlDrw=;
        b=bHFnPzQFxxm+AodLBFVlI6qMTz0rSkA6S7DVPYSjVdosGc41Ls25+ogm06K2/GJhuc
         iVW847b4pnVyGyzq/pUE1MNORt8T4O30sHnQeMt3+UR4zsCLm0b+T1Hu2yiUTjrAljjS
         SN+/eT7FVkwfQvIwbUIwDYY4GU1Jihfb4GeWjv91c7Zr9M0wO9bQHPWG8bG8O7KxJBxD
         pQG9yYThsEGJ/6GOVwW6nfS83Em+y2s8hIkKtMzWy6il76Wv0ZVGAks0hvGsfrRCGKWc
         ZXtZIlsmfTJtJ1JKCfDxvK3i7vX3Q4/qMDNBcMXi7ptsyeHZ7eKU0Z/dxIoXW0vwB6Lg
         3tmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772254036; x=1772858836;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bTrWlok3Ss034iX4L+U3R8thb9pVdbpBg+VuGeWlDrw=;
        b=Rmb8Uuep4uf9pY8MILguHt7NBACa7aGm0GSd/uTzuYhUoekgEDPgJsMZVRmpzNrip0
         34e9cIWEnFvE2bnZjjrH00vDulpPHtf22Kj2Cf+6Dyc9LWcmW1kfKX/L7r+IKoy1ji0w
         OqYL0RgX/Ike1T5k+b/tZeAAnoAmAhJCxb8TERDYlr/q6d03QVYwilKf/+xRcZZCacNe
         Dn6/4ZI/ATyCZHV1s6njgDdTOhpgdLEv/iV4ba4XHLMDNldi9MQ/rJ6aea4L3BwTL+Pv
         BSt0JInBVa6OFBuCt8Po7ccsAUiYmD8hjYcHS6hIG5wLaauNokdFsVQrOQj6YN2IaeMB
         uXdw==
X-Forwarded-Encrypted: i=1; AJvYcCVUmQGnxioa6HvXQ7jKLuoyFW57cNY3zgfPHcABdbmVIwMc068vCuShK1fTnqyYfDlAVjb9kSVmugcpj8IH@lists.linux.dev
X-Gm-Message-State: AOJu0YzIfRLtpSGO9uJcYH4iH1DlhoxABmnEcMVctXvMJxHT7p/785yE
	4Jk0Nxkf6DvqQN0u8e+G8lKakJhDoxDBBgu6pG1NJQpMCjBYNRQbakFB
X-Gm-Gg: ATEYQzyk8UC6HqlNdsKkazIf36Lx0mQ1GC4VX9Vj62ejO4Dh7EaKV2bzfY1ox0WnTCx
	AmV2IUkIUDWsU3VHhuq3WsG7NePrcNFxEL8K4boZtMeVxtdHoPLkOrumW1U2kz5yGBN+q2JxZGN
	X/pwxEMuiN/zrHIzLSSBKqgbAXqqxbF8wfwTyKqfV7W8AR4bCiC0BdI02kqhBrkZ+gaoWGI9nCI
	K1fwJQCVBs3MWSVSP2j/iJLloZwxx1ou6jSyP/+F8JOqhe4QK3lR1SM7z8oZPW95Lf8Y3ik/7/L
	PEUvUlBKgg2fJm2YM47jNbOqbRoCe0gDGafXJ92ymO6EI6ZJJzeg1yVjT3W8F8PDonte2IEP01x
	Dh9KcvR9avdBwcV85W/xcH/60ribDZgDPgZFGFWqOeS++BTfPiTNGvPcsTfjtny1rLUrCz3d4Er
	fv4DDnfXenFcZ14G1BDUu1lHM2dkmHOTxH2rNw6N8zyk5bccl0UpNkCAk7xfvZJvRifOBIGEc5N
	xTtDyK/joRVLrtB6FmX4ok4vxtP4yCO
X-Received: by 2002:a05:690c:2605:b0:796:2fde:5dc3 with SMTP id 00721157ae682-798855c709cmr55472637b3.43.1772254035881;
        Fri, 27 Feb 2026 20:47:15 -0800 (PST)
Received: from localhost ([2601:7c0:c37c:4c00::5c0b])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79876bf9449sm28706387b3.28.2026.02.27.20.47.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Feb 2026 20:47:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 27 Feb 2026 22:46:56 -0600
Message-Id: <DGQBM7NC0WKU.2Z3L6BUGF7EA9@gmail.com>
To: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>
Cc: "Ethan Tidmore" <ethantidmore06@gmail.com>, "Minu Jin"
 <s9430939@naver.com>, <linux-staging@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] staging: rtl8723bs: replace msleep() with fsleep()
 in rtw_cmd.c
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260226010536.179729-1-azpijr@gmail.com>
 <20260227084623.209913-1-azpijr@gmail.com>
In-Reply-To: <20260227084623.209913-1-azpijr@gmail.com>

On Fri Feb 27, 2026 at 2:46 AM CST, Jose A. Perez de Azpillaga wrote:
> Replace msleep() with fsleep() in rtw_cmd.c to improve delay
> precision and follow modern kernel practices.
>
> Specifically, this fixes a checkpatch warning for the 10ms delay
> in _rtw_free_evt_priv() and updates the 100ms polling loops in
> rtw_chk_hi_queue_hdl() and rtw_free_cmd_priv() for consistency.
>
> Signed-off-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>
> ---
> v2: changed to USEC_PER_MSEC instead of magic numbers
> ---
>  drivers/staging/rtl8723bs/core/rtw_cmd.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

Sorry about the confusion, LGTM.

Reviewed-by: Ethan Tidmore <ethantidmore06@gmail.com>

Thanks,

ET
