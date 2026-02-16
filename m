Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AEEB23F417
	for <linux-staging@lists.linux.dev>; Mon, 16 Feb 2026 00:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771201624; cv=none; b=hwwbqd+g7kt7gelUyp06hjRwJw3af3t7efLF0fB423bxW2jZteOuxzllo9rBzfA0vCBlpN/sEnocS1PDD1Lon8BSQNnw+9b33NTbZGuGgRgDfSk9lI/gI96dG30Nl6mlp660U88JvAZ1hybZtuV3i+y8nxCoiPUP3UuTXJAiE8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771201624; c=relaxed/simple;
	bh=UNCOjVNEn3ftrD9xYGpuDxYt1FzsWi/wPyHJ7LrzDUk=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=KcF5qgxxQ9Su7BnDkZu6XrzQPdTKf8PRVX9JwHKEntDVo3EQSeX8aYn14VNEvzLb8q8HdT6ohrvnRCeQOCCiN48SQivQDkChQd6XTi8Z3vb7WNkrcpv+OmrMY/d++B/r3XL0SkpL3oYrqlea9QWfRyuZhLmBY/D09KUIlBu3osY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FnCX02gV; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FnCX02gV"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-797a52d8c34so20266927b3.2
        for <linux-staging@lists.linux.dev>; Sun, 15 Feb 2026 16:27:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771201622; x=1771806422; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UNCOjVNEn3ftrD9xYGpuDxYt1FzsWi/wPyHJ7LrzDUk=;
        b=FnCX02gV+rSZyrCzef7Vg319llvY97DgjuINCL0qDnVCTCDYLANpRwFCTW1wNn8Cb5
         +5sqyjIQL4Grob/0mvMTFEy1apAushTELEumj/hyijbF2Rw8Xz604Fd6ta7ZBDgLizmn
         qYsC50kuPzle0BQ4KiHucCY09yWcb/ApbcSm6Ah/Q/zMck0HeYVdbF3o/fk6dcB9+7Lo
         H0HKMgr4K3igLtUAoYoUWwpsN8JjiuBtOTTa16yUB6qaI1Ttff/7JwIrzj+gFC3XHPcG
         LN+9to+7DE5tmQC3wFhzoc+49FR2u+mcDrLkTgq+gnLWPCKmuixMUMPMbIHcO43DAveS
         ipWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771201622; x=1771806422;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UNCOjVNEn3ftrD9xYGpuDxYt1FzsWi/wPyHJ7LrzDUk=;
        b=tZYdVopETw0VuAYxvFP4/T5otxTkTv+4S1hVMcYzX1sMY3l/z0CrKDfQwCLQMAQ/nL
         p8YPS/dArDnKd9KJEdpEkGcn9/spsabfoSXUnRj+H1N4B9Resh+XhNYHvMnB8Pyxvk3x
         oSv87qfdo6tGbpWmUZ9z9gf7xSgpE/k+Tb67KTt7Xzr0sv8kSRzCnsoIuVPbVi/tHEe9
         XHvewP5CY2dMZcuB09//s+N5K5TSzJyggy9iEDdLlMIXF2mpmaTcNu3atLqRb4CeT+VJ
         3PE5TZENKKwKC51LtUOfQOdf655J3S4y9gjdIANti/7Os2DnCyDMFKQVf377vgos0V/W
         ubyg==
X-Forwarded-Encrypted: i=1; AJvYcCW5fkPfrZkznFjpICRkH9divZXPmIKbr23zPjEd4F0zamvnhPsi7OkE+7MQMPavu/N2gq73BVHrpHnfcSSy@lists.linux.dev
X-Gm-Message-State: AOJu0YyDUCTP66zqdU92Dci9vRXSe5Clffce3PmtSawtLX8AdmUY5Bp7
	uJG9mzp3to0B7RxF1cSH8Tog6A34v15AZQhNdasFYQtb2yTZTEZlf1hn
X-Gm-Gg: AZuq6aJXvGHgEZpDz47dPE9j5GDT885CDcBod1JB7iv1//A6gXxzlt064gEpw31KmD8
	/5U65F67jdVTadUvUokBwGgpxBxmiblf0+FRScFl/QwrBR9u9VqhvAoIqAgGV25N+Xe97RavLzd
	GcazyCV9p9k4M/CJYMqcyYhYxocNXR6/PsNCyqJP3ZKOBi+2xDw5tJfKuhCGdj5ml0eQLIPpO/I
	WRqzQTojC5Mc0RUm7mC1Fd19LumJR+h+K5a2HtWnAp5DyIEsnmrbV68ADrTVa+e0fyG2S0y3DSo
	WgaWx112uPaN9ww8/mHZvaV+shLTxP8ymBj+nUcdO6+R9QikFZ7usvpd7wxTwe3o471+/WFUl2P
	xRvLRtNQfOA0iEkSQU7aM5gxYPWaU6tAwKXrFWa4Z/xNQ7YirEnenXOhV6hha2AjVpo2F6KzNfD
	n0o8WntVVmWe4smgInmlGVuWZTG6jABH4qnywfQXo4VgZk7zWU+HLwKEW7h/OZZAY8DZIKfbkZq
	dKrZ8y3omrt+la/ArXrLAiCmCe3kIWhRE2inp3lQDnSW8ZV0mk=
X-Received: by 2002:a05:690c:d8c:b0:78f:f32e:8b5b with SMTP id 00721157ae682-797a0ab7623mr83950827b3.0.1771201622236;
        Sun, 15 Feb 2026 16:27:02 -0800 (PST)
Received: from localhost ([2601:7c0:c37c:4c00:e3a8:26f7:7e08:88e1])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7966c177773sm94376507b3.2.2026.02.15.16.27.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Feb 2026 16:27:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 15 Feb 2026 18:26:46 -0600
Message-Id: <DGFYKGV9KCHJ.18PNMD6MZ52FR@gmail.com>
Cc: <linux-fbdev@vger.kernel.org>, <linux-staging@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] staging: sm750fb: add missing const to g_fbmode array
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: =?utf-8?q?Ey=C3=BCp_Kerem_Ba=C5=9F?= <baseyupkerem@gmail.com>,
 <sudipm.mukherjee@gmail.com>, <teddy.wang@siliconmotion.com>,
 <gregkh@linuxfoundation.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260215213102.111117-1-baseyupkerem@gmail.com>
In-Reply-To: <20260215213102.111117-1-baseyupkerem@gmail.com>

On Sun Feb 15, 2026 at 3:31 PM CST, Ey=C3=BCp Kerem Ba=C5=9F wrote:
> Checkpatch reported a warning that the static const char * array should p=
robably be static const char * const. This patch adds the missing const key=
word to g_fbmode array, moving it to read-only memory.

Please keep a maximum of 75 characters per line. Next time when
submitting a patch use "$ ./scripts/checkpatch.pl --strict <patch>" to
catch things like this.

Thanks,

ET

>
> Signed-off-by: Ey=C3=BCp Kerem Ba=C5=9F <baseyupkerem@gmail.com>
> ---
