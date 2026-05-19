Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B2914028EE
	for <linux-staging@lists.linux.dev>; Tue, 19 May 2026 14:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779200436; cv=pass; b=VvKvfNW19KlmGsW6VLG6YfqBtmXwAgtJHc+ZU4J39G7SybB9ZR8Np75vlrthBM+ByLNP+xigLK06L4Cz46r+uzwt0GaSsIXEdFVH5x6lnyYLqH1qWotYdPUx0kPjXlnaQNM0B0O3XRO0465eb9RTgCaKbnfkHgvAfcewhwz435g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779200436; c=relaxed/simple;
	bh=Z67ptMys+N0txKzsrvuO8uwf/yKTvhIujA1K1RnDdTw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PFQ7kO5UUBzlFue+trL+o0vy8NdnnI4O6KtTWAZ2MNCjczk7jmBdehfPjIS8ZBDjIT79uVFfTyNSzGBWHKEQK0n3A6fcI7XnLa9xhghNXka8NpfcDiDXFZagS73D9RUBXV/2yuIkFit4XyzYcuEfLfGST/b2YCtnelJOR8kX3vM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R37Dx+QF; arc=pass smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R37Dx+QF"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-43fe608cb92so2271504f8f.2
        for <linux-staging@lists.linux.dev>; Tue, 19 May 2026 07:20:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779200433; cv=none;
        d=google.com; s=arc-20240605;
        b=Azcg4+wNp6LhwzjfxiHt98jwcALtZ+nMCiGrc2gMVP84xvGoVfT7maIIGPSSvHhPbr
         BoGcK+Q5zFQebZ8/2n9as+7Ag8UcUdqIiV7ooGZkQp7/nhiwNZQHFXE1l9E+MVQmLFrE
         ypsEbXslZq7KIyEP8N5Q/Ja7yJmalQGWMMNaJgrxdbfqp0zDXLAApbSH398biZUb7F1A
         HVtesfofEBXsIY3x5Sj08pd6N8Od3xvxSuRgUtVV72Tksd4ZV4IJQeTmb4NN/MtI+Yil
         FoBWwTanM8JFuTlhcUNwv7kLVbAUHUIsPgayD2btxEDXfqrhFoMfwOJJSx+Ux4jCj1mD
         njBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Z67ptMys+N0txKzsrvuO8uwf/yKTvhIujA1K1RnDdTw=;
        fh=/ncx6F5GONFsTNd8IP2qStFgM6w36WiWd6qro9N5qJ0=;
        b=MSnrEKTZeSUH7MP9+K+c3DEV2S7YwEvYo6dgzZNFsVxOXMgW1+X7YR0m1xJTS9MUB5
         38cE1GOVBQTSWCRkNvzDsD5bxqUCCyUWAVJwg7G7h1xPdQnX4IEtu3ytfjieib/x6L+1
         UyP2buIarNLo7IW5G6nWiAy63lgeXuK6vEWyeGw+DGCiyYGRDVASl+E5c7XJ6hHcDMJQ
         XLDxw0Tj8YVxNerPWcy1BTzF+UD8Mjl0exSWCetIhnDa+ZFOuMNi54kqSHxmXWH+Lh7+
         AQ6ZC075RBtKvT5AJgNtRbdmPVddnxDbRUD10XDJag/nJxQ1uBrFbLSLBIaskrbsgIY0
         GRnw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779200433; x=1779805233; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z67ptMys+N0txKzsrvuO8uwf/yKTvhIujA1K1RnDdTw=;
        b=R37Dx+QFFklF7RPLn+5Vc37UW5MTdGFJz99Hgw4AcOivIbJOOq6UAAnuxBvyj2u5Je
         tvKhM0dKcUCv0hD7mAYsZaPZtAhrE1/kxyui4u3HxTMnloqgD9MnTS0JMlURdtG13qVj
         rg3KIrA44xloQxyN2vDX7hFOotoF7pwUykS9tb4luFgRtOi+KwNAFeU93cm+Ek67R8fE
         upqm3fzYjvvJcF0rctEDDgqsPH9OiKPMcjuP49Zgss1HUyI3BCyBngSDQpTlHZ+xZB8H
         FLxNb2ACwY5/x2B4C5JoMXq+C8xV0cOE+HTATYc0vAX2rLJtvC7UV9QF7olwQB6GebCm
         pNSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779200433; x=1779805233;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Z67ptMys+N0txKzsrvuO8uwf/yKTvhIujA1K1RnDdTw=;
        b=Hn/xD6Zd+BPaJRJIh8in6w/aFMcYxuOLe8rrurBbDxX+EWaHePxtGRQLwqMTWc5dDe
         6sPJBG3vEVD5ndiiP9KQpLi2ZbG6rLGIX3OSbKpEPc6Q5LCHLbvua6W2apN4AfexGeyG
         876aaAdtDIF0avXpYwNKoxITn4ATvplel3LGxKYvttp+Psjbmek1mHAx9FcZ2WkBPaCi
         062q4hO9OnW6bqI/7h5CJbl8yJ/h6BDiRWo3Mw8uNLYN+9bbiQcFQUGEgI/WeuU73+/o
         g3wKqPFiv2L0ZZgI6H835vU2EdKu59YlWNVR/Gw3alD5LMv6XDekqylewMi45p0xuIHY
         g9pg==
