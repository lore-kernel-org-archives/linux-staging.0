Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC67B1411DE
	for <linux-staging@lists.linux.dev>; Mon, 28 Jul 2025 06:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753684537; cv=none; b=e1c5PsV/DqkeM56mFGMrC30Q8EK+dOh+a+6R6cepxwEqdyxqCjxO4YjZuOJbiC+Y0i03YafofZiypofSv8yIcaYQT5lceJeHaAoVYS+v1k9K269q4oIOB1HXkzltMKdae/rQAvw2cn8+qzH0sM8oUZ94y3DCF4g1uFzC9WwLQYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753684537; c=relaxed/simple;
	bh=+fXDohrWMWo9G8EI9UAt21V6WgzDKIUmV2hR2xxLtzQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=e+Z40Dp4SqDm2stfVeq8Keps+G5hGOphIkX20xAfPJRTX6FYcJp0eB5QiJED0qwF3y1GNRCvc37+JZHf2e09EsUCtbUYzbHiGTdDPE0qF6UnY9BDn9lEoBUJc+j4lvd644v3Eo6iBDbb8HQ8M5uG/DdgqzKzm2lhYNc5B6cQbxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bbwEp1Mu; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bbwEp1Mu"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-4ab63f8fb91so29052601cf.0
        for <linux-staging@lists.linux.dev>; Sun, 27 Jul 2025 23:35:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753684535; x=1754289335; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JnJj4JAljjvMTcZBxH8ZSi1hv9zlYq3kQG99bS/CAPo=;
        b=bbwEp1Muy/42KQKDU+3m2z5+YCsKqzQ+HJRb7MoqejfqtIR/Se0zlpR/6PMPT+QDb+
         JY9zqBv9gNlG64uTEHoSnoT+qx8VqqIlLUWT2tXWG0tQk5q/GsAyvvsWQG+dkO/kPYHE
         LlO4nJYUPAMjkDZhGWQZjWoOPtoe1XajZdToUP7FjEgtrydHlHOBETM7vUioRIRWEojt
         Nilt6fKHSOy78V+R9nx44cKmmXhrTt6FyBqbeSOy+D4XfEhdVvtDyJV27D5j1fw08jH7
         yRK8uMjOaxkwQGcZCYoFcAeidakQxX4Fyhgi49LgNCxzVzK/N5b7vkm9KN+v5TzpC5Gf
         hWIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753684535; x=1754289335;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JnJj4JAljjvMTcZBxH8ZSi1hv9zlYq3kQG99bS/CAPo=;
        b=EtSMLr8/3TT/eV/qCIldrvSncT2DlxgDFkreV69CiKf50m85Pj46q7BsZjpQbWY7xS
         LYj8wIghqlox3NeV+m8ibAYDixr2nVfGfTuChJMrBlM4ulrBikr5ZhocIwVdFvGKd1Iw
         ocZduknl/+1N3YN9RSS044qQKjod9Z5lrseEEaBsB+TZO2pg55VSMq8Sq+W5b4498SPJ
         JTEwv/c9jhcWjOsjNVJl6TLGHktLoeGkdLGey7C2DwFmwVuVMQFpHqyQ0DQJ/nJQkCXk
         L5oqfdtIzftAW9inTJGPdKmA9VbnXAoXyQdVtRO6SJtI51S1KIv1PpDWj8/HqCXr1tNX
         Mn1g==
X-Gm-Message-State: AOJu0Yx8GaGrP/A9vQ8wdvdOHcmIbh/zo1wNSBc0eXouwhtBNifbruyU
	9hZecaDPTgHgR9F6fvcbk1Ynj6LigyLyD9uK2I2KG0TS2/xINJ5d3OaTG2kEeA==
X-Gm-Gg: ASbGnctcx9rnKSMdZy+3CiRw7ROP6xuH9+isBkGeCdFo/wY6M9JKnrP8o3h2ncm1dmf
	7pSHknR7eylAr4XAtCL/obO0PqJTmNvcR8yFBCkLC01C0Y0aXvpXN3NwTEv/23CWNUvk6Gn+ECq
	diB3oIaBU1+77fW+pWAl/8/gTjCm+csM60CVR6QmF6L3Hdna7H2aBrH95s39XjSWhZ73GeKXJLR
	vgECdJokkhyYPzRFcMlhUHbC5ejfMKAlfj+f23rjXs3z+H3M7zTMQ057l6oTb1sU6YK5takhxGd
	H4BraXwkdP1A0IM3o+pbaSzdgQF/HPej3rGNpfSOGFu5wi5/+ZdvYz+ppUZ5ANkHqye/ZwNnZBO
	RFLyMeriUdPXhah1Kq0UMJDGf4Z5vfw4+LoyDxO5UBBho6Ii+uUI=
X-Google-Smtp-Source: AGHT+IHkIrJWx/FbtzBKxauRdVEfXuJLg8qiUDLkKh839y0eXpuhwwiXmrYE+HCfGM7zV2yuyOjivQ==
X-Received: by 2002:ac8:5d45:0:b0:4a7:1401:95a0 with SMTP id d75a77b69052e-4ae8ef1b433mr148830851cf.2.1753684534328;
        Sun, 27 Jul 2025 23:35:34 -0700 (PDT)
Received: from linux-kernel-dev-start.. ([159.203.26.228])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4ae99544c17sm31612571cf.16.2025.07.27.23.35.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Jul 2025 23:35:33 -0700 (PDT)
From: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	vivek.balachandhar@gmail.com
Subject: [PATCH v1 14/20] staging: rtl8723bs: remove unnecessary parentheses in conditional
Date: Mon, 28 Jul 2025 06:35:10 +0000
Message-Id: <20250728063510.422849-1-vivek.balachandhar@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250726043218.386738-15-vivek.balachandhar@gmail.com>
References: <20250726043218.386738-15-vivek.balachandhar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Removed superfluous parentheses around a function call inside an
if-condition. These extra parentheses are not required and violate
kernel coding style guidelines.

Cleaning them up improves code readability without changing logic.

Signed-off-by: Vivek BalachandharTN <vivek.balachandhar@gmail.com>

v2:
- Fixed incorrect wording: the change was not around assignment
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 3702d7e7a954..d845eaecd615 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -700,7 +700,7 @@ void rtw_surveydone_event_callback(struct adapter	*adapter, u8 *pbuf)
 	rtw_set_signal_stat_timer(&adapter->recvpriv);
 
 	if (pmlmepriv->to_join) {
-		if ((check_fwstate(pmlmepriv, WIFI_ADHOC_STATE) == true)) {
+		if (check_fwstate(pmlmepriv, WIFI_ADHOC_STATE) == true) {
 			if (check_fwstate(pmlmepriv, _FW_LINKED) == false) {
 				set_fwstate(pmlmepriv, _FW_UNDER_LINKING);
 
-- 
2.39.5

