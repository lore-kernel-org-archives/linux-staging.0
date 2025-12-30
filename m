Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 668F41E1C02
	for <linux-staging@lists.linux.dev>; Tue, 30 Dec 2025 10:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767091368; cv=none; b=fa1tudIBHwZzTBxudE1x/8X3TPHyOj9Z/iIvJqow5mpZE//90v4/xC+r5xAopASe9k7aZ4805jYXU+Lb6H/zIsZTu/FmKnZiLjfcTuJvum5sMs3jX2g0XnEbggJ3xprT2yqo/ztTS1Rr9SZyDkzfTIYmwiDEzDgxM+N+DStUDKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767091368; c=relaxed/simple;
	bh=0B/Bipl7+h4OUQlhrKD7iLvmec+IqCXBh4udpZHNfVI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hht8BERtqHCliexsperv1Egj1UVLmS5PKmziMI5Y5OwRFC/jVTHElVcaH5G8quw3G4/OMRjgQbJKkAoIzpmqca+dVJaRYFl1eTwHYebeM0HIhdKaETJt6Xhiz4JAN+n8iht2Btrlv1QWfo1mgAcsrCQsrYF928jyTrtdTALo1BY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-5597a426807so6784394e0c.2
        for <linux-staging@lists.linux.dev>; Tue, 30 Dec 2025 02:42:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767091366; x=1767696166;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+mbKEnmZAcKrKemN4xL227aXv/cGZhXjnFcbO82dy/o=;
        b=uHYmVJFeWnk9zB2YengkdWwyVkn0er8JkoRuU52wr9dZ+Vt79Xrgm3+XiQIQGRioa/
         J2oyUk5p/FzANNmIsjx0OmwG6aMuMGTlHtBgq3vDuQGmjHi+TRk2//G5GLs5hfdeI/ga
         yY4XgIGNGQeUaGAyRbP4Wnj+r3aMaLeOTXWKASqAdUEgr9cauAYlihc3XomeKPpCQ2LJ
         l95AWFUSNs28GbXjfimpd/I2vBENxzvfWvvy4wbVsGLDfa1ByOy2rQaCVxtSKIkhtc8X
         ZRRiaLCrXb6gh1LgxD0dK1T5nbojlsmDqVHjGJ6rwakvjRxynPHQBseU6U6vO2Z3Khki
         Ncgg==
X-Forwarded-Encrypted: i=1; AJvYcCVf/IxhXxnFyipTOZA5JrwleACLlfx2sYBhctJMNBnoBV0yVoWV+Q0wtKiyudFBHn7a6UttxJ2tRouRjM9p@lists.linux.dev
X-Gm-Message-State: AOJu0YwwGO0sV/8QNZMpc/xanu6M+HOI229AtI06Q6aZrFoB/WeA1Tmm
	3VxjxKc40lj8Esv/qlX/RymFUrBXSzLeNgM9gh3wNv/mV+CvGbG37D97tWa5o3i6
X-Gm-Gg: AY/fxX6VeJE+HBvliS1GGY4ZHaVCL+HqEBq0t4Y1C4dPujOMm+nxhI4waVul8oF6nuz
	iiSaj8XD54+i4RtoBkX8eWhLbqcV6iVRNsNDLtaAGBN5DWi18qdH4glcwQvqZ7Gy+nemDEzE1gq
	zKuxOv2cjIY/SC52/3vSRziAXtuj9y206wk5RMCK9+Nfy81jAoJCKJz/TGxyUs60Rqsf89Gm6eo
	WrA3AMqIDCL7sQBSg0v3WFQ4TFvBVLLQQg1G4jpJTMp1/TiOVzntrIa71GvWUINpMqQaZ2TFu0S
	m1BoPjilowYbxiI0i/vONCzBvqcfGpnGEPkLiCN3RzgWYzGMBKfmmTsaDIjjspRfu8HMn5KQP/g
	j/UF1w6rh+i4LtKdAP23jpuoeXQI8DlOzKzqdageZkjydDQg96HaxE4Sk7LP8tOpqyjK5a2+DCH
	iY653/Ux9Pmx9qhk+BidyIisBw8wfGA8X5Jr8Q338FSc+GbOVQ
X-Google-Smtp-Source: AGHT+IFQIljp6VKrMPD1sM2j+jcn7+Tqyyx2h0leFeo7T5XGIaI8+jhjY7kqCpw0pabVjwqEwd5N/Q==
X-Received: by 2002:a05:6122:c95:b0:55b:9c1a:7c04 with SMTP id 71dfb90a1353d-5615bd6f32bmr9577928e0c.8.1767091366374;
        Tue, 30 Dec 2025 02:42:46 -0800 (PST)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com. [209.85.217.47])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5615d060b37sm10121413e0c.6.2025.12.30.02.42.45
        for <linux-staging@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Dec 2025 02:42:45 -0800 (PST)
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-5eb8f9be588so4071633137.3
        for <linux-staging@lists.linux.dev>; Tue, 30 Dec 2025 02:42:45 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWtCWnAqmMU1d8OOUshDQJlGEqnJDFpzDzrApFSwU6mpfiXNwheG95DyZMArBnB0nACmMnF2AXQmAPWoOd8@lists.linux.dev
X-Received: by 2002:a67:e702:0:b0:5de:31b1:1ffe with SMTP id
 ada2fe7eead31-5eb1a827522mr13153064137.32.1767091365057; Tue, 30 Dec 2025
 02:42:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251230052827.4676-1-chintanlike@gmail.com>
In-Reply-To: <20251230052827.4676-1-chintanlike@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 30 Dec 2025 11:42:34 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUEXBRW68sPMrVX5B6ebtbbS93umtrB_BZsegD4mym_+A@mail.gmail.com>
X-Gm-Features: AQt7F2pZRr92trscSLmSOVfaiLPojcm1vUHVQnsT-rKg90xEirIjjF_9VqRIcIM
Message-ID: <CAMuHMdUEXBRW68sPMrVX5B6ebtbbS93umtrB_BZsegD4mym_+A@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] fbdev: Make CONFIG_FB_DEVICE optional for drivers
To: Chintan Patel <chintanlike@gmail.com>
Cc: linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, tzimmermann@suse.de, andy@kernel.org, 
	deller@gmx.de, gregkh@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Chintan.

On Tue, 30 Dec 2025 at 06:29, Chintan Patel <chintanlike@gmail.com> wrote:
> This series makes CONFIG_FB_DEVICE optional for fbdev drivers that use
> it only for sysfs interfaces, addressing Thomas Zimmermann=E2=80=99s TODO=
 to
> remove hard FB_DEVICE dependencies.
>
> The series introduces a small helper, dev_of_fbinfo(), which returns
> NULL when CONFIG_FB_DEVICE=3Dn. This allows sysfs code paths to be skippe=
d
> via runtime checks, avoids #ifdef CONFIG_FB_DEVICE clutter, and keeps
> full compile-time syntax checking.
>
> Signed-off-by: Chintan Patel <chintanlike@gmail.com>
> ---
> Changes in v3:
> - Use PTR_IF() to conditionally include overlay_sysfs_group in
>   overlay_sysfs_groups
> - Decouple variable definition and assignment in fbtft_sysfs_init/exit
>
> Changes in v2:
> - Add dev_of_fbinfo() helper (suggested by Geert Uytterhoeven)

by Helge Deller, not me.

> - Replace #ifdef CONFIG_FB_DEVICE blocks with runtime NULL checks
> - Switch to fb_dbg() / fb_info() logging (suggested by Thomas Zimmermann)

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
