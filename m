Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=74.125.224.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1795161495;
	b=h7RFH++G2fD09lF3C9cDCDPEQG9iVaY48i4+nM4bPSXLc8+FoEyfaPTRb94fug2gBRqR
	 +VKwPEnK+N6/ZnGbdZeG46Rv6FdXglkOSbQovDUQrtKwISM1wnNLO19i2QUtX9oVnTndQ
	 s0c8hhbGikyZg7Mtx63WqTQ+7Hk5xV0L4FhAvP5Zk3lichS9FK58uXXNflD4837Fn1QYa
	 8CTaDdOwP0lSLcHS0x62ok2OTLsxsNgRz9pEl0fA2lYAD7urq3TaDDo95ijUcLdWnFBU7
	 dlNh3SRmn+Ee6kcumkbSvdF1HajKbRUjHJ2k2JhvssY0vlJhBljVKDWdQJLEpIMHjFw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795161495;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 In-Reply-To:References:MIME-Version:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Content-Type;
	bh=uT5yC1vz0hTCCQYbRPqrM1RAS3M39jnWDO+MUUDgNVs=;
	b=NNaSAzi23fli39xcTApUKR7kb8ey5x249edGMdccSDSO5QIcrpF9LeDO3aTZ7CSUHant
	 hOWfPQlteppNZsag/MVkpPH1Mxs+VIPFjt0oq1dis8vRvEtGR82w0lQz49AdP+oA+UxR1
	 Athy6+A2w1RpNOpETdTnts9J8Q3wirImngL+m5XoyAhKJKa5c9M1xG0KrDtpECoRhHMWJ
	 Gxh+gLiAZ73D9WkXyp00fngw5hDtWunzxjOhDPBCa1L8j+5WbQc3uLUWRWZ2v6ccXD0gD
	 e6UfYlXI/npy+AI2KSPSNFyXpwE5j4f/aVLEH5l8TksS5dt9QmaDu8QW04Pxj+U7lwQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="BQwFF2o/";
	arc=fail smtp.remote-ip=74.125.224.54
Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9D7F606A325
	for <linux-staging@lists.linux.dev>; Fri, 20 Nov 2026 07:58:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9D7F606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BQwFF2o/
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-67df3b1ca06so732905d50.2
        for <linux-staging@lists.linux.dev>; Thu, 19 Nov 2026 23:58:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795161494; cv=none;
        d=google.com; s=arc-20260327;
        b=GXMvNvQrRWmONFYNalp0t54m2OrGLpB/NzeuTzJn2rsTFJKUGOhPeImHYxlsSVXskP
         Rrm5evQ8ooQ4QDnuFyk7zXkFU9F8ZpSZ5EHad++BYGah/biVoBfZZkSm0eLq+FOgaTyL
         b1/Vdvsww3pf+CQjqz7AJAEMocizm/Ft1TamG98a0otIjAIg9VCe4VuILD8uQ0eNHhp7
         xSZulv4qtEWmWyFX0wvbESEtQPo0jDs7cR2vDi8hMQ7K2uqr2PTo1LX3IFgNW9tDSNMg
         Rg/c7W5mKVBE70pEH8WUx22rR2rDsolSRrGUZk/l41VPKSZXICe+mrkGJ7YT4HGj4tTX
         2tOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:mime-version:references:in-reply-to
         :dkim-signature;
        bh=uT5yC1vz0hTCCQYbRPqrM1RAS3M39jnWDO+MUUDgNVs=;
        fh=AaYQiyDgW4tDhMrSXUSn3PQDBMSLM/JHtnnS1XPtrL8=;
        b=Qs/ZGmhYx8DwgVDFjOwto1x3TAnmnrIaOaZZ9uWDu2WbiBGE1KeABWc3mgvfJ8s8ZV
         P98d5WVBlOIoVbOc2WsL3Shh4qFbm6ArcNySxn+1faBxMpNurM3VY3hUpyQDuOe+CZbp
         52lZqGXi5shjWdIsne4j3R75J+wiFHP1TRAFd/ImRBLoBIo2YslH3MTxjdb63YxTBU17
         telQhyZEOLSwJCzMQTJkF23PO5ZlBbrFWDuthlW2KJqkkvarGyO8FCcq1Bj1LPbsG/NM
         ClkfW9gdiK5BjpzZnZ/jc4rCmA+fQLKOG97J+aGye8OYzmbbthHMblfhqHxoL9x6dEny
         fK4w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795161494; x=1795766294; darn=lists.linux.dev;
        h=content-type:to:subject:message-id:date:from:mime-version
         :references:in-reply-to:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uT5yC1vz0hTCCQYbRPqrM1RAS3M39jnWDO+MUUDgNVs=;
        b=BQwFF2o/zR/pXMzr/PRZRIvIFHL1uGbKfBu6tc3Bc3gdzR4C21tGxZRN5V5Det5baB
         XtiLSbOnGkztEOEyISkqUShzOQ9FLjA8jRly9W5YRn7KugnSeSqx2jv4uhZlkWOs3qLY
         qiYlvORLZKDeeKEML5gCK0BXQyag+TMXhJ/JkJhbcGiDiLSaIkFqVYIR0Jj+pmDeIvnp
         A97RAuNpQ+3Ll6RE329PONUh00Chpm2VoVKWd/630/HMUYshbpGYod5OUObt0cNDK1Z0
         ak/8P1waYlRiwOE0h5IM3ZogeDjrOFufO5Dg6mw/3yxbelXtW7ZTNksqsa+hDCtokeEu
         Dvdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795161494; x=1795766294;
        h=content-type:to:subject:message-id:date:from:mime-version
         :references:in-reply-to:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uT5yC1vz0hTCCQYbRPqrM1RAS3M39jnWDO+MUUDgNVs=;
        b=qb8Cc5t7dli+1j+Y/EwAkIpsZturEjtq1wfBA8+6i/13BuPmMV4bFOFWdXFel21emo
         8/qqFuXjNnK1SY2Y8LFbFXcP7LCq/JJqSOQkPW6l58P3tcWjBRbb13bvC08OCyGdHTQV
         GoPeEU/yEpaQ9z6KCxfldjtHQlViqcpsnxtM/2PHpFOSuOhtIzEhplHrbf5KkQGgsBNl
         8SOkt4YhSA8w4zvayX2D2H3eq3xEuZ1wmBGoaTQciNba4/4nHmEHIKdsbK7XkocqA88E
         Xh6/B6rg1zorsh8H7AK6AqeSYGesFX99yMGytEa8uP/x9VlOstjqBi+S0dhZ/XbMReJk
         HLZw==
