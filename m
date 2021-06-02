Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0647B70
	for <linux-staging@lists.linux.dev>; Wed,  2 Jun 2021 19:33:42 +0000 (UTC)
Received: by mail-pg1-f174.google.com with SMTP id i5so3158504pgm.0
        for <linux-staging@lists.linux.dev>; Wed, 02 Jun 2021 12:33:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=58f97IzlT9KPrXUOhgASh31TIzZpCag1XB0Qb81nEUI=;
        b=EHgAMA+ZqisG673kTLjz3bdglth4r0jB2cYYL8ht+bFLK/bMhSNaGxD7dW+0YldBl7
         4rCcjGdJiruQ5PmWrvXvHkWcqHBAm/sQL53m+Mrl8FHgTR/9HtxDf/LFfkUEMxI8SVJo
         Mu6RcnCpuvTaxmF08HqfiGFJ9H3FB7IVSblXYaLaFz4CSPNwqrkJq+Fwq94sSGsKPN/E
         c+dAodeDfVX9CgHmVGiGqB1C0dSscqE86nAm0yphmtmsG9aFPU3ftvDctfI8tPaz41nW
         CS6nfpdWU2VEIr5UsCR6lvLVsOLeAUoafyOIxa4A4qVT12L41V326PMzIO+MeojisEFt
         /7Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=58f97IzlT9KPrXUOhgASh31TIzZpCag1XB0Qb81nEUI=;
        b=SFOlxLm47bNSz34kzSpbBgPkFjfWQ/8yqgzGU/wvhLW123k5slgadjVaI/xz5tSThi
         3EfQb5pVqMReT3O6oLP/GzuCppF6aBBBX+/1gQ1Bfna1lvGTN8Sny0iK1Os4U2hUcrRu
         OIgFn6OW/ipF1XQvpqXU23pi9cRq/5kIeI7/UliVR7D8huZxzrkRAMjz9/nIB0+XqdSI
         QL1yyzRRxMJYsbcbJnXDXDMe7MfX2uGgCiMceRE4y8mO//5W6uiEHPMewWuquTvKGr9s
         YCluM92k75FMCcBmE4oehSrRkh5/R13Q9BpqfNjKSevhl4pwlnc0b/vPvDYyQ4d7JJAd
         nemA==
X-Gm-Message-State: AOAM532hHwTRdROnH+Q8wt03JjPg2xNlUjeL+38LhheoGQDSUAUhAitJ
	cywmlIJMe6s19I91Ia1U4S0=
X-Google-Smtp-Source: ABdhPJxnWPveGj69ZI0U8HS0L+h5jYErr7asmg1l4w8N7fHlfM/zZHKVHaNpSEdK0KGCoKC/JyK3Qg==
X-Received: by 2002:a62:a50d:0:b029:2e9:c657:feb1 with SMTP id v13-20020a62a50d0000b02902e9c657feb1mr18667872pfm.55.1622662422438;
        Wed, 02 Jun 2021 12:33:42 -0700 (PDT)
Received: from localhost.localdomain ([183.82.156.141])
        by smtp.googlemail.com with ESMTPSA id 30sm520570pgo.7.2021.06.02.12.33.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jun 2021 12:33:42 -0700 (PDT)
From: Manikishan Ghantasala <manikishanghantasala@gmail.com>
To: 
Cc: manikishanghantasala@gmail.com,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] staging: rtl8192u: r8192U_hw.h: fix checkpatch.pl reports
Date: Thu,  3 Jun 2021 01:03:29 +0530
Message-Id: <20210602193334.11687-1-manikishanghantasala@gmail.com>
X-Mailer: git-send-email 2.25.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series fixes all checkpatch.pl errors, warnings an some checks
on the file drivers/staging/rtl8192u/r8192U_hw.h

checkpatch.pl tail output before patches:
total: 4 errors, 1 warnings, 32 checks, 247 lines checked
checkpatch.pl tail outputt after patches:
total: 0 errors, 0 warnings, 8 checks, 246 lines checked


Manikishan Ghantasala (3):
  staging: rtl8192u: r8192U_hw.h: fix spaces preferred around that '|'
    code style error
  staging: rtl8192u: put parentheses on macros with complex values in
    r8192U_hw.h
  staging: rtl8192u: fix spaces in r8192U_hw.h

 drivers/staging/rtl8192u/r8192U_hw.h | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

-- 
2.25.1

