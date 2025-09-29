Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1ACA2C2375
	for <linux-staging@lists.linux.dev>; Mon, 29 Sep 2025 06:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759128660; cv=none; b=jvsQC9CNYZM5AmMzUxWdQYOqY23NmifWZheEvG2O5x59SMRtXcF0OKHHFxS4YKDZrb2EoHNG0Qx7ZHDwLegP7+/XkpkG+seZw2AM34AL5vKpWeUvDWFDaRnziRPsAMhIuOKre/pFVyoByOf1GMg77d52QitkYvGfLdzcN23eGx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759128660; c=relaxed/simple;
	bh=sVKXAhqtYzmhPhGaAvqO8hHWIMq5fSBKZkUUNjQNhG4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nTs0GQrTyD4YRe4QfTntesTLah2Jje+9IbOYvpn7gihjECPmniqVCQSQmgP5tqa75mmFQwMFhcsl5gniZan+4IMpf+lDXLu7bZShnepj7pyfYManx4wuTIcCgjVND+nQFdhXgviQX+GA9ZcV5rbD9LJ0PwNrT6bvAvhYRHVA08k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zkt1eV6I; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zkt1eV6I"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-8582a34639aso280518585a.3
        for <linux-staging@lists.linux.dev>; Sun, 28 Sep 2025 23:50:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759128658; x=1759733458; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wyZgeBfEA3RIwZlntNk2i7xrS9inBs6EU9J9QRfIJiE=;
        b=Zkt1eV6IdsmaoR6v8hGWShu36m7W0BWQhUy6SPf4Zq4y0mV/Jl/uCmuXAYe6t2DdNo
         eUbWjad/qdzxxIWvmtdFPaAWYf8O+nii79zaT5l73ZyvRRyc7WV6hIEd64EoYbvfzZoD
         XQcOQgfbrmivXI9PfCa82aumLPS3lsCSbPHTT4Nr0j7lIF2OltIfFPkV4AwRPfFFDYwE
         +W1wnyVMaj7P8EEbKKbvHlOGRGHy6SWqPVR0W7b8+QmZ6bN1/PH9SPVSCiZZQOdVkAmQ
         BLmCvgORfY/1AH8xOtsyfXvaZBpGxIkA2EnJctenybKh3ahQsYp0qx/6immubtLad3sz
         dyrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759128658; x=1759733458;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wyZgeBfEA3RIwZlntNk2i7xrS9inBs6EU9J9QRfIJiE=;
        b=Vesn4EBrXWg9zSu5ybT1/sJgEGxycl95qMZu5yY+RpVaRdA0WwNVF5JtmXD2sfpvo+
         BHNCmhL/1G4iNDaSfUuJwf2wCaaDjUMR1utYtWBeDeA3sYlHC4BoOmoqT7MYfCd3G3CO
         cO9JbURAsY1UwWZj8+XpJPczvivK79EfMKx5Hsz5BNehM199kM6d/GSAcwmE3c9zjf8Q
         sKnrqNEho8odT68bpQxUTU90bBKnk4s6cW3vsQr3U/hVYv0b0Fu/uDoNeJSj5mqDBjLo
         DYLQasfoqCK4e7HawYHK33I5m/CTx4C0vos/bJ1UrJDCO1iWhUopfG5hKwR4X7HWkaCB
         UFcA==
X-Gm-Message-State: AOJu0Yx6HtPA1bznrBtZxMVAmSUUdtBD4SWFg6d8v+WhSjVi+M4hh8jV
	bbrCx1TotPknK7/ekSl7xCPX+VbsrjI0j4cxUiasasHajnTRC0rH5cMM
X-Gm-Gg: ASbGncuMZMWi3KOxAUxxBTWiNtqLUY0Uf4VkN5fr7e6hMj02eKpKzFMxYRzbZhFGWsl
	bvERVUoIbDvw71W2V9reuZs9lAfwQdUtO/T48DRJMu3JK7DYMMn4pvX9XsYVLDblVYXbacQqEgH
	IxAU9L5N/7Yj9JibCsgU27eCrHWENkeMRH/5nLXZRkjW2dNl3sQ97SEsJ5c/OxzFY489mIz1XJy
	NvXJ/izUTgLaXv0Kw6c3wnlPRzyCFi35FG949yx2UgKU4XUbjgHFQMWDKUxTtde1RNaclG5KP9z
	EWyQJdLJXnfjkh/04ZlnIZwq0Ip6RCkMDS6aoc6sUnMZDaCPZM8YjoMgNDnsjhwXP3v2B5nBd23
	EZfree+6vVtirSwSWIxDENJP2LpkwUxsP8lDPnWM66iziQd/NENAWv4Vv2dGkUs/On2EaO0O0
X-Google-Smtp-Source: AGHT+IHXbv8Z/DvST7PTSOrUyDPAMEUINlt2IXgFylEqS+yRk5IsLd+EAEVeEyKGV6STYUyWto7Qlg==
X-Received: by 2002:a05:620a:3188:b0:86e:21a4:4738 with SMTP id af79cd13be357-86e21a4478fmr17891985a.13.1759128657607;
        Sun, 28 Sep 2025 23:50:57 -0700 (PDT)
Received: from linux-kernel-dev-start.. ([159.203.26.228])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4db10874bb9sm69517671cf.24.2025.09.28.23.50.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Sep 2025 23:50:57 -0700 (PDT)
From: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	vivek.balachandhar@gmail.com
Subject: [PATCH v3 13/15] staging: rtl8723bs: fix line ending with '('
Date: Mon, 29 Sep 2025 06:49:58 +0000
Message-Id: <20250929065000.1010848-14-vivek.balachandhar@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250929065000.1010848-1-vivek.balachandhar@gmail.com>
References: <20250929065000.1010848-1-vivek.balachandhar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adjust formatting to avoid a line ending with an opening parenthesis,
in compliance with kernel coding style.

No functional changes.

Signed-off-by: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 8879d7056324..741c7dc83873 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -1113,8 +1113,7 @@ static void rtw_joinbss_update_network(struct adapter *padapter,
 	 * ptarget_wlan->network.phy_info.signal_strength instead (has scaled)
 	 */
 	padapter->recvpriv.rssi =
-	translate_percentage_to_dbm(
-		ptarget_wlan->network.phy_info.signal_strength);
+	translate_percentage_to_dbm(ptarget_wlan->network.phy_info.signal_strength);
 
 	rtw_set_signal_stat_timer(&padapter->recvpriv);
 
-- 
2.39.5

