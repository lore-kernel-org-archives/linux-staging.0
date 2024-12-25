Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EACAB101EE
	for <linux-staging@lists.linux.dev>; Wed, 25 Dec 2024 05:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735103891; cv=none; b=qJZkCQ+IbWFyLI8ZqpBWezXjUsoVDp/PD71jxLiJl6t+YDiD1lT1Kd18lfg9i0EAT6VLgTB/moRxirPj41IoBFJatKI084sUXzieYcMi+XgUrX/B7UvnJrnWi6AxnyZaaJ123s+KUKHmh+GAot7aSUHdkJPtV/NyvHtzG6mkHLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735103891; c=relaxed/simple;
	bh=So07i7TsRc8MZo97SNl3OBIKdmzGjmYOs15PooVy7f0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=pte9UXZVqPhTJxOnjHXhlgfK2ISD3C9HodgeqPBb+oomin9YGxcCwVk7VSHkuV1Vp7RsfedoQ136f0H/Klp1MdO79lgzbLzu0f2oiVCgvxrfxcYtOe4GKzSDC4QJE/2EBr8zI3lz7axm6oIC1Dh1y3Y4Jfi3BuA02LTKDHDbbbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FNdBg886; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FNdBg886"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2166651f752so67011425ad.3
        for <linux-staging@lists.linux.dev>; Tue, 24 Dec 2024 21:18:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735103889; x=1735708689; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hhd15APbcYRqWh+wXaifbceYc7BmeJiVjQiC8yBJW2Y=;
        b=FNdBg886DtQgct/glpSmuNX8TT+LnY2HAh4mHhu65jK40gBXk/fUZgVWiS0oBdLPxb
         EkvQQUEZJidhpyHa+S8wiywHtKZMLEX9tSc8/6DIcZifiHzww6yGWPum68P0WsZ+UQDf
         f+fNYnhdDcD0L3eIVL4j0a6kU9z+NwYBK2yQLh33qlZ1TrD5fLcDWeQ7KIQC4m2hIeNt
         sp3+84x1KIdL4vzW84rIwbXQPb6SprSU4+nzfwZ/dSj1bBzczz/dacdghe3hhl+gXrhB
         /KDYzfeVcvrL+fScY2Z0zSJQ0IWFeMGmIq0Urck/lsMdJXAKtG4airZWzU2Pz/onNkx8
         P4Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735103889; x=1735708689;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hhd15APbcYRqWh+wXaifbceYc7BmeJiVjQiC8yBJW2Y=;
        b=f2KxN34f4CYsDcxLOKUrMfJ+BkWYzCgWjgmNkYNj/jePhUVNJ+tCziY4TidClz7Arp
         15uQslzBlwtb7NjnF2gFtGY+Kk0e1ICvQodlFE/T7KGd5MB7nDX3MBD3y9ml9Oxoy3zM
         NeU7t0fCgfOdpvNjRnRRI6sFl7kixK18aSSP3wGFkcsC0IW26FmoKJ1TJAhK6lNIIcN+
         Bcftda70ccICT1p+OOuCmPmiTmGESJM3myN6VK+/VXvwkW0UQSlsz4Dvp9huiX7uL2cb
         G5ENefXHlYVCHegE53VefxSLLvVhTlbI6DdxlPoBuUEqdm98WIrlla//QLjlDoZZ6r4Y
         nUMA==
X-Forwarded-Encrypted: i=1; AJvYcCWgO2RbUrqOZzeVw9yi4s2xiQtClPsxT+A48YaV0LO3hxIuBF7fSyZT69kPRS20Ct5xv0Nh1bDjINv231Bo@lists.linux.dev
X-Gm-Message-State: AOJu0Ywnu4Tk1uGH/B8baCUBDHjAXn+5gEVZWoFqDZM3eozvSTM2uzbK
	NMHkL/Qwd7GQiAWUuan/6LXFB09BxF8n3vp2pUPonDaMYC4oJ1Fb
X-Gm-Gg: ASbGnct+HrPXRpY+0Odn8AxVZlZqjwtVD3diVUEhnXyYr+cYZwJgN0v0WGyx3dfRLwq
	FZqFyhSwY9U06j3Rfnf4XVk1cNI1QuQrTagUoi0+n8WkhhqNkVg2rZ34bTeyV1XY6X7AvB8RjCn
	G/E4mnZIpeJkPKFRqm/cWkG1M2/+cw0i4DDK3pE1s8p22xHc5/uo5aKRLB0ldgUkW8X4M734F9U
	dKl0qVe+sQbNrfkuYI2m2JGfZA12uWWqyCZk56YpvwMULEoo39trBW/HKzsORT3hGqvRz4MDoU=
X-Google-Smtp-Source: AGHT+IGnhNeI/o6Z6136CQhEX9o/eHGeoLXSEf1jk3MjOThRIU6D8IChIdqn1YYLplO/yI84hWmsvA==
X-Received: by 2002:a17:902:d589:b0:216:45b9:439b with SMTP id d9443c01a7336-219e6f28486mr267496755ad.50.1735103889194;
        Tue, 24 Dec 2024 21:18:09 -0800 (PST)
Received: from localhost.localdomain ([2401:4900:5ab8:f8b6:ea17:916e:35f4:2275])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc9f51a0sm97584945ad.187.2024.12.24.21.18.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Dec 2024 21:18:08 -0800 (PST)
From: Atharva Tiwari <evepolonium@gmail.com>
To: 
Cc: evepolonium@gmail.com,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Meir Elisha <meir6264@gmail.com>,
	Philipp Hortmann <philipp.g.hortmann@gmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] staging: rtl8723bs: fix network selection in rtw_mlme.c
Date: Wed, 25 Dec 2024 10:47:55 +0530
Message-Id: <20241225051758.1305-1-evepolonium@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

this patch fixes the network selection logic to avoid selecting a network
with the same ESSID as the olddest scanned network if it was scanned
within the last 500 millisecounds

and please give a specific value for "new enough" on line 481,
i have estimated 500 millisecound but inform me if the value
needs to be changed

Signed-off-by: Atharva Tiwari <evepolonium@gmail.com>
---
Changes since v1:
- Changed the "new enough" value from 1000 millisecounds to 500
- fixed some styling issue

 drivers/staging/rtl8723bs/core/rtw_mlme.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 5ded183aa08c..6604619d1b99 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -481,8 +481,11 @@ void rtw_update_scanned_network(struct adapter *adapter, struct wlan_bssid_ex *t
 		}
 
 		if (rtw_roam_flags(adapter)) {
-			/* TODO: don't select network in the same ess as oldest if it's new enough*/
-		}
+			if (is_same_ess(&pnetwork->network, &oldest->network) &&
+				time_after(pnetwork->last_scanned,
+					(unsigned long)msecs_to_jiffies(500)))
+				continue;
+			}
 
 		if (!oldest || time_after(oldest->last_scanned, pnetwork->last_scanned))
 			oldest = pnetwork;
-- 
2.39.5

