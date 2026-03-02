Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D25541C0B5
	for <linux-staging@lists.linux.dev>; Mon,  2 Mar 2026 17:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772473425; cv=none; b=MTaTPkR+IL/oAU8Vg5FHDr7nsGLILIhW7SmTjdPD4oTqPTYCOrK2vzMuWPRlAE/pIQ/iF3jZCCmp2cJrMqu1tADmQ5YA62hjGuRpkrWlSf0lwuZ+tSEba3vXp36FmqFGrEy14157o/BavjzeFgV7VdkvGRA3bJJTwKNQ2luJcxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772473425; c=relaxed/simple;
	bh=fJsuwWCk9zZDSpQ923GpQAqMWbWqm5ZUN6qi5bn4b+Q=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=XQKwg7E0wN2v+oBLBU9eSuf3zkw0J/F62G+FvQMLP9Ep0PPDRfOtcqkcc4RV6FFzAxkumCCAzXOI2gTsmHF+lf38HOPG4Gql5tI3ZRs9sm3LPZyRbU1nvJ+23SQEEpyKN3j/oYyTm++fwJtdrod1XOd4dujB2H9/ALXfRPvi6xU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MuSTrEJD; arc=none smtp.client-ip=74.125.224.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MuSTrEJD"
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-64ca9ec3ee7so4761559d50.3
        for <linux-staging@lists.linux.dev>; Mon, 02 Mar 2026 09:43:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772473423; x=1773078223; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2c5RnwNSEeAUqxulkYKYwQgOeKK3HsOSsMhvh3OqAIw=;
        b=MuSTrEJD8jKhVYci1vtF9KuubBcDJ7TodzMQdwgNnA4vCMMmALcqSg99HGYIVDcyXp
         ubrmzM0es0GDOqW2MOFFgadfn53j6ufqc+VU8NB/RZgcBjkFch94IvWvnwxggaeAlP+5
         ZAk15Zwl/AOL2U7pflpepObhvsLxxOMmw1OCByEilVdZWffCCNpQ3dYwgiH017AJzFJK
         QOscxpmkhDN8pJVMsGwb2LhCobaQEv6Xm+srIwsOpl8F1fhsFj0UjwY2YUUmChIcyMpQ
         Q+hPKtyVC5p9B7FiNlgo6MvHugWLaysVOtx3vos51O/qe1Rd1hffF/6Kra2sxLE/0N8S
         8yGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772473423; x=1773078223;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2c5RnwNSEeAUqxulkYKYwQgOeKK3HsOSsMhvh3OqAIw=;
        b=K+y9e4nTanjT3JeMWhi3n/nH9BqRUP/AhrayPbRZ9HA/my/wHusQliRLg3vnbQX29y
         D9IJV+Ryum54XibA31XNT2GKY6q0wOA2JXQOe1U69atOD6M3WHJNXTahlzQtadFUbp0c
         R1RCrhTCnUb31veE+RP4rhMz73t32HfT/5ef3R6XKXp2x5IJpG5IlNCYDb7Iy0Pn1zFY
         5DrV3obyqAhP73kKA6Ygod16qoal/tdE/P/KnehXVPOl7QTspKCqcar09z9vLkrxJnoq
         K0iuzT2lHCXaa56QD0GL2c9d+Nyt11UaFpzOltlezGH88qfLVyjp05PJ7M54VKpX99Uj
         R4UQ==
X-Gm-Message-State: AOJu0YxsLqdkMZLZcpD6YQoiuYtP19p2lKKaz9b96q1U00jLd8lD896c
	4pwdYXN7/l5AO47RnagHY5/nF07TnodfbK/qFbdauLpigY8GgLiLNtUq
X-Gm-Gg: ATEYQzzRca+byqC+yqC+ZETv0X+4HzqOv77YAD/bHH1MlAHlLFR4FBTX9mMCMdgjAHt
	T/R5IHdaBuUaj11HxZDW6U+EI18iOY2Sx+W821kIztdru2fn/MWnkEntICxFgMlpp5+kpMK4U0M
	1nqnQibCtCk0pvNC5funMfwE1Z09UzuDrsab+hXIOJc9/zOL9GOZApuX6eIVEPDjKyq2w3RkfCn
	fLHTxSK55+tSpSIsmclhGwX3q30vbeskCltRaBEE51lMqvjlmwI0nGGjoiH1wM9TJV8k2MmF6NC
	v9IG3qmcbNQ81NYkCA8wdnYzhIGsfPRMaMVLbk9cLxSi6JmLDmqz2HkZMmB2Ng+XDfOfpVb+XEf
	vY3awR2lCnJfklriNP/Nhb8qKL3cMMCFLmiE4iAYdWVcfDJzaRsAlQg9wAGE63YqrhxkFfnSDUo
	DVdH2AjQoeKrN2ONZB0da9V6vlU9jXCHjiJO1Ca54nF19duP3t9KiIXnimh+DqqCzcN6b5Exrjp
	KLvOhYxzeymFKWrPoX4F49TYiO/xnQ3MITvVr67bfk=
X-Received: by 2002:a05:690e:490:b0:64a:d4aa:4a1a with SMTP id 956f58d0204a3-64cc22d3befmr8152098d50.66.1772473423319;
        Mon, 02 Mar 2026 09:43:43 -0800 (PST)
Received: from localhost ([2601:7c0:c37c:4c00::5c0b])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-64cb7572340sm5853185d50.1.2026.03.02.09.43.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 09:43:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 02 Mar 2026 11:43:24 -0600
Message-Id: <DGSHDT7BCYTC.1TFCJIZHYUB6E@gmail.com>
Cc: <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] staging: rtl8723bs: rename supportRateNum to
 support_rate_num
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: "Esther Zilberberg" <esty5664@gmail.com>, <gregkh@linuxfoundation.org>,
 <arthur.stupa@gmail.com>, <jannik@jrehkemper.de>,
 <william.hansen.baird@gmail.com>, <kaizhetan@yahoo.com>,
 <s9430939@naver.com>, <straube.linux@gmail.com>, <ysinghcin@gmail.com>,
 <kees@kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260302090803.4796-1-esty5664@gmail.com>
In-Reply-To: <20260302090803.4796-1-esty5664@gmail.com>

On Mon Mar 2, 2026 at 3:08 AM CST, Esther Zilberberg wrote:
> Rename supportRateNum to support_rate_num to fix warning
> reported by checkpatch.pl.
>
> Signed-off-by: Esther Zilberberg <esty5664@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_mlme_ext.c  | 18 +++++++++---------
>  drivers/staging/rtl8723bs/core/rtw_wlan_util.c |  8 ++++----
>  2 files changed, 13 insertions(+), 13 deletions(-)

Which branch are you using?

Thanks,

ET
