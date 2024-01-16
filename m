Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4558C10A05
	for <linux-staging@lists.linux.dev>; Tue, 16 Jan 2024 06:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HgS/nOVW"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-50e7af5f618so10382237e87.1
        for <linux-staging@lists.linux.dev>; Mon, 15 Jan 2024 22:46:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705387615; x=1705992415; darn=lists.linux.dev;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=lsDoMa/yXIw/N3voDTw3EBx0FIC9K99qzVip2lisby0=;
        b=HgS/nOVWUqoSGCAfOh857978dc4NVu6pFwWkTukrIIqRVvjF5xAwSM9XMweOuxThwZ
         UjkA2fikBj7FBxksE5qNz9NuIcjvT5O8U4q2OCQEuAI2s2pV9MBLV2e6RnZMLAENsg5u
         joWXvT5flW6dJm8wgZefJQg5TiR+jSD5lson5IuTyOa4J9uitMSTnuFcSqC5obN9g0k6
         KMdAf+aph2xyDIJ9EbDBBtZUK1p3Q49QwAZA89nVrekToTu25mjgswmiKDLJv89+u1Kp
         KZuXJHfqm1700Hud86H7aHevy5C0qUiNXHHpK+K/c9UpBhG/GI7lI3daa8fza2GWYQK/
         4lKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705387615; x=1705992415;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lsDoMa/yXIw/N3voDTw3EBx0FIC9K99qzVip2lisby0=;
        b=vdvpj+7s8W6yKYHTYMGvLM9RjPWJXFJAg8TjIPSo8RW5SZZfXGx48DmDvfrWvIci4O
         UQTmtGWm3rrqOnHje/HoRFNGR7E8TceciVi0D4f8Wda1L0VKqyNLgL1b6H0yCytuRAvn
         Mg9wK3f23UlwevqjWCTwJOz6QAO5N1mpLEz99U5aOU6hS2RPPGOslr0ZOj+8lUSLmtyP
         OhHw7dHMbPLDYA2iyWF28/GKJRl+oh7r/5015V06CUWQ8E8HBiK+X0C7Td+sjMG57pfU
         D+4BGGUQDZkGowqncyC9ONb3SbkGvjqAUaD8AKnPUwiQ/aXcZzfXUlDC1DKsio2O1a/f
         CAdQ==
X-Gm-Message-State: AOJu0YynAOAAmlZZXNyuK8oVsq6IJLV1VhOlaUtZe/Df3DRr8lkKA5Xl
	+x4lc0SEuJwcdz+HDkf6pMe9N8utShEz5KmlPZYkerL4w2E=
X-Google-Smtp-Source: AGHT+IF3egOjLSV/m1GMQjBZXEAipWVnzK83GD2QQM8qkZsMC/RU08p0YX4qpQX+fNckMpuaJD3/sm9wR8+Gzajyvtk=
X-Received: by 2002:ac2:410a:0:b0:50e:ab15:7252 with SMTP id
 b10-20020ac2410a000000b0050eab157252mr2736662lfi.129.1705387614653; Mon, 15
 Jan 2024 22:46:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: meir elisha <meir6264@gmail.com>
Date: Tue, 16 Jan 2024 08:46:43 +0200
Message-ID: <CAHdEp88HTXMawhNNyoPerPFp7kYQduYMJCNL0KR87_5ry4si3g@mail.gmail.com>
Subject: 
To: linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

subscribe linux-staging
