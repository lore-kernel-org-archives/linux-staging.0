Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C355339447A
	for <linux-staging@lists.linux.dev>; Wed, 25 Feb 2026 13:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772027911; cv=none; b=mNbswEH4Tt+lCa0aSN323ECsIiyRT9HwsEhv+3FzjFysK6lvkn4mu5Kwu+Dn/Af54JxQTmteglqC1VtuNGM8BgceAs2qwZSKihBHg5BpD2dedhrhQ5tc2DzoWPmR5SJ+xquY5dxa+OsEEBOBZjL1PIq5sC677DE2Kc/XqhmGTsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772027911; c=relaxed/simple;
	bh=vAM6MwiisoXsaeI9xVmBLciNpIa8Jg2C/TE17MGmem8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hlQMsqz2c9j5mS5popnQW5uzvSEBHIXtAacf24MF6Ejg7Wb1Up9h53ykxpqTRx2awiS1NJbaCgQXc5aBd1jwQ0O+tA6nZ86faIhjEHp/+w6ZKQC1aekugdVQvWwVpQ0xLAEWn/3VYTqZ6uB5uStsa+S96ZFlrzc1KaY9yzMLV2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rodrigofilipefaria.org; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h+nFPB87; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rodrigofilipefaria.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h+nFPB87"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b8849dc12f6so968875066b.1
        for <linux-staging@lists.linux.dev>; Wed, 25 Feb 2026 05:58:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772027908; x=1772632708; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=pZ+I5tTYo8qywH0o+xB0vg70mwQ2srTHcyAV+Y9dt/E=;
        b=h+nFPB87mWS+pOV6PlEfJOvfL+6Ng7Lw3b2wljB/qXiMUyKjvIgndqGFdGerwDBCsc
         enxTCFbFHAGtQ8z2hvlALt2l6jtleuXZNxTz6ybR7bKmWzxlptLwJfv7IoWRrNJQafGe
         ep48wCcDqksJ7JbPjB0Dm8oXEwNBTtz1kZqxzhhIXDqKPjY4XhGjlzBKulGVCDFhtliB
         u5Q7rIqstfX0C+x3FIasrupp/zdQoAYdInHUnPd6KynTaDQyQElTX9erzAYKqgov7UeO
         o4X2QMm4HjWH6FohzO5WMUQhGsmmYr6XoRsDY6SIkqxD15mYZSQrLour5rIrJH0ADH5l
         4UaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772027908; x=1772632708;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pZ+I5tTYo8qywH0o+xB0vg70mwQ2srTHcyAV+Y9dt/E=;
        b=EBMUqyxIHujYLpAgYhYi8ZKzVkSZvJkkfUPUMH+UMKPk1pUfAZSS+dKyRT1BI2qyYV
         +1RM818upu/Lu1rUKKoogaGp9H9rp5BqTTIOJAEZkeVxQSdq6KmYikPzDuTj2qzGUBnU
         ulY9iSvw/5J2jSlYihovsK086JzFa5z/OiFkcA0lKFe6RobXODUT8WJgOnk6ccEiwXEg
         7dUclu1FTgqWtKA5KbNNyOYacOBVd+ymHfyBqOY09BVzGaeYpTfz+V8kiUv7VnfE0wJ2
         iAkbEIVkrdL7bjFh1XsLNkt4e1GGxoVnEU/QBP+iq/wzs3PnZtKnSKl752DSGVyaC55T
         JjFQ==
X-Forwarded-Encrypted: i=1; AJvYcCWlyJDXRRkrv0ZI3V0E5bMMsAbtmE8AUshd0waBYlEMstD258d5m81jA8yR8kXzcoOxf2mfUkVXgp4cHrpN@lists.linux.dev
X-Gm-Message-State: AOJu0YzQr8VysirQl6XRnI6/g5bvMPjCNphQ61Z8zde26cNq6/G4/Hq9
	ESJL03XUNq608U/8Rt+seewTLwJQPonTHjQgxJgH1CeHmAcESlnFFJVO
X-Gm-Gg: ATEYQzwXc//zyDU96XsyXQeXpQZxvCdTv+OApinJpc98+qhjlEhWyrURCWGw1IPNGjr
	EM0Jlspn/jzTQnpIk4xchr+vffrqQo+KrWTDVzHLwl1fVZPkCY8XYSHEy0IP39pALt8JoAJqQco
	RgEs8efdMql7EQLTPxrO6sR/00yRXa1iltG0FHStBmaCl1A2xKH7zX4yq6D0zgLGZStz3LbatIK
	ZKkddoF5//gLvNOFlcIUnRu/VlT1aefrj658fTGfJwfRKRYAsTscknlPkS57jxXVUSzUoDoV6/j
	mnk41Jr1gsUJAOfh3uL4P7zXQFt+7wp7Ea3YDlSqHtZYYP0uabxXktm/fXTlc0BxWvWClpIBAsr
	sBAxf/0qirLDFV44Cj9+iGdKwLWq1fyV18BBg9Sjv1VIHs1AfFkTJBvSKFBP3vy1RIfJWgwEwq3
	VK+scXd6OKofvna8zjlnmQwp40hcA7skvze5Yy16/Y8+se5DeZyz+twRFcst9qBmYMR08=
X-Received: by 2002:a17:907:6e8b:b0:b8d:7172:1948 with SMTP id a640c23a62f3a-b9081972181mr1035895966b.13.1772027907809;
        Wed, 25 Feb 2026 05:58:27 -0800 (PST)
Received: from archlinux ([194.210.32.218])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9084e87c92sm525757066b.45.2026.02.25.05.58.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 05:58:27 -0800 (PST)
Sender: Rodrigo Faria <rodrigofilipefaria@gmail.com>
From: Rodrigo Filipe Faria <me@rodrigofilipefaria.org>
X-Google-Original-From: Rodrigo Filipe Faria <rodrigofaria@student.dei.uc.pt>
To: gregkh@linuxfoundation.org
Cc: s9430939@naver.com,
	architanant5@gmail.com,
	andriy.shevchenko@intel.com,
	ignacio.pena87@gmail.com,
	strnad.jj@gmail.com,
	bryant.boatright@proton.me,
	kees@kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Rodrigo Filipe Faria <rodrigofaria@student.dei.uc.pt>
Subject: [PATCH] staging: rtl8723bs: change msleep to usleep_range
Date: Wed, 25 Feb 2026 13:57:23 +0000
Message-ID: <20260225135723.60791-1-rodrigofaria@student.dei.uc.pt>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

checkpatch.pl gave "WARNING: msleep < 20ms can sleep for up to 20ms".

Kernel documentation says that usleep_range() must be used for
delays of 10us to 20ms.
msleep() is inaccurate with the values used.

Signed-off-by: Rodrigo Filipe Faria <rodrigofaria@student.dei.uc.pt>
---
 drivers/staging/rtl8723bs/core/rtw_cmd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index abb84f8aecbe..f6293f049c75 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -214,7 +214,7 @@ void _rtw_free_evt_priv(struct	evt_priv *pevtpriv)
 {
 	_cancel_workitem_sync(&pevtpriv->c2h_wk);
 	while (pevtpriv->c2h_wk_alive)
-		msleep(10);
+		usleep_range(10000, 11000);
 
 	while (!rtw_cbuf_empty(pevtpriv->c2h_queue)) {
 		void *c2h = rtw_cbuf_pop(pevtpriv->c2h_queue);
-- 
2.53.0

