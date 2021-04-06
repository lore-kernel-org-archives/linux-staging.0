Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A04046D00
	for <linux-staging@lists.linux.dev>; Tue,  6 Apr 2021 12:09:59 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id z8so16164888ljm.12
        for <linux-staging@lists.linux.dev>; Tue, 06 Apr 2021 05:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=Eijh7opZwID4E3qzX/yTt/B8FpJzMJ+jEZ1I1aM/q6s=;
        b=L60fOoUoABs49nsy/jz0aOn+FQm1KND11117yXHCZXZCZXHJMCp5rqhgWZwkY2uPuj
         uTUw1jaqcD3BwAlJ41tA8YvpDuE/Qn/4xQX8PSyEnpGqqcyAbIOfo9XjKFGj3bL028RG
         iPHhu60+ZPZJsXcudSePjSpFA9Q/XbiKY2sEti6+vgmmqzfMDaqSszxMhYyFQ8fB5n37
         ZzWs9L/VGWLk08WQrYeLowymLQoLgehsSjg2W8utAZNbEmxLEcedoZHxFTO67vcDupxS
         jWaGKS4WstB9I/FhvGZACIc8OOucgLyil83YJRbHVpMMLAc3nQSOnK55anfKW2Ji/Yq/
         9BLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=Eijh7opZwID4E3qzX/yTt/B8FpJzMJ+jEZ1I1aM/q6s=;
        b=FIaSPkH4k7ZEIbLbnjCnMlIDBTHMJGnZpN5VvRnJTz8ivpq3aGpzFUsLR3ro+Q4uFw
         6LS1aOXG/6PmcF/xnn653abtP+rORQoqwgUgpr26Ku9x3pHzNL7SxzG3ougE+fgVNY9G
         DSSaWudb6AR6bIujxwTIfaCALMV69GBPSzK/gq6SLz+PjxpYSvIKuFnqvbTF2rX4vnUZ
         mryLyDVb0W5OKCrBIaLyTGUdrsqL/6aXdnHUWFNt2Wc4rDxqz5ZXn73JfTJ6Brc47lSP
         JSVFawofNzhTAicTkbuNbI9rvTR8fzAzbIoGPeWopea8rHhDbvGBb+P/u/PHIaWR3iSV
         7ZCg==
X-Gm-Message-State: AOAM532tKXXy8kwLlXX9ZiMWGNMQxQUy54ts+DrI8TWyEu6HT+5Ru4vJ
	auMNweveM/0BknfQHASIlis=
X-Google-Smtp-Source: ABdhPJxG6YnhVhUoi77Ji1VimECioxTabxcMKqwd5WIU1wH6DBEaY0AyBZT1B30GweFHx5IUa7UMRQ==
X-Received: by 2002:a2e:b4f6:: with SMTP id s22mr18439067ljm.328.1617710997923;
        Tue, 06 Apr 2021 05:09:57 -0700 (PDT)
Received: from zhans ([37.151.32.231])
        by smtp.gmail.com with ESMTPSA id x207sm191922lff.92.2021.04.06.05.09.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Apr 2021 05:09:57 -0700 (PDT)
Date: Tue, 6 Apr 2021 18:09:54 +0600
From: Zhansaya Bagdauletkyzy <zhansayabagdaulet@gmail.com>
To: Larry.Finger@lwfinger.net, florian.c.schilhabel@googlemail.com,
	gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy-kernel@googlegroups.com
Subject: [PATCH v2 0/2] staging: rtl8712: rewrite comparisons and remove
 blank lines
Message-ID: <cover.1617710602.git.zhansayabagdaulet@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

This patchset replaces NULL comparisons with boolean negation and
removes extra blank lines after an open brace.

Changes since v1:
	- more detailed description of the commit

Zhansaya Bagdauletkyzy (2):
  staging: rtl8712: Rewrite NULL comparisons
  staging: rtl8712: Remove extra blank lines

 drivers/staging/rtl8712/rtl871x_io.h   |  1 -
 drivers/staging/rtl8712/rtl871x_mlme.h |  1 -
 drivers/staging/rtl8712/rtl871x_recv.h | 11 +++++------
 drivers/staging/rtl8712/sta_info.h     |  1 -
 4 files changed, 5 insertions(+), 9 deletions(-)

-- 
2.25.1

