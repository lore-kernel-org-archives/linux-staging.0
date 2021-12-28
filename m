Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F72B2CA4
	for <linux-staging@lists.linux.dev>; Tue, 28 Dec 2021 10:11:46 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id a83-20020a1c9856000000b00344731e044bso9768719wme.1
        for <linux-staging@lists.linux.dev>; Tue, 28 Dec 2021 02:11:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=j1aFnyHFUtPdBZotM5iBED56xT2FvKcAtJi+DzbG5wA=;
        b=ZOTCc8hb63q9418FaiqBdAUzCMOI6zc8pbICndChUVCr4dtLo6I3GJ3QWC+M/y1IvR
         +UuAgaTdIxNxLsfGyhO7L11pxIS3N9mribQQ7Gpk7POSfOi7nXNi510yYOA0g81LKFbC
         ZNGy3sw4hhsX4FWdCvLVCZA2RmgsoV1phDWLw4xHc60UgfB6mXKK3DN1vNa90k6vQbSy
         5XyFizqrlg1FrlD68qmnUzgXvq/2bNIiKo4E6SIDry5jOL7n+VpEJnSiw4XWLH+2WaCR
         h8mBeho8soputU3nud86sKfP8qvaC7bA8r1/ZuNb0xLDLGQYAWTKJ9b5j9w9AXlL0kTN
         Dtjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=j1aFnyHFUtPdBZotM5iBED56xT2FvKcAtJi+DzbG5wA=;
        b=hBaKfN2HOZey2mLo+/AZY1dIND1mrKcgzLnGPS27jm0Jw21wYbOyl6gErD0ilMFQjv
         OHmQdthmshlUgyhw9ntlaorhO3IQQwJm/R+2L9o8+rVlcxDXHLcC0Y8omcP1mMdagXYC
         U4lSx+R0JXCxas2gJ8XhiOW20W8bb1uBF8TDOubw14c2eZtx94Wue+lvubIj3qw8Pc+1
         nppYquLb+Zr62FAAYP8zdtm/UPTdGKedUq99BRnHGMXw01ChvysQDb30vRX5NB1iSk1/
         EdMd9AFCr3GgUP9EO390AkJTVEyrfTgVDV8PYwwF5EPYmtdIyYMgmZdWLGV9JqxLOMPe
         eF0g==
X-Gm-Message-State: AOAM53258JLURjRA7PAOrA+ArjxMPusmd4EGgV/vwzg9cdXZFexjeFPX
	dYhCBntEJcc6kqZvsRSBBm8=
X-Google-Smtp-Source: ABdhPJzWbaHSeTVaieSdzN6jiQhmL/D+iZDpgSpCs7saI+O3cowFz3vUnff9dAQYLqHbvNIAHzbdFg==
X-Received: by 2002:a7b:c249:: with SMTP id b9mr16269975wmj.159.1640686304626;
        Tue, 28 Dec 2021 02:11:44 -0800 (PST)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::6619])
        by smtp.gmail.com with ESMTPSA id d62sm21160984wmd.3.2021.12.28.02.11.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Dec 2021 02:11:44 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 02/10] staging: r8188eu: remove GET_CVID_ROM_VERSION
Date: Tue, 28 Dec 2021 11:11:12 +0100
Message-Id: <20211228101120.9120-3-straube.linux@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211228101120.9120-1-straube.linux@gmail.com>
References: <20211228101120.9120-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The macro GET_CVID_ROM_VERSION is not used. Remove it.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/include/HalVerDef.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/r8188eu/include/HalVerDef.h b/drivers/staging/r8188eu/include/HalVerDef.h
index 1d96657e6a98..62b94c993f0d 100644
--- a/drivers/staging/r8188eu/include/HalVerDef.h
+++ b/drivers/staging/r8188eu/include/HalVerDef.h
@@ -35,7 +35,6 @@ struct HAL_VERSION {
 #define GET_CVID_CHIP_TYPE(version)	(((version).ChipType))
 #define GET_CVID_MANUFACTUER(version)	(((version).VendorType))
 #define GET_CVID_CUT_VERSION(version)	(((version).CUTVersion))
-#define GET_CVID_ROM_VERSION(version)	(((version).ROMVer) & ROM_VERSION_MASK)
 
 /* Common Macro. -- */
 /* HAL_VERSION VersionID */
-- 
2.34.1

