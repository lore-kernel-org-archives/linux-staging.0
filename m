Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com [209.85.216.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 795CC3B0AD2
	for <linux-staging@lists.linux.dev>; Thu, 19 Mar 2026 10:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773916557; cv=none; b=bZmZ1KTXwGFVwk5KFsq7pYe/Oz/YvwXEa5WDn8cfVsVrNFbxfrbejT3HJSMStFU76/0oxdJbIdqQRBPV57n7QIQUZNjPk36x/l7X/OzVNkV1DFoaE/xvjkSarFhd255mPprf8o2zNh1Wyx282MA0HAdUWD/c2hUwPmCQL7HAXks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773916557; c=relaxed/simple;
	bh=swkt+SzHSUOHWDBwk5D+2y6l5EfClX0GySUg5E98kw4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nq4tqLly2d28t5jq9zskSjorh25A4PqeTaEAiIeSWB6zMjW4iGfwsGCIBd+T7ektv7bVkbaXbZJWgPx5/o6JazfkQ+UfW6kuX/r0qheyF5pz414X10Ns51yHe0en7YXehOadD5bk/Z+2LHi5kFo9W532patl8xuchejNiyxA5/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cDkmftBo; arc=none smtp.client-ip=209.85.216.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cDkmftBo"
Received: by mail-pj1-f65.google.com with SMTP id 98e67ed59e1d1-35b905a05a8so282935a91.1
        for <linux-staging@lists.linux.dev>; Thu, 19 Mar 2026 03:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773916556; x=1774521356; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tlPl5K2k8DfaT1rbeWGKMb6z3TeEUyI3TnPwWJfHuxo=;
        b=cDkmftBo91jmoojf2ZNNBr/w7Rb3BW53WasAMPTP0zFVj39pLF1Yygpei7jyVp3vsC
         B8nhNZdANtd4m9jLAsFK+4iUw30zWVM4JoxWchCZ7iYfV49gPyruoLa1pWn1wDgcD9tm
         6PaQwaZV7/pUIwQlPJjUpuOKgAchFKLoQdDGOPY4aFtZtB8aFtHFKkSrbGetlmDaSot3
         zLITZ7KcknksWMlRi+zXGvAFcK8P/y4EzH3t+CjPex+kdIQwST2kUQqCTbzcfbW78Sdo
         KbMPlyPF798Yexvou9nhESmRTJcchjAlfFHYwreNZIpYBElF0tk61ZrLodPmEMzNry5A
         zoUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773916556; x=1774521356;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tlPl5K2k8DfaT1rbeWGKMb6z3TeEUyI3TnPwWJfHuxo=;
        b=YNQMrBw6nWhmwkkYPCK3YBwnikpeZ8T9shBOdcLTs++0VQFvoW7n+xq9dKrxuuvfHd
         mZn7ASvZaP45NfSBz/FVUGG4g1Uzk/ZAnvEy4U3s2H4rT5yt9gefgvX8gjOD4iVZtXcx
         zbTahsKLHWyIWHP3lV52CmQsGbNVMhCLhTFrnHoUPefLeeMz/KAlocACQoGallk8oj33
         V+CahV2A7DY8Zfpg3+rHQ2Txbae8qtAJD72OaL+0U35HD7NdgGNNmkzazpf5TPOVAicP
         lj83I9UmFY+1g7A5r3XsQEaAY2MWsSMC5RjbL4rDoqYJVzrLDQB9D6yeSohEF4gDRJKd
         IcDw==
X-Forwarded-Encrypted: i=1; AJvYcCW4hKJHa2UcbZwo81TdjYiR9Bgufg1ajCvoQLoRkuyO/NWpJQxq104tXOkTN898JhzUOEbMIcw3WVeGNp8G@lists.linux.dev
X-Gm-Message-State: AOJu0Yw4/+knhdU1ZWhH7M4ohlfyLH75jvi/yRdkZwSvFgGr6CgaZNmq
	JdBjYODK13l1G130y50xLd/AC/buPLxreKcA+gDloKjVMhr01WsfIIeK
X-Gm-Gg: ATEYQzz02pC+Wx3c3OJzM4Dw6y6qV0yBxdn8/g+QEifWrsYCYb3RI+E2HvncoHITE08
	SUibwWK2nzF7rLcMY8FizOMQSOTyL0J/LQ4BXYPUDt4A57lPxWPJTuervLAeO5z6BNBoM6+PCqJ
	K27C+VyiPShMesj2VDVk5YPeM4xvnDqKfwOo58/bw9uhJSaREjI8SuEvV8tHxkTC+6Nv87LCUkb
	00C11amZRvMAv8aILiOkSjABAV1k/xB20Sq89cbilQu+L1LPxIqtiE3KrIUE3jz5RoThJE1ttq9
	uZIwjqd9qmy62UAdESHQXoUJHdpet6znRNlj2Ggue0q7uexZ4501S3hl49qviAjzmRecpEVRSuO
	ifXnPHtj+CsfjkYQL8jk4wiGRmiXh6iFBxWEqLg/AF6+Z0l1WeS08foipAW09GD48Bulw/hDsp1
	eBeTRGIWmQ172K4b0l8lZlwSxPalqNg6+EVN8V+5DHMtbM4B6HSoD+eG0+X9MMVJI6q1QHlTS5w
	Mlbd/izvt85qtlbKUcMkAsQDwJ8yX1+it4=
X-Received: by 2002:a17:90b:184e:b0:354:c593:b1a8 with SMTP id 98e67ed59e1d1-35bb9e7d24dmr5920825a91.13.1773916555696;
        Thu, 19 Mar 2026 03:35:55 -0700 (PDT)
Received: from CN4GKQDX76.bytedance.net ([61.213.176.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35bc6026a5asm2850964a91.8.2026.03.19.03.35.52
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 19 Mar 2026 03:35:55 -0700 (PDT)
From: Zile Xiong <xiongzile99@gmail.com>
To: gregkh@linuxfoundation.org,
	hansg@kernel.org,
	mchehab@kernel.org,
	andy@kernel.org
Cc: sakari.ailus@linux.intel.com,
	linux-staging@lists.linux.dev,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kees@kernel.org,
	abdelrahmanfekry375@gmail.com,
	Zile Xiong <xiongzile99@gmail.com>
Subject: [PATCH v2] staging: media: atomisp: hmm: remove unnecessary casts
Date: Thu, 19 Mar 2026 18:35:45 +0800
Message-ID: <20260319103545.34515-1-xiongzile99@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <2026031933-juggle-decimeter-3547@gregkh>
References: <2026031933-juggle-decimeter-3547@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop unnecessary casts when accessing vma->vm_private_data.

No functional change.

Signed-off-by: Zile Xiong <xiongzile99@gmail.com>
---
Changes in v2:
- restore the blank line

 drivers/staging/media/atomisp/pci/hmm/hmm_bo.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c b/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
index 856561e951a5..bd8091c21b26 100644
--- a/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
+++ b/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
@@ -975,8 +975,7 @@ void hmm_bo_unref(struct hmm_buffer_object *bo)
 
 static void hmm_bo_vm_open(struct vm_area_struct *vma)
 {
-	struct hmm_buffer_object *bo =
-	    (struct hmm_buffer_object *)vma->vm_private_data;
+	struct hmm_buffer_object *bo = vma->vm_private_data;
 
 	check_bo_null_return_void(bo);
 
@@ -993,8 +992,7 @@ static void hmm_bo_vm_open(struct vm_area_struct *vma)
 
 static void hmm_bo_vm_close(struct vm_area_struct *vma)
 {
-	struct hmm_buffer_object *bo =
-	    (struct hmm_buffer_object *)vma->vm_private_data;
+	struct hmm_buffer_object *bo = vma->vm_private_data;
 
 	check_bo_null_return_void(bo);
 
-- 
2.39.5

