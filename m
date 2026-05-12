Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8267C360EEA
	for <linux-staging@lists.linux.dev>; Tue, 12 May 2026 12:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778590730; cv=none; b=uPOcQ+qzR+L+jsmpikywv5P/bihBQjd37Pce6wAEV4P4f9484ZsBQRq81LVrZafuQ+rRjssRATf5vqVzshy3OrSVdQNpqcmBOkmXMSnXTGAfXa4TUvMZLGbXeQPCyKcHNGhO2ssvvinAgLipmQYKf1KVUdU6Q9VMXY3jHDQceJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778590730; c=relaxed/simple;
	bh=CnAheTNpc0KT8HsboBTOztXaayTxXb4jvCsEPw0KUzE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f123XKd69SgUKQxrOi0EzprhehRijIAJ/qNyBlDCLa6sfNJxwFWEYQuXpNSNMQ+IB3ctIHEuTXsDqLw3ZxEmEWZ1lpKbqr5tlIB9bbSFZjmezw3LlAXKBiDA+JTAfE9vaYPOWWn24uCeSz/jRkC0Oq+CJNfx2roHp/hZX1GjLKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ol8dtpNS; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ol8dtpNS"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-393c40246afso56416001fa.1
        for <linux-staging@lists.linux.dev>; Tue, 12 May 2026 05:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778590727; x=1779195527; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=le4UWGuDVYuzgKF8WnQAIVyZMe2RrVrZLNf992h3Nx8=;
        b=ol8dtpNSLEk9QsHjQnaHuP7JHcgz8IMvdCwR3JuDVKyGUn5jTrrkfnj119RS6IHWUh
         8iOYMhGc+bJf5DMWBgT119X1XFrBW6E0+oritot+q4nrgljuoc0DhrqVoRzqRS5UZ7XA
         ZSNJN4g+dvnVlFoP66KMw1co2P9fB4QLegJznIK0tl+CCNwrLrldCbCj8nYINyytF3ox
         nCVq2zpQaiJjPaYYNucMD26alN1Jqd0BlKWXP+2l0G4Zr7J2GAUnO8fh8HvlKKjnFewJ
         9BPoxuZ4QPl0tpdq9WrJaCsdk6bJ+MRCQ5uc9PYmjoRcfHYmDmOQbtGUApbxpURmS/5w
         Akgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778590727; x=1779195527;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=le4UWGuDVYuzgKF8WnQAIVyZMe2RrVrZLNf992h3Nx8=;
        b=TtOru3iIkoJZaFf7Hq7aqIGNA6dbKB+YCBy6cIS+41Bjr1gwGSLEg1+Y2OpdrSlIHd
         8NcwZHhSrWTnxMGkoaFB8sjy5Le4j1auXZnxJMwAfgtngPuFGnxJfSz+7ipXDSbD9+CJ
         jL5tH6pv29tywE6Elyg79lmrqdkONZjVVcrSz/HVJln8J8oXqVsXLWt20R0PBGFcHx+v
         ZWTy9Dd7w3fH+ozCGR18Xr5lMxk2W5uL2tNHU2fICyAZKN3A6HHeMj5ilmexsrr1hFc9
         /89F/uaCBlkyGEN9k73GLVz4Hu7MjKbj1SarAM2V4MHeKvqXIDui6SpUZuCJ2b1ygbSS
         Uaog==
X-Forwarded-Encrypted: i=1; AFNElJ8gIu5oKqOScVpk65bSGCLtQ53TM1oxzVezbys3hvaPeiXpNiy3amUxjaPWdBlqVjXYcnftmgcl3FW0+kxj@lists.linux.dev
X-Gm-Message-State: AOJu0YzjA3Ne1n99B9LqRLue018iSVgR0k5Fz5WN92KY2EsLv1R0RxpU
	O7MbKyb/FZsiGMrPVB+EGBZaMLlFwRZHB9+YqKz0G8AbLhizjJymw5MzmVgKWQ==
X-Gm-Gg: Acq92OGUELLO6Apv82vqCb8s27ubb/br1psJIx3jWmUDDYF16zkaiK29wqMLPTtZri1
	LqoeVHJIi2R3qSN+uLBJAIAPfW+UeOEG3Z9eOOtYKaywMKHHijjuiIPCxc94JT+BJRwZuFG00vB
	dpfnzs7iEjwEodwb9eqE0w/SAwOnUCxRV4Oa4MPHUk0dd8MGtRi4q6cWaVnZHLCGdpNWDHwFA7d
	8cr0eBZhADVagKss/6lbAybKCWv3vAawhsqsapmDQrvej97NnzNdbFidZ6jQks/r23S/JLXOawM
	JC56yRsPBIIYNa3m7evJjFrNXhgOBKlBZN4cFRzJGKN5duEmrtQTtnAY84J4A4X0QqES20VTfaa
	hMwEcE9ZazYoeg9aqDyqTTzhWabPBlmMDnAQzwqDj+ATyKMFlOJ6n+BMAP6ATreIAXuCvCCx4bT
	cvpkmEuefM2M/SIs9XAVaHpMaz
X-Received: by 2002:a05:651c:f07:b0:38e:96b5:2f45 with SMTP id 38308e7fff4ca-3943cb408d6mr9278871fa.8.1778590726323;
        Tue, 12 May 2026 05:58:46 -0700 (PDT)
Received: from archlinux ([185.140.161.214])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393f6131c08sm34949831fa.30.2026.05.12.05.58.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 05:58:45 -0700 (PDT)
From: Nikolay Kulikov <nikolayof23@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <error27@gmail.com>,
	linux-staging@lists.linux.dev,
	Nikolay Kulikov <nikolayof23@gmail.com>
Subject: [PATCH v2 4/4] staging: rtl8723bs: remove unused SysIntrStatus from struct hal_com_data
Date: Tue, 12 May 2026 15:55:34 +0300
Message-ID: <20260512125703.6878-5-nikolayof23@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260512125703.6878-1-nikolayof23@gmail.com>
References: <20260512125703.6878-1-nikolayof23@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This field has not been used anywhere since the driver was added, so
remove it to eliminate dead code.

Signed-off-by: Nikolay Kulikov <nikolayof23@gmail.com>
---
 drivers/staging/rtl8723bs/include/hal_data.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/hal_data.h b/drivers/staging/rtl8723bs/include/hal_data.h
index d3e5c4039693..3a93ac312ded 100644
--- a/drivers/staging/rtl8723bs/include/hal_data.h
+++ b/drivers/staging/rtl8723bs/include/hal_data.h
@@ -387,9 +387,6 @@ struct hal_com_data {
 	/*  For bluetooth co-existence */
 	struct bt_coexist		bt_coexist;
 
-	/*  Interrupt related register information. */
-	u32 		SysIntrStatus;
-
 	/* Chip version information */
 	bool chip_normal;	/* true - normal chip, false - test chip */
 };
-- 
2.54.0

