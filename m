Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 768D279CD
	for <linux-staging@lists.linux.dev>; Sun,  7 Jul 2024 06:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720335282; cv=none; b=POjjZT+fNMOQGA0EteI+iZ5whZcW38lKQRirEhcc8q/Qf6hsiaaLZvR3ZeUHht46VOGnypOvZDgQvSRkPp6Z5s5fNE3LVV+yImIYN2hB+h7KR4QwmXh+HDss4iXJsfV9XQE5VHZuTRxC2ftogV74KkBwJLiSwo+fPlCCSz+37D4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720335282; c=relaxed/simple;
	bh=fl5JDEwJz6N1kP/kziK/6oStTJRXgZqlJ4YZD7FPgcA=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SYrFQ4ZJMDhdGMRn+Ucnr0X2zLT86Yggl27RJbg9Bm0/l2yCKVBVk9jV3PKbM9rYQl/UEEodi+lTtuRg0ngGsAjT1tCA9LDZ8YQPqgq+raUvmJaI18+LYmpwND0cejIhuFk6vy+dvCmWHHuNTGQkoApJm/fALFo49/VKYU/sf4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jOjMWoCX; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jOjMWoCX"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-42666a5d33dso270135e9.0
        for <linux-staging@lists.linux.dev>; Sat, 06 Jul 2024 23:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720335280; x=1720940080; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3wa19O5pYQt2ewjnjIco7NcYsEERZusPgocEP5T3ISE=;
        b=jOjMWoCXsmGkfXeBM9zTHUdS/3VHyLuc/gdz6IdvE5GBKDTORrRdYFuBzAlLpCMifF
         Ll+8sSce2pFTy+1nOHnlGabju/ImaN6thGp7O96H04oVmJONIQGuqIXzxFSQO7w6qF2e
         jx8VZO8UfZva5XLnlW/l/E4uqfRTvA6HLIZfE4CQE7JDoA4iAE4RLTRyHp5jKuKN9Xgj
         r9BlO/2tbYo1tItZoeZfPmJRw6kDtzG1TVPY5hCzOUmBYBKAhg6Pm7zrcPsu8KKSQZDk
         DdVOYxySK7kBCMIJeUZ2kKUVjJd+nEc6Baqirwq6kREI7oOae1mo6pIorP8kJYum1lw/
         a2vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720335280; x=1720940080;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3wa19O5pYQt2ewjnjIco7NcYsEERZusPgocEP5T3ISE=;
        b=aBegxRn6SzsDj1jqhjC+n7Kn5/vb36TqSodRpvNw0n/pVl28coFmnTHIIPCc8E4S03
         MMO7urdJD4N1jdD35s+O/OnMEAJo7byontp1dOH1THp8RZtBKTg9GpAig/J3iElrr3HT
         xarfx7yIK722OAN25iZdGtAOamXcrngL/J1DnTxlV0ZEGDb8iInYaC06Y5NZd6zGt/2Y
         CPFIGda3hixVDhBk8V8EF1QddfSg+4Wat2f0Q06TQDulhtvp8/NzFgS+cRSeRcvhMxQu
         2BRnddiQC6Yc7nkMgJcA99K1yrTlqY/fAtwC5JLsb0pB9NWZDcjkEeQrxntB7uAJnz4I
         CudA==
X-Forwarded-Encrypted: i=1; AJvYcCWpRYGWYamjiPU9KaLFkMCeNCsGBi1i1e2ivljl7dYJe/srfYCeU0wNJRPmHZ2Ko1sGBPe46WrFl4g9ctSHd1zL1v0XwBztHlWLomQUSg==
X-Gm-Message-State: AOJu0YyxThgyAGx+PtcYbp6JuOIHWUQxmW8I8pQ+oKZZY9qRe70u/neL
	emBhmPjEeneMoZYducGeF2faJRAChbSDTgSAMjsNwBZ9+wuARlII
X-Google-Smtp-Source: AGHT+IFZEFK5H9qIKoi9/OUccxTTbshTz8ItyAVXK597dCah3k1qm+x1YCXH72JiXf+cgUyN2PSzaA==
X-Received: by 2002:a05:6000:1788:b0:35f:1edb:4695 with SMTP id ffacd0b85a97d-3679dd73a60mr6145353f8f.6.1720335279920;
        Sat, 06 Jul 2024 23:54:39 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p57ba2f9b.dip0.t-ipconnect.de. [87.186.47.155])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-367a1ee57d8sm6986005f8f.47.2024.07.06.23.54.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jul 2024 23:54:39 -0700 (PDT)
Date: Sun, 7 Jul 2024 08:54:37 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 11/13] staging: rtl8723bs: Remove unused macros in rtw_efuse.h
Message-ID: <dda48a640142abbddb846bddf656ac5adada2971.1720245061.git.philipp.g.hortmann@gmail.com>
References: <cover.1720245061.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1720245061.git.philipp.g.hortmann@gmail.com>

Remove unused macros.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8723bs/include/rtw_efuse.h | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_efuse.h b/drivers/staging/rtl8723bs/include/rtw_efuse.h
index 5938a6bfb573..0cb8c6f6d34d 100644
--- a/drivers/staging/rtl8723bs/include/rtw_efuse.h
+++ b/drivers/staging/rtl8723bs/include/rtw_efuse.h
@@ -7,19 +7,6 @@
 #ifndef __RTW_EFUSE_H__
 #define __RTW_EFUSE_H__
 
-
-#define	EFUSE_ERROE_HANDLE		1
-
-#define	PG_STATE_HEADER			0x01
-#define	PG_STATE_WORD_0		0x02
-#define	PG_STATE_WORD_1		0x04
-#define	PG_STATE_WORD_2		0x08
-#define	PG_STATE_WORD_3		0x10
-#define	PG_STATE_DATA			0x20
-
-#define	PG_SWBYTE_H			0x01
-#define	PG_SWBYTE_L			0x02
-
 #define	PGPKT_DATA_SIZE		8
 
 #define	EFUSE_WIFI				0
-- 
2.45.2

