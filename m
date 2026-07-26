Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36E883BED23
	for <linux-staging@lists.linux.dev>; Sun, 26 Jul 2026 23:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785108088; cv=none; b=e/mH1Ge2ttSUKh8Psdf2m5/7GfEnIvw/wMkpcEBKBV6Igr7gmPN0nO2UMM91tGSrrYoLehvGlPO2IaM8Tqxl8Sm8RvoF56yzKawF4vzX32DWRUy6tqW2ZWG0xLqL+vEzhYFNh7ht3KM26/gOcZJWDKH/+7adTokv6Td9+kK0+/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785108088; c=relaxed/simple;
	bh=Gb17aP3/TpMMJ4Ye+ZnazY7s0NWZl303YdUtRgNLY+4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZgWzeYnSCY83BUIel6HVpKQe22Ep7jCrycAncSXzdzYyvLjBDxKi7mkYrJ2/e+tPKgdQEB8sqVbRAw8ih5TscEF6flBypgdovqjnXx9C5GB6gm5PpUCTUBFnHxw78UnE5IRdI/FJiaS+TaGtpRxGPJlcren7F1jyQD4Tl4j5Tq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZQG7pA8U; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZQG7pA8U"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-38dc69c74b8so1740435a91.0
        for <linux-staging@lists.linux.dev>; Sun, 26 Jul 2026 16:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785108086; x=1785712886; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xAgDK7zS1OwpDXbv8KmwmhBSCp/R8mZRx6FqpLoqlG0=;
        b=ZQG7pA8U8On6bbZoQ2aWELyuSK0aR/D4v1VeSPKM1rmqGJmUXiLX8GNWcwC8+IhY9e
         Eh7CkLTbwJRCsqpmb0btX0hlpLDYyeH2Z65CebYvkfcCk6JVd7/NFjx9NkwujeGIKvoF
         cYdZG298qhE1YzFw1TVeLaFnC1O1O3OIK3pPvzqS5LavaJmJZs3GsuQEraju/gs3T+ol
         9b62fNYLwv1p0YhR8IF65c45MQqyQViXbDuaYYbYulbUdMdMZw4MviDwts4oRL7VXHT1
         HxITMvp3zB/NdI+c3GpZPNkE+n88OIDIHnpyygt5eaOXj0HUi9iTVT9jndRs99aFMDby
         pJ4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785108086; x=1785712886;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xAgDK7zS1OwpDXbv8KmwmhBSCp/R8mZRx6FqpLoqlG0=;
        b=TMU37RClfLBIwXNBsGXn4mC7aVAecDxisdwNgcOQEU6GuGZYLhhmYNSl8ILAfdrTmL
         QrE3srzKKo3Q8tTVN1+gO6ryo76eMEPXOG29NSskUVeebN+CRK4jzBKFIkv7t9r3CTud
         W7UDMIlNihGteK7jiraLNqVgnom18E/cV2BUmUX3IzW/O27eMZP3jt8FCsVNJRJAcFJf
         wetw7Vtf9ZQ0aOQKOeZ6jALXvFigQGwyga2pcV9EEn4HZ4b0SO/qT8/siVM6sSzyiNxr
         LAbwVDgspljCnNHWzrqqCo0CJPYIYEaeu8AfaAg+P1glE27rgPJG+QATXHftNBQNFum1
         Zt+g==
X-Gm-Message-State: AOJu0YxFAGu1CdhZ4m48Tr8JdmfkzUlnrSOzrDdoOYTt6m7OsaHL2MB3
	DmFEaWazz25TOaajTw43OCB6eDwT3Nj7NDi/EahfHX2sISOww0B7twpb
X-Gm-Gg: AR+sD11GohlruxSblhO2jtKeECEv/6nhODzbxY0snMNGT51oM0nMWXzd4vff8Gm6O2K
	PaZr5PifxPG6H4CILe6lw1s/Az95FY37a66Iz1C/cj6dkNp4V02Vu7kL50KuHKOsAZHzZcQP/U1
	TJhio8DgmMM/bC7CyGk5ZKLBzL9xz0cw6ZGraAVRGd2krpk+PYUzOWQORzgc6Mn2p2XZOut2AJU
	/j0ziYUPIWIk/PdjPeUAY/sIrF0gkpLf/GRhg8ysmobDuR6sQcQ+il2jV0Uds6wAZmwgu7Ligk4
	5TEzSOccbxkSUPmtuZrphQdif1VhqQ70DCPySa9nrzgXTNE/Z9U7XOpvbC3HL/sTr4BdZhqJWb3
	6Vflk/Gt1+WrJF2Jh/x5lIHDhSClgVu6dYbGJCx9ewHHQbOyHLhZMdTIaHsmAJZiwrF5qVSsF0L
	7VS3Ltcgkd4sUknf7XHTL9uCdtClo8x4LI9RQ7P/UsCA==
X-Received: by 2002:a17:90b:4cd2:b0:38e:85fb:71b9 with SMTP id 98e67ed59e1d1-38f293a17c1mr6531846a91.4.1785108086436;
        Sun, 26 Jul 2026 16:21:26 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:8008:5102:e09f:1b92:402a:b49d])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13e0f4a039asm20115997c88.9.2026.07.26.16.21.24
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 26 Jul 2026 16:21:26 -0700 (PDT)
From: Arnesh Banerjee <linkrinku13@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Arnesh Banerjee <linkrinku13@gmail.com>
Subject: [PATCH] staging: rtl8723bs: use !psta instead of comparison to NULL
Date: Mon, 27 Jul 2026 04:51:19 +0530
Message-ID: <20260726232119.6392-1-linkrinku13@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The psta pointer was compared against NULL using an explicit equality
check. The kernel coding style prefers testing a pointer directly, so
use !psta instead. This also silences a checkpatch CHECK:

  CHECK: Comparison to NULL could be written "!psta"

No functional change.

Signed-off-by: Arnesh Banerjee <linkrinku13@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index a443b3530..5a45092f9 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -4915,7 +4915,7 @@ void linked_status_chk(struct adapter *padapter)
 			if (pmlmeinfo->FW_sta_info[i].status == 1) {
 				psta = pmlmeinfo->FW_sta_info[i].psta;
 
-				if (psta == NULL)
+				if (!psta)
 					continue;
 
 				if (pmlmeinfo->FW_sta_info[i].rx_pkt == sta_rx_pkts(psta)) {
-- 
2.50.1 (Apple Git-155)

