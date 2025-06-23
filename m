Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C1161D63C5
	for <linux-staging@lists.linux.dev>; Mon, 23 Jun 2025 13:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750686837; cv=none; b=i03QdB4YwL/a5dNbMKr5qRmor+PW/hGJs3xn7XVub05lZMQ+PLELw7ttr/TPNrlVuabaRZ2qMe9xkfKF2H1XukPv0XHPPKMiNaxp7yWCnYxi1RAP4WrwaULMf5/Hi4wHocVIr+fgFOu2dWTloFUtcwAUfnyvD/s7H2FH3yFeUoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750686837; c=relaxed/simple;
	bh=m++sptggvKTsvRdmmh/Natbe80DqJQ51xNpv63moEe0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nxrzGemoKZd6TfipG+yjviTlLyp0ELMEhOwMw4EMd87bIEzA2QbOPaqbUyP+owfTiWbnfm3Cvei+qm6DkeWqTnyeJaDJfP2IObiYrkppSSHmyg4AR3fKH0eJ/nUxw1rNUmttWnrXkwsKGX1OkAUqCNjWc0T1zdHcXTF/0soiMvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CndLVkO7; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CndLVkO7"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-747e41d5469so4487310b3a.3
        for <linux-staging@lists.linux.dev>; Mon, 23 Jun 2025 06:53:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750686836; x=1751291636; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m++sptggvKTsvRdmmh/Natbe80DqJQ51xNpv63moEe0=;
        b=CndLVkO7gbNP6ppAhjmDiIdD+Rbdoh8XKYv6oUm/qLbRaW8c1KDcIJXz1bCjE+V0Jo
         DJXUUE3o8IE1ijh7Wyq9RjtR1D/K/X8S8c1aFhGLJA70uz09LOHJbBGzghU5GAtkHZhi
         7Dlv7XZTQPcxAF5nVVVfkdsHooF2DmETgPNEAKMzieG3NbwMc7QJP1a15jI6XtizNZNh
         uraJ1W+HJXYd5j8JX+cvVyMxBFBrpg1cRzsEISBKgiAO2V2piAYhRHNqWRxNi1m8vCSK
         CtaQVY+fqm59FR7P7y0ddMIiU5vLLQ9RxvEwWFmCdoL5mzu97FjsVymUCmbRSxpGeM56
         ZJnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750686836; x=1751291636;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m++sptggvKTsvRdmmh/Natbe80DqJQ51xNpv63moEe0=;
        b=NC7nNsOEq9oNY+wBNx3W7RLcg0bS+GmmLk+e54184pUNwVaIlfCqpeUbO83OP8LX4C
         aBdVdyYvQ/Bc7WZ3aKY4+u+nyMrDdp923LZY+CJ6mwpz2YqKRLY3C8jgIhNtDfbJYfJo
         hOTY6/n7iJWanlmJyX6m4I3okEOVh+EFlx5diRusmtLsGzTdn+NwPaX7OejV/Skda3LC
         Zri8j18AYwiyUN8FdNX5M+1vDLC6gplHfs74ZcM8aRcbXpXqVfTpr+S0BzWzshqNw5sW
         I2w7eRDShtEbUJxjhif31Zvk22pUzjYY0A+np8BlXCTTQ6BclOSptvWLG8M3RsMM2I2z
         4QhQ==
X-Forwarded-Encrypted: i=1; AJvYcCWQoQ9Wowz+WEHeJchDO/+j4YsIjV0NY0pcW+Bc2eOh3AtSkrfqFNgXl0Z+Gz75ylWcXtYnhuntUk6mBovy@lists.linux.dev
X-Gm-Message-State: AOJu0Yz2St5ACRRb5Py8OrgY7IgxQ5GfGHm5zp6cYcar89k7ArOhD8Z9
	zFI/+11TiL9JEDljKfnL776s60AXLQJMXGs6IqKt2jPKsj/qCwbs5GXh
X-Gm-Gg: ASbGncsz5RYpB+wW05Jszu5x+AmPvhJm9nlPaYtus51BMsyBa9wSRzmxkElV+hSGkqQ
	3AFGQ2jfWLmK9Kk2kb5nLS5X0ZxNMccoP2xOANvYFpaRTdL+HR86TGmZfiBG3t2OS53W9fKqHb1
	HvZMXJ4VkDKMlVls3ktD02UjHXVOWBnVt+6mJBUQFKX3eAVjcW2jDWRapEoDWEN+HtFBTUtlBp8
	knNtHtddG3/zHL3u3XY04/6861tcUF47rMY+5tqae2EZfUYOSB52xP6ovaWay7Euhxy8Tuu10gm
	uQVehg34S1Y1xjzjrabLBMxsD06lZc85V3KW7B9g85w4tbhnmU94Hc2nsyvdvtQOVuSH4XDGtd8
	C7g730/2ekmw0E5Yp0tHKeKpXYgWJ7QIPBuGF69p7RCp/9aHFQQZPuW4CkhTb
X-Google-Smtp-Source: AGHT+IHO8SNwFcSEBfcxQ1Deh5eokBB7/N4fSPLaf8uf7bBo1Vs+r9LUpLbtbpu6YeQYhzr1UuY6GA==
X-Received: by 2002:aa7:8896:0:b0:748:f135:4fe6 with SMTP id d2e1a72fcca58-7490d5875dcmr16754024b3a.10.1750686835914;
        Mon, 23 Jun 2025 06:53:55 -0700 (PDT)
Received: from DESKTOP-RD0GVCL.localdomain (124-218-195-161.cm.dynamic.apol.com.tw. [124.218.195.161])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7490a49f3a8sm8645375b3a.62.2025.06.23.06.53.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 06:53:55 -0700 (PDT)
From: LiangCheng Wang <zaq14760@gmail.com>
To: andy@kernel.org
Cc: zaq14760@gmail.com,
	hansg@kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v3] staging: media: atomisp: fix coding style in ia_css_output.host.c
Date: Mon, 23 Jun 2025 21:53:22 +0800
Message-ID: <20250623135323.816-1-zaq14760@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CAHp75VcFSbLwqot0Rrm=141Y-mCQUuFqNGn=DnfKSSYp-31vcg@mail.gmail.com>
References: <CAHp75VcFSbLwqot0Rrm=141Y-mCQUuFqNGn=DnfKSSYp-31vcg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Subject: Re: [PATCH v3] staging: media: atomisp: fix coding style in ia_css_output.host.c
In-Reply-To: <CAHp75VcFSbLwqot0Rrm=141Y-mCQUuFqNGn=DnfKSSYp-31vcg@mail.gmail.com>

Dear Andy,

Thank you for your review.

I'll go through the entire driver again and check for similar issues,
such as extra spacing between types and asterisks. If I find more,
I’ll send an updated v4 patch accordingly.

Best regards,
LiangCheng Wang
