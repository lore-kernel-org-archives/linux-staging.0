Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FD1A314D13
	for <linux-staging@lists.linux.dev>; Fri, 30 Jan 2026 09:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769766433; cv=pass; b=BqnG05MRadZcyiSSLMwSEe/DjiB4fkChmhuiCJXZWh+DwN4WJfSlZjkrNMNzSAb4mUAPQNj6kz3PsWq+tpNEz3lKzMReIb5B+H452yAP2UNNzual+MdutfEdmbe5tqPqSuslPB2PwVWFxxobuU/T+XEohhLkKl2wP1BLk1FQxgg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769766433; c=relaxed/simple;
	bh=hHkSP3uDN1iCw2b12mZIycgloC0wxCRxwRaueBRZ7BA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VadjI4Ro2R5OZz0uDJ54BaB58KO7kH6fMcEm7n7Mnyn/xurK1rzdXG9bGK8S8JCvprUB+ExwFR+kOBECUUku3ZPMAOGJqQ2UlE0kTOLjkglH+B8fNauzWDJcgR2DQ7WyWExBdDDpAt9sO5hIuS+3Z28Rmoduj9Xo1wX02GfkEOE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PWld2SvR; arc=pass smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PWld2SvR"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b8845cb5862so291709466b.3
        for <linux-staging@lists.linux.dev>; Fri, 30 Jan 2026 01:47:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769766430; cv=none;
        d=google.com; s=arc-20240605;
        b=TxGQcQ6ntSS2yEUzNdZaDJeksprsBc2bde4WRA1jVjJYRko0aHGNyIK3iKzXdwxMin
         xC29J0KC9HbtfS5kXIRn/0nJJw4WVtWoC+5XAe077aV2R4hX9+VDMkI94Br8lKncQCjZ
         SkmTVWIWo9Sk00IU34jyNgA369LlDM+px0nILAlK0Zd1MPVFAFRyzjFuXhXTQyAk0IpV
         P6Szrvdx6JJiWcpPn5sWz6ExbjAiMK2DToSfMISvUbLgMoudjuUJbYjkY/uOMJQkmkpj
         /PF+gCrahqRKXe/VIOTssTxgqUoT6Yl0do7y+AD8sT8EQwN1jVtFCzdbA18w078HUycf
         QE/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=a7CK4pConBG+Re2b0RXHcqsAL+T4wv37kOE6hvXY9wM=;
        fh=0eE2729nvX72ya/qVjappOjlMmeh45TuSNxs454gc2o=;
        b=ZdFkKOkkC0iypZyDbxJLPl0SMtn3zmWMShYoAivwaRzfCBoVeZnBQjoQ+d2+xytJyD
         AGr9n3xWvM3oluyCOuHR6NK0EN+j+CZHizDskIp4eN7ZzChQq8MXmzlMq23ZJuXNPTzA
         YG2QTaOB/Ee4Ymy4A+QjZg/J57YE1Lb9Lpi4swMQrd5nyVk5YhXIAK3PyqLeST5YHF5Q
         8nCI3lM7IeckIvKOISvooOKStc5ezRhLLvSu7cYp1dqyBrxKNiMqiUxvrCLQkur/ufXD
         Kh2777isVk8HfulgcbOA+by6x0P4gc73LN7R6Ti5qK/ft1bP5rBE3c7avrkiByV40MPN
         P0qQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769766430; x=1770371230; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a7CK4pConBG+Re2b0RXHcqsAL+T4wv37kOE6hvXY9wM=;
        b=PWld2SvR4/QLUDcof1A8rwWssJZ4K/Jw8jARh+jmsXtburJQApm/lmdyoxFZ4+fIk8
         WU3pE4VkHRmwAXMqNv04F+g0asr2ugm9IZmaMPmHz3drkudLhikwjTsRF7/4+LjD6GNl
         LA4uSFc8OLJuPuFfXF2WzKPERX5ZUD3sijoB3v2SAMQ1CyfeU+8veF4YIs8KjLjghmeL
         n1xk8dXjb/TkV4fTXpBAW358jQe21wl36iNjKlpE3s4Kjly+fffkk8hbQ/Cn0kqzCtBT
         L2d2XHkHkf+6OQbRKEtbLNd5mVT9Qfo9MIqFnXydGRNYBOLWXyoXVnNTiKBB0LSISEnm
         /thQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769766430; x=1770371230;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=a7CK4pConBG+Re2b0RXHcqsAL+T4wv37kOE6hvXY9wM=;
        b=pU8jXI3qoEvUEVOkOa/sTcCPDGqDCLhF19fU/uni8cGCDWtzwRY+ATlbh+xTfeSbuI
         NnDo+79itjQn7xtzE9FXlma5VK1E+Mkkn+dnHgP1WBLsWlg11Qu3iBy2vZNfmVIpCInh
         G0EamHKbHsFhiE0V1iiJs1n4r5QzYe+sweJ+17AVO6PYXwQgSy2YYAWDF7L2iTA0+jXQ
         O/ZHB+KWQ8YhmgkZYt9J7ZIWBsV7/QvIZ8I4wLkLod/bLms1DmaV2ioljlNu8cIZRH/E
         XwOsOlSt1kEFmHk24U2GdHqsyVk6KdaV8wckq9rnyqH3gUJc9vGz6AuVchxmg/IVIUT0
         ihyQ==
