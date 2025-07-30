Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C9C41C5F2C
	for <linux-staging@lists.linux.dev>; Wed, 30 Jul 2025 04:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753849253; cv=none; b=urCLxxLeaobw7RSMG78eO9q+Ly8mB78jd4Z1jMY5zJAMKUZXDQkyxkKEH3obo8Aocx1D3x94xRIOBmCkXNnMRlvY3lsQ++IWVkuOWWWBmm+95lYVxo7tba90Lk88XBAWFMSckknuHtBLDfVo9xZ1jRYnNhCx0/mWiIbmAiAOK7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753849253; c=relaxed/simple;
	bh=VtlbEUvC+1Ke27heP7oXzNDycF7JeErvTwnIj32oDFs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UBz3Sr1kWrj0LtllhzYXQoAZmGQ7GwXAcrFXCXyJDDBqkiryIXmHsL5QwaoeXBJFcHm+3v2ZILermc185HRa0VzoSSDU0e19Zozh2j0TQkfSpDEnJDDxQFguwxPtlNVGC1vIDqVebK+bgKuywWdqjVRGgE8IbyhGU1wlSj264v0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PdSY6wgN; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PdSY6wgN"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-4ab39fb71dbso6584021cf.3
        for <linux-staging@lists.linux.dev>; Tue, 29 Jul 2025 21:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753849251; x=1754454051; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GBDrP8+XAiCQt11h5ERJV6IvzsZGdQ/fB3B4Nudc+Fg=;
        b=PdSY6wgNWzYpASI9f31uzlDHTHbmpgI0u/eHeixQSReV/ybnah5E8z4giXG5tZOtWh
         497J2Sge1YE2mv69EHmA08p0mUOxq9n1acp2KxSUVwIe5A+GHAF4sxwYBVvYcpf/ecaE
         tOvzoDxw2t+AXMYZFlLry+kumbCziKKuyN5yget3rQoNypdLdApLbsmOF+Uh8sHhbexo
         DzBx5ZU4pt8senyJjYdyqCyycE2txaYm5Rwc9XTMtH4Bb3vCHIhGw6uFYgQ/3MS4900t
         CnO/S7CDwxDcfKYNFXNvvB2SOt6NX5LUDxAL01ECLTrUkx5zaGNCVsBOmIDK9IArBsdK
         RB7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753849251; x=1754454051;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GBDrP8+XAiCQt11h5ERJV6IvzsZGdQ/fB3B4Nudc+Fg=;
        b=Fni4tQgTI8ZUnLAIsxHsZEdOHRStN+bNkuCV+4kiiXwLKuYuCfZibNBd6W1WXGxGBh
         m91jazw3rzVhaWs0jTQeHSkKj2d0P9lP8iJq72qkFrBw12KYpKIgXnVtUaWivDnullW7
         HBslTmS0xcEbQWBUSC7fkuYdwyjUO5tpmeZz7kiH08jHhXBvgknBHSGHl6RSXAelm3ON
         BhHcrw13L/he+vOh9k2mGWb0GLYh5TihRrDxqXwfhi9auEngcEXEYgon9iBEGBBDPsO6
         KSHaAuoJVelQ8rxTm2cKrJ0SzxG6BhbzaXXtedBgHfdsck2ok/NvG+UcRS+/9UPKRskA
         V8KQ==
X-Forwarded-Encrypted: i=1; AJvYcCWBf7oerOQVZ2Pij2/vmWIQK+Lp65ihFVHtUxGESwckVRm0GN+xFpXXn2wMmAP7KXPJqHVlUtEFeZSGGoAU@lists.linux.dev
X-Gm-Message-State: AOJu0Yytau4m3llFaObwAnr7WPmsBGOWjCaPAhyWuaargeJr2unu5Y0Y
	HJhAnpkfCYp0DXL8Alob1GI3tDNXGqzni9tlPHXGO/A91KNAl6rW3ElI
X-Gm-Gg: ASbGncudl5cpj/Co0MBWKi6DD8GcCsXyD4+Grejrr7JL+DXd/nThoXzpO534ctNUyW1
	9bQaVngw2dHrNJl7JOWQDW1uLlWt3XajunKmtwWCrMknN1A33GvP3SDchvffjtJqBeYPNsRo2Hj
	sG1eKyCnQsRZg3Ic9A0wpp+QHdO09T7Bheqcye0WjvDs0s+efM8w0eXcnFUQKMWWU6RAa0ayj5U
	PFGTunj2ZM3k5Zx6V3g0Bf8w4C67qp+r43VS0dOWsjj1jBAzo4hU0428Jy6NPigrWXggYYvDuqS
	5SVtLt9Zl4o6EVcCKzG+VX10cEy2BdMEglfoEhWS9exMAzC83LqfjYAkGeEwNjqkTfJqNtA/DL2
	Klfl9YktBVOlySLlCGgctbH3PMzWEqqw3IgGiw5CA57L4zkxHpRWOS2I9HQIV2w==
X-Google-Smtp-Source: AGHT+IHz+lZhDxmH6jA3pyAfmQkH6IxnMd6r6bPodgf2EeznfTLaqQFGNquzoDmjbIcO0X4/Bu60tA==
X-Received: by 2002:ac8:7f8d:0:b0:4ab:667e:2db5 with SMTP id d75a77b69052e-4aedb9e2501mr28267311cf.20.1753849251261;
        Tue, 29 Jul 2025 21:20:51 -0700 (PDT)
Received: from linux-kernel-dev-start.. ([159.203.26.228])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4aeadea8b61sm46472761cf.24.2025.07.29.21.20.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Jul 2025 21:20:50 -0700 (PDT)
From: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Markus.Elfring@web.de,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	vivek.balachandhar@gmail.com
Subject: [PATCH v3 03/20] staging: rtl8723bs: add blank line between rtw_roaming() and _rtw_roaming()
Date: Wed, 30 Jul 2025 04:20:32 +0000
Message-Id: <20250730042032.488456-1-vivek.balachandhar@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250730040402.488284-1-vivek.balachandhar@gmail.com>
References: <20250730040402.488284-1-vivek.balachandhar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a blank line after the definition of rtw_roaming() to separate it from
the following function (_rtw_roaming()), improving readability and matching
kernel coding style guidelines.

No functional changes.

Identified using checkpatch.pl.

Signed-off-by: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
---
Changes since v2:
- Moved version change notes below the '---' line

v2:
- Moved the '---' marker line below the Signed-off-by tag as per kernel
  patch formatting rules

v1:
- Addressed review comments from Markus Elfring on changing the description
  of the patch regarding readability and separation between function definitions
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 24e505111f1f..b1a427a655ef 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -2449,6 +2449,7 @@ void rtw_roaming(struct adapter *padapter, struct wlan_network *tgt_network)
 	_rtw_roaming(padapter, tgt_network);
 	spin_unlock_bh(&pmlmepriv->lock);
 }
+
 void _rtw_roaming(struct adapter *padapter, struct wlan_network *tgt_network)
 {
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
-- 
2.39.5

