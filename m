Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1E432E62C0
	for <linux-staging@lists.linux.dev>; Sun,  1 Mar 2026 22:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772404274; cv=none; b=PDh1MXWxCHZ39Z16Viyr/Q/Oz0Ky3/ldsgRvp4iSV/3AL76Ho2quWqSjExYrxEhO8ccBIwxSO60MjZtUTs68hA0nfAEHb3VQ+AxCQSHkxPNsrJnOMdQusNc2iANql48/9745ZapthiZV78OskUwHzMBsJtqHjsRrWeOySo0bNOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772404274; c=relaxed/simple;
	bh=W4c/RXACKX1jHr9bJjsr+w4HrkxRmjTR+oPdzT46pVg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=On0VaN490nZEXhF890q7UQMvpChYvHxC9RBsEcn0jOkKhpkUBeHYQzoxsguk4KG8eVF9Tf3mI0a95+82pBkz7f9GOdT5BO6VVuiLvgH9AKszadYqlvxWCWMJv8aDmBYvbdHr/gFk5TLXRVz8xRIfxhzc42y9vctANeYYYg+L4IM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fhimJKzr; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fhimJKzr"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-389e139ee5eso58343311fa.0
        for <linux-staging@lists.linux.dev>; Sun, 01 Mar 2026 14:31:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772404272; x=1773009072; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zKMx/xZCiCudfP4Yqf9EkavRqjzsW5f9YLVYfmiQHxs=;
        b=fhimJKzrXHmKhH9Yc1+1FU9IGLv8IYjAsjBo4uWxrDaYED0WsrtJMrdFkTzNHt2m89
         PJTxd6ZvFGKHhI+NmdD3rGWCLH7EqHYh/3ZpnFPAioVDncH+Sq0MHOru/T90dSi7LjC5
         5JbOF4+67NkfetpHAFQmVz9OHf7E0LEOdmp5XGUSUZgkrA7mW4D06AFg8jl8z3ISUDpg
         dLJpYWfXr454Kr8Dqmo1KVK7uRBO2FzNoN6e9F8SmnqOecIG4NSD+MYRiWzg0UM7PIIU
         p8d/aaL/rvoRHI5xTAiMSAa5C2rFBKheDSCSXjbnUEPBB3Osml6QpjURIHAMNLxV/iZ6
         pS4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772404272; x=1773009072;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zKMx/xZCiCudfP4Yqf9EkavRqjzsW5f9YLVYfmiQHxs=;
        b=Wp5Qij0UXSdWslm7w1Xs8BySauFnolpEF71+WPjmWNFNtPuKuyxm+DRT8ndYbBkK9a
         SHdvGdzKnnKmH9udzBV0d8JKF18+mVV33iD/RVAt1LfQmQNDbnkNNP9kqGGrVV8xshiy
         qFRCidgZ8CJeTaBXjJwmxQN1u+2PcKm1xBmNUGH7PdggcO4/i8UdrU+YXD4/mtoc4vNz
         rNowxDoj2hU9bH7eERs/m83xc9BTo5uk1ft9WIT27d5TWxu/SvJ901EajMEzl7cRMaRJ
         nkquhjI3FRMT/OWCGJKhtOfSX3Rn3Pflc0lnHvAx3DYeCgjcg3SRDIjAl2KtUPJVZf44
         Sv4g==
X-Gm-Message-State: AOJu0YwCpaw9rEc7aavE/vSy28th9CsoV0JF5DGkRAT/2BxyIejKXZQN
	YCepY9ZE0bfrO8a86fssNlIL0WXTIsXLbNWM3PCPkxBbPOHgSEGWc5Hv
X-Gm-Gg: ATEYQzxxM3eBDv8+YCd/87DzrBkwxV6Cnu15tzr6CMpOS+xQFQ9RlhrZZy6eXAS0Sb3
	SzzX3/+mTlMXhi0QpZPy430uFTslnBl+5V6g1uf5dWxRVoIci859WnQTpYIe4oX/viIzWm+TRDJ
	N8rEBSxJlMUJETqfHQUNHMiyx5K/MgZsSfkTJVuGuaceeNy0XmkleX3yx5h5J3ke0dXsVL8Y8Pc
	ylMXbfCCwDB6S1jGnC8fpag3yjjGH3moZX3FRwJByONyg+Os6EGXpZzZXa9J7QQe8Eo3ThVwhc7
	06r61FGnrLDaPQQFx3hfz3leiWXUtrTOvX2l5qgH4aWvwDdEpvVy5NRcXbKZxnvozdhAGKiI+g9
	DQxQKDBHD/YUgvdP19Xdbm+2z2FVuYYeYIrsAB/xrJ3fJLwOj9fhqPMPScFMRnt26pB/S+GFNRE
	Xc8g9N7HRcMSKbiD5PFp7X0FcELvpzftIs9lH5KiO2eIVKtiIephlIEyrJad8gwZms//r+hE+Oo
	g==
X-Received: by 2002:a2e:9610:0:b0:37a:45b0:467a with SMTP id 38308e7fff4ca-389ff116e40mr51883051fa.5.1772404271598;
        Sun, 01 Mar 2026 14:31:11 -0800 (PST)
Received: from T6NXCV08J99224A.lan (81-237-238-191-no600.tbcn.telia.com. [81.237.238.191])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-389f2ffe01fsm24634001fa.26.2026.03.01.14.31.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 14:31:11 -0800 (PST)
From: Oskar Ray-Frayssinet <rayfraytech@gmail.com>
To: hansg@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-media@vger.kernel.org,
	Oskar Ray-Frayssinet <rayfraytech@gmail.com>
Subject: [PATCH v2] staging: atomisp: remove unnecessary else after return in atomisp_cmd.c
Date: Sun,  1 Mar 2026 23:30:38 +0100
Message-ID: <20260301223038.5103-1-rayfraytech@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unnecessary else clause after return statement as the else
branch is not needed when the if branch always returns.

Signed-off-by: Oskar Ray-Frayssinet <rayfraytech@gmail.com>
---
Changes in v2:
- Fix typo 'alsways' -> 'always' in commit message
- Add blank line after return statement

 drivers/staging/media/atomisp/pci/atomisp_cmd.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index 9d22ec27ea76..088aea327b9e 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -2035,8 +2035,8 @@ static unsigned int long copy_from_compatible(void *to, const void *from,
 {
 	if (from_user)
 		return copy_from_user(to, (void __user *)from, n);
-	else
-		memcpy(to, from, n);
+
+	memcpy(to, from, n);
 	return 0;
 }
 
-- 
2.43.0

