Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D528871
	for <linux-staging@lists.linux.dev>; Tue, 22 Jun 2021 13:10:29 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id n35-20020a05600c3ba3b02901cdecb6bda8so1710613wms.5
        for <linux-staging@lists.linux.dev>; Tue, 22 Jun 2021 06:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LTkyAehf8YDMFLVUk7PThGVVorkKOg4GbKlGuTWT6o8=;
        b=AK+v2MjgD4vvZAWM3SVsEeYwGJ9WR9AntYcuKmyrUeuTrJDlgT6QTLkRZbsLsE9udW
         wsHbhpmVJ+Hd1sZ343AMUtqa4C5/YtFS/R51bKgNsoGu0P2njmUxAxoAI0GfsHtoMlSb
         yCTvrOA9UbxJZYM9GAOoT/ZDdwgCLzDCso1g6XlMUJzh/yRBFJM0QYe3SyRRqdam7pEN
         KkLLmty4c8mI/XiqzOE7DVKysPy5ZOexmnkmbGnASkO13Dmjdr2TEPh1KFWV5z4uKpn4
         lDqiylRpLK/bEz5escG4DKi+hTrn/7O/PSgnJhqyb6hSgEo2i+gxJZEZNnvX1YG/nMwC
         /oMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LTkyAehf8YDMFLVUk7PThGVVorkKOg4GbKlGuTWT6o8=;
        b=PtHgbLSLYTU5lpAarR6e0I8uFr68naav7MsygxTMtmmmKu/v51u8hOIsC9rPR436Ix
         OIxEvE06K5rGLfgZAtysZVTjDOSchkPmVQW1QZzT+ov2whKnYcrdUKcl0sBwnxEWMkd+
         OBvzqRC3k0Zk/j2wSJPVlYqIBFM76rW+xZHZh/vu84fd4sMFQN/Kzjf1E6STJPSa28m9
         0DQvlcQF62mSyq1bjp0QwbujuZQri5ujgqi6X8Mw88LfP3IEPFpSPC9CF9sPs2N94uQG
         IM1TzdqQeXdtsGE01x5Jh0+SaCBWIyB6hP1PXL0baU2l1uWC7OesrL+hnOJgJtJGrwCm
         kuLA==
X-Gm-Message-State: AOAM533O9eiUnykFYMntwG4377Skp3KFa8XUzbE421cFNwkEkRmoWpHA
	NkNZLNjI+XCMynJzMXYgD3U=
X-Google-Smtp-Source: ABdhPJz7SSl1WNw82uGnS83f/NmIfznu+v4X9cIFsFGZ/Ztz/03ROqdl0+PxK4gVN3mVEjY8wMl3pA==
X-Received: by 2002:a1c:5f87:: with SMTP id t129mr4174601wmb.86.1624367428521;
        Tue, 22 Jun 2021 06:10:28 -0700 (PDT)
Received: from agape ([5.171.73.108])
        by smtp.gmail.com with ESMTPSA id x3sm2314112wmi.42.2021.06.22.06.10.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jun 2021 06:10:28 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 17/17] staging: rtl8723bs: remove item from TODO list
Date: Tue, 22 Jun 2021 15:10:01 +0200
Message-Id: <842b5ce0623be738d611d883433a8bf2aa895e90.1624367072.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1624367071.git.fabioaiuto83@gmail.com>
References: <cover.1624367071.git.fabioaiuto83@gmail.com>
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

