Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 661A41DE8AD
	for <linux-staging@lists.linux.dev>; Thu, 18 Jun 2026 04:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781755297; cv=none; b=tGX+uWWTF81JniAOSmng/X2Ql2p45J1rIDjtDgLINryh3DIBn6wQQaHP8J7FomlOa8SgBzjO2Y7M7qRwT+26cHLHgiRTLaMIZvvaC9vWqo7tF96BuoUa80/uS5XyU98OqnMgeNGUWIwL3V6qRzFe71TW/g3YOpHVVVEhH0tC61U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781755297; c=relaxed/simple;
	bh=IlgP3WwbjZJXNbilGJvZRag7eJ8bdwPgkEsg4GbkJ+s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q0eOZSJcbR+yHq56+jmfsB8QIXyLIeoLA3aQVXpMSGqbGnv+g6EZ7lt47rkuyNxmDrvJuR5kFV3/xUynqAot8n7omp5gP5mbn6grBUCYU4K6+t+1MsBpW1pqI18FzBRhLdgCePQfGJR2skcWOLXecA4KvgZlz0NohJelade8IQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EXmJ5+8H; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EXmJ5+8H"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2c40397e3caso5283575ad.2
        for <linux-staging@lists.linux.dev>; Wed, 17 Jun 2026 21:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781755296; x=1782360096; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IlgP3WwbjZJXNbilGJvZRag7eJ8bdwPgkEsg4GbkJ+s=;
        b=EXmJ5+8Hzm8PfjoeVjtN2K2k5ZNHSG7Xk57pmijR0ffPc9lwyKxl02QBtvKY+NyK25
         MlQacbx2KIvVtAUZU0yg8PVf+gXze5leq3pNuxnkcx+Vww7QSfHTJRct6RbfbcvdwXvz
         E8jI5iQ8fRBm/eJbv2sdespK9GLnP9/bPVROKpWMahsabZmzKc1+q+EWlBWsAyaVWfsF
         8XqZy8rEFZxznUF7pn/VECoaVAjI2HSCgTxSk2wBnOxZkQe8I657rtOVUGCfz9roXPuN
         Ac4KyQX4InrDllGe4f7d2hXWt6huevW8Mruu8qgx38bnxi7IWqw6RgB2cEI8CdcKGbDk
         hkQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781755296; x=1782360096;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IlgP3WwbjZJXNbilGJvZRag7eJ8bdwPgkEsg4GbkJ+s=;
        b=nJ1/XnigH4GivfTqUAcAht+QxYgjPC/jCZoA7iXqy9DlxeCh4onJUqWocVttRX9LSV
         Jr1Nnk1odT02+EWZIRYKN5nuGOb6L9Muq9N7ssnRvEQ28bwizNaNmoBkCBMh7LBVHQb5
         EzvmarJ1VYliktpSE1MI3xfsKicaS7qOW/SQg8Y0BF93oAuhwOqKiEoGATaBXG00cVRJ
         dNszTMHVGQAkAgzD/Ag08bmFiEOl+lYIF5GmZKjpIHcPPykQ9+BMtJRgPHdK37q//LnV
         rFd5I1Yryy4f3Ft5B9J5O/5oDKDrdoJp4kxDtHqanNhejyxs/j+BdvsGTItIQqw4KiQl
         p/zg==
X-Forwarded-Encrypted: i=1; AFNElJ/ljl54pqjdBZ8NvjulZzCdFcKPAbbUTdn8atjW8DkkxAkwLHMV43t7mZX3/vBNLWdbSSjnbabFUaIoo6CE@lists.linux.dev
X-Gm-Message-State: AOJu0YzepAiEGGTrCHaOpAu+g27VQXh2Up5oLoSYxvCsfHeuufl3xOID
	cOswWmw80I41YvbH/OI4aiqFJi0t17SSAUdzE3j7v2VC4fYe9ah8HuY8
X-Gm-Gg: AfdE7claagMlb401scmQNIpjls7FOae1buICQCI33tcsxgMd4FLDaLipacD2x80jBBx
	LZKIvNKEPj+tEO2JY9ToS37BGPUpr+qQVZ5TipZqcAb01ZoIF2yS4MUhRtxSfl1VzE9/UF15gZm
	o3kTL6pZKtOLGs/dbSpq+HfG9/vg1gmZc+gjSPwx/TNFyrCQHefWjc18mRPp01tc1IdYIF0ogHh
	kA/9CZps++GaoIptTIJCPVmWlE314zKJmGIPaaVLNUWl1/2+CeOLL7DXrElw4aldl5Ar+AEdVIG
	0k1XtlNZmp+ByIvU3WdzGPRu2Ss5npiqIcufSCkYJS8q164XcE1+btG0ZBSoscOqcaNkYV+InFn
	6k+yDeGSDimhHpZ5b6nWtKyfqAH0p5O2zxXAshCtbrwvuv79SdMZRKeoSsp/rVfegQwtksY4I5D
	nNxVyCZKSq1jbXjl3jZOEit3/UUPdDLBsJRNvWfwg4YZ/X2WOyegJ+HpH6apJVjDYmIQr4KBZRP
	EVJnBmoEEI8zUE3IADa4CIGAO30Ud0CaVDVLA==
X-Received: by 2002:a17:902:f785:b0:2c2:33a4:aaa2 with SMTP id d9443c01a7336-2c6bc25d4d0mr66746685ad.35.1781755295695;
        Wed, 17 Jun 2026 21:01:35 -0700 (PDT)
Received: from localhost ([103.170.55.134])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f2e52b5sm183091105ad.7.2026.06.17.21.01.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 21:01:35 -0700 (PDT)
From: Alfie Varghese <alfievarghese22@gmail.com>
To: johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org
Cc: greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: vibrator: return device_create() errors
Date: Thu, 18 Jun 2026 04:01:32 +0000
Message-ID: <20260618040132.436-1-alfievarghese22@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260528135111.2791-1-alfievarghese22@gmail.com>
References: <20260528135111.2791-1-alfievarghese22@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Gentle ping on this patch from May 28.

Apologies for the accidental duplicate send; a second copy went out
shortly after this one by mistake. This thread is the canonical one to
review.

Happy to resend or rework if anything is needed.
