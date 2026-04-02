Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66725241C8C
	for <linux-staging@lists.linux.dev>; Thu,  2 Apr 2026 16:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775147052; cv=none; b=OAqr6/z/joF63qdWTLM5621A+AGGrVFOw0knx0hZBLBm8kz8Q8dKNOHYa1zLus8bzDh7Tjny951IR05OX24V13RhScGgTGELapAJavKiUXSJmR0IdlD3YNIOP46t1ndLBh1fWCLLD3CUGINeZES+bmScVhIv8ub4vEXoNaRAY+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775147052; c=relaxed/simple;
	bh=rqBUrcKkNql+DK9UGwtMyVc3Yz9e9lt1f4li2iXc7E8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Bj3a2ADLA1TMZ+ajg2RxkRoAgcK/AIEXmJ5OUO5uZASi1p+KV5n8BhCLGSOOTh5uF5DOFIfNm6apT25Vl27qAUWYS5vyD7fy4jj2wbh2lD4YqimD/4k09omf4uF7aA5DGc+PO8NfzrNjSgd9WnsgwFnlYYaOF7PlKoE74Lx2vL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fVAJEMz9; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fVAJEMz9"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-7986e0553bdso10820807b3.2
        for <linux-staging@lists.linux.dev>; Thu, 02 Apr 2026 09:24:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775147050; x=1775751850; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fnuNGA9OooelB954wGtWvGW18Z8r/m7ysznER3211xs=;
        b=fVAJEMz98nsWKz1QIbc9g1wJFNL7g2yirjdHxuQiQGrq7HPWiT0CHSrzdPR9QrB4SN
         ShjnqhRhpa0fUXYuyHBRe5ojpjnr9IxgrSITWKzS9RQwhXT9K1AY7Sinyl1qJPIIRqAT
         zhp2dQxmbviNXButFa4EtHz7zclWyMJLYrUfwHmylC7WF6bbSrIt3GnAZWz2BhxdKxcU
         wuVa0EQ9zuMBntc2aoQ2/RZV9xgc6EtsFoXnt5T4u4XA8nWsbqI7voKJ5VwlVPk/B5f4
         9ms/QzyiT5fhZSavBTsV/l6VwhkWjZIHrRFPXejShGw6++DIx8zHwzvs/CWLEaKSnmyJ
         m/Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775147050; x=1775751850;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fnuNGA9OooelB954wGtWvGW18Z8r/m7ysznER3211xs=;
        b=BCxCGH6L2xVboxE34ukVBmFBjA0OI3X7Ugp0sjssNi9wwBs9qknGffh5CD5YTseASm
         ZZjRmOpHtQGpuO9gqnW4kEqZLA7g5Je4jiG9qqkMfZbcaQkmAqa6gzKYe7A1YPKu9jas
         J15Jqr/mC0jRoKVJTLk9Ed3vCYVsuQcrgHwCMz8Qk2G6tBreCG/Arr7POS5yQkJeb94j
         V5pADq9pM3q+6EGoRe4umIVz6GcLcpq5Rqvhc+x9n1FtfjJ35DHWppMUHah3V51fnjms
         Tc+I9LhEjSzkcGwqGbZg6DYqaqsaujfW1mwMXBCCU9+qZ1k/Vbt98box8apn/D+b00dQ
         Xubg==
X-Gm-Message-State: AOJu0Yzzh/6L8ynhVVdrDk3Z7uKulD6fOo6C7XqEYXGMXv0DCGYTY07L
	/Ttd3SDr1ohJWFLiw5Cens5HjTXOtMbVG4O+FrDk+Jx8x6Ky5c9f/Dz6
