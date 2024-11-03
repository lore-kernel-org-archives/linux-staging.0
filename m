Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEA4E15C14B
	for <linux-staging@lists.linux.dev>; Sun,  3 Nov 2024 08:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730621697; cv=none; b=Vxa76PyvMB3YSgE5eQ/vRd5aRdVxpeLiBi703BWA6C+eBulfu3gBmCYY+C3OIQtZpmufIDRf3+jRTYbcPm023Imd2FJ1z6oetqADFnxnGCuIr6pTZQ/ELiRNXr+GmKKMfUPdqzwm397hBWuoEqQbMhbIQrqhUwykEwSNrYsVkw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730621697; c=relaxed/simple;
	bh=7sKe1Pl+7CwfWdmhfNJ2WxpGLVatbPVCfDOtU3av8aY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qR++Sys8ZgTdUEDkVireftoiOEQ4tmx+YZGAaZSmVQXB/bXePkUS7rN8gfbdNLf9umZTSY1XTlvgbViDQCa8xpUf4LVXkfyY6PKcII/G8un6x3ThggXE4hMBDSFccJ21CF8ZHEkrXm1U3qiUJif+67pnvFY1FgfAXPQHTbpBQBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jofj49nS; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jofj49nS"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5cec8c4e2f6so1339512a12.1
        for <linux-staging@lists.linux.dev>; Sun, 03 Nov 2024 01:14:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730621694; x=1731226494; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u9L6U0Gk8YZHjTkzBekNSagvpm2LJGcdztz/F1h/LBM=;
        b=jofj49nSBEKkxgKbEucIhA3DVM2BPk6KrLiX/Bt0pRYtXVF4gh1Az9Ci2tLHb2Ezdk
         hBEL/Kz0AbbEbcWogaISwyVy7n7sNA9sTsW0tpPMJ9H50TDeaNKFByKP34UHn0D6TPW+
         SjE8myUiEarPS1jKZGbItOj8R7P7JdxsEBycuJ0she7OS6Jdx4EXDgxPCZZ8T+IeiRhG
         Ssetir/Yew97UNSzAxKrReuURHqLDqe5c4nHY5+PMYp5B5LuqP0NxiIkM0FmmHsiCXVx
         LcOYcHGWZWHNxvi7uprqsl45M9TRf3RXk4p4pKf4sqf/8PnkHgESj0Nj9zzh0AzyLFMR
         V2SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730621694; x=1731226494;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u9L6U0Gk8YZHjTkzBekNSagvpm2LJGcdztz/F1h/LBM=;
        b=TlUZ2ueZePGaRF/pk+H+1Ab437BiTOJCan/fvE865w/NzZfTegTEaOL9HboogNe1wA
         YZ55sLS/ufxINpL0A/evpSLqHvP2rPbC2l9TVgFB/IFo9+jQKbH/3f7lbrOyxfFqzK7N
         9T4jpx0RRfCKdmAnBgY97q7OUWuek04WOxLBsDqI5EY7bNvk+xubSuuVdopa/Xtqgo9/
         fqZCNY5tZhBwksnSNhAJSyx6Vo/K0OhcCl6S7S95aJcrn9guhC38ffiVCYGIR1eLUlZT
         cmmqRU3w00n4wEejhhcK5lS5UppaDRq856ttkHAZpQewYPLq7KszsXv1smbZwmF9xiUb
         Ld9w==
X-Forwarded-Encrypted: i=1; AJvYcCX8WcEZQUkPWzGKR1WfqYhOejhfnW3Q8nNrJWL8u/UXwbsQDP/dEejo/+hbw0d34ZQEtCTHGl5+/LLFSL5S@lists.linux.dev
X-Gm-Message-State: AOJu0YzPddyopwT/NoXaRFf6Tjz7E8DGJR3GiUkdM43nVosry5Zb+UKo
	rU4QY+5bIFvtR9buOvAUnAybUJsXtUmTP/q4ym/WHoJAu+W1OC4v
X-Google-Smtp-Source: AGHT+IFP9igqQElEcdzfvpQCH6ScPEFlcCIEAR+RwKIMPWuu5+OsQEWo9ibchlb+P/6X2aqbLxooIw==
X-Received: by 2002:a50:ee98:0:b0:5ce:c8ee:7e41 with SMTP id 4fb4d7f45d1cf-5cec8ee80a3mr3127174a12.22.1730621694098;
        Sun, 03 Nov 2024 01:14:54 -0700 (PDT)
Received: from kernel-710.speedport.ip (p54a0712c.dip0.t-ipconnect.de. [84.160.113.44])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5ceac789152sm3097882a12.43.2024.11.03.01.14.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Nov 2024 01:14:53 -0700 (PDT)
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Subject: [PATCH 04/13] staging: rtl8723bs: Remove #if 1 in function ReadChipVersion8723B
Date: Sun,  3 Nov 2024 09:14:25 +0100
Message-ID: <637bc9cfb1188fd0112998aea5d22241e965a50e.1730619982.git.philipp.g.hortmann@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1730619982.git.philipp.g.hortmann@gmail.com>
References: <cover.1730619982.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove #if 1 in function ReadChipVersion8723B as it is useless.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index 49b6507f991c..c3fcadc634f9 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -1523,9 +1523,9 @@ static struct hal_version ReadChipVersion8723B(struct adapter *padapter)
 	pHalData->MultiFunc |= ((value32 & BT_FUNC_EN) ? RT_MULTI_FUNC_BT : 0);
 	pHalData->MultiFunc |= ((value32 & GPS_FUNC_EN) ? RT_MULTI_FUNC_GPS : 0);
 	pHalData->PolarityCtl = ((value32 & WL_HWPDN_SL) ? RT_POLARITY_HIGH_ACT : RT_POLARITY_LOW_ACT);
-#if 1
+
 	dump_chip_info(ChipVersion);
-#endif
+
 	pHalData->VersionID = ChipVersion;
 
 	return ChipVersion;
-- 
2.43.0

