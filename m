Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39F941CBEB9
	for <linux-staging@lists.linux.dev>; Thu, 16 Apr 2026 18:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776365395; cv=none; b=ElDrg7RhoI2PFbponKUAbMTJe5I4dAvGyIzJ9LtCHixeLwYEbAMHjuxkCuFUksu72vIEL1y9V7GB0jI1cZtZmJe67y5tUCbgxGU39DzXFTihMPYcpfZpu/1Sv4zy1TJF2fMSNBL5cQQ1vpkSiZg9qhVVGnlwEdDzS0wJDQ2Lb5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776365395; c=relaxed/simple;
	bh=sWyB99+5sBWbk3HBJIRsGP07PNoJQbqM/Utdxj2XnjI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IYjmzRINdPcq6ga0hMz+TzDVWagSstqfgy9fMrEIeTUemH45pojGOUolF/tdQsRVOv5kNS0Qyn5Ux27rBkQylLZTfW1GFRJC3uulFfxUDzSDAIuwXSaYLFEquFLEaVcX5OXgnMDtM1ot8SX+iqoTyevfeyhEaEdI6tNwqWeviYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TtJmi/OO; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TtJmi/OO"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-82f8893bff3so88476b3a.2
        for <linux-staging@lists.linux.dev>; Thu, 16 Apr 2026 11:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776365394; x=1776970194; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PLeKkfzWHS5ML4Om9B8pQ3L/JlsStI2i/wsWT7w+17c=;
        b=TtJmi/OOETL38qVtRcAG4b14zUUppBpB+VB96mQNDFkKx5l3emcjToUQvoodKjEDng
         zKo9WZd3ewH7hHkL3plnHC6cQarPp76ctfj0tUfH5aspF7OFh7j0K2UWRtHatCuIB1hy
         jR1/UZ3u4LgYp57EdhXOawFuSm5bDN6E9sVG+qat0pF7gaQVVVTY2qMbhl0VHXdoGCVp
         kWk8++uKiuexEjY6bUi7s0z0W3QYbYwFZs93fclC7wTaI9UNN6eXLcyJe3SGdLy44FIF
         dNAynul7voEstezIQF1TVoX4RSzLZ9PSl7hDkPXbit0m3s4FrWMKt1DMjxgpNq6B1QU9
         +z8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776365394; x=1776970194;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PLeKkfzWHS5ML4Om9B8pQ3L/JlsStI2i/wsWT7w+17c=;
        b=CbK/jeswWv8T2ITiQOcnQwIeMuNmxT/Ss3hh2P23jIxsBfDEn05jNSs5IPNAbigzw/
         QujC1fo822s+ourMhtx60vC85C5izv/4yU+apQPaQCLXphmdcljyVSNgo6p3ovK6i8k3
         vip9xjAN+M+va0zR2JOZw/DpvxD/SdCBVLTa9CEoNKagGLOnFTBjY8aA+rSw22z/sT98
         iVXc5eb3FgP310mEbeLDssq0Qkd1xPUfjY5Vj+jQaL98WChXHg26in7Kn7K7OvdL7amw
         KIze2di8NVbiHuoH55dBiR7TLgoo9xyBLBoeP5E2PgBqwqpj41VO4nPZBsR1MVIjEtqk
         egEA==
X-Forwarded-Encrypted: i=1; AFNElJ/iD1kztkIoJRs2Zl1c7YHU5cNw41wLzarVCeWnP8UDVBwk4Cax7Fmd8SCj9c5Pt58/eGDJISdxyj5cQBPl@lists.linux.dev
X-Gm-Message-State: AOJu0YwTCdNfYELivkuVqyKAxadLreGOaEsN9MtR7Xvql6DcPqmPoNTo
	ha1Nget5idSgS5jlDtKwIIN4JfzXU79byI7UIrOUZWfWKhEdLottG8ac
X-Gm-Gg: AeBDiesuJIYBM7ebe9uvF+tg3uLsI1ZpJplkuTMgD5Df3j9Ydlim8Mx+og39UMMp6+a
	TEbhXInx03+0lu0LSy39yWszR8OumkdhCniCui3gbyZbmF9fuS7/yzdURNavRPZtlFmNWY5nfTK
	+QH/eWq+q0gma5M1dJO2z3i0nz8HZVZA8RurFCGr01MKp0NJB6oNvXfSPJfPvGvJ2s66tX4YdF4
	UYYzR5Zh1Mc79sxCJO3ypEAoeO0Hc8gatDqWY7dkXFGi+tQ8NspXUM+1NYhTsh1gIK92kDraXoM
	lzXUJGQD+yW/4Ca4a+gSC9LWA9Jy0XW0co8Wv9qJNDyeXZDecC/jdxdeRQybmt1Fcd8VpZF5E9u
	0uoRwUC1t41VUa156nJBqKxxskmMNPHcPgRkyI5cdUIJHKyJCb9vVuW2z3yI1C7V9q9NIQdSUdz
	ORmpxQnVNuI1VKBuGxR/gWODSfRZkdNLBll8uP57yV4DtFe34s0vtJVIrZZSOblBvSzRv4UPGFt
	bCC6e1Up2QnIDMVqBB0f2tRgd4vfmdKhZw=
X-Received: by 2002:a05:6a00:2283:b0:82f:6a87:f75 with SMTP id d2e1a72fcca58-82f888fe3f8mr508335b3a.33.1776365393532;
        Thu, 16 Apr 2026 11:49:53 -0700 (PDT)
Received: from lucifer-Victus-by-HP-Gaming-Laptop-15-fa1xxx.iitbhu.local ([103.151.209.194])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f69ef0b79sm5378617b3a.36.2026.04.16.11.49.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 11:49:53 -0700 (PDT)
From: Sachin Kumar <sachinkumar905846@gmail.com>
To: andy@kernel.org,
	gregkh@linuxfoundation.org
Cc: dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Sachin Kumar <sachinkumar905846@gmail.com>
Subject: [PATCH] staging: fbtft: clarify TODO comment in fbtft-core
Date: Fri, 17 Apr 2026 00:18:28 +0530
Message-ID: <20260416184828.266168-1-sachinkumar905846@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CAHp75VeFZ7PDV_tT8tDibQk-VPkFFHsxiAHOAx-9Xp0N1ijvAQ@mail.gmail.com>
References: <CAHp75VeFZ7PDV_tT8tDibQk-VPkFFHsxiAHOAx-9Xp0N1ijvAQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Improve wording of a TODO comment to better describe the
intended optimization. The comment now clearly states that
only the changed display area should be updated instead of
refreshing the entire screen.

Signed-off-by: Sachin Kumar <sachinkumar905846@gmail.com>
---
 drivers/staging/fbtft/fbtft-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/fbtft/fbtft-core.c b/drivers/staging/fbtft/fbtft-core.c
index f427c0914..cff838955 100644
--- a/drivers/staging/fbtft/fbtft-core.c
+++ b/drivers/staging/fbtft/fbtft-core.c
@@ -414,7 +414,7 @@ static void fbtft_ops_damage_range(struct fb_info *info, off_t off, size_t len)
 {
 	struct fbtft_par *par = info->par;
 
-	/* TODO: only mark changed area update all for now */
+	/* TODO: update only changed area, not entire display */
 	par->fbtftops.mkdirty(info, -1, 0);
 }
 
-- 
2.43.0

