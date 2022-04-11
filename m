Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E36EA1FA0
	for <linux-staging@lists.linux.dev>; Mon, 11 Apr 2022 20:49:18 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id bh17so33309771ejb.8
        for <linux-staging@lists.linux.dev>; Mon, 11 Apr 2022 13:49:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:subject:message-id:mime-version:content-disposition;
        bh=/SwEI7yeod7vIHsEt/SEyrggYWJg5pRwDInFyaB3kIM=;
        b=DI+d/1O/q/swLPnQajtr9yBUXl7PXdVud4vQM2teEzWp8lk28m/iWlb4p9d4p3Gbjs
         DJjgigMMlLNiNbQ4MLOVNnffviC959IVbBL0UCzoOhArUBKU2F8bHCiWrsAyd7TOZfrR
         uK32d7uK6BmiLaB95Fgziv1CFzjzjtN+/q37xAn4OgD3Pq4GdbkSYl9z4XMz2i8aMQn0
         +iYKCwTJ7+pA7NYdNsSWc9HLYZ2b14Hq2pUJ1qrOd5iTJWjL9+7NDG4HIDPIfm4bEoCK
         CmqRIACDMJz9AIUBv56bzga7VyQE6XJFddOTUAcPyuCd8x0lisENB8Sy9mnqGEv/HIs8
         Km6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition;
        bh=/SwEI7yeod7vIHsEt/SEyrggYWJg5pRwDInFyaB3kIM=;
        b=gcmggDZgHu49ADrfagmmLMzQws1nQstGZCAIHgfs3EYVH6+fHGLwTHIvVJZbxZRK/d
         BVg6yKGeiXHJ+7HVGbJ//P4PsYfIxzCmkEH89Ye8H66dATSOhY5GfGklzKqxAEIaI3mc
         2+hKGTNOcHCcjNVnPKKVfkw8dEVnYw1q71J3HCq+14M2yI1RSrm1/f7ZOgA+SanqfTDa
         ItT4LrrBz+1hOsCx4oZoeZCqHr2lIvcTuaf0QmOMbbZuJMmg3L10a+4YbZkUliylN4bD
         B6waWvG8SXsjN1MQbqJ6ZboEFW40Vij/HMEP4xELH13bS3HHVu6k5Ovbw4bcy0f49Sym
         i7SA==
X-Gm-Message-State: AOAM5310By3zEw915K9ger4qTBH2SnYIhXcsG4DDTQnhhpLVSRZDK5/P
	ISWYXxGT7wRhlq79rYpVR1p2UnKzVwk=
X-Google-Smtp-Source: ABdhPJwo/fyC6ehmNFu/hDcYp+kdDLUNQvul1Et4C1nyeW9tSG+5fgKqjn2DB+WhGLA1YveNQ5ebvw==
X-Received: by 2002:a17:907:6093:b0:6e0:dabf:1a9f with SMTP id ht19-20020a170907609300b006e0dabf1a9fmr31797083ejc.424.1649710157027;
        Mon, 11 Apr 2022 13:49:17 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p54a074e9.dip0.t-ipconnect.de. [84.160.116.233])
        by smtp.gmail.com with ESMTPSA id m24-20020a170906161800b006d420027b63sm12400232ejd.18.2022.04.11.13.49.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Apr 2022 13:49:16 -0700 (PDT)
Date: Mon, 11 Apr 2022 22:49:14 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/7] staging: vt6655: Fix CamelCase in upc.h and started
 in mac.h
Message-ID: <cover.1649706687.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Start fix CamelCase or do-while{0} issues in macros by
- replacing macros with command used in macros
as CamelCase or do-while{0} are not accepted by checkpatch.pl

---
V1 -> V2: Merged first two patches into one.
          Patch 6/6: changed from (macro to function) to delete macro
          Updated cover-letter description
V2 -> V3: Removed first two patches as they were accepted.
          Replaced macros with command used in macros.
          Replaced only one macro per patch
          Updated cover-letter description        

Tested with vt6655 on mini PCI Module
Transferred this patch over vt6655

Philipp Hortmann (7):
  staging: vt6655: Replace VNSvInPortB with ioread8
  staging: vt6655: Replace VNSvInPortW with ioread16
  staging: vt6655: Replace VNSvInPortD with ioread32
  staging: vt6655: Replace VNSvOutPortB with iowrite8
  staging: vt6655: Replace VNSvOutPortW with iowrite16
  staging: vt6655: Replace VNSvOutPortD with iowrite32
  staging: vt6655: Remove macro PCAvDelayByIO

 drivers/staging/vt6655/baseband.c    |  16 +--
 drivers/staging/vt6655/card.c        |  73 ++++++--------
 drivers/staging/vt6655/channel.c     |   6 +-
 drivers/staging/vt6655/device_main.c |  40 +++-----
 drivers/staging/vt6655/mac.h         | 139 ++++++++++++---------------
 drivers/staging/vt6655/power.c       |   4 +-
 drivers/staging/vt6655/rf.c          |  14 +--
 drivers/staging/vt6655/rxtx.c        |   4 +-
 drivers/staging/vt6655/srom.c        |  18 ++--
 drivers/staging/vt6655/upc.h         |  31 ------
 10 files changed, 138 insertions(+), 207 deletions(-)

-- 
2.25.1

