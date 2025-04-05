Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89C961CD214;
	Sat,  5 Apr 2025 11:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743852382; cv=none; b=V4w0DPeQFL64cfOOcTbu5Boz9gMqXdbgAAD5Q34UblXYeL8ILsJKotLSiV0h0lUgDNAQZUc2CrumfMHLbVeioFShgMP+iX0KoTmU6JspqY8dKDQwcaufQOFaPfZBjcXEjtIbzqShEgoYIBDYfVRkUBbalFBMe2d8sZRzThksVrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743852382; c=relaxed/simple;
	bh=MyzrTV49tPT/I8ZLEfXEdlf8hIyFJIg3rw5Q0V8+g34=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YJnnHIMBu9MW+6Fg1QevmuSevacAOBfTSKiVRf1IjHG71P4Uqdq3a7oQOmsWukOkIdW6yNCzVB7gaupg+gDOEsjVmQQz9CELloqBqW7bGni9yXPb2yQ33pB0L/Krb9eCTcRoOkQz1Fdq5i/AXoy7vgSWmde5ymlkpq+HQNVp8MM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xxmh3Hg2; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xxmh3Hg2"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43cfe63c592so27392735e9.2;
        Sat, 05 Apr 2025 04:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743852379; x=1744457179; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/vMViTK1C/TsFdnnOXr80gaLAfBrdRoZO6TBtYl1Oqw=;
        b=Xxmh3Hg2686fNkzo1z88br/d2kgulM0odGNOhQy0pURoEyJf74hdxicLvohdb3h2If
         4QbFsJTbOKu7MI51vFwUZlATL8lIFlE9sytVhTVql0+ypNWg7yBa1KZJS8R9rB8z6f1g
         eUxCW6BH55qjrDeNykB262EBJp2eQt21fzmOsEqagn5mW+fE+8g3YKWpaIPJyJUjyifi
         fKKvb07AZ2CyQcHsP4BL1ewLoAKN4Y4wI+N5+pOIIOYM9djqatH2eUC3Yt4K0dzpnuYB
         IX2YqMiZq+DhGJRsVtbLp8/IGlPWPVxG/6Rh2+vaEpNUcN4US7y5XJHlBwzjXLd2VSA2
         37Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743852379; x=1744457179;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/vMViTK1C/TsFdnnOXr80gaLAfBrdRoZO6TBtYl1Oqw=;
        b=RceO/gQ9IDHyEXGLMxzZGIhgEYes9ZT4WAceLKJDSjBP5krnuUy9BFnqy39ai5pOak
         udAgKhuPf2zJuttqtTqdAl4rB3Ymjpibknxz8aHMRSQZIPQYiMc82QslBT+X6jtIQYWW
         V19eOYrOyqrexBy5MmFiB44iXvQXVIg0SDFBwOeVMwGnoNbJOqpYnkRHfDC3kGj0WAaX
         SXBpwNmI/ZOq6WmL5gn5kuMkOffB5pNf/5fTsR3kBCEDIuLojUR3vDl49vvK502nZxhc
         iell2x1Wz4ooQEACqOnyPwadP3nDyVE4luRCuxuAM49c6RIYeIUYaVG9EPziDxzt3pV3
         Ym2w==
X-Forwarded-Encrypted: i=1; AJvYcCWOmHySr4rmp+XCSlMA9rRN/1NpJJzJTWygY0dG9WrEDbDmQkFwstPCskldGfei1RShQ26bKoQY44+NX6ka@lists.linux.dev, AJvYcCXOrcyOglqSmtKAlfTObxvKdHHD9/gtGicKIhBgrptMfzoIffBDkcaKaxF4m1eft+4gb1c8+PYM7ZBb@lists.linux.dev
X-Gm-Message-State: AOJu0YyZ94MxxNL+6riqysE18qpLi4OsogyNOVY7e3zc9iLKDpWD7qks
	tzIIR6qU1Arp2s42+uU7LUzXHDTUFQcS7MvUVQm1xTTxTXBJE7Li
X-Gm-Gg: ASbGncvy0mBwzAPuIkjwbueKR3KQdWrTsnCCaNhXNC/laCoCjyZCOlzKEgwSYA49WiI
	5Vt+X/0w0fNQxgIf14jsmNmcK/U3YuTRxxNlhCLrwt+hw3yxWI6/o/LlqVpS1aI5CjeoZTzTJuq
	KTQhTZrHr8ED3cr+YAiIhDzN9AJze52+oc53L8SAzE1ZEvWZkM74wpPTVhNyrqYn0F6JxgfWrVg
	j0vT21+UbkEaQCIDxxFv29tpw1YUhkcUHpMznE+4/mrLBbSEf6F2L8y4LHkDVLklnjAuB/h2CPB
	BXSC0BP8P61ZhSPhX0LwUZ9z5MEWQPIIYQFIxIpciQ==
X-Google-Smtp-Source: AGHT+IHRVgnhkeEy0I01njxzR2nfKc/ot+I5VzUkqthMq0BKQexQcZeRBf8jb+REOsGAUv9e+axi5g==
X-Received: by 2002:a5d:5c84:0:b0:390:f552:d291 with SMTP id ffacd0b85a97d-39d0de1b814mr4559551f8f.22.1743852378697;
        Sat, 05 Apr 2025 04:26:18 -0700 (PDT)
Received: from pc.. ([197.232.62.173])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec17b0d06sm74361705e9.35.2025.04.05.04.26.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Apr 2025 04:26:18 -0700 (PDT)
From: Erick Karanja <karanja99erick@gmail.com>
To: gregkh@linuxfoundation.org,
	outreachy@lists.linux.dev
Cc: karanja99erick@gmail.com,
	philipp.g.hortmann@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] staging :rtl8723bs: Cleanup patches
Date: Sat,  5 Apr 2025 14:26:03 +0300
Message-ID: <cover.1743851473.git.karanja99erick@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Address checkpatch complains for the staging/rtl8723bs module.
This patches can be applied in any order.

Erick Karanja (2):
  staging: rtl8723bs: add spaces between ternary and binary operators
  staging: rtl8723bs: use preferred comparison order

 drivers/staging/rtl8723bs/hal/hal_btcoex.c    | 22 +++++++++----------
 .../staging/rtl8723bs/hal/odm_CfoTracking.c   |  4 ++--
 2 files changed, 13 insertions(+), 13 deletions(-)

-- 
2.43.0

