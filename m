Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792745541;
	b=P9Y+hUdWcmGuw2fX4HlBs2z+2/AxmWhKKXx8HksLPBD75aV3oad4X4n+EwwQ+ydPXA08
	 dluI2dCKZ8InmXhfdivApd6PtpXdpGxGqNM4jgMSeRQCGdtQASZVxSEDEGU60PfDnONz9
	 nb2SZ/j+LPQfo42UsXFe/uDrbVn1gyW9Vht2pldDY65WiYQiVG07+A3OLBnn/zd4xnPse
	 bMdBegF5hMHakzzZQ7SCqLF1rdmi/3NpRwJwss+B+dn405aED5Wo/LaH5xIHN7EsMh8+6
	 p17DBR3H7Ig8uRlKHwy7usBKlZ4/k3yS3edtUqVQXwmvGKlYN3Gv9DulfYVg/BmKrCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792745541;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=R/8Zv848a8hRoPLHdMl3RbNkJ4bhA2vElNSJgcwLr3s=;
	b=duxXCUbNQ/PpkHd3pCg5rPJaJgssEVUzXuZhMOicaV3wontdS0JGPq9Q0dtyiXDUqzp9
	 MNBgJvFnymvUF8SozUnI0P+KN/5JB4ZNVgtoI1/xUbwaC4U3raofB15Mnk4B7IdP3CA52
	 ViPfsBJY0xf1qQhARkvmpJd5moSwY9vKqsplHfiBBpLinwtwFCJa5d+1+e0NFu0yg6ozv
	 PgaApVEat/MSLNJiM/nseABcLFjTpK66XytBrbQzCnYAojaI3d0493wo8jrQR+3CoSAAd
	 8kilV7J3Nq3Syd4vtHH6qwXw2Li+a5G+Y37hc4wu0Ew7//7hNcKzJy4uANQMg66jJgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.221.181
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC72D606A31A
	for <linux-staging@lists.linux.dev>; Fri, 23 Oct 2026 08:52:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC72D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5eac6c5f927so287094e0c.0
        for <linux-staging@lists.linux.dev>; Fri, 23 Oct 2026 01:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792745537; x=1793350337; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R/8Zv848a8hRoPLHdMl3RbNkJ4bhA2vElNSJgcwLr3s=;
        b=AQ/UMo/CnWfsEoHH/ELEEcQKZ4ZzwUQGgUDBy+GFM3pSFKP8Si61410XmI8UePY2ZI
         1FIytuZFpyaalvn6oDjjT6BLKAy8rLPsrHFFcKPnCc7BdF/sZRo0VJxAXKv6OOOcXjNq
         tQKtIxH2oIJ1YreH/TZ3nc0vOyBiB+bLNiuKCOHuqnj+5dwbgXHQP9J8g/VgKBgSWvZ/
         lFlhQuAEy7wtHQeTCTmUyd1hTNm5Ak9eJPa4OVUWqinBREH7a0x7CqZCPy2a3kXqoAKw
         j300xXEn5UXUtLgeMXfriRMAUznPBaidy8C5s53p3PwKrPqp+zlGUoM+8hhWDt+BNHJD
         Woag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792745537; x=1793350337;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=R/8Zv848a8hRoPLHdMl3RbNkJ4bhA2vElNSJgcwLr3s=;
        b=PBpooyAdyIFq58rMcd7NHAjuhCtmCzPxMDr68XRAVbzWzkbA7u5yd3zRecApW1e6m7
         PnF7QEJTRCAOc9XmllT8iAFvlXtn4owwy0YJSfxv2dq5lTpxYbbmyEVjQ0C5nl9kQkOM
         okdWcr6MMpfTcKicRGrCXsN0HdW5BEKP1BdTc2AaJnZnhPL6hwTLS9tsWivjb/I7LEjW
         sDuI1zSysYOvaGZz5I+SIq1pVUBKk5bFKFmwHun4irKC4TN58Qh8n1JqZua18dp8eGph
         HIDPOGWwYm2YaIQMf87J7LOhKzMa0l+Jf/4wLPmPf2WHRJjlQ0bhSiCCj4SLYud7MaJl
         r4Qg==
