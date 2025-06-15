Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 477B225D21B
	for <linux-staging@lists.linux.dev>; Sun, 15 Jun 2025 23:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750029107; cv=none; b=ZMdOJVKD4Ltryd4tYlQwgKaEX4fAWJo6ru9s8zR2hOMuIIh/NY4a7gbCe+P5/PeRiYkZG7loatbaa0mx7Wt6QG6773seeBt+EkqcFzkuKmQ0eRtnGCctTM8OENXon/qDNY+BlLHmZaNNGI/u8pzCqbr/im16FwpNNfpyJsBR47s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750029107; c=relaxed/simple;
	bh=o2M8aTJnLUPL1zk8er/JNPhZFreP63h9ZtSwu0XeWgA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=skrq+eN2d+L6mpiBAkMMa0xOuAfS8Ey9/QS3eU/PIkDWAvq6Zb1QSkDcMzC+YsK814SiY/2eGJ6l7pINyLDUon05uJXoj4g2GqHmgBSQ7qUxuKhyMv3ch+6U97GtY7IaDbrVIoUNPDUiRVpJVYylxE2PNDMcyZO09+Le3AL5+yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ms4La5U8; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ms4La5U8"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-adb4e36904bso769200866b.1
        for <linux-staging@lists.linux.dev>; Sun, 15 Jun 2025 16:11:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750029104; x=1750633904; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IuRC0Xv8GuCK7/0M2ogm1jbfujpFFyPz5eHg0qrJ1d0=;
        b=ms4La5U8yCAOJExpOVRzFKzwD7lXldeQ32Dl46B9IgKdEhdwP/MzE65rdgR2lIqn/c
         iTtGTiXdahS7DCi+JQs/C4l4KdBFo7a52ZS6UM5WSI0dH3lTy4h6claaSWFBPbXIHv+A
         l1CcPxkTZFWA1GbIdAa/ctboGsUezNWbd3BnNmU0F2k3RpOptJ/BW/zdvoToLAX7QkLU
         9pPPfyrTRD8/SYBFgk4RH7Rrzhr/tzySKXKgf7uCMTHnNH9uXBFfRKC50wm38AOiAQFQ
         ZMNvWr9dt9BdpEnuo1YCc5hHib2rUGHp1Yvoi23YkrHnu9y3X9awsNPRodBgQeWlJnyA
         vZJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750029104; x=1750633904;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IuRC0Xv8GuCK7/0M2ogm1jbfujpFFyPz5eHg0qrJ1d0=;
        b=JxYEIV4Lh5zOkm7HuqU2X1aHpW/qyOOf3saSMGsJjAaIiHaVzQnxoC83lccmKyLnVc
         sQR+9s8AXE60gQgECFi+/U6SFsXq9LnW6vtYmzERnfXnKXpcjdpMwFfOy5RVQgOmwM63
         bdMOiwa08Ssn8gPznvHOU8AzQ8q+YXWkcSOV0tMrBVW/0epWwaBY3dnJ4iIYaXCz7dVm
         7B/Q/hgNbBsYJsMT+r6P+wIw2lHIcb82xqgcRQeixrwuKTyz52CFSexGb6b1enYe8p9A
         zwa0BADUkbHd0xH3uVX+B20dASuNC80Ru9Il8OrIwmJbtWfL0oruI3X7/ENmNc/nIxjx
         yHKw==
X-Forwarded-Encrypted: i=1; AJvYcCWQ1Ig/9V8T2NZUhX5oIVEWV8e5T0xX0yQwL2aDXFbUIIBo1zURCw7/PgXMcRiCZkIxbBBhV/lX62xGOmvN@lists.linux.dev
X-Gm-Message-State: AOJu0Yykb2MS/DpH3lEU3JcdHNYxO/AnhGkoG4hiNaVsTBBJIP1iA/Qt
	M8/Ose7zYLjbmEzNx9KeoA0ey3DR211YrAWPWoaZS6ZAmA9QqICxgQIe38mqKilDxDBQ5WpP
X-Gm-Gg: ASbGncsdcaMcfEycKB7NNHF8jbNGWRJcjXYyLuBkZCYoty1lZwwJ+edKyEgVi0rHszX
	Myx2VfAvJp3O9XsqmawoXe196xqpM0L2WuE/jHafg5ZU1oLQaGtDuQyjvJoCcDTNGaM3LJHgX12
	9gpEGguLQbExyl73L/mFFgf3ZPEerqETRCEP+3cltLMmORI26xXWn5D9vnsxA13RMy6pKLRvpek
	tfQQLaG+b0Mx57QxHsZljUelNnXkbEMH58zfv/rIWvHx0GKM6F9mu0uapyKsG3Q1GT/0hBKK1Ur
	2OlSgpaKQUffqx+gAWQFMFB8Y+R+8JnRMHfZVWAFdm36DseM0ArJxTAbCA9pvtl8KBa6x0c5wnH
	WLFPJl552bgprfBV3dd24JPVkJA8lf/4eC70OIiP1QsnweUMMRvqbRT0oMK5DUjznwC8RCcQ/JC
	TX5DeqvEPBkzSQuewb8ObCPFI=
X-Google-Smtp-Source: AGHT+IFyGA6EW7LECZpZrvsKlkrWn3k+KNaMnoQqSqnxGmyZY0vgQDtyxj8I6kVAvREM6+v/SIhKvw==
X-Received: by 2002:a17:907:ea5:b0:ad8:a935:b905 with SMTP id a640c23a62f3a-adfad437a98mr606897966b.22.1750029104414;
        Sun, 15 Jun 2025 16:11:44 -0700 (PDT)
Received: from chimera.arnhem.chello.nl (2001-1c08-0704-3500-b0b7-97b6-556d-11c4.cable.dynamic.v6.ziggo.nl. [2001:1c08:704:3500:b0b7:97b6:556d:11c4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adec81baf3esm546347666b.40.2025.06.15.16.11.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Jun 2025 16:11:44 -0700 (PDT)
From: Thomas Andreatta <thomasandreatta2000@gmail.com>
X-Google-Original-From: Thomas Andreatta <thomas.andreatta2000@gmail.com>
To: hansg@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 1/5] Staging: media: atomisp: i2c: hardcoded function name
Date: Mon, 16 Jun 2025 01:11:39 +0200
Message-Id: <20250615231143.1558392-1-thomas.andreatta2000@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Checkpatch fix: use func instead of hardcoded function name

Signed-off-by: Thomas Andreatta <thomas.andreatta2000@gmail.com>
---
 drivers/staging/media/atomisp/i2c/atomisp-gc0310.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
index d35394f1ddbb..f57f2b70909a 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
@@ -584,7 +584,7 @@ static void gc0310_remove(struct i2c_client *client)
 	struct v4l2_subdev *sd = i2c_get_clientdata(client);
 	struct gc0310_device *dev = to_gc0310_sensor(sd);
 
-	dev_dbg(&client->dev, "gc0310_remove...\n");
+	dev_dbg(&client->dev, "%s...\n", __func__);
 
 	v4l2_async_unregister_subdev(sd);
 	media_entity_cleanup(&dev->sd.entity);
-- 
2.34.1

