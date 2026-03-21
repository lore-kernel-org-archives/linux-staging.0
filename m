Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AD362264D6
	for <linux-staging@lists.linux.dev>; Sat, 21 Mar 2026 16:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774108972; cv=none; b=PU/Im5r5ijYm+Et9/gRYO/T1hIM0HYsm7+AIZxY0MGYlqAebAJg/2sxv0HnbdpwzlmXAuSVEH3K4+ywGs4VNFgzB2ZXJHhjibEImSfGrTcS6x4DsFi7hjXL4S6gsm0KWJKYZDtLqmi/fZC2Tuh2yj0CkGVTx7vj8oxoXMbYX+5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774108972; c=relaxed/simple;
	bh=mG6b+Rx/lnmrOQAnpWXOxLOxEdptnRAkIx5mapBT80Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Sfi1vnUFmiMsEusCqzvbSmQ/zTLfS3rLdOQZffSBOTEW9j3D2NsmQl1OjNKTTG7BrLXaAOf3u5ePAfLdhmuWyfqh9cA/2pkclcojV/3QQpgHjz/uz/+F1jfvxKpqQrQkhY6TuuczYPy6JQg9cBYVkAmUwDt1/xyZtC/kRQkyFZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CkfTxMPQ; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CkfTxMPQ"
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-56b7e5dfd25so2690104e0c.1
        for <linux-staging@lists.linux.dev>; Sat, 21 Mar 2026 09:02:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774108970; x=1774713770; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b0dPOF4xiw7IuNb1HUM62WgP+yaSzJ+Mo4AOgVNzNlI=;
        b=CkfTxMPQVOJg3Glwzc0biRYwMjNiaT55Hktq4IA/Ejzy6S2SZEht3nXCtcJPsqWJCD
         1MXgsTKylCRloYBylmNjaicILlzOFbui7gyOjKzHhszAQr4D9oL85d0KA+o+i7yFwukL
         kNI/4nDhCb0V+gatfhNg65/P3aIYiwsBfNngaoVmKqtiQlmfCPKQisAAO95QoEBV9FFB
         Dj4e6rggw5cDhNSEcK5CiqUsTpQK+wM4FEcQe2bxIWVv9IdL5Qhbfq1PPs+nma8j3NA5
         7ulZ0trTyq6GX6PTVtTMA51zm+YfffeLZ8OaLN5jGvJlPGFyUQ+1fE0Wmtk7dBpZxAsH
         h1vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774108970; x=1774713770;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=b0dPOF4xiw7IuNb1HUM62WgP+yaSzJ+Mo4AOgVNzNlI=;
        b=k2AQxIHd0S9TGYOfNKALtnic01d1LNX5mO/YI3OiW6SPsHwKwspN5o5PLeBRbuLwdM
         knbubS1vxaUPnLM6ZIGGJLZJ0ymnexpvAQK0Sb49i/lnnoOe+M3iQ/SJwXXKFlm4vT26
         kQcT6gy0iby+ueqBjvzKmeaw9WBFOAgL5b2gEPLAbt7FXryx08PCwFDGdWb7tkcrWxqO
         OnE75Z4q26iMWmfhXjErnAYp5H/EZI0hTWh+7Qi2Hv/Kd6RqACWJZDdkkYQZQDP8PJ2R
         sgnV3XKEeaaJd3d/rzSf6fo5WXGQfK6eqglAEX8LkF2JUl2/VmAev57WyqP6EyrX7yb1
         BP7Q==
X-Forwarded-Encrypted: i=1; AJvYcCXZ9Ue9wSIbLRCyookWUfKR/WCNek2TMa66aO3i9na6ZO/g3mPPIhPzz9OOnDb2x6+I+wqyxXIt87HgQ2Cv@lists.linux.dev
X-Gm-Message-State: AOJu0YyX7RV+PACL6RevtHyDOmInHzHQJCXqZ8qYsOqpHgvscnwDKlbD
	0RYCCN4ou0XuEsj9l/9Z8gWFbQO8acdJNE4UV/p4uHaVIoQi0/OZ2F5I
X-Gm-Gg: ATEYQzySXnvrqx7To/2HxWUwCu4OJiVNBRvRJ0FK5MWKGKPyRADV85RrW+ZkLEbMCzf
	VJWk6kZ87r6oEk+VGPX3EKenakEhsT1cqMq6WJHQtEJAZEuz7nltbXe0vEiTz/dNT1o1UxeJEFK
	A1VVVjTUcaryQETwdXYZcUBkOZdGjo8Jjx4wGmnEALNSOQSO7Q347Cgj+C/TvwO0FxSqSs52xVD
	+CZW+EIhtDT/Bk4mSNak9UoBBBCJ2lZRAxtMiQjU7jj9rX5u7YnD7IEt7YNV6267OCmCjA8N8qL
	6AS8ddRosbwJAOjA+rZBliVnQjklwGX4IoeS3APbekwtbEukarta0JA0vG2eR0bpjH/SwYPnTXG
	va/HSeK9wJezTrcSmZZ37CcNGHOeCxG1bXTHw+F3k2XuNxsHt2YSE9KmQyden7g38cYMVo/HS12
	eiJoaJCJrgmfAaiY4pkUWu5dN/8zr5ARMoQu5CVIjGuEye0HqP
X-Received: by 2002:a05:6122:6090:b0:567:4f98:fb82 with SMTP id 71dfb90a1353d-56cde08d915mr3269195e0c.7.1774108970050;
        Sat, 21 Mar 2026 09:02:50 -0700 (PDT)
Received: from localhost.localdomain ([131.255.96.168])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56cddcc2d60sm4829916e0c.15.2026.03.21.09.02.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Mar 2026 09:02:49 -0700 (PDT)
From: Marcos Andrade <marcosandrade95963@gmail.com>
To: dan.carpenter@linaro.org
Cc: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Marcos Andrade <marcosandrade95963@gmail.com>
Subject: [PATCH v2 1/3] staging: rtl8723bs: rename rt_channel_info members to snake_case
Date: Sat, 21 Mar 2026 16:02:16 +0000
Message-ID: <20260321160217.36060-2-marcosandrade95963@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260321160217.36060-1-marcosandrade95963@gmail.com>
References: <message-id-do-email-do-dan>
 <20260321160217.36060-1-marcosandrade95963@gmail.com>
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