X-Forwarded-Encrypted: i=1; AJvYcCXTNxED3Iwhyaj5TJiqE3zj1lrm4oKOXdQGkMHDrZp2HX1iDUKIHAWPx3NnIxEZuCrIaQTbdXuLRPVUGz25@lists.linux.dev
X-Gm-Message-State: AOJu0Yyqlcavgwra8/kT3OZNNTFzCmT+ODXSiB1+3DCaOnKR4yCZxL38
	GbApmtA+xES0iSJsl62jdrZyljMFu5VTeRqSsYD4Gfk82T2KxExwndrou3+Fp1N8peu/VAjNiJX
	0BOa8SD21xiYMGrZT2j5Dq3jNLBzZKPU=
X-Gm-Gg: AZuq6aL5QYly2cH2J93/KFfOVmcWwjcTanKGuzrg12BbPBg9RAkUs0MMy7Pj2avS2eO
	Sm+mMvjrgawD1sRNDOXY+GLxpJepA9bloS0uy02JC70owKHtlp8Vk4ZQy8jSV3oxQRzl3ccYTQU
	xHBqsiYVeWief3C41zkQDTbt1a5ISFbKaWHPiZZo76aKLEMcfibrRjtJYpUiohiIpyMWoj9KmHo
	ZZZOfMPdN/5TkMb++GIEzz4U2cP58jAXLDTNb07ZnQHi8n0q7PORaOOWqs9QYkNfRVP2B4=
X-Received: by 2002:a17:907:785:b0:b87:d186:19e3 with SMTP id
 a640c23a62f3a-b8dff6d1b65mr158399966b.43.1769766430209; Fri, 30 Jan 2026
 01:47:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <aXsEd2bzf35y8i_E@stanley.mountain> <20260129080110.73884-1-tehsiu.huang@gmail.com>
 <aXxsLdcI946Xd7-A@stanley.mountain>
In-Reply-To: <aXxsLdcI946Xd7-A@stanley.mountain>
From: Te-Hsiu Huang <tehsiu.huang@gmail.com>
Date: Fri, 30 Jan 2026 01:46:58 -0800
X-Gm-Features: AZwV_QiQyoNuNqekJLUl0-JJ1GrIq4vb1mhs3VXA90OHoyiMqD7U06k4kM-9kbc
Message-ID: <CAMbZB6MXG9D0ovpt6Cug4MdNEN99PDfq0=WhqqR-aRF=s_2WBg@mail.gmail.com>
Subject: Re: [PATCH v2] staging: rtl8723bs: refactor BSS Coexistence channel
 report logic
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Joe Perches <joe@perches.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> No one can predit the future and adding unused cruft based on our
> horoscope is discouraged.  Future developers can add it themselves if
> they want it.
>
> regards,
> dan carpenter
>

Thank Greg and Dan for the feedback. I now have a much better
understanding of the development philosophy behind the Linux kernel
(My first time). This kind of 'culture shock' is exactly what I was
looking for =E2=80=94 it's a valuable learning experience that helps me
transition toward writing more professional and maintainable kernel
code :) .

Thanks,
Michael
