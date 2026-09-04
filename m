Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A445E3E866B
	for <linux-staging@lists.linux.dev>; Fri,  4 Sep 2026 05:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788501423; cv=pass; b=TwHRF03l/meXj2s2E7zta5UIWRJ7zkSRwMIX+Moh89gtub8sCInsBgoB8PnUJTAORWkGysI3TSjvpFOmCiV/N+SI6dxY6ADM9GnH/5AYXqsOtnwuretEh2gyklfz+giffWnVYrJcG8EEk51D6gD7IZHcL6y3DoFnUiA/NsEi1Cw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788501423; c=relaxed/simple;
	bh=erv31jIWtJ3/FEifDcPN2exSNWpRw74SHVnIbN/aM+Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Mlx+2jQ/MrTIYiOHHr+If2PcO86EYKpCflofrEFKbH83txUhNaYXAwjbSoR473vjEv9rmyWnBPuP9dcTqabSE5s79cy11P0DeOe04KFDFD29ea3EsUOvExYCjt/fICE7JC4tUgVkLHlUeeOqjgVXsXeQwvb8v9g6oD1Hwfzb/JA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JlSDpWQn; arc=pass smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JlSDpWQn"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-69f7fa1c548so919710a12.2
        for <linux-staging@lists.linux.dev>; Thu, 03 Sep 2026 22:57:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788501420; cv=none;
        d=google.com; s=arc-20260327;
        b=K+ZFV7sf9ExNyw++/ILi1yW75FNbnU75RMFgKSIbpNp9wl/XGr1EmlVW8mTU/akgIq
         UzNTXj5I9tpwrvYQF5MQGF+7DQx1u+9dDPfOmo8ioFrUDNQXiKvatC5gWFjY2Z7suLe/
         WwFZoL80GtFnQOgdL6crG7JiQ05hEaAPqy9W9/rbMoyWf0+qKJEo3EHjLzOV2iu0O7yy
         k+m4Gu4WlkSKe8yX90/rfIYOvpBpxistPNb4WorHFYC2n7btWK9uDysxiDq9gh8AffFT
         OOMGHlh5e62NYSaZ98ws84TIiu9TBssGdXsQpeeOHH/D4NLJDNqSry2bCnwF7nk07DrZ
         hX5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=m/8a0k+DlG2O5j4Zk3XqfuFN/7ZzoOfWFh+Bgz5ym8I=;
        fh=oJzZ9Fo6c5jAJ8xOlsHnABhC6miSxAVbr0AoOd3nqk4=;
        b=C6r2JWU5DHdYAMsl59L50KrT2pEg2yxPKukg2f6iCQV5e6y4W7OyBHs4xGxuP1AGc/
         k6eLOWKrEWM9Z3abCNUqzNkJsCKYqtL0lkoY6SQmbtiA9aUabiUVYoU0DCyWMo4m1ZZB
         P/0rCUeHNJDLiIQp3tDk88VpV3nJDiNzk3wIKaGrzuPs3YDi0O09CkdHuybxWMk3d69D
         XSngmIYOy4pxoWfa0lfxZqDgwND8ADAmotFmc7dppyLYtk2lcCuGcvGS8N3Nd9nrQjz2
         WmOdcP1a8akhEdp2dE1+GMKX8P8Ymx9YlI3CFMK1bWJ03B3Qc8LhDMjqvkuzCV+TyN5+
         nMHA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788501420; x=1789106220; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m/8a0k+DlG2O5j4Zk3XqfuFN/7ZzoOfWFh+Bgz5ym8I=;
        b=JlSDpWQnzVyw1cJRxe7Ag6PUXywqrrepafnjEsaII7FGjOFM/wpVjx6Fg/ZYorkgmc
         IUtJTv/kKxchZHQXAN/7jcz7tQAEUCtOOGtzGfVxiPYyLaY2obB0BPrk9QvwtKRnttFw
         QCk/+oiIFv8LftCSdPasXkJPuLoXeb1LbNOnNnavGm8WBei26cRm76pAcN//XS2QyYQZ
         9C6lZ6JafjYPUqakOeLi9TGLr7KWDak3d9ne7QK6DRa3Y7goUKoSZhZMLs1g7DjdPfR6
         LZUflxmoMMpPTRkJMjRPYYIjL403yHt0e8AuNxNRSNZcjui9pcpxnoMmmiuY0ZpPFPMj
         60DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788501420; x=1789106220;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=m/8a0k+DlG2O5j4Zk3XqfuFN/7ZzoOfWFh+Bgz5ym8I=;
        b=qmYC6sdwRtLDmDMqjBEMsmJPr+E1G5qPfRVL7XiKpCkLOej+DYnR4BH28n/9q/xwmm
         Gw6z8c5pZ7wISFlDd6VP7h5Kr8MR92dCaOopny7hk5pLUGdRnoUJCpuf5a066HztzcR0
         uSxqau+tYBYEbMIjrRHokpHLXxa03MsrDudYe0wcQ/z/WSUNztds7ZZ2TZRb7IqRspu0
         Q5T0Ac2sir+/WhPiMmYM0UZn/n0iS9hIbNr7wPLTPteDSbUaIyehTT0S/n7CcmN6tbK6
         58fCBrzE7ZrZenLcLsTsTQZTSSC+KumyToT5aFkV65BXrUnkA8v3I1fj3/zSryFd8sM0
         NV7g==
