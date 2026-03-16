Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E57B346FA9
	for <linux-staging@lists.linux.dev>; Mon, 16 Mar 2026 22:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773699576; cv=none; b=kGa0OC8CVJPJ5lSiyIOOMFAm2QzzAzZe9byuSSknHgq9MfKiwkGHa5jfTi3YohnuVbW3xeaWvDeM5hKnyKioAUqmIu3g2iHUHfcJLExUn2Do91yAulLJH9yu8Pcvwj0MK6Jq5GfAbG5kWWDa6BfinCOqn1OrgKw+zZRyPNaNlak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773699576; c=relaxed/simple;
	bh=XEbf1sAaOUNpMgrKoByOte1QoUwxQ5DE2yCtQUTXz6A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HqAcpiW4ewZH2+kclHY2myRHRH5ZYLy3O0gTuLm4GsXg8PSJDR4IOumDo2FHibKvUi6r/TDxPl5alE8ycojK7ip8oWpH6KtSN9vRJTdIsvYphoJmTrHe3/frNUQvv27gr5ieAhzMM9ESHkxzWf2YTS0U0oC5DkRHJ5JHaGgV6E8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YtIupZrN; arc=none smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YtIupZrN"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-2c0d36f3888so774926eec.0
        for <linux-staging@lists.linux.dev>; Mon, 16 Mar 2026 15:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773699574; x=1774304374; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=g6XMAfGTOhtchsVxpbyJwfjmX/4PXjJLPisnrWCdwp0=;
        b=YtIupZrNeBfVi2kpVbUF2i6271g/W2K3qWKrxy1kI/HY/OKbtFwcws4Sl2pl2Sd/h9
         ouoSEKHDdbNziLGa2l3m2rjfmIPjZuYPA8qh1ziLD18BXi+JFcuF3Mwq61+ZIMJJRDY5
         Qf0hh/WNkpAM3N1pa8xdZ9638J4fOpXB9rVTThi8WoPU0wgJi8hGJqJ6lMbumXsZrStw
         cNAKkbpgrui4zLNlCAPvtaS3Ifoesv1YDuAgmk6wfaqLvk4bBCEYZKwV8qun5/3U33Yv
         8TK3oCZf2H85WPwu7hCruCCMYpP1THLYHjFkH1a5w8IRyrzmjJoRDuwAP2jMYlLkdW2s
         QJ2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773699574; x=1774304374;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g6XMAfGTOhtchsVxpbyJwfjmX/4PXjJLPisnrWCdwp0=;
        b=HRlPE1tQ3uWIP/kqTGSKLRRWpEoGOAuV2C/U0YIjwoxWCDocKk3SlAXI2HxGV2/Nh1
         zvzxxzvK5E+8RhqNwjWMsMpS/2Wh1mg4IUzkSJaWj3yBaGbO8oFmefEBCslSW/y8U/PO
         poR/Fk0Ma6cDczMX8AcotEJurZ5RhoKovom5q5AuWkWSquoma1wW+khS3uu4GOMxIEEH
         ywc7f2bwBsTbJA163GFo873BWrA5TOgkuKagkbinYSw+Se8ZAota05m9jU42j+zGR5M0
         zxlDQsx0Dz43rr7/w4oDAKJQO0ZQ9lVtCmWf/h2IGrGfHYvNavmVe9UIGnQ8Uy8Damfm
         Vupg==
X-Forwarded-Encrypted: i=1; AJvYcCXFxxflX9WvI2LOyu9zKWboXsYyYExgwn3gayW6E9h6Ka7wiBQ2YmEIGAeNT2Oouq9URGrusykD44xhcgk5@lists.linux.dev
X-Gm-Message-State: AOJu0Yy2TB7aJ/oElC4KlL3tySAj2ayAq5spe9catzMYGXBrsXdP8h0s
	ENKx54mn8wx52g0Q+1faO3e8yP8hAcPCE1otS7u6QxB0uIru3L7xfWV+XPNLRA==
X-Gm-Gg: ATEYQzwsHM/sM2QY9IpXV9Wgy9HwFjNrZV/0JlgKYXOF61i8hXbbP4ICpX6Rmbgs+n+
	gR/Ow40Xf6sJuOPYbWzKn2K46SGPBgTgRBcDxV7TIEmq2NHR79lubVJq3O1OJh6Hrky9hD49lJq
	u3nov3MmrH/cgAoFQ803u1h3LfH3DlDzxooGhmEp/+sig0cJNf3S4KQ/zGQuCDRk5cGivV2TLJG
	P3tiSokBP/QBxOm9FZuMmyaNkdrpI4iLDTyKGifaMCy1FzHfUcZ6tnjRCtBw7IrEdDTbOUOVsnQ
	kspGNX2I9/XDPwhKFy2wXFwl9gQ7r823MBmu6ABKLQ9Ijxl43MeA6HnsQgAWrZy6WIVEoDyREaW
	MJWnSa9vTtfPtPmM4zJW0cajzDqUI0n2m6vVtYsul+nORc9HMtOknBLbS/i6HmdSS0zCQh0XHRB
	Kw3YUyiFdQdsNK7iE4sAxzG6OxMgfpwVYY/vCyjIC5zTpkvtM=
X-Received: by 2002:a05:7300:6144:b0:2be:fe8:8b0d with SMTP id 5a478bee46e88-2bea54ffe04mr7722866eec.22.1773699574122;
        Mon, 16 Mar 2026 15:19:34 -0700 (PDT)
Received: from mjmachine.localdomain ([131.255.96.168])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2beab526d61sm19548389eec.17.2026.03.16.15.19.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 15:19:33 -0700 (PDT)
From: Marcos Andrade <marcosandrade95963@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Ethan Tidmore <ethantidmore06@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Marcos Andrade <marcosandrade95963@gmail.com>
Subject: [PATCH v5 0/2] staging: rtl8723bs: Cleanups for rtw_xmit.c
Date: Mon, 16 Mar 2026 19:19:22 -0300
Message-ID: <20260316221924.4904-1-marcosandrade95963@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series cleans up rtw_xmit.c by replacing magic numbers with
proper macros and updating the sleep API, as suggested by reviewers.

Patch 1 replaces network magic numbers with EtherType macros.
Patch 2 updates an msleep() call to the new fsleep() API.

Changes in v5:
 - Collected Reviewed-by tags from Ethan Tidmore for both patches.
Changes in v4:
 - Fixed commit message line wrapping in patch 2/2 to comply with 
   the 75-column limit, as suggested by Ethan Tidmore.
Changes in v3:
 - Grouped the patches into a series because patch 2 depends on the 
   include context of patch 1.
Changes in v2:
 - Changed include from "" to <> for linux/if_ether.h.
 - Sorted includes alphabetically.

Marcos Andrade (2):
  staging: rtl8723bs: Replace network magic numbers with EtherType
    macros
  staging: rtl8723bs: Replace msleep() with fsleep()

 drivers/staging/rtl8723bs/core/rtw_xmit.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

-- 
2.53.0

