Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DC6B3DE45B
	for <linux-staging@lists.linux.dev>; Thu, 30 Jul 2026 08:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785401446; cv=pass; b=rb++aaoBLCg7LOSVrN8ex8gLwAbovyMTSovuoP4B/FygArs5qkJtfsPpRd+rVjTBv64/hkdjEwic/LTVnj8OQxodjsQqLOLPoAyE+7Tndla1ON/2h/A89tbEg+xlp0HEJadwmKUFWXbAQJJmh6tPR0IYT9pDa/3qCZa4m14VFW8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785401446; c=relaxed/simple;
	bh=IToaOr7DEtFiT5S7O+NyWmpsUJ5ivX8Ah9eL+LxSMNw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dh58sYbCmwbMAwzhp7puj9BG5em5Pb+ejrPssR+Lt1opxq3SUUtCrE/l/NP5SEBCl2IQX5fBGDPzYGqZD+MAhYpcgTjUpM/eGrY+FUFDIlIk+umgJxenWw2Ec6pnPSNGCRyTHD+W90Wj9hzzaQ8dJzmrBTTgh9iEvhnJQhk/Zbc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lAiRW5B1; arc=pass smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lAiRW5B1"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-ca88130e09aso1300707a12.3
        for <linux-staging@lists.linux.dev>; Thu, 30 Jul 2026 01:50:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785401442; cv=none;
        d=google.com; s=arc-20260327;
        b=V4GNWCV14fuz+aaLyFh6raPeUkV4JC7mJbkVOvIZO5YBTYJuLPGoHSYkthZt4W7Qrz
         k6wfyQGDP/6D2rOrBSo9NlxY0IuDIpAxE9UHYPNV63EVcxy3BSuNo3KupRLXL9MEIaPI
         qtU33FSrLwVvVDoN/xMr2Vu3DEzoZn4ILdGA0mnepqFNW3hY0Uq/U+NXlq6DxbevPcvU
         1HFFJn/eF/TolyQTUaFOzrs/mcc3CVfs/KyQoaQYOXphJcEgCo91W9k35v8DVRsyMehT
         62fFyYY/UlTT/fL6Ip6JGk8p98Gf5F4eMIFQDVwmp9sTYS2T0WmHW7QXLjEZBk2ljIYO
         y6RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=IToaOr7DEtFiT5S7O+NyWmpsUJ5ivX8Ah9eL+LxSMNw=;
        fh=iF+upiwN0S8JobbSYdu9o9IXABfya9LQIy+B/hGKxYo=;
        b=Hpc0WsD7aN+pR48c1cyIknXqcjmD+10ao0Hy/i8BFkgqFnnFzE/96y/8hXEW1u1wxE
         6+wIQO/QKwtusJDqUA4UKTsUQVO2xfjfi3RWYhcExHA7OOMkwJjcPCwc2NkJXFhIp12x
         FGFATbe7B5b1uhSgiFBxpXH0JFKP/KNdiC3G3ZTAulJ53+XCzuNOvYDYIGYu8wKuFlCM
         GoP2qv5VnO8sfu7Pu8QdQvA2cajyrfEUJxj3VDaLLSvkDX79Lm4Axltb+8m8PG9ipGQv
         swRWo1y2ELXGtSvofJxoq/ELjO7kFo2jsBP3aYsaDugOX0fq7NqC4Cto48RQnJnANV2j
         0aQA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785401442; x=1786006242; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IToaOr7DEtFiT5S7O+NyWmpsUJ5ivX8Ah9eL+LxSMNw=;
        b=lAiRW5B1v8JtHRdNcHmtV524icTS0OY/d+QedKL3ydW8tvwnTwrLlGWIVJOWuu5MEN
         IoS5ksaqPL9540F4Hsw/c3md3Khis+g4NAv9tppPFYBwWmREnZQE7Y3DThgecHea10oV
         h6fINGx2F9j29RjEnDnQfIbLa6PkHzkGUBsXintr83E0Uf+sdzhMGPOD1pUTZu66Ztgo
         qkG+tiqPu2bDLQoRjVs6AxGEGw+RN2MDBw4CxcsCpEIz1InRZG8bCSmmG5hrp9qjYJMV
         aXNXSKg7mssxjMCISu3yyAJLw4G5sluHJDcsudU4f9xUHngcDvjMI2CDql5JQI0NiO8t
         egNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785401442; x=1786006242;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=IToaOr7DEtFiT5S7O+NyWmpsUJ5ivX8Ah9eL+LxSMNw=;
        b=h7rYCZFE0+NxdiL9wn+ASEmNsrgKOwIqPMGIG7C8xGJ6ogoZ7H8nnysBAgcEqMIMfX
         bdYd/FLf4FX7/1lobpWU+JBIH9Jobrc+gowkONQxRx1oDnNodix9dyBAA37F6q/Oil3N
         B7E9ciuoJzul4sKyvSBWwJ9LJo6B1hKUI0Jfn8oF7UJKlMOyl/pjvqbgVWJpCD8LKpdf
         Se4zQ3YXzSZwsalrHJdlYrzt5TJLmy43Vi7vkdQrzaLSdTURpaivZ2ykl2XdlnfBFlIT
         cGcGxSYwbPEc9dpDMzmhPpDQd2S1UKDMHqvb6qsAR8ipfIM7MKcUZxLgNtCFO2nIljx/
         Y6Fg==
