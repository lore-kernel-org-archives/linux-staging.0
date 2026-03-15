Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38490374E68
	for <linux-staging@lists.linux.dev>; Sun, 15 Mar 2026 21:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773611372; cv=none; b=mpaJikNvQ5uef4KZrMrSD5xvWSQiHVGc1s9xgUWE2A9FeXXgd5D3W1fchok8rrXYYDNGIlv1Naj+FM3WDshBcwaEJ7YrvSkXmI9c3pm2EMf+4bRXxkqMdPELtwXc2RKBKMOAwTVbGAqBdrOtdH2IQX5i+740RknU6rZfigJno+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773611372; c=relaxed/simple;
	bh=Qxv+0hEJYOFZkN5TsZs6luIf1ayGG9y3q6VTgDkvQv4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ijjNLw2eZCFZOMFbP5i543qgbzITivHT5uoagg7NlHi3hFcl/GluAs3/42j9988yldeuMhNYnsMqCHl+4ziXmWi1GIwlwsvVdnqQShefJ3vp/gUJBkn1eHIvXkJltABdHRyn3jNvSFK/lA03W7XA88n9OkRTMb4G2gV5EwqUO68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bZn5dV6h; arc=none smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bZn5dV6h"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-2c0bdf1988cso1042521eec.1
        for <linux-staging@lists.linux.dev>; Sun, 15 Mar 2026 14:49:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773611370; x=1774216170; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qxv+0hEJYOFZkN5TsZs6luIf1ayGG9y3q6VTgDkvQv4=;
        b=bZn5dV6h6AKETEjnhqzVNQ+nYCgEpBd3LENSFACgLAuYVTSwDlT3RIw9m4jFah3Pne
         sD0aRI0D9sianp84hQNOhehoRZWkNl+Cj8l6vh/fPasWdzDC85P8ilhfWpBjH0CFmaLs
         J/w7eouAbCOAOBfc31vb52z5FnPIAbujnuLzqSKomDEabuCVetgZgpJVwFWUh6B4XLfJ
         5ITX2ICA4iFYL+e5nOLW5mgxdm2OmL94+gX52JPq0T090Zs3N+6jkcZh9VDW/9+bJHFM
         N9AKDWrBs+oSJMcuwme4Wb0moLJO8+plQstAYM99OTaMISL2H0GNvoEYZr6hI8qyCRi7
         q3vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773611370; x=1774216170;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Qxv+0hEJYOFZkN5TsZs6luIf1ayGG9y3q6VTgDkvQv4=;
        b=ELb8tNuJgLiMV9Bmle5Y1nWMQOzmyYRQhivTeLrXts5Her6Tqbyj+vSDhUHaHB09vS
         Px0Uidq/kytyVDMjh2+LhVyRO3cF1rkGK/sqLBR4z3+AZhmnNm57X6yl/wi9NxHLzefC
         46wQmEIgYEsQp0Y9nupck/NPGAUd4So6i/zPFV7tCp57OzL6e/Uq+R9MdL2Bdfzdd2Vv
         BbNKnikGgyxYJ1sJrPqC6di2p6m310hOXSNZEnrws1ktAi6IK5roQzGHrnYGmhC89yCd
         c2nbT53+8DV535X2bYB7sJ5SoQSouGsu+kOE5OlRV06pWTICZKxtMme7h40PUpecm5zH
         SuRA==
X-Forwarded-Encrypted: i=1; AJvYcCXPdTUwAKCCqbNedUzYLDB7jk90qI/4Le51N8cb8A+ig8J5v3658C0M8YlcWky7gqy25kdsZfROjk+KEmi9@lists.linux.dev
X-Gm-Message-State: AOJu0Yx8P1ImgOskcedzmPFM9r43NZ4rOpfhhdIQ7iG8b7hauxsbE0xj
	TOXbhuf3x7pcdl2w2r25dSdxKU5kF/FAtP/5rpkwlJnwZOhOyWw6Du8E
