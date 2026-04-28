Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D95FA37F728
	for <linux-staging@lists.linux.dev>; Tue, 28 Apr 2026 09:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777368332; cv=none; b=M81X3eXvDIBByLC5OeDBDbtkL+B7oFJpn6wSb/usARBmhC0tAV31vLqnxjgwymPiqQuuSXFHbw6UKFRuY8neqWT1Qb2lmZbdGMmHjvUPJzGyGSGZDo8+FVht8uE1ZwaSAm6s3Qs0qOExR6UfKvGCfTpCPjwPeWyCZFHWyhSeSZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777368332; c=relaxed/simple;
	bh=WZ0dv++aH+AeLwkvbNXxLqu7wJ3mA6GpS63WG1N27Uc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Vjvit6Xj9DTAOzjQeIIi+Or4JWnmLxJsoi5sKdwkgxWRvVRt1manUKYnsktb8A85+AGKo72p6f+uEQj2nbhL57vqWeFG7Slua7LI3IkAbkjyqqpt0u8tS9zzPgQY3zSWE/Wi2O+hLGh8uXLWkl9HqISpg+hqcDm40iUxZzV5b/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-bb3c4d8cc29so311131966b.1
        for <linux-staging@lists.linux.dev>; Tue, 28 Apr 2026 02:25:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777368325; x=1777973125;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Al22kA6RCf7FSEzj29cZLSkjdM9EgXxihmBX7/SeSVI=;
        b=Yh5iy3ESZwhNOryKbpbSl9gPgNDkketV6la0xDtfHIPoK5JiQeF6yLTQ4zPMkPTe+h
         04XfvuSbuNE0+LGS2H0XUTSg3Dcy65/90HUf3B54ZnHzubA0Guc68sb1j+3IFhQXNBBk
         QFkVjg3lC4iDg5TDdx7amYx/WVSbHkiiOV0Q3/xeDULmI9Gu4cjo+txBD6HSLV42Yg5w
         HMQ3pA/ZJ8n8MfLtyPbSlW4sW5OUnKG+mGFySgHXjfc58swdygbE3+f+jGD2eb6t4L8b
         0oI+qch/792N6tmmOF8yd6pv6pUSAhofbHZD4ukNsidDP6tpw69Lyw/QRRdKO+5/btfE
         jfCw==
X-Forwarded-Encrypted: i=1; AFNElJ8cIGtNeVLdItx/q8qB/wNVgkES2T/YYHzWdM1XhLx836DLmw1LA/jW6cc4BnoIrZTtN7Uo77BNoFrR5VzU@lists.linux.dev
X-Gm-Message-State: AOJu0Yx6FrXVHRU8ScD8kL9sCFf97/dDBefZxLjJfBIoTiGnfKWOWV//
	Qj3X2kJd5gQVbpWl4zUhbJ/5Gud/rL1mCOZZT2gshE4fE7dgOeUkyoNyD6zqwHpHHIg=
X-Gm-Gg: AeBDieuNl9kv+N4qwZYjc10tuTsbV4mGcgwQWZrUYlPuENTq0cKgwG4+nZyj2NyMP7q
	jRafQnQ9Pv9J1sBG2oFxqMUhRzyNfNLn++WrdhX1G7zrrObaoCNf3M0LtCH/jWSqJSfyc4Pr1Xh
	QQg+UZP9SUOhtP9qkEYDxlgOLTHTSGdU8h2OnmhuUUfP+TcQ7Jpt5iO9SKGY8+wsGVI0pqv2xkj
	AzCLsXDu8Oy0EP2ZuQvphhBBJKKlJkhS2w036xT6J5G8Ix1kPPje50EHg2PQs7N8d2Hv/TPkvtY
	BsLheToFfM5/1QD8jFllAafmTvjMVptfePfLo4+hADyGbid1tkQftAY76WtrjbnM0iB0TIc0e9g
	HCnMWZC6Njar29Hr+g6/lq4hogh9mGq+qBz0pku0lJDXin3/Yph3jHVZIFp2nRnlN9eFs1/im5i
	SYxQE5DWVzovrEIAVMKT5hgl1Kf37HJresY+HL3XWg2tgmAupi5dRYwQSBCAxBEZv60aRCNUo=
