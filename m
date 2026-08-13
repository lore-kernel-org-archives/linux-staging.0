Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5185F30569F
	for <linux-staging@lists.linux.dev>; Thu, 13 Aug 2026 12:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786625690; cv=pass; b=ThpbSaUiels5V7kYUS/w8XsD6+VV8g9SaaxOS5lycwoBByrK9JDG/uuVBpbwQDdwmEZgWytlAoc6ASZsklVa/3Sev7NN6pq/Jq83NyJqLy8fwXvGpvoU78vjBSdfmwY3nWpIVTNc06D+96ui2Msv29L0sayZZIsjegD8kzodujo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786625690; c=relaxed/simple;
	bh=HBa1RzPgqL06rZ15zivvxqKxAbL690v7cQ2QmoZ167Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E5AFlGjgIUSHcPWYoKQSHb2HJALZyDnNnldPAowFM9aBo/WWccddFG8EbCvc/lf5bTQoRcVH94Lh5RBFXXyZlFKXsW9jNQf0QZKa2LJWnh/X8qSvRmVcfe76itG0jQ+3KPCe0uxrZBBYfEzTbQmltEDX5O2QOm2KguWlEozh6cY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hSbOgKvr; arc=pass smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hSbOgKvr"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-81ff017d420so12865707b3.0
        for <linux-staging@lists.linux.dev>; Thu, 13 Aug 2026 05:54:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786625688; cv=none;
        d=google.com; s=arc-20260327;
        b=FbgNk8qbcvfrlhnjGN+wEcN37ipvPqaWpm4k4+kZHIAj2HunLkkW7NUdKdK4FG5wES
         y/Ef3ySaij/BUIN+P3wcMgVZFvT/bWaZ7jBTUiVznoI4IcNEPPMM58SkebQah5bQyxmm
         M/2Ope2RgcwCpVua8S+i5mnAZL6ZJ/PJCIDWImG9U5JkkZ8mbXDaTQw68oPmkTLp8qOK
         pW+rl5y8HXWVQsR4ybVhnlaiv+/mA8U3HyVatCMolPWn1ZkPXKJt+oLkjF6ODdHWdbEf
         7C6yYbPnop+7wbfAsfyjr8umSm2GUgf8GI02GYPgiCbtdE5myp1tdTbjGvePCeqIv11b
         g6Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=n08KwR76C8R/lugsVsr2UaHfZCyRNBc/f+UrbGe4Vgw=;
        fh=mebtUxEF/w8KDNtVjKLJWJtOf+HRsyvwJE1Xyj3kR+c=;
        b=n/8X2HS0TAv9VsjOfa6nbmy9zEi+99thuXxgHpwmt8mVlch9sFWXB69Er+b1PkBi/P
         THegT8VkEQ7jt71z4tqw8NnKw9ESklQC5z0wRZuHsQ/6o/Ka4AHXEREXrUEqqNkB9o9Q
         MIqQE1A0J882Jct/5f+ol8laayXgfk5ncufEObd7ADWpEngnlLQkx7gbqeloFbSO2/Rj
         mM2SnRuiPCPm/ip3ClcWhT5pecRtAghg5EsFcCbly1vqVQBqvczxwqEW5mr92dGyNxel
         Ujy6mthXMNPhvEogtKR+MCb6EZrPDK5QLrh1qsWigI64p02EzFVg7rDPl03wUtYeYRGA
         pGsw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786625688; x=1787230488; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=n08KwR76C8R/lugsVsr2UaHfZCyRNBc/f+UrbGe4Vgw=;
        b=hSbOgKvrhUIQ6LjLD0BFMyXry23O7RJP8g+MS4RsGXccvoIZe1v65LGrKyn/OP7Lh5
         wT0ZL9C7tSYB+YnEzDhS8OG1dI82BA17qvw9Ekexb+6xt0txYvdbbkS6+ro04we7S3GP
         T1awJCkV1Y7JoNLw1bQ5i4+l0ftjcIqh3ZMmy99jTmzX6Ff9AvmJYQnIpr+9khOFoozo
         50hsnCrUlcqrWwuelgfHsH/SJivW+l6OLBwWxJkYpKRCmazPFNIT46jyYojHowum/TCx
         BU01R3Ewl4J8EAVeq06atbFFSYMqKXz7HXdHXGUJ0tVxg0hQXRc4NcIpUeAu2WJJZLZC
         mL5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786625688; x=1787230488;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n08KwR76C8R/lugsVsr2UaHfZCyRNBc/f+UrbGe4Vgw=;
        b=fjIEnUNRe3Q91m8x2LpJR8Lecd179nWgKkoSUfnmVQjc4iuxvRztQu+wd3CYrSz0ME
         QBVqzs5TEzyU7DHMAWX4H8Jyj1+QHiCq72kcjM11a32Nz9fotWXNuyfmk8DFKC7kc18n
         EmRofFlb1Qyy8DUkQHQpzRC2sA1nWkdcFq54by52NXl9DV0l6q53mc+hg+5KZMmzqQDW
         p4tDyE5qVjqwbSXF2W84jMHhTzkwQ8klfmEB/ibf2vII9poI8uABJHuJeBa5PgOgN1Mw
         lmVpqmumXocEjpUXxBl2QErwOcj9L+RTsOi0SQS5+Bp20eXd9bw2xkACyWALrPVwiIMX
         Smqw==
