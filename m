Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D498C33EC
	for <linux-staging@lists.linux.dev>; Sun, 20 Jul 2025 16:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753027841; cv=none; b=Is+0Fbds1nTXDaiDn4LxdE0cbxmqPDv9axJKY+SST3n7bKD2G855VVQXGeYN5fHCW+igwHU6aL2pcHtFNcoRJZp4iXgLPZQUgnqcDmZ/SiAeR3PU+WSGl1ICcpd+/ThlQJAk8kmztfYxkt3sCo2r1C5YFJ1nfz832uGxFI43j7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753027841; c=relaxed/simple;
	bh=bVAp0IU3/00YQDjsLOmuHxZ/tz93q+fhDOPYiZlJ1Bw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aJGgaBBkuCpauMwABAJdAVw9IBx6cCoKOQpZppkZnjJrowBLMWPLQW4e99AvHnARsZdCjHVrFrshPVISWz4Patf/2+QtruI3zPNUJh/GqJ6OPqUMSjUKnL6vHoKajy5+vg3jug/cezaRVncowXXEoDbhN5OAnEWBDs2dgeJqzdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=B7NZuDLK; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="B7NZuDLK"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-60780d74c8cso6361933a12.2
        for <linux-staging@lists.linux.dev>; Sun, 20 Jul 2025 09:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1753027836; x=1753632636; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pYHbCMzhPyDbLcr9MYka8itslunCze7800jlzrARAhI=;
        b=B7NZuDLKJxnKUpkyhYVigpWC1WuSnWsRZ0N6w46gfstP8NMJpigmD4EndzUiqYugFi
         AptDEq7Jovl+FTzFMWP7wRkNFC9uQizb0hEe9u4rqpDJmEFBc4C3slrntjhF8i7AzQ1W
         phthbK0qRat0t1+ix2tgVIIOTbUSdPHFpDsOU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753027836; x=1753632636;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pYHbCMzhPyDbLcr9MYka8itslunCze7800jlzrARAhI=;
        b=Gty0pLopOU5ieI03cP5Gi13fevroMt8S9NE+/NhOBlfu1W1WYRjK0jEmitUcefDOgW
         ZPCNwi7eshOJavTD6TJQ1kNmIZ7ut09QAtni5DFOQ8/UdoNxjFp8C5mztQC+D++raVz6
         oaYe6/tlNUnM8lEydhXIjlW+coGmGUY2FXc/aSV6IFOfcf2uj0q1+bir1IHUXXkTxwhw
         FC+8QLr69OYDNvQH/H0d+Li5xhoC8yone8guxMhWQwUmConxdRbHmX7MzkfLtN4JF2o0
         loI9wX/zjAHpdFACE32+m3lWu256AcfqSzdHKan5JyWUGtWjBns4O14i2BH0cnxdOdVI
         WjTA==
X-Forwarded-Encrypted: i=1; AJvYcCUMgArRiz0WzY3x55DwSmMgslxWZida7xy2sR6FONFzfpAcn0BKPRYjypEFdWRMgQXm3NiBio7cwBZhrCAm@lists.linux.dev
X-Gm-Message-State: AOJu0Yw+u/VtB9eqb64PIweFQIg45xr5nGp0jjlOJYezRp8KPs9vpDZT
	J/Q/CmhxTKA/sw3JMQxjd0LvW0yRO1tj6bMnTWz5+Nrjdje0InLubzJOGrnZNE5PyM2zQRuhfxA
	RwLIqsak=
X-Gm-Gg: ASbGncua7AXUxD9P2LAW4HAfzd/fI1rL+l7Ct9RT3Wet7RExZmIbKIZeScQYaT9oorv
	bV1kzazfUoZL9Qv7n4jUQ6vyQgLS/KmVUAX6m58OOxN3agSqFkBEN2HUumD+FNCdY+2xl6U6TGe
	OpSlVCJVOGpMSAimEFz0DbxoNZ/Rn2dEzI2Y8/K2kkUNnzh1lw9WFp2zFSnz4a2HTmOlHxj/TjT
	rDbEf5zSilCl3GzA3yIgzhiC+QMe8o5ob5WNJ6mwTW06Z59i6N6O0/wyIrHeOJi4/BgDGdPdQRw
	2EaSuon2IfmFg5jqnd3/4NHdAELE8Mjicy5jLTpsJQ+IJXhVR0CpH2gGC8Oe/Cr7FSSThTw66hK
	Z2rYwx9QFJjxT7gqfPBE9N743J+ZGh++Nf7ac4D5gXUeMLS41fMjzmgr2IV807ali+skFFfbB
X-Google-Smtp-Source: AGHT+IGj5yFLE6i2dv4N5ljcQqPlgnbOMxxAVNFTRysQw1CcuH8HI8SylIc4kMVgf62Cxf+Tdsmbyw==
X-Received: by 2002:a17:907:7ba9:b0:ae3:b371:e7d3 with SMTP id a640c23a62f3a-ae9cddfe62dmr1579652766b.22.1753027835631;
        Sun, 20 Jul 2025 09:10:35 -0700 (PDT)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com. [209.85.208.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aec6c79ae67sm514792166b.11.2025.07.20.09.10.34
        for <linux-staging@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Jul 2025 09:10:34 -0700 (PDT)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-60707b740a6so5152370a12.0
        for <linux-staging@lists.linux.dev>; Sun, 20 Jul 2025 09:10:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU2rEIPZxRU1JqIV3pVOHeZsiv5/RAV/jMCdUlLsOGVsaISDJpz5QT95WdgULh3lObUj3vCvm9+UuZed0pk@lists.linux.dev
X-Received: by 2002:a05:6402:34cb:b0:612:ce45:3bfc with SMTP id
 4fb4d7f45d1cf-612ce4541aemr7255900a12.29.1753027834053; Sun, 20 Jul 2025
 09:10:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <aHzI-b5Kiy_Nu6l-@kroah.com>
In-Reply-To: <aHzI-b5Kiy_Nu6l-@kroah.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 20 Jul 2025 09:10:17 -0700
X-Gmail-Original-Message-ID: <CAHk-=whOueEyfgYxgQzZvRra5dcT3TwEFAtkWmq7HJvj50PR6g@mail.gmail.com>
X-Gm-Features: Ac12FXwsjW5_eeHN_yjI-9WypTAQJPiouaWDrvrUwg516x3pBMOHzGoUiYl7k-0
Message-ID: <CAHk-=whOueEyfgYxgQzZvRra5dcT3TwEFAtkWmq7HJvj50PR6g@mail.gmail.com>
Subject: Re: [GIT PULL] Staging driver fixes for 6.16-rc6
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Stephen Rothwell <sfr@canb.auug.org.au>, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Sun, 20 Jul 2025 at 03:46, Greg KH <gregkh@linuxfoundation.org> wrote:
>
>   - change to prevent a research leak

Auto-incorrect strikes again, lol.

           Linus