X-Received: by 2002:a17:907:9814:b0:ba4:ea47:5a2b with SMTP id a640c23a62f3a-bb80520b3damr133325466b.43.1777368324834;
        Tue, 28 Apr 2026 02:25:24 -0700 (PDT)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com. [209.85.208.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bb808a35cbesm73005966b.15.2026.04.28.02.25.24
        for <linux-staging@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 02:25:24 -0700 (PDT)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-678a526f374so7365041a12.0
        for <linux-staging@lists.linux.dev>; Tue, 28 Apr 2026 02:25:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+cLT39I/H0BuMwSk4/GoR4e1nZjlkr+RBgE0lCaSpUca6rdFiLCxylFBRk1Oqm1Fi2Fx2yp9Djk/2cGxBE@lists.linux.dev
X-Received: by 2002:a05:6402:5056:b0:676:d8a1:7a04 with SMTP id
 4fb4d7f45d1cf-679bb09a4admr915149a12.23.1777368324094; Tue, 28 Apr 2026
 02:25:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1777306795.git.chleroy@kernel.org> <c73b90236f2810edd47c84edd2a8d8e8e0c816da.1777306795.git.chleroy@kernel.org>
In-Reply-To: <c73b90236f2810edd47c84edd2a8d8e8e0c816da.1777306795.git.chleroy@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 28 Apr 2026 11:25:11 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUvTBWoDN_wUo2n8-gkoheJ+-rbwew53OvoAwo8G5n1qg@mail.gmail.com>
X-Gm-Features: AVHnY4JEWBVPw4tSjHgbQTia8gZd2WGJ1sv6qLdKJbtvs4hms1blpvc35yb0VWw
Message-ID: <CAMuHMdUvTBWoDN_wUo2n8-gkoheJ+-rbwew53OvoAwo8G5n1qg@mail.gmail.com>
Subject: Re: [RFC PATCH v1 4/9] uaccess: Introduce copy_{to/from}_user_partial()
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: Yury Norov <ynorov@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, David Laight <david.laight.linux@gmail.com>, 
	Thomas Gleixner <tglx@linutronix.de>, linux-alpha@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-snps-arc@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-um@lists.infradead.org, 
	dmaengine@vger.kernel.org, linux-efi@vger.kernel.org, 
	linux-fsi@lists.ozlabs.org, amd-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
	linux-wpan@vger.kernel.org, netdev@vger.kernel.org, 
	linux-wireless@vger.kernel.org, linux-spi@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-serial@vger.kernel.org, linux-usb@vger.kernel.org, 
	xen-devel@lists.xenproject.org, linux-fsdevel@vger.kernel.org, 
	ocfs2-devel@lists.linux.dev, bpf@vger.kernel.org, kasan-dev@googlegroups.com, 
	linux-mm@kvack.org, linux-x25@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-sound@vger.kernel.org, sound-open-firmware@alsa-project.org, 
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linux-sh@vger.kernel.org, linux-arch@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Christophe,

Thanks for your patch!

On Mon, 27 Apr 2026 at 19:18, Christophe Leroy (CS GROUP)
<chleroy@kernel.org> wrote:
> Today there are approximately 3000 calls for copy_to_user() and
> 3000 calls to copy_from_user().
>
> The majority of callers of copy_{to/from}_user() don't care about the
> return value, they only check whether it is 0 or not, and when it is
> not 0 they handle it as a -EACCES.

I think the "a" can be dropped.

> In order to allow better optimisation of copy_{to/from}_user() when
> the size of the copy is known at build time, create new fonctions

functions

> named copy_{to/from}_user_partial() to be used by the few callers
> that are interested in partial copies and need to now how many

know

> bytes remain at the end of the copy.
>
> For the time being it is just the same as copy_{to/from}_user().
>
> Signed-off-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
