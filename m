Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4EF2366559
	for <linux-staging@lists.linux.dev>; Mon, 16 Mar 2026 22:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773699583; cv=none; b=QAXQxcDEiEWMIZTspHQ/p8ePwDuoyHo1fJkGRYk0UH+aPeFZx5HjuBI4ZEgRNVLqBTuDOiKzbhf6Wnqr0ephvtO90xQPjxgl+ECjEwgGYnG3EiT1bOO+0xTWzmiRcRxgdXZ0JHYcYiO+BtEWoiab9Hsjz57K8VdpOXxdiq2v+/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773699583; c=relaxed/simple;
	bh=uM8xgUxffcfZ4kAgfdU9p+zDofvgv7fXsInaDAtiB6Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WrGUtqIbYfsc54Cgk5Vzfxy53deWoCIs95TVSoNbD08EGWiZtrvVM9UxeSI5kqpGeiMgC+8PZ8eerI+/JkN8hOQ/JZrqcCI0yDrkSxMMAkJbG1IZkEbyOaAAvgdA5KcQuEQmWETCsUmWk1Ta86/GagRky02BjSRVy1WlwlrpP64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MO+8XJhY; arc=none smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MO+8XJhY"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-2beab594d8eso7910542eec.0
        for <linux-staging@lists.linux.dev>; Mon, 16 Mar 2026 15:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773699580; x=1774304380; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IvlaMzjqwAVznwWNgyNx6/MBIRXqUaZTnYJ6kz1dy5o=;
        b=MO+8XJhYpHWRUzNyWZdS7nOPqMzuxSKhGWf/+YmmA/O4EejFSZvhHIEHc5eyOpCctW
         1xrkhfApfHVe+FxLlM2mauqoBgAjI6dcm59jNfwh1xwrHo/5Pe2WHs0EcyNrjyKyzmla
         5wHDReXp9CKkhZsm8deBKlc4wrDxC1HQqXAvnbhMgjXk+pl3DBq/GOFJ0RfBTgEzF6A6
         +jrtkoMPlekrXYcsMRj+3k1jnlU2p5SGeQbB0dkce+1R5+k4A7FKFxPHo4mFL3f3lvze
         GFk5Nc/5V2uBzZrrs1foiqGqV76Z87bfqF2pcpk56c51hN9ZZ3O8NgToR0tQPySKM78i
         l0/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773699580; x=1774304380;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IvlaMzjqwAVznwWNgyNx6/MBIRXqUaZTnYJ6kz1dy5o=;
        b=pinB9P6F3EHQpcNN6nwLlADX8ByxUWKxou2lpubAdaPpbZFsmQOh5BLsPjMbI7wTfD
         ZWBoFyHimZoQRjpZoGnRGgP5C0IXlhlc3WXs8fvY7ch0v6SIaOFe4+3hJZIhwN2Exekc
         wRZ2P4Tunb6OSj85FSSJDG5xDnB2GUbXRZ9Qtc9pCqz/fO6LiFbTLBIZktoPWwPADMOa
         T1E2SWcuENvnw7tGqGPgN5ICsQd3eIITwnd3+z5/vZy48uTG6dEZY/DCv19vi017hfM5
         MvuIkjNjb7L403wb89NQBuWqUN3XEFbqZ7ILH3POtrGqv7XuYd8EEhFll7nSIHeyGctn
         zlJg==
X-Forwarded-Encrypted: i=1; AJvYcCWeVkdjTt7ZTp+yCbMHEmyhxQQvSNWi3J3PK+OIuUQPMmhj53yjXaxYVmQpcEQIJfIlpFiB+EjysAEDVOzm@lists.linux.dev
X-Gm-Message-State: AOJu0YyP8UOFBmtnte5zH/HkxB/bbFWmsNKRR66OYD0al6KfvB/AOIl2
	ZJZF+jATE30rjsVdLIuWPtziYv9HXg+g2lWi4YhWo8KRTaPkG9ygOwOvUrVCIA==
