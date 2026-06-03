Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5CFA3DB317
	for <linux-staging@lists.linux.dev>; Wed,  3 Jun 2026 18:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780511190; cv=none; b=f5onvEttAEnwiw55P5dlrRbOPG4/KkPXnWfgqIz+jaDpGbMHGHPnZrH76OwWWShEQgQp0HvHMPLaushHpuRdBfsxAiZgkSKsAOGyxAV7ZIkmrXBr7LULlPtsZasX8vzgDNVmzQgz28lScj18mm1EGVvTHfjeya1aau08rAWkx+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780511190; c=relaxed/simple;
	bh=uj16waT2A/pBCpj+dzmCZGnzfpU8sWlGw7sXHlQkwy4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CK7I0bDkRA+XHYf/WrdFRrheBPMhuy9WdEGmNftYV43MHLq3BRJCCFOeDdshoYY5vaRgcVmb1yZB8Cw4q1Eui6BMByehl2pybMUz2Wi2SW9Jnp/uN6Qsg2MXfx3eKlp5gCZHquC0GT8hv/AqblR6N2+Wi7BWPii+zSZUaompMy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YDHOtux6; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YDHOtux6"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-bec49f7e35eso549150866b.2
        for <linux-staging@lists.linux.dev>; Wed, 03 Jun 2026 11:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780511186; x=1781115986; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MkB2tSnG31sRzxEiyVkgYDP5NruBR02yMgRkO0e9qVQ=;
        b=YDHOtux67Q9/fkJnhTJVUINXUF/RS7T1Uz2Bm0i1uMPa6266kDVUgGUYQ1C4TnRJ7G
         Z5Bg1cLyJFiobhENrKZsYiTWP1EKc+7oMN3ZbcsHugZBOV2yb9FZugKkngVgW6rjtk/0
         FVHy/SVhmk7tnw3ba77xsUhKhxuBRxrDqupwHLQEYMV0fjLR8F+jrEFEBlXLruSlxXI2
         JK61djAVejgHkbO1UzZ3KZ7yOpvS5p++x0inUUxhKF1RiyOBo7vYYrMFZkCF8cWknG9l
         hY5JOxNFfArRBN0mgSL3YKG3tBZFRHYf9Zlse7G+8J/k6+A6ED67IkiBuNH2GX/J88hx
         auLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780511186; x=1781115986;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MkB2tSnG31sRzxEiyVkgYDP5NruBR02yMgRkO0e9qVQ=;
        b=gW21jQV5sLPm5Z6Rv1MHEdfCxYrVztmHTNg8dqeFBGXS9KoAegpZH+Pa+aojg3ujPE
         8YCv3+LdQbh9uqmg2u2yeuOvYWXKyo8Od18jzNCzLL930p8dOj6ZpOM1/0EDhSlGi9N0
         7/+0BPgIERgsvDmuG/OeyyJKsnWcD06v9WrfTLTuwCceWipLMFliF7Sxt3hJx8ynLXMW
         yhmTYWii4ATui4iCwC1d79KbqqXvrkfsQ/UmtarN9NFZPMIy5dieQ+HHeRDJmWV1cKq7
         fufM9O+k05hPeS6pKJUs8QYblzFu61dAx77o50/twUkMO1eHqrcDfTCC9V9+FImPn+1f
         cAeA==
X-Gm-Message-State: AOJu0YwgBSLirLMwUG1ApKNw8EmzqJ66EOod53PjLg+Swu6KNmq4dC4F
	SVpt/i8kG+2ZeyLKRTOCizvKnWQ7+OXtvAABw5cd2+znu2vnRZbXyRyP
X-Gm-Gg: Acq92OG4BDBVnBwGn4DitMzysTY3CR3MHg/oU36qzcT8ZTR2DSSMxBzXQ8d11IISmjU
	s8OmGxBXg15k42lP6eWeRqYqwG5zPdW2NvHawoIQgKXuiqS8sMGwWkBw7fqPnF09deOvgkIbKMV
	m9wRo2M75Iu8V3AHuiAm/+T2v9mIahZ7Cy6MhS0myi+CczojVys/+xAnADDESBgs63OyrPJPgzn
	QPhniBKgRSAWgvxfq4eTr4YdXw8biSiWfNqjZxOYHC3a/u/wC9d0VtFY9tcoUdBDfhe6oR27N4h
	3uj0beohk4g4aO8pPg/KYqlVzqbw95BNOqKCEM0HwpETYn6Bsby/f62emEmYMnCWtvRAxzDo/+w
	bQlikASyHa+wGC1QT0YThW9x/gZwMWW6aRyRHHrr9TXgPRlwhMhn4vgRuTZKeGEhqMcyHMxi6vV
	2G2sAVwNs4ugqRxukaWOW7EoDQWVkHreQ=
X-Received: by 2002:a17:907:9446:b0:bee:4562:32fa with SMTP id a640c23a62f3a-bf0acb15e27mr262288866b.14.1780511185791;
        Wed, 03 Jun 2026 11:26:25 -0700 (PDT)
Received: from EyeOfGod ([103.10.28.163])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf0559f1f97sm212927666b.60.2026.06.03.11.26.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 11:26:25 -0700 (PDT)
From: Parsal Baral <parsalbaral@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Parsal Baral <parsalbaral@gmail.com>
Subject: [PATCH] staging: rtl8723bs: Use PTR_ALIGN for rsp_buf alignment
Date: Thu,  4 Jun 2026 00:11:02 +0545
Message-ID: <20260603182602.658589-1-parsalbaral@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace manual pointer alignment calculation with the standard PTR_ALIGN
macro for rsp_buf in rtw_init_cmd_priv()

Follows modernization of cmd_buf alignment in commit 69dc48dc5506
("staging: rtl8723bs: use PTR_ALIGN for buffer alignment")

Compile-tested only

Signed-off-by: Parsal Baral <parsalbaral@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_cmd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index c1185c25e..38ce3156c 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -184,7 +184,7 @@ int rtw_init_cmd_priv(struct	cmd_priv *pcmdpriv)
 		return -ENOMEM;
 	}
 
-	pcmdpriv->rsp_buf = pcmdpriv->rsp_allocated_buf + 4 - ((SIZE_PTR)(pcmdpriv->rsp_allocated_buf) & 3);
+	pcmdpriv->rsp_buf = PTR_ALIGN(pcmdpriv->rsp_allocated_buf, 4);
 
 	pcmdpriv->cmd_issued_cnt = 0;
 	pcmdpriv->cmd_done_cnt = 0;
-- 
2.54.0