X-Forwarded-Encrypted: i=1; AKwUvByTDiJRSau7qJBWeOqobC8Qu3Hsd4yscxMCGYpbxZb3H6hvCluIL/eCWlK4aV0UAkxZnUpXb5Wq6FT7wY+Y@lists.linux.dev
X-Gm-Message-State: AFuF++n0AC2E/8v2AQ+36bKXXrCXfWjs/kgFU1UKS8s0MBlzHnZ/Sc0w
	7ZVxcF1DHNGCLAZ4LpQl/y+B04xCYJCDO2gnUPANHS9b4viC6Kr7CUVnuudfMtoq6WWoMZ5+Mcr
	HMvlAQGVAGY2mRKr2+x+XKjwVduIPxYr1UdYcPKmQXQ==
X-Gm-Gg: AYBFou0UH7msw2wF9o+PFJucGXPWSqDIQB7fKum1ybcrTfmhDUv8BuaAFysNaOTR5G4
	aNGo+aTvkYMksnE5jpsvSMJ5PTsd9Uu4B0qKzeAddkQml19idnj2jKgSeZ9nM9gA2LP5ym78cnc
	R06rmbNNsnWETlEjUxyCTLy9ogTTs8xJAO5DCb4gHM4ae43ODaRK1rPnDkweAF6I/55vYf4dHmy
	uAttWsTndgd/zv7r+K5GGLuLa8M9syXaSXN4U0/NkR+pJW1KKb0vvcDEgYdFjuR/NMgddBkewQy
	gGdF18tNw6F3eh/whiKJtm+Qn3l2gvroAHF97zwRxUMqov9XGx5sFFsgpehEG7+pvpsQ9LQVHYH
	LCRFddJxPoZs2HcO3kMKxHyL4d4Yq23dF/ztP1zNMxJdWhO3PRd4JB32keex/v8Bd
X-Received: by 2002:a05:6402:518b:b0:6a7:ea54:375 with SMTP id
 4fb4d7f45d1cf-6a7ea541ddamr606137a12.29.1788501419510; Thu, 03 Sep 2026
 22:56:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260904034628.12376-1-surajtheekshana1111@gmail.com>
 <2026090416-humbly-remix-5d86@gregkh> <CA+_JcNRPo1dojU4EmegM5Fv-YpZqiyd_K7SRz8km1VzzPv2nMw@mail.gmail.com>
 <2026090450-prolonged-tucking-0a55@gregkh>
In-Reply-To: <2026090450-prolonged-tucking-0a55@gregkh>
From: Suraj Theekshana <surajtheekshana1111@gmail.com>
Date: Fri, 4 Sep 2026 11:26:48 +0530
X-Gm-Features: AcwNN1XSZ5qp6Oyq4oJN36p3DEQGOV7r5lLe4xgJagcBsH1HQmfvGIl4Kt_-ITk
Message-ID: <CA+_JcNRkjeS92kc19AvMUxjdQn1GBc+8YJaOuCmZ4w++U=sf1w@mail.gmail.com>
Subject: Re: [PATCH] greybus: cap: bound IMS/auth memcpy to ioctl size
To: Greg KH <gregkh@linuxfoundation.org>
Cc: vireshk@kernel.org, johan@kernel.org, elder@kernel.org, 
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Greg,

Sorry about that. I have switched Gmail to plain-text mode and am

resending with replies inline below.

> How was this found and tested?

I found it while reviewing authentication.c. I then manually reviewed
the affected calculations and exercised them
using a userspace ASan harness based on the Greybus structures.

The harness demonstrated the 2047-byte and 1983-byte copies into the
1600-byte and 320-byte destinations, respectively. It did not exercise a
live CAP ioctl or Greybus transport and did not produce an in-kernel
KASAN report.

I also built drivers/staging/greybus/authentication.o with W=1 on arm64,
and the submitted patch passed checkpatch without warnings. I do not
have access to real Greybus hardware, so it has not been tested on a
physical device.

> And doesn't this info come from the hardware itself? Is it not trusted here?

Yes, the response length comes from the Greybus endpoint hardware or its
firmware. My assumption was that a faulty or compromised endpoint should
not be able to cause an out-of-bounds copy, especially during component
authentication.

However, I did not establish that hostile Greybus hardware is within the
kernel's intended threat model. If the endpoint is considered fully
trusted here, then I agree that this would be defensive hardening rather
than a demonstrated security-boundary issue.

> Did you forget an Assisted-by: tag?

Yes. That was my mistake. I used OpenAI Codex while  preparing,
and validating the patch.

Thanks,
Suraj
