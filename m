Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAAA432D43C
	for <linux-staging@lists.linux.dev>; Sat, 18 Jul 2026 18:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784400927; cv=none; b=HzepEILPuem/RSTRxvneubkzuJOe0KWMXnK/q7ohX80YYWSvEwaM1I7Mr0ILZM5AOvNdgfyzyhd8SO5kL49O4bKEyHutQtQEa3vEMJW+t2NmeS82BB7H/4EPBC2O2Ib03CgrHWnDOVA6WYy+tWR8arvV7Y8mxuhPi3HTCRb0qS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784400927; c=relaxed/simple;
	bh=H1uaarUT/CzOlIYk85IhS6PC1+AMvnoZlaiNlT42aGw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UakXv0yuXcuJAYoZ11kMRDROWXpjRcGvlaEzfsu6AE+QGl6g5sdEXnrtwr1XMkQIre42lsXO1YH/XFs2XK3RoGCIZseziGyx2/3xyI87MJy+W839p65UnwyeWyPSr6XxC8iUtYJjq5TFuV313OiP01cCmuTKuJ74M7ZKnMFDikE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PRi6jr+A; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PRi6jr+A"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c15f020a223so1171482866b.1
        for <linux-staging@lists.linux.dev>; Sat, 18 Jul 2026 11:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784400921; x=1785005721; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c6Y+pKPXjSHKlGYu4KK+zrCXrOnM9HLfJHcJjmz+n5A=;
        b=PRi6jr+AX21cqJGKhzz1uD8O06rJPP1SfEjc3pVPj4KQRZsVzOVYgjxjTmhk5F3dnG
         +sPqbmcpByCknCL/xt6+XkUhi+PzODCnzONmWz+LsUVpclAYWUmOZURTEWL9iovLASQw
         vAaiqH0A9Tw2+iTC7ybUOdbY+SKSBaSQeC1iXXycYmzXOGomVIasNElODR53xICbRIR6
         SIAL+H7ZGSsAedn/uuFncIM6tSwmmyN2qY66BdfuaYaf6lypquoiJd4EIfexInKdVCfT
         cJT6SZW/ADDs4U1NdEYRFtmBBhdo0wX3vZMP08/XaECpaV95tvC730sg1+9ROZp3vfVS
         SpQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784400921; x=1785005721;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=c6Y+pKPXjSHKlGYu4KK+zrCXrOnM9HLfJHcJjmz+n5A=;
        b=e/DZ5B6cF+PDGXoLIH7elB2vg2i57hEG3ALvICb7Q+ijVVGXuONiJxp7ACuVhYufUF
         x3naK7tJHfXVqQtY7wfMO/si4Mc1QT8CF7Tj88ThKUSoKA82LQK7t3WtFCky2NsPaEsd
         isagiIs4LgwrG+oMhjST918A+VKpW6Q7iKAvHPbvSS9NLbC23FEyZWLXo8jCTF4BgJzt
         JOoR6tUY4C9tfn7fry2cmDxdjU1NgCadLuKBcGBIVejqRrNKFsbtpn7Azrvf0Gr6huwg
         1hF0pnRDrz1lW9HzJGR4/odmAb7AdwF0b1gL8FhDyuAMtlsQVDsQCvWfdZsdoyZpKKOM
         PLJw==
X-Gm-Message-State: AOJu0YzYccCdnMGPHKu4IdYO0Zt3J9+oIlndoD+hWyVGKjLk3LnCXOhy
	k/FjK9z/oq8rHNlAYVx5Tvb2y0OP25mno13eZQ3g5rGarZysrKv32JYH
X-Gm-Gg: AfdE7clJ0PKk+/oHcgzAeEFCdcPhWXpZWb9IouhyFylxdcji68JdIyCOCLK6wMJ1k4b
	6o81v5Ovwq+lb2EtOPWUuL2oKH0NWaBHqbq/EIpWQabk0lvYFcDxAtKT4JQVIp27GCWajbsPKBF
	mHh0EX0+AvwgADPYDLpO6cO/CYVfZqegxWQWZQguGSmCEOWAYF/jUvY82jjBsOeAbcNx+xQMwqx
	ukUWrewOPSQzAR9rVlr30JbXVK8Ag1KYZnO3QhQXSN4DSFlMTkHYRhKjf/2bMs1jwPfceKgFHVf
	SJ5Sji33ph9qJ4sfuprxN64iWbsFFBEyCNbKRljFkB6wy+ZyL7a0xApGxt7/TasEirTW79JOBFK
	nVuw8GbDc/PuXFJcRfOZLbr/E2OXclEOlUAq8Y+fcjlFcKsqAQeyLub+gABvZl3HyUnZ5rhl0ED
	V9nTYw8VFucfaV9jfcbLX68UrSfYM6Axs23DpXHOuRSK2bDjZNqxULneM=
X-Received: by 2002:a17:907:d11:b0:c16:5ae4:77a3 with SMTP id a640c23a62f3a-c16b4702bd7mr341127066b.25.1784400920942;
        Sat, 18 Jul 2026 11:55:20 -0700 (PDT)
Received: from fedora ([202.47.63.86])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1712a5f837sm249151866b.32.2026.07.18.11.55.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 11:55:20 -0700 (PDT)
From: Muhammad Bilal <meatuni001@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Muhammad Bilal <meatuni001@gmail.com>
Subject: [PATCH 4/5] staging: rtl8723bs: fix OOB read in rtw_restruct_wmm_ie()
Date: Sat, 18 Jul 2026 23:54:44 +0500
Message-ID: <20260718185445.63070-5-meatuni001@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260718185445.63070-1-meatuni001@gmail.com>
References: <20260718185445.63070-1-meatuni001@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

rtw_restruct_wmm_ie() scans in_ie for a WMM IE with:

	while (i < in_len) {
		...
		if (i + 5 < in_len && in_ie[i] == 0xDD && ...) {
			...
			break;
		}
		i += (in_ie[i + 1] + 2); /* to the next IE element */
	}

When the "i + 5 < in_len" match check fails simply because i is
within 5 bytes of the end of the buffer (i.e. no WMM IE was found
near the tail of in_ie), execution falls through to
"i += (in_ie[i + 1] + 2)", which reads in_ie[i + 1]. If i == in_len
- 1 at that point, this is a 1-byte out-of-bounds read of an
attacker-influenced IE buffer built from association/scan data.

Commit a75281626fc8f ("staging: rtl8723bs: fix potential
out-of-bounds read in rtw_restruct_wmm_ie") added the "i + 5 <
in_len" guard to the match condition itself, but did not add an
equivalent guard before the fallthrough advance, so the same class
of OOB read remained reachable through the non-matching path.

Add an explicit bounds check before advancing to the next IE.

Fixes: 554c0a3abf216 ("staging: Add rtl8723bs sdio wifi driver")
Cc: stable@vger.kernel.org
Signed-off-by: Muhammad Bilal <meatuni001@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 1196ec011455..7bdc5fe6dc8a 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -1980,6 +1980,9 @@ int rtw_restruct_wmm_ie(struct adapter *adapter, u8 *in_ie, u8 *out_ie, uint in_
 			break;
 		}
 
+		if (i + 1 >= in_len)
+			break;
+
 		i += (in_ie[i + 1] + 2); /*  to the next IE element */
 	}
 
-- 
2.55.0

