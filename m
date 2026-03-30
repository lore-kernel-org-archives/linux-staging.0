Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C62693AE190
	for <linux-staging@lists.linux.dev>; Mon, 30 Mar 2026 08:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774860757; cv=pass; b=nPTN/gzEF7eQhZJSY2emscAMWHlH+v9iLpqNRAHr5ULvHKLFC8kXcwsrtYA9PXNr0OaAgDNAdflYzna1zeRMoB554NmmIKcvgqP9+Cv2w3voZlvhXwaWIKmMwbJS1g3qp4TQ5ztQIbwcVXfn5aj6osBtNOL4iWkZ07rYt1FrE3o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774860757; c=relaxed/simple;
	bh=+kh6nzTZwqdUygYtxzQNHK1HwDmUUjTXU3fNuSYwayY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WEawzKNh4WQQGQsvnQ49Vf4V0NLTtpt5PC9M24Ee8ooWkPM8MzBuLkUPy1qsvosoMHi5yvGFe8VdthZnTccmMEMNZSUOmE2mDG+fZ4etKoJ1UxGqNbBoCBG7LzwAyMfkEyKdo/nTOToIBQd1m3jxTpxOh6Nc5A9aqUlyponS8ig=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bu5g8Z30; arc=pass smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bu5g8Z30"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-66bf7be1c8dso605179a12.3
        for <linux-staging@lists.linux.dev>; Mon, 30 Mar 2026 01:52:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774860754; cv=none;
        d=google.com; s=arc-20240605;
        b=Q6p2p0Da618aS7XD7nB6dihAXgUDvV8pL+eFIibDK+muMnBBihQ3o129qx5pPgxUC9
         uMi38I/Wxwauf3SM+5hfiNfoj7vPY+3w1tvUwIdy4Gn2GLaomCC+c840oy9iacY4j79Y
         +k0EQbom+eaa46SwkRhiJTSelzsvAUVl7YyIQYvFvJ9smdj2hDUe0hYIjU4o/0ysPJwr
         9RMeq6nJY6R/Car0RM3y0uFcl6lF5PTppipYzbv98G31HhKEdL+Y+xBFZ72/MMkWC4TE
         y4aTfxzcJtXEF7LSy+++Fe19ppu3gWY1Z9wuH+l38IbNm3hGReQLx1Ji1WaZ3xkp9nY3
         /ebw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vUKiDlxt0ogDSzxaL2p1luSvkqrqMFZqS96GQhnh3cI=;
        fh=vEGNf+9u7CGgx3AwPP5D/ONcKrhmY+SKm0yP3M2dvRY=;
        b=fQOj9vX+NqH3xY/7MW+3AfVZ9XPUaVkz5FeeAGgD3OtcpbKn9sv7kVaALOY3Vnj8Ps
         K3AGazm5OnRTUhCJfIlyXMwM9SrT3XINi6qnd/s8HvMoNPWYJFOkVy7RCICavto0CzHD
         rXucZbECiPxekalzth4ACg9qadkmwbPj2VVtnTZcYnCy6vnGJjDheH6ACFEfsqTyiKYX
         EqcqRDlKiI/tjCzJXIKnhazNy5bue98lfPmhLPIj7+fkyctZryi8tlMm7MJuhDakRqCR
         yzf1q2dsx08I9t0/Xg+CZKDdu1tQdCh1svZZCtnCX3WN0Eps+9RGE68ZVTl0Qg5MKuOC
         JTQw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774860754; x=1775465554; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vUKiDlxt0ogDSzxaL2p1luSvkqrqMFZqS96GQhnh3cI=;
        b=Bu5g8Z30XNv8kmcL3DSO7imM5evVriYCUZXly/0Y4oCmq1Nn0oPdUe9WLXfukwzd6p
         hI0/GBOnB0iJWRXlmAlrrabvAMoaZ5diFurgclL7ANbbZcjhT6zBAv9tlM9MB4927fyF
         R9pEKy0KuGzkDi9O31RZBtBY17YoMu5aeJUnlHOytSyms1/0WVQ0Q+2CsxdAwOVtTnvc
         9t7JGjVl/e+DecqHDK0YctpgKiFP8r3UdBUMX+S0tsjspJpYY7QEZbGpP7J97fX78rN1
         u5dwfbgHWbXSn1KyKpOAlCZjGUSnGSVfAuIXFLk8P0FwiO5GPzxx2TvK4cPhZx+E52KK
         r6Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774860754; x=1775465554;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vUKiDlxt0ogDSzxaL2p1luSvkqrqMFZqS96GQhnh3cI=;
        b=dTpa335hyXHOQrf8Kp0fL3Szn/wQm4Zovko0VqHbp9w0uquDttGY2MsLiTyebEAG6G
         hZRRTe7TaGAeCpFXTVVlZUyYpILlVrdEA5f5yASapWDuHXr32McYe1stN5AbMT7pMwxJ
         8blIVlCErq5BcXCwZWr753DzVJ9nL06BZUxxcMQ5U67/UZs0cEzFIa4W833CfNFihkjF
         CZd1ma3N19YVCg/INxbuTVzPFKJTIVJCnQ6KioR33r9MoAaNPhbnkXZSiwyDz8ZIlmeN
         ITkBU1dWo+DqPpZf1clD3Zf6GJcet81rOPs5JjUC5NwYwxJrevWAuxp1Xb1fsDJJqxEY
         f4Lw==