X-Gm-Message-State: AFq9FYLk5bxhtLsVN/fKeG0wuzOl2oCYfJ7QStAd4/0J/SAIC1bMiNM/
	IJCqYRKbpAKcVgZ0MTbxzeg5y4b0BTXAGkPZK11C0GpDXVKrTD0AxNj8
X-Gm-Gg: AYBFou0L5VLG4vrHe0RJQK4qEVWzb43Yh5vWUZ2jm9XzYyz6DYGQwQmudIED8oKjFhn
	fEWTSVKUUC2u95SuGsVA36ZhTTjdDtAQRhdCZzPoyjJuM7NmrcPxFxHtpaDMB86426Eqpxdekvk
	KiLztohHRr8+ffpLEuR7PNII5GER9AvdjFBsk8vZNGq1wgmSI5S7QO8Qg4WxuiGQ8/Zx1YhN/sX
	ePYhzbJ6Iz57vIWYlql+HtqkyaEbPu9bIah3XqJGaTU0Bdbub2gfGUViEIHLiap8rjlAEclD/jq
	Q3Kz5Tansco1SLsBHgrZeMOiAcJDmcoJTwM1bBXDmN9QEDnXQp/87VY4fgvS1/w9fv8wY1+ma0O
	pBqHeQMv1HAA5ebKXA4CRwyp8W0hY/J5Gn3bEXA1JEr6UH05ENyaCp4M5O8Jk/WP2dNaWjbkmna
	jTPkxtV6uwOU29c5d8B6xUkU4fk2D6DQI5eJ2+QumHs1QZn9UnbyeqohX8DG5fNtUYNOWpAjmwL
	nMpiEeoT1mq0uV+EccDfabcRSnuR+lGGRn1R8rP/tBMaDtbVQYjHWUm3IeoMkdtx2mlD3mUtxeO
	q3te9gk1hnEtlrrev2/N
X-Received: by 2002:a05:6122:1d8f:b0:5eb:2a6e:d3a7 with SMTP id 71dfb90a1353d-5ec14a86dbcmr444614e0c.12.1792745536678;
        Fri, 23 Oct 2026 01:52:16 -0700 (PDT)
Received: from Biostar-A520MT ([187.94.15.233])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ec13ed874asm1728551e0c.9.2026.10.23.01.52.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 01:52:16 -0700 (PDT)
From: Breno Rodrigues Alves <breno3011alves@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Breno Rodrigues Alves <breno3011alves@gmail.com>
Subject: Re: [PATCH] staging: axis-fifo: Fix three real issues
Date: Fri, 23 Oct 2026 05:52:00 -0300
Message-ID: <20261023085200.5206-1-breno3011alves@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <2026102337-headroom-shun-9d45@gregkh>
References: <20261022215349.87471-1-breno3011alves@gmail.com> <2026102337-headroom-shun-9d45@gregkh>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Greg,

You are right, and I apologize for the noise.  No tool told me this -
it was my own reasoning.  I had the (outdated) impression that passing
an ERR_PTR parent from debugfs_create_dir() to debugfs_create_file()
would trigger a WARN in the debugfs core.  That was true years ago, but
modern debugfs handles ERR_PTR parents gracefully, and I should have
verified the claim on a CONFIG_DEBUG_FS=n kernel before sending the
patch.

The other two changes are independent of that assumption:

  - the -EINVAL -> -ENOBUFS change in axis_fifo_read(), which changes
    the errno returned when the user buffer is smaller than the
    available data;

  - the removal of the unused 'struct resource *r_mem' local.

If either of those is worth keeping, I can resend with just those two.
If the whole patch looks like churn, please let me know and I will drop
it.

Sorry again,
Breno
