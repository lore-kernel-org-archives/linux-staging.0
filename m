Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EEB853CA99
	for <linux-staging@lists.linux.dev>; Tue,  8 Sep 2026 19:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788894643; cv=none; b=jcEgSxhYEhvEtXUqC3Y5q0ZvpD89IWA0YGoP86yfUf3V1SpXemzplS6gSVzH2mqF//xQuu14m8uagmJHwlhfG5OcGNzZdqcMEWiFDW6yZPwb41yTSUVustlUfCBd1Tnz7zyEeL8p5rYOeREKvXyl/pBgRUfYUU00A+MxZJp8Sls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788894643; c=relaxed/simple;
	bh=/VPU7Rkj6vLIJ5qAiVTp1qZlJHmo5K0QLBH58A5WbIQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rDmIckWfXazgwF2XicPR8UbMDtMhL/7yBxGYxDHECnuJVFpp8wp3NiwBQ50JCPuhCkdwXRDjW1IqjKoej3ctOa52tIqR1WJ6VItbD1byThPlTHeesc1BopuxPVGPqR4od0AmEQz+IQ0apxfwYRXrI7JbKqMFLOFuOiR7CT0BwWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J7ciwRfk; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J7ciwRfk"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4843e397f74so5447942f8f.1
        for <linux-staging@lists.linux.dev>; Tue, 08 Sep 2026 12:10:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788894640; x=1789499440; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NTTrZUFmF7kfstEYKrN0Z2rLRgXViJ8Jum7mn+JytIQ=;
        b=J7ciwRfkVcpRUz+oXpKae7FRESnhRvyslVZwNTHEWDWWI/2v+rBr0j63Dmt+d4/VEU
         mQrv4OmQsstVSyvjC/FIDmaTe/knU2Nc6sYhEmFiJrCNwAIJt5/ohNx8Sz+2gWbm8Ffs
         w71J7LbNKS2Uwg+NpirELd45K6uYFPAKR70XOs3zJtHojvjG5e6ZcMhJDuP+hk3Cno8D
         5sgZWwDWcAvzFL/eZ61HJPbvb2VfePL5p5Sx+oDlpzEkpWyZ1FYHUgIdm91SVaUAOXjD
         IezPVZrg4frLwrnoJJRjhgWrgAiKCPmYGuvKzCkQw3OCWB2vHgyrEdeOy2b+o7y7fOue
         ydZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788894640; x=1789499440;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NTTrZUFmF7kfstEYKrN0Z2rLRgXViJ8Jum7mn+JytIQ=;
        b=TQ29WPVRys+u+ZBuvAAqsu86rfcKtmCgGGlLYxgliiZ/7S/MHUAIhrjVAFT1mQ1Pcl
         EVO2iFmzKSQR8IPp9us82y8z/qn4RdV3z0yEP8eB0xBY5ocbhm/7Iyr7/urEgZwpg/RG
         ztG7dCeUYtKw0/K3TgXU0ogoQhwtF3F2Nqqif3FdU+I9m06GQ0tpcR74RcuxLLHBx8Vm
         8flfVhBLoj+ZqDDvcT3tEcuYirBqAqUybndNJxAL152zHKM7rSZ4vQhQ//wzCj261G3I
         TjQ37qzlQ0jh7nY53TXc+CdCD4GonNP9oMkmEA2Tp4XTf2AIpMlZXMxhCDj7SHd002w1
         fXFQ==
X-Gm-Message-State: AFuF++nTpGc53Gfw3LRndqM/AoyPg/32DFGQM5NFNllxLXbKQw6emGY5
	kHxDyeCETirxuYPFYcBqAJey7/kalLBoepF7etYNJ/2ZAo0v91t6ytTg/vN2qQ==
X-Gm-Gg: AYBFou3Kz3wYBRAn029CxnQX1frkwbcZl2cHzeq2AdfpdZxdi/ua013ynFC0cH//i9p
	r0PeXMz6yEq4kiOPZuZ5eGLn4eR4bmjyGIJ/ptIqasDfPEGMSG3w6taMhUyQqAU+Nj0GmV6nbU5
	urbjDbityF1ztm4Nk2Bl8oXDQ3rSKyp7TJRl42xfZzg8jcxdP+JewyHNP+yLHFbbDLlfWVkhMoR
	49A8HAzQIrowhCvl530arFAAgM+qYHwk2nHpu8IpUL1lhi+vJxz6qg9Y27q07LI24k9HonAz43t
	f81E56GAlkmZdxklcpvt0Y6j5fM/ggtqR4Ykqa6Pmpddm0EHFGrYNo+cyIv5/ldU8zkrniFlxdA
	GeA3nzvx1MT/mn1lYKiT/Xkbr3QzEUvTviiWdD3ftjgeh6LXfsrOeBBX88iHFuYG6sdjetJQGzC
	yy6k+Ynrp/FL5ZgG+grUYi485p6VcsecIm7tYsMpqcIFBYfkOpUI61IqiiiYYQ+qZCzQ==
X-Received: by 2002:a05:6000:2008:b0:485:8226:c69d with SMTP id ffacd0b85a97d-4858226c991mr39156459f8f.28.1788894640245;
        Tue, 08 Sep 2026 12:10:40 -0700 (PDT)
Received: from predeASUS ([86.124.216.24])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4858ac2b4cdsm36778622f8f.16.2026.09.08.12.10.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 12:10:39 -0700 (PDT)
From: AJ39210 <predescuciprian99@gmail.com>
To: linux-staging@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
	gregkh@linuxfoundation.org,
	AJ39210 <predescuciprian99@gmail.com>
Subject: [PATCH 1/4] staging: rtl8723bs: update TODO list for completed cleanups
Date: Tue,  8 Sep 2026 22:10:32 +0300
Message-ID: <20260908191033.13798-2-predescuciprian99@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260908191033.13798-1-predescuciprian99@gmail.com>
References: <20260908191033.13798-1-predescuciprian99@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: AJ39210 <predescuciprian99@gmail.com>
---
 drivers/staging/rtl8723bs/TODO | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8723bs/TODO b/drivers/staging/rtl8723bs/TODO
index 34c216e6d..8de062b47 100644
--- a/drivers/staging/rtl8723bs/TODO
+++ b/drivers/staging/rtl8723bs/TODO
@@ -1,7 +1,10 @@
 TODO:
-- find and remove any code for other chips that is left over
-- convert any remaining unusual variable types
-- checkpatch.pl fixes - most of the remaining ones are lines too long. Many
-  of them will require refactoring
-- merge Realtek's bugfixes and new features into the driver
-- switch to use MAC80211
+- Partial: remove remaining code for other chips that is left over. Unused
+  non-8723B AMPDU burst enum values and unused 8188E ODM fields have been
+  removed, but more legacy code remains.
+- Partial: convert unusual variable types. The channel control APIs and rate
+  helpers now use kernel fixed-width types, but more legacy types remain.
+- Partial checkpatch.pl fixes: several overlong callback and scan-list lines
+  have been wrapped, but many warnings remain and will require refactoring.
+- Merge Realtek's bugfixes and new features into the driver.
+- Switch to use MAC80211.
-- 
2.55.0