X-Gm-Gg: ATEYQzygTijgcs0XHNJ81vdJUf4Sa1gPbE3ejVNRtPu9456yZDTHshMSVJT7AoXbT1b
	wiQk6XfsYCrFAxBTj/le6wfZmI6mXKVpXIpEBmNdQSBnDTpIrbxnxHuu9jx4tTLD7eq8loIeSCh
	OCM/7Al5X8FASx7KDj5Pm6oy5CvdLh0jTbMWgs058pOdVnbiKUIjKMlvWI6PubTb9AU1RWs7EfG
	MXWOO+UFXUKap4my+dr0F8RUwo+i5P0xSlP/XTtCAJh0xJaF46piE9qnwv1O+QetuqCs56l0+oI
	+pQAI97X0mlsYDmvKnpopv2FszCWosV1HZJpt5oDnisLP5chcFUAMJM3mlYOkAkjRHcZ/gyaKc0
	GM/hNTmGmhJe4v+bUupokF5D/oBSo7/cijOs02OmsgffVQ/iy5IsyBXP6aZkKs4sJajxxOQlJrv
	3W0lucwUGGELMhFqCJtZ3YCGFvuW1SiZZWoEPqJfEx+VtOG+hOsZP0j9W8eA==
X-Received: by 2002:a05:7301:2f9b:b0:2be:171c:503b with SMTP id 5a478bee46e88-2bea547de61mr5131000eec.16.1773611370199;
        Sun, 15 Mar 2026 14:49:30 -0700 (PDT)
Received: from unix.my.domain (191-217-32-216.user3p.v-tal.net.br. [191.217.32.216])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c0b1fc876csm6441974eec.29.2026.03.15.14.49.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2026 14:49:29 -0700 (PDT)
From: Gustavo Arantes <dev.gustavoa@gmail.com>
To: marvin24@gmx.de
Cc: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	ac100@lists.launchpad.net,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Gustavo Arantes <dev.gustavoa@gmail.com>
Subject: Re: [PATCH 0/2] staging: nvec_power: quiesce EC queries for system suspend
Date: Sun, 15 Mar 2026 18:48:51 -0300
Message-ID: <20260315214851.15008-1-dev.gustavoa@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <233329fb-0ea9-d784-b56c-f078a329d370@gmx.de>
References: <233329fb-0ea9-d784-b56c-f078a329d370@gmx.de>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello Marc,=0D
=0D
thanks for reviewing.=0D
=0D
On Sun, 15 Mar 2026, Marc Dietrich wrote:=0D
> Reading out the battery info during boot takes some time as far as I=0D
> remember, but I haven't tested your patches yet. Is the use of sync=0D
> writes really required in order to realize a clean suspend?=0D
=0D
You're right, I worked out some math on this, and I agree that the sync=0D
conversion isn't strictly necessary.=0D
=0D
The worst case with async writes during suspend is a reply arriving=0D
after work has been cancelled. That reply would just be lost, and since=0D
the poller refreshes everything on resume, there's no corruption or=0D
crash =E2=80=94 just one missed update.=0D
=0D
The sync approach does avoid that window, but the cost is structural:=0D
the battery metadata init serializes N queries, so the boot-time wall=0D
time goes from roughly one EC round-trip to N * T_rt. With N =3D 3=0D
(MANUFACTURER, MODEL, TYPE), the relative overhead is always 2x=0D
regardless of how fast the EC is. Without hardware to measure T_rt=0D
I can't tell whether that's 100ms or 2s of added latency, but either=0D
way it's a cost with no real safety benefit.=0D
=0D
> Are you able to test the change on real hardware?=0D
=0D
Unfortunately I don't have access to Tegra 2 hardware, so this has=0D
only been build-tested and reviewed by inspection. I'd appreciate it=0D
if you or someone on the ac100 list could validate the v2 on a real=0D
device.=0D
=0D
If you think the lost-reply window during suspend is benign, I'd=0D
prefer to drop patch 1 and send a v2 with just the PM hooks on top=0D
of the existing async flow. Otherwise, I'm happy to keep the sync=0D
conversion as-is.=0D
=0D
=0D
Best regards,=0D
Gustavo Arantes=0D
