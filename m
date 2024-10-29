Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA35B2076A3
	for <linux-staging@lists.linux.dev>; Tue, 29 Oct 2024 22:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730239367; cv=none; b=B1rWNF4xiM5dfdWxDEfSPOzwt2nFA53S/74M3+RU9dW4n5qwSCTnZu9NSGNKJfewKmOjYgGoN9gp1h7ZFOnYX8cijRzeCqJcIJlT1peK+NYKYzbjOhXYPkH+hQICxeBFiHLmP3rjnNyRUBcZzQWSRsN80N7V6DnjUb6HpgABW0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730239367; c=relaxed/simple;
	bh=3b1JYhCoogt29e1plZja81sNTk2igpY0OAj+Xq2plEg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PQ+pPUOLrHZXf19T6WVJ5u5MZ4TYRN16dK1UbO2z+WTIq2CCWG5Ixp/r4cckETcwRMz9W5UqaJZtasUnozcdoHjMpIRlfa+3b2+DR2LlmRfUAfwlVxh8vTdApY2TgTiV4ooHVu+G2X0vtbhtSEeq+A69mtXimvM2RrijdWLHWhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KyIOJ5kG; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KyIOJ5kG"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-2e56df894d4so4769109a91.3
        for <linux-staging@lists.linux.dev>; Tue, 29 Oct 2024 15:02:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730239365; x=1730844165; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lab7o1g2od5FhlATm1BQJvpKUF+pd5RGVodCqxvDriU=;
        b=KyIOJ5kG0M1//cp3TVUoslrzGcATfPLp+8ES2XqNZ87LtPselZcGfjlxZ/GYCz9BD0
         6MHW107nLBtGkIJAzOEC0oepBIwy33RDvk++XByLY5aRO3d0kdmP6xdV/wcIIQSWT4v6
         1C1x8qoO/zp/y9SiUT+sM3oY2LAZ3kO5QjM1j4OB8I6phtAkNr7MmF9JAtMTNGhwTE1y
         N2Boo7WZWeYirTDul3lzSwyfI4IltVzQZZGR6s9qmhHGa45jqH4LyibaSXXEY5aZYG+A
         Jdh9HxWaZEJetGjucuA2QaHd7az3qPOrQGiEkmyr/uw70yGdZ0JUDUUJuLZE+DTXcLT0
         HT4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730239365; x=1730844165;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lab7o1g2od5FhlATm1BQJvpKUF+pd5RGVodCqxvDriU=;
        b=oqFWMcLmxd6geR+bMhmmXgwKwGG2FnEeyuXpT3mm333bIz3xag7H26liXjFQYVQGDh
         JdvGNwZ2yK0Y+GvDq48alhaJk2K7S+7haOnm/fm6v48wrB0fBI++yET1scHRmTlNj9+x
         uWfZb9t+xR0govdkh9duOzyaODOYVHuKT39zQE7uVxgJh+fswZ1RDBmAMTqlDcMBSZpR
         wmepmyo6iD11Cs4n+Zdqa+ViaWUblCL7cVuDzcugTlrrMrmnh82QXjqhNWvSYrf3Wkpq
         Bg+Jreo43mmULTlzAU1GRFwuK7jHeyohgm9C2/4CB1VB6MG+csQ3PqK5VzwbFk0WTNQG
         Z8eQ==
X-Forwarded-Encrypted: i=1; AJvYcCV8f5m4tob7vHT/7BzTaGXpmS8JuzNfk7oA+WIt4q/Kz1Y9mkUEl42tFoc0SnoSIeLwt4u3r3zwgelBBDtX@lists.linux.dev
X-Gm-Message-State: AOJu0YxlAFxuKzfntZ024QpYhsFSifd5etvWiQKjoy4SGCkQbUB31qRT
	M2eyKeOWelov/E/QmMbD2uZqTlHPc2A6Qox7WIE2GiyJeQPp5ZJI
X-Google-Smtp-Source: AGHT+IEbpwmKJX7mC2FkAJx7XhoO5M4gNCTQyCFub1H7kQU1Dhkh4yP8PQ1I6l/sO91+RQiE2V1wqA==
X-Received: by 2002:a17:90a:a110:b0:2e2:c6c2:b3d5 with SMTP id 98e67ed59e1d1-2e8f10692c1mr16332967a91.9.1730239364603;
        Tue, 29 Oct 2024 15:02:44 -0700 (PDT)
Received: from localhost.localdomain ([2804:14d:4c64:81ec:768d:7e1:4b86:da7d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e92fbe7119sm128701a91.40.2024.10.29.15.02.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 15:02:43 -0700 (PDT)
From: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
To: dan.carpenter@linaro.org
Cc: gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	philipp.g.hortmann@gmail.com,
	rodrigo.gobbi.7@gmail.com,
	~lkcamp/patches@lists.sr.ht
Subject: Re: staging: rtl8723bs: change remaining printk to proper api
Date: Tue, 29 Oct 2024 19:02:38 -0300
Message-Id: <20241029220238.110407-1-rodrigo.gobbi.7@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <e12bc7eb-07ed-4bec-84f7-5b178ba802c2@stanley.mountain>
References: <e12bc7eb-07ed-4bec-84f7-5b178ba802c2@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> Why are you pasing -DDBG_RX_SIGNAL_DISPLAY_RAW_DATA?
> ... But if there is some external document which says to enable it, and it's
> useful stuff then maybe we should keep it?

I've enabled this in an arbitrary way just to check the rtw_dump_raw_rssi_info()
because I was doing the debug replacement within the isolated code. Looking again,
I didn't find any documentation about this and the history of some files, the #ifdef 
macro is very old...from 7years ago. We can remove this for sure.

> If it's not used, just delete it?
Ok, I'll do it in a next patch too.

> ...as you've looked at the
> initialization path and it's okay as you said.
Ok, I'll send a v4.

Tks again and regards!
