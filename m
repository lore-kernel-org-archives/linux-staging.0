Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0530185E4B
	for <linux-staging@lists.linux.dev>; Sun, 23 Jun 2024 17:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719165469; cv=none; b=r6bWrSWZtsIQeYI3hKC6Sc015x5P4dR8+K/+r1FTWmKUNsQxOABSIChOPgxeGbjP7IdIkHTobsoBoh6+hEsHGs1AAFFngx3DrOmuFTXc+GMDJIW5wQ5fOHWpGMrFp6rbIoGvw4UBHsBAqJJThn+meAPo4GSwY2X/G+YlUnlDVlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719165469; c=relaxed/simple;
	bh=NTLc4h+KThzf9mFv6Fg5yEB7AruJUtNcLCpsMeAq2oA=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RTPqKIftYb098HL0Yqbu4MvzIykfjysutXgX9geiQwwCBomXsYb69nOr8AiPwOGqDSNSOhh4PWjODa3cHZRG43OxkVm2UhGlFqFalhnQmVNFmV1E76tfdZOMOw9IvMoi3isExt/n4Y4mNmLOzjmWrqmoXIINQJzZhuTU0+Ff3k4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LR35OjNV; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LR35OjNV"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-57d16069321so374226a12.2
        for <linux-staging@lists.linux.dev>; Sun, 23 Jun 2024 10:57:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719165466; x=1719770266; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Yb4kTu6hNN/Hzk3FHpOo3xTLDzrXJVku+1K6/EnMaMo=;
        b=LR35OjNVaMORpOniaQCTv6AloEyu7XkQtbi0YPC4O8pdIADdnsqfHaUzyaXfC91EOB
         4Bjp3keA1tMadUY/9ZfgJSCgPA+t000OKCdlngJ+k1dW3pKK+BclEEEOwyfwj6KqF0Gc
         e9K6iHFTeEAGXd3ODWDJWvaLcokbu6qgGHbvKlLncv/EqBRzLMH0/lV8dMxYL7cX/9/j
         4OwVBYcuOHh2Rj3g5UKJghT/NUcBXa0CE0HVud94Sf/F94lB6qn/jon6rayYbIsFaBhc
         8QH5qDLYdrzqByc70/6es605/MOV+AkUd4YpsIiPlu37f8w/hYlZ18aZHr2fB5Dcn9Qy
         AYDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719165466; x=1719770266;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yb4kTu6hNN/Hzk3FHpOo3xTLDzrXJVku+1K6/EnMaMo=;
        b=qeonoxydgPmK1jNagFLB2bmOrl9Nxeh5K9VQwqY0XVG9M+Z9nIhWG1aXLDes2a2E4q
         cwUJmW8UUBjUxBkUi6rKv3lDTybCj6UUtFBGETyV7QQ+O15su9d93rKnR/gp9FdJKeaP
         pnq0nByyJTBfe8mu7y4047YWAq0v9dpEyXtvPTamxPQKPlgqDSiPhe2JaI8nk3zA7Qt2
         q5Dhn/nTFOF6hZ8OIMeMF57opCN1bcWdZtNUkjz2OpU/yKOjmLFOTeMfXrx35ilH/2sG
         d6HMaZVcrzcB5y4ZvyXC8U4vR6Ao1frkRAnDEcbDJGFLxHZfVyHAw81N5UlyI2Qbai/l
         Cdcg==
X-Forwarded-Encrypted: i=1; AJvYcCXgmWjVZRcy1s8DoSQGCPSxaIybmF326eK+prV9CPTmp5x11Yn48WXhlzu4ylYTpZKlDSE46hRdCGQbwTVMrvrnYyxqYaPLelVRJDPekQ==
X-Gm-Message-State: AOJu0YyCfJhAmMQU7xY40n+UAc65WhNTkXsKBlAF+BKBjM8UkgmDOFQN
	fHatSiwmfeyolGy9WoHiG/z2hEKTjUR7figWG9lqJywufnkhLLNE
X-Google-Smtp-Source: AGHT+IGMYD9SWxkwppWarlKxotv+gbDdJdqHKHIfqXILS+8v8mWYQUIxFgpQJqxvm5ZlihYheOX4Sw==
X-Received: by 2002:a05:6402:51d4:b0:57d:43c3:842b with SMTP id 4fb4d7f45d1cf-57d43c3853fmr3074243a12.2.1719165465958;
        Sun, 23 Jun 2024 10:57:45 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p57935a9b.dip0.t-ipconnect.de. [87.147.90.155])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57d30536dcesm3719483a12.63.2024.06.23.10.57.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Jun 2024 10:57:45 -0700 (PDT)
Date: Sun, 23 Jun 2024 19:57:44 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 08/14] staging: rtl8723bs: Remove unused macros in
 rtw_security.h
Message-ID: <59d13806a66afc571c9a7082f9436439113d3231.1719155208.git.philipp.g.hortmann@gmail.com>
References: <cover.1719155208.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1719155208.git.philipp.g.hortmann@gmail.com>

Remove unused macros.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8723bs/include/rtw_security.h | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_security.h b/drivers/staging/rtl8723bs/include/rtw_security.h
index 7587fa888527..98afbd3054a4 100644
--- a/drivers/staging/rtl8723bs/include/rtw_security.h
+++ b/drivers/staging/rtl8723bs/include/rtw_security.h
@@ -22,14 +22,9 @@
 
 const char *security_type_str(u8 value);
 
-#define SHA256_MAC_LEN 32
 #define AES_BLOCK_SIZE 16
 #define AES_PRIV_SIZE (4 * 44)
 
-#define RTW_KEK_LEN 16
-#define RTW_KCK_LEN 16
-#define RTW_REPLAY_CTR_LEN 8
-
 enum {
 	ENCRYP_PROTOCOL_OPENSYS,   /* open system */
 	ENCRYP_PROTOCOL_WEP,       /* WEP */
-- 
2.45.2

