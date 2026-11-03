Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793698363;
	b=2WFJxTp6y/X5Wba7SPUt3rqfzHb2fkO9GGvzY95o6N8gkQtrIQAUQj/zuLFW1mAGlYZ/
	 /QId76dTMlZlB1AikqFksRdOb0hqWGLWIdUfCnYYRccofnSRASFQ5iPMoayHhEDZztUgq
	 FG6iNX2lgqXdD40SfyUZj6pDpfHsYaAAQBJ/VYZq6E0+jKMdubALaaNX6h6a/PEg5XcpL
	 75MQInEDqBYwZHwb0uYYgfnrWaJoiJ/MFvbx3p38Gc49jZGdKwINLNeECY7uO3xB121mo
	 FxIBE5DId7SLdDWQTsAPlEFpZ4RNlyYESgDv5bQ0MzeKU12dBa8wO180Kc3eyFQtaXw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793698363;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=EyZKRdruJnIAj0M6vq8KCInmZjQrUNKMEcYKRcp5WjQ=;
	b=yvRzCvZHowVkKFmdGNpTk3Cg3qx4G7vk7uyOglFUshoh9c3y4XA7y8rAWg0MInOsni/A
	 vJ+ILsQ7uV2/lakUI6JD5PokOuWW7zLqz6UkCpEbZQmCHeR6LGcBYmX7wociFSN1XGnDa
	 gOSJ2HUgcniQQdVi3bXJHiF7bFUtknqU3UFHcfutDq4Twi/9zvQyn4SCNdCQT9843SMP0
	 GBqthIyubywfuq3wya8zlBBp31kod4UmHOvoyHHrdibh+k29rYqgFpWhm+86EUuDxzAWH
	 /nH246KOWAVbSXTgOfhkB9yIo45InsoAj6AEzHQl3JYrqXtWTgAh0xp7/Bk7CRXPN6Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="yjpvUW/+";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.49
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53C52606A327
	for <linux-staging@lists.linux.dev>; Tue,  3 Nov 2026 09:32:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53C52606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yjpvUW/+
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c4cdc606b47so275352066b.0
        for <linux-staging@lists.linux.dev>; Tue, 03 Nov 2026 01:32:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793698361; cv=none;
        d=google.com; s=arc-20260327;
        b=YPlaQImsr8nsIHK+rPm5unDiTyVfkVjRl7Rm2CLngCx+4IG57tY/6+3N5wa8CnpyKI
         H1PkcqlW2GHUnwG75zp2380x4itMuCF0r0pvwj4OKrbbb62WOiH3MEdqpx694j2+XUb1
         50GYlZ1ZlUjUw2rIhR7AObKWHZpRWGZPTenM8z9D+0j/amHXhTuspkEcJoZVDrcYLBD/
         Fm5RLXKhZipWIPk2MtmxZW8B2xvr35Fjh+fqCuFyIi3nVSDhULY8fPKOVDNZ/1oPpOv5
         SAKX1avXLoCYO7irHF6ZD4RpVqNXRe+1SDoNy+U8lcnUhLNFHVe2IWXVnu1QMiD8VCxp
         eLvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EyZKRdruJnIAj0M6vq8KCInmZjQrUNKMEcYKRcp5WjQ=;
        fh=U8+MgmgEVvcxUT3FHyyrO6V88anMWOVvtbnf2ZO1oJU=;
        b=c2Tx0RhAZLWHRJVANqAxdogWwF3zzYdugbK0Ediu7d+OYHuPEBNtzzD49T589Mv3lE
         v4LlTGGai7nQdJRYTKPDWsmcns+lPKIg+uKyFKVSK3jctfH7BJmm8c7g4eHOzDyZdHZs
         6bfEho7n2afJh5HqN1x65ee5ELCWj1tlJ2g4MAseE/g7H6XsuF4SjIWjSgYu9Rgrskwo
         SpSRstHwkNMcRdSHYSgeLMt9SNWEsu5/QMrdE9V30NSkbZfJjENibtSvwObGcC7Cq74Z
         qcthYHn54wI0ZJuWeJ9aIXGaAl0HzGR1tGVffANrwKK1x6TxBTzjIoKh4t2dggqSqrPX
         fPfg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793698361; x=1794303161; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EyZKRdruJnIAj0M6vq8KCInmZjQrUNKMEcYKRcp5WjQ=;
        b=yjpvUW/+p76HVS3AXe9oqopiYxcqmT3gVclbQXEbMSQZBXeC2A5Y0MRCf5tZeN1tXR
         p/KeLPQG7q9qsBNJaewJHK3VV5TZ3vFtWsCrbfMZN2TJ0+O9Iq7vFElgWiH8JE2WBuVh
         PIwTrky31d1XHKiywpG7+y+PwZ0u3tqN2N2T/jaZ+/Jr6DANcECt78GEQ/3SNZEBBYUT
         ZFY+4wX14zmiemyVnNcGTj276CCpyE4gONHCc6O4nh+eDlJxJn2iJBy/DKyq0TCarkGD
         Y/sivTReA4xOaOUBw3ihDTAnETqPZTppTWfbKNaMTWNMpHa+OTgJcUtCI2/G+FHJAyU5
         254w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793698361; x=1794303161;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EyZKRdruJnIAj0M6vq8KCInmZjQrUNKMEcYKRcp5WjQ=;
        b=FS/rHNExV/tXBJuL2rGC5een4s14hNkJTv1WJP7qQh9G9//h1O74sO7PLFN50c4F8i
         fPba4lN1Ctpup0/nG9Kzzps2fVt6I670Ja/o5M6rgVnFhZV8hv0xLgy1hbNBBolSp/b3
         lpleEX3VuaA8OeFJLSq9ClND/QfkuFJdVrCUZmU+RPK/OLBQ1kFpUnGlOpToc/CUnNBC
         vrroL9AKVEKL2R+dwmPNo/vjolXU4hZ2UZrtwp45tR+Wz2WJcMovhdv2o6Mz9CKG8p9V
         kfVyqzhuzSGVKwXGgSCsgGLjx1rVbGMJ7KQIxoTNL7dTJmlNVNszbnPGOt0ALpJ4b//S
         4VcQ==