X-Forwarded-Encrypted: i=1; AFNElJ+9N9XvrTN9Eq6LtYDVHL4uuM6IBb2w1PdJrIawiKWMZptxGXXCnp4frjDCV5L0Yb7S0mwA8fqzhTCkyaO7@lists.linux.dev
X-Gm-Message-State: AOJu0YyRhINoCfyAsiUk8ml2FhWJKhq5QYtPm7g3TKXkdhQkNV1OSSwp
	6JEmJ1dE4pKNmSAHQc9Ugdjp8NiHGY+vqT8Mz17nGN3v6p47PmQ4Oe37zsW8Tonw4O714eBJGrN
	BIY7ElnWcyT2skG41vgEVxOHKkuq3Ja8=
X-Gm-Gg: Acq92OH46HPaZ9QL5VxoI8owYbCxDiC0Gkd+sRKWTW16ifNACoTz3c4DWJkJWqwJi5Y
	80vSOOwtBZnjlLBh5vmkdWBAGgy1ZA5kRFf6uPwoXL/Un5u/Sn5APgeK97aj7mWobF6Vx5Um7bZ
	xScXt6jBVnGa4CeiplJ8n4BHloxaWxskAyyJJCmrQ9d7hqKFcHJZExenlprlCI3VtnNshE4mobR
	8i+EOWkyrnvr6prZJWCbRZMup3lzSCaBx9qRvcqOdwIp8BiPqDpATHPXVL04ZvHcmGZbD9v6AXH
	5z1YK9jyljYTohn0fcHEcChNDz8q2WuvuTujykad/A9+a7dXCc8z8J1OTSIrVFf4C0mQQ0ySxEF
	Rv3nFC3kxUymHtNZxtr+Be7XKr0TdsVpTEqBzf6LB9j78DhpmZQg7Gonxj1ehWCIMtrK8Ndy1Hs
	ZG+rqhlg==
X-Received: by 2002:a5d:5f44:0:b0:45d:3a84:709c with SMTP id
 ffacd0b85a97d-45e5c5ccac2mr31715019f8f.31.1779200432677; Tue, 19 May 2026
 07:20:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260519140624.1585534-2-u.kleine-koenig@baylibre.com>
In-Reply-To: <20260519140624.1585534-2-u.kleine-koenig@baylibre.com>
From: Joshua Crofts <joshua.crofts1@gmail.com>
Date: Tue, 19 May 2026 16:20:19 +0200
X-Gm-Features: AVHnY4LlDW3ubSlPMx0c7gHoDozmlrUrvwNJTXT5K8k4JAnzlwn3Y8_StWRJIeE
Message-ID: <CALoEA-xV3nNhrJsNL7Ge_ym04FMHM+BsTADrriAMKAjpqm4BVw@mail.gmail.com>
Subject: Re: [PATCH v1] staging: iio: Use named initializers for struct i2c_device_id
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Jonathan Cameron <jic23@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, 
	David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, linux-iio@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 19 May 2026 at 16:17, Uwe Kleine-K=C3=B6nig (The Capable Hub)
<u.kleine-koenig@baylibre.com> wrote:
>
> While being less compact, using named initializers allows to more easily
> see which members of the structs are assigned which value without having
> to lookup the declaration of the struct. And it's also more robust
> against changes to the struct definition.
>
> This patch doesn't modify the compiled arrays, only their representation
> in source form benefits. The former was confirmed with x86 and arm64
> builds.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig (The Capable Hub) <u.kleine-koenig@b=
aylibre.com>
> ---

Reviewed-by: Joshua Crofts <joshua.crofts1@gmail.com>

--=20
Kind regards

CJD
