Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F9BF35DA6F
	for <linux-staging@lists.linux.dev>; Mon,  4 May 2026 09:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777886478; cv=none; b=MQ+IWBqQ//I4/0T/9qXY/N8XnAgR50TWRuT4s3U6kaOhfdtD0X4jyS4nRPL8tr/A9wj8MWhNPJ6QlldL6w8H3wa8chaYjpAJ9BFM0FAnjCYapSGrxwZx5IOiZrxRsgDxSND1UKLEorrk1MZI2l1c4sl3W9pc7OpeeAFZCZU7dcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777886478; c=relaxed/simple;
	bh=uCtvUv4bxEywi3tg4tIQ/iZN1R/dih7qyJa/FT2wfkg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YKwUVRDp7AvhfZBQpflbfgAvaUJweMFiUf28TEXUjlFZXkv4lGpYdrGj9ZEizC/am661sNFw5iOt42QhLq2reuxEyovvVH3WqbRqnp2MXTjSY3XJ0t1zkUlBrnNT4/InNTfTCjOdjU7QdGRxySWJeNRSPfiWM+bbx4kwpWvYaPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W+nZP+di; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W+nZP+di"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-82418b0178cso1803238b3a.1
        for <linux-staging@lists.linux.dev>; Mon, 04 May 2026 02:21:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777886477; x=1778491277; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZcAeOLR7xmJOHuEzHLeDXQ/7X479DK/0Yz3LFZ7fIeo=;
        b=W+nZP+diNTOAASDUCT7pVBE7gCM9ocd+prrMg3+stpvCWq70X4oFNkSyBTM7aaNK/z
         a5sUnO0xFEi25C2f+Lh2X+02gTgEkTCeAiRRYcdK2DIG4a/Cy8QIJn9SSFN+3Y7+pGlv
         SQ2Fjy9AHLbumHNBzzjB00DkbZZ6+HOTqGzSWsSr1iCmuiWldJ668mz9tFLtY/kh4K7s
         TjxM78RbYA/G4ec8RlZGRCusZHYH0ZWiXnQQT0ysOctBFI1D0Mr0Q1izMeIeIbFDbPy2
         Ar69DOBsO+WvnXGSehxiGsM9Gk+FLEA82rU/aed/2rvokbfOXX9hMXPQExkRzAV8utLk
         GX2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777886477; x=1778491277;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZcAeOLR7xmJOHuEzHLeDXQ/7X479DK/0Yz3LFZ7fIeo=;
        b=VvH9GMR7wN4OAmzITxlkiJTMjd2ahSYNGfsL+A3CFsF3v86zvkyFzPOVCisaMn7LDM
         IHmmy9L4fz/PkwxIeBhTx1bGsSR08cewoJW30qZi1R6BZAfaF1XEa8InkC886M5hIlxQ
         rCo32ku+SsYmSftrLUQ/swfU/NpCz9rDAUQUsAZ8YfLqMrqvNKgriUNj4342hUil7QSt
         7OClcgBc3kV+ybSbmJJpp8U65XrzNXGwN5VW1QnrT+iQqK7p7qHFEEbQyoGsLXuGmsVM
         SOpm8HjtZzkitRk0Mqmz+2v/E7QxJrcSinQ+QQCTFC3v8b1kAiN53XD5ZvZSKGnUFPJ2
         WYcg==
X-Gm-Message-State: AOJu0YxOL9+CQpzD8zTCDckzkJ3VJIfKWvQ/y9Tm9fvd6v8YqGYVgX3b
	IBFGe+FrVvROUWRmuRsAfs8InGqc4K/1e/BYF9TmfDmBgGEdqDR9oXHZsbXgdFGqIxM=
X-Gm-Gg: AeBDieu5J1FyscBbGIWqmyMCAYR3k0CawAUQIHTlEHBTGPTXWb5Wjj/S6z1VeVvDdvv
	TUAegVW9XtxdFVzGJM2Xa2JGn1fvyEPGtUDsOraXBy9xYbAvmST6+SCR4GBAb0bijuFFcEo6MDX
	0FFpWhVG3hmjHv8hpqLyKw40wWbETIUysWG5FPbFlgIxgnjHIcqAIfP05VvEM6TWJviXCqyVk6m
	en1+S1tjM1N2VGTyXXxX3lxOXUnt0qwqBViYGZo8Cq9Da+vjJOWpKUEd2fudnbQDvV42/pJ/PJz
	oRfJ1gYFowZDTBuHs9/41+QKVAxnvZIoNilSWnYRUEtQHthy0XRwYOJtsTTJGCxuaBJYx+HUyOc
	2d0dSgwC/4LM5TUZvz/nBtG1TiNK8Y+LYbqzM3N6V1aOg4mHisQ4/3JC53GFTzVdV4+fsmVaPm3
	h64aMFYSJqaUVw8utihIMVPAwheVYvAg==
X-Received: by 2002:a05:6a20:3949:b0:3a0:aee6:acc3 with SMTP id adf61e73a8af0-3a7f1c24df4mr9623065637.38.1777886476890;
        Mon, 04 May 2026 02:21:16 -0700 (PDT)
Received: from scootaloo ([101.179.98.31])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c802545908esm4163923a12.27.2026.05.04.02.21.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 02:21:16 -0700 (PDT)
From: Angus Gardner <angusg778@gmail.com>
To: linux-iio@vger.kernel.org
Cc: linux-staging@lists.linux.dev,
	gregkh@linuxfoundation.org,
	jic23@kernel.org,
	lars@metafoo.de,
	Michael.Hennerich@analog.com
Subject: [PATCH 3/3] staging: iio: ad9834: fix chip name typo in comments
Date: Mon,  4 May 2026 19:20:59 +1000
Message-ID: <20260504092059.1536094-4-angusg778@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260504092059.1536094-1-angusg778@gmail.com>
References: <20260504092059.1536094-1-angusg778@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Two comments incorrectly refer to 'AD9843' instead of 'AD9834'.
Fix the copy-paste typo.

Signed-off-by: Angus Gardner <angusg778@gmail.com>
---
 drivers/staging/iio/frequency/ad9834.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/iio/frequency/ad9834.c b/drivers/staging/iio/frequency/ad9834.c
index 0e4727fb8cde..a27c03387526 100644
--- a/drivers/staging/iio/frequency/ad9834.c
+++ b/drivers/staging/iio/frequency/ad9834.c
@@ -164,7 +164,7 @@ static ssize_t ad9834_write(struct device *dev,
 		break;
 	case AD9834_OPBITEN:
 		if (st->control & AD9834_MODE) {
-			ret = -EINVAL;  /* AD9843 reserved mode */
+			ret = -EINVAL;  /* AD9834 reserved mode */
 			break;
 		}
 
@@ -239,7 +239,7 @@ static ssize_t ad9834_store_wavetype(struct device *dev,
 				st->control &= ~AD9834_OPBITEN;
 				st->control |= AD9834_MODE;
 			} else if (st->control & AD9834_OPBITEN) {
-				ret = -EINVAL;	/* AD9843 reserved mode */
+				ret = -EINVAL;	/* AD9834 reserved mode */
 			} else {
 				st->control |= AD9834_MODE;
 			}
-- 
2.51.0

