Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F1FA562604
	for <linux-staging@lists.linux.dev>; Fri, 16 Oct 2026 17:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792171225; cv=pass; b=gZNjXiODxzCjo+BVVlxS7QcT9zm9Xa2UtMNXwJkMEtsq8lPcFMTOav/fbXGp+Bf1NXzjEupz9ONWqdpkwAVevLfW+0pNInq1N9hk9OLe+AJTj4amu/mEF5BvXRkhULgxa3cjTgHgCWQB+LUHEuO/t3I0jN94KlO5ApYMAlUKsvo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792171225; c=relaxed/simple;
	bh=MiP0/OfvrCvA4rJbJ0HuMjTm1tAB0xvIAwvsxL8/19Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GsXFsEEEVu4ZeQMrfLU+FqZj2LRKcnHReDGGOOE5YKhmcN4NKhA2i2sd77+25loHhaqF3yrzp2UTycPIKbbyCpsQ8LgiUy25hTz1xrQhqa60PF15Zwtbkegz4q0qyzFo5f++39LCm9mfxFTBFMFSH85Y1rXOyeC5F0z8E232HeA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=im3GC75V; arc=pass smtp.client-ip=74.125.82.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="im3GC75V"
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-16079d54c17so260800c88.0
        for <linux-staging@lists.linux.dev>; Fri, 16 Oct 2026 10:20:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792171223; cv=none;
        d=google.com; s=arc-20260327;
        b=TEcbmUrAEMIhliELyScxhpRnnEoEmxS0wINt4XZUOD0e15yyLQGyyXDFHYCuTsTR8b
         +XNQFdo/QMZsHq6dfiDDUdI9tMu+vibaXwqpVqgRPf3NLCUDK9DlHvk4lJ7KaCEBVmRP
         8P8Q+s/TFUzUr4rvyEbZlD9H5N+8uVnX8ZA/jn8Cwz8o/Rm/sfNn5/nZejf5O8WGIRgR
         YnH5CuMzcJfrUFbIDF3q0E2xjJfuM0vNGPjceK+vyU/7maWs8fGE8UDBCv6POxpKZT7K
         JT4Cq6FQ61yGsKBoxYtRIbUtRjV+TyiiwexdHQkdIHvCYxQf7CpSC8oXh5KeRpiKmCpL
         JDpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=MiP0/OfvrCvA4rJbJ0HuMjTm1tAB0xvIAwvsxL8/19Y=;
        fh=xWK6EvU6R/QMuNkIeULbOYkGfmVdH0ITcyQo2uoUiMo=;
        b=P/TsQBkY4bDUIwDjrOEf0b/oW2A42Roybn/e0psm0vqJDouW0JnS+58DrPRmbfjWOW
         o4sdqbAxkW6UWZVIoHkvZBAfuD4hJVytp9clAsyqLnplAsB0lMr2B/io4/U0gLOgFOFn
         jlHpbMWWm5m9AkrUi/ykhO0C19kLu7dGoeLW9wPh9XqkzseL3/CAturzMYDsSgfC4itp
         RHG+0yG0eF/c8agiWrGbePidjgboG26L6climmtwPeR+IOhthbV++sXSX8y/A5mBpBNi
         fazYiFqFpZii5pUunwY9My0QFA27ZYKj9LWB3yIdsJGb43MYmcbf8g4Lefj2SI4/1zYn
         eoVw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792171223; x=1792776023; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MiP0/OfvrCvA4rJbJ0HuMjTm1tAB0xvIAwvsxL8/19Y=;
        b=im3GC75VJGQDsYxYIjeolUxJFN9H5Eyl9S/AZWa3av386lSkvPvZ2rmGpR5OumoYwT
         F48Bcd/IAOWO98XWvd1uixRBoaduXXN2lZeSPD5LLMPgpymUonxgVXX0D6PiNmSRgNXN
         Eu2IwyYBYhLpgpeu/Ik8YcJAs+il4ZPy+cFwHFdmyk5JDPPTN7L9q3JY5Kdf0l1UzXFz
         L0J/U6s/Zesj0Vt3H74SNn//50fgvp3pjWAvISdGbSoDPv2xRvUOF5fgrS+TDtiGE/F8
         dU72us46N0V5Mz6cH/I3rqhxQWcbrFLbNUnd79vZr5fGt7CG+qr59k65LZKeYQ+s51OK
         exIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792171223; x=1792776023;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MiP0/OfvrCvA4rJbJ0HuMjTm1tAB0xvIAwvsxL8/19Y=;
        b=KparzyMIIDatzNKwIUmOe5sFCJBSxTdQlg2eP+jeAZo8l2PkA9ymku34pwzZ17PxPW
         yqP6i4reSSETEpwHYsWHkrriSQzMTKfLh+0FACR854Rm+1PYAMTw5hnKXEeGoojpGjKT
         hS7lNJkj+jxsAzOCNBg1JGU5Vy8kL6HoleVsjCBtHK2BUeQnipMtTyj1PEiLNVNZIfNF
         6T+vKPjV8SFi/zpQGhBGm8WNs7eD9Ha43aKxaMQXTb2dRtRnVtWEEqUBoaHUCMoYCHdR
         YwPRfOgrYDGL10p8tC2bKh1HLJImRoSzn07aYxC+8c1/J5kRCeQdn2dnBVN2RRUMYVmJ
         SFZg==
