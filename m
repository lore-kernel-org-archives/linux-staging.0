Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C42043D47CD
	for <linux-staging@lists.linux.dev>; Wed, 15 Apr 2026 14:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776264867; cv=pass; b=XsTxbtchd60341jTxZaAHdkiN4W9MhstOSyInCGDJOzRPcD9i+rBFlUQTE/P5fwpac08wUtGhuE8U3TcwA478XZegcCEUyrTGRmvCiswzLWR/Knz74rHFz4XLJMN39DnSHBlZo0uSXPTFF1wLcv2Zmn/S+qmLZb+ZchFXCZaI4o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776264867; c=relaxed/simple;
	bh=1FmkV2LWMuaZfhbD5FtwEBtx99sGRwi7IC6H8W4R0jU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Isf0og1DyVm24L1taApUPU+mhIrnLD6tF77J+OmQvjNa6NWSvd/otk1br+aXJjUcg5wGDUDmsCeTjuI2FtiNDfXrcsrak76aKfczIzQpO3wMFcmUftAe2Lw+AFnYb1qPvqmnQ1A5I/j1fPTQh3r5rBI5TKI+7Sz1FcbZn4X1cJc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FA7cJKHS; arc=pass smtp.client-ip=74.125.224.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FA7cJKHS"
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-651bc83e74aso3763933d50.2
        for <linux-staging@lists.linux.dev>; Wed, 15 Apr 2026 07:54:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776264866; cv=none;
        d=google.com; s=arc-20240605;
        b=Tf93r8XdqStkXug1qxv6WFZ4dD973WA9Sw47zi270ERx1UTuY/WkJ55Qno3FoO4hUt
         tKDcTe4zHs8wXQTz3NCJK3Xs6MfVd0mYOJiCTgV80YaGEiKKfDK7qZfDlgfs472tFI+O
         XUMlSt5KgDG1ZQXkhy0tA0/ffxNVivR/Xfj/Zd9VQiR/H+BsKDFPL6vaoVRp+WqJoQKd
         WCLaqPStxz4lLcROJONTdqQuuwRGO3NhMGIhC6ra7DBZ2RwUlaCdz3ga5WHzHrmFahxs
         81jow6qzki/16UeJTwoxCJQE0XARDkevaWlaIKTe2BFgQXvZrg7gpGtgbyXFTW3KVX9R
         Lgww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5NbyNwKQiN4ucjEG40sD5wfDcp1ycSKcsBCugZj/lPk=;
        fh=RvwCnDDa3Dj1jQUbh+Ry2MR0CjNxzRUu3Ddc/3Ei6qc=;
        b=fwDpOvImrRYAPYPBDm79PUctT0NFkNjrTasWQVkpH7p1CRDm3j55AKptJ3hl9b5Lsu
         6EU65cZKOr65y4+I2DDuZWHVtcTHc9vOnytMRx3etqOAse+7onOpHYANXzuc2Q90xGVP
         43EPBVd7Qcg8dLiF2oKOvAHSDedSEKSKtAp9s5jaOVid2t5KXzNwMybPu7lJIAysVxag
         Pb+8kD0RX6B/Sp3L0EDb8y32VbdtjFf0bVuTy4vO0ivnjHtG2axH+rqYBn7zc5ZO++Bn
         4nXOkANhtawPvu8YjTvYObBTPBwtIsGdtBHVBVKfE4N3h0xOdnkPLzcSrjmMXL8e9duJ
         sERg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776264866; x=1776869666; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5NbyNwKQiN4ucjEG40sD5wfDcp1ycSKcsBCugZj/lPk=;
        b=FA7cJKHSEOyEn61xqtUwXqISoYcvMUZCxUsOrNCAuzHs6PkGFWv3yccffgOqLI2mw2
         D9YWvAaYakdsvHIELBRMSk9mOpLJLX1Ul7H11j8BE8b+lDrQ3V+O2q+rpe8cBB3VOiwz
         ESPyz4ppkxvKnIiOQhJmTLZi7KPzzgQrPGig0r+EUy+5XXQRNunpOT4Q6rOKffaJOfHp
         MNwwF3+9pOMUKfkx1zSRofhsKh8dRlo2YicG0o3n9tADPsL5wsZ02mgNccUzsodBRDDM
         Pmjz5LXamWP+4nybz6hPZMKvc6AD/J+7BMp7Tz73gERX9L6FqRE810dlXst9oRKPgXwi
         hS5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776264866; x=1776869666;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5NbyNwKQiN4ucjEG40sD5wfDcp1ycSKcsBCugZj/lPk=;
        b=nu1wHSgI3Rcnr9fgpPUoaOBpCSXZqu/lubhpVp1vv7oWrRfFfsKpE8PxVs1jKtlWLs
         OqWf3938GtY8phRf9jH4/NL8m95/m1cWMKmHyDV45OfqNI5zAYO7TNC4pELMQjdOs/A4
         VYe99a1lod2Y3YxrDR3H+8aW02OJT5GDVkx2x6CnZK/c9savzkEe3dgEI6B/2gCCEw9i
         KGiZxwgUh9z40/nircZ5yNYaRCCrbkbUb8dj/Z96YBWzkuHiI8DMUGD/V1zweGgapgfH
         AsdwxjaMIBPGLgDYfkxyPWeOGlAtc2Dot3zBu14UqH1ON3RcFBZwc4717e015wWlrtP1
         yGxA==
