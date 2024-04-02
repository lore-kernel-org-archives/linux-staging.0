Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68DD89463
	for <linux-staging@lists.linux.dev>; Tue,  2 Apr 2024 13:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712066388; cv=none; b=CRYmr/289t9PkyIFty9E57oNy9FqTrNhethQNCJ/oCYcbklYss+cvK6btZG8omylb6VvvCy7NixYnclHOGxgDODleXuj+WKkakA++5Hs+MOYXACJBiLqEkrKVo9KlIN8dNien5Eq8UHaowIHiwjm0VmrDpbSozIhBnsacvqHFYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712066388; c=relaxed/simple;
	bh=42K8nROeT6dOc/vahsjMTQ2TJejhqqvIR62/11kWiD0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t3SdADPnM1TvlQ0I8BmegXkAZqjj90+SxFmLYeu4MsILIhnOtMa484V77+VNCvlVxt1ZRxmJXaEtu8EzjV/ZrRQ8RQDXUNdZJ4SmSwv6ZICSMUEuOK4Asas7RVPwuY9o2edSG2INqzCZudrs0NMdjtxii8RWDS+AlDqZ9eIKNHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QPhVHnxd; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QPhVHnxd"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2a27ba3b1f3so143343a91.3
        for <linux-staging@lists.linux.dev>; Tue, 02 Apr 2024 06:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712066387; x=1712671187; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uuuVrZPyzr64KS5dQg/A1NNJWj7HElaPDjPANjVr5sU=;
        b=QPhVHnxdhZgz9v2QKvKqInVXaO8AJJuNQWNXBypLj3Z+R4Yj8+RaWbKHFtfSAPpR2E
         Bc0WGyeeri5loU4esjIeXXFYiG0Ni0ZdTAAQLyconrIcfmCtWBT70SsN2ZJTgc5WxVOV
         OjgUoVUWbXW/Y7S4NqsWo28lzMVKECcgrMzC3gbc9LLvmBw253TFZi6OQCtJaCNJ/gL2
         e97EdZX15Bjbn3+wc17CeUK7gVeSXEpt+1pSutmW29HIxVLpHcjJsEM1mcLmOCXcitHv
         8EtMA52uCfPsQps1Ci9ziobpRnjscPucMW1eIqBgQTK1rFoqb6/R2xpMaeQXJVa23W/g
         GUWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712066387; x=1712671187;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uuuVrZPyzr64KS5dQg/A1NNJWj7HElaPDjPANjVr5sU=;
        b=hSCeIYS/RZNRgioIxjgKORZQ3xJhXvsFPvcoide41uELkzUstDGllFcP1k82iSoEwR
         6tW81N9EvoQTr2oT6E6gAKEjAm2XbCRHkCxECQNg2MNPQoTJx3qsaDe4GPAzJFsWiddk
         X1qZyIJbbb+QQ+d8LHopCZsJBipSaTBLV1SL2ju4t+69yh7fute8P9mGij+iJVwV0Tgb
         7NJg4rgj9owv1MruPdToWgnJa0ujq1VL1lfS+mBtKHxrXMO/Vc6DJ9k9vmyfdHRuLzco
         LmnuViHCz31TRQgH7R2vQGmlymuWjKYP8vUSj6StsV2ctKQ15C380QLwZ19loKSqb8r2
         ygqg==
X-Forwarded-Encrypted: i=1; AJvYcCVRJGMRVks9w+Dh1cprs6TMCi7K99QToLWW5vgsjyBjZ07bdFgUAmDVkG3qcCcGXWnU4ma9M0FPSzcKPOWUVZzHazsBhM3UgTWQYONRoA==
X-Gm-Message-State: AOJu0YzD9enOB9dmL6Ou5e+r3y9n57sPrUaboxPlmJ66qwFz7FxJYnnJ
	WRQV4bbG2DuOKVtMQiGuJSxrFxQqtWjUXj3UOp2Vy2AcnQHSmBXlTY0C9T5D6crGHVrbW+rTzf+
	XoTPux3eovnvg97jYXjknMM0YJxU=
X-Google-Smtp-Source: AGHT+IE6qUICTNOSpzFpnEgWw1aZpDkMOxwpZZfJ7CwYPASbAghPZ0S5E/rKol7m6M75I5a3WTJVLsqMMIJoZuFdjsI=
X-Received: by 2002:a17:90a:4294:b0:2a2:3223:1903 with SMTP id
 p20-20020a17090a429400b002a232231903mr5147022pjg.47.1712066386686; Tue, 02
 Apr 2024 06:59:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <z2ewk44rjutv24i6lqau3adrmlprj524ulqtqbncvfaj44dwcg@2dnnbm75abbp>
 <72dc90fb-79ef-4dd4-b30e-97b1e7058156@gmail.com> <qnljnwccqvqzilxuoat2s6md2zwcuhfruzbpepxebk65k34t3g@cyl67lk5lsoe>
 <fdc25599-f8a7-4d66-9535-494de8439da0@moroto.mountain>
In-Reply-To: <fdc25599-f8a7-4d66-9535-494de8439da0@moroto.mountain>
From: eretmochelys imbricata <shresthprasad7@gmail.com>
Date: Tue, 2 Apr 2024 19:29:35 +0530
Message-ID: <CAE8VWiJbjQ-LmeNRsVkXtTEbytqux-7Xv0c5JT86=FSxemgGSw@mail.gmail.com>
Subject: Re: [PATCH] staging: axis-fifo: align arguments to open parenthesis
 in axis-fifo.c
To: dan.carpenter@linaro.org
Cc: christophe.jaillet@wanadoo.fr, frank.li@vivo.com, 
	gregkh@linuxfoundation.org, hverkuil-cisco@xs4all.nl, 
	linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-staging@lists.linux.dev, luca.ceresoli@bootlin.com, me@wantyapps.xyz, 
	prathubaronia2011@gmail.com, robh@kernel.org, shresthprasad7@gmail.com, 
	skhan@linuxfoundation.org, u.kleine-koenig@pengutronix.de
Content-Type: text/plain; charset="UTF-8"

>No, we're always taking patches.  You just had bad luck/timing where you
>sent the patch 2 days before Greg went on vacation.

>Greg is back now, but I imagine he has a long list of stuff to catch up
>with.  It's possible that he also accidentally dropped your patch
>because of the vacation...  I could imagine a situation where that
>happened.

That's quite unfortunate. It's good to know that you guys are still
taking patches tho!

Regards,
Shresth Prasad
