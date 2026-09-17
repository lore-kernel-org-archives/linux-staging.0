Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 026683E4104
	for <linux-staging@lists.linux.dev>; Thu, 17 Sep 2026 04:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789621167; cv=pass; b=sUjw8cw2G48ZUH2UZoWssU6dHGOz+MZHGKxODQBsa1wKxNhk5DO+oNP+l7lPokDPr4DIkimRhsZQIzOhsvTfpeF+dFJCVSLdVy8kdu+8hRj+SgxFHprfJfUSKbPLYO+JrAVP/99PT/JvpT3ex6JY5q9O91mDsqs44KCaiSOZvBg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789621167; c=relaxed/simple;
	bh=Ys9L0ucaJJLCKvclDt5NcM4991LNRcI43c0uE7gSk/s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gskplXbDL67LSbvCrDUa0ga98J0nr4CDHr16Pzf6BWV3t+9dTmZIab/J/VXVj3UbviLdKKTxIC2Eu2YD/M5cx6hB+85b7+Fj7xggx5zhhIBRnCDCiUM/wP4alpQ0NRXDmV0n5nFqyK22TR5fhssE+RaRAlgsP4N09znWLz391e8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cYiuaTtY; arc=pass smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cYiuaTtY"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-52fb76c9deeso4795761cf.1
        for <linux-staging@lists.linux.dev>; Wed, 16 Sep 2026 21:59:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789621165; cv=none;
        d=google.com; s=arc-20260327;
        b=JvThn+1BNXLqyULRsbfch8ynAuZYVQTyXGu5BYJXwUGKMQZWB2wUe+Gpi6jEcDbatI
         yefF+8hSSiZMbrNmkltDqpxDjmQ5HwqZC7LGDdLDjvejZ+E/rsu1PVsGnYOTZv8gR6I8
         izJ2ulLc/4fus/puZLTgCdmCq5qCgVk3Ver09SCta1u1RILAFZ/Q9hNyD+aDMSiz5wm9
         1uhYo+p2WeLBSAFW15kcfOOgLYripmetHAFxcgFD/OXntKcy3wmysncsV1gvUQO+zggP
         t2F0vE/s5+cxJm20ogY60RqyK2EqBe3cXk5u43RcJFlS5tX68Rs9w2SLi1nngSZyqzm6
         hwvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Ys9L0ucaJJLCKvclDt5NcM4991LNRcI43c0uE7gSk/s=;
        fh=nKuwFFov2yDi0hzblW81GinubPC3V2W2NILiD/Vrxrs=;
        b=bw821zSbf98cP77+a8wVYPB+adXeT5ZJNN6yhCCPoSJ8e1L3iaQ6QdJ4x433VWOrSu
         htT8z9FloZVvSeGhtL2XhKTcCl3/eSVEKwG6I4tx5vyJh4t5xTmRiSlvW9XGxAieDb1c
         Yd9y6ZWui8+KeUypGesHGTdIHfN9N0RZUb9gnVYrPL1cF48GfBGNOcTIJIOuBHZVP60J
         I1BlBVPKheFBKbMrAWMsE7JZ8yZBaOFVwAEK1RIREzJgj8hfiNsNd5Vn/WoO0geQ2QTD
         J1LS30DcCoRcJkL+nnelM3HXXEQMEBxMbDrAgZ3j1iblMhFjM/Mf41cqah5N/g0DGj8e
         E6tw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789621165; x=1790225965; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ys9L0ucaJJLCKvclDt5NcM4991LNRcI43c0uE7gSk/s=;
        b=cYiuaTtYb8DCnx/bYCraOTFC/D1fXoRP7q91vp9+3KGJtGZSAloLZECEWUriLXg/0/
         ygRLHPwVZUPjeOJD17n0g1eexfCqDPVqrKeX99qWSCQ2ZWKGaRov4qYQ3cZMnZ7gXNL7
         au84VoR7aJ0Oq9ysQ8PBP7qWWgrkZaejnbi1Fjn3/sil6LYIKSgdKaCWrFTIJZNYdtmz
         eAoA69Qpi+phDlm6ZGgvp6U4/cUgkI9BPXjaWLWG5V7WlzZHmTYDP5CeWZV7ynDgMayy
         D0sMdJTfFp6a4AcnRG8NEAb7SKLLSr8F3Ssuei22DvyNrNHXOBo/DTFRl8U/VqrCi0rg
         Z14Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789621165; x=1790225965;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Ys9L0ucaJJLCKvclDt5NcM4991LNRcI43c0uE7gSk/s=;
        b=Wx0FE0QyuOfFoYoCA7GZ4gQD763OIHQTo1p/SNs+2KQMqLnU0mJV8FaQHP+7120McE
         V0UHYyAOxO7VrzhqMSGLVwHS8oSdgMvjrT5pKcs7AIoZg5/QjDBR9tXXn0PCJ3adgBGX
         BZEZeSqWLwYN6M6fXrcHfdJBj+7lRJMJ8KfhciseFUcd1/fI7Sh9sxJkf+WBdTuiMKZs
         H08ZJNF11Vpyc/j0Y+iwI7WVU4H4fvDszum684z5Dv4SwlzTQBRA+9Kx4DTijk6SIejS
         PMwFieuFCiqEjEEC7frWUFiofcO5kUfMZac1jCfHsh3CB4CVOKaNe/WvmRfWBtSjzBE7
         N9kg==
