Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6E4521E094
	for <linux-staging@lists.linux.dev>; Sat, 26 Jul 2025 04:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753504453; cv=none; b=NDOeJ+AHK1i7eC6Ru5Y5PXXYHfaWROkBdI1tW+45v11pV+2VyqJtXtGfzCDaTGQdDBYR69A7D0qNtL63toieultuOrWh34vLUkzao+gjRwC5qkWxR2yI1nDEtHAQFlG71Ub16/ozv5J7SdLCIvCkIGCxCMJ6bH3e5RlaWKtggTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753504453; c=relaxed/simple;
	bh=A2/8GWYF+QSMZie/dthNKmgZayVxmihhCGf1guv1yBE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OelKn7eZuy7bZldw0BO/8h2vUATmvsNLlsq0LUzvYUZT0sOHxJ1rqMW+v2lbGaizqUkt+tPR6z8Av1ixUTkkBBdetRBQobxna3VMhNNF4AMQ4y8V8Ty1gJcaBGHuKfuz2APbl7/bYl/4n3YauLbrCRxeIhoAaALB9QB6t5Z8qYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q86nlYrP; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q86nlYrP"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-7e29d5f7672so248382085a.3
        for <linux-staging@lists.linux.dev>; Fri, 25 Jul 2025 21:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753504451; x=1754109251; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=godtxK4YgpknghXRHE2/UoeuQcLZlCjOGnevqfxGStw=;
        b=Q86nlYrPonrDOWumHQxftR/qUtsIaOO7L04IKt8Aco6WLCp7ts4on15TnVt9OxtMDb
         nGaYVuYdzjjVNyWGdDiBtBaIT2yqKMHTR1fPmvI6FEDObqZuS3Z16p1XddByuKydmqUv
         t/+JeM8FSdE5woXokmfuAQQGMj8EPhEbt1su0xwBc+LS8hvFbmfMwDVnjX0sImvbyzyZ
         DsutPBWWnfcZetCaiTJ3QXZdCgjvxM4kA99wbH4eZ4SDOfSb0BNbGE+3m3Lab7btyShJ
         yWkBkvUNzRoI0Xq0KixKWdc+wSZe8RoOa45uTevRCSXLmCATOSZCdP1pDZPAE8jjmqaB
         UxHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753504451; x=1754109251;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=godtxK4YgpknghXRHE2/UoeuQcLZlCjOGnevqfxGStw=;
        b=cKzUnI8RxujioREjM0x00FwEAQvlctf3MB54h44jsyl+nh789MbfTTPfagludLNM9e
         /JmYHO3T0oLE/g9DB37ct8jzdxK13RJlPsqbZta96hUv39NYC7YUXtOI41NueIevShZk
         I4l72y8EnW6ytIhetDpzmZZWXroHqyN7wvAsHEXJSyFzhORoLmjrcRkE2aCZVUb51SNp
         PNvUu8Lu+VwYGMEcVz0nzHLymr7Bc9C8eX8eHiF+1dFtQSBryct+vyYSsoslYm4akxGr
         Xr/XKg4peCWAdGfX/SboD4QDGDYoenbeE1YxH8z+TiLOddJfuI351lsY2jK3ArKFvkR/
         JPqA==
X-Gm-Message-State: AOJu0YwXAu8CWFGCABwq41eD0mFgWu68PGLkyhTY3cvzQGF/He9az+2K
	QgHFi365yt+VjdVNjsan6v6BcvF90ZEWWEJbS4GOOOf/mhoTXhDRCCVP
X-Gm-Gg: ASbGncswAS9t4EZu2rOYJXl5JDqDKRHNX43HEpN8v8MXDMktBIz5u8kBbcNXQOGSwxD
	dJrIz+U9qrjXAR+uqIydpxFhT24jIHu5/388CFJNCiqjBWnt8BbnDu+cMmNeDqaMAaoiLvy9G5J
	m/SixSQiNymRimtRp3Bsro8fOKL2A9eaTD8fnxWRYsMLgX7GK9UO6wR83UtTWiXPm05O5mFQsLu
	3X/N1I7+729psv7g2Y25kImmwsQ5oc6q7XbguSbxPIEw9RMNdr43HC5ijFP+IpqM/cPKJGjVbNy
	Z9Rl2JJlrv1nt5lxGEb9CSa8qupMZHIgGg5HrtPRK0EzW5rHTQeWmewPB7VqaMCiTk/7O0VHCXH
	xjANzHANUAfPAWi5DVOSL49h0m/LqXMTmwrc04doOApRDnvEy0Gs=
X-Google-Smtp-Source: AGHT+IFlRrWov5o//lGeMP1IXBjemW48lt8HRdPARmz3fKpiukwPkFA3HSPqzwF9A2FesESVi2k0QA==
X-Received: by 2002:a05:620a:710a:b0:7e6:28a9:daf5 with SMTP id af79cd13be357-7e63be3b659mr536419585a.3.1753504450787;
        Fri, 25 Jul 2025 21:34:10 -0700 (PDT)
Received: from linux-kernel-dev-start.. ([159.203.26.228])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e6432a885asm70322185a.36.2025.07.25.21.34.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jul 2025 21:34:10 -0700 (PDT)
From: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	vivek.balachandhar@gmail.com
Subject: [PATCH 18/20] staging: rtl8723bs: fix line ending with '('
Date: Sat, 26 Jul 2025 04:32:16 +0000
Message-Id: <20250726043218.386738-19-vivek.balachandhar@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250726043218.386738-1-vivek.balachandhar@gmail.com>
References: <20250726043218.386738-1-vivek.balachandhar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixed a line ending with an opening parenthesis '(' by adjusting
formatting to comply with kernel coding style. No functional changes.

Signed-off-by: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index acacc2806dc9..ecb7b3823010 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -1071,8 +1071,7 @@ static void rtw_joinbss_update_network(struct adapter *padapter,
 	 * we use ptarget_wlan->network.phy_info.signal_strength instead (has scaled)
 	 */
 	padapter->recvpriv.rssi =
-	translate_percentage_to_dbm(
-		ptarget_wlan->network.phy_info.signal_strength);
+	translate_percentage_to_dbm(ptarget_wlan->network.phy_info.signal_strength);
 
 	rtw_set_signal_stat_timer(&padapter->recvpriv);
 
-- 
2.39.5

