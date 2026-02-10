Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 326A32ECE9B
	for <linux-staging@lists.linux.dev>; Tue, 10 Feb 2026 22:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770763142; cv=none; b=S5QveIytDxfOGZie6z84TdUtku068gN61aIqOH/iQvAm/eS34kmDGeAzgTePu1altIyfpchC3BYjmQiMZrVR9SkKhtLc3MZdv2N7E8zJtJ1fKqBvl9X5n4q+p9EoNXLK6ZFfa4ZM0e5+kULrOJjFltXYguFlVCB+XrpbG+iA+PQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770763142; c=relaxed/simple;
	bh=A3wPrv389xB5ikmkVHWNRWWshA3MEdkvsIBe89emzfg=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=j67CB6qQuBVuWseTFLnK/CQE0Zmt+vm/wv9ZByFii6O4OM2b0iMJIciZUkDsWCjRzikyCdCzEQLOweOSKuNLg2UY/zu72aTkow2V/8uPjzsVNRRPPdy64tvW+OCv7HSHylAIB7JJtOe/sUoCe01i2c7jy/s5rxL2FrF2BbJqszo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b0FoNCL1; arc=none smtp.client-ip=74.125.224.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b0FoNCL1"
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-64acd19e1dfso4174737d50.0
        for <linux-staging@lists.linux.dev>; Tue, 10 Feb 2026 14:39:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770763140; x=1771367940; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A3wPrv389xB5ikmkVHWNRWWshA3MEdkvsIBe89emzfg=;
        b=b0FoNCL1fIcGOY1zBwNT8JTXhpN9E30S0J5wWD8hle2xA9PewmVZQMVJn42vHjbLiN
         ms7OSnFaAlXAklKFbzBLY3H7VvoGgrajEJHvCFPuPgCtRYN5WPzvZcFWkrC3ae7f6MKW
         U6z6fDxmwiYsQL8zKr9KB1h1uAK1+QU5KFVlwpR21i9ga9ebLnRwsrGwv2PSReBM8JBb
         87xC/Q5+Ct/NzR8BnxuJFhv7smq+X4e9Kxw+mriIQpyTYvQVlompTr3ruFH0pDRb56eE
         55zVfVieMrJZFn2tfpxM1rxsuXqzQ8ttqvjxZrIJQvPVaY3xSKIKOqUbbwcLtBq//NOZ
         OPQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770763140; x=1771367940;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=A3wPrv389xB5ikmkVHWNRWWshA3MEdkvsIBe89emzfg=;
        b=DaXn6Y05k1VUKOUyWQdGghv5ISHKElrYcOj4DEUAYrRusYfB3K0nSMuH7d/9XhZSHa
         wpOy/dyCL5Aiw/mGeu6WJTpL+KboaUUYKquCBsfGJW1swMgJGUuEy0/qSi85LiF7CWpn
         2T6bjfUs0Q7dTHSfqosXSbb3+SeVxeyLVGbhwBxIowmq33Cn0ORZORXLVxUkboFc9k2V
         7+Z/4+vaoyBn5NtDteHaZtKYLIJBGQscQQOcwTkXZO6vsBeShVM6oyKSzco0IF2ofvxh
         x0YZylGlOM5MTt+YvH0VeoRcLUc1iH7kI0q57RKVinBCO+PiR98stAUawfR1xpx8qTmG
         4wcw==
X-Forwarded-Encrypted: i=1; AJvYcCUO9Huzg3JcJpfqt7+kyTBQ5ZlE/ewS92czavaPQ31AUco0U+5NkBuFGsS2HhYgbpLRLyWdSFhCFb+/dxtl@lists.linux.dev
X-Gm-Message-State: AOJu0YzTYx2nzsez80/Dr86sCf8rEgnkRk8zwJJEeESJCFAyHkNalcJp
	f9H2AwM7x6mH0eoTfaLmlpIbID59R8I1wiiF7rLMqOErXnawXDUOzLN1
X-Gm-Gg: AZuq6aKvoGxvEvWjGu58tmDASa2a5T9afgVQ072CXswy0LQSp027q4abNcp/WjtEvVz
	2zqYl5An4U9VQTBwF3VpFV3WF2mohLeBCg8Y3JY3Q+amJfufPB8s2jSd3XO2Ftf/e9cyOtF5Op3
	OwqwQ1T9X2UMkleED6LMpGF7ICvo4OwvkkatFdxx+WNeJUe1w/KzydbOC/osV8azPiWZtndponx
	N5Kk2qR3zMy006UbrWxsi/F3ISFrHY7zwmWsnNJFOrIKYXOxtvPZS9+Kx6jNk27YI6Rzymmsiwx
	z9f7GIpV2/8WzEvofAM1FXD+lpXZtI2ye7KfxeF1MVtAGZbUzGJJhLMtnQGFJQroo+9bJruPLIT
	2a3gwVLIX2RxluUEh6moOsyd92KMQWoPLRPOguXIJgYlRChgp3WgnOfEI3AJx7uBOoP1whP7LXq
	6HEEXAwoWpowZi3OyqNjKy7qSDZe8htiHE4/3su5DxCvEzPgYtOai/qc1I3Ai0h8yjcGIX4NQR1
	9b83DTwArY4h8og5WYHGpOWoh9NtfPG
X-Received: by 2002:a05:690e:13c8:b0:649:bbf4:121b with SMTP id 956f58d0204a3-64a0b8e0a6bmr12915984d50.2.1770763140176;
        Tue, 10 Feb 2026 14:39:00 -0800 (PST)
Received: from localhost ([2601:7c0:c37c:4c00::9944])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-64afc95acabsm200214d50.13.2026.02.10.14.38.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Feb 2026 14:38:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 10 Feb 2026 16:38:42 -0600
Message-Id: <DGBN50CI1K96.2HTTGYPMEK0QO@gmail.com>
Cc: <straube.linux@gmail.com>, <dan.carpenter@linaro.org>,
 <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] staging: rtl8723bs: remove NDIS_802_11 types and
 cleanup style
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: <markatbritain@gmail.com>, <gregkh@linuxfoundation.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260210221556.73872-1-markatbritain@gmail.com>
In-Reply-To: <20260210221556.73872-1-markatbritain@gmail.com>

On Tue Feb 10, 2026 at 4:15 PM CST, markatbritain wrote:
> From: Mark Wu <markatbritain@gmail.com>
>
> The rtl8723bs driver contains legacy NDIS_802_11 definitions and
> typedefs that are not idiomatic to the Linux kernel. This patch
> replaces these with standard Linux types and enums where applicable
> to improve portability and readability.
>
> These changes bring the driver closer to the standard Linux kernel
> coding style and prepare it for eventual promotion out of staging.
>
> Signed-off-by: Mark Wu <markatbritain@gmail.com>

Please split this up into a patch series. One logical change per patch.
For instance group the style fixes by their checkpatch.pl warnings.

Thanks,

ET
