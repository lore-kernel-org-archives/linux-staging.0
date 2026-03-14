Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7A4B27A916
	for <linux-staging@lists.linux.dev>; Sat, 14 Mar 2026 20:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773521790; cv=none; b=HfXoyZDWw/xmcK2ACXGD48pPRAHaJyl+/KK2lmdHKd4PA5qehvxr23zdiWHSq9W1Z5q9UiWYIRrSc7pajyK/MLtfC3UmXjvrr94nTE3//VfP6CuroVfXAkbtchNB+l+85zLJh3k9VO8WOSkixlBuNLiOA5XrMOnipOHn3BglDNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773521790; c=relaxed/simple;
	bh=s1PmxDRum3Pkb1bhLQYHimyJhLIJe/3dCq0ThwsvPh0=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=ffFb+R18XBu1AXvweoQZrMenKipcoasSsdqqk8eVYO28aZ1VVpFDCzykFWHKFNFCcN4YkirQsYD1muj4D+mIVnHm7eNxIamg7k/XyIi99slmrtewjlEteiOcLupmHPOQQDGF7xzXwo4H4Eb0evDaZ/0cSTxiTBBxl0+i9qK5Iek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bKRZK+Kx; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bKRZK+Kx"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-7927261a3acso27958667b3.0
        for <linux-staging@lists.linux.dev>; Sat, 14 Mar 2026 13:56:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773521788; x=1774126588; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lNZOHSzGVsZCcQ597kIqFqI2fa6ljgvn4xeg/uP8Nm8=;
        b=bKRZK+KxvTfN76Cj++IRSVl5dy5QHGgZ2wcdRAqFol1Mf/KhzTcqWsjxg8pMbrU1fY
         33TnQKIKhFu0oO/v5bomLuRIVD1tknD3aC0vTHNtA2i6n2RdQvfN4v9UDNoQ98uVNxU0
         xoPIyfiIVEwlO9J9qVwcOqdoAuy/MgvsQjB12xunu+HmUrbNEVr8krVn7aFMIE5vnzZC
         vYrjAW4mR/SbeweoNp8XqTLHqU7pTGqDsbSHX5jMhMiLf6f5KSa9QKXJaiP7/8w90yRa
         lpUqmhmTPN8A7rO/pBZDDVmivGYOZFAek2JuCtS2wNUSqOWTzqVgV9LOXSzoY9MqsbtV
         i3Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773521788; x=1774126588;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lNZOHSzGVsZCcQ597kIqFqI2fa6ljgvn4xeg/uP8Nm8=;
        b=Krdij62avCyzMMeoAYgeYdLlz24miM7oXXFW9x12k4JFq0LNsTHD2HMVYkeU192KDU
         FhJ1+H2nT6vnO04jC3MgogVNXC2bNeoTP8kDKJEUBZxxvy8pnAboefVr4X9S0fcM4U28
         JfjBijOTpl4xc/ibi2kcjnR8y2MhuFhQPPr56Ipscx+xsBZYY7X35iwFsyvaBnNBC1E3
         Qod3xZjUL8CZt6uEHIkLkqDeRrhE5AH5/2ORk451Hk9XMFP1GVDt/rKYN9mPhDWmQEOd
         86ALYo4R2baCzER9h/U0SiuN0kVby/mj+Eh46jGUhN9a6SOYHRKoLPSZY5Y6ofUPqmDH
         K29g==
X-Gm-Message-State: AOJu0YxP3uSg6kmMwcKE0iLmcJ09bTWBj/gkxYrvZ4ZLUaTiBw0LFN+q
	XXvx3QdL0f14cOEk1UzudhiMZcgRJfUbMVZjm7tR6hlL+6tVLDg32Ipn
X-Gm-Gg: ATEYQzwwdicGTYA6AccwEjMC2ceyHJRcI5HPDTOisnqmCSCmDiamPR4iQ2NIphOipwB
	nraqKyGMApgUBFIQguFnlbnWOEflLCj3grHiQTg7e4cwLq60JQlrQF7dDzJ6NaVdhUp3lg6n3Gf
	pEn4ZV8EDHi/7o7jmuQhmQ8rUMeDcXL1Kt48lcqdmmqVeSO09hFUl2ugIUWwyHZ7phY0eLdLFIT
	BiAassUpDPrco1h8hjiaAbNXkBIwVUI5uR4jVSSYlv9ahZKsLZDd4xr+kB5ocmPTc1ASTau+v2/
	m4yJq+qrjRO9wvgTGwWJxyCnjRAm5WQqyMwpBrPzyH8Nqx7qWzsRrtl0TPbVspP9/ewBkm1+9IJ
	Z35WUyFHeCs4U+10+d7YZ5oTxnSvQb6dHyeG/ipo80+6GNNQ55hrd4iwKqL6bDrQLJbRyEGlIub
	Vhz8abJYnXiuHgnXm42l/2ATJ4O8vviJ4aN8v+M+aGwA+6qYFIPm5Sd5F7AN1E6ROvQKTnMXLfV
	o/hMKPyj/rgd5m8QwyxBexI2E8LwfZGJfwUGNlBIyZr/gr0NQ976+4vla3Pd8Lm7OI=
X-Received: by 2002:a05:690c:6:b0:79a:38a2:d8d6 with SMTP id 00721157ae682-79a38a2e1fcmr20145837b3.21.1773521787783;
        Sat, 14 Mar 2026 13:56:27 -0700 (PDT)
Received: from localhost ([2601:7c0:c37c:4c00:f174:ec69:bc86:8883])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79a381fc2cesm8157827b3.24.2026.03.14.13.56.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Mar 2026 13:56:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 14 Mar 2026 15:56:26 -0500
Message-Id: <DH2T052EG81S.UJWBQ7NA9TU3@gmail.com>
Cc: <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] staging: rtl8723bs: replace msleep with usleep_range
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: "Marcos Andrade" <marcosandrade95963@gmail.com>,
 <gregkh@linuxfoundation.org>
X-Mailer: aerc 0.21.0
References: <20260314051112.90071-1-marcosandrade95963@gmail.com>
In-Reply-To: <20260314051112.90071-1-marcosandrade95963@gmail.com>

On Sat Mar 14, 2026 at 12:11 AM CDT, Marcos Andrade wrote:
> The msleep() function is not recommended for delays under 20ms
> as it may sleep for longer than desired. Replace msleep(10) with
> usleep_range(10000, 11000) to ensure a more precise delay and
> better kernel scheduling behavior.
> This resolves a checkpatch.pl warning.
>
> Signed-off-by: Marcos Andrade <marcosandrade95963@gmail.com>

...


> +#include "linux/delay.h"

This would be <linux/delay.h>.

>  #include <drv_types.h>
>  #include <hal_btcoex.h>
>  #include <linux/jiffies.h>

This has already came up before and Greg decided to drop it. [1]

Thanks,

ET

[1] https://lore.kernel.org/linux-staging/20260214173139.49094-1-ofekalm100=
@gmail.com/
