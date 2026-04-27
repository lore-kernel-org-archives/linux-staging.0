Received: from mail-dy1-f195.google.com (mail-dy1-f195.google.com [74.125.82.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8789A368276
	for <linux-staging@lists.linux.dev>; Mon, 27 Apr 2026 05:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777268875; cv=none; b=Ctxvn6blD16iP6DDgrWY1DNrCTowOqnfefb5TdvebvIsCBDYdVA9aynlE8CmCwQp9RvHSwZXgZxvX6gFucuZnd7laQ/ANCDqg3TLIYJOnEZdZraupplcyUSb5mwFMWsa+9z37jP6hIIzDs1msCkJ6Kxuj2qmlV1SjqmIgSAv9uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777268875; c=relaxed/simple;
	bh=J1mJvlaAW3wKVSXFEWKooMpwWLDuELTBMHdHUjl1OKo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rhji7veUNCBEDtqET3lXiqd0eYbuKQKvIOvtzQ5VC4iGxV8UGtlcFsPVHoWl5gN5iwAfrjo6Z4a8sbTiQHwEfxtIhcX5yXlWrphcFYVii0+tFCSjjsXaKxfwkBPiA8CCxoLQcAElhZ/pPVnDniVTL7JcAoHXKH7bCKXHEzvwHss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A7CIGoMJ; arc=none smtp.client-ip=74.125.82.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A7CIGoMJ"
Received: by mail-dy1-f195.google.com with SMTP id 5a478bee46e88-2bdcf5970cdso7953020eec.0
        for <linux-staging@lists.linux.dev>; Sun, 26 Apr 2026 22:47:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777268874; x=1777873674; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SPdLQCge1s6wCjpbb66L80RoiUF4bz6kOAIF+KX2Fo0=;
        b=A7CIGoMJFEyAV5vO3F8y/FKfO2SZoPAZAI98aPPHva+uG9OzZQY1Kwiiyq9bLeXG40
         1VT3NMO/12awsxf+NzBajilLHYY8osX81lmCGfGupSFEh7YIeBtIIcsFwrnhi715w2U7
         2zsq2RDuJ6puqJJ+5pcPsn8xg8RX+nFt7ATJ6UC59iHMMk0WXyvsLn06IgDq5GafYNns
         t+3+bUUaak35ytJNiATIyfH9F2Ttq9C5kLU+HINk42w13eU/iQT62C74UbGqbMxmvjvE
         Lgzg0f/mWlzWPSLSVvQfA9QhB1SeF4swu+iFImz0dOp6vDk955pSLHYJHrl1GlO0bjna
         Bq9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777268874; x=1777873674;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SPdLQCge1s6wCjpbb66L80RoiUF4bz6kOAIF+KX2Fo0=;
        b=L9qmBSy4qLta/UbxYpW/tlhIbTWHbpAZ1GJEQOwEt48fr9zwIwL+vslxJifS6PHsiS
         hlf+zTnLoWfHyVxLvBXo3J2J6krcCGmn6Hgz2cWSBQHU3xLFVvwwQDqgqcbc/pi4fshf
         1V88Ki/1DVRotc+woqaAoTS5fTdlar1oaTLCbubhbQid7K8sqwPceDT1MAEcKYqVWq5g
         lQTbd16Qy8YB1Zj2Jp9l1QAgvrBtr/n+lAJU+4K34uoKi5DIyp9+1hrkorsBl0fNWy4A
         gLTzg0SkE4dWBZgiGtmczEqq4a2K+aZ+ZiVbN7a9orMxc1G6IYdC3V/uTWz2zfn5NTlh
         qxlQ==
X-Forwarded-Encrypted: i=1; AFNElJ+Oja7uVvcplNgLcB4O86R0LB4UY6IpPhx0PEt+jpmmgCYcDCpb0xbo5n+xaBNicg9xsKP2K/6B9ttpxqC0@lists.linux.dev
X-Gm-Message-State: AOJu0YwJFpRUkR1ehKWNrABCgyq29nyNU0hUsicPtJmecu0WRr6ZNN7v
	CW+gy4BlXSX8+DTOuK/OuiobJY9BTE2pBSDBCmzJJGWNPfZ01yu+Te53
X-Gm-Gg: AeBDievh6r6oJ1rx6BjT6xKGJQ04GozgOhd4fsnjSrTm9OoDrNl/rJrKmVxQUJQZOmU
	hlXOn/CVTqp3tlwYxtAZpholqCiU1/zAkkc9vSjEwiJEfbVK4Z5m2yw9PGNh4qFT2KjEL2SSy7d
	A6nPiq9l8KVT9dMJVqoG77DSNWs+C2OGh/3JbnOEBIWyb5/VX1h2sFdwM3VzZXiDcHC3Z8e65Qx
	9bTDPMrA29sF4gPSyB6dlpqcOcMxe73Nec5Culs2cpycMFAUelB2sUrhE+PJ9bp06ghhRFEAWNH
	V5NuXrNZfjaSkL2xpVuOYveWhgA/cyWuzYSbD16waG1r9fZ6Srczhd5rOrIe5WGdlGzRS2Ti2Ws
	rc/tRvzRuKbGNiGNNDHD6rhLVum9L0Fy+fFegqwnSQ4GDvE48M1YAJjaU+7WaLh8wPbYVifvWcb
	K7UdMHC0MQz6uMSCkH9r18ZnJWupIG64EVnBuwgS7EAjQRCRyyWSqaciOo0rFoJKwFdLynv23Ul
	4iu
X-Received: by 2002:a05:7300:e685:b0:2dc:5d20:c163 with SMTP id 5a478bee46e88-2e42c848e2amr17751531eec.6.1777268873707;
        Sun, 26 Apr 2026 22:47:53 -0700 (PDT)
Received: from localhost.localdomain ([76.32.119.210])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53d2cfd3esm42350209eec.21.2026.04.26.22.47.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 22:47:53 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: sudipm.mukherjee@gmail.com,
	teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org
Cc: linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH v3 1/2] staging: sm750fb: return -ETIMEDOUT on timeout in de_wait functions
Date: Mon, 27 Apr 2026 05:46:56 +0000
Message-Id: <20260427054657.758-2-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260427054657.758-1-dennylin0707@gmail.com>
References: <20260427054657.758-1-dennylin0707@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The hw_sm750le_de_wait() and hw_sm750_de_wait() functions return -1
when a timeout occurs. Replace these with -ETIMEDOUT to use a proper
errno value and better describe the error condition.

All callers check the return value as non-zero, so this change does
not alter existing behavior.

Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 drivers/staging/sm750fb/sm750_hw.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750_hw.c b/drivers/staging/sm750fb/sm750_hw.c
index a2798d428663..ab3d4a2bf1a6 100644
--- a/drivers/staging/sm750fb/sm750_hw.c
+++ b/drivers/staging/sm750fb/sm750_hw.c
@@ -501,8 +501,8 @@ int hw_sm750le_de_wait(void)
 		    (DE_STATE2_DE_FIFO_EMPTY | DE_STATE2_DE_MEM_FIFO_EMPTY))
 			return 0;
 	}
-	/* timeout error */
-	return -1;
+
+	return -ETIMEDOUT;
 }
 
 int hw_sm750_de_wait(void)
@@ -519,8 +519,8 @@ int hw_sm750_de_wait(void)
 		    (SYSTEM_CTRL_DE_FIFO_EMPTY | SYSTEM_CTRL_DE_MEM_FIFO_EMPTY))
 			return 0;
 	}
-	/* timeout error */
-	return -1;
+
+	return -ETIMEDOUT;
 }
 
 int hw_sm750_pan_display(struct lynxfb_crtc *crtc,
-- 
2.34.1

