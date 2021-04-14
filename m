Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 488B472
	for <linux-staging@lists.linux.dev>; Wed, 14 Apr 2021 06:54:53 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id m11so13098175pfc.11
        for <linux-staging@lists.linux.dev>; Tue, 13 Apr 2021 23:54:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=zjGZSJ4KhJd9LlJKKk+vKP/bKS46sOTGkiQwBP1VtGE=;
        b=KKB9FpUH30uY+/y98TUqidow/1dG2KfxxDL6U/EbsjDCFPOKEPiLKc8p3AHsvTiJmS
         B18PembLrTJMfnAWetvVk06sKbqiuDkHTGi9m0VURe7TJC54rQnqGsGs5G3QXFzZZAgq
         b0nUDBaADaeVpbz4r3XoUrUzXQsmByXV+NWPq2tHd0Ogzc/kF3SCvSCavR6Jl9tUvBKp
         Wk3a77bhepf4kGsOHJ52FVyvMH9Bfwcz+VPMXCwTWc7EiqzvxHnJhreDpyeE+dryoenl
         KLtArye4LjPhgn6JruVO8xtZ/y3XHlQiZwaoxmq1/WnHjdjNu1beqmKEsXm4tgvcULv5
         8uow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=zjGZSJ4KhJd9LlJKKk+vKP/bKS46sOTGkiQwBP1VtGE=;
        b=c874DLLBA+BkcPYeq+r/TeFDzeC4LYVOWylHSS6lELtLja+pSRoFcaSjvRr95X0KR0
         9zs/Gp6bW04FLKccI6jtglSFPmRXUgHHFWLIprTCDWW6IwJuuOdFcByfS63mZ7roLwSK
         +kV08G/BVE69HQhttTugiXT5BWv07ccWW/Cwp99QhvceYVW8i4m0oao3sMLCSGDTfxv8
         tEW9o2rtkhkCdU5LOSOaFT3CWj61boHroZuyqvRtnpqzjdWI961quPC6aaOa5tBC6TJD
         trKJrZNOstlyYa3nAXXeePnSylkTr7inAzH1ETq/szo+ZB+n5skS6fE4XxPpXNfLrTar
         Ur7g==
X-Gm-Message-State: AOAM5313iU6+EyLCGTC5QfMSedqbJG/MtFgSggZVF8dP9B9jSRtHFuyQ
	enkArZ5zt65LaL6w5d5C6gs=
X-Google-Smtp-Source: ABdhPJxfXzwlTrnnbyk70dIWdFe19sh4MMUMyct7kPX0nzf63n6o/spUl894vJXbSP8WORN+uAtZlA==
X-Received: by 2002:aa7:8c1a:0:b029:249:e2b1:4b2d with SMTP id c26-20020aa78c1a0000b0290249e2b14b2dmr18151700pfd.6.1618383292734;
        Tue, 13 Apr 2021 23:54:52 -0700 (PDT)
Received: from kali ([103.141.87.253])
        by smtp.gmail.com with ESMTPSA id i22sm16164505pgj.90.2021.04.13.23.54.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Apr 2021 23:54:52 -0700 (PDT)
Date: Wed, 14 Apr 2021 12:24:44 +0530
From: Mitali Borkar <mitaliborkar810@gmail.com>
To: gregkh@linuxfoundation.org, davem@davemloft.net, kuba@kernel.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy-kernel@googlegroups.com, mitali_s@me.iitr.ac.in
Subject: Subject: [PATCH v2 0/5] staging: rtl8192e: CLeanup patchset for
 style issues in rtl819x_Y.c files
Message-ID: <cover.1618380932.git.mitaliborkar810@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Changes from v1:- Dropped 6/6 from and made this as a patchset of 5 as
alignment of code is done in following patches.
[PATCH 1/5]:- No changes.
[PATCH 2/5]:- No changes.
[PATCH 3/5]:- No changes.
[PATCH 4/5]:- Rectified spelling mistake and replaced memcmp with
ether_oui_equal.
[PATCH 5/5]:- No changes.

Mitali Borkar (5):
  staging: rtl8192e: add spaces around binary operators
  staging: rtl8192e: remove unnecessary blank line before brace
  staging: rtl8192e: remove unnecessary blank line after close brace
  staging: rtl8192e: rectified spelling mistake and replace memcmp with
    ether_oui_equal
  staging: rtl8192e: removed multiple blank lines

 drivers/staging/rtl8192e/rtl819x_HTProc.c     | 67 ++++++++---------
 drivers/staging/rtl8192e/rtl819x_TSProc.c     | 10 +++--
 include/linux/etherdevice.h                   |  5 +
 3 files changed, 37 insertions(+), 45 deletions(-)

-- 
2.30.2

