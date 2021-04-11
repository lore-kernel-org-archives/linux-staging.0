Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A76AE70
	for <linux-staging@lists.linux.dev>; Sun, 11 Apr 2021 19:46:33 +0000 (UTC)
Received: by mail-pf1-f179.google.com with SMTP id a12so7772137pfc.7
        for <linux-staging@lists.linux.dev>; Sun, 11 Apr 2021 12:46:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Y76UezwuzE5PH7sUsaJ2E75phUC3veEDBvOshQ8tLXg=;
        b=qf1AFR25jfZ/Nm4XPKUySYL+6Bsrfxo8ELzrMRjh8yblxSjozO8uyE3aJyYU+MreoQ
         Bova3vYiOcsN0/IHHsRIPdxbLE0HfWQ/7aZDRVNv8dWYOqoKGJ1/kuFnKAo5tVeIXBbT
         AMQ0MsFjhZQ/UGlOV8Lp70fp8K9Ju6vtSlP+5wPDRSf/kVpxubwSlJF9zf244wt0cUZ8
         hfyNb4jIQDylML2eURp1i636SUjtSfanDcmA6sbJztJDmTis6OXAfV+WU4qlN+QJHmkK
         A96gw/hZmEEpDB6+q0BJsUUwILahItxzcmNcXGVAl+dBC0cQOsYJyuI1RWuhq7ExHAzb
         F/3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Y76UezwuzE5PH7sUsaJ2E75phUC3veEDBvOshQ8tLXg=;
        b=r91qXeNxXEhWrHcHpgXuHXXGyZdhd51Ma4sjZNVLV3ABN1tCxrDXgYJjENwqqN3nJ+
         tUCdZEKPCzvjYvStJ3fGs32KTnwLSHUgwwR0Jb9E5NXJmFoTKFF9XY5Z6Jpm7hG3Qd9M
         DPTn9SwgOQaKqnDUCUn6VfA1yNMDaTT6244Ke3GzaDzHI9IWBry3Ilatz0MZad3jmmAl
         i9CvDt7qfLvg33+NzUB+H2GdoPX1e5MdpugOxZupnqj7OLyKn+m3R2hKCiclZNUaONhJ
         piKaY463Gjzpd5DfOsby1cbDz4aB4ZyMV5lp470VLxUsPFlMV+/Yo+/XYe4vKd0NalEi
         z6BA==
X-Gm-Message-State: AOAM533+xdrSHhC/Bh+qEDvlvP3DnUHG2jpo0qLmxhejgm/1zBxPtN+6
	rXIHSfBpGXmUWHplM399Y2A=
X-Google-Smtp-Source: ABdhPJxv8t1OA3KrR8wdMht4Up6vRlI0yU9XZZMVpKR/zVopFqJj4jm6eEKtxbejefsfU+yl+wC9bQ==
X-Received: by 2002:a62:1d4a:0:b029:24c:325a:1456 with SMTP id d71-20020a621d4a0000b029024c325a1456mr2867691pfd.45.1618170393090;
        Sun, 11 Apr 2021 12:46:33 -0700 (PDT)
Received: from kali ([103.141.87.254])
        by smtp.gmail.com with ESMTPSA id a25sm3382444pfo.27.2021.04.11.12.46.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Apr 2021 12:46:32 -0700 (PDT)
Date: Mon, 12 Apr 2021 01:16:25 +0530
From: Mitali Borkar <mitaliborkar810@gmail.com>
To: nsaenzjulienne@suse.de, gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy-kernel@googlegroups.com, mitali_s@me.iitr.ac.in
Subject: [PATCH 2/2] staging: vc04_services: rectify spelling mistake
Message-ID: <967c328610909bc010b0bb82a1f89b71a57fa7a3.1618169920.git.mitaliborkar810@gmail.com>
References: <cover.1618169920.git.mitaliborkar810@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1618169920.git.mitaliborkar810@gmail.com>

Corrected the misspelled word.
Reported by checkpatch.

Signed-off-by: Mitali Borkar <mitaliborkar810@gmail.com>
---
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

