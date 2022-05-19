Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B380F23CB
	for <linux-staging@lists.linux.dev>; Thu, 19 May 2022 09:51:22 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id l20-20020a17090a409400b001dd2a9d555bso4800272pjg.0
        for <linux-staging@lists.linux.dev>; Thu, 19 May 2022 02:51:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=Kz0h8AVlhDxqu2fBv10G2DB8irasLWVcOGHbwSABuog=;
        b=j8zmNa4gMVNlK1u6bsG4t1uiZRogcunLjCd15/qrWM4n/t2ugaS7lRDlEPZ6jY+yIg
         mTkGGLdzW/XF1HzWzoin/UaQRAH1HC3QmvuecgIwR59XLaQAahzL2pgVCOsQvNZj7cdz
         VYmF4RqqxQQpgjr2ibTG/yK7t16feYxU3umPw8ojMW425llDHKVO+X5yB6azRO4u6S58
         UzattIxywCxCfAijShBykl2CXmkGvvOSVCsH94kEZkUjIFlVSSr3OA351Ri9HUtPyFhO
         1A35o6nL/k3nMH4PSxrKdHRFharWVdXlHgLosiZP6HKazU5lWFSTbsjROPCzR/ueoDD1
         zBxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=Kz0h8AVlhDxqu2fBv10G2DB8irasLWVcOGHbwSABuog=;
        b=n8yt22JP+DNdFO1f3sq0WVcNmmuvfwaE5VHoBSeBIZBkV9BZ8qcfsJA7Cpp+x5/1ZE
         0Fuas7LGRV9OsoWmri4BeMsE2iGhKq8rd8glTCh3uziTXBRhIhQ3u4glDP1YH9X4gBcE
         NvPewFfyZtSRnwUCwxei3L/YeMZTe6YfUe5HLFKAcLUCHFn4hgPxW9X4MBUsT5hKEF0r
         340L+g1/6I8u3Rqdwz44g4hPpQWZywzLopI3WGGsxA/VMBlcKHNbP2kIR/v+r46usk3O
         kXwF3gjZfUINU3F+NKSEH5qG//V8r/IOKlYz2YtYRzCVSkr4hXyP/LxTk7e9qD/TCtCQ
         s3Mw==
X-Gm-Message-State: AOAM532nSD1EoZ/SjqdL8voJAOVyDNw/t6l1Qgcm+p8oab9lMBEyJdHm
	Sppt47ArZJY8qVSt0voqy0pS/6roT/OC4w==
X-Google-Smtp-Source: ABdhPJw1fyrbaoYaCvEaPe+05dXjx+wf3KiemTb56WVrxGS0CtEIIiLvyqyF450u94ZVs2dzcF4H8w==
X-Received: by 2002:a17:90b:1d0b:b0:1df:b3dc:5140 with SMTP id on11-20020a17090b1d0b00b001dfb3dc5140mr4289320pjb.225.1652953882156;
        Thu, 19 May 2022 02:51:22 -0700 (PDT)
Received: from Negi ([207.151.52.3])
        by smtp.gmail.com with ESMTPSA id f186-20020a62dbc3000000b0050dc7628133sm3798073pfg.13.2022.05.19.02.51.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 May 2022 02:51:21 -0700 (PDT)
From: Soumya Negi <soumya.negi97@gmail.com>
To: Shuah Khan <skhan@linuxfoundation.org>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Soumya Negi <soumya.negi97@gmail.com>,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: r8188eu: Remove multiple assignments
Date: Thu, 19 May 2022 02:50:11 -0700
Message-Id: <20220519095012.5619-1-soumya.negi97@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

Conform to Linux coding style.
Issue found by checkpatch:-
CHECK: multiple assignments should be avoided

Signed-off-by: Soumya Negi <soumya.negi97@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_br_ext.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/r8188eu/core/rtw_br_ext.c b/drivers/staging/r8188eu/core/rtw_br_ext.c
index e1b3e9d5250b..bca20fe5c983 100644
--- a/drivers/staging/r8188eu/core/rtw_br_ext.c
+++ b/drivers/staging/r8188eu/core/rtw_br_ext.c
@@ -53,7 +53,8 @@ static unsigned char *__nat25_find_pppoe_tag(struct pppoe_hdr *ph, unsigned shor
 	unsigned char *cur_ptr, *start_ptr;
 	unsigned short tagLen, tagType;
 
-	start_ptr = cur_ptr = (unsigned char *)ph->tag;
+	start_ptr = (unsigned char *)ph->tag;
+	cur_ptr = (unsigned char *)ph->tag;
 	while ((cur_ptr - start_ptr) < ntohs(ph->length)) {
 		/*  prevent un-alignment access */
 		tagType = (unsigned short)((cur_ptr[0] << 8) + cur_ptr[1]);
-- 
2.17.1