X-Forwarded-Encrypted: i=1; AL+hErG5GTL0FhWa4DgDm274dYaFX9KBYCXSpr/8DnwxK0U+766YHI7tbfkgIgDIXW+rNJGGU9gZ+UuQOLoNjj84@lists.linux.dev
X-Gm-Message-State: APuU4Z/Rc3OeLK6JH0gtVmr51SKrnW1KNYDmpuLbyP+obxOB5KtNzAtJ
	QRhIIvOFncm0nDWa4xD1WU0BXHCK5aDgyqZAuE2GW5OZ/vtMaf6KayBJEbliFFctoBlJe2kHRWp
	JdOX9PFiH1BPNqd33CBlDJC8PSW/z/MU=
X-Gm-Gg: AZFdTZddsQKHAlNAZ72aPscOi4VdjoptzVtsyz5DRvH8RiOt0Xy5yMFCieRqZHL+CSc
	F+w+aMUCz51KsASVEshCxjTMOg+I7DFGM+u/obk7/WLxPpkyz+ynBu9h7FgaIzkbjBt6gymisbC
	aMyyiwd+ACTKDYMqgyMA6HUGwRg0i29pEWHViHfmOXv2d902mrrHWmj1ay5ThMLfqzakieM9b7R
	ZPH/lpbIgeRC3/hCU+0Ctbr3sMGJqqDzuLBguGwgZdJhlTgoFJ+8x3Gv/qLhyJdmUj6alMTwLBD
	jqYzpunjoboN3a8gEgHKpN5WwiLcVfC4b2r2kP92UICPe+xWhl2mdMlztNgMxnX8uFoqPh8qMUQ
	qIqQDk/7l9Xc8acFZ+9iPZQLlX/kkFtQdUwMUKipHZ3eDy3/05PhiqIElPU5HsrRj6nX5yD9vnu
	1f9aH73Qjc98ykuycytr9DBcNTj3fH/iW2xYZHBykZ6ovstE7ERMs=
X-Received: by 2002:a05:690e:b81:b0:67b:ed25:6981 with SMTP id
 956f58d0204a3-67df446b547mr1140071d50.77.1795161493596; Thu, 19 Nov 2026
 23:58:13 -0800 (PST)
Received: from 1087654160852 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 20 Nov 2026 01:58:12 -0600
In-Reply-To: <2026112041-suffrage-bonanza-e079@gregkh>
References: <20261112-bcm2835-audio-unused-decl-v1-1-3b63a24b033b@gmail.com> <2026112041-suffrage-bonanza-e079@gregkh>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
From: Yusuke Hayashi <yusuke8h@gmail.com>
Date: Fri, 20 Nov 2026 01:58:12 -0600
X-Gm-Features: Aa3M54rDBssWS8x-mWGeSyXCm49DwKaFGXNNyDKNZuSemUCxLCe4Jn6SB8XT-cU
Message-ID: <CAB59oQ92ghkX-GFoZPU8bVSe+DPEpfDrjs2aO08AAG0Ja8y0Sg@mail.gmail.com>
Subject: Re: [PATCH] staging: bcm2835-audio: remove unused bcm2835_audio_retrieve_buffers()
 declaration
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, yusuke8h@gmail.com, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, linux-staging@lists.linux.dev, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, Nov 20, 2026 at 08:21:51AM +0100, Greg Kroah-Hartman wrote:
> Please read: https://lore.kernel.org/r/2026080354-skater-urgent-31b2@gregkh

Thank you for pointing me to this policy. I have read and understood it.
I will drop this patch and make sure not to use LLMs for drivers/staging/
cleanups going forward.

Best regards,
Yusuke
