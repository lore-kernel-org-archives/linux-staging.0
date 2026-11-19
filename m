Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795087323;
	b=JBlP2e8Jqx+TsNziJ54AvERhmMfX51XVM2SFbcp+InCg9vqbuCzurWAO4KMK3k86zyxC
	 JfnR96oKXg2491X3Xa+fVOtxMhlnKwDy+55Vg0J0IQa4yA61Zz4MuxhSK7oaqJQ6NUjUF
	 JqJ44bFyFAGae5JMvpPk3GtxL+8gLtLQDlTXy36Ie0fphvY/6TEx8ivbI3VOem3axZcFs
	 yJCwLfmHaW9U3v58AgNAhRS7gsKR+r3mASrA1N5FhLy0ON3RVAb9Ag7dhbRyNrbg5kuub
	 c1e/jYWQw1O5meG7/n6Kj626AsE3GyREoS8MI0+rX1f6LlcuytmIT5AQirWMjfdB0Tg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795087323;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=mNlgzKi+M4UaxHj70QFOPs7YB28ww2lTrN7u98wXvx4=;
	b=C19ITao032FyTkVBr2HuFjHp1xSEn2DOOyFbSVRJL0A9j9XwGoMnrb8fODvPuJXenb/r
	 bcpt34xyAPGmhwf6W8qE10kZTmPTFkpWEMozZq0DdqprhuWXmpnTmLM9lILMhSXCrXE8f
	 2o3U4NMZAj0gh5TPHrB/0au5nPbnxAV7Cdxo6VVCBr5/taKqAh7Ct7/o4E5zo6otVEv/M
	 yIraOQRadE8BFO6u4jHYTB028x60xPvCDO7g4zc4kL+4c7dXqdd3xHkBCjfqnMWEU0fzT
	 TtstbOgTS/2yKus80ggGlZ+Fff4OEXFuC+ZwiFsgPDBh8PPzyh6MtJBwqcYR42QcFkA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=wetterwald.eu;
	spf=pass smtp.mailfrom=wetterwald.eu;
	dkim=pass header.d=wetterwald.eu header.i=@wetterwald.eu header.a=rsa-sha256 header.s=wetter header.b=WJlQEzhW;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.169
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94673606A32A
	for <linux-staging@lists.linux.dev>; Thu, 19 Nov 2026 11:21:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94673606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wetterwald.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wetterwald.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=wetterwald.eu header.i=@wetterwald.eu header.a=rsa-sha256 header.s=wetter header.b=WJlQEzhW
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-3ae5ab4fcdcso17599811fa.3
        for <linux-staging@lists.linux.dev>; Thu, 19 Nov 2026 03:21:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795087315; cv=none;
        d=google.com; s=arc-20260327;
        b=f/FziAJsGMzAHo9el1nJ9XxTsz9dlLLXAohbIWvdpd6pJs3+eXeln6CSbHP9HCgO1l
         JIAZ8vM52vJgSJabFwv4PUd7vPUD2RSBEWF5dis9z8b3Ru70sIPJZwyMChr0gN0OhvXQ
         BFI0TMN4B8PV6g2MKbvP+CqlLrCeBWbCHoFl8gtBYa/xu7SOZ/Ebbn2pNXxiEmPQeGyz
         fLg/qtE+8X2bicq4/k5VUhc6T7mW7/STpS5qB5u0ZlxOroXtKwGVRGIMTONinho5JWfd
         SDs3niy1Bg7qVMCoQZwOcMcPVs1t88LuCEMjExyXGHld9cy/TttMBSDdvxv0inr0gfCj
         yS6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mNlgzKi+M4UaxHj70QFOPs7YB28ww2lTrN7u98wXvx4=;
        fh=VYjdmIWpsuOH/ojdXkgFwESpCdLHOZeKI1jDM3S2NmQ=;
        b=PF5+ilm5EdFCsfjqfwd7uwOiKd/RZAGzXka4dvoeCX2aovgM8FO2bZuuKFktnFGt56
         LNt9I2sIbVxgszhqa9+B8Snw3UYDQPhtmhpYYGXYd0MPD9Ik9YquTUXA7n0P6xRxcyux
         D878qYDjE4pqNXSU12Qs1V4Pk3mg3JUvu6SSPbEz+hL1Xozuf0XgPYVFBUHgxtEoFCnj
         0Mgj548UmNQqmH2xL3Qdj3PQVU+PiaNJx+20XJrr1FOXbkIpYijBNWnneKzwUeWZVSoa
         85d3UhltGPjYLTuWcQVWRRH4njWHy1uC8kmEDfuCw/xJeCNcEFhV77UcVBvfI7Metz+0
         zi8w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wetterwald.eu; s=wetter; t=1795087315; x=1795692115; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mNlgzKi+M4UaxHj70QFOPs7YB28ww2lTrN7u98wXvx4=;
        b=WJlQEzhWDWjkKQvcAIWEfypB3q0ahB01O5UAgH/lzfdrREM9GNe+ydJe6jMecITkmC
         wQLBwC9M3zxjNQXBJjDrEZogjIVVe/HcmzuSevqPqxdjjs/sscc7RMY2IPvdJtbsshFl
         34XfLt+PywiR+fdjwvQul8gAs0Z8RQvdL5uB7Rrbuz0l4tYP/rZcCJnpEujIwYO9CLcx
         atJCRq5SMmDqLvuBh6Hw54fOUvXvBoYdiy0Ggb6aFPBo53flY4Jg9m5V0rGnliHjwXno
         r6gBWZcBvub2l1wTCV34SQJYQPdoz/Ih5AuGX9E1FLAWrbi1y6kQ8VlHgcjIJMLD80Cm
         Ldpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795087315; x=1795692115;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mNlgzKi+M4UaxHj70QFOPs7YB28ww2lTrN7u98wXvx4=;
        b=AiYz3/vyQkWfByW/lrHz6iDnNhfPR7kYlskPj9XBmD1s2nlbw11bvtPaWM562+GpS4
         H3f+c8KFmCvN25h0yzairzW0N0aN0kmUyAPvTao4XF3p7bd7MR/UBCIMjLdEJINgTliy
         WDmofE9vzJFEM40kVkVp2Enum7WDl7uev2ARbHcDFB0vhqOF1nM0Vm+vUuu1jplOpwzb
         tQ3URL7oSxaI7JtXTk863y78hgHoaqP4TA7tBZe29/IUZI9mfNYZocEkuymZs0mu2lj8
         LAke6ZpqUP6m6Sc+f5xgzc13L5+So3MJP2MEmtptJtn+IKSUKr2V6eMNcjlsP26UDKvu
         1hAQ==