X-Forwarded-Encrypted: i=1; AKwUvBz2Hpd1dn4zcS9bRhKFuWE/iSuJnT8sKvDfIYwrfCnZsGOg2/Ki72XUjccu1OyEAtkSIwClV08XDNfw+7/O@lists.linux.dev
X-Gm-Message-State: APuU4Z/ud4Fi8cmwbn7trml6NNpq3Vhu88BixeFVvgjqDJETcT8V/Z4w
	HBkUmj4B4GcoC+VRzsSBet2o2ibg246hfwMasTgVSZuBqh6KUBx87GbjdNqXfgIfoz3VV0NJXR+
	Q7u7zyt+yq0qgyYtWHoWFDbyT9y5w5T4=
X-Gm-Gg: AYBFou3KdpgMy2J6GE0OrZ1IyMjLC5JdLqUhR78GVx8jRea3lFt/E7rYlcET+SQuQG4
	yx34XCNI9G9q+K/qBBdCLm7hKX4u8Q/VaPobtFnJBUhEYCynIYjUvb5gT4mbTkutukfPRAOAFmh
	UyVee9K2rIDQoPJNZ1Bjd0Id2diggk9foahvFsShjERdZLZTIgqc7TFUSnoer8egi9WP7H+8VC0
	5ys3FzhxciOqsSkdSKNrblWHP3OYtXrd6OjWUTVwTfTHc6P9aCGBllQufb/eKJDdMdMMog0OkQ8
	eo14CzDRjXbJ/umC3SX3y7vvuVc99O2tPiXooQSmos82YysuPrdANer456qPXXuyiTkpsvhBkTv
	uSI2LGnAK+HzbfspD/2NSqNdHauPG0kFf3CtIuSqA8t0tRqaNoEedW197+wUbfhWOP2VNYqWZR/
	jLtod08MGGt15AW0MvBbfD+ix0Ym2zlAECsgQXHcESUpzLfVKLZJ2OuZjWipg4w1TeWVaBwQjwg
	owQJa/7Nvuc+iByR4Ns0uG19A==
X-Received: by 2002:a17:907:6eaa:b0:c40:bbd2:62f6 with SMTP id
 a640c23a62f3a-c4ca7a730acmr1005018566b.19.1793698360533; Tue, 03 Nov 2026
 01:32:40 -0800 (PST)
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261101184915.33899-1-amittibi123@gmail.com>
In-Reply-To: <20261101184915.33899-1-amittibi123@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 3 Nov 2026 11:32:02 +0200
X-Gm-Features: AclHuK-RtmLK_Q39u8fbW3hnbONKklVvIvh3AUZDr2AgWSlxsUma7DTEWb_oDSM
Message-ID: <CAHp75VcnkufMDT-NV75jzR6qKH48KbPnUgFHUNrHMATZ9NQrMw@mail.gmail.com>
Subject: Re: [PATCH] staging: fbtft: remove unused ssbuf member
To: amit <amittibi123@gmail.com>
Cc: andy@kernel.org, gregkh@linuxfoundation.org, 
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 1, 2026 at 8:49=E2=80=AFPM amit <amittibi123@gmail.com> wrote:
>
> The ssbuf member is documented as unused and has no
> users in the FBTFT driver. Remove the unused member
> and its kerneldoc entry.

> Assisted-by: LLM

Drop this tag (it's outdated now), instead use comment block, after
'---' line to describe how you used AI.

> Signed-off-by: amit <amittibi123@gmail.com>
> ---

...

The problem is that Greg KH won't accept AI work against drivers/staging/.

--=20
With Best Regards,
Andy Shevchenko