X-Forwarded-Encrypted: i=1; AKwUvBxE4DrLloMF0EdRqiVASzXP/6ozSviodVlmeDe20yJQrECD2uEr9aV8iqAbPCrU6rGyy5IbP942TsG+iglY@lists.linux.dev
X-Gm-Message-State: AFq9FYJbKqIX233yswWMGVbnkmpbP2PtQVFpnduL7WhTG0Ac3p1ylCnd
	31r81Ty8ndgEUOouRFjsfxp7PveEGcdF9VOZtcRB3G78tjiwDCk8fr1aGryDU2rYDa5r6QJm1Nt
	FeRfcuBe7C4fsipChdmN8bntXPEABkAAl7Y7BHSU=
X-Gm-Gg: AYBFou1EJ3Qw65qbNs1XiZo7pDgH8JIZ68yv6eCtwfWndhJGHjQTNTiMEpumQ64V0Tk
	g+h4y2uhx+f1GYrYb0QM254MV/lNVggUWbKodRCtvzgOAc07dqSdTf7NV+7argg13EJBNj+ogQZ
	t3tVtiCBo+4N4B/d+myVWsrpH7QidBnwDcAX54twuoKVyTlPtIu7i9XXxV3ltIJvuNt/0LlX9jR
	FQXJlRq/8ngLyoek6y9Tz2zQeB0jtkRXGIwCKh6mruh/kDqTOunIXgK1vASxlRfPBxuYW7z0RmS
	7RacziByjJoddnIFS/bj+3BTkGtt6A5B26vU4mVM3VAwgSxGHZZr4vjKqnd+4O5akDsuz58gWMP
	1/7LRi85HvMX+s87Ym0GZo2vx0JZ/kTv+AiHYUIJqtfl0qvcDouVR2nM3wwVBowTdmc/JG7+YR5
	CufHaTblxPky56q5ZZGRe8fw==
X-Received: by 2002:a05:7022:7e83:b0:144:c12b:dfc6 with SMTP id
 a92af1059eb24-18514a0bc6amr736465c88.44.1792171223208; Fri, 16 Oct 2026
 10:20:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261012034020.100737-1-oliva.scorza@gmail.com> <atHkgyGbF6TR-lT4@stanley.mountain>
In-Reply-To: <atHkgyGbF6TR-lT4@stanley.mountain>
From: Riccardo Oliva <oliva.scorza@gmail.com>
Date: Fri, 16 Oct 2026 12:20:11 -0500
X-Gm-Features: AclHuK84seWErEQdezQ7ejBx3BT29fQ44gl29cEvTvBdMD6FM3ekTXKHgel4_qE
Message-ID: <CACseTmkGtaLQMhBw4CwwH7Ym1NrGi58y=C59rGiex7R6a0O9QA@mail.gmail.com>
Subject: Re: [PATCH] staging: vme_user: avoid iterator variable access outside
 list loop
To: Dan Carpenter <error27@gmail.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> You should generally assume old warnings are false positives.
>
> There is a check which tests if we found the image or not.
>
> regards,
> dan carpenter

Thank you for the advice! I'll treat the static analyzer output with
more skepticism moving forward.
I appreciate you taking the time to explain that to me.

Best regards,
Riccardo Oliva