X-Forwarded-Encrypted: i=1; AL+hErHVena4YNqrPfMKLGJoDyAgg7nu/jZ53WU1juMUQCtW3Q+VjxYoAD1Qfs7tcUP+O6sSxKMocwDQIx8UtkM3@lists.linux.dev
X-Gm-Message-State: APuU4Z94/o3R5uR0n4O26SVIA7kb32COBbMNw4wi+iItpWeIW/OLbByk
	nNmfR+B6yMGC44xShb+8XaXXLg6nCKFGSorytDt5isAp6ZlSVBLUrM9hAEi/GM49fu8s0mpounP
	pRMwVNXG12Qr0DG0dRPfQqSZhALFgEmghLg9QQ8xybg==
X-Gm-Gg: AYBFou18dQEiNehfyg7wPeM3ye+i9y0So43lOH8py0hhma98mXaffo6hKgf5PcIR6J8
	rOc5kX6zH83LYWG1zLBoAF+k1wDwEJXrGrt+l7R5aSW2XMKjIbBbRVJMfoQKS59OrhFnai2QYWK
	t+F6GWsNwAEiF1SHO+iL0irwPvuZIvnTVuVTJ9yb5Dk1tSvTtM4bpginVs2vSj6kvjaaQ+JiLh8
	odGS9OeN7U3yhyn9w/MM2MfFu1Hb59+d/IM9B1rxc9DKv6HU2U5OaG8K4Av6F4qTmqyO7MgR2eZ
	bBpC9s5yLADnaTcb3Hobs+deq9HLln3j9p2TM80v5KsuTI+jHtayLV6eEEytnBhttYfJj/58V+g
	N4avPorObs5WnTdZIimZo5/L2gesJrnh9JY6NHHFooq7CdaGzRVxWvtXAEIxDh6g2xm9z
X-Received: by 2002:a05:6512:3ca9:b0:5c1:4f88:9af6 with SMTP id
 2adb3069b0e04-5c1aa2b7f68mr1862082e87.54.1795087315464; Thu, 19 Nov 2026
 03:21:55 -0800 (PST)
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <CAFERDQ0FpdVvA5VJxOyRAE_pgxnPVmFx1tkZio5R272j6Bs4tg@mail.gmail.com>
 <20261022082927.59030-1-martin@wetterwald.eu> <2026102218-vowel-plutonium-629e@gregkh>
 <CAFERDQ1GeAwFGBQ09eu8p69c_b3_CzAeEfTwiEaVCG_22RQdtQ@mail.gmail.com>
 <CAFERDQ2fm9u-Y3DGTFNMH+K95gnE=aox1YogRWPwGFX+6Vrghg@mail.gmail.com> <96e08e3b-f034-4d69-8b6b-4a094cb39b25@broadcom.com>
In-Reply-To: <96e08e3b-f034-4d69-8b6b-4a094cb39b25@broadcom.com>
From: Martin Wetterwald <martin@wetterwald.eu>
Date: Thu, 19 Nov 2026 12:21:43 +0100
X-Gm-Features: AclHuK_QkZ_OGawTlhhrvP9kkbP7VHlaRBS7KCVvE8WdQdIzwGrIlALNsg0Zi28
Message-ID: <CAFERDQ15_=_8a+0nYqE9ef_W8NWVnhys+mSRbkXtKtymDixvMg@mail.gmail.com>
Subject: Re: [PATCH v2] platform/raspberrypi: vchiq: register bus at subsys_initcall
To: Florian Fainelli <florian.fainelli@broadcom.com>, Jai Luthra <jai.luthra@ideasonboard.com>, 
	Gaston Gonzalez <gascoar@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Stefan Wahren <wahrenst@gmx.net>, 
	Phil Elwell <phil@raspberrypi.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Umang Jain <uajain@igalia.com>, Kees Cook <kees@kernel.org>, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
	regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 14, 2026 at 4:25=E2=80=AFAM Florian Fainelli
<florian.fainelli@broadcom.com> wrote:
> Sorry for the lag Martin, I will be taking those patches from now on.
> --
> Florian
>

Thanks Florian!
Thank you Jai and Gaston for the review and the tests.

Regards,
Martin
