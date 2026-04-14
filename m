Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41E9233ADAF
	for <linux-staging@lists.linux.dev>; Tue, 14 Apr 2026 06:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776147769; cv=none; b=SYM6xCrJ9ta+/RER4doaqwRvHnP/bk6ldAmY6R1Xe7RkxAH+rfxEwcVAd+Bw3zOzJvIPUeevF1arpqjkhdgPNIpqo7wQpSL7e3Nl7KAbob7Wr4zPxXEhM1fimfAoCeHSUicH6Ymyta36a6VoVBE2kZC0N4hR6SkNGfdkuJcH5LQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776147769; c=relaxed/simple;
	bh=nKm0GbVKCHtHP0hrVGkVDigPvP6pst7c01jVOvopZME=;
	h=Message-ID:Date:Content-Type:MIME-Version:From:To:Cc:Subject:
	 In-Reply-To:References; b=al++lvWUOeijMuqTw6p0ixjR7Mk86ljyoT3LoG6RMRRNN7j9cFCdA/dz1BIgTb6L/BfRge6CgPetKbjTCV4FSDII6SAVq13cdTstvFfz/nX1Oi7+gTVhZrt7aEPlkZLhAdjjp5tKQvEcPEiUlNylXcwP4dHwsoH5p/CIV2aL8yg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R/0Iv1Ae; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R/0Iv1Ae"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b9c04152730so787005366b.0
        for <linux-staging@lists.linux.dev>; Mon, 13 Apr 2026 23:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776147764; x=1776752564; darn=lists.linux.dev;
        h=references:in-reply-to:subject:cc:to:from:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=i7FXQ2tntyeG1C8OQfk9LnQuBp6YLBRP1mkqDhPOgr4=;
        b=R/0Iv1Aedw4QjSvq7rPMQ440jvonwQAEkUaYTHx70evsYzKsNx8Xo3q6yAouPBU3Sk
         kmWDyNmeXbkbPeIsF8XAMqEmb9fb1ptEukp1gsrtxudMa6Lxj/NuvXpfFaNl3DKPV8tM
         YzBCoS6i/TUtiBJ0oMz81YRpjL3neSXi7/ZNnTGogRrwCxmVpIOYsroRweuOs79HHFBn
         HCNVHKrOJXvuVfNDv+xHcLpNQhYnOCyS0oiO09Wv7p9gnr1KIRed5la9kzCUyBU2+kL9
         DX3evdeUPo4lokqvzanE7nWqc0WFGdwTvyGPZeplI7fN+NmNYVO/XHd9/jUqlLiQh83O
         1zIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776147764; x=1776752564;
        h=references:in-reply-to:subject:cc:to:from:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i7FXQ2tntyeG1C8OQfk9LnQuBp6YLBRP1mkqDhPOgr4=;
        b=knwQpif2eD9JAAVe0PgCMb/GLFvhGCIULCN9o/YIUuXAWeV5l8EjeGVVoL0DAr6wV0
         rjtC8XAZbG8d5hr0ksjnmK1DiFRw2P0P0BSYBGyuov7LE4GVqUweYFXhI5fnu0IzlU6/
         QkM93yh7qMRjG/ZbOPQGkTI7PsMkmOXFemOiA92iRxwU/iseR2ezcIAn/E5lxyzWEqmA
         7GuFaLC+T3mujaixuqnymiyzXlCz1qVZuY2TarCl0JELwe25A/r30eu6N0Fy/bL6sOtw
         +NeqYpfhXl7VkRjoUmQMLw/4Ll1iXRUFcbkjzU4p2b3wuYSWvY/MU9hu8j5UaiY1KVVb
         NIaQ==
X-Gm-Message-State: AOJu0YzhKPN7R7EIorjxplSobWrmooJh25ZBd4JGTWgqsp+HYx/AZ1tm
	hMBwFg20jtgI6TPikfI+SgBsrt1ONQZJlYGVggKbO4LaEDEdzoHEiI6/
X-Gm-Gg: AeBDievVTC7rzXkum1FknlME20j7D1Usu/e/gfHsdexRIy5JHVJ/VRs6Q3jOim7EK5V
	EiApnfm0fe0kDv+n3Hc/sqUgOqvb9oPmJHpyKwSVqXcJere5VXSW3LfGyTlwZWjxgFipO4UNjs8
	T1/v1BKq5JHy+/uucew3hLHgculsz/MM9F37IWXFCyOtU+IqwjSVhewDIqjajfaueKkXBqOej45
	T7L1nnNeZnmiMa3UtMcJ4bqCmwXM5I9f8sfSW/LgW4gyhu44tp/h285RZiJOOdmt0nDrTqiX6k/
	Esk4fk5o675DZoR4x0cxuFmGP6pxTeeiQ9nY8po+y0FiXQSIk5WInL+n36rVVFfc1qKiJBwj7UW
	ZY8Pj0/T0FQjQDODE9BhdU/jl6SMwsby2jz8IdrZx7ScoW1ZAuUfIMPFuiWnRq9TaT3Wg+e/sIr
	9h1iiWs9HTfNa4HoFAwVbPtYHET4qehwhEnq8+OoKpTf4UJuHhhDYNsL5PREaQUcNu0497NmgVE
	dJa5/kjRDufWtb4JYeENbGhAr/58y4fxF55tUCYRq/UbFJbR7CqYQDg/6GWbw==
X-Received: by 2002:a17:907:c20:b0:b9c:b7c7:8a7f with SMTP id a640c23a62f3a-b9d7249947emr910336566b.1.1776147763849;
        Mon, 13 Apr 2026 23:22:43 -0700 (PDT)
Received: from ahossu.localdomain ([88.202.160.248])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d6e5c582fsm385453366b.31.2026.04.13.23.22.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 23:22:43 -0700 (PDT)
Message-ID: <69dddd33.170a0220.e92ec.d295@mx.google.com>
Date: Mon, 13 Apr 2026 23:22:43 -0700 (PDT)
Content-Type: multipart/mixed; boundary="===============3219866366644994571=="
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Alexandru Hossu <hossu.alexandru@gmail.com>
To: dan.carpenter@linaro.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org, hansg@kernel.org, stable@vger.kernel.org, hossu.alexandru@gmail.com
Subject: Re: [PATCH] staging: rtl8723bs: fix heap overflow in OnAuthClient shared key path
In-Reply-To: <20260413202824.740653-1-hossu.alexandru@gmail.com>
References: <20260413202824.740653-1-hossu.alexandru@gmail.com>

--===============3219866366644994571==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

On Tue, Apr 14, 2026 at 08:19:00AM +0000, Dan Carpenter wrote:
> Looks good.
>
> Reviewed-by: Dan Carpenter <error27@gmail.com>
>
>                        p = rtw_get_ie(pframe + WLAN_HDR_A3_LEN + _AUTH_IE_OFFSET_, WLAN_EID_CHALLENGE, (int *)&len,
>                                       ^^^^^^
> Do we know that pframe has enough data?
>
> KTODO: check if pframe is large enough in OnAuthClient()

Good catch. There's no minimum length check before the subtraction,
so a frame shorter than WLAN_HDR_A3_LEN + _AUTH_IE_OFFSET_ (30 bytes)
would cause pkt_len to underflow since it's unsigned. I'll send a
follow-up patch adding the check.

Thanks for the review.

Alexandru

--===============3219866366644994571==--