X-Forwarded-Encrypted: i=1; AJvYcCW0T2i3z/SEQMC34/FzcW+NSYWchX0Xq8nmtgnDLna8VsTHMs6ZbHiGyHcBd21UYL40mX3wLl2F5V6wMZSL@lists.linux.dev
X-Gm-Message-State: AOJu0YxBeMU6JptD0alcATznRgF8OnGHafQQta3Cdc+Acy3jaVAz6G5L
	LgnwkgEYqnEuobDiYKM2VvNxHUoZwXjsbClqTnSR+WbIfK7S7U5U7bc25jhSzggYT3xSQbXiRwa
	EbZfIgosRAOoDGgaSvOhrEWb3J41bujM=
X-Gm-Gg: ATEYQzzg0S82DU669jpwIALF8EdV+jbfSisY/Q6UogMezCX4filNwZDnjqjgKvMaIV2
	ee4x5dqq8WoKkcZPMT5QGCajovmd50k69SkJsmx/6i/dOvjvEXTEGJgigz4Id2AKtZOVGg71uS/
	ratnvk2YnnZv9hL0jN9Njnly0hW5iXqO4kzmu7mZLD0Ta5HuHXJ4OVJyC4/K1ETHprMsljrcodi
	w1ctbtp6DWZtxSamrNARpMhPNTpWmMMNvz0s1C74zP5lMB3hAhXWIy8S6BX0Btt9vMRWYdphOFV
	fv22CF1dHZvFnyAqm2CQsE5h5p/D3xtHbKZRpX9h3DJcx51ZeiVRvMQOYifpJa2p6wvVuWIRI7T
	uYzeh2SmMyDekoqRXxg==
X-Received: by 2002:a17:907:c206:b0:b98:6926:13da with SMTP id
 a640c23a62f3a-b9b508d6634mr668409666b.45.1774860754008; Mon, 30 Mar 2026
 01:52:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260330073549.5782-1-robyserbanpascu06@gmail.com> <20260330073549.5782-3-robyserbanpascu06@gmail.com>
In-Reply-To: <20260330073549.5782-3-robyserbanpascu06@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 30 Mar 2026 11:51:57 +0300
X-Gm-Features: AQROBzA-iT2Ca20v73jGEEWB4uICVP5S-OZQGgAQUK2eFploqBNKPjJKd8yYbK0
Message-ID: <CAHp75VccfdW1BCHRpjKz3Vj=8UGJm8So8nOFFKNQK=L8nniVhw@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] staging: media: atomisp:
To: Serban-Pascu Robert <robyserbanpascu06@gmail.com>
Cc: hansg@kernel.org, mchehab@kernel.org, gregkh@linuxfoundation.org, 
	sakari.ailus@linux.intel.com, andy@kernel.org, daniel.baluta@nxp.com, 
	simona.toaca@nxp.com, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, d-gole@ti.com, 
	m-chadhry@ti.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 30, 2026 at 10:36=E2=80=AFAM Serban-Pascu Robert
<robyserbanpascu06@gmail.com> wrote:
>
> Correct a spelling error in a comment:
> 'uninteruptible' -> 'uninterruptible'.

...

>  /*
> - * The longest allowed (uninteruptible) bus transfer, does not
> + * The longest allowed (uninterruptible) bus transfer, does not
>   * take stalling into account

While at it, you can also add a missing period at the end.

>   */
>  #define HIVE_ISP_MAX_BURST_LENGTH      1024


--=20
With Best Regards,
Andy Shevchenko
