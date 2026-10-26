Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793010583;
	b=a2G6UNzUbxWcXmpA9ckv+E0+lbl595M5r7PRKICbTDFLGnzgQ+IENOxt2TZ7oacnZ/eU
	 cWQa9eWxCw4tDfkEs+VpSsa8xNpCAC4tIFkbsJdUcx2+FjkYprCE3ZRb1/lbnWYEbbfa/
	 mNSv+yGqiu9nKqou4bnWDDFJ3etvIiDunSYHeHDIrSr0+NIB2F4j7uEc2xMxDTriZsJSA
	 pN9idpoSPcdXG7IkDw8Ze5kFgNGX5mWq82yKc3I0BCQixQaq6kvlJvQXdD/Q45tPEuZ2F
	 5pgMdodqOl4uGFvQbnVuj8W5PYVJ1gSUICM08I1ur+fOVJgWn3b6ddk/AMtJPIFpPEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793010583;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=VZ9A0GT7Bc+iwj4opPu/rDKXsQb5fk01pBmT0V91WnI=;
	b=lhzisafaKt8nEaVnZSts9J66KBbFh2d6XXq44jYEVacUn1c1ty+pa1Xm+ziNAVgyQg2D
	 JhuHCkoQJtJ+JsFAl5QsxbXlAzlVRw5NylJQxjYnHuisVfbrIhjU6hmhaXbt4qvOkH7wz
	 tNLDRLfp223rNa07/e1S9JPAyrFda29s3rOvjYdKKPZAFWGTJkljNDz0SRoP8b/xDzZry
	 x/ZDb0NTM3pTSWJ87DxQR7T8ICQmlz3e8ycVd6uR7zG7U24PC/+gHgv/rrCF5H38t5Kq2
	 D9xYSpMn6ZG0XeL2u+yegwajH5RDacG7zHCsJf5g76VgzQKcWsM3QY1NO62aCcPwvUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=UBUMm7xR;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 845AD606A31B
	for <linux-staging@lists.linux.dev>; Mon, 26 Oct 2026 10:29:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 845AD606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=UBUMm7xR
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so11049725e9.2
        for <linux-staging@lists.linux.dev>; Mon, 26 Oct 2026 03:29:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793010582; x=1793615382; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VZ9A0GT7Bc+iwj4opPu/rDKXsQb5fk01pBmT0V91WnI=;
        b=UBUMm7xRk+pLAFahvPvL1G+qdTlBHwbjM6Vj0f0dNnrr6SMmgNWpMK0Ssnblg9A+D+
         kNPAvqppm4PTVaqKYQC1oBUNxoCM3FnNWuVbdFfNtXDF+WkUGe3xYy78k174E73SjSDo
         1IZABq29YwXshzZKZ0piN0TNU1mNXS2dQbPc9tpj8d8WsJlR+1yULdxUmew1BNwjeXP5
         a5aIEG0L1Jrhk7gyGXBTvDqBqWm8GBWNvWnn4mIqdQl/QxZiym9/y1QH4clHQ004UW4s
         yIafkiwpMiUnjllJROl+TciCHgzO08QS5SB0zFS+E0TpkZQx1OgNIevUN8v0gFEE8w7b
         8Tcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793010582; x=1793615382;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VZ9A0GT7Bc+iwj4opPu/rDKXsQb5fk01pBmT0V91WnI=;
        b=LPDP0JSUyq6eewHPPVZ87p3CGyBOJxZTnoEmIx98a6q+DlrEx5inllDbwxgqsiujoz
         12+gO2CWsNkO4cuICIUBZvExCxwpAIbMAeQg5jwroPs5WOoEfGg6aJSpjsD2Ko7zHC01
         oTD7fByePS1x8alj7asQazmQJemQ4yNSnktjGG8RF3ubLCa2asUr0nQPkzALumrzGBQ2
         QvQDYSvxWW/BcUOKNMitI4azFrhvr0QWhKnApx9CTwK/fHixe/gU1TxQVoim+YkzmpdM
         dz+LQNqzrkV2JToOnBPPX33GS9jQOFvIJvTX7dpuDPzZkMMcCOZtM5Eq+OJyGC3QT1GA
         FbkA==
