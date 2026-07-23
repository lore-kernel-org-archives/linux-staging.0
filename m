Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5B5C456E00
	for <linux-staging@lists.linux.dev>; Thu, 23 Jul 2026 16:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784823572; cv=none; b=vFj7jUDimVIa4JJ72rAkee9L1uKupYvXP7IKuLTLd5r7b7bJ3zuAJ8jnw+Ra1Nv3np2BmgSfbAXbXg+ZykDLcVzhPJK2JMCZf/qP+UltX6E0sX8qrTJhEojyPYQl/TirzK3b7Xf1A+d9SS8IcxM+gz+EpJIV3SC/Fz29lx5R274=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784823572; c=relaxed/simple;
	bh=9eMWlmQenIRZuDpZicY+XhXsZi9n+v4L+r0AY34VQMI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=no7g4XobC9ceuDAoPzraTRSoB2YEZBSjXkx1Ctz/I9yU11PF0vk2jYdj5GEZNWb/s4UwC9xJaC8fXnnOAABz1WtzaIolgbDi6u7bMrh4raS6jiHdPM/T5Ee2MpIumAopxWPYQE4zdkArVXu/rFVwXQgIRNYoJkW5E4zZjMK+NTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TsMUhsvO; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TsMUhsvO"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5b14d1f9315so739654e87.2
        for <linux-staging@lists.linux.dev>; Thu, 23 Jul 2026 09:19:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784823549; x=1785428349; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hwDoa4qKMaNQ9cwM9tvXSi3JCDg46QDqD/o2SvdWUnk=;
        b=TsMUhsvOneMI6RUPHpzoO4wge9J/g8QG1Jln2d6zRwKk+iHnK5OuhJ1eYP0BmzPYCR
         dTBJBtTwtua0e5Wu3m8dzQa9ndhF34EF36YQH1yW8Q/E64/yIBLMmukMEQAEks3xsQ8H
         V792k2h+6z6EMSprvhLVn0jyYkUg48NQuxM6FaaR5dnYO2rFIIoBGzXhKusM144iuj+S
         qji46/abSOL1tQNKyWzc4Mw7kjvzowuNrHwNO7XeHbeuw1RfIYPMR50w0D4+IVWAQQgm
         Ms2/PsjGGZ3raM7miWs/v6gSwB6zkAec2zZsxhMu3hILnr+bebmfftv+YjrGWPBhG9nE
         y54A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784823549; x=1785428349;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hwDoa4qKMaNQ9cwM9tvXSi3JCDg46QDqD/o2SvdWUnk=;
        b=TKxhA6TFY+GMnIrj90hWaI+Xw2o9WTUsuDGABXqCZu9XayeVEDHb1b5ZjAZldQoG66
         iMvYR1Uy/7F0Rkz5RYVXPnsqRObqCYq/Cad0I3mzQWXALhiR9VHAYfJO8DdHWQDf9oP8
         1YpFtWOebZu/8gu3XNjdUyAb2zrz0rU/H31px/mX9LP2e7LSwXE905RL0x0CqPhf+I6W
         df/8OdCvhge/MF7eNB/MuIygCkmXuIfFWH9qzedn+ToLUd0wpvRou6JGoJMeui28KqOX
         AokPmyLve07YZbEuK3MrKNP6/oysyOJbGJfBDxTpWX+WC0BGAac5T8Z3aYcz8K8h5DIF
         tlkA==
X-Gm-Message-State: AOJu0YzONssTA3diCUP9Fh1FNrWJd9hLZ6koJkuRheq/4iD0u+b4wlDY
	FMicGjLH/n4Ybo/8zvsrNPnnkRZA8BqXIeMSzJtGThe1D9/Y3/suMTwX2NJ8hZJR5aI=
X-Gm-Gg: AR+sD12URtRibXMlxktZ4cm3RyA23+fhnHzBVPS3kDOjwAyt0fbNrjGQExUY1jaPRpF
	IVXirQDBon7XIczujmtTIA/hn0bmzgEJscAV9nVBGOkNnXu7dqgB238ZODClhosmxqRvjzMUgkN
	IviGZaUUO+o5c3xSq+Pp/ZBcsn3iqqZAbuFuZhxdUlEL0K/4rvrIzmAHEqhOYLgqdtrznR4yOIg
	+TOG/E6qI1T12m7PbwwXi0IDtP/p3XYLTKY9LJOaj3qKek5GbPTadwGLLr6vl9MdRQnjrS3TYA+
	dx8/jvgOXJrNFrdgwndzOoKONozE4fDPAJaDlKNyS15tsKjTl373hqRf/DisvQfpNP/V+FLtUyG
	gvMFB3h1dhE9m9iZaWEd24XOEbNnWKzuJgh3a3Xi+j2/C09s7py657uufqH78Drt/VU+k5Eevxd
	Bt++hlNj2ycVhY/lTlElu4Qduhp+94iyL8HDhlPgJAsjrXnV3Sjs83VpJ3xlW0ebHXL33t6n4=
X-Received: by 2002:a05:6512:61d5:10b0:5b1:5e92:dab3 with SMTP id 2adb3069b0e04-5b2b2f72d4fmr623083e87.44.1784823549404;
        Thu, 23 Jul 2026 09:19:09 -0700 (PDT)
Received: from localhost.localdomain (46-138-176-102.dynamic.spd-mgts.ru. [46.138.176.102])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2a9b8cd3fsm1127126e87.1.2026.07.23.09.19.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 09:19:09 -0700 (PDT)
From: Artem Lytkin <iprintercanon@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org
Subject: [PATCH RESEND] staging: vme_user: reorder NULL check after kzalloc in fake_crcsr_init
Date: Thu, 23 Jul 2026 19:18:46 +0300
Message-ID: <20260723161846.23939-1-iprintercanon@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move the NULL check for bridge->crcsr_kernel before its use in
fake_ptr_to_pci(). While fake_ptr_to_pci() is a simple cast that
handles NULL safely, using a value before validating it is a bad
pattern that static analyzers flag and could become a real issue
if fake_ptr_to_pci() changes in the future.

Signed-off-by: Artem Lytkin <iprintercanon@gmail.com>
---
 drivers/staging/vme_user/vme_fake.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/vme_user/vme_fake.c b/drivers/staging/vme_user/vme_fake.c
index 434cf760ade6c..5a4e61d204796 100644
--- a/drivers/staging/vme_user/vme_fake.c
+++ b/drivers/staging/vme_user/vme_fake.c
@@ -1029,9 +1029,9 @@ static int fake_crcsr_init(struct vme_bridge *fake_bridge)
 
 	/* Allocate mem for CR/CSR image */
 	bridge->crcsr_kernel = kzalloc(VME_CRCSR_BUF_SIZE, GFP_KERNEL);
-	bridge->crcsr_bus = fake_ptr_to_pci(bridge->crcsr_kernel);
 	if (!bridge->crcsr_kernel)
 		return -ENOMEM;
+	bridge->crcsr_bus = fake_ptr_to_pci(bridge->crcsr_kernel);
 
 	vstat = fake_slot_get(fake_bridge);
 
-- 
2.43.0

