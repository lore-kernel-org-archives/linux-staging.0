Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4319B318BA0
	for <linux-staging@lists.linux.dev>; Tue, 10 Feb 2026 16:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770742153; cv=none; b=sJTO43avYLzk7uanhI1NglP2GIXyfNVar+eAkqdPOJgmX6jKEIeM6W5vqOv0dULpDLtkH0Om98LWnFEzvpu+Ea+BbwS1KnVdB33LXUFdHc52uJc0zINAlyh1dvobE3hTq+eJRC0ZTU8hZ8AsbIrcDJnifaygKtP30MIlmpOvOHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770742153; c=relaxed/simple;
	bh=1Qjp7o4BtJN8xUciFhNThFb0nnA2ZVteFG+dNXHIZ1M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UAyRhsl6D1aVPxei1fps5uPfwaugpUsj3qI8+xEBw5dXlfuJ6dhT9jlQbD9EIafQ6zq6I5lSwKuEc5W26yEs8yorKBmuMfVzBu89LZ+y507rGBtr2pZ4qUrAWHN1Kk+p+7rsEW4Of3rSCHQGyqRi0TrIqUnp3fFC5CLnL8/58+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gTaGGzpg; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gTaGGzpg"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-c635559e1c3so7946a12.0
        for <linux-staging@lists.linux.dev>; Tue, 10 Feb 2026 08:49:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770742151; x=1771346951; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HUWCBU8Uuiw1Kuwv/GZviTDvPp0TKU91Sb9bIfuCPos=;
        b=gTaGGzpgg8GBdz5aBqM6cT44cH17Y2uvgtjopRqsAOOImzzUPxCSshme828TE7kEtH
         FlPaDXTrR0fEiVSvSqQMv4lhWp05d0QdYpmCmFQauQ0D3bc+6bFKLB1V8Qr5sdJMw38T
         OKENfJudJk38bpnkQ3OSDEG9UzNogwK8QPwyDg3BiNToE5QVCEArZIql9OoidkkKmqX7
         NCoZl6Swx+KT7QfXYYwn2dIS/rrrn3JPBRIF50Cle7pR9zoh7/zCGF5jHgZNvh4MJxfo
         3aA36ku2U3NmTlz1zfRkbNQHYnfJp8VJBArxHrBj1WF4dYa1i2ZAXv1ue8r4bG/4wyWV
         xiOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770742151; x=1771346951;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HUWCBU8Uuiw1Kuwv/GZviTDvPp0TKU91Sb9bIfuCPos=;
        b=J0m//Yls9oiXIEirh6WPuFaCz/9Jhv0BSg/Ly3Eqey445lm7nIc2Em3q8LN1MUz3M+
         UCSorSfDN50bOQlqdZwRW7+4K/QY/RMZd9teaaC0jTGDYa+Lx2YFxo+GkWlL66hdc9OA
         an7q3iAZPjvYgXXhfmW9VOJSNinVQDMboH/2XONffsoiRdhVBWdvKyaLCgkYRXCSnDMF
         r8VlRhFeFeQYzwZfQhg32JxCKA8d/R6ipBL1DY0Zb/UtvKt+1UM8+dnt/x1WqtqyOHuM
         JdICGYZYDQ69j5xsCyz6Hvir4pPJR9FRb4cqnXNu5F18T2ACIJsGYoIxDbJ1Qs26DjjS
         FUOA==
X-Gm-Message-State: AOJu0Yzvcs4BnFNbMDEF2iCNqnxJkpnL9PNdupP7aMufQYH35tL0kpUv
	XhTgmfZGfB1GS+ouxqKfbveVeqwbTP5rLKfsahdBgcjY+YLrjOKN45TN
X-Gm-Gg: AZuq6aIs3w1vcmgK5Cu5iPHl7X56tDVYJ9PpL//GoRpDg3XOH5AaP0Yjmw7JdTdVQ2x
	7WORV7PrkMoswUZ49CwqRg9cVs+/LOHcvRnQWStHRXhDVJZjPiZ9B05FcUpEcdUjmyBxdPV6BH3
	pPCSsgZFjDvd8wLmMqf/XVlvj6imawJ85Bzwh8QRFWpeEJ8Xlt6MS+PUbHeMO9Vbpw1BtJLvp3k
	tDxwLSWv3mUm/JE5dFpACyXwTXvBIFaRa3p3oA9qiznQYiEW1kN+VBhnP+G35zMpkpeohBK6feI
	ckzOZC7eE/hdylbxIFRjt/pQDWjnxsoRvQJv1s9lRpikHNQY/JXpeHB2kmFTJl4zhrhBQ5CcXa2
	WYGAABEv9MyXZR/tlMBh6N9odlpICEOJHJIe6H6hFpQxbrJKMq67n8sPuU/wB1AXkExWbdo+DsT
	Cy5Re9KQnjREe6nhO2SewdJXI2iksdwumNWM7F6a+0x1iiModMaJ+MgHcRSEU6ui+M
X-Received: by 2002:a17:90b:2801:b0:343:747e:2ca4 with SMTP id 98e67ed59e1d1-35666465033mr2858474a91.9.1770742151525;
        Tue, 10 Feb 2026 08:49:11 -0800 (PST)
Received: from fedora.domain.name ([2401:4900:8899:5e8d:59f0:93ff:8a8d:ff19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-354b4607243sm8713074a91.6.2026.02.10.08.49.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 08:49:11 -0800 (PST)
From: Rajveer Chaudhari <rajveer.chaudhari.linux@gmail.com>
To: parthiban.veerasooran@microchip.com,
	christian.gromm@microchip.com,
	gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Rajveer Chaudhari <rajveer.chaudhari.linux@gmail.com>
Subject: [PATCH] staging: most: net: remove unused header include
Date: Tue, 10 Feb 2026 22:18:41 +0530
Message-ID: <20260210164841.118503-1-rajveer.chaudhari.linux@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unused header include from net.c to
reduce unnecessary dependencies and improve compilation time.

Signed-off-by: Rajveer Chaudhari <rajveer.chaudhari.linux@gmail.com>
---
 drivers/staging/most/net/net.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/most/net/net.c b/drivers/staging/most/net/net.c
index 1d1fe8bff7ee..fffdb60cd230 100644
--- a/drivers/staging/most/net/net.c
+++ b/drivers/staging/most/net/net.c
@@ -10,7 +10,6 @@
 #include <linux/module.h>
 #include <linux/netdevice.h>
 #include <linux/etherdevice.h>
-#include <linux/slab.h>
 #include <linux/init.h>
 #include <linux/list.h>
 #include <linux/wait.h>
-- 
2.53.0

