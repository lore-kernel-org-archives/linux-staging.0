Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA85C2E091E
	for <linux-staging@lists.linux.dev>; Sat,  4 Apr 2026 23:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775344900; cv=none; b=iJAyrnxsED8PGCIL1QGuvEAIit5ay8ksn1zLvO9yoWEIVrxmYY6VcVsjOx2CHb/If2GuW/dOcpCWqzI//ax0lrdH/gqrtaH2Gua/ZwIuInfQ+8rr/tdGw/mPulLtazuVzJL/OZD2RZWmBCI4Du4HtNBpOcTIQsf00kH1wW7j/1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775344900; c=relaxed/simple;
	bh=BgEfAhzA631koE7S7xz4mXjHmZ0PAeG/fM8k4YltiHk=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=b6CeMPBJ9+taDz1G66fjcwbNPPLtiRNEUtt51nYBLX50miguNvMxNn0j8RmkMdI2kbBJ2FUfDHvwjVDrBzFnk6LfP55WN9cRAOeg4DgXyNlrgUyCAldsWDvaxpD8zHmdmWJ2LIWaf5Mxdf6KQt8IoGLEXMYnrob/y4+pM5i6r6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LmmL5bTL; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LmmL5bTL"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-7a43424f861so25990907b3.1
        for <linux-staging@lists.linux.dev>; Sat, 04 Apr 2026 16:21:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775344898; x=1775949698; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BgEfAhzA631koE7S7xz4mXjHmZ0PAeG/fM8k4YltiHk=;
        b=LmmL5bTLtcRCXL8o1Q6605zq3Y7iEkBqbdbjNTF0bUPCKr6RweylIhww98kA0drSBV
         Cka5AihejdkehUIF5vuIUrInQuMsocb6Enc61F+SHOU2a+QwZ+/u4jMLluVhub0tQpbI
         IH4n9jQbTrvFo3OedoWCEOkP94ik+qJ+Uv11rto623EaVzjwXBeOs40BrVCSIDJR/fGL
         2riBt+KKijMGk0X9eTXrMCzHCm+uDpdekljHmdl4GzYDorY18N6mdlL4bnEt6uCZlyTP
         fBJbpz5pYQfkdc0ZiRXohqKs62fiFK+rQe6KKYX571VwahBsB8LY0hbCZ7PgnaODkyaJ
         T+/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775344898; x=1775949698;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BgEfAhzA631koE7S7xz4mXjHmZ0PAeG/fM8k4YltiHk=;
        b=EuXvpP7YXVTMyuOKr2DGBJhwdEUlXrWOZ9aQj7RIKAhCbTwU4qAfjr4ybyIbt9R3WH
         s5qOTWD/iZkvFGlJSSSwq1Qr8uhvdefB0w0dLcKSxMrsJs428id+z8OwYyWMKS+9rASy
         wySuu0hhTh9I4gqmf9sPKEBGUtuj1c/+BYIGvCiqv4VO4OkSx7Fj1R0XHwBI991v8oFT
         EPUA6q4dlwBncrgK+1cFO/CgyWUX3qhyh5hzpQgGLfy4Lgn5FX7OFXdoxj5uZ4Y+gZvk
         ZR7THalHHJq589Ncrfq0S24VH8mjZj0jtf+gESFsFCJvI295zKPI6xMgy3lxc2VXeqb4
         Ftwg==
X-Forwarded-Encrypted: i=1; AJvYcCVxF2TH/wHI0MCgQsJjPMqReg/6JXRDjdz1YgvulLLxgZ/vI41it4vPt9E7ZqZComtx11i+3SzltoaLH/jx@lists.linux.dev
X-Gm-Message-State: AOJu0YwG+Hfmyb+2JMF7Xfc2PM2jBzJbO1KE7W+VuiTA99CESQpkg+g7
	gtpuQmWXZ/ipVelkVHorpBhVaVoMyUwh3jb1qwKurLEjijxihpJCdIHt
X-Gm-Gg: AeBDietaWga/SPrc8XMOl+Y1nw6vwZDFUCt3H5YOg3b2GCyLCghe7xOJDzzuQyW/qSj
	SE1s6UJ8fH6uYctWQkM0Ca+Cju3ClPAfzVpCiSD0Ff2x9ey1ZqJ04QAZmf+ziBNw0CGOGJQQACK
	71wlP7XD//oQ0bKLNqC1tRwv9rNy+1RNDjF0V8EC+FZ/AvwXcGv2EEOXWM515Sw3BpG2Y88sh25
	eQhmYqBql7obNZ92GuG2OCHQyG+hKOiX+3ofvc184FckPpg5WBvT5A+PO8Q0HGW+DXnFb+y2FCD
	oNJ9xJuL0tFjrO5rxL+kIyTruuWMJe+qyL0P4apl+ZRxfxhkfi6uVlUCT8+SQdYMzoxuZa18FXi
	woBKlWcHbJBUluG3UA7G9OKPCS6mB1D19ShH3a7sJreKm/vwVGYaMYlMIR7bJEpYmqnJwtYudYn
	O2sImTt/zyN4e0DzWw1M1XUjQ/UPfMyhoSzPwqgSg1cMg+5BmFQRH6V/6TeYfZCJ/aI0+vaQ31M
	p97NfBepsJgpLGKnw5I6sIFX8ZLvBeg
X-Received: by 2002:a05:690c:698a:b0:7a2:9a26:d3da with SMTP id 00721157ae682-7a4d65423c5mr84699427b3.53.1775344897849;
        Sat, 04 Apr 2026 16:21:37 -0700 (PDT)
Received: from localhost ([2601:7c0:c37e:2360::17e2])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7a3712f53f1sm36111457b3.49.2026.04.04.16.21.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 04 Apr 2026 16:21:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 04 Apr 2026 18:21:35 -0500
Message-Id: <DHKR8PJH78XH.WMRQMC5NI9OX@gmail.com>
Cc: <dan.carpenter@linaro.org>, <linux-staging@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] staging: rtl8723bs: remove redundant return in
 report_join_res()
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: "Hungyu Lin" <dennylin0707@gmail.com>, <gregkh@linuxfoundation.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260404110311.10917-1-dennylin0707@gmail.com>
In-Reply-To: <20260404110311.10917-1-dennylin0707@gmail.com>

On Sat Apr 4, 2026 at 6:03 AM CDT, Hungyu Lin wrote:
> The return statement at the end of this void function is redundant
> and can be removed.
>
> No functional change.
>
> Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
> ---

LGTM.

Reviewed-by: Ethan Tidmore <ethantidmore06@gmail.com>

Thanks,

ET
