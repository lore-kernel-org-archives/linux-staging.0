Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24B67804
	for <linux-staging@lists.linux.dev>; Sun, 21 Jan 2024 20:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705867368; cv=none; b=n/bBVkt+5rEBUKlD2DkCFewndJggVez1uu74B21Kq8JkiCio9RorvRTnOIMn69kOHpxMiPQmMnym3M1qaKekYxDev6Q4VPgNxf4w6/3oFJKT6e2k9ZnyWlh/Ps0P3m9+0FW10w2yw7Uh6MHn/T5FKqzxZrNKKpdSS/hTc/KF3TE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705867368; c=relaxed/simple;
	bh=CFba6yBxMqahDhxXXbyJrpczbPpZcSOe7fz27cRHjRs=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gzkgKlayuqwt6o06LlkKp4c6eym0cHk/JDCwBQKQcSZg75j5Sr+oBMLJA40mVWhiHtFnf58oIVGM7/oY8vgZ0Yv9/SZefKIV3YlhKzVNsUd28dHlWrPNoKaYArCsk1eS8RQvkmN9vf7B4jRrECeAkrSV+f0wwVlGLKvgY3nI4J4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FOkZMySj; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FOkZMySj"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-6d9f94b9186so2581089b3a.0
        for <linux-staging@lists.linux.dev>; Sun, 21 Jan 2024 12:02:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705867366; x=1706472166; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Y3EbBfiXII+xqP/XocniUaecVX4i3H4jifFCHOQtVck=;
        b=FOkZMySjDAe+qh7IYvSCMOBLCiw/e5D3D0kwv46VVcyeD6lbYnrh7ROYAIGh+xeBVM
         GPcLRWCq29ytIcReL7lvsWfJFOIU7l/hclX7p1Kd82gBSqrdavCi/8F7VRmSlPatDB/i
         ATzG1dfc8KLUY2h6jztm+Ez1Ym+UihNtgMzmZv+8oQM/ZoncuBwMm/026apu8EZeqs14
         9vcv1YyRIh0kq5P9K00mvhshD717BYD6KCtGWE3YF4rPd82O6CU6DmONu3CNPDCRKn2B
         K9rwUl5ICkHohBOGqlN+AgBZaTM/M1+ss1wBvN+74JGVFNI136SfukcZop7iF8ZkVkz8
         qbxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705867366; x=1706472166;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y3EbBfiXII+xqP/XocniUaecVX4i3H4jifFCHOQtVck=;
        b=qgYyJeoMqyAtaywQMsTO4soGU4CWIFF0pD/ajhKY0i6SZtdEL/pVT5Fn/vD+rrR3Ou
         dNWpFIl8DcXD3yCdInUeLtRnIYH0AlAw0fXmU2pmsUd8cJbLvdx7Fj2mu20z60KGYmRn
         YCuqhAPMzSb8DCGYfOL0dWGSdBod5x8jfHaO+j2B7wu2dWbFl7MKYKo+poilF/1lqLmm
         FNAOW0j7Smjxwm5CYMln1zu4CZxC3rmlxX8wEQno/SkT0sIHRHJgGe+slqmKLVScJWw+
         JJnEZnka/y14WwwGFjX1xYqCnOteNFMPZ/G46vCIHWSqmWlMY29ZDx9pi8RbH9c4mdQf
         8+HQ==
X-Gm-Message-State: AOJu0YyMwSfIVhGCzikZuMPRYT099Wz7lHu7ZtAb679oLKiF+A/gscZY
	ku2bBcQnyXbEMjBdzP9+Od1Et5cwMuMaXRAlxfDh5O/DHjHrAoUB
X-Google-Smtp-Source: AGHT+IFdtrMbzWPbQnjpvHP4970k0kKC5wNaRS4euLbx5//Aa0H7bgVlbkeHLrklgXgomXKKmm1jzg==
X-Received: by 2002:aa7:99ca:0:b0:6d9:44fc:f7c1 with SMTP id v10-20020aa799ca000000b006d944fcf7c1mr5079945pfi.28.1705867366474;
        Sun, 21 Jan 2024 12:02:46 -0800 (PST)
Received: from LAPTOP-7VGLEE77 (19.216.252.27.dyn.cust.vf.net.nz. [27.252.216.19])
        by smtp.gmail.com with ESMTPSA id c20-20020aa781d4000000b006d9a6a9992dsm8377265pfn.123.2024.01.21.12.02.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jan 2024 12:02:46 -0800 (PST)
Date: Mon, 22 Jan 2024 09:01:27 +1300
From: Hoorad Farrokh <hourrad.f@gmail.com>
To: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: rtl8723bs: remove unnecessary braces in while loop
Message-ID: <4ii7ptqhz7ion46dczabnevuj7tjfv4iofvzedms6tvfgsfu2e@6rvcsdyodny2>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Fixed a linux coding style.

Reported by checkpath:

WARNING: braces {} are not necessary for single statement blocks

Signed-off-by: Hoorad Farrokh <hourrad.f@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_sta_mgt.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c b/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c
index 1593980d2c6a..0145c4da5ac0 100644
--- a/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c
+++ b/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c
@@ -127,9 +127,8 @@ void kfree_all_stainfo(struct sta_priv *pstapriv)
 	phead = get_list_head(&pstapriv->free_sta_queue);
 	plist = get_next(phead);
 
-	while (phead != plist) {
+	while (phead != plist)
 		plist = get_next(plist);
-	}
 
 	spin_unlock_bh(&pstapriv->sta_hash_lock);
 }
-- 
2.42.0

