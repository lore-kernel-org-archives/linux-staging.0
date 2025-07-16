Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01F9E2741BC
	for <linux-staging@lists.linux.dev>; Wed, 16 Jul 2025 03:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752637093; cv=none; b=nkeFjuG3yfkUq43A4iy99fFmcPYUHIlXmkFD21J3M3Qy6vythceFpYELD//0HFXCJLMq2KMYut50+KLC2G5e66MBfDSCI6hAVgSXO5HCynJN/LCpy9LzMDKiveFVdPuCSNN4nJ7wTKimhKovC4XIwzKjmSEBMEDRMwGgnGq94PM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752637093; c=relaxed/simple;
	bh=YkOymsbrNFSkPHr2H/MLJ+sTTzLwp3OS0KBXDQCmCtw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NBcMb4F6x83z96yxmQeFL5T+DJ4Ad4BNDsxQl4twZrXZhS2bF53POGEECP43mDibFxF09zo678ZFQe8SBnn06oNlHjDisa6yznDfirp9sS8n4dQvk8WARSe4ntJAQ26GrMMDBm31gpoJjlEucJ6dRww9+8eVcBQNKRPSByprTBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J4cWEH9c; arc=none smtp.client-ip=209.85.210.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J4cWEH9c"
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-72c27166ab3so3868000a34.1
        for <linux-staging@lists.linux.dev>; Tue, 15 Jul 2025 20:38:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752637091; x=1753241891; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aTQYh3TSQe3Ke5lhkP3Kv1GZGvu8tMfK/edh4edU7rQ=;
        b=J4cWEH9cY8vbn1Pe5cXR9CrBdZHwK7rKpx9UTfskhLjSgAcbhLSrCZsJ0S082g6G8W
         W4iSHFL+YKU0dYjiqBfoL+0P08oP8Smq6Kcfckn69THxl21AHTki1DHa8qGWsF2ZeHhd
         LBIjbuUTsqjxNjQcdyoQ0JEvG9AgVKgTlDWmqdWcrBxeVo2l+xtpuQlRCRHM1/EhLiPM
         n1SrhpZZeUuFyZReqtEVyM+30GmSFIj7QLYKWBDwg2xFVGQM7JrgyiHKmMlharmHkI7U
         X63ULLl2+PomCqjQMeYyKzJROWsDnRek0bcjiSEHVTXpusUY9Mdru4SuniEfiicedafo
         1crg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752637091; x=1753241891;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aTQYh3TSQe3Ke5lhkP3Kv1GZGvu8tMfK/edh4edU7rQ=;
        b=V9RndcuGrJa82vcIt2ftBt7w9IBafAFSnsQj91Qau8iUGnKHJhl3qENNS9AcYAAajq
         Ambn3hUZ9Gt/F5z59+46yB3M8jFwY6WBUjwBZmdbGUJAfSg6l2ERmXF6PSqSjQjqMORw
         S8tolLeJAQ0Q5W0yXMCKGPu8EuRKJslhGn9jtT/OCXDdjJuFxvKMdG7H6MAHfAMmJhWS
         b1obIPau1Ll0a24bR33AUVudxTpEsxtwhlRZGf+pvDTniPySFSfGJ8GP8do5wwtBdHKI
         jhdN1v32sIemJd5hW9R2sD2HEYlRWuBpv/mdfFth+WaHJN3bG5CdExfW6tz2bD71SYSE
         thuA==
X-Gm-Message-State: AOJu0YwK6tG5NOVypNh5tg8rWW/lEOmzKv1fWR4cGgalwkWQyHHCFbtd
	wf19pnaOVZ1iZgJlAPR7paDU4ZAe4wYscm+obSI5rcAE714sOFfL2Dnn
X-Gm-Gg: ASbGncsDpQj/zppar4dPX9c3AtpywyhOqceySueL6VjVc0KTKW5y/U8Q68jxlCjyk6O
	P8zl70UJPag8Q5/bL9PoJa7FYr6xfPGRUKl7fyof0auTdJC9NvpZqff7K+RAi1iSbTLkodYVE70
	wAgBq3Hqf57a5Dz89Kn+vAAaAiKZBtqRPlgoQ/JQ0svhqRyS2jxrrxkoNwbaRRJT7FNZc6v00jc
	azkTJxx8m6I/ToVDnyWKMfRo9IfjThVaH1SL7P/02yWpVx6W7xl2M+IC9h9sSgRsYwmtC2hV+oD
	88TkbrDc+wHyY5nepIGKJyVEWTSMNshGtXlHzpdljjMyfpteKK0S5UdtbSTcQ+tNGlVEfzVlxy5
	TXHwHsjEQxmQVYEBXKZ+Uto83L11Zj+5ZkoJ4y1AzErgnk+KKkaXr
X-Google-Smtp-Source: AGHT+IGS7bx9+KmZh+bTEnWGO72xVs02ddqV8Ipzq9HBFxZ3uwMCtTt3ij/EF8xas3sKxuD/Z0KY3Q==
X-Received: by 2002:a05:6871:5895:b0:2ea:d491:eb45 with SMTP id 586e51a60fabf-2ffb244a744mr952449fac.18.1752637090920;
        Tue, 15 Jul 2025 20:38:10 -0700 (PDT)
Received: from localhost.localdomain ([181.161.11.224])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2ff116d22easm3140980fac.33.2025.07.15.20.38.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 20:38:10 -0700 (PDT)
From: =?UTF-8?q?Ignacio=20Pe=C3=B1a?= <ignacio.pena87@gmail.com>
To: Dan Carpenter <dan.carpenter@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Ignacio=20Pe=C3=B1a?= <ignacio.pena87@gmail.com>
Subject: [PATCH v2 2/3] staging: sm750fb: Fix function parameter alignment
Date: Tue, 15 Jul 2025 23:38:03 -0400
Message-Id: <20250716033804.59650-3-ignacio.pena87@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250716033804.59650-1-ignacio.pena87@gmail.com>
References: <20250716033804.59650-1-ignacio.pena87@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Align function parameters properly to fix checkpatch.pl warnings about
misaligned function arguments.

Signed-off-by: Ignacio Peña <ignacio.pena87@gmail.com>
---
 drivers/staging/sm750fb/sm750.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index d3bce107f..a896227ef 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -121,13 +121,13 @@ static int lynxfb_ops_cursor(struct fb_info *info, struct fb_cursor *fbcursor)
 	sm750_hw_cursor_disable(cursor);
 	if (fbcursor->set & FB_CUR_SETSIZE)
 		sm750_hw_cursor_set_size(cursor,
-					fbcursor->image.width,
-					fbcursor->image.height);
+					 fbcursor->image.width,
+					 fbcursor->image.height);
 
 	if (fbcursor->set & FB_CUR_SETPOS)
 		sm750_hw_cursor_set_pos(cursor,
-				       fbcursor->image.dx - info->var.xoffset,
-				       fbcursor->image.dy - info->var.yoffset);
+					fbcursor->image.dx - info->var.xoffset,
+					fbcursor->image.dy - info->var.yoffset);
 
 	if (fbcursor->set & FB_CUR_SETCMAP) {
 		/* get the 16bit color of kernel means */
-- 
2.39.5 (Apple Git-154)

