Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A4092E1745
	for <linux-staging@lists.linux.dev>; Wed, 30 Jul 2025 18:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753900986; cv=none; b=FFakvX+zQ4ZahU43JrKDTbas5D06bk27FEr7GJQUditExxZLcEr+ElF2hl+p/b1lmrF+5CkCJxQrGy+MOdXUesz03opQCjo02K2XriPWn2HE3QcCzc/qlogqaq5J2VRwRj6MYL2xOoSOon/iN2Ui/tbBVBODaXPoSHyB/zPgXAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753900986; c=relaxed/simple;
	bh=q12LXBzQtE5vNm2i/WY7kOjnYF8AThpIfB96tzBkLf4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=D4wkA9BYN7vi6D1gpKouHrh/G5pRpBBdqkOyw81YjY6Akt+EtY3P7eS3cbtqwtET+7JSwbQZhjssQytM9cj6au/5x/f1/8cZd5nyILSh2A1YBMY/V7n/1qh3+YequSF+i113Etz3hyMdTW3ZT1nC/OOk+3K9eLdodIn6k8VT7p4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KY69cOZg; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KY69cOZg"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-70744318bb3so986056d6.3
        for <linux-staging@lists.linux.dev>; Wed, 30 Jul 2025 11:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753900984; x=1754505784; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DWLv1kUgn6SKLcyh8VLUuc6r9Cuh/UEKenIns7AFq3U=;
        b=KY69cOZg0OnNiO5VqRNQtRYebtV8iacsjS7PlQ0q56wKTAlNQJFrTccrZNTUAyevKc
         1I5Ua0yvvz0oTeidk6R587ykicJEvncM1TZAWpc9nOWAbPJtWuROax/RKfs7Y6wmPCZ+
         msPUmtZc9/UUmPUPAiVMeOb2t9LNmgNBt5glJ+qpGiQ7yJau8RlhZX99eoOgKc7e6LZR
         k2MnFSlK+1FQI5BBSGeyo4RbmgKyjbTDhxhb4D/zW723BIt/pDWAnGjIunh4iLAF1tjC
         /RWkJzJmscZl7KZKI9/hgcMdJcwCKj7EPEWWizuZmkd6651xXCJ6xzwceyGfrUOMe9Bl
         jqXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753900984; x=1754505784;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DWLv1kUgn6SKLcyh8VLUuc6r9Cuh/UEKenIns7AFq3U=;
        b=tTPwXaZZs9TEEpSnAp72ZiTR7ysHjTgZYYnteJ4Lz9M5Va5Ngajf9lh7YGpOEd+Pij
         vmM14W6s5oogRfx8olZ00AwY2qsHO/SZmnmQRZUMyoYCmJGekcCBDgIkPmYGADeeB7l8
         JOBgsxh9WO9IevK3xwuK9lCzoGcVXPvGta8iDYCcHZKLbjsG3TiUgYqu8SsH9EijiUgh
         dvAvJoL7j0Udc+Rx8XfAWLDSlYn1TrqVG5jlqTnafOgWN07ywGZiiOZgBlT1g10m0WnA
         HeKJsZm12jo42kv8JtxQ9RlqWEEorGtCGdHdWBkWFDKiAX2KTJWzFmtrbFAe5d4U6DDr
         BMog==
X-Forwarded-Encrypted: i=1; AJvYcCUax/gW9BLZ5/U45/grbwaZPwPgfC3+z15ouade+ftUjESoq1cA1zvLnBM8OG5ENYOyoVVGKU/lWOV8hZ8x@lists.linux.dev
X-Gm-Message-State: AOJu0YxRDyCfD/3IREH24q2KYwZ335/l0f4Q2qDzUwRDuwG9I2q7Jv+T
	MKeXhcztUuTEmP8kpeVsJN1z7Xmaqfy+TOG8f6omrFEpZvK3vEDGckt+VDKIO8wW
X-Gm-Gg: ASbGncuQ/ykRaeiga3mWgFlCvCVFoNZ/IVM8Z0izaJKV3y3xuJeRfyqh12rG3kyq2y8
	PhRXryc6VZqQ/uqe3+NC8mOw8bkECDa7W33yChv5sjGhWio8hhSmxnbktrnjwg4knmAcVp9Wroa
	FJKMvR6l+5w4G1bwer1q15HLBe13k/LnxKryKST3bN7I/FeUNrOe296jvD1YFNMJ7txyhRVDjJv
	ToXQ3LQX8DjwbgBCzxcWVlL30h2xuyWUh0sjesUw9Gqv/wJ+Knso8aw8mUww8YbMl/xboRJHBc+
	j/GdFYztr77cKH8Bc5K2ocURRX07RADemWEorggKnSwok0SZWPQyRpYQe8d4i6lFip5IcpUmxaD
	gu+bUkhwTqquT7fb0m/cr3y3tlx7OHcjJCPNmj+a4qYGPvB0HpI4=
X-Google-Smtp-Source: AGHT+IG0Q+uHzcHzb8w7sy5BFJOOfLtV6durLh/Jmsb1pc3QIRNateAySU72crVn0OEXtmQw6mUCng==
X-Received: by 2002:ad4:5f4d:0:b0:707:7be:2f5e with SMTP id 6a1803df08f44-7076722f948mr54361546d6.44.1753900983913;
        Wed, 30 Jul 2025 11:43:03 -0700 (PDT)
Received: from linux-kernel-dev-start.. ([159.203.26.228])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70729ad99d0sm64498186d6.46.2025.07.30.11.43.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Jul 2025 11:43:03 -0700 (PDT)
From: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Markus.Elfring@web.de,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	vivek.balachandhar@gmail.com
Subject: [PATCH v4 14/20] staging: rtl8723bs: remove unnecessary parentheses in conditional
Date: Wed, 30 Jul 2025 18:42:39 +0000
Message-Id: <20250730184239.500199-1-vivek.balachandhar@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250730080323.491138-1-vivek.balachandhar@gmail.com>
References: <20250730080323.491138-1-vivek.balachandhar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Remove redundant parentheses from the check_fwstate() call in an if-condition.

These parentheses are not required and violate the kernel coding style.
Dropping them simplifies the expression without changing its logic.

Signed-off-by: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
---
v4:
- Reword the commit message to clarify location and purpose of removed parentheses
- Use imperative mood as recommended
- Remove ambiguous phrase “around the function call”

v3:
- Improved explanation of why the parentheses were removed as per
  Markus Elfring's suggestion.

v2:
- Mentioned the wrong version number in the previous patch.

v1:
- Fixed incorrect wording: the change was not around assignment
- Addressed feedback from Markus Elfring.
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index b8d72d28178b..7552f7e4d14a 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -699,7 +699,7 @@ void rtw_surveydone_event_callback(struct adapter	*adapter, u8 *pbuf)
 	rtw_set_signal_stat_timer(&adapter->recvpriv);
 
 	if (pmlmepriv->to_join) {
-		if ((check_fwstate(pmlmepriv, WIFI_ADHOC_STATE) == true)) {
+		if (check_fwstate(pmlmepriv, WIFI_ADHOC_STATE) == true) {
 			if (check_fwstate(pmlmepriv, _FW_LINKED) == false) {
 				set_fwstate(pmlmepriv, _FW_UNDER_LINKING);
 
-- 
2.39.5

