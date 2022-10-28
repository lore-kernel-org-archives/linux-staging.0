Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6D3A2F44;
	Fri, 28 Oct 2022 17:41:10 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id z24so9258949ljn.4;
        Fri, 28 Oct 2022 10:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LgIFkJpodLhQ5UNB8CnN3tOTm9odgIidnDRK4X3byAg=;
        b=WA90H9fRil7olR1Vlx/1sOEtZ0T3JsGEo/zahhOQwFUmffec42jXK67bQZGEdVJZ0b
         PYwyVYcokv5NPLfkNsVbXmyXYVR9YLMFNmi7vs9nbz5JgD9VKC+53jP7g/gRZ1JDGVnS
         lPvldw9IbWef9my0YLqiicSNaq6pP14bPdQmhtlOE8M39NmP2qkFpq5LZW2bvOuZXlgs
         FJuJlV3ME0cnhFQpYb8shJ8a49kWaPha38YsKJt5QZD8CqX1kMlX0jFxxpsk2w2jm+jS
         T74nIkCZBAQOf7oX1ItpdaqEDMjPJ4uxp3LxlEaHVO2KSqmva8PqV9VW8ECg0ESXmhia
         DT7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LgIFkJpodLhQ5UNB8CnN3tOTm9odgIidnDRK4X3byAg=;
        b=JZ1dnJCJZrtnUl+fI6Khv0UaiGMBbHZDedgYCKndQjApEqY03/XKyJwj8FDyeAytL1
         fwLdvdtlTKey+IZl0orViyLqFf9HyhSr7+b9QJiuh5F7HuA613BMj15+G6zZiNxQUbnA
         1i/XWahTxPghfEJm6RQHHTWGZiaTz9naKEcB6MCZX4T/i4G8DxObzK86Ld64HZ0o9x7d
         VXJI0fpf42VYkvaWVP9Iq+h78Tt02pGmLYaVQOefBhmKej8T/D/R581HS4eCqMyvH6+i
         Le5N+xZLPhAlkVtbd/4nXSc3VAel0uotcOfi7YATPgapTX8/rvtQ18yy7lq4fpiXsk45
         gRdA==
X-Gm-Message-State: ACrzQf0IjYzjSXRVvGFtrLCLrH6FN7oC32PWbwFY4UyW3STE+wdxV+qi
	Jx5z8tZoOah4FUTUDto+KjU=
X-Google-Smtp-Source: AMsMyM64brzYPgM+s1MBqIb04al8rRJrwRpHxsRYZxtpixVfUpmsR7RdEF2c8Q9Bz7kscIa7No5C4Q==
X-Received: by 2002:a05:651c:2212:b0:26c:2baf:652e with SMTP id y18-20020a05651c221200b0026c2baf652emr295510ljq.84.1666978868819;
        Fri, 28 Oct 2022 10:41:08 -0700 (PDT)
Received: from elroy-temp-vm.gaiao0uenmiufjlowqgp5yxwdh.gvxx.internal.cloudapp.net ([20.240.130.248])
        by smtp.googlemail.com with ESMTPSA id s2-20020a2eb622000000b0026dfdcbccdasm725322ljn.14.2022.10.28.10.41.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Oct 2022 10:41:08 -0700 (PDT)
From: Tanjuate Brunostar <tanjubrunostar0@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev,
	Tanjuate Brunostar <tanjubrunostar0@gmail.com>
Subject: [PATCH v8 0/6] staging: vt6655: a series of checkpatch fixes on the file: rxtx.c
Date: Fri, 28 Oct 2022 17:40:52 +0000
Message-Id: <cover.1666978292.git.tanjubrunostar0@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The fixes are similar, mostly long lines splitting. I had to make
serveral patches to ease the work of inspectors

v2: fixed a compilation error found by the kernel test robot and
recompiled the code

v3: tends out the error persisted in the second version. this version is
a correction of that

v4: did some corrections as recommended by Greg KH

v5: shortend changelog comments as recommended by Greg KH

v6: did some corrections as recommended by Greg KH

v7: fixed some errors on my changelog comments

v8: fixed some errors pointed out by Philipp Hortmann

Tanjuate Brunostar (6):
  staging: vt6655: fix lines ending in a '('
  staging: vt6655: fix long lines of code in s_uGetRTSCTSDuration
  staging: vt6655: fix long lines of code in s_uFillDataHead
  staging: vt6655: fix long lines of code in s_vGenerateTxParamete
  staging: vt6655: fix long lines of code in the rest of the file
  staging: vt6655: fix lines of code ending in a '('

 drivers/staging/vt6655/rxtx.c | 542 ++++++++++++++++++++--------------
 1 file changed, 324 insertions(+), 218 deletions(-)

-- 
2.34.1

