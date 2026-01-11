Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ADD522F755
	for <linux-staging@lists.linux.dev>; Sun, 11 Jan 2026 18:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768156628; cv=none; b=Z3PyPya/TwtfrNgJuIHyDddaIanXlgd7fwLAvrJ5K5BuSjML8DLNi8xUc/e7jAHnFaTn02jc79Y+V9o8k8mqj0Lsrgf4ugaGHKI4YJHd7M0ZlsGNuLajnxIJqS0mVM5UAw3tOnaTSqxZzGRJgeF/zbv3vs5ECADHisdX85KPUp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768156628; c=relaxed/simple;
	bh=WiDfx2+xHVXgQ1jHU8NIPBmhoM0mVs5YH/1n60lx/t4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gmtx5w+T9o0T80ZZZjdUK+HYiFJKBkvCzPM492zC6suBAx/sk8UCtkmqlO7ohn79mfJ2FN5eeZ3DDWjuLrkQAXS777y/DaoUJojuR/4/7HSDp78CVwSpMbeZWNTQsb7oIeYtLu4LE7ap2BGupar9Q9bfxIDpaEa5G54ICsbt4Rw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DJ9NS7Lc; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DJ9NS7Lc"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2a07fac8aa1so42856775ad.1
        for <linux-staging@lists.linux.dev>; Sun, 11 Jan 2026 10:37:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768156626; x=1768761426; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EG9bdI7JKr/mXXkYZf2TaV7kk43PmvfkD2O46Op3A/o=;
        b=DJ9NS7Lczd/j2veHCeS3dWd8CmPUvbvbwmKb+LhGMbS9lMMBMUP9b/r0GfpQgtxLGE
         0NohX5ifTV+QDcNRs7JD99EtlFcoDKiPG7zafsCvsnRXwvrYMx1uuuO2Wl5feMDUS77r
         7uRGMsqZC69a0EItwg7QBTZdqtKf5A9JEa1b9TmqI2z2doVjSAvO+AOZIKE9EVXQZw6J
         2cS8aDO2aEMSN6956CWzoZj9S8DsRjaypXnswN7TI3Xw2ostcVInP0pKfdf4KUlsQZN7
         Wp1zM0Vs+15Du621TsYP2woOx2dbfSOoJmN2G31YLAGA0bZDFofalmGqc+FGYB3R+mgs
         VKmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768156626; x=1768761426;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EG9bdI7JKr/mXXkYZf2TaV7kk43PmvfkD2O46Op3A/o=;
        b=EAtNHxtnvR3BDB+cXNp1ho9fgh3t+gA4isBxMfjbl6IQRGu2YY8BBMVY47hd8gZMvJ
         HWhkA7TwAcZLVLpw+0gC+iB1r8kaHDAzZ89+yexzoPGRhkTtEEquAOfjwET7Jc++kdbJ
         XZXJCQuzTmlu94IrfeiFBmyE9dpgkrQ8os/SQKL9xw+WVoof2rxzcAsJIPToJrD38GUh
         f7yW65LK92rArkx0b1pDtaFVfuXxbPvBXu6UbXbVYP2j0nvn3LnhWn99qbYZLgeCLVfD
         AxiIphL8LtEb2jYIH9r3ybmG+LuSfEwVES+l21my8pUE2z3EkOh7JILM9YOtglHjj5HJ
         1gAg==
X-Forwarded-Encrypted: i=1; AJvYcCU+iS1AXagX/5gr/GmFqlns7qOp9G4/WOH6/09mgTe2BWDDO3NerFYyVkQ+QK9A0o/Qmr9M+aFkXiZJ7eBC@lists.linux.dev
X-Gm-Message-State: AOJu0YxKNfHJZaCK53mFeCiik3VjV5GdACgm5jmBY1owsqPpbZkQ2Z0S
	mKZcaxlV/GlrAriTDg2cPjWZpAvU1OZ/n9SOxaL3TD0vPmRaZsO+4z/xKrUwtABrip4=
X-Gm-Gg: AY/fxX5JpWJ3i8d9bbOAx3pif7T7jQh+vGFhbOt9zY0AmLs2xbkb6GtBt8ZDLh/Bvy2
	Y036T0Zjl7UAwlLHqsH5WGhYqeI/0vHHH/nKgk7PyMRHnmtGuMJmH0S7l/pcks6y/2yl9bP94Ug
	eDX4LVAq65zTuYIri2ptgeMVt8FYp42LGmYfYGgOmWZhlaFyV2B3Q3aHQ95ENdhVk9Ay/aWQk+X
	iLNwnteudRaEfFbbS95X7SCfKbzH7fxQhWYmy1AVi9QTimqOZKY4ABR5Ne00+iGMLtc0vo8nTXR
	r07W7664CqU56xwWt0sWTmj//dy+BNON24XwPRHwivytVAyLbSzHcrkj70tI/S/xaTe81RJrHrc
	PHZWgsgBZfuByWB1rrOEIzPSPk9L6CmFGKRqkoZzQrlbLRaCVaDwhXL6afRrAlo8kD4x3n338Ps
	Qk1a7qzTq2dokKZi1OBrjZ5vuy
X-Google-Smtp-Source: AGHT+IGxQwO6oswqfRcYdwp83ClGBVifgsK74s8oNb+HIUlNTaakjy3C210X41ZiYTWEz7XcxcvHVQ==
X-Received: by 2002:a17:903:1a6f:b0:2a3:ee53:d201 with SMTP id d9443c01a7336-2a3ee53d218mr162357255ad.12.1768156625704;
        Sun, 11 Jan 2026 10:37:05 -0800 (PST)
Received: from snowman.bbrouter ([43.241.121.48])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cd2953sm152220415ad.86.2026.01.11.10.37.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jan 2026 10:37:05 -0800 (PST)
From: Khushal Chitturi <khushalchitturi@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Michael Straube <straube.linux@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Khushal Chitturi <khushalchitturi@gmail.com>
Subject: [PATCH 4/9] staging: rtl8723bs: replace msleep with usleep_range in rtw_xmit.c
Date: Mon, 12 Jan 2026 00:06:25 +0530
Message-ID: <20260111183630.12816-5-khushalchitturi@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260111183630.12816-1-khushalchitturi@gmail.com>
References: <20260111183630.12816-1-khushalchitturi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace msleep(10) with usleep_range(10000,11000) during xmit
buffer reallocation, as msleep() is not suitable for short
delays below 20ms.

Signed-off-by: Khushal Chitturi <khushalchitturi@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_xmit.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index b0a16130a883..3767302362d2 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -128,7 +128,7 @@ s32 _rtw_init_xmit_priv(struct xmit_priv *pxmitpriv, struct adapter *padapter)
 		/* Tx buf allocation may fail sometimes, so sleep and retry. */
 		res = rtw_os_xmit_resource_alloc(padapter, pxmitbuf, (MAX_XMITBUF_SZ + XMITBUF_ALIGN_SZ), true);
 		if (res == _FAIL) {
-			msleep(10);
+			usleep_range(10000, 11000);
 			res = rtw_os_xmit_resource_alloc(padapter, pxmitbuf, (MAX_XMITBUF_SZ + XMITBUF_ALIGN_SZ), true);
 			if (res == _FAIL)
 				goto exit;
-- 
2.52.0

