Received: from mta0.migadu.com (out-231.mta0.migadu.com [91.218.175.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2C9B48C8BB
	for <linux-staging@lists.linux.dev>; Mon, 12 Oct 2026 14:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.231
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791814750; cv=none; b=BU9Il1GJwAGmmXk8dggqMBT0JiZiyodRjLehlejEPOpYevglZP5ekiY8fz1cKTRWwooAkN0CscVWFEdIRWxxh3sATCVuJzN1jrdxyPSiIXqrVOasWIKkZ/QmaixL5EkugoQql2xa9dmUb1ewlhPAKWIlr8ONos92WgqZCykZOSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791814750; c=relaxed/simple;
	bh=a9Lxp9FaV4JFLzr9Ab9brfnJxgFlHFGfCx6e2RO4akA=;
	h=MIME-Version:Date:Content-Type:From:Message-ID:Subject:To:Cc:
	 In-Reply-To:References; b=CNiKWzc64FOj1g4qeuhgU0wtSjNZCLBoFVP5zk9nwYLE1HcftVbRm1EejG20Gkw1Tl1VdVFHlYAFEHCKIerwyBiR8lNjYDwHph0ThmhleEJz3AWHl2QI0piONc5Mfxi7SWtbQholrwr7xjF4bg6/qZWbFi8aC9+5zUMefuhM8Nk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=MaqrMAqH; arc=none smtp.client-ip=91.218.175.231
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="MaqrMAqH"
X-Envelope-To: linux-staging@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=a9Lxp9FaV4JFLzr9Ab9brfnJxgFlHFGfCx6e2RO4akA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791814745; v=1; x=1792419545;
 b=MaqrMAqHAkIF4/OQN0UoYPKOjMvj70UGzF7OImSdGxmpo4LJP91lWLsRptbYxdJjmrLEEaCU
 wqsNHAhQ45/L08Zt0jo4yzCpcOM15kMJFpFpwbc1ibPZIF/DyzKce67kFL/JeQ0firmPi1yiCyA
 ugz0iWZZvc/Rp9tL2aTZAyKg=
X-Envelope-To: linux-staging@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id ad3dbfd57bfdc824;
	Mon, 12 Oct 2026 14:19:05 +0000
X-Mizu-Trace-ID: ad3dbfd57bfdc824
X-Migadu-Flow: FLOW_OUT
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Mon, 12 Oct 2026 14:19:04 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
From: "Luka Gejak" <luka.gejak@linux.dev>
Message-ID: <7e9af4f7528da1307cf62e53cf6b00fa9c4f674f@linux.dev>
TLS-Required: No
Subject: Re: [PATCH 5.10] staging: rtl8723bs: fix OOB read in OnAssocRsp() IE
 loop
To: "Mikhail Dmitrichenko" <mdmitrichenko@astralinux.ru>,
 stable@vger.kernel.org, "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: "Mikhail Dmitrichenko" <mdmitrichenko@astralinux.ru>, "Sasha Levin"
 <sashal@kernel.org>, "Fabio Aiuto" <fabioaiuto83@gmail.com>, "Alexandru
 Hossu" <hossu.alexandru@gmail.com>, "Hans de Goede"
 <hdegoede@redhat.com>, "Navaneeth K" <knavaneeth786@gmail.com>, "Michael
 Straube" <straube.linux@gmail.com>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, "Dan Carpenter" <error27@gmail.com>,
 "Andrei Khomenkov" <khomenkov@mailbox.org>, "Dalvin-Ehinoma Noah
 Aiguobas" <fliegbert2@gmail.com>, "Michael Huang"
 <tehsiu.huang@gmail.com>, "Jinke Wu" <coolbeaner@126.com>, "Nikolay
 Kulikov" <nikolayof23@gmail.com>, "William Hansen-Baird"
 <william.hansen.baird@gmail.com>, "Serhat Kumral"
 <serhatkumral1@gmail.com>, "Nazar Kletskii" <nazar.kletskii@gmail.com>,
 "Jennifer Guo" <guojy.bj@gmail.com>, "Hans de Goede" <hansg@kernel.org>,
 lvc-project@linuxtesting.org, "stable" <stable@kernel.org>
In-Reply-To: <20261012140642.1076-1-mdmitrichenko@astralinux.ru>
References: <20261012140642.1076-1-mdmitrichenko@astralinux.ru>

October 12, 2026 at 4:06 PM, "Mikhail Dmitrichenko" <mdmitrichenko@astral=
inux.ru> wrote:


>=20
>=20From: Alexandru Hossu <hossu.alexandru@gmail.com>
>=20
>=20commit f9654207e92283e0acac5d64fe5f8835383b5a23 upstream.
>=20
>=20The IE parsing loop in OnAssocRsp() advances by (pIE->length + 2) eac=
h
> iteration but only guards on i < pkt_len. When a malicious AP sends an
> AssocResponse whose last IE has only one byte remaining in the frame
> (the element_id byte lands at pkt_len-1), the loop reads pIE->length
> from pframe[pkt_len], which is one byte past the allocated receive buff=
er.
>=20
>=20Additionally, even when the header bytes are in bounds, pIE->length
> itself can extend the data window beyond pkt_len, silently passing a
> truncated IE to the handler functions.
>=20
>=20Add two guards at the top of the loop body:
>  1. Break if fewer than sizeof(*pIE) bytes remain (can't read header).
>  2. Break if the IE's declared data extends past pkt_len.
>=20
>=20Fixes: 554c0a3abf21 ("staging: Add rtl8723bs sdio wifi driver")
> Cc: stable <stable@kernel.org>
> Signed-off-by: Alexandru Hossu <hossu.alexandru@gmail.com>
> Reviewed-by: Luka Gejak <luka.gejak@linux.dev>
> Link: https://patch.msgid.link/20260522004531.1038924-6-hossu.alexandru=
@gmail.com
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
[...]

Hi Mikhail,

It seems to me that this was sent by accident by running git format-patch=
 -1

You probably forgot to commit so git made last commit into a patch file.

Either way staging rtl8723bs is getting removed in linux 7.4 so any
further commits for rtl8723bs are discouraged.

Best regards,
Luka Gejak
