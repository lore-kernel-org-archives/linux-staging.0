Received: from out-172.mta0.migadu.com (out-172.mta0.migadu.com [91.218.175.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEC36339844
	for <linux-staging@lists.linux.dev>; Wed, 29 Apr 2026 10:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777457906; cv=none; b=Eap/rYCcAa8GT58KXYjggx0UT7Jdv3HmYSRnUSBBbld/4XndY7AWq2sW5tA7qQQMftYYA00CNaIa2ciZsZsJJxsyJaTJfIVe6QPYsHyzEKq6LjKMKnln5aBZhqhfqurTRp5r7ySNcRabHg3oGB3vGkajvfSuXvyGwe6gghn0JHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777457906; c=relaxed/simple;
	bh=1jwCSAgBl03n1szCVQunuQiJlMpUXqHEBtvVvyuE2Nk=;
	h=Date:From:To:CC:Subject:In-Reply-To:Message-ID:MIME-Version:
	 Content-Type; b=o8tPlPfljh7C8unyBLmeNaR3MMoU9JYfjBwHUd/OrConCpdH+vn1IrKasLkU3rHJp5sMXy/35dVReU8mlFs6VAmMshCVAm+1paofM+Sxi8kWoql3W2fvuTsLwbxmcqZUHZQx44eEB/C++6Bv23LZ6rwIMWwliIsV/Hh2w3Vz6+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=WdwPFIGN; arc=none smtp.client-ip=91.218.175.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="WdwPFIGN"
Date: Wed, 29 Apr 2026 12:18:12 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1777457893;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:  in-reply-to:in-reply-to;
	bh=1G8uX5LM87hPOh44oaxE6dpAnpG3I4Mc25DDmTPGUrA=;
	b=WdwPFIGNvEWCtVh8GrYKV0xJupwOpZpP//Z8qB7Ze10ruKJyRdPtP4bh4qeLbeFsSd41Fb
	8F+9FJCwDFUQ/6vX4ZlXLg99B4vi285Q1V2sTPmWYcdvjfK308I5KaqSDM852/6B2pZdRM
	zw7qGkjZLO4L93J+ezKMV7tSgJn9Jpk=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Luka Gejak <luka.gejak@linux.dev>
To: linus.probert@gmail.com
CC: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 linux-staging@lists.linux.dev, luka.gejak@linux.dev
Subject: Re: [PATCH 0/8] staging: rtl8723bs: remove warnings in rtw_btcoex.h
In-Reply-To: <20260427173857.585742-1-linus.probert@gmail.com>
Message-ID: <12186A7D-522A-4900-9E4A-E2B575930A72@linux.dev>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Migadu-Flow: FLOW_OUT

> This series eliminates all remaining checkpatch warnings in
> rtw_btcoex=2Eh=2E Such as CamelCase, redundant blank lines and unnamed
> function definition arguments=2E
>=20
> Linus Probert (8):
>   staging: rtl8723bs: remove blank line in rtw_btcoex=2Eh
>   staging: rtl8723bs: add function definition arg names to rtw_btcoex=2E=
h
>   staging: rtl8723bs: rename rtw_btcoex_MediaStatusNotify()
>   staging: rtl8723bs: rename rtw_btcoex_media_status_notify definition a=
rg
>   staging: rtl8723bs: rtw_btcoex_HaltNotify() -> rtw_btcoex_halt_notify(=
)
>   staging: rtl8723bs: rename rtw_btcoex_RejectApAggregatedPacket()
>   staging: rtl8723bs: rtw_btcoex_LPS_Enter() -> rtw_btcoex_lps_enter()
>   staging: rtl8723bs: rename rtw_btcoex_LPS_Leave to rtw_btcoex_lps_leav=
e
>=20
>  drivers/staging/rtl8723bs/core/rtw_ap=2Ec        |  2 +-
>  drivers/staging/rtl8723bs/core/rtw_btcoex=2Ec    | 10 +++++-----
>  drivers/staging/rtl8723bs/core/rtw_cmd=2Ec       |  4 ++--
>  drivers/staging/rtl8723bs/core/rtw_mlme_ext=2Ec  |  2 +-
>  drivers/staging/rtl8723bs/hal/hal_btcoex=2Ec     | 12 ++++++------
>  drivers/staging/rtl8723bs/include/rtw_btcoex=2Eh | 11 +++++------
>  drivers/staging/rtl8723bs/os_dep/sdio_intf=2Ec   |  2 +-
>  7 files changed, 21 insertions(+), 22 deletions(-)
>=20
> --=20
> 2=2E54=2E0
>

LGTM, so for the patch series:

Reviewed-by: Luka Gejak <luka=2Egejak@linux=2Edev>

Best regards,
Luka Gejak