X-Forwarded-Encrypted: i=1; AFNElJ+6rWivuwg9q6wj+w95dtnm8eq38MTWM+NldLr+vovq9CECdvUmDZmsC58LREKTL3Rus8P/1OUrbp2Bdrv7@lists.linux.dev
X-Gm-Message-State: AOJu0Yz6Yxg5cQFt7n4q4U/F7XFcxitxTh5SSoFcB9ARpY4EuFzHO8bz
	AAKPYJzZcmRogii4jmBIIgGYRzYoThlgJBa8uynAPJFiPub/HZPsQEqI7sZV3AondESVpaGf/US
	qC4ts9usoU9p7CZKPV3N2cTr1BkCGWfU=
X-Gm-Gg: AeBDiespViKxkRlQbALpeMp36aFZGsDZV/sOCRAXQwQOjj6ni8zr7qbM80nrLG7VS/C
	FW0QT8TjFGhaCjWgQB6oeBf3lnfVXV/+CJgnR9VyYhlKVPtiEqX0gqFYVwn6/LwyEiN8ztSOLq4
	G/DA/NeL1A7EBAIQtBd5WvLxpDM2iRYvBRmgx/+9Sv0OnR2tnhs59OO9ZFzMo2WVxLSNLtY68ZU
	6c4FgNRpVauCqQlUWPoKQeFlOFJ1VFlVxcf06eTGP8uJ9A6oC4bguuRnkh6TQ+4/cZmu1s6xyOb
	5c6ODRm2gHQk38zg+h3l
X-Received: by 2002:a05:690e:1407:b0:651:ca68:be25 with SMTP id
 956f58d0204a3-651ca68c0b3mr11838654d50.66.1776264865801; Wed, 15 Apr 2026
 07:54:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260415122939.77847-1-m32285159@gmail.com> <ad-FcZeXsFlSPXQj@stanley.mountain>
 <CAKqfh0EEvEwF3QmgtNk2znsaamGFCc0muGjY3zsH6OogsZS8-Q@mail.gmail.com> <ad-XuNMor_ORjyOt@stanley.mountain>
In-Reply-To: <ad-XuNMor_ORjyOt@stanley.mountain>
From: Max <m32285159@gmail.com>
Date: Wed, 15 Apr 2026 09:54:14 -0500
X-Gm-Features: AQROBzCQeILbpKdwQzAuRTa5locP_gLXQMJMn9T_kCeBS40cbnqZGMIS571WEFY
Message-ID: <CAKqfh0HadgG84FXd2--CwOQR00V7CHpEWhL2OfkZJSyo3PepTg@mail.gmail.com>
Subject: Re: [PATCH v2] staging: octeon: remove SPI, POW, PKO, and Helper
 typedef enums
To: Dan Carpenter <error27@gmail.com>
Cc: gregkh@linuxfoundation.org, tsbogend@alpha.franken.de, len.bao@gmx.us, 
	yoelvisoliveros@gmail.com, linux-mips@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 15, 2026 at 8:50=E2=80=AFAM Dan Carpenter <error27@gmail.com> w=
rote:
>
> I haven't looked at the conflict.  No idea.  Sorry.
>
> regards,
> dan carpenter
>

No worries, if you or anybody else can suggest a better name then I'd be ha=
ppy
to send over a v3.

Best regards,
Maxwell