X-Gm-Gg: AeBDietIRoC93vGZWgzgIIP0kQDvAlIzqZshGJ5s0m/fj1F2tu4whdmLSlgO2CjE3ca
	JHDR0QYgrSSPxg/fmMSR5n+jM9Labw/9OJVXqA/8j/jZndmaxiZ9ChmefByq9KEXzhHSIYsmXd1
	o0w4/pyaMu8zOJO4rsfLEuEKY1Q7mvhigxyOr+JXa3e7SO6gsNuVOdzol9E0iqZA3rXpfRagr9M
	XewIb18iQCUTN0O2ONxDv4UVjdO0Ph0ijvDtf1sMWd8GFZZ+xo1zSUoGTNgE2Diz5abt5BcNev0
	bZMmZE+fqXeBzEIxZOYUWqVXK5tUokd0uBF+Ja10i4MO3t12nkadZ95UPHAJZb4HdLXjoXFQTPf
	wIQXdMoyRKxuuL3S6CbU9qBSSR1dl1+6t3Agjj2pANLO+CyUe/4P549TyycAEFeiNVU3I4thVi4
	KCEaXWh4vQgFCbPuIPwqaEOLhVFuNj1Mt5HmrMs4g9Dqo=
X-Received: by 2002:a05:690c:dd6:b0:7a1:523e:93f6 with SMTP id 00721157ae682-7a212148a56mr90853877b3.46.1775147050441;
        Thu, 02 Apr 2026 09:24:10 -0700 (PDT)
Received: from [192.168.243.250] ([93.186.98.153])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7a36ed2bb47sm12909577b3.21.2026.04.02.09.24.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 09:24:10 -0700 (PDT)
From: Nikolay Kulikov <nikolayof23@gmail.com>
Subject: [PATCH v2 0/2] staging: rtl8723bs: cleanup rtw_io.c
Date: Thu, 02 Apr 2026 19:23:16 +0300
Message-Id: <20260402-cleanup_rtw_io-v2-0-8d12ef658e18@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XMQQ6DIBCF4auYWZcGCYrtyns0xgiOOomKAUvbG
 O5e6r7L/yXvO8CjI/Rwzw5wGMiTXVOISwZm6tYRGfWpQXBRcskFMzN263Nr3f5qyTKDuRKFGQq
 uK0inzeFA7xN8NKkn8rt1n9MP+W/9S4WccVYpqW9Kqh5LXY9LR/PV2AWaGOMX1x8Tn6wAAAA=
X-Change-ID: 20260402-cleanup_rtw_io-ce1725cf50b8
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Nikolay Kulikov <nikolayof23@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775147048; l=762;
 i=nikolayof23@gmail.com; s=20260402; h=from:subject:message-id;
 bh=rqBUrcKkNql+DK9UGwtMyVc3Yz9e9lt1f4li2iXc7E8=;
 b=V5DxFjEDV6E0OIG8PYufLXipUwYSK5GO3rfCLh5UwGLYmbN2uE4TyFeH9BbaoGaHUpV1vio2c
 FZaWmCrccEyDJDLe+HeuJ3evyvAcjHEqY4m75v1wqCaMS4Vj8BdoOks
X-Developer-Key: i=nikolayof23@gmail.com; a=ed25519;
 pk=2GWUU1isl5NJpkwSCQ4OG80EinZ3EUZXlrgAg6Pz5zI=

This series removes the dead code and fixes separators in core/rtw_io.c

Signed-off-by: Nikolay Kulikov <nikolayof23@gmail.com>
---
Changes in v2:
- Add the prefix "staging: rtl8723bs:" to the cover-letter heading
- Link to v1: https://lore.kernel.org/r/20260402-cleanup_rtw_io-v1-0-874b9747de6b@gmail.com

---
Nikolay Kulikov (2):
      staging: rtl8723bs: remove dead code in rtw_io.c
      staging: rtl8723bs: replace tabs used as separators with spaces

 drivers/staging/rtl8723bs/core/rtw_io.c | 20 +++++++-------------
 1 file changed, 7 insertions(+), 13 deletions(-)
---
base-commit: e87946666e47d4b6f615e9ba0075375493194810
change-id: 20260402-cleanup_rtw_io-ce1725cf50b8

Best regards,
-- 
Nikolay Kulikov <nikolayof23@gmail.com>

