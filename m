Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8752276050
	for <linux-staging@lists.linux.dev>; Mon, 13 Jul 2026 17:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783963291; cv=none; b=Rdt9+DBeNZkTzjmjS5UaMajXNdsU3VhhhZIZygCytMVLcLi7TcPaUT0WlCtXPtjebOgRG77FjWyGObN/PcQnCUt91zgJsk0+cVLTBPwHQal5XTHf8ybBgHv8INxM6Tk+RKHd2JUvg4GG9j0eXCR+PhxB94ZrZ2uAXROQoAMMx0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783963291; c=relaxed/simple;
	bh=H1Iz7IMNy+NBBLF2lJ4JDxKCCY2c6NJXPxecRbmI2+A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mIZIPnSDDUJ4fJGaBR28FW6x2a3CYwBzbsWiSZ3lfDIzEpIt1oHprqcI4zqDH2HHjDccgFpb9mIBh5SxQDv3ZCS3Nm55JGiBJ2Du/klYHUfoXPa61/YlOgli66G6gIB+gSnhn2RLXkIvdUKNK0tjI3SokH0zJpHsmL47Q/JKsAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CYILDARE; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CYILDARE"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-385ea3ce80dso3721685a91.2
        for <linux-staging@lists.linux.dev>; Mon, 13 Jul 2026 10:21:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783963289; x=1784568089; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tNqpsvb529pea4MTwMPJfT3oG4xMq+3jZrBViJ1NtuA=;
        b=CYILDAREZdWOCOphJLenFnRQy63yD8PjwyLJQMRUZRA701fLD2hmDo3QOSmvFE71gQ
         yxUDctlws4rZXw0sf3zV9lBj61y4jjtKRHNCqiTTYLSUj7vuDBhIOOxz5H168jaS2h7K
         LJsiRfGuZJN88X1Z8rKlwPPBQsnVIrRSsJEZmJsopeOIdphxfyESKA/+Ddk6ICKLociA
         eZs1CjrCqTODyd2daE3oIvERZfFQ6/WXzYN54J935XGMt/cjfGVQEtpwN7xw0CLP1bzg
         yIHIMqF4o7E7Ws3d4HP7JU46r9fA0t68keuArBGBxUnJbF71przi7FxSRzRSQemHQLe0
         I5/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783963289; x=1784568089;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tNqpsvb529pea4MTwMPJfT3oG4xMq+3jZrBViJ1NtuA=;
        b=dt3jniQ6DuNar7m8L94b4Tv3i6A+sJD4bkTjMypHIXn9QP9EwUhlAHiqpL4qRaCy98
         AkVy/Dl2CrlA0pxktxW/yflF2dHSeIgOqFNk0FIFBfKpISam5H7kr5ExopZMnru8BxCr
         C9reJUsplWFs3VXIoOCW2IiW6gzGZ3tnURXlQEoSb8OcO5OX1pcYzEBLKKj4qTZzeTlm
         KOILoVV8dJL7r3dFb9rONWIQLILBThqX6Go5MuAEqEWz77lZAvsy5zNrpm5h0UME7vM7
         rhxAiNygqZ+EpUKd36ZkMK+i+CmX1UIx/ZLu4+6Uw1orujQNCyWvMK8Odm86wmylI3Rj
         IjUA==
X-Forwarded-Encrypted: i=1; AHgh+RrPJGmmi/Kix9d6ZuTMkkF6PzsSrZ4KSUFVzHw41t2sfcc/PDfbLtF57X7IeLBw0K6pF88Crl0lHU9kwESM@lists.linux.dev
X-Gm-Message-State: AOJu0YwNLCqwesCB4e5rGejabl9cwRUI0gkKGl+NBFBFYkzr9NNtWIhw
	XqILuhj5IFZhLnzk54wiTVSqp3vhmeqPELHqXRK7fvsLFzWm/tQTZMg6
