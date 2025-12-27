Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 385413168F6
	for <linux-staging@lists.linux.dev>; Sat, 27 Dec 2025 14:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766845514; cv=none; b=lVldE0FK+7k1q3KSZiPN9oGCEimaylgr5pzftlEm/CKC/V7kUShmDZE+2HUzdMRdxav1j38yX8aaRcgjJ51hnzr0eDawW7AfcnxZPNSPpXRVI/YJzA1Hq0W0NV9ww1740leGEv0MpAsjaUb5XLA0VdBPHL8B64LTS3hZ1xGmOCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766845514; c=relaxed/simple;
	bh=J3Wwr64QQ2SpOhKfSDoML0fOFqI1wTu0FLnX32HL/bM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Mm9MW5STPQHC8lsJhTJbUmzugnWg9rOt9w0s0ASZW97OroPokIbi+wBtkUMW9e8Kq5ViPAYL4dXGoATkVKByFdqdXs7RASj3SBdkJ8dT6ldWEMrQ6rFTrtrJDd7rmY0AZpQQjJFfccOKWNOXK51JDtDrWgs5ainysesfpzeSKaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gAD1vvhw; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gAD1vvhw"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b832522b47cso244203766b.0
        for <linux-staging@lists.linux.dev>; Sat, 27 Dec 2025 06:25:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766845512; x=1767450312; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J3Wwr64QQ2SpOhKfSDoML0fOFqI1wTu0FLnX32HL/bM=;
        b=gAD1vvhwd/lfZMPcyUum4bRa9oLzhKg/kSeOccXZZylHyVs/cWHmokYenI/r/qjtqF
         UPAtgWd/SNDcLdzukycC/aAZIl2S/MVrGtJUcKqmMxAWUdUsnZ1NzTcr8XoDAoa6XYpj
         1GJAtOBFwtuwELlrgy9urZztlt8WLB/ydbJ++xmLqiG2Kb5zYdSXhGAFVZweYxkqJEKW
         92Nr2JjsooI062HAgqp2+lZRMcvXb3EtdBH7Yu5rxsUeRfloCZ1ql8s5N6nyA9B+hyTM
         79u/b1TrXKmzKHqILh2qS3HxTclFG7fRkvXY4nCEMZHx13o4CkUyEhVxschI2kGQB+vg
         WFZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766845512; x=1767450312;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=J3Wwr64QQ2SpOhKfSDoML0fOFqI1wTu0FLnX32HL/bM=;
        b=PS+hRVy1/O7G64vEUvR2VyUWzEpNmp0Lq0j6mai0RGEZVBx5FQS/vMk40JJg7yKKfV
         //ojQ9R4UjNgLCipZssa2/PQQY6gFWcsLlHw7es5tzK712XNCHN/PHUAML1a/9Q28WfL
         vd6EiZrINegRf0NmyjNGbxKdkp92Wr6OD8DSVz6kcLf6g2pLt+ItLumGNAmHSZraPboY
         0oRHLEJG8mXnGUjH5GbCJsJlSyE7plXYDm5HI6DJEoPg5WspZyDZ7ebI26iaLRxNLLTJ
         40ysSXXiYBkJW3nouVK8V+c3LtJMBcEJaw6pWrtn5RlINxw16M9aOwgPl4ABSDi2XFT5
         QOjg==
X-Forwarded-Encrypted: i=1; AJvYcCV93pRemBMrgoA1NJARdUqrNl/+efOQ6Hyw2HMLrwuA34yLqoSAccrngRW/5eWpTvVDf15yRRPrvDydQ5K9@lists.linux.dev
X-Gm-Message-State: AOJu0YyfY+mH0qzqJQo9gA6ydA8sMM/FNXysFqUoK9FmekpX4uhUs9+j
	Gr6uP3b9JOS6jQcQm52mh/Qj7PEV+OOEtrnxFTjViYdBJOYdPg6wSN/JMfWYxIoxRkSuFLFQLZR
	lSvfItYQ3ixgCo0iw5S0IHQyMojzqqIrKBdE5
X-Gm-Gg: AY/fxX4ExCmdVu0ajKIxUhJQqNewovirg5WwXA1/duzx8p+Sbex4avqZnoHQkj8BAyw
	SO00QHLZQoxQrjlFdG6HOHJCijWhcp0AGSbHuNSROcl/mb0bIzMIxdc889uis7RLgXCFKSGOHB0
	GyIQFkdkXWW1z0SozVhFF8mFUgV3Kc8z1Gt0WyTUmaBV/OPavBwtInDaZlzA8NVFjIrr30lhIPe
	k0zAzC5OLVMseM30TEtzYNswaDBcKRMISJp4fkP0onuvNVonNQ2KqVVHIUD3wJyATEf1F/h92hc
	+DTyHvKNaSlG0ChvgEKlBu4OOcn6m2NBZ08Fzw5Ep/6Br4JZyieBrn2kLRs2IQ8kSjQl9hU=
X-Google-Smtp-Source: AGHT+IFX0lsgc4AotttgNOJdIQxVyJ6emc4QU5YPq31MHVjjCSjesmYFWIps47Gzc9uXozCoxrNAzwJrn4uIVEmnK7o=
X-Received: by 2002:a17:907:3faa:b0:b79:fcc9:b00d with SMTP id
 a640c23a62f3a-b80371f353bmr3038598866b.59.1766845511630; Sat, 27 Dec 2025
 06:25:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251219054320.447281-1-chintanlike@gmail.com>
In-Reply-To: <20251219054320.447281-1-chintanlike@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 27 Dec 2025 16:24:35 +0200
X-Gm-Features: AQt7F2qk4lZCeAfQafLC_2U29jnpMMyMdVKvtqDPeHxqHBPfiIH3Qwz7nSdnytw
Message-ID: <CAHp75VeiD518W13KU+vn1yykfw1pXA8Z9Co7t5bXbB+KhCtqPQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] fbdev: Make CONFIG_FB_DEVICE optional for drivers
To: Chintan Patel <chintanlike@gmail.com>
Cc: linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, tzimmermann@suse.de, andy@kernel.org, 
	deller@gmx.de, gregkh@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 19, 2025 at 7:43=E2=80=AFAM Chintan Patel <chintanlike@gmail.co=
m> wrote:
>
> This series makes CONFIG_FB_DEVICE optional for fbdev drivers that use
> it only for sysfs interfaces, addressing Thomas Zimmermann=E2=80=99s TODO=
 to
> remove hard FB_DEVICE dependencies.
>
> The series introduces a small helper, dev_of_fbinfo(), which returns
> NULL when CONFIG_FB_DEVICE=3Dn. This allows sysfs code paths to be skippe=
d
> via runtime checks, avoids #ifdef CONFIG_FB_DEVICE clutter, and keeps
> full compile-time syntax checking.

Please, address my comments and I give a tag for v3. I pretty much
like the series, thanks!

--=20
With Best Regards,
Andy Shevchenko
