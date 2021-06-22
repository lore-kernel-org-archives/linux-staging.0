Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E27B71
	for <linux-staging@lists.linux.dev>; Tue, 22 Jun 2021 12:30:10 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id f2so23407320wri.11
        for <linux-staging@lists.linux.dev>; Tue, 22 Jun 2021 05:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LTkyAehf8YDMFLVUk7PThGVVorkKOg4GbKlGuTWT6o8=;
        b=QKlI8ZsXBVJFrOHywZXptzJCNPPJjZdG4lqBi0+7xoN+uud0LZiP0TB9105F/n45zC
         gKKP9sR2c9TdFWhMbQxX7ZkfkleW+6oex2oPW4vWxzqFW9Qh74yRQNcrF1xdh7cm13px
         QuejxrYa0ER6E4GxMH3oQM6B0BZjKce2BQUqfkFrOvIixJyT21HcVmoQ5qGAKzg5efpY
         81ogsCEGjhkfom02kt2s+BdTA2u8voxu5AR5Eyx51oARpw+iXYBPf7BdN+nJkNBt2AWk
         MRY8dbb8jdgcPEML8JmN4l/SdGMIOPD5uILOPStLDKXeE6X+th8cv5h0E4F8th838isl
         TlNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LTkyAehf8YDMFLVUk7PThGVVorkKOg4GbKlGuTWT6o8=;
        b=UUzrhgexKQ1yVjUtj4kR7xMgmdXsAA31vraeIqxN9OZAMLbCImqCgCnV9QxjzV1ULv
         qb2H8iiWUuVmHZZ96ZtRfkzYlrSea+mgmHM5ZJIvFkSC6UvTo7JEEmSJtQvDAomJ5XlT
         v0ISIgP/PSebNdTPc28ctnlshnaGAYeHFTOluViQ2kCylYHqviut612FdEkJC5ffvDwl
         YTeVLesXkStbc0kkuEb6Td+hkb8qIAdKMV/yoGeElRkmMicxJE40D6Efp7KoqDb+HJI9
         foouUeV624Z0kP1wieKgkaExokdmrEzC40YT1IdIR3U1OYcw0fypTsQb5i2RGvdnJrSu
         jwGw==
X-Gm-Message-State: AOAM530RiWfZ4+TOo3HHZXKglAx1XnSOsQaLhXJGtuUOOVLRSlglUPfD
	bDqwEbim01t/ryGUPob3m2A=
X-Google-Smtp-Source: ABdhPJxWaQq4bojmGXyYu1FO0nytkwnxLd8+LLrIBVCmu0EAdaMoC1ECor2WMDrbIMpy1LZSoqzTig==
X-Received: by 2002:a05:6000:1091:: with SMTP id y17mr4550478wrw.100.1624365009121;
        Tue, 22 Jun 2021 05:30:09 -0700 (PDT)
Received: from agape ([5.171.73.108])
        by smtp.gmail.com with ESMTPSA id g15sm2809238wri.75.2021.06.22.05.30.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jun 2021 05:30:08 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 17/17] staging: rtl8723bs: remove item from TODO list
Date: Tue, 22 Jun 2021 14:29:42 +0200
Message-Id: <f2e1df5a77543f06d6ba2fedf0b5bbcc86cd30f6.1624364582.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1624364582.git.fabioaiuto83@gmail.com>
References: <cover.1624364582.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove item related to 5Ghz code deletion from
driver's TODO list.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/TODO | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/TODO b/drivers/staging/rtl8723bs/TODO
index afa620ceb2d8..3d8f5a634a10 100644
--- a/drivers/staging/rtl8723bs/TODO
+++ b/drivers/staging/rtl8723bs/TODO
@@ -1,6 +1,4 @@
 TODO:
-- find and remove remaining code valid only for 5 GHz. Most of the obvious
-  ones have been removed, but things like channel > 14 still exist.
 - find and remove any code for other chips that is left over
 - convert any remaining unusual variable types
 - find codes that can use %pM and %Nph formatting
-- 
2.20.1