X-Gm-Gg: ATEYQzye9xDGsIXrlH3a8qBNvofSygMr3YrWRRDHGvJ0BCxOS8hFS2IEVFD6c0nG8Lu
	ekcrqqS9/Bz1Gcvzq375dEN6TfGk2RTJULSx/Jd3vnpIbjulWB1SE6ruGJU2K9zxfn4Iiy0tSY4
	hcIcVMieSTmwGJia1GTt/exBFg7I1kwUmylA9KTIk9RbdK0MoHMGOzjtC+70yfm2vgyJ7OqBSJf
	EEfeatNDVRsyJ0v79Nr/kGPSvXDw1VdOBP5yFCmcWa92yTqHBJqCy7XAIsgrEYsVWUk83lfYBSx
	l7viqmciLA8ShCxbniV4dEO9+VJRZQBLimJA2If/JgRR1Ftj20/Yh2ezwPP/gwyW2I32fzMxPM0
	VLYxTxWydsLsKq7YlzFbQ5SJC9E9SvL1t2/77RDLVbf3jVbm8lxZMD0Ub+G+vB0Vb2dsC1BLZtc
	MpBDoXM8MkBuEuQuXFCxNOnjAOkJGjI2gSSOgRFobDPbWxbbU=
X-Received: by 2002:a05:7300:bc8a:b0:2b7:32a6:82d1 with SMTP id 5a478bee46e88-2bea54818a7mr5535943eec.13.1773699579873;
        Mon, 16 Mar 2026 15:19:39 -0700 (PDT)
Received: from mjmachine.localdomain ([131.255.96.168])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2beab526d61sm19548389eec.17.2026.03.16.15.19.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 15:19:39 -0700 (PDT)
From: Marcos Andrade <marcosandrade95963@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Ethan Tidmore <ethantidmore06@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Marcos Andrade <marcosandrade95963@gmail.com>
Subject: [PATCH v5 1/2] staging: rtl8723bs: Replace network magic numbers with EtherType macros
Date: Mon, 16 Mar 2026 19:19:23 -0300
Message-ID: <20260316221924.4904-2-marcosandrade95963@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260316221924.4904-1-marcosandrade95963@gmail.com>
References: <20260316221924.4904-1-marcosandrade95963@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace hardcoded magic numbers for network protocols (e.g., 0x0806
for ARP, 0x888e for EAPOL) with their standard EtherType macro
equivalents (ETH_P_ARP, ETH_P_PAE) defined in <linux/if_ether.h>.

This change improves code readability and aligns the driver with
standard Linux networking definitions.

Signed-off-by: Marcos Andrade <marcosandrade95963@gmail.com>
Reviewed-by: Ethan Tidmore <ethantidmore06@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_xmit.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index 7b18be891..4062fe0c1 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -5,6 +5,7 @@
  *
  ******************************************************************************/
 #include <drv_types.h>
+#include <linux/if_ether.h>
 
 static u8 P802_1H_OUI[P80211_OUI_LEN] = { 0x00, 0x00, 0xf8 };
 static u8 RFC1042_OUI[P80211_OUI_LEN] = { 0x00, 0x00, 0x00 };
@@ -2026,8 +2027,8 @@ inline bool xmitframe_hiq_filter(struct xmit_frame *xmitframe)
 	if (registry->hiq_filter == RTW_HIQ_FILTER_ALLOW_SPECIAL) {
 		struct pkt_attrib *attrib = &xmitframe->attrib;
 
-		if (attrib->ether_type == 0x0806 ||
-		    attrib->ether_type == 0x888e ||
+		if (attrib->ether_type == ETH_P_ARP ||
+		    attrib->ether_type == ETH_P_PAE ||
 		    attrib->dhcp_pkt
 		)
 			allow = true;
-- 
2.53.0

