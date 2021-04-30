Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E257B2F9A
	for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 07:44:52 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id t4so20535279ejo.0
        for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 00:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vvsMkKSxObWfrYf5zpIINvfbNjNueuFKMoVjdC9Jfxw=;
        b=DuzBgLs5cGQZTE4Dl/XtabEQpmtO3joUrauIPr26mHsnu8kUSORJlCQ++E7JoNfbrB
         nY1KAybj0Rtun9GzT87GQBRS/3tClTqztNlWeYo1Y2crdk5AB+AAHi0uVmIlFZwkvmKU
         qD4KSbT8DulncPobTqMAqajpH5RI4/Dc/UmvHYQ4k0kHve2MvU2Dv+pUeFK5tnsGmAyD
         h19aH1zKJp7N+bi2Tn91hTOk7xzPS8i858ZCtkReD9fYwB9cy2b0RsVW4G6EAVUdn/Ni
         tEM7McvsBfWu3+hLxf7fkoDlNYmhEAm0IeE5WjEPOA/i+N3LXHLcNxZselgVO+aFyHKu
         Jy6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vvsMkKSxObWfrYf5zpIINvfbNjNueuFKMoVjdC9Jfxw=;
        b=DVged9EWyI9q0kgjKthMIBbwB+bGJy2TjljuAKXhdX0bCtUT7vv5kY+oiuR0eo8s+p
         7apOR/BCcPIBL8n2Dp+55HMrT2nrXEN3ZZ85PsLXJrWl9X6RcLl6DnklsxnGcMS4Ci05
         EK8nM6K+DOKzHP1dfDYRNCID2/cDE58otTJ9J1h5N2h1laT7fkyMmMxKFciMVav75hFn
         7W/3n2FSCf103hdqiUJh1PMF0WtCZg+teF9RY9iaSvKlvpH+45mi2CtS+WINZplarxyy
         wlyWgTar/z70iFRXDFq2kKEYG7M+i1BKIEwjlT4je2duFFhp/+94awaL2w4oqQeyhK+v
         1I3g==
X-Gm-Message-State: AOAM53213uSkt52m8bcS7BX2523qb+utsDql5REyXlY/OmsVuCJ2PkPN
	I2JDowDMrTORYpMFAIYGk0ABvl5clmFsJQ==
X-Google-Smtp-Source: ABdhPJx6s5BZSN9tvdPsVivNeTZHPANGYYplPmd2dOl28aYX9jwtDoltYj5UWNKE8Bwy0+FB38S/EQ==
X-Received: by 2002:a17:906:7118:: with SMTP id x24mr2791240ejj.127.1619768691609;
        Fri, 30 Apr 2021 00:44:51 -0700 (PDT)
Received: from agape ([5.171.81.86])
        by smtp.gmail.com with ESMTPSA id q16sm657977edv.61.2021.04.30.00.44.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Apr 2021 00:44:51 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 28/43] staging: rtl8723bs: remove empty #ifdef block
Date: Fri, 30 Apr 2021 09:43:46 +0200
Message-Id: <88902ad8cc2747792840a6f17db428a185a27f23.1619768150.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1619768150.git.fabioaiuto83@gmail.com>
References: <cover.1619768150.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove empty #ifdef block.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/hal/HalBtcOutSrc.h | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/HalBtcOutSrc.h b/drivers/staging/rtl8723bs/hal/HalBtcOutSrc.h
index 9c9ad29870e2..f2793d5d9a30 100644
--- a/drivers/staging/rtl8723bs/hal/HalBtcOutSrc.h
+++ b/drivers/staging/rtl8723bs/hal/HalBtcOutSrc.h
@@ -112,11 +112,6 @@ extern u32 		GLBtcDbgType[];
 #define CL_SPRINTF	snprintf
 #define CL_PRINTF	DCMD_Printf
 
-/*  The following is for dbgview print */
-#if DBG
-#else
-#endif
-
 struct btc_board_info {
 	/*  The following is some board information */
 	u8 btChipType;
-- 
2.20.1

