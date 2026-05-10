Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B41D3ACF18
	for <linux-staging@lists.linux.dev>; Sun, 10 May 2026 17:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778434949; cv=none; b=bwvG/9m4mv81qcdE7NG1Q6ga+hmAb5RCyJju6w/Rvd6UYtEcnUPeWUQstE4ctBQYFfkrAIpQNH9IdNYhzCzlCMPJMl4ClntOVQZPp0nNySU6ma16Q2nihELiBMVYcWHHjBLxaPTWW3PDXesrW1fackGxRUfFMxXkgQxwLV6HjfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778434949; c=relaxed/simple;
	bh=2iUSWVVtueQdPjrNorJXnPQ8XswjLfC8mrjl1HgqNo8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hKnLen1jBB//U2ny6GmXz+5DLwH/oHOursvzD2+4O/jKb6mgQlWUjd92kPOgXiMk+tvBUvNXqJCpXXafWcKBJsiPS6v6Vv1Y94OYZabX9kpM/GleeW/3xv4u7XeniWtbnX9X0pDT0VCbexrXo4yAqQcttAQ1cd9/iveF/i/afuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hK/+4q9I; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hK/+4q9I"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2b7d3ecc10dso35027705ad.2
        for <linux-staging@lists.linux.dev>; Sun, 10 May 2026 10:42:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778434947; x=1779039747; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6cFWZ3rvi/oOwKQnrCJ2NMWOLi7OI9cNywAbL8M/o2I=;
        b=hK/+4q9IL/UDzVmXJd82JybsWpCNOV6XuHnhea4cICjp+mBmqxZ2vY4sHYLRFuEfbd
         3p0zdEypRfZIe3qrQHBtHI9b2naCvgI8gSXAvEKPRCWWpacHVrI+TeNxrQSx4t2+F9HD
         pgIZQDoju8W+xYsTigdvqxRe/wJrpthJdG4vBLCl7GJ7trXvW9BM0TdyQwAjdkp4CkDj
         gxy+ond7TF2rSxwuOKbLESf2Iih++BG4Eb00dsC0j0+468Ct0K5fnS4djz3Kxc2Fkwh8
         3EYi5Icuc2WYU7O9pmVMDp/wndMXkzrxpKQdVC2cNP6i2DKzirYzUr+jLF96LQCpHo3T
         2e1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778434947; x=1779039747;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6cFWZ3rvi/oOwKQnrCJ2NMWOLi7OI9cNywAbL8M/o2I=;
        b=lJjbN5BRAbFqLkIBl3txZxsvhkQRceouGIrGIHy+IX1Rg6Ta50QW7Vtr/+JARhZZb8
         Y09nnprAh8k+QdllxSZMCayzD4sReJmkt4MzWe2c7N+MZpIi9D2vRd/IhB2ziKBTBab1
         DP9UyG/QWNIa4lFigDpZ9op0n0d+uQC91G2R+7VYTwRLp2kV6Vlx+mCjaPPTNQkcY+l6
         eb0nZEtvled5otIrVKQRV/8hfRe5E/1wRRnhiEUNd3+qSkic0cHDTHSR9hHXagr5RtE2
         qse9JquThX4nRvcKxJcZjcezYYGP9ltLcBTCIwERF9qOXa9mAJMEJAO1W8KXduCgPyEI
         eI6g==
X-Forwarded-Encrypted: i=1; AFNElJ8ab9TCGJ0SqF6aOt1yHUO6oKqDpIYGhoQzzcuHmM4b7Gx1JaS999OFHUFk1tREjWhb+DafwOWxR/U8yxvc@lists.linux.dev
X-Gm-Message-State: AOJu0Yxuz74wgN1AHOOlSW1Fzg3I+686TmlrtOZzi5Ny0BMe6dCde/LW
	xl7L++dxYMluYou9VE0UWR+DWotKbWGB4gQWRbrBfgw3N9/cvNBoxztCWB6lQACz
X-Gm-Gg: Acq92OG977uv95sLuUzAaD0n+2KQjBM3kay7NHIbq8KePaChBL0neMOe0G0y6rbvGr6
	ovLeDKZBSRDbow49VnQUBX38N15SQGA385gJbN9DKr7tY1dpzmMIaJRde1Q7vx4HchBnWdW/d5a
	0xh3y0ldivVs9LvzOYPvszbhsiEoi90UvFTGldl2tbEUNJx8Nb4FiKe4vgECWDnZOaMrmOYYI/5
	dOhtngkIEp1kRFH6200l52wxGuBKSR5GueA9kCdqV3IZ0cvUicYm4JHM6fRqN5QG5bZZTWGWxk2
	eCVlDn2U0qh8ZhcD7O7s1mJulxcE8wE55VwrRb9Dez7nzpUpioNyBna3/gUyS87LB1XmIFJ1QOH
	9amj6wj5gWp0TEYqY+CTglhSWilML/isAmJJ5jm8Dt/3br3VIh+G9xaVUZcgBuXx5YE+o1TIsk7
	pUZcnmgHG2bZ6iI/YHZyJuOFIhumtnwgw6nl9xfKsXKUdI
X-Received: by 2002:a17:902:d481:b0:2bc:67cc:d1eb with SMTP id d9443c01a7336-2bc7aa22685mr70846615ad.28.1778434947365;
        Sun, 10 May 2026 10:42:27 -0700 (PDT)
Received: from MAHADEV.localdomain ([103.175.63.225])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1c5466bsm80815365ad.0.2026.05.10.10.42.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 10:42:26 -0700 (PDT)
From: Hanu-man12shaw <shawharshit116@gmail.com>
X-Google-Original-From: Hanu-man12shaw <harshit116@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Hanu-man12shaw <harshit116@gmail.com>
Subject: [PATCH] staging: vme_user: fix lines exceeding 80 characters in vme_tsi148.c
Date: Sun, 10 May 2026 17:42:15 +0000
Message-ID: <20260510174215.1444-1-harshit116@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Hanu-man12shaw <harshit116@gmail.com>
---
 drivers/staging/vme_user/vme_tsi148.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/vme_user/vme_tsi148.c b/drivers/staging/vme_user/vme_tsi148.c
index 4cf3486646ce..0e8a67fbf562 100644
--- a/drivers/staging/vme_user/vme_tsi148.c
+++ b/drivers/staging/vme_user/vme_tsi148.c
@@ -755,7 +755,8 @@ static int tsi148_alloc_resource(struct vme_master_resource *image,
 					size, 0x10000, PCIBIOS_MIN_MEM,
 					0, NULL, NULL);
 	if (retval) {
-		dev_err(tsi148_bridge->parent, "Failed to allocate mem resource for window %d size 0x%lx start 0x%lx\n",
+		dev_err(tsi148_bridge->parent,
+			"Failed to allocate mem resource for window %d size 0x%lx start 0x%lx\n",
 			image->number, (unsigned long)size,
 			(unsigned long)image->bus_resource.start);
 		goto err_resource;
@@ -2252,7 +2253,8 @@ static int tsi148_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	struct vme_lm_resource *lm;
 
 	if (geoid >= VME_MAX_SLOTS) {
-		dev_err(&pdev->dev, "VME geographical address must be between 0 and %d (exclusive), but got %d\n",
+		dev_err(&pdev->dev,
+			"VME geographical address must be between 0 and %d (exclusive), but got %d\n",
 			VME_MAX_SLOTS, geoid);
 		return -EINVAL;
 	}
-- 
2.53.0