X-Gm-Gg: AfdE7cl3V+WNmMi2XqM3Th4mIX7s2DSVhgYtBCqV8NTpQTVYw2LPpV7wm2RPlE84Bjy
	2KaGCSmQe3IG5MIDxD8EAkl4X8FIZ/LejIbFEg3dvjGrTWEsXnExuxr+WLgBnCcfPc65NiO6lZ3
	m0SsPodeJTMt1Xa4NbFndJdPuvaL8VI0qfO4scfQpdcrUsYYS8JJMo8KxwcNBcQHqezjJz1Xe4q
	6FsNt68UI8kqbQCzBZV1TaKDM3VZrAiHnrSRFrxecsrj4fsAfK6ir04JTW5ghLnKxPYL/BvgmOC
	Shncl/QvrGx4wxvs0NLm1kD0xw6rPlIEjgQwEYFaa7oVP2G8WPSOhQH9VQ0xM4mhmAuzTq76Oxe
	Y/HmdTZ8oWagALgcCjF7esY0qBtUhTfyd5oJAs2k7vdxTZeEi5htV2EGaZkCZeXdvfRC3eKTZSd
	qBfxXQvZZOxx99HwOHbWmfNIWgoaHvURQ+B4WK8fPjKQ8L2GM6oc8ezvPf0/2z3n7vTBCct7UJF
	e+cB3fV1izoKhuUQPdkGSuvKGa/TuQHJTKUU+26vYpSWWs=
X-Received: by 2002:a17:90b:5112:b0:381:6c5:3f63 with SMTP id 98e67ed59e1d1-38e17d96405mr129387a91.6.1783963289228;
        Mon, 13 Jul 2026 10:21:29 -0700 (PDT)
Received: from OMEN ([103.184.238.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-313b4cbafa1sm57958608eec.6.2026.07.13.10.21.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 10:21:28 -0700 (PDT)
From: Alfie Varghese <alfievarghese22@gmail.com>
To: sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org
Cc: bingbu.cao@intel.com,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Alfie Varghese <alfievarghese22@gmail.com>
Subject: [PATCH] staging: media: ipu7: add NULL checks before ipu7_mmu_cleanup() in remove
Date: Mon, 13 Jul 2026 22:51:27 +0530
Message-ID: <20260713172127.615-1-alfievarghese22@gmail.com>
X-Mailer: git-send-email 2.54.0.windows.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ipu7_pci_remove() calls ipu7_mmu_cleanup() on isp->isys->mmu and
isp->psys->mmu without checking whether isys or psys are valid
pointers. If ipu7_pci_probe() partially failed and left isys or psys
as NULL or an error pointer, the remove path will dereference a bad
pointer and crash the kernel.

The probe error cleanup path already guards these calls correctly with
IS_ERR_OR_NULL() checks. Apply the same guards in ipu7_pci_remove().

Signed-off-by: Alfie Varghese <alfievarghese22@gmail.com>
---
 drivers/staging/media/ipu7/ipu7.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/ipu7/ipu7.c b/drivers/staging/media/ipu7/ipu7.c
index 310e3f24e571..41436f22c684 100644
--- a/drivers/staging/media/ipu7/ipu7.c
+++ b/drivers/staging/media/ipu7/ipu7.c
@@ -2637,8 +2637,10 @@ static void ipu7_pci_remove(struct pci_dev *pdev)
 	if (!IS_ERR_OR_NULL(isp->fw_code_region))
 		vfree(isp->fw_code_region);
 
-	ipu7_mmu_cleanup(isp->isys->mmu);
-	ipu7_mmu_cleanup(isp->psys->mmu);
+	if (!IS_ERR_OR_NULL(isp->isys) && !IS_ERR_OR_NULL(isp->isys->mmu))
+		ipu7_mmu_cleanup(isp->isys->mmu);
+	if (!IS_ERR_OR_NULL(isp->psys) && !IS_ERR_OR_NULL(isp->psys->mmu))
+		ipu7_mmu_cleanup(isp->psys->mmu);
 
 	ipu7_bus_del_devices(pdev);
 

