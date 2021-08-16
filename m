Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F5F7168
	for <linux-staging@lists.linux.dev>; Mon, 16 Aug 2021 23:45:04 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id x12so25881390wrr.11
        for <linux-staging@lists.linux.dev>; Mon, 16 Aug 2021 16:45:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=q4/Ddg64kkfjqf2isPMPVplHIsvSq8ZE7jaLWqZikzI=;
        b=WdwxxNM1Twv5HWBhVDJfyWGZLGtE+vLVxqEkAwFZR/Ao1iO1QLbuBrEqFOEaLnBsn9
         loYcF6sNEaAMYtDan+xdMrPlgAq70ylWhdtkcCyBCdq776uCXhBmCZsRNcLVl1rTUrr9
         WlZ4pq0yP3Ze9Pgr5jUNCWJL21ImV+E9gOP+UQKsi67boX6xm8VtFMKBBr8FmEE1o0KL
         SgahclB3jOvYBQ1j02OSkgLIOhmsrDWqBW4bXxNTofi0WEJo+OzmLuAPEM4LvpiJr5pt
         kzeabJn7lZqor4uHOM4tz9XQ0cle3vwPL67hkwgdigH2q7EnQ/nEIegTOZbOzUZkgJe9
         ZzKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=q4/Ddg64kkfjqf2isPMPVplHIsvSq8ZE7jaLWqZikzI=;
        b=tPMhM93by0pWYpvhyqCjSGrQahH6KIBNuK/NbKNDS15Poyxyt7n6DRUwBzB0vTf2g/
         kjG6WxeKkLkiBwUbyl5XBhQMxUbFIjAy0HX2J4gl7NfT6ld52cPLWHsiM++7mDy0HPEU
         +6r09tMl9oM3mGWxhDNI13LDHeZQOykgp4JDT1daGuJ0SpzuXEBfi4S9jVox6k69fJ3R
         BXnZ4PLcXoEIzjX1zUxzxPFAeTOgZjpeUue1xmm+Ldd3uhjTilx/eRNopRJjp+upViq9
         YZQ3D/2m5xZhAGABzmvSaPVk8VAMqqNQrFZcHgjzHQyHQnL67yyomGZetKjWgFpqHlHk
         tSWw==
X-Gm-Message-State: AOAM530nUWpW8SfKuwyEILI/r0vIJkIgyKRFu9mSbQS387jH4Qp3RXr0
	Qx6WjwRq16a8eYa1pgTd0+XdBg==
X-Google-Smtp-Source: ABdhPJwyC0+NlHuN7UpIoi/LWuaYaE11hWH+Z9kUhQtWBL75GAkI+CKQPDV1IgSsXMfq2RoWMXHeCw==
X-Received: by 2002:a05:6000:18c8:: with SMTP id w8mr549068wrq.90.1629157502843;
        Mon, 16 Aug 2021 16:45:02 -0700 (PDT)
Received: from localhost.localdomain (3.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.6.1.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:df16::3])
        by smtp.gmail.com with ESMTPSA id w11sm291521wrr.48.2021.08.16.16.45.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Aug 2021 16:45:02 -0700 (PDT)
From: Phillip Potter <phil@philpotter.co.uk>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	straube.linux@gmail.com,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] staging: r8188eu: changes to rtl8188e_Add_RateATid
Date: Tue, 17 Aug 2021 00:44:56 +0100
Message-Id: <20210816234459.132239-1-phil@philpotter.co.uk>
X-Mailer: git-send-email 2.31.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series does some cleanup on the rtl8188e_Add_RateATid function in
hal/rtl8188e_cmd.c:
Removal of a set but unused variable.
Removal of an unneeded DBG_88E call.
Other cleanup (spacing around operators and un-camel-casing a variable).

Revisions of this patch set:
V1: contained everything in one patch.
V2: takes account of feedback from Greg Kroah-Hartman and Fabio M. De
    Francesco to split patch up, and more accurately reflect patch
    changes in subject lines.

Phillip Potter (3):
  staging: r8188eu: remove set but unused variable from
    rtl8188e_Add_RateATid
  staging: r8188eu: remove unneeded DBG_88E call from
    rtl8188e_Add_RateATid
  staging: r8188eu: perform cleanup in rtl8188e_Add_RateATid

 drivers/staging/r8188eu/hal/rtl8188e_cmd.c | 22 +++++++---------------
 1 file changed, 7 insertions(+), 15 deletions(-)

-- 
2.31.1

