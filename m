Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F71F16D9DF
	for <linux-staging@lists.linux.dev>; Sat, 18 Jan 2025 14:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737211857; cv=none; b=Ym4NlepMb2cntnfyccf9Ka9n++0N2t9A/gU5x90k9DrrjVXWOaikecgswklc/btOt/H/DM15cE+m2XyhK/iiDPXWYvP8vGkLBkX9pS8homWYoZN3f4GRRbvQe0meqnICwf0g+5o0gjJQHrE4O2ta1RZ5rTTTBHZqbXlo+oFIiQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737211857; c=relaxed/simple;
	bh=MpOBJ9F2z4irCuM5y7vVGSyrNrbQF0jDr7aMwcRK6rE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cC8R21JM4bW9wenpUbUKevHvdlVhOLufL/S3pDf7PsuXtyeK9Ivxs4YtqcWSCO5t3cdwxUjv0rINKi+uKomavMpqbOFYMvyodOt1YcOpV6FgDfPxleOU9xgq2QLOvb4RWgCQSokcqAEkdhvW6PJZKo8HLk6k7U2O1pbOxRL/kcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nHCXLq0w; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nHCXLq0w"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43621d27adeso20086895e9.2
        for <linux-staging@lists.linux.dev>; Sat, 18 Jan 2025 06:50:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737211854; x=1737816654; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6x4f/IhQbXhTzHxlBcUYv07ynqdRayuN7g874ePudr4=;
        b=nHCXLq0wfHlmNYXgf217hRFr5V/obCHsPebdUMc6jn4S80Eg1CuWwljOyxuKPWKxic
         UT5LbcfbdLVN0caVQJllaj7nMcEboq2Qh0dhUi3au1aGIPZK4GI0/jHd9aCu/gZQSosi
         1xn3XVmOKH3ZNpNklGHEUNRsgXnUBejOXhgzYxoCy8Y1Sif5aup0yW0Gk73L7oBpyYXM
         aWnIHxS+IFtMhbtJCxNRIAFmlQrHIlJOt50Gkd5cQvhZeG9eGrHHq7bEjPoJEmBNFI67
         /sNKEZIN4S+K5qTVg39Efs4zsxAGEGpzUkiKv61Ic7XKVMMTBKyDIKo9WecHf5yTNaqx
         anAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737211854; x=1737816654;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6x4f/IhQbXhTzHxlBcUYv07ynqdRayuN7g874ePudr4=;
        b=nlk3C63sRShFf/0EA6GQKFbNxe8I42S5zbolnwPkl5PncThrtaSg9+MjLJjTQgEXo0
         1tOeqJdz92NSASHgGgfntPOxk391wWjNVphbHzIrwkgJ7xgOy/U3lOiY7wqmi8qqY12M
         fzepVwbjKymcR23IGacsoCxm7NpL9Vwyx6+/jS0DgXPG0bU4Q1PRoYEVxyG/kgjdBnuu
         WfMSC0ZFEEENOD+TuLcbeHElNTLDE1jV3H0I7j84BH4x7rSRe/CpdFLKK17VUm1CkiBe
         RW3e/Ge44YLdLrkvpDc0c1hQUqmzZZzcc5dRK2qjkRXSRf3pWWgTpkZRPV3F+ofe5R1r
         j+tQ==
X-Forwarded-Encrypted: i=1; AJvYcCV/fQespqG4HPZoU7RuUMxIaXhnDMDlzT7oJVV384SCIbi5orVyu4uIMt3ml7uEOb3WYM9UyaawWyblgVr5@lists.linux.dev
X-Gm-Message-State: AOJu0YzkVJoOyp5ei0EDS1GsgPeZ8tvr8g+3zd1On3tQtaeaQm9QNvzF
	bKbDD/z62UfEbMZ2RNLdH1qtzrX018MONqfRASFNO/feby1Ti4ct
X-Gm-Gg: ASbGncu314UjREFzv8l7XWFWfpHDGTRDqnLsteChvfIZXRdRDN0+K0LRE6G3P5yqCPI
	KJQlt1FBYFbwQoAitcmMgVtTwyFY4h3qZAci8AuxDluzwSoaKJcYFDh8d/AVrN+KgsddnZZ/fkF
	IMezduHI7HQvq1z6Q14gIqU6agCP6SoVoEbgy/JcvKsNreRJ+SSJhDm9yhyN33aIVpC+RNF0cti
	46SCIKxk9Lmnnon8Ub+tIpLwSULA8HlaIV07uk1fBhdOazXsfJXCM5s6ljBt5EJXrI2kUTJ8Amm
	VkvfGqoeTlFhybPhJf60fGZbLoY/NQ==
X-Google-Smtp-Source: AGHT+IHue6Schuwf5ejQAF+/hYmBv9aWyiE6pRZHUr6eZdxBHNE3HHhkhFNg01qCYl0am4A9yLl8jA==
X-Received: by 2002:a05:600c:4ec8:b0:434:f219:6b28 with SMTP id 5b1f17b1804b1-43891435c37mr57861645e9.24.1737211854074;
        Sat, 18 Jan 2025 06:50:54 -0800 (PST)
Received: from localhost.localdomain (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-437c103f0afsm74701735e9.2.2025.01.18.06.50.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jan 2025 06:50:52 -0800 (PST)
From: Dave Penkler <dpenkler@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Dave Penkler <dpenkler@gmail.com>
Subject: [PATCH 0/2] staging: gpib: Fix NULL deref and code cleanup
Date: Sat, 18 Jan 2025 15:50:44 +0100
Message-ID: <20250118145046.12181-1-dpenkler@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Patch 1 Fixes a NULL dereference issue in the detach function
Patch 2 Removes useless code
        Use kzalloc
        Adds proper cleanup on failure exit in the attach function.
	Minor messaging changes

Dave Penkler (2):
  staging: gpib: Fix NULL pointer dereference in detach
  staging: gpib: Agilent usb code cleanup

 .../gpib/agilent_82357a/agilent_82357a.c      | 88 ++++++++-----------
 1 file changed, 37 insertions(+), 51 deletions(-)

-- 
2.47.1