X-Gm-Message-State: AOJu0YznZpTM0CtorA1fHnyI1vPoGqmBvDCywfArTFTEKdQ4pjWXNy/R
	bvrY4PmnBZETUn6xNSDdJLBHOiB74ucDlXX7TRu8+sJq1MErXOrGVjsXBx0FcLsD0PIOt6QIVUY
	eUX41DuNBO2PY6srRPuRLLf692u/RYXlqYa+qPpI=
X-Gm-Gg: AR+sD10ZGlQOg5Zb7T1HeExjkKvxylRAqFr5NSixbiWHyRtawwRBed932huUrQ8e8aj
	KOoD+inmulA/tDL1YLQ/HF3tKRCYKNNGlrmpWZRwW/pbzMYYaITW3PBoG84sC7/rF8mSYeV6lPR
	Qx/2rjQdnxBf0yynSgdP2jqhhzCQDCIxGpp6vf4x5blUmMAUOnnLFU8esBQCEFF07nfuMJ6k+tw
	vRaSnbfktARMKZt2iQT+QFe1gpmQeZM0YuGeDYfLxeVLnSfh+MmcwxBT67nfg3zXFbR2IG0Pqeg
	aIlVrgVEXoc9kInhzc/QSk1y+TCTWvwvPPq74QXL7M8NzZo=
X-Received: by 2002:a05:6a20:cd96:b0:3c4:2fe1:fa29 with SMTP id
 adf61e73a8af0-3c900880a24mr1629419637.59.1785401441749; Thu, 30 Jul 2026
 01:50:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260729172707.13333-1-mishraloopmohit@gmail.com> <2026073034-pebbly-ladder-c95e@gregkh>
In-Reply-To: <2026073034-pebbly-ladder-c95e@gregkh>
From: Mohit Mishra <mishraloopmohit@gmail.com>
Date: Thu, 30 Jul 2026 14:20:04 +0530
X-Gm-Features: AUfX_mzh1zBlviwH-Bo_OdVPtzgrJSMqFs-J4iucnrZHvMK-wMx8EHsIvFIwuDA
Message-ID: <CAP5HdgqeAs7Cx+i72qTbh4NauCzCi_EbjbOvJm9KyC7u3c7dTA@mail.gmail.com>
Subject: Re: [PATCH] staging: rtl8723bs: fix underflow logic in swing index calculations
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, Jul 30, 2026 at 1:10 PM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> How was this issue found?

I was going through drivers/staging/rtl8723bs looking for type-safety
issues after noticing a similar pattern in another staging driver.
I traced the swing index variables and noticed they're declared u8 but
calculated from Absolute_OFDMSwingIdx, which is s8 and can be negative.
I used an AI coding assistant to help organize the search and
cross-check the branch logic, but verified the underflow behavior, the
downstream truncation safety, and the TODO alignment myself by reading
the actual code and running checkpatch/build checks locally.

I don't have the hardware to confirm this in practice, which is why I
noted it as compile-tested only.

Regards,
Mohit Mishra
