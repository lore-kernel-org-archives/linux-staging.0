Received: from mail-dy1-f193.google.com (mail-dy1-f193.google.com [74.125.82.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B2E33BB123
	for <linux-staging@lists.linux.dev>; Wed, 13 May 2026 21:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778708254; cv=none; b=c1MA57yxPjhO0GsKSJXb+MxEusL3LV+8aYBZqtjrg01ewP9NEdx2EyG0Af/hFktTjRQe7I/f/xFSgqrau3ZTzWBEz9S6AvTsedaUAUtHDXibsl5ZsOHW+Jbl2vyr3BxT55jDC1KWeJ02VetuC6y1SJK1PYRWUIOKHL5xF5kQ9dA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778708254; c=relaxed/simple;
	bh=PcpcQkXViZhUKZA+2YXsPoC9d9V56U/9nIYtS4ld5OM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Ei2WIpkSLrHr41/g9hEfqwWExGsb+IaTEYJxvxPxjf4dLJ4XZREFIGBE4KdGBRyiVNs6wu+upS6bXR2nol9XdNOXo9gEvYvdVLNY0aMsfOw86VwJ1JJukgKpXdXExnREhLV7NqYuJY2nLJk3fWw031MIeEu8LmGBIROkPbrQFWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cg7tVyj8; arc=none smtp.client-ip=74.125.82.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cg7tVyj8"
Received: by mail-dy1-f193.google.com with SMTP id 5a478bee46e88-2f3c623322bso12277427eec.0
        for <linux-staging@lists.linux.dev>; Wed, 13 May 2026 14:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778708253; x=1779313053; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qYqx1W3EaSSwEdkgWkOBSBqz8m20fk2SN+NNLNnkM+8=;
        b=cg7tVyj8LUItEGGjcIcMJvAKkCddFgEgwv0EuDlEefZW54B/hhqAI6P44BKlHHd0ik
         0NbgRA1nIUrDNEqr85KLfYZKyq6EHBx7pk5OUfdFQJCVK9H+xbTmt/NBkBN/Wj6GWery
         D2FcAiMCP/nqAQGCTTxhphBpAwYK+btnuBnR3DHZ6Gl3EfhGua9B/8R03Yh28uDAB4k6
         z+eFUV+JOAhqeqydXLScaqQqUUiIV8j+TomBnridLFzj+mAb1F7ojCHJzH8SNsUOG2rS
         0G8v4G7nn4I9CQtkGk6SV6tx1HLKb6HpDKBS44i2dswl7vR0U+kSY0+b9112h5ZrF49A
         ODNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778708253; x=1779313053;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qYqx1W3EaSSwEdkgWkOBSBqz8m20fk2SN+NNLNnkM+8=;
        b=ZiTYvpBRyQdr4a57cW5llO06fCDvj5K2IWqRWjGaoZHqky++4bYYOPmEgOzxhlM9KA
         x2BJas2W4BuqHm/eUgH21e+s2Vduw3A0QFc+nnf+8pISe/s8mHlKzPgKk+d8yqiHPXPa
         7HJDxG9Cx+E1KJFLyFwyix4pP8kfR71xk+kweH9miSX89N0WC9E1rbo+O7cRq93jIBiB
         MHKvbaqpNK5VTRTnGPCEbVsrY1dbr/6/LEFlK21IHHY24q/PazNcniJ7h3W6dN6DxHp0
         TixsjzUVEqh9rH+qNM/+e8W0EcKGY0CYo0E6GOerZMADL+DrA0fe+Bj9UxjK/6ku7JLA
         hfOg==
X-Forwarded-Encrypted: i=1; AFNElJ+OqoNnvNwE+bCb4y+7wX1RIf0NLafB5wUAanoYS0rRqSRzQPywPpoD6PwQDhlQOCRfZtPEAnLaY4VTgmbz@lists.linux.dev
X-Gm-Message-State: AOJu0YziMGhRHoMqCzs65IAglWSCecuAPNiRfbxn8vTiUlBXOgLna4wz
	qg9OmjwZ8ulQ/kCq8AZulTHjCbgyfv29RKd58m1W7mWpUABLh7peXZDl
X-Gm-Gg: Acq92OEIo03S9qQzfK2WOFmLvpnFGHEFnSSL92QpxEextOpWzuKC4mX80o2baG8RilI
	9WjybbnipHfjXRaIFxS0jj7IXqA/+L4DdvXo4c53b+Bbnih/OzDEDF4SRKK3SdpaG3ZYtu+H4Ir
	fYZFiyie9kqapFFdwJwMF2SW6i+xnkxJMsR/63n9mctN8pmHYOCY0TgH/D4KJNy41n0eqI2MNkP
	LtpQxU2xIMkGrbLP91Lrw/6denlCGP7fnYRikfm/i245rHhdNGfNNt+BA8lX4FIPyJgBlFGRHnb
	Kl4NM1dXR1t2sFZWEZymeLE/h7aOLvi7n20O7W1/tk6uruYIcBjXk2weWzQS7fOv6bhk+vNLGpO
	v+snMoKhBB7GaMVXKlAfs11c3gN7yW2yHXXfhSg+ZkNkDWXwCJGaJTHtec+URDMxI2Hxe3Ag6VP
	HZxJaLoAReX8t03GYATw2ssndiCoF+5DizGytlE3aEIYwE8zQYq5OIVjg=
X-Received: by 2002:a05:7300:571f:b0:2ea:5057:a31d with SMTP id 5a478bee46e88-30153ade430mr3047022eec.1.1778708252783;
        Wed, 13 May 2026 14:37:32 -0700 (PDT)
Received: from localhost.localdomain ([76.32.119.210])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30293e2e69esm732316eec.1.2026.05.13.14.37.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 14:37:32 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH 1/4] staging: rtl8723bs: simplify _rtw_enqueue_cmd control flow
Date: Wed, 13 May 2026 21:37:16 +0000
Message-Id: <20260513213719.12246-2-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260513213719.12246-1-dennylin0707@gmail.com>
References: <20260513213719.12246-1-dennylin0707@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the goto exit pattern with a direct return to simplify
the control flow and improve readability.

No functional change intended.

Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_cmd.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index adc151326feb..654f0aa72263 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -252,7 +252,7 @@ int _rtw_enqueue_cmd(struct __queue *queue, struct cmd_obj *obj)
 	unsigned long irqL;
 
 	if (!obj)
-		goto exit;
+		return _SUCCESS;
 
 	/* spin_lock_bh(&queue->lock); */
 	spin_lock_irqsave(&queue->lock, irqL);
@@ -262,7 +262,6 @@ int _rtw_enqueue_cmd(struct __queue *queue, struct cmd_obj *obj)
 	/* spin_unlock_bh(&queue->lock); */
 	spin_unlock_irqrestore(&queue->lock, irqL);
 
-exit:
 	return _SUCCESS;
 }
 
-- 
2.34.1