X-Forwarded-Encrypted: i=1; AKwUvBxus7DsHemAgTrIESKE7EPsuuSCL4go39MaAIytEd46yiXL9vlQ/iUtxcfPi64Cyb8KtDPnLyF6KEa2EKDu@lists.linux.dev
X-Gm-Message-State: AFuF++nDiw0DcYRqbcw+jZmGAClDjS1ZcxKsFVKiwFb8QjrLRom0TdqG
	UXQZFWLq+zFYRfApeRc/xk9yDin2e9zYsX/l2Q8JGzk1u1QsLUEWwERoNIftcjsUNpMOfGAOkT+
	4jemkDAaeCMBRf+Whli1mgf3LHtnunlk=
X-Gm-Gg: AYBFou2n8FdR1hweqs/pHrkVcU6dKJpXmkH3SgpSaD8hfpJPkErHv8cK1dD9nghQNfy
	7bip0XrSg/pgrrZZ5j+xNEjCwQBfOYE+Ui4gu9HLxEG9MgImJ6lACiJM9p88uRn+qTcoqi0gSHI
	okCZI1/wybgRcjR797CLumYFQsTn4H0Z6IdzMV5/jzdj8tuuk1qZyaL6JqknXGhVdSnKbhBvaa2
	PDDuT/Go55m0pu3KVljliV4BtbDUgrL5amKt4Ia+lFgLU2d+GNg9wtQYXgPpoIHeJ9OmeVTEwzE
	rQMuzwL94eRsRRFh9NtxrKlx6IzzYsdnzOMCE0g4TIriZpt31n2nV/Ks
X-Received: by 2002:a05:622a:1392:b0:530:e310:7439 with SMTP id
 d75a77b69052e-5327f54ac04mr93088881cf.32.1789621164815; Wed, 16 Sep 2026
 21:59:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260916155855.9022-1-palaomer100@gmail.com> <87zexgyjja.fsf@yellow.woof>
In-Reply-To: <87zexgyjja.fsf@yellow.woof>
From: =?UTF-8?Q?=C3=96mer_PALA?= <palaomer100@gmail.com>
Date: Thu, 17 Sep 2026 07:59:04 +0300
X-Gm-Features: AcwNN1UKMcLREXIyRIuWx-k1CYLHgQSw4KdkriB049iBSdx-PiCuENl6cXQpi1M
Message-ID: <CAKhZXnpZEBdcb4MDQds50bfrkv9Xh65BvkpeVpngGb2te_BzZw@mail.gmail.com>
Subject: Re: [PATCH] staging: greybus: add newline to sysfs_emit return
To: Nam Cao <namcao@linutronix.de>
Cc: vaibhav.sr@gmail.com, mgreer@animalcreek.com, johan@kernel.org, 
	elder@kernel.org, gregkh@linuxfoundation.org, greybus-dev@lists.linaro.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Nam Cao wrote:
>
>
> Also no, sorry. See:
> https://lore.kernel.org/linux-staging/anw3nOfSGKoq-1E_@stanley.mountain/
>
> It is a good idea to look up the mailing list archive for other patches
> attempting to do the same thing.
>
> Nam

sorry for wasting your time

best regards
Omer PALA
