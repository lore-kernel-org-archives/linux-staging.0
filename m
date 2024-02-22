Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D901345BE1
	for <linux-staging@lists.linux.dev>; Thu, 22 Feb 2024 11:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708601272; cv=none; b=isl86hQ664+NL2wLbezrykbKUzBxHUhfy9apwAXuCLbFiR9Kqe/Kg0SRUJnTa2MA6zduizaPnnqEJiMGlHdKQl4givyaWdeAlhbBbSqSXNOnsoMbrWb1ETncpBVp9m07Ur2pjqgdeImcTpQk17Qbp8wS5tfLLJeJQF/hy3CJJ9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708601272; c=relaxed/simple;
	bh=s1HPqz0qh7gqcih0FvEIaSC2XVzpCndQCg9E2w4lGCo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QboJrtb5IGFKOwqj0nk7UgHeao+fqUnSZihEY87l5OTKQQ3xMRi3zL0QFVhCBkzlmxSb8WgOvSJc3WjiuLdcjbClqHW+6ZYWRwr+d2EffWxEXNafkQiEzhAUGalY7N07QR0YCYwvkAgqz/I7XlGb4aH/Lu/Bdgt6UcDafq/q+kI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i3f7go8Q; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i3f7go8Q"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-512be9194b7so4813199e87.1
        for <linux-staging@lists.linux.dev>; Thu, 22 Feb 2024 03:27:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708601269; x=1709206069; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X1yfiraC5quW41p8ykFc76HAZ3CK1+m5zIrpNUz/QnU=;
        b=i3f7go8QQ+BLv3GgCVjrs0qdDIKK6oBrwAXHtLJgEmAda3u0/1hSv7hUthPuJKjVUM
         DfmjEQxk2e23QQumuwo1GpHorxMWGB0recmLi7Kr76Ml4ShqOX3YSiJT0YY2HcBx1K/j
         cW0zKx71daETSxHcjDURwXkPN++oV7K3Y4R6FJ6f0Q7Aga0bZWskhD2I8SDZsdEb0Dq/
         yuBHnvGs4BYScfhkzv4dcrVhWrJ6BfzxjMWtsA+wNozm9J/Pr3bXDxF9bGvpHxzF+XQT
         acV7z6kZcAwKuHukFisplQN7vUbEzJVzTZaiqsu9AjaFSu9dIRUEhXtIL34276umh34q
         E96g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708601269; x=1709206069;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X1yfiraC5quW41p8ykFc76HAZ3CK1+m5zIrpNUz/QnU=;
        b=TbKeOPRaJshAIDIqOPs4LrD13IHTkhnCq2V+Tu2tVNEEJyb+iApdhih6J++toCPVFg
         em6N4puwaVTJry9/u6bI/Q+TASqrw3Nltki88ankARsGuXVp8VYmFhnJqxY3zdQGD9zS
         9rXzpV82+LR5Ul8SFFeavBpmfuxmrpEFQfYoHuY27d0pVah7jDbOH3QiMLfUADfDQpm/
         dcZgcVef/hL5N7TDs6j4raMJ6PrEGJsRFPZ44pT3t1HHFQOL8kdOst3s2ob4YJ1XMj01
         Bdk/awK8fnwDBQTzL7ujHPl/2lq7Me4ueHZhc+8wN2KLg0qKAA6Os3gM2HlifjM0I2kh
         t+PQ==
X-Forwarded-Encrypted: i=1; AJvYcCWHPjGIKoqL01u/Tgdq54Z7GwjKCt9IkloaiTsgNup5VeQE8S5FA348fv15kJtUKOxEd5lkqZvri9mHNHGHD182ex7rl7ZbI2Kk3GCmXw==
X-Gm-Message-State: AOJu0YwgzeGdM8BiGccsKUBfmRcr9d+rjMsT6U+TErF5m9iivHbZgqqS
	UYc+k6nuidBUurPHAWL3mCTwSNRD6h9TsgZiHO265My6ZNDXN8zi
X-Google-Smtp-Source: AGHT+IFrKMGU8VcxleGYFQ5yPW1HF/YQBiC035CBr41JIguflFvvCIegKaQnpXPUAsLCmXFyOwNN8g==
X-Received: by 2002:ac2:5191:0:b0:512:ab73:d2d4 with SMTP id u17-20020ac25191000000b00512ab73d2d4mr7478165lfi.16.1708601268844;
        Thu, 22 Feb 2024 03:27:48 -0800 (PST)
Received: from localhost.localdomain ([95.90.186.51])
        by smtp.gmail.com with ESMTPSA id ck8-20020a0564021c0800b0056452477a5esm4338524edb.24.2024.02.22.03.27.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Feb 2024 03:27:48 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: philipp.g.hortmann@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 2/3] staging: rtl8192e: remove empty cases from switch statements
Date: Thu, 22 Feb 2024 12:27:22 +0100
Message-ID: <20240222112723.18428-3-straube.linux@gmail.com>
X-Mailer: git-send-email 2.43.1
In-Reply-To: <20240222112723.18428-1-straube.linux@gmail.com>
References: <20240222112723.18428-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rmove empty cases from switch statements to improve readability.
All of these empty cases are covered by a default case already.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/rtl_dm.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
index 57e1a361a7c9..4b622ad4c534 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
@@ -1725,7 +1725,6 @@ static void _rtl92e_dm_check_fsync(struct net_device *dev)
 				_rtl92e_dm_start_hw_fsync(dev);
 				priv->rtllib->fsync_state = HW_Fsync;
 				break;
-			case HW_Fsync:
 			default:
 				break;
 			}
@@ -1740,7 +1739,6 @@ static void _rtl92e_dm_check_fsync(struct net_device *dev)
 				_rtl92e_dm_start_sw_fsync(dev);
 				priv->rtllib->fsync_state = SW_Fsync;
 				break;
-			case SW_Fsync:
 			default:
 				break;
 			}
@@ -1760,7 +1758,6 @@ static void _rtl92e_dm_check_fsync(struct net_device *dev)
 			_rtl92e_dm_end_sw_fsync(dev);
 			priv->rtllib->fsync_state = Default_Fsync;
 			break;
-		case Default_Fsync:
 		default:
 			break;
 		}
-- 
2.43.1

