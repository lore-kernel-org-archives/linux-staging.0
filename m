Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B17E17A586
	for <linux-staging@lists.linux.dev>; Sat, 21 Mar 2026 15:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774106046; cv=none; b=NUTzPDI5tEwd/oK50GXbWGPaLYo52spcSR0x72/Xq7nGz/ndmIZyXLXHvChxBxKwMHy4tymnt60ywjGmfgGXBcLcvbMn1UGeuTUjuAIUD1aFXD7QgbWvsVFLr7KgjrCtBc1nvAKZb4grnklCJE/jSjOhRsPRfBe3nnWsPUFdZTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774106046; c=relaxed/simple;
	bh=mG6b+Rx/lnmrOQAnpWXOxLOxEdptnRAkIx5mapBT80Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ucrUofPxGGFSftg50pJi+6Xrx9NtJAg+56qN3/ej2SVnNecGZhB1Qzk+jOCl6Z275QCCkDZZ48FONuSLePeW3VMdep73l8kpaYCDDqBK41RoGBrjCXHEFjg2kogNPE+nJF4qstlxPDSTnnPnp3fU2F4YzWp0mm2AsKazsGgIGDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j8ExbNRk; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j8ExbNRk"
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-56cc67e01deso1412076e0c.3
        for <linux-staging@lists.linux.dev>; Sat, 21 Mar 2026 08:14:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774106044; x=1774710844; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b0dPOF4xiw7IuNb1HUM62WgP+yaSzJ+Mo4AOgVNzNlI=;
        b=j8ExbNRkG3Iik7bMU2m/JwfUJampkILsqwnLGyB8HLgH+R0L/9zQ0zFedKwZI4+2Yy
         n47QcrVa/O6lbEQErvKnaD4KteNmZ4hIalZX/KMg9HvI5KmyzmvfgfzAElDMxolto+lN
         KLbHEnDo6huG83GHklu6zzN9mxRIfh8uhOLoeIYvkJHrYWCOwNYyDTHDi3NJTe5Q7Qk6
         LxsN4HHrm7hi6NAiXidKfAkdg/reNA7Sdv61fJgh2y9swdDn9+1n3yL79FwzxQeVyiSk
         EVX3QMqRI/44H2TK9A58kAaN8QHacAg9tiODvSh7b9t1v13cqKT63JCytAna72AtK+Yu
         QvsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774106044; x=1774710844;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=b0dPOF4xiw7IuNb1HUM62WgP+yaSzJ+Mo4AOgVNzNlI=;
        b=UDGOW0hOvW1tSh8DJMqrrBDbDAhsexs9jV6dhisL6A0xfdxzR1u85cmsIAgUsH/ofU
         iQGFukgoigc+1xCnpRnmI0Pfd+YXcfOLAwhBTuwXhZ8/beGvrGDGjZtN+pDmMQ/aMjw5
         1uipKVH92bgw6L/aHPMI7o5UgUhxpW9nw9jADzsnNDAF8JvE38xjex9LYXg5Qv8uS1CV
         m6Id7yqf4iq5pFCsuR2Up6Ljw0iu7datg2Mp4LR716NSfeI0qT1iub/40+FnHXpMq5KT
         sC5pc2NHttN+m6Ak45h83MqNfvYYxSzJDQWitzEL520WNIOui2BfFoYQFx/jZ5Qyv/49
         pAtw==
X-Gm-Message-State: AOJu0Yx46ZS1Chf7ld8DcUGhhUFanaDs9v1XDn3VfeNTAo35WaxyOY71
	PtAkRaESIYVrHVIDEIsniCB+CTiRvykQhpmV1unEX+vENoSTDenyMlSk
X-Gm-Gg: ATEYQzwgDuij7igKlZaGa6okNkuecwsrShWgMeupf5xM7OKwUXphvzjQPC5l0kd0IhH
	cSpbBlwNYNg44KmiXqKvl6/40sATpxAgcnrZAdnnMRX5TIJQjoezOPYjHiLxcsJEVGTtSVjrqD5
	/EjzTXdE/onFDwcmd/cRExyo2bzepDXwRXAClKFhpeDQT3sYYVMhEMhgYIdLFCEfFNmWfoLqQCd
	aKptxRxfZ9TLAeLkEIuUZL+WLQofwQn0VENzUuHy7sM2graaaclF0vhFUAZ78vaerZrdsOY70OJ
	+VCEWlUiOY96PX018chUhYenxy0u9W9UyTGWGrVFLhbPQ9NT85xbArws2UwwXyaxoDkIV4Hs5/a
	BmJKPlBsZaAgYob2n44aTzxJZJ4Z210/ZyVz11Py+R4t3D0XUpBlJX9s23DT4++cA2UY7GhV/Bx
	eQ+S1H2ZN9fLH7pwj6AoS+wXsxZCUVMx02XxUn5GQ+tnXO0XOUXRPzlMiCvIo=
X-Received: by 2002:a05:6102:dca:b0:5ff:e0be:f518 with SMTP id ada2fe7eead31-602aeac959bmr3424056137.6.1774106044381;
        Sat, 21 Mar 2026 08:14:04 -0700 (PDT)
Received: from localhost.localdomain ([131.255.96.168])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-602afb4ed6esm3186753137.10.2026.03.21.08.14.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Mar 2026 08:14:04 -0700 (PDT)
From: Marcos Andrade <marcosandrade95963@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Marcos Andrade <marcosandrade95963@gmail.com>
Subject: [PATCH 1/3] staging: rtl8723bs: rename rt_channel_info members to snake_case
Date: Sat, 21 Mar 2026 15:13:40 +0000
Message-ID: <20260321151342.19864-2-marcosandrade95963@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260321151342.19864-1-marcosandrade95963@gmail.com>
References: <20260321151342.19864-1-marcosandrade95963@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename the CamelCase member names ChannelNum and ScanType of struct
rt_channel_info in rtw_mlme_ext.h to their snake_case equivalents
channel_num and scan_type.

While at it, fix a pre-existing whitespace issue inside the struct
flagged by checkpatch.pl.

This change brings the code in line with the kernel coding style
as described in Documentation/process/coding-style.rst.

No functional changes intended.

Signed-off-by: Marcos Andrade <marcosandrade95963@gmail.com>
---
 drivers/staging/rtl8723bs/include/rtw_mlme_ext.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
index afa5631a441a..998841ae5655 100644
--- a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
+++ b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
@@ -322,8 +322,8 @@ struct mlme_ext_info {
 
 /*  The channel information about this channel including joining, scanning, and power constraints. */
 struct rt_channel_info {
-	u8 		ChannelNum;		/*  The channel number. */
-	enum rt_scan_type	ScanType;		/*  Scan type such as passive or active scan. */
+	u8 channel_num;		/*  The channel number. */
+	enum rt_scan_type scan_type;		/*  Scan type such as passive or active scan. */
 };
 
 int rtw_ch_set_search_ch(struct rt_channel_info *ch_set, const u32 ch);
-- 
2.53.0