X-Forwarded-Encrypted: i=1; AHgh+Rr1kYIq0/41K2tR5cWtDnRN9kP/KnyPORVC58c0W0FmA4UBBpDYNs5JVg3e0eL8lmK5DBnaW1Vreza/eesH@lists.linux.dev
X-Gm-Message-State: AOJu0Yxl50dsU5gKyU8ErVNo9jQspnPXx0mRLlSKt8P5sgW5OZhzXYVr
	kVO7Wi5FTtmyn+HsUDhSWMZUhqeRNyylHpO3iTJYYCXdJUTE0BLgMmf3IlVTPYuPuNSZJNG8+BS
	zMPvGEMyG1LpybsYEB9IYA6slGMbOM9k=
X-Gm-Gg: AR+sD11DPLkoglvMX6+q5qWs6XAPAtelETftOuImv1ICljediR71KbY3rm8PGZNhGMC
	9DYBnp/E6sevHUM+m5NOQeMkykDsbnV33rP3Xq51xZ2l+AstJXwlm2ep7iTm1tJVPirNI4RbUCF
	qyj8oZ3/Ki9D8PFXzh2HPuZN17zJJl1muC2Fx++hFnpXG/GaHPo/dltEdKJwenhGbQX+Hf7wtsp
	qastjQ9lplcceVi80JkkiF7nZCOVXRYPP8Iew5zv6vZhUQk3+Ydg92O6TaC2rx6uUDassU+ZV7x
	tSfD1l/vtkjb0x0EKcx3f2886v21uv62XUKDZp1t20q9kmNU0SodGZWNdRdgcJRUZryueHXRfQU
	IUhITsdblEI0=
X-Received: by 2002:a05:690c:4a0a:b0:820:10f1:d501 with SMTP id
 00721157ae682-834840f30f9mr24849427b3.6.1786625688238; Thu, 13 Aug 2026
 05:54:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260813121057.2590433-1-congnt264@gmail.com> <2026081359-gloss-brownnose-9846@gregkh>
In-Reply-To: <2026081359-gloss-brownnose-9846@gregkh>
From: =?UTF-8?B?Tmd1eeG7hW4gQ8O0bmc=?= <congnt264@gmail.com>
Date: Thu, 13 Aug 2026 19:54:36 +0700
X-Gm-Features: AUfX_mzMoHQJZ6X1920F44D_aL57Gy8gy5J3aB3Xnob-kby92ca2njFsbE1nxe8
Message-ID: <CAJpJ=Gu25PS_hPgfdY30HbHPCUtr2_t7_2wACLfYfO+Gu+q7fQ@mail.gmail.com>
Subject: Re: [PATCH v2] staging: vme_user: fix flush_image leak in tsi148 bridge
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Martyn Welch <martyn.welch@gefanuc.com>, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 13, 2026 at 7:26=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Thu, Aug 13, 2026 at 07:10:57PM +0700, Cong Nguyen wrote:
> > When error checking is enabled (err_chk=3D1), tsi148_probe() allocates =
an
> > extra master window resource, tsi148_device->flush_image, which is used
> > to flush posted writes by reading back over the VME bus. Unlike the
> > regular master windows, this resource is not linked into
> > tsi148_bridge->master_resources.
> >
> > Because it is not on any resource list, it is freed neither by the prob=
e
> > error path (which only walks the master_resources list) nor by
> > tsi148_remove(), so it is leaked whenever err_chk is set and either
> > probe fails after the allocation or the device is unbound / the module
> > is unloaded.
> >
> > Free flush_image in both the probe error path and tsi148_remove(). This
> > is safe when err_chk is disabled: tsi148_device is allocated with
> > kzalloc() so flush_image is NULL and kfree(NULL) is a no-op.
> >
> > Fixes: d22b8ed9a3b0 ("Staging: vme: add Tundra TSI148 VME-PCI Bridge dr=
iver")
> > Cc: stable@vger.kernel.org
> > Assisted-by: Claude:claude-opus-4
> > Signed-off-by: Cong Nguyen <congnt264@gmail.com>
> > ---
> > Changes in v2:
> > - Add Assisted-by: tag (Greg Kroah-Hartman). No code changes.
>
> You have read this:
>         https://lore.kernel.org/all/2026080354-skater-urgent-31b2@gregkh/=
T/#u
> right?
>
> If not, please do so.
>
> thanks,
>
> greg k-h

I have now, thanks. I don't have TSI148 hardware to test on, so this
change doesn't meet the bar you describe for LLM-assisted staging
patches. Please drop it.

I'll hold off on further drivers/staging/ submissions unless I can test
them on the actual hardware. Sorry for the noise, and thanks for the
clear guidance.

Cong