X-Forwarded-Encrypted: i=1; AKwUvBxg0fnm+C+SCAJN9rtwt34beWddwKlNXPMd+nzJ1ohj7JozdCBYhEmUQeUBcumlbPwwEHxkLVHtUoGzRwNV@lists.linux.dev
X-Gm-Message-State: AFq9FYJUMEr1hcXUIYOBvr0xKQIs0pQ2TKdqydxWS6JgdC/4rPBvsVe9
	pmqY/X+zr2Llbs6hdQ2kGjF2a/esDHjZfzMadabLcpvuGcgHo6lYaSSZ
X-Gm-Gg: AYBFou3Pl2nVC+rSpsRPSrC8eD4sVk9aJ8K6EK9lliQGRIMJTGWqmzNHs8u13TMEhIg
	i/0SQSeAAzQ3oYHxB7ks8f7umuPrwJOckndRAsy9T3wcNrkCpUiR1hUu8wHHh8j5OUEzTf88xww
	/bPhjPSs/HxKcW49BIUONM9++juazdLwcNeG+0N6ltbytk3qvF68PNbrCl2aZ0vL4PhcX0JVFVO
	HSA0ykq1LRtobJM6usGHHASbrte9vVA2b0wEORGUbsEDc9Cta42h1WxZga31NjZuENgFONZKQS9
	RpDps6Y4d3HVytUAqmoE809H4YBrZVHITSGuSbAOwM2n2jMGESwAFtt2AlCf/AE3aTF1aGGxBnq
	UItNyNsFoZaCdiQ2KoLSeQUr9XNMzlhtW7XEvys4c+OS4kWnfh44rHU4cr4dOYIsasEn0bVUq/o
	ldSn8g/CGIa5xJTtSTwUN5U4989f0GpGUHoLKy4FIAQu8t4jx7SLjNBk4XGHVtN8ymgPuu3Zq/X
	i2kgf5xwHK7ImphtLyFRinRok6MasDkFRNcxcZ1Q+KlSKvmrY4B7gR52qnknD69pyaFzrVIMA==
X-Received: by 2002:a05:600c:6095:b0:49f:fdca:c361 with SMTP id 5b1f17b1804b1-4a35ac99412mr100451485e9.12.1793010581925;
        Mon, 26 Oct 2026 03:29:41 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a359f4f20dsm129772185e9.0.2026.10.26.03.29.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 03:29:41 -0700 (PDT)
Date: Mon, 26 Oct 2026 13:29:37 +0300
From: Dan Carpenter <error27@gmail.com>
To: Himanshu Bakshi <himanshu.bakshi478@gmail.com>
Cc: andy@kernel.org, gregkh@linuxfoundation.org, dennylin0707@gmail.com,
	cenzhang@linux.microsoft.com, dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: fbtft: Remove unused fbtft_init_dbg()
Message-ID: <at8rkdbWrz6uei6K@stanley.mountain>
References: <20261026092423.66168-1-himanshu.bakshi478@gmail.com>
 <at8lztOr7xpvHEdo@stanley.mountain>
 <CAGLmz9KAs7oKnmLv8NK6Z8yBQyrdV41oiouoRrNBY-j-p_H2+g@mail.gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGLmz9KAs7oKnmLv8NK6Z8yBQyrdV41oiouoRrNBY-j-p_H2+g@mail.gmail.com>

On Mon, Oct 26, 2026 at 03:52:43PM +0530, Himanshu Bakshi wrote:
> Hi Dan,
> 
> Thanks for letting me know. I have already
> sent the v3 patch, so I apologize for not waiting for
> a day. I will keep it in mind.

Thanks.

regards,
dan carpenter

