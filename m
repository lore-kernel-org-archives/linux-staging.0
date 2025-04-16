Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E83A24DFEC
	for <linux-staging@lists.linux.dev>; Wed, 16 Apr 2025 20:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744836147; cv=none; b=BiWxvhZ/xi+izAZrmZaiJc+QgOvG14D2K+A6V0CXRma+Y165QP7coBHVqzZyZQt4EJa0jjoVLqC0LEmALN156wBpkdLRIJ09CPISIKzvHg6ULUx9+y5T9v0iI7kMWyQV28cb9BuXSYBwc+l2ykWbvllMpR/38QdxbDlBboHf5hA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744836147; c=relaxed/simple;
	bh=7oIHWBBjQ7BlH6IvMzYiszexZSDJnBmjz47kdnIC5NU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UCPAp1HsAarJ0ef53zmynze4UtyVzKCTnuwLxdDPOZW0tsUkaUlx7hDsPYv0sF1alrdr/0F6pAPfbIN/DgdBXgodrHsSkcDZMfRRNHQEzdGomNnZyr9xOqZZViJucPUKl6D2m6PSKESYcxraJURaQh+8oTK6pXtjigPZp+VZrFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=J6qqM5bf; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="J6qqM5bf"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-227c7e57da2so1065975ad.0
        for <linux-staging@lists.linux.dev>; Wed, 16 Apr 2025 13:42:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744836145; x=1745440945; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9Pdr3HWigL6Ku7LuE0NhaS5q7GdvsPzI86/WAfJAJfQ=;
        b=J6qqM5bfXBGO6AaHP4RSAwV9AjukKfx/u1sR2SiXTMsJ0jUQnpgPGPCfoHL2FfuRh6
         p0tBcVOfqN4FMXd1+b4X4FjXz282wGJ/hS55qVdWMmqvQA0zGV2Io2aFhJFxYn3P93GV
         HmYs9R5DoXnpxyqbp5GaGXDg3UneZsedw1shRoyyhIX/I8Ve6hLGu5koFTNnDQMuVDqH
         oeG/oohI0UlZ3XxDJ0gJcurXIc5D614UXAGHWu/tnCQ/l71uMGz3vWXQFOEkK0sRmb2w
         aVfXOstJyG3xgHtdDWhtZClkcTFPpQZeIzHUft6V1bvdPCcGj8NgRtmxsJwpsbAOxtdG
         6EUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744836145; x=1745440945;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9Pdr3HWigL6Ku7LuE0NhaS5q7GdvsPzI86/WAfJAJfQ=;
        b=NvfThulpuoM0BYtilEkQB5YgyBk0KrYxtyvQNbS9BBIraPzOrnG1sH/3L4iAvZtoyT
         aPjRxeeccfbCSP2qvPQCwK3o/ZMKdQ+skOguyWbinuSvTUulYzsY6wTsPsxAyvMVwb7L
         wXPeqCOQK9n0pZnjUfGh84cgI7upWZK4VcpnK4gjue1ephmJz7yNhWGdC6ImJRyAljbF
         Fx8mfDB+GO9QXKDjEj/oKh3RZPh5CtJWajfZLCSaF8p7922L/qIDd0UQ72HTuB0nEdpU
         Q7dhBzs6203X/wVrF7h7yFlNoPi/wBGza+DQMMLn56zbyaHXf+PV+wnI4YBa3XuOW5nt
         TlWQ==
X-Gm-Message-State: AOJu0Yz3tfic8qP0ZMd3bWNu9rGVQOHOl80cMhA7WACDAWjiuH0byiRm
	Lel94g6CDA4WhDRmgVmuyNN7q80vlo0tbDtDxBPNzQfbdVdDUEbl72PRdni5Sw==
X-Gm-Gg: ASbGnctOMTisktRf30xsbgXFX3EUJpeG18q9cm+rJEYsUV2mPoCY79ByABWpWftrlWn
	VY7AqQYqsTQ1IKzBe+BHEN/c+ibJrv5sEf3yZTm7oznN4WrOGrqoijY2kmoXeCkjcGYxVw5MRgp
	o3n1Ng1A4y6RpmgTxNmhjppHaFNDPZeFf4+S5yduWmAKxLEhVP/0HToKMp0GwIOWKiVd+SsJOHi
	Sh815QjlyKWQBYOVNq7xyKPLJdv0kltmtLyr6rQ3x2zt005oVoGKUm853WlMuB/XdzbENWtbbJ9
	H6hxylEVntTpVXrI3l75Rf82ZLBefgRSIKGWNnvLnZ6HGW1rcagD32OPY8A6GUwwz3CuatM+D7E
	yoj1AE1fhpc5Uva8O
X-Google-Smtp-Source: AGHT+IFgGXbC8NUaBhucm1SllpfE8LnJo42AjeHbg+eXJhZJkPIsWniUDEnSNOIKzZO0pM812bXo7A==
X-Received: by 2002:a17:903:234a:b0:21f:7880:8472 with SMTP id d9443c01a7336-22c3597480fmr64364245ad.35.1744836145370;
        Wed, 16 Apr 2025 13:42:25 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c33fe97ecsm18901965ad.255.2025.04.16.13.42.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 13:42:25 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v2 15/18] staging: gpib: ni_usb: struct gpib_interface
Date: Wed, 16 Apr 2025 20:42:01 +0000
Message-ID: <20250416204204.8009-16-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250416204204.8009-1-matchstick@neverthere.org>
References: <20250416204204.8009-1-matchstick@neverthere.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Using Linux code style for struct gpib_interface.

Adhering to Linux code style.

Reported by checkpatch.pl

In general, a pointer, or a struct that has elements that can reasonably be
directly accessed should never be a typedef.

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/ni_usb/ni_usb_gpib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/gpib/ni_usb/ni_usb_gpib.c b/drivers/staging/gpib/ni_usb/ni_usb_gpib.c
index 00f788a59dcc..a3d517efca08 100644
--- a/drivers/staging/gpib/ni_usb/ni_usb_gpib.c
+++ b/drivers/staging/gpib/ni_usb/ni_usb_gpib.c
@@ -2373,7 +2373,7 @@ static void ni_usb_detach(struct gpib_board *board)
 	mutex_unlock(&ni_usb_hotplug_lock);
 }
 
-static gpib_interface_t ni_usb_gpib_interface = {
+static struct gpib_interface ni_usb_gpib_interface = {
 	.name = "ni_usb_b",
 	.attach = ni_usb_attach,
 	.detach = ni_usb_detach,
-- 
2.43.0

