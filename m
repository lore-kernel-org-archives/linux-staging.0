Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19C2572
	for <linux-staging@lists.linux.dev>; Mon, 12 Apr 2021 10:44:36 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id a85so8499154pfa.0
        for <linux-staging@lists.linux.dev>; Mon, 12 Apr 2021 03:44:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=X5Zkx3/PmOz226VDaHPUOrqvW4IVZLwxtVFG37YmhL8=;
        b=n6rRbm0yTIltvNi1N0xtCXbdwwR4pWththrksGAIk8cNX8Y47peQO7IWknYwiDXZLU
         4qagSnIRiu6be8BYQaH3u98xi+zt77IdpQGsF4q163GJ7NMjl/vx6DA7WLnz+87i57vl
         BINM9ezkVYDbmNHfowukC/fiFpqhO9TL+svXSDT3vQ55qerPKK1r70UnPFtRDKQfE78J
         LlpMfn2xqkoffESWahFHngiyHnpiLauczeXgGHB9Uqs+KhcAOMxlLoPkipFuSLHPSdh8
         R28cFkm6+EYRTBMO0VR5C6VQb0tDI77EbK7J+0Zoej8QlmrQejj1kwi12m/rqgolflA/
         o+fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=X5Zkx3/PmOz226VDaHPUOrqvW4IVZLwxtVFG37YmhL8=;
        b=aUqnmxM8Ti3FXCZegVFWiI1V/GO4zvDpTz/MhLIYizMx9gC/fUIQQu9kBV/7gJPsyP
         G08JMt0o3qLPBqZMH+Hrsp80H6Qjb1TLDpNDTXf12QdchELDNVwPRXJ7DoZDIiUDGACf
         RLNUiKQ+6vsFtWVJ5UoMjZQQCUGJwU0GF8vLdGs7fgIt14md/kd1gO66neAp/4MD9nbD
         yicV8lh+4ZxbMY/LP5Od9VkEd5gBGdWrRtR8PIpVNY4DEoJLcyAXhmq5ZwjPl/E6bGos
         Avnig7pM3aG5cEpBsweif89OuGCHlPsI3SSgyycbmHYHoJo8Q/gnGly/87VK2jafmBYV
         sQvQ==
X-Gm-Message-State: AOAM530EtYFxsU2/k0x9RPGefLg832mkRCuIIzUJy1e8tFUJA+mKyJsZ
	jVxikmwhot6BNBptIjArZ6o=
X-Google-Smtp-Source: ABdhPJyBR5T/xmD4u4Gku3ZO/f4l7wjZcN1OtuDNGziMjhhgAqzGRwmQwp0GF3XZcv/CwZWVyMCUrA==
X-Received: by 2002:aa7:943b:0:b029:23f:8fa1:5f11 with SMTP id y27-20020aa7943b0000b029023f8fa15f11mr23557569pfo.67.1618224276587;
        Mon, 12 Apr 2021 03:44:36 -0700 (PDT)
Received: from kali ([103.141.87.254])
        by smtp.gmail.com with ESMTPSA id q19sm11005093pgv.38.2021.04.12.03.44.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Apr 2021 03:44:36 -0700 (PDT)
Date: Mon, 12 Apr 2021 16:14:27 +0530
From: Mitali Borkar <mitaliborkar810@gmail.com>
To: nsaenzjulienne@susu.de, gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy-kernel@googlegroups.com, mitali_s@me.iitr.ac.in
Subject: [PATCH v2 2/2] staging: vc04_services: rectify spelling mistake
Message-ID: <967c328610909bc010b0bb82a1f89b71a57fa7a3.1618223171.git.mitaliborkar810@gmail.com>
References: <cover.1618223171.git.mitaliborkar810@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1618223171.git.mitaliborkar810@gmail.com>

Corrected the misspelled word.
Reported by checkpatch.

Signed-off-by: Mitali Borkar <mitaliborkar810@gmail.com>
---
 
Changes from v1:- No changes.

 drivers/staging/vc04_services/interface/TODO | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/vc04_services/interface/TODO b/drivers/staging/vc04_services/interface/TODO
index adb28f46ba67..39810ce017cd 100644
--- a/drivers/staging/vc04_services/interface/TODO
+++ b/drivers/staging/vc04_services/interface/TODO
@@ -37,7 +37,7 @@ This should be fixed.
 
 Even the VPU firmware doesn't support a VCHI re-connect, the driver
 should properly handle a module unload. This also includes that all
-resouces must be freed (kthreads, debugfs entries, ...) and global
+resources must be freed (kthreads, debugfs entries, ...) and global
 variables avoided.
 
 5) Cleanup logging mechanism
-- 
2.30.2

